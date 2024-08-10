Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E32107A0;
	Sat, 10 Aug 2024 19:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723319801; cv=none; b=QTZGXmJXyhtP4yUNCT8Os7pLXzhwlBBPTsGqZD7AmecTKQTXTXsxNapv4SUfjmSMRKJYnZ4MrYxYeaR85gmTTemIwjUhKmBc3Eo2JayD0Yt9VV2FEAjjJV5iTpIMJfg4BllE6oh0AebaMVY1rDwKKHadHoDupV6iVmvHV0oP+lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723319801; c=relaxed/simple;
	bh=hjf0zaaue5hnkX6kGEqoO30G79ZAJaRPHHNuZaq2Mks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JRFj+ddgbflWehYP6zLzhcV4pL3ghHuuTCF5DOpMSsBPnDW5TFBejgSAWOnuYdvdm/F9MtE3ZsRZoRH2sK4gb++yfxYxSzFm7VNoODJqn+ed1S0kv4ehaaD2Y3kwV4yfGwQWUeLzZmjxxURtPr3x8sbUWt2LSosvopSFjemqXJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=leY7d8/+; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="leY7d8/+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723319800; x=1754855800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hjf0zaaue5hnkX6kGEqoO30G79ZAJaRPHHNuZaq2Mks=;
  b=leY7d8/+/RBCW4HkHPZzRNlGWFM95/i8PW9BdvuVj/EZQYG7oaxIMZOT
   JFUN1iu9YCrPqXOWzDXXupeRCU20zquG6A7elOeGbjckvlkrYyWqf8b+C
   4e5+D2sIzeTFuSV8Em7KM2puUG3rIZavTh9AC2OwYWyRwFgLP0wifsMbZ
   3TFKk+GIBYgLpOT8okpGaSjAcwTkH2KyYOFv3Sw6MeBoCe3pHBXlRFnoY
   AfwSjQeye6nssreG1XP7x1KWenlCGtklG6zM3KystSP8FjlkQ9U5AELlz
   tCrwKP0LfMGDcr19YwW7Xe4zZG2BJ5Y4DCNgaIthbdXuT0A2/m5NbC4M1
   g==;
X-CSE-ConnectionGUID: LBsDrAAVQMaWp+AJ71pUFg==
X-CSE-MsgGUID: kePSrvDVSKqLLSE1uL1+rQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="21623916"
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; 
   d="scan'208";a="21623916"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 12:56:39 -0700
X-CSE-ConnectionGUID: N5yViwjpTKKqRYTbCxPpDw==
X-CSE-MsgGUID: OQ1nreOeQgK48Ft6DZr9Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; 
   d="scan'208";a="62812222"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 10 Aug 2024 12:56:37 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scsCY-000AFJ-1k;
	Sat, 10 Aug 2024 19:56:34 +0000
Date: Sun, 11 Aug 2024 03:55:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>
Subject: [linux-next:master 3246/3984] kernel/rcu/rcuscale.c:303:2: error:
 call to undeclared function 'rcu_tasks_torture_stats_print'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202408110343.A2yLpRdP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   61c01d2e181adfba02fe09764f9fca1de2be0dbe
commit: 628ea78b8d1057d4709b38730a1f181e9607ad23 [3246/3984] rcuscale: Print detailed grace-period and barrier diagnostics
config: x86_64-randconfig-074-20240809 (https://download.01.org/0day-ci/archive/20240811/202408110343.A2yLpRdP-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408110343.A2yLpRdP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408110343.A2yLpRdP-lkp@intel.com/

Note: the linux-next/master HEAD 61c01d2e181adfba02fe09764f9fca1de2be0dbe builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> kernel/rcu/rcuscale.c:303:2: error: call to undeclared function 'rcu_tasks_torture_stats_print'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     303 |         rcu_tasks_torture_stats_print(scale_type, SCALE_FLAG);
         |         ^
   kernel/rcu/rcuscale.c:303:2: note: did you mean 'srcu_torture_stats_print'?
   include/linux/srcutree.h:192:6: note: 'srcu_torture_stats_print' declared here
     192 | void srcu_torture_stats_print(struct srcu_struct *ssp, char *tt, char *tf);
         |      ^
>> kernel/rcu/rcuscale.c:347:2: error: call to undeclared function 'rcu_tasks_rude_torture_stats_print'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     347 |         rcu_tasks_rude_torture_stats_print(scale_type, SCALE_FLAG);
         |         ^
>> kernel/rcu/rcuscale.c:393:2: error: call to undeclared function 'rcu_tasks_trace_torture_stats_print'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     393 |         rcu_tasks_trace_torture_stats_print(scale_type, SCALE_FLAG);
         |         ^
   3 errors generated.


vim +/rcu_tasks_torture_stats_print +303 kernel/rcu/rcuscale.c

   300	
   301	static void rcu_tasks_scale_stats(void)
   302	{
 > 303		rcu_tasks_torture_stats_print(scale_type, SCALE_FLAG);
   304	}
   305	
   306	static struct rcu_scale_ops tasks_ops = {
   307		.ptype		= RCU_TASKS_FLAVOR,
   308		.init		= rcu_sync_scale_init,
   309		.readlock	= tasks_scale_read_lock,
   310		.readunlock	= tasks_scale_read_unlock,
   311		.get_gp_seq	= rcu_no_completed,
   312		.gp_diff	= rcu_seq_diff,
   313		.async		= call_rcu_tasks,
   314		.gp_barrier	= rcu_barrier_tasks,
   315		.sync		= synchronize_rcu_tasks,
   316		.exp_sync	= synchronize_rcu_tasks,
   317		.rso_gp_kthread	= get_rcu_tasks_gp_kthread,
   318		.stats		= IS_ENABLED(CONFIG_TINY_RCU) ? NULL : rcu_tasks_scale_stats,
   319		.name		= "tasks"
   320	};
   321	
   322	#define TASKS_OPS &tasks_ops,
   323	
   324	#else // #ifdef CONFIG_TASKS_RCU
   325	
   326	#define TASKS_OPS
   327	
   328	#endif // #else // #ifdef CONFIG_TASKS_RCU
   329	
   330	#ifdef CONFIG_TASKS_RUDE_RCU
   331	
   332	/*
   333	 * Definitions for RCU-tasks-rude scalability testing.
   334	 */
   335	
   336	static int tasks_rude_scale_read_lock(void)
   337	{
   338		return 0;
   339	}
   340	
   341	static void tasks_rude_scale_read_unlock(int idx)
   342	{
   343	}
   344	
   345	static void rcu_tasks_rude_scale_stats(void)
   346	{
 > 347		rcu_tasks_rude_torture_stats_print(scale_type, SCALE_FLAG);
   348	}
   349	
   350	static struct rcu_scale_ops tasks_rude_ops = {
   351		.ptype		= RCU_TASKS_RUDE_FLAVOR,
   352		.init		= rcu_sync_scale_init,
   353		.readlock	= tasks_rude_scale_read_lock,
   354		.readunlock	= tasks_rude_scale_read_unlock,
   355		.get_gp_seq	= rcu_no_completed,
   356		.gp_diff	= rcu_seq_diff,
   357		.async		= call_rcu_tasks_rude,
   358		.gp_barrier	= rcu_barrier_tasks_rude,
   359		.sync		= synchronize_rcu_tasks_rude,
   360		.exp_sync	= synchronize_rcu_tasks_rude,
   361		.rso_gp_kthread	= get_rcu_tasks_rude_gp_kthread,
   362		.stats		= IS_ENABLED(CONFIG_TINY_RCU) ? NULL : rcu_tasks_rude_scale_stats,
   363		.name		= "tasks-rude"
   364	};
   365	
   366	#define TASKS_RUDE_OPS &tasks_rude_ops,
   367	
   368	#else // #ifdef CONFIG_TASKS_RUDE_RCU
   369	
   370	#define TASKS_RUDE_OPS
   371	
   372	#endif // #else // #ifdef CONFIG_TASKS_RUDE_RCU
   373	
   374	#ifdef CONFIG_TASKS_TRACE_RCU
   375	
   376	/*
   377	 * Definitions for RCU-tasks-trace scalability testing.
   378	 */
   379	
   380	static int tasks_trace_scale_read_lock(void)
   381	{
   382		rcu_read_lock_trace();
   383		return 0;
   384	}
   385	
   386	static void tasks_trace_scale_read_unlock(int idx)
   387	{
   388		rcu_read_unlock_trace();
   389	}
   390	
   391	static void rcu_tasks_trace_scale_stats(void)
   392	{
 > 393		rcu_tasks_trace_torture_stats_print(scale_type, SCALE_FLAG);
   394	}
   395	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
