Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9E5247291;
	Fri, 31 Oct 2025 14:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761920356; cv=none; b=YeOrUs96gC02bAlyronn6Gd9Zflzjhc8g4X49SKTcsGxQeRS0uHuJnGAMS7YEIGsb4BwI/dFMtpeFpMCELTBa5KylO+CFf8eKP8shK6axbFzqxy7bkuRhO7ME6E1U9Td9+v6Ec1YXCWEEpVAVPPEYZ+4P6En+rXxkx/cnDyQOYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761920356; c=relaxed/simple;
	bh=GT8BQzzXdxZQjK5gGfJj1bJQw4LEzlbjCpjUbtBUqIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=atnYW1VTtMRjmtZ/ldksqJixuWzAAFb0BpZXrdv/Rlu1+/0fDov4m3Q03czo0IvVoWrFUq7FDy6HSR0+9DSxIFNblvLIlcwk319/WqGsDWGL3+UWXrSo3Bd2bJbocpy0VOYmPSFGQkAUAJiigujAp90ZXrEP/1tBQskVIpvvpMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dCQp35QH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dCQp35QH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 183B4C4CEE7;
	Fri, 31 Oct 2025 14:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761920355;
	bh=GT8BQzzXdxZQjK5gGfJj1bJQw4LEzlbjCpjUbtBUqIM=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=dCQp35QHei/tCg3WdiuSwYT93SURwSTtzHw5feRStze4+QT09i+3MWHlFW8h0urgT
	 p9ABeAoAb6Ofj2yjMJdJOmkr8e/Z3FKmIMKtU0O4NcSBRNKjgTq1pIvz/vFmrmi0DM
	 Wa460D6KZrAVchmyPHKuM4+9a6jPz0SV66m7XXMbM4TaNxl+HgQzne9HkTE27xnp5p
	 4UgP6wujP9OtfysNq6oE0EbEI2pDPiSGLutLzuRRWfMmGKpvCdxOc+Uz3HTRVTTlCx
	 X0dGrjsM8rRiszmWGH/4ILhxr7GZLBVog2kUhzO7AWgbLmMAbb4BhPHkE4sCA29QOH
	 2Ru66FU7dzwig==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 86830CE0A4E; Fri, 31 Oct 2025 07:19:14 -0700 (PDT)
Date: Fri, 31 Oct 2025 07:19:14 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:next.2025.10.30c 17/43]
 kernel/rcu/rcutorture.c:1139:17: error: use of undeclared identifier
 'rcu_tasks_trace_expedite_current'; did you mean
 'srcu_torture_expedite_current'?
Message-ID: <0d009875-865f-473b-bbda-e0ba06dcfc74@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202510311200.9qgdI1m8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202510311200.9qgdI1m8-lkp@intel.com>

On Fri, Oct 31, 2025 at 12:46:53PM +0800, kernel test robot wrote:
> tree:   https://github.com/paulmckrcu/linux next.2025.10.30c
> head:   1eee41590d30805ec4f5b4e96c615603b0d058d9
> commit: f7cd407d56a0baf6fc9fe3e093253f6e30d61a95 [17/43] rcutorture: Test rcu_tasks_trace_expedite_current()
> config: s390-randconfig-001-20251031 (https://download.01.org/0day-ci/archive/20251031/202510311200.9qgdI1m8-lkp@intel.com/config)
> compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510311200.9qgdI1m8-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510311200.9qgdI1m8-lkp@intel.com/
> 
> Note: the paulmckrcu/next.2025.10.30c HEAD 1eee41590d30805ec4f5b4e96c615603b0d058d9 builds fine.
>       It only hurts bisectability.
> 
> All errors (new ones prefixed by >>):
> 
> >> kernel/rcu/rcutorture.c:1139:17: error: use of undeclared identifier 'rcu_tasks_trace_expedite_current'; did you mean 'srcu_torture_expedite_current'?
>            .exp_current    = rcu_tasks_trace_expedite_current,
>                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>                              srcu_torture_expedite_current
>    kernel/rcu/rcutorture.c:861:13: note: 'srcu_torture_expedite_current' declared here
>    static void srcu_torture_expedite_current(void)
>                ^
>    1 error generated.

I blew the rebase, and need to move a commit.  Thank you for your testing
efforts!

							Thanx, Paul

> vim +1139 kernel/rcu/rcutorture.c
> 
>   1127	
>   1128	static struct rcu_torture_ops tasks_tracing_ops = {
>   1129		.ttype		= RCU_TASKS_TRACING_FLAVOR,
>   1130		.init		= rcu_sync_torture_init,
>   1131		.readlock	= tasks_tracing_torture_read_lock,
>   1132		.read_delay	= srcu_read_delay,  /* just reuse srcu's version. */
>   1133		.readunlock	= tasks_tracing_torture_read_unlock,
>   1134		.readlock_held	= rcu_read_lock_trace_held,
>   1135		.get_gp_seq	= rcu_no_completed,
>   1136		.deferred_free	= rcu_tasks_tracing_torture_deferred_free,
>   1137		.sync		= synchronize_rcu_tasks_trace,
>   1138		.exp_sync	= synchronize_rcu_tasks_trace,
> > 1139		.exp_current	= rcu_tasks_trace_expedite_current,
>   1140		.call		= call_rcu_tasks_trace,
>   1141		.cb_barrier	= rcu_barrier_tasks_trace,
>   1142		.gp_kthread_dbg	= show_rcu_tasks_trace_gp_kthread,
>   1143		.get_gp_data    = rcu_tasks_trace_get_gp_data,
>   1144		.cbflood_max	= 50000,
>   1145		.irq_capable	= 1,
>   1146		.slow_gps	= 1,
>   1147		.name		= "tasks-tracing"
>   1148	};
>   1149	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
