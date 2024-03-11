Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1B31876;
	Mon, 11 Mar 2024 03:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710128595; cv=none; b=qMwvrxB8mpOSG/zUP8kRR6Cj60XTc4c7K1K/Z9KZ1EfWAiWaDPZjBifr5R2LdjZWYJ/8jWr7szfprJT5Q+Yap/CKUfuB46ezoLLOu0N38fiwI9rIkLasHyywCdq7oFUbafPVdvgxUa9kYVlCN+AotiukDOLeUh2Rb6P5ycmKS74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710128595; c=relaxed/simple;
	bh=vm8YFdCx4B+nlC0XzJGTq5TZGTrHoQtmxvmVS/3+xps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FDV/YceTjQiPHazu+4aYyK3TwQgdPMKwMBFRttksaevtw33vzpSl4P6jirh02y3ueZRkgCksrG0g2mc/4Fowxvwxf8wIgkXuCqbx2GOWfpRCyq7/OJxEc81N7JKyIcl7aBL4kDE/mfsuBb+hSrIFn4uYJ3KuZu4crvcsf4paez4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EKVgNjsg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EKVgNjsg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710128593; x=1741664593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vm8YFdCx4B+nlC0XzJGTq5TZGTrHoQtmxvmVS/3+xps=;
  b=EKVgNjsgDI7TfGBKXVGOYazZ3z3xzswmsw5XHngwnuShKPnVCQHdrQj5
   5/Q/vfegJuKqBKnX9J/K3nOHIS1mL6unwqj2Oyi5d9Q0K8GGz70evhFBS
   7TIlxBT5pTOgeI+8ov30Nd6Bm9Wpc3MTz+VW+tLmj7gcFOG8aeTDk4uwa
   tIVLHPJ0nRO+rVIjuK3z+PMKTOGifG2uaMCE4xtMFbCSg5W5jON1Asi8j
   iUL8SOOnW0Jw9mDoqPWctBABvpiWmXNb25/ikHbAFAkz1zy750+07UBXt
   ssnPz9t+aWni1M6NfORW/kUclC88kRbIk/kHXghhQyqrDYkssb5kmX3De
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="16213440"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="16213440"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 20:43:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="48491219"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Mar 2024 20:43:12 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjWZB-0008rz-0p;
	Mon, 11 Mar 2024 03:43:09 +0000
Date: Mon, 11 Mar 2024 11:42:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:iowait.2 4/4] kernel/sched/core.c:9046:60: warning:
 shift count >= width of type
Message-ID: <202403111109.Kjqr5COu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git iowait.2
head:   9e65871d5161d7b24778fd9b232edb2d076cd26b
commit: 9e65871d5161d7b24778fd9b232edb2d076cd26b [4/4] sched/core: split iowait state into two states
config: arm-imxrt_defconfig (https://download.01.org/0day-ci/archive/20240311/202403111109.Kjqr5COu-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 503c55e17037436dcd45ac69dea8967e67e3f5e8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403111109.Kjqr5COu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403111109.Kjqr5COu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/core.c:9:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm/include/asm/cacheflush.h:10:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/sched/core.c:9046:60: warning: shift count >= width of type [-Wshift-count-overflow]
    9046 |         int token = current->in_iowait + (current->in_iowait_acct << 32);
         |                                                                   ^  ~~
   kernel/sched/core.c:3714:20: warning: unused function 'rq_has_pinned_tasks' [-Wunused-function]
    3714 | static inline bool rq_has_pinned_tasks(struct rq *rq)
         |                    ^~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:5879:20: warning: unused function 'sched_tick_start' [-Wunused-function]
    5879 | static inline void sched_tick_start(int cpu) { }
         |                    ^~~~~~~~~~~~~~~~
   kernel/sched/core.c:5880:20: warning: unused function 'sched_tick_stop' [-Wunused-function]
    5880 | static inline void sched_tick_stop(int cpu) { }
         |                    ^~~~~~~~~~~~~~~
   kernel/sched/core.c:6587:20: warning: unused function 'sched_core_cpu_starting' [-Wunused-function]
    6587 | static inline void sched_core_cpu_starting(unsigned int cpu) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:6588:20: warning: unused function 'sched_core_cpu_deactivate' [-Wunused-function]
    6588 | static inline void sched_core_cpu_deactivate(unsigned int cpu) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:6589:20: warning: unused function 'sched_core_cpu_dying' [-Wunused-function]
    6589 | static inline void sched_core_cpu_dying(unsigned int cpu) {}
         |                    ^~~~~~~~~~~~~~~~~~~~
   8 warnings generated.


vim +9046 kernel/sched/core.c

  9035	
  9036	/*
  9037	 * Returns a token which is comprised of the two bits of iowait wait state -
  9038	 * one is whether we're making ourselves as in iowait for cpufreq reasons,
  9039	 * and the other is if the task should be accounted as such.
  9040	 */
  9041	long io_schedule_prepare(void)
  9042	{
  9043	#ifdef CONFIG_64BIT
  9044		long token = current->in_iowait + ((long) current->in_iowait_acct << 32);
  9045	#else
> 9046		int token = current->in_iowait + (current->in_iowait_acct << 32);
  9047	#endif
  9048		current->in_iowait = 1;
  9049		current->in_iowait_acct = 1;
  9050		blk_flush_plug(current->plug, true);
  9051		return token;
  9052	}
  9053	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
