Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A163D410B
	for <llvm@lists.linux.dev>; Tue,  2 Jun 2026 10:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780394918; cv=none; b=BBXZ0fVCL+CshLuBgO5gtLWRTVSGAgTcfj1hS2Rj5ScR/b1nHEZw4SB8PSowa8p7xipahLAq4SREGul8QnhkM1w4QoWJI7JYkpmtY+1MtmXC/MHpF4+T7IR/Jq8ZpPuPYQWTr9UXtvMj+Wmf2frEaadS1LBr7nx8I7cFqUM41FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780394918; c=relaxed/simple;
	bh=70Y3B6na8KcxoKHEDLu7832oHkzg6EUUpxjD7Tww1sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qp5OvBhSfk+FbFTKh55VSy63ZQXOLHx5mp4mclz/Drr9QEu8Z16VV89Bw+z/HXWc9Z30xggaCcKYeXok2HdSg1LcCOYYJQLoT4EhMx1WvZxBObdBB3UzQQf7aCu5KmRiT8lVkSS6M/+028922rmOwjYouzcUaUFDAiiOL3XykHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iZLDkTMZ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iZLDkTMZ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99A6A2364;
	Tue,  2 Jun 2026 03:08:30 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6346C3F632;
	Tue,  2 Jun 2026 03:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780394915; bh=70Y3B6na8KcxoKHEDLu7832oHkzg6EUUpxjD7Tww1sw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iZLDkTMZWGW/slc2XoR8xfH0iuTICDUGDyKkQNG97r+U6tw+XQQAfkIKckfmEEERZ
	 IPyLPeZjCJ4IVZisGqOqjReeR1V6ORdC/qEQTKU1Wcc0ljqMmSD1p5d3Cak8KSp4Zj
	 1f+PgqKWVcvHnrS99nIl7bcxkCOznih4NeNjkl3c=
Date: Tue, 2 Jun 2026 11:08:30 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Qing Wang <wangqing7171@gmail.com>
Cc: peterz@infradead.org, mathieu.desnoyers@efficios.com,
	dvyukov@google.com, justinstitt@google.com,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	mingo@kernel.org, morbo@google.com, nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	syzbot+185a631927096f9da2fc@syzkaller.appspotmail.com,
	tglx@kernel.org
Subject: Re: [PATCH v2] rseq: fix using an uninitialized stack variable in
 rseq_exit_user_update
Message-ID: <ah6rnmm1ZpGRbOIR@J2N7QTR9R3>
References: <20260601143934.GT3493090@noisy.programming.kicks-ass.net>
 <20260602030854.574038-1-wangqing7171@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602030854.574038-1-wangqing7171@gmail.com>

On Tue, Jun 02, 2026 at 11:08:54AM +0800, Qing Wang wrote:
> There is an bug which is an uninitialized stack variable use in
> `rseq_exit_user_update()` reported by syzbot:
> 
> BUG: KMSAN: kernel-infoleak in rseq_set_ids_get_csaddr include/linux/rseq_entry.h:502 [inline]
> 
> The local variable:
> ```c
> 	struct rseq_ids ids = {
> 		.cpu_id	 = task_cpu(t),
> 		.mm_cid	 = task_mm_cid(t),
> 		.node_id = cpu_to_node(ids.cpu_id),
> 	};
> ```
> According to the C standard, the evaluation order of expressions in an
> initializer list is indeterminately sequenced. The compiler (Clang, in this
> KMSAN build) evaluates `cpu_to_node(ids.cpu_id)` *before* `ids.cpu_id` is
> initialized with `task_cpu(t)`.
> 
> This is fixed by moving the assignment of ids.node_id outside the structure
> initialization.
> 
> Reported-by: syzbot+185a631927096f9da2fc@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=185a631927096f9da2fc
> Fixes: 82f572449cfe ("rseq: Implement read only ABI enforcement for optimized RSEQ V2 mode")
> Signed-off-by: Qing Wang <wangqing7171@gmail.com>

FWIW, this looks sane to me, so:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  include/linux/rseq_entry.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/rseq_entry.h b/include/linux/rseq_entry.h
> index 63bc72086e75..ed9da6e41a2a 100644
> --- a/include/linux/rseq_entry.h
> +++ b/include/linux/rseq_entry.h
> @@ -635,10 +635,11 @@ static __always_inline bool rseq_exit_user_update(struct pt_regs *regs, struct t
>  		return true;
>  	}
>  
> +	int cpu = task_cpu(t);
>  	struct rseq_ids ids = {
> -		.cpu_id	 = task_cpu(t),
> +		.cpu_id	 = cpu,
>  		.mm_cid	 = task_mm_cid(t),
> -		.node_id = cpu_to_node(ids.cpu_id),
> +		.node_id = cpu_to_node(cpu),
>  	};
>  
>  	return rseq_update_usr(t, regs, &ids);
> -- 
> 2.34.1
> 
