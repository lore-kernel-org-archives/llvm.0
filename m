Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E286200A3;
	Sun, 11 Aug 2024 07:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723360148; cv=none; b=niw504V0OCIWJmmhENbnv/X3vRYk4Qo/INU4tWMNviGggIpfBZSSRlLCCQeGcPukNM3of+pdAm5VDO7S9+Zxpa4ILQakSCvXzNGbvQzXasYSAegcM3GT4geLSOjU1ubRWC3IcPPA+ZCXZESdByRnNCHJISAO1RAOoy6I3OFf8yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723360148; c=relaxed/simple;
	bh=HzUn46edg0BlXhUZG0jfiBG5N65tmpo0nKxL2EGqm8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UDq4FAdSMi/nudAyJBYUUDbrPc/G2rzFeigMOUvSYBLbH2NFJJKCAuQ1pLygfjvrW3B5qeyjvAJzlAYF0diENpICWm5LbqW8pkc4SQua34a+NzVdQT+gcPU/pj3Fds17G1sPqJEXX6T4BoOl4Mizpq1HH8I6Ky8rvKDxv7RcS1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HnNS/Pp9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HnNS/Pp9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C5D0C4AF0C;
	Sun, 11 Aug 2024 07:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723360147;
	bh=HzUn46edg0BlXhUZG0jfiBG5N65tmpo0nKxL2EGqm8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HnNS/Pp9HIymhgFSOgcObB4Q/EjwnCSKaXwbmVW+C7wegY7oidb0Ze1LRWk+6upl9
	 PYboGeq3l1vsj3vfjD4KSqmNDuFBAduw+esO+dzvOxiFHthXsZqx04CZyAUpQc/VwJ
	 kgN0kmuW1riZ97c9mzj5ZGH3LGZ25QxJFvQRJ6QlYM0TLZBHe4ZAkO1sxDDvckpmGZ
	 L+iJ0fQoeAi5vjzPeX2V75i4/tkXTsGBwP9lIPZ2P/4t2p48FOZColc+e3nFoLcLa0
	 9z5kynvHCxIQ75t6wFusdgLpH08xeU+SBCwepQfFaIFeTq1xWUO94A+vKRSrfL2q6H
	 UYngiEgA8lrSA==
Date: Sun, 11 Aug 2024 12:38:59 +0530
From: Neeraj Upadhyay <Neeraj.Upadhyay@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>
Subject: Re: [linux-next:master 3246/3984] kernel/rcu/rcuscale.c:303:2:
 error: call to undeclared function 'rcu_tasks_torture_stats_print'; ISO C99
 and later do not support implicit function declarations
Message-ID: <20240811070859.GA977168@neeraj.linux>
References: <202408110343.A2yLpRdP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202408110343.A2yLpRdP-lkp@intel.com>

On Sun, Aug 11, 2024 at 03:55:37AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   61c01d2e181adfba02fe09764f9fca1de2be0dbe
> commit: 628ea78b8d1057d4709b38730a1f181e9607ad23 [3246/3984] rcuscale: Print detailed grace-period and barrier diagnostics
> config: x86_64-randconfig-074-20240809 (https://download.01.org/0day-ci/archive/20240811/202408110343.A2yLpRdP-lkp@intel.com/config)
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408110343.A2yLpRdP-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408110343.A2yLpRdP-lkp@intel.com/
> 
> Note: the linux-next/master HEAD 61c01d2e181adfba02fe09764f9fca1de2be0dbe builds fine.
>       It may have been fixed somewhere.
> 

Thanks for reporting this! I have fixed the order of below 2 commits here
[1]

cb4b877e9d5f rcu/tasks: Add detailed grace-period and barrier diagnostics
d9562675f501 rcuscale: Print detailed grace-period and barrier diagnostics

[1] https://git.kernel.org/pub/scm/linux/kernel/git/rcu/linux.git/log/?h=next


- Neeraj

> All errors (new ones prefixed by >>):
> 
> >> kernel/rcu/rcuscale.c:303:2: error: call to undeclared function 'rcu_tasks_torture_stats_print'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      303 |         rcu_tasks_torture_stats_print(scale_type, SCALE_FLAG);
>          |         ^
>    kernel/rcu/rcuscale.c:303:2: note: did you mean 'srcu_torture_stats_print'?
>    include/linux/srcutree.h:192:6: note: 'srcu_torture_stats_print' declared here
>      192 | void srcu_torture_stats_print(struct srcu_struct *ssp, char *tt, char *tf);
>          |      ^
> >> kernel/rcu/rcuscale.c:347:2: error: call to undeclared function 'rcu_tasks_rude_torture_stats_print'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      347 |         rcu_tasks_rude_torture_stats_print(scale_type, SCALE_FLAG);
>          |         ^
> >> kernel/rcu/rcuscale.c:393:2: error: call to undeclared function 'rcu_tasks_trace_torture_stats_print'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      393 |         rcu_tasks_trace_torture_stats_print(scale_type, SCALE_FLAG);
>          |         ^
>    3 errors generated.
> 
> 
> vim +/rcu_tasks_torture_stats_print +303 kernel/rcu/rcuscale.c
> 
>    300	
>    301	static void rcu_tasks_scale_stats(void)
>    302	{
>  > 303		rcu_tasks_torture_stats_print(scale_type, SCALE_FLAG);
>    304	}
>    305	
>    306	static struct rcu_scale_ops tasks_ops = {
>    307		.ptype		= RCU_TASKS_FLAVOR,
>    308		.init		= rcu_sync_scale_init,
>    309		.readlock	= tasks_scale_read_lock,
>    310		.readunlock	= tasks_scale_read_unlock,
>    311		.get_gp_seq	= rcu_no_completed,
>    312		.gp_diff	= rcu_seq_diff,
>    313		.async		= call_rcu_tasks,
>    314		.gp_barrier	= rcu_barrier_tasks,
>    315		.sync		= synchronize_rcu_tasks,
>    316		.exp_sync	= synchronize_rcu_tasks,
>    317		.rso_gp_kthread	= get_rcu_tasks_gp_kthread,
>    318		.stats		= IS_ENABLED(CONFIG_TINY_RCU) ? NULL : rcu_tasks_scale_stats,
>    319		.name		= "tasks"
>    320	};
>    321	
>    322	#define TASKS_OPS &tasks_ops,
>    323	
>    324	#else // #ifdef CONFIG_TASKS_RCU
>    325	
>    326	#define TASKS_OPS
>    327	
>    328	#endif // #else // #ifdef CONFIG_TASKS_RCU
>    329	
>    330	#ifdef CONFIG_TASKS_RUDE_RCU
>    331	
>    332	/*
>    333	 * Definitions for RCU-tasks-rude scalability testing.
>    334	 */
>    335	
>    336	static int tasks_rude_scale_read_lock(void)
>    337	{
>    338		return 0;
>    339	}
>    340	
>    341	static void tasks_rude_scale_read_unlock(int idx)
>    342	{
>    343	}
>    344	
>    345	static void rcu_tasks_rude_scale_stats(void)
>    346	{
>  > 347		rcu_tasks_rude_torture_stats_print(scale_type, SCALE_FLAG);
>    348	}
>    349	
>    350	static struct rcu_scale_ops tasks_rude_ops = {
>    351		.ptype		= RCU_TASKS_RUDE_FLAVOR,
>    352		.init		= rcu_sync_scale_init,
>    353		.readlock	= tasks_rude_scale_read_lock,
>    354		.readunlock	= tasks_rude_scale_read_unlock,
>    355		.get_gp_seq	= rcu_no_completed,
>    356		.gp_diff	= rcu_seq_diff,
>    357		.async		= call_rcu_tasks_rude,
>    358		.gp_barrier	= rcu_barrier_tasks_rude,
>    359		.sync		= synchronize_rcu_tasks_rude,
>    360		.exp_sync	= synchronize_rcu_tasks_rude,
>    361		.rso_gp_kthread	= get_rcu_tasks_rude_gp_kthread,
>    362		.stats		= IS_ENABLED(CONFIG_TINY_RCU) ? NULL : rcu_tasks_rude_scale_stats,
>    363		.name		= "tasks-rude"
>    364	};
>    365	
>    366	#define TASKS_RUDE_OPS &tasks_rude_ops,
>    367	
>    368	#else // #ifdef CONFIG_TASKS_RUDE_RCU
>    369	
>    370	#define TASKS_RUDE_OPS
>    371	
>    372	#endif // #else // #ifdef CONFIG_TASKS_RUDE_RCU
>    373	
>    374	#ifdef CONFIG_TASKS_TRACE_RCU
>    375	
>    376	/*
>    377	 * Definitions for RCU-tasks-trace scalability testing.
>    378	 */
>    379	
>    380	static int tasks_trace_scale_read_lock(void)
>    381	{
>    382		rcu_read_lock_trace();
>    383		return 0;
>    384	}
>    385	
>    386	static void tasks_trace_scale_read_unlock(int idx)
>    387	{
>    388		rcu_read_unlock_trace();
>    389	}
>    390	
>    391	static void rcu_tasks_trace_scale_stats(void)
>    392	{
>  > 393		rcu_tasks_trace_torture_stats_print(scale_type, SCALE_FLAG);
>    394	}
>    395	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
