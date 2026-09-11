Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FB247A87C;
	Fri, 11 Sep 2026 17:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789146635; cv=none; b=nwmcAO6W+vBjFye9ZaILx+XVS7IgvcH5Qlc0QgyKvVEVn5OwF/Gff3gjQZwwsXQgSBmX058qj/fCvANhzzP+vptZ7AT3UqO4j3tBXeIwuyoDr6TACPLHDWvCfHmfQrsYnrfLyF+76aJCE6CaoQyzdMvqLOPmqoHd3WV6IdRvnhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789146635; c=relaxed/simple;
	bh=3k91Zqt2eqYWySUfIna8DwbrYNJWFGI0znm7i+mw/X0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YBbSDTnpCkNae047Lb2rpQl6v3HkYj2kx68Qf6oGp7jW/H2YIlkpMlNBIx+JUigJd11a2oT859RJyHowQ4GdiuM1RUzDR4oPwKuXOSwh2+d7coDGcPFiCYO8IoZDmrUZuMqZO9vTtys7UyyAu7BYf3f0qv6EOnPWGGrhrFre43k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PG3Y16fr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PG3Y16fr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 827101F000FF;
	Fri, 11 Sep 2026 17:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789146633;
	bh=1HTCELUy493iSlQt63EmEKqrhXk7rrP66xQ3dVMR4vs=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=PG3Y16frB0L1z/XkJuGi3P7DH/JdYjk+I1KNwpiYOkhby2s0LUsdQkLWb8ukoyzKG
	 mnaDISAZvOFCmojimAswTU8YS3K/VFrnPVIii4P4yqJMkekNjUJHaGyIL2TcAXzQS1
	 AemxLwhNnU80FWe5uGbRDafuMFTPH6peK5iICEbHar8GvU0sHe//GhEriofk5SX8tK
	 UzkcIx/KvsoR+gZGO1/mh0tx7WfvOwk68NpFxAQla0b2kY+FRk6zt0Px+DeofQ1HIC
	 ApudwQ+yITQ4wRxJ0f0PvUs0dUVdJTpWUoXDjeli0kKAVsdppC9Md2TQlq/bHMSL/I
	 SM2u9uTVPdDFw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 47442CE1902; Fri, 11 Sep 2026 10:10:33 -0700 (PDT)
Date: Fri, 11 Sep 2026 10:10:33 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev.2026.09.09a 42/56]
 kernel/rcu/tree_stall.h:332:48: warning: comparison between pointer and
 integer ('int' and 'struct task_struct *')
Message-ID: <33878fc2-3ccb-452f-8c94-e64f588a2160@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202609120047.u7Af769s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609120047.u7Af769s-lkp@intel.com>

On Sat, Sep 12, 2026 at 12:28:38AM +0800, kernel test robot wrote:
> tree:   https://github.com/paulmckrcu/linux dev.2026.09.09a
> head:   d61d9b5dd56c6cf72b70bb5fb52b213ead9f7765
> commit: e33488c41be623f7c7ef5b8763e20c45f1364d1c [42/56] rcu: Add running and boosted indications to RCU task stall dump
> config: powerpc-tqm8xx_defconfig (https://download.01.org/0day-ci/archive/20260912/202609120047.u7Af769s-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609120047.u7Af769s-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609120047.u7Af769s-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from kernel/rcu/tree.c:5112:
>    kernel/rcu/tree_stall.h:332:8: error: call to undeclared function 'rt_mutex_owner'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      332 |                         if (rt_mutex_owner(&rnp->boost_mtx.rtmutex) == t)
>          |                             ^
> >> kernel/rcu/tree_stall.h:332:48: warning: comparison between pointer and integer ('int' and 'struct task_struct *') [-Wpointer-integer-compare]
>      332 |                         if (rt_mutex_owner(&rnp->boost_mtx.rtmutex) == t)
>          |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~
>    In file included from kernel/rcu/tree.c:5115:
>    In file included from kernel/rcu/tree_plugin.h:14:
>    kernel/rcu/../locking/rtmutex_common.h:231:35: error: conflicting types for 'rt_mutex_owner'
>      231 | static inline struct task_struct *rt_mutex_owner(struct rt_mutex_base *lock)
>          |                                   ^
>    kernel/rcu/tree_stall.h:332:8: note: previous implicit declaration is here
>      332 |                         if (rt_mutex_owner(&rnp->boost_mtx.rtmutex) == t)
>          |                             ^
>    1 warning and 2 errors generated.

Good catch, updating this patch with attribution to #include rtmutex.h.

Thank you for your testing efforts!

							Thanx, Paul

> vim +332 kernel/rcu/tree_stall.h
> 
>    311	
>    312	/*
>    313	 * Report out the state of a not-running task that is stalling the
>    314	 * current RCU grace period.
>    315	 */
>    316	static int check_slow_task(struct task_struct *t, void *arg)
>    317	{
>    318		struct rcu_node *rnp;
>    319		struct rcu_stall_chk_rdr *rscrp = arg;
>    320	
>    321		if (task_curr(t))
>    322			return -EBUSY; // It is running, so decline to inspect it.
>    323		rscrp->nesting = t->rcu_read_lock_nesting;
>    324		rscrp->rs = t->rcu_read_unlock_special;
>    325		rscrp->on_blkd_list = !list_empty(&t->rcu_node_entry);
>    326		rscrp->rcu_rdr_running = task_curr(t);
>    327		rscrp->rcu_rdr_boosted = 0;
>    328		if (rscrp->on_blkd_list) {
>    329			rnp = READ_ONCE(t->rcu_blocked_node);
>    330			raw_spin_lock_rcu_node(rnp); /* irqs already disabled. */
>    331			if (rnp == READ_ONCE(t->rcu_blocked_node)) {
>  > 332				if (rt_mutex_owner(&rnp->boost_mtx.rtmutex) == t)
>    333					rscrp->rcu_rdr_boosted = 1;
>    334			} else {
>    335				rscrp->rcu_rdr_boosted = 2;
>    336			}
>    337			raw_spin_unlock_rcu_node(rnp); /* irqs remain disabled. */
>    338		}
>    339		return 0;
>    340	}
>    341	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
