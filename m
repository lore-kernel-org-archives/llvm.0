Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2C13E5EEA;
	Tue, 29 Sep 2026 20:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790713647; cv=none; b=rslCguYi43AI2WMrzz9AIM48XG/D6cN2CArptOejjksTQzUzPMYOxN6yBpBQvW+sL10QDrUL6nsQTv73bo9m5yVNrRnMClT2gZbkrkqKm7kazMWuZnvMMGNAnLIhMw9G3xp24/u0Ryl9+tHRg9n2VD0unQwYXvMhvpRxRnZDJKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790713647; c=relaxed/simple;
	bh=9AMR53+K3Xz1+BpDSuv8HBe9X9W8XlefOazVDunJ2mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hdm3sdeyeWA1lJpU6ZWkxElmIU0RhzvsUc3Tr2UUYdgfonbxxFbwdIs1TdPzyQO5wBWWNnCvbFO1dmY6p/vKr7EsM07Y6IfOL7TU1J+MFtAm1Jz8IqqeJSzU/Abx+/SBWJUFkTU2nqSZtIdjYjYY0zbg0hrZIkj+yrHbXYalcew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=POUOMLAk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="POUOMLAk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3E271F00893;
	Tue, 29 Sep 2026 20:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790713646;
	bh=KhR9eVL1Yfk1xYivdm7Kv/gIzzDGonvoWGOOfE2r76E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=POUOMLAkEcY0sO7ol1TOOhKq3S/gDFI7NU/OQjd25P3JoNNNC9kKVEq4SOo690szz
	 2TbJDF5tH5lYtAvzbh8+oP2FNx2znxADNNSwfd4pAKl3Jrq6CVLT/L8RHN5TZ4i18w
	 GKUltf3FDeqMvjYJFs073UASGTQQFB/0DolcBCtjg4/Ts7eB+9cnomFya8cX58CoX5
	 rpOjifdLPL8r0geeRoMC5NnMsaTR9p/qAjj77LaESVY7oQxHqlHLuwQ/raFrvMagGQ
	 BR2Y45ZDoGypHnEt9dcUNishNz5YNc746gse5/tIP74mKSdC9Ms77Dyom1yVTWWLWv
	 1+IuvXBbtDoyQ==
Date: Tue, 29 Sep 2026 22:27:20 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org,
	llvm@lists.linux.dev, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, tglx@kernel.org, yury.norov@gmail.com,
	kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
	rostedt@goodmis.org, dietmar.eggemann@arm.com, elver@google.com
Subject: Re: [PATCH] sched/core: Fix context analysis errors in non-preferred
 CPU push
Message-ID: <20260929202720.GC3237201@ax162>
References: <20260929164712.1054883-1-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929164712.1054883-1-sshegde@linux.ibm.com>

On Tue, Sep 29, 2026 at 10:17:12PM +0530, Shrikanth Hegde wrote:
> Nathan reported build failure with clang23 when CONFIG_PREFERRED_CPU=y.
> 
>   kernel/sched/core.c:11298:3: error: releasing raw_spinlock 'rq_lockp(rq)' that was not held [-Werror,-Wthread-safety-analysis]
>    11298 |                 rq_unlock(rq, &rf);
>          |                 ^
>   kernel/sched/core.c:11303:1: error: raw_spinlock 'rq_lockp(__this_rq())' is not held on every path through here [-Werror,-Wthread-safety-analysis]
> 
> context_unsafe_alias(rq) was placed after rq_lock(), by which point it had
> already associated the lock with the original rq alias.
> 
> Move the alias barrier before rq_lock() so that the changing rq alias is
> accounted for before acquiring the lock.
> 
> Fixes: 74699f56ebcf ("sched/core: Push current task from non preferred CPU")
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Closes: https://lore.kernel.org/all/20260929121838.GA1814129@ax162/
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>

Tested-by: Nathan Chancellor <nathan@kernel.org> # build

Thanks for the quick fix!

> ---
> base commit: tip/sched/core
> 1fb28c664a19 ("virt/steal_governor: Enable the driver")
> 
>  kernel/sched/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 0bb86a43a592..23677d76f9d2 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -11283,10 +11283,10 @@ static int sched_non_preferred_cpu_push_stop(void *arg)
>  		 * safely bail out.
>  		 */
>  		cpu = select_fallback_rq(rq->cpu, p);
> +		context_unsafe_alias(rq);
>  		rq_lock(rq, &rf);
>  		rq->npc_push_work_pending = false;
>  		update_rq_clock(rq);
> -		context_unsafe_alias(rq);
>  
>  		if (task_rq(p) == rq && task_on_rq_queued(p)) {
>  			struct rq *dest_rq = __migrate_task(rq, &rf, p, cpu);
> -- 
> 2.52.0
> 

-- 
Cheers,
Nathan
