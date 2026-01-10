Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB502A1CF;
	Sat, 10 Jan 2026 01:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768008847; cv=none; b=SSZdLqbGdDabJE7Wqlp79aWKGVZQlfMpd2cpPSyG9ttyHoqPPhE3WeHfqHQTHLRvu/97Je0qy98MdDBZrpULH42MzEHm5bAioCPWzICqYAOp910pbyWI8ZbfjoxbSwix45R1ne5zlScvkzx3R2mH5kyzCbfeB8BpPabQBJUQAdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768008847; c=relaxed/simple;
	bh=0EdQdIHUTfsnAmgWf//QkJu9Ck44ma08MFrI2UsEMfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VC9IQOpT0XufWdmsPNSSVzYabM+Ug7Hs4zjcD9zb0FCYCAS2ZpB96rsAdSTd++Ka1A3FvsCvz34eP2qUwHByJfz1MurOtyUlDv4sqVK8T+0vMb+9ZyZaUny5WaThEIwYKtznGPnp7FJzqxSRX3PiB12ra0B7gTSG3pdGy0FT0Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GjLGs4aS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GjLGs4aS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768008844; x=1799544844;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0EdQdIHUTfsnAmgWf//QkJu9Ck44ma08MFrI2UsEMfc=;
  b=GjLGs4aSpDEr2galOnD2jhnBIxZ0U5U0INla3/vAmohcfYpZ4/Mq8APJ
   W7JdH4eN4p2Xl9j9MULplC1SKugmkh8jaR42FYTORU1qZcSSorCAJ2QbH
   ePrGzylw6er3djPg1Xl6lVrxkPjuGRTCk6ElUF+22lkS/xWhqGPdwYJML
   9YQZy5T2EI9oCYDWHR+tPdjwdKuSSJ4/Sz47RhyqB5K6ZUOEPErvC8nQV
   35to9iGQbtNTypCMOf+g+Ji054hongnh7kg8dQUTMRswx4Jixwsr/cb3t
   OFxSHETnCsfMASonCzsSlAWQEqvoH82trCXIpEopI3vmfhzGkHI0njITI
   g==;
X-CSE-ConnectionGUID: phWUqpRzSFSmGWCiPCQooA==
X-CSE-MsgGUID: HVee1+uuRCqfMstDuLOA3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="68392334"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="68392334"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 17:34:04 -0800
X-CSE-ConnectionGUID: 3WHlcXEwRwiIpogEWWaw2A==
X-CSE-MsgGUID: KfsoVGbHS2eg4eiQSNtyDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="203517460"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Jan 2026 17:34:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veNrc-000000007vg-2lj3;
	Sat, 10 Jan 2026 01:34:00 +0000
Date: Sat, 10 Jan 2026 09:33:39 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 14/14] rcu: Remove checking of per-cpu blocked list
 against the node list
Message-ID: <202601100952.derSl9yA-lkp@intel.com>
References: <20260103002343.6599-15-joelagnelf@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260103002343.6599-15-joelagnelf@nvidia.com>

Hi Joel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da]

url:    https://github.com/intel-lab-lkp/linux/commits/Joel-Fernandes/rcu-Add-WARN_ON_ONCE-for-blocked-flag-invariant-in-exit_rcu/20260103-083616
base:   f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da
patch link:    https://lore.kernel.org/r/20260103002343.6599-15-joelagnelf%40nvidia.com
patch subject: [PATCH RFC 14/14] rcu: Remove checking of per-cpu blocked list against the node list
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260110/202601100952.derSl9yA-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601100952.derSl9yA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601100952.derSl9yA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/rcu/tree.c:1813:22: warning: unused variable 't_verify' [-Wunused-variable]
    1813 |         struct task_struct *t_verify;
         |                             ^~~~~~~~
>> kernel/rcu/tree.c:1814:6: warning: unused variable 'cpu_verify' [-Wunused-variable]
    1814 |         int cpu_verify;
         |             ^~~~~~~~~~
>> kernel/rcu/tree.c:1815:6: warning: unused variable 'rnp_count' [-Wunused-variable]
    1815 |         int rnp_count;
         |             ^~~~~~~~~
>> kernel/rcu/tree.c:1816:6: warning: unused variable 'rdp_total' [-Wunused-variable]
    1816 |         int rdp_total;
         |             ^~~~~~~~~
>> kernel/rcu/tree.c:1817:19: warning: unused variable 'rdp_cpu' [-Wunused-variable]
    1817 |         struct rcu_data *rdp_cpu;
         |                          ^~~~~~~
>> kernel/rcu/tree.c:1818:22: warning: unused variable 't_rdp' [-Wunused-variable]
    1818 |         struct task_struct *t_rdp;
         |                             ^~~~~
   6 warnings generated.


vim +/t_verify +1813 kernel/rcu/tree.c

988f569ae041cc kernel/rcu/tree.c Uladzislau Rezki (Sony  2024-03-08  1799) 
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  1800  /*
45fed3e7cfb400 kernel/rcu/tree.c Paul E. McKenney        2015-11-07  1801   * Initialize a new grace period.  Return false if no grace period required.
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  1802   */
f74126dcbcbffe kernel/rcu/tree.c Paul E. McKenney        2021-06-07  1803  static noinline_for_stack bool rcu_gp_init(void)
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  1804  {
ec2c29765a4ab1 kernel/rcu/tree.c Paul E. McKenney        2018-05-07  1805  	unsigned long flags;
0aa04b055e71bd kernel/rcu/tree.c Paul E. McKenney        2015-01-23  1806  	unsigned long oldmask;
ec2c29765a4ab1 kernel/rcu/tree.c Paul E. McKenney        2018-05-07  1807  	unsigned long mask;
b3dbec76e5334f kernel/rcutree.c  Paul E. McKenney        2012-06-18  1808  	struct rcu_data *rdp;
336a4f6c451e48 kernel/rcu/tree.c Paul E. McKenney        2018-07-03  1809  	struct rcu_node *rnp = rcu_get_root();
988f569ae041cc kernel/rcu/tree.c Uladzislau Rezki (Sony  2024-03-08  1810) 	bool start_new_poll;
4aa6e94cf90c0d kernel/rcu/tree.c Joel Fernandes          2025-03-24  1811  	unsigned long old_gp_seq;
4babf56e07e6c2 kernel/rcu/tree.c Joel Fernandes          2026-01-02  1812  #ifdef CONFIG_RCU_PER_CPU_BLOCKED_LISTS
4babf56e07e6c2 kernel/rcu/tree.c Joel Fernandes          2026-01-02 @1813  	struct task_struct *t_verify;
4babf56e07e6c2 kernel/rcu/tree.c Joel Fernandes          2026-01-02 @1814  	int cpu_verify;
4babf56e07e6c2 kernel/rcu/tree.c Joel Fernandes          2026-01-02 @1815  	int rnp_count;
4babf56e07e6c2 kernel/rcu/tree.c Joel Fernandes          2026-01-02 @1816  	int rdp_total;
4babf56e07e6c2 kernel/rcu/tree.c Joel Fernandes          2026-01-02 @1817  	struct rcu_data *rdp_cpu;
4babf56e07e6c2 kernel/rcu/tree.c Joel Fernandes          2026-01-02 @1818  	struct task_struct *t_rdp;
4babf56e07e6c2 kernel/rcu/tree.c Joel Fernandes          2026-01-02  1819  #endif
b3dbec76e5334f kernel/rcutree.c  Paul E. McKenney        2012-06-18  1820  
9cbc5b97029bff kernel/rcu/tree.c Paul E. McKenney        2018-07-05  1821  	WRITE_ONCE(rcu_state.gp_activity, jiffies);
2a67e741bbbc02 kernel/rcu/tree.c Peter Zijlstra          2015-10-08  1822  	raw_spin_lock_irq_rcu_node(rnp);
62bb24c4b022b9 kernel/rcu/tree.c Paul E. McKenney        2024-03-07  1823  	if (!rcu_state.gp_flags) {
f7be82093952ee kernel/rcutree.c  Paul E. McKenney        2013-08-08  1824  		/* Spurious wakeup, tell caller to go back to sleep.  */
67c583a7de3433 kernel/rcu/tree.c Boqun Feng              2015-12-29  1825  		raw_spin_unlock_irq_rcu_node(rnp);
45fed3e7cfb400 kernel/rcu/tree.c Paul E. McKenney        2015-11-07  1826  		return false;
f7be82093952ee kernel/rcutree.c  Paul E. McKenney        2013-08-08  1827  	}
9cbc5b97029bff kernel/rcu/tree.c Paul E. McKenney        2018-07-05  1828  	WRITE_ONCE(rcu_state.gp_flags, 0); /* Clear all flags: New GP. */
b3dbec76e5334f kernel/rcutree.c  Paul E. McKenney        2012-06-18  1829  
de8e87305a1ae8 kernel/rcu/tree.c Paul E. McKenney        2018-07-03  1830  	if (WARN_ON_ONCE(rcu_gp_in_progress())) {
f7be82093952ee kernel/rcutree.c  Paul E. McKenney        2013-08-08  1831  		/*
f7be82093952ee kernel/rcutree.c  Paul E. McKenney        2013-08-08  1832  		 * Grace period already in progress, don't start another.
f7be82093952ee kernel/rcutree.c  Paul E. McKenney        2013-08-08  1833  		 * Not supposed to be able to happen.
f7be82093952ee kernel/rcutree.c  Paul E. McKenney        2013-08-08  1834  		 */
67c583a7de3433 kernel/rcu/tree.c Boqun Feng              2015-12-29  1835  		raw_spin_unlock_irq_rcu_node(rnp);
45fed3e7cfb400 kernel/rcu/tree.c Paul E. McKenney        2015-11-07  1836  		return false;
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  1837  	}
b32e9eb6ad2957 kernel/rcutree.c  Paul E. McKenney        2009-11-12  1838  
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  1839  	/* Advance to a new grace period and initialize state. */
ad3832e974eba3 kernel/rcu/tree.c Paul E. McKenney        2018-07-03  1840  	record_gp_stall_check_time();
85aad7cc417877 kernel/rcu/tree.c Paul E. McKenney        2024-12-12  1841  	/*
85aad7cc417877 kernel/rcu/tree.c Paul E. McKenney        2024-12-12  1842  	 * A new wait segment must be started before gp_seq advanced, so
85aad7cc417877 kernel/rcu/tree.c Paul E. McKenney        2024-12-12  1843  	 * that previous gp waiters won't observe the new gp_seq.
85aad7cc417877 kernel/rcu/tree.c Paul E. McKenney        2024-12-12  1844  	 */
85aad7cc417877 kernel/rcu/tree.c Paul E. McKenney        2024-12-12  1845  	start_new_poll = rcu_sr_normal_gp_init();
ff3bb6f4d06247 kernel/rcu/tree.c Paul E. McKenney        2018-05-01  1846  	/* Record GP times before starting GP, hence rcu_seq_start(). */
4aa6e94cf90c0d kernel/rcu/tree.c Joel Fernandes          2025-03-24  1847  	old_gp_seq = rcu_state.gp_seq;
30a7806adab5f6 kernel/rcu/tree.c Joel Fernandes          2025-07-15  1848  	/*
30a7806adab5f6 kernel/rcu/tree.c Joel Fernandes          2025-07-15  1849  	 * Critical ordering: rcu_seq_start() must happen BEFORE the CPU hotplug
30a7806adab5f6 kernel/rcu/tree.c Joel Fernandes          2025-07-15  1850  	 * scan below. Otherwise we risk a race where a newly onlining CPU could
30a7806adab5f6 kernel/rcu/tree.c Joel Fernandes          2025-07-15  1851  	 * be missed by the current grace period, potentially leading to
30a7806adab5f6 kernel/rcu/tree.c Joel Fernandes          2025-07-15  1852  	 * use-after-free errors. For a detailed explanation of this race, see
30a7806adab5f6 kernel/rcu/tree.c Joel Fernandes          2025-07-15  1853  	 * Documentation/RCU/Design/Requirements/Requirements.rst in the
30a7806adab5f6 kernel/rcu/tree.c Joel Fernandes          2025-07-15  1854  	 * "Hotplug CPU" section.
186779c0364680 kernel/rcu/tree.c Joel Fernandes          2025-07-15  1855  	 *
186779c0364680 kernel/rcu/tree.c Joel Fernandes          2025-07-15  1856  	 * Also note that the root rnp's gp_seq is kept separate from, and lags,
186779c0364680 kernel/rcu/tree.c Joel Fernandes          2025-07-15  1857  	 * the rcu_state's gp_seq, for a reason. See the Quick-Quiz on
186779c0364680 kernel/rcu/tree.c Joel Fernandes          2025-07-15  1858  	 * Single-node systems for more details (in Data-Structures.rst).
30a7806adab5f6 kernel/rcu/tree.c Joel Fernandes          2025-07-15  1859  	 */
9cbc5b97029bff kernel/rcu/tree.c Paul E. McKenney        2018-07-05  1860  	rcu_seq_start(&rcu_state.gp_seq);
4aa6e94cf90c0d kernel/rcu/tree.c Joel Fernandes          2025-03-24  1861  	/* Ensure that rcu_seq_done_exact() guardband doesn't give false positives. */
4aa6e94cf90c0d kernel/rcu/tree.c Joel Fernandes          2025-03-24  1862  	WARN_ON_ONCE(IS_ENABLED(CONFIG_PROVE_RCU) &&
4aa6e94cf90c0d kernel/rcu/tree.c Joel Fernandes          2025-03-24  1863  		     rcu_seq_done_exact(&old_gp_seq, rcu_seq_snap(&rcu_state.gp_seq)));
4aa6e94cf90c0d kernel/rcu/tree.c Joel Fernandes          2025-03-24  1864  
62ae19511f1efb kernel/rcu/tree.c Paul E. McKenney        2020-03-21  1865  	ASSERT_EXCLUSIVE_WRITER(rcu_state.gp_seq);
9cbc5b97029bff kernel/rcu/tree.c Paul E. McKenney        2018-07-05  1866  	trace_rcu_grace_period(rcu_state.name, rcu_state.gp_seq, TPS("start"));
bf95b2bc3e42f1 kernel/rcu/tree.c Paul E. McKenney        2022-04-13  1867  	rcu_poll_gp_seq_start(&rcu_state.gp_seq_polled_snap);
67c583a7de3433 kernel/rcu/tree.c Boqun Feng              2015-12-29  1868  	raw_spin_unlock_irq_rcu_node(rnp);
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  1869  
988f569ae041cc kernel/rcu/tree.c Uladzislau Rezki (Sony  2024-03-08  1870) 	/*
988f569ae041cc kernel/rcu/tree.c Uladzislau Rezki (Sony  2024-03-08  1871) 	 * The "start_new_poll" is set to true, only when this GP is not able
988f569ae041cc kernel/rcu/tree.c Uladzislau Rezki (Sony  2024-03-08  1872) 	 * to handle anything and there are outstanding users. It happens when
988f569ae041cc kernel/rcu/tree.c Uladzislau Rezki (Sony  2024-03-08  1873) 	 * the rcu_sr_normal_gp_init() function was not able to insert a dummy
988f569ae041cc kernel/rcu/tree.c Uladzislau Rezki (Sony  2024-03-08  1874) 	 * separator to the llist, because there were no left any dummy-nodes.
988f569ae041cc kernel/rcu/tree.c Uladzislau Rezki (Sony  2024-03-08  1875) 	 *
988f569ae041cc kernel/rcu/tree.c Uladzislau Rezki (Sony  2024-03-08  1876) 	 * Number of dummy-nodes is fixed, it could be that we are run out of
988f569ae041cc kernel/rcu/tree.c Uladzislau Rezki (Sony  2024-03-08  1877) 	 * them, if so we start a new pool request to repeat a try. It is rare
988f569ae041cc kernel/rcu/tree.c Uladzislau Rezki (Sony  2024-03-08  1878) 	 * and it means that a system is doing a slow processing of callbacks.
988f569ae041cc kernel/rcu/tree.c Uladzislau Rezki (Sony  2024-03-08  1879) 	 */
988f569ae041cc kernel/rcu/tree.c Uladzislau Rezki (Sony  2024-03-08  1880) 	if (start_new_poll)
988f569ae041cc kernel/rcu/tree.c Uladzislau Rezki (Sony  2024-03-08  1881) 		(void) start_poll_synchronize_rcu();
988f569ae041cc kernel/rcu/tree.c Uladzislau Rezki (Sony  2024-03-08  1882) 
0aa04b055e71bd kernel/rcu/tree.c Paul E. McKenney        2015-01-23  1883  	/*
f37599e6f06da4 kernel/rcu/tree.c Joel Fernandes (Google  2020-08-07  1884) 	 * Apply per-leaf buffered online and offline operations to
f37599e6f06da4 kernel/rcu/tree.c Joel Fernandes (Google  2020-08-07  1885) 	 * the rcu_node tree. Note that this new grace period need not
f37599e6f06da4 kernel/rcu/tree.c Joel Fernandes (Google  2020-08-07  1886) 	 * wait for subsequent online CPUs, and that RCU hooks in the CPU
f37599e6f06da4 kernel/rcu/tree.c Joel Fernandes (Google  2020-08-07  1887) 	 * offlining path, when combined with checks in this function,
f37599e6f06da4 kernel/rcu/tree.c Joel Fernandes (Google  2020-08-07  1888) 	 * will handle CPUs that are currently going offline or that will
f37599e6f06da4 kernel/rcu/tree.c Joel Fernandes (Google  2020-08-07  1889) 	 * go offline later.  Please also refer to "Hotplug CPU" section
f37599e6f06da4 kernel/rcu/tree.c Joel Fernandes (Google  2020-08-07  1890) 	 * of RCU's Requirements documentation.
0aa04b055e71bd kernel/rcu/tree.c Paul E. McKenney        2015-01-23  1891  	 */
683954e55c9814 kernel/rcu/tree.c Neeraj Upadhyay         2020-11-16  1892  	WRITE_ONCE(rcu_state.gp_state, RCU_GP_ONOFF);
82980b1622d970 kernel/rcu/tree.c David Woodhouse         2021-02-16  1893  	/* Exclude CPU hotplug operations. */
aedf4ba984168a kernel/rcu/tree.c Paul E. McKenney        2018-07-04  1894  	rcu_for_each_leaf_node(rnp) {
51cace13729f89 kernel/rcu/tree.c Paul E. McKenney        2024-05-08  1895  		local_irq_disable();
5d71c2b53f1790 kernel/rcu/tree.c Joel Fernandes          2025-07-15  1896  		/*
5d71c2b53f1790 kernel/rcu/tree.c Joel Fernandes          2025-07-15  1897  		 * Serialize with CPU offline. See Requirements.rst > Hotplug CPU >
5d71c2b53f1790 kernel/rcu/tree.c Joel Fernandes          2025-07-15  1898  		 * Concurrent Quiescent State Reporting for Offline CPUs.
5d71c2b53f1790 kernel/rcu/tree.c Joel Fernandes          2025-07-15  1899  		 */
82980b1622d970 kernel/rcu/tree.c David Woodhouse         2021-02-16  1900  		arch_spin_lock(&rcu_state.ofl_lock);
82980b1622d970 kernel/rcu/tree.c David Woodhouse         2021-02-16  1901  		raw_spin_lock_rcu_node(rnp);
899b2d63bf635c kernel/rcu/tree.c Joel Fernandes          2026-01-02  1902  		rcu_promote_blocked_tasks(rnp);
0aa04b055e71bd kernel/rcu/tree.c Paul E. McKenney        2015-01-23  1903  		if (rnp->qsmaskinit == rnp->qsmaskinitnext &&
0aa04b055e71bd kernel/rcu/tree.c Paul E. McKenney        2015-01-23  1904  		    !rnp->wait_blkd_tasks) {
0aa04b055e71bd kernel/rcu/tree.c Paul E. McKenney        2015-01-23  1905  			/* Nothing to do on this leaf rcu_node structure. */
82980b1622d970 kernel/rcu/tree.c David Woodhouse         2021-02-16  1906  			raw_spin_unlock_rcu_node(rnp);
82980b1622d970 kernel/rcu/tree.c David Woodhouse         2021-02-16  1907  			arch_spin_unlock(&rcu_state.ofl_lock);
51cace13729f89 kernel/rcu/tree.c Paul E. McKenney        2024-05-08  1908  			local_irq_enable();
0aa04b055e71bd kernel/rcu/tree.c Paul E. McKenney        2015-01-23  1909  			continue;
0aa04b055e71bd kernel/rcu/tree.c Paul E. McKenney        2015-01-23  1910  		}
0aa04b055e71bd kernel/rcu/tree.c Paul E. McKenney        2015-01-23  1911  
0aa04b055e71bd kernel/rcu/tree.c Paul E. McKenney        2015-01-23  1912  		/* Record old state, apply changes to ->qsmaskinit field. */
0aa04b055e71bd kernel/rcu/tree.c Paul E. McKenney        2015-01-23  1913  		oldmask = rnp->qsmaskinit;
0aa04b055e71bd kernel/rcu/tree.c Paul E. McKenney        2015-01-23  1914  		rnp->qsmaskinit = rnp->qsmaskinitnext;
0aa04b055e71bd kernel/rcu/tree.c Paul E. McKenney        2015-01-23  1915  
0aa04b055e71bd kernel/rcu/tree.c Paul E. McKenney        2015-01-23  1916  		/* If zero-ness of ->qsmaskinit changed, propagate up tree. */
0aa04b055e71bd kernel/rcu/tree.c Paul E. McKenney        2015-01-23  1917  		if (!oldmask != !rnp->qsmaskinit) {
962aff03c315b5 kernel/rcu/tree.c Paul E. McKenney        2018-05-02  1918  			if (!oldmask) { /* First online CPU for rcu_node. */
962aff03c315b5 kernel/rcu/tree.c Paul E. McKenney        2018-05-02  1919  				if (!rnp->wait_blkd_tasks) /* Ever offline? */
0aa04b055e71bd kernel/rcu/tree.c Paul E. McKenney        2015-01-23  1920  					rcu_init_new_rnp(rnp);
962aff03c315b5 kernel/rcu/tree.c Paul E. McKenney        2018-05-02  1921  			} else if (rcu_preempt_has_tasks(rnp)) {
962aff03c315b5 kernel/rcu/tree.c Paul E. McKenney        2018-05-02  1922  				rnp->wait_blkd_tasks = true; /* blocked tasks */
962aff03c315b5 kernel/rcu/tree.c Paul E. McKenney        2018-05-02  1923  			} else { /* Last offline CPU and can propagate. */
0aa04b055e71bd kernel/rcu/tree.c Paul E. McKenney        2015-01-23  1924  				rcu_cleanup_dead_rnp(rnp);
0aa04b055e71bd kernel/rcu/tree.c Paul E. McKenney        2015-01-23  1925  			}
962aff03c315b5 kernel/rcu/tree.c Paul E. McKenney        2018-05-02  1926  		}
0aa04b055e71bd kernel/rcu/tree.c Paul E. McKenney        2015-01-23  1927  
0aa04b055e71bd kernel/rcu/tree.c Paul E. McKenney        2015-01-23  1928  		/*
0aa04b055e71bd kernel/rcu/tree.c Paul E. McKenney        2015-01-23  1929  		 * If all waited-on tasks from prior grace period are
0aa04b055e71bd kernel/rcu/tree.c Paul E. McKenney        2015-01-23  1930  		 * done, and if all this rcu_node structure's CPUs are
0aa04b055e71bd kernel/rcu/tree.c Paul E. McKenney        2015-01-23  1931  		 * still offline, propagate up the rcu_node tree and
0aa04b055e71bd kernel/rcu/tree.c Paul E. McKenney        2015-01-23  1932  		 * clear ->wait_blkd_tasks.  Otherwise, if one of this
0aa04b055e71bd kernel/rcu/tree.c Paul E. McKenney        2015-01-23  1933  		 * rcu_node structure's CPUs has since come back online,
962aff03c315b5 kernel/rcu/tree.c Paul E. McKenney        2018-05-02  1934  		 * simply clear ->wait_blkd_tasks.
0aa04b055e71bd kernel/rcu/tree.c Paul E. McKenney        2015-01-23  1935  		 */
0aa04b055e71bd kernel/rcu/tree.c Paul E. McKenney        2015-01-23  1936  		if (rnp->wait_blkd_tasks &&
962aff03c315b5 kernel/rcu/tree.c Paul E. McKenney        2018-05-02  1937  		    (!rcu_preempt_has_tasks(rnp) || rnp->qsmaskinit)) {
0aa04b055e71bd kernel/rcu/tree.c Paul E. McKenney        2015-01-23  1938  			rnp->wait_blkd_tasks = false;
962aff03c315b5 kernel/rcu/tree.c Paul E. McKenney        2018-05-02  1939  			if (!rnp->qsmaskinit)
0aa04b055e71bd kernel/rcu/tree.c Paul E. McKenney        2015-01-23  1940  				rcu_cleanup_dead_rnp(rnp);
0aa04b055e71bd kernel/rcu/tree.c Paul E. McKenney        2015-01-23  1941  		}
0aa04b055e71bd kernel/rcu/tree.c Paul E. McKenney        2015-01-23  1942  
82980b1622d970 kernel/rcu/tree.c David Woodhouse         2021-02-16  1943  		raw_spin_unlock_rcu_node(rnp);
82980b1622d970 kernel/rcu/tree.c David Woodhouse         2021-02-16  1944  		arch_spin_unlock(&rcu_state.ofl_lock);
51cace13729f89 kernel/rcu/tree.c Paul E. McKenney        2024-05-08  1945  		local_irq_enable();
0aa04b055e71bd kernel/rcu/tree.c Paul E. McKenney        2015-01-23  1946  	}
22212332c1f37d kernel/rcu/tree.c Paul E. McKenney        2018-07-03  1947  	rcu_gp_slow(gp_preinit_delay); /* Races with CPU hotplug. */
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  1948  
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  1949  	/*
b835db1f9cadaf kernel/rcutree.c  Paul E. McKenney        2009-09-08  1950  	 * Set the quiescent-state-needed bits in all the rcu_node
9cbc5b97029bff kernel/rcu/tree.c Paul E. McKenney        2018-07-05  1951  	 * structures for all currently online CPUs in breadth-first
9cbc5b97029bff kernel/rcu/tree.c Paul E. McKenney        2018-07-05  1952  	 * order, starting from the root rcu_node structure, relying on the
9cbc5b97029bff kernel/rcu/tree.c Paul E. McKenney        2018-07-05  1953  	 * layout of the tree within the rcu_state.node[] array.  Note that
9cbc5b97029bff kernel/rcu/tree.c Paul E. McKenney        2018-07-05  1954  	 * other CPUs will access only the leaves of the hierarchy, thus
9cbc5b97029bff kernel/rcu/tree.c Paul E. McKenney        2018-07-05  1955  	 * seeing that no grace period is in progress, at least until the
9cbc5b97029bff kernel/rcu/tree.c Paul E. McKenney        2018-07-05  1956  	 * corresponding leaf node has been initialized.
7fdefc10e1d730 kernel/rcutree.c  Paul E. McKenney        2012-06-22  1957  	 *
7fdefc10e1d730 kernel/rcutree.c  Paul E. McKenney        2012-06-22  1958  	 * The grace period cannot complete until the initialization
7fdefc10e1d730 kernel/rcutree.c  Paul E. McKenney        2012-06-22  1959  	 * process finishes, because this kthread handles both.
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  1960  	 */
683954e55c9814 kernel/rcu/tree.c Neeraj Upadhyay         2020-11-16  1961  	WRITE_ONCE(rcu_state.gp_state, RCU_GP_INIT);
aedf4ba984168a kernel/rcu/tree.c Paul E. McKenney        2018-07-04  1962  	rcu_for_each_node_breadth_first(rnp) {
22212332c1f37d kernel/rcu/tree.c Paul E. McKenney        2018-07-03  1963  		rcu_gp_slow(gp_init_delay);
ec2c29765a4ab1 kernel/rcu/tree.c Paul E. McKenney        2018-05-07  1964  		raw_spin_lock_irqsave_rcu_node(rnp, flags);
da1df50d16171f kernel/rcu/tree.c Paul E. McKenney        2018-07-03  1965  		rdp = this_cpu_ptr(&rcu_data);
899b2d63bf635c kernel/rcu/tree.c Joel Fernandes          2026-01-02  1966  		rcu_promote_blocked_tasks(rnp);
81ab59a3ad8656 kernel/rcu/tree.c Paul E. McKenney        2018-07-03  1967  		rcu_preempt_check_blocked_tasks(rnp);
49e291266d0920 kernel/rcutree.c  Paul E. McKenney        2009-09-18  1968  		rnp->qsmask = rnp->qsmaskinit;
9cbc5b97029bff kernel/rcu/tree.c Paul E. McKenney        2018-07-05  1969  		WRITE_ONCE(rnp->gp_seq, rcu_state.gp_seq);
d09b62dfa33644 kernel/rcutree.c  Paul E. McKenney        2009-11-02  1970  		if (rnp == rdp->mynode)
c7e48f7ba38201 kernel/rcu/tree.c Paul E. McKenney        2018-07-03  1971  			(void)__note_gp_changes(rnp, rdp);
27f4d28057adf9 kernel/rcutree.c  Paul E. McKenney        2011-02-07  1972  		rcu_preempt_boost_start_gp(rnp);
9cbc5b97029bff kernel/rcu/tree.c Paul E. McKenney        2018-07-05  1973  		trace_rcu_grace_period_init(rcu_state.name, rnp->gp_seq,
d4c08f2ac311a3 kernel/rcutree.c  Paul E. McKenney        2011-06-25  1974  					    rnp->level, rnp->grplo,
d4c08f2ac311a3 kernel/rcutree.c  Paul E. McKenney        2011-06-25  1975  					    rnp->grphi, rnp->qsmask);
5d71c2b53f1790 kernel/rcu/tree.c Joel Fernandes          2025-07-15  1976  		/*
5d71c2b53f1790 kernel/rcu/tree.c Joel Fernandes          2025-07-15  1977  		 * Quiescent states for tasks on any now-offline CPUs. Since we
5d71c2b53f1790 kernel/rcu/tree.c Joel Fernandes          2025-07-15  1978  		 * released the ofl and rnp lock before this loop, CPUs might
5d71c2b53f1790 kernel/rcu/tree.c Joel Fernandes          2025-07-15  1979  		 * have gone offline and we have to report QS on their behalf.
5d71c2b53f1790 kernel/rcu/tree.c Joel Fernandes          2025-07-15  1980  		 * See Requirements.rst > Hotplug CPU > Concurrent QS Reporting.
5d71c2b53f1790 kernel/rcu/tree.c Joel Fernandes          2025-07-15  1981  		 */
ec2c29765a4ab1 kernel/rcu/tree.c Paul E. McKenney        2018-05-07  1982  		mask = rnp->qsmask & ~rnp->qsmaskinitnext;
f2e2df59786d7b kernel/rcu/tree.c Paul E. McKenney        2018-05-15  1983  		rnp->rcu_gp_init_mask = mask;
f378d76282efe0 kernel/rcu/tree.c Joel Fernandes          2026-01-02  1984  		if ((mask || rnp->wait_blkd_tasks) && rcu_is_leaf_node(rnp)) {
f378d76282efe0 kernel/rcu/tree.c Joel Fernandes          2026-01-02  1985  			int cpu;
f378d76282efe0 kernel/rcu/tree.c Joel Fernandes          2026-01-02  1986  
f378d76282efe0 kernel/rcu/tree.c Joel Fernandes          2026-01-02  1987  			/*
f378d76282efe0 kernel/rcu/tree.c Joel Fernandes          2026-01-02  1988  			 * Promote blocked tasks from offline CPUs before
f378d76282efe0 kernel/rcu/tree.c Joel Fernandes          2026-01-02  1989  			 * reporting QS, so they properly block the GP.
f378d76282efe0 kernel/rcu/tree.c Joel Fernandes          2026-01-02  1990  			 */
f378d76282efe0 kernel/rcu/tree.c Joel Fernandes          2026-01-02  1991  			for_each_leaf_node_cpu_mask(rnp, cpu, mask) {
f378d76282efe0 kernel/rcu/tree.c Joel Fernandes          2026-01-02  1992  				struct rcu_data *rdp_cpu;
f378d76282efe0 kernel/rcu/tree.c Joel Fernandes          2026-01-02  1993  
f378d76282efe0 kernel/rcu/tree.c Joel Fernandes          2026-01-02  1994  				rdp_cpu = per_cpu_ptr(&rcu_data, cpu);
f378d76282efe0 kernel/rcu/tree.c Joel Fernandes          2026-01-02  1995  				rcu_promote_blocked_tasks_rdp(rdp_cpu, rnp);
f378d76282efe0 kernel/rcu/tree.c Joel Fernandes          2026-01-02  1996  			}
b50912d0b5e03f kernel/rcu/tree.c Paul E. McKenney        2018-07-03  1997  			rcu_report_qs_rnp(mask, rnp, rnp->gp_seq, flags);
f378d76282efe0 kernel/rcu/tree.c Joel Fernandes          2026-01-02  1998  		}
ec2c29765a4ab1 kernel/rcu/tree.c Paul E. McKenney        2018-05-07  1999  		else
67c583a7de3433 kernel/rcu/tree.c Boqun Feng              2015-12-29  2000  			raw_spin_unlock_irq_rcu_node(rnp);
cee43939893337 kernel/rcu/tree.c Paul E. McKenney        2018-03-02  2001  		cond_resched_tasks_rcu_qs();
9cbc5b97029bff kernel/rcu/tree.c Paul E. McKenney        2018-07-05  2002  		WRITE_ONCE(rcu_state.gp_activity, jiffies);
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2003  	}
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2004  
933ada2c3310aa kernel/rcu/tree.c Paul E. McKenney        2020-08-06  2005  	// If strict, make all CPUs aware of new grace period.
933ada2c3310aa kernel/rcu/tree.c Paul E. McKenney        2020-08-06  2006  	if (IS_ENABLED(CONFIG_RCU_STRICT_GRACE_PERIOD))
933ada2c3310aa kernel/rcu/tree.c Paul E. McKenney        2020-08-06  2007  		on_each_cpu(rcu_strict_gp_boundary, NULL, 0);
933ada2c3310aa kernel/rcu/tree.c Paul E. McKenney        2020-08-06  2008  
45fed3e7cfb400 kernel/rcu/tree.c Paul E. McKenney        2015-11-07  2009  	return true;
cabc49c1ff51ba kernel/rcutree.c  Paul E. McKenney        2012-06-20  2010  }
cabc49c1ff51ba kernel/rcutree.c  Paul E. McKenney        2012-06-20  2011  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
