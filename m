Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D49195;
	Mon, 22 Jan 2024 00:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705882534; cv=none; b=OYMy3fPHVy2E07a/bcOHnw9G3NVJMom2wFmHmJgyHRj8KBzGs55LToL78ZPbiqTe46cSAOFmsNu5xKIyNAErex3WA6St6Z3YRI/d+d921uQmJJN9v8xW6RQIuT6FtdGv2OwLMxp6yHcgvf8S6Z4IdAteBOQZ3n9ICLWoWmftEHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705882534; c=relaxed/simple;
	bh=2ZHh5G2gm10jhN2LBwO4ycieDx8xJPMJBvh+iN2j0Z8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bYm4CGVkaE5GPJeDqOp7a24FOV+Q5b2DP1Y2Jc6GB9pQ/Oj3UGbAmruYrbvFHD8RxsDGLazAQbQWfeS5Yr0/UNftxka3vJdtxNZC60seT45cTm/sV2EPvWYr1nqUkS0qvxqALtEgmmugPmkQsS04n5F8dbngX6QoFMvTq20FGyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=beEBiRzs; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="beEBiRzs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705882533; x=1737418533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ZHh5G2gm10jhN2LBwO4ycieDx8xJPMJBvh+iN2j0Z8=;
  b=beEBiRzsgCScubMyF5OjMX/VL8J0WMO9UjLlgGTglpP/2xu23GD5dmGD
   UfFg3I7pKH6hlRihEigPoRQ25q2oEPp/q4qwtUhqoQcUQM/f76Wr4a/y8
   K6ROdZ9mrJkfD0qRdtL+qH6P6uz/ylwUenLXJXTy4unyE0uM6B0Z4rSS4
   eCNisuX1W9m9t4cTWUrwaOroJy134eNKPITjg4qosIFjKmUxbbXwVfIu9
   XwpxerRMlw993RVI+cAtop/SFq+vO1BRGrKba/CRpNMfmzT5YY+kangH6
   OB49PPtsUOsTiO8hbLkOI2QqvaTJzLRqz5Bq+4LXnEJJ/uBtoG2plcBmK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="7750466"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="7750466"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 16:15:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="788810380"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="788810380"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 21 Jan 2024 16:15:30 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRhyK-0006Gs-0J;
	Mon, 22 Jan 2024 00:15:28 +0000
Date: Mon, 22 Jan 2024 08:14:56 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:uclamp-max-aggregation 9/13]
 kernel/sched/core.c:5146:15: error: no member named 'decayed' in 'struct
 cfs_rq'
Message-ID: <202401220809.8qXJKKH3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux uclamp-max-aggregation
head:   a29c26f9317cede0f3141904d910d3125f8a82ea
commit: c4beee22462b6901c44432014931880056821b2d [9/13] sched: Consolidate cpufreq updates
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20240122/202401220809.8qXJKKH3-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d92ce344bf641e6bb025b41b3f1a77dd25e2b3e9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240122/202401220809.8qXJKKH3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401220809.8qXJKKH3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:9:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from kernel/sched/core.c:9:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from kernel/sched/core.c:9:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> kernel/sched/core.c:5146:15: error: no member named 'decayed' in 'struct cfs_rq'
    5146 |                 if (rq->cfs.decayed) {
         |                     ~~~~~~~ ^
   kernel/sched/core.c:5147:12: error: no member named 'decayed' in 'struct cfs_rq'
    5147 |                         rq->cfs.decayed = false;
         |                         ~~~~~~~ ^
>> kernel/sched/core.c:5157:21: error: no member named 'avg' in 'struct cfs_rq'
    5157 |                 rq_util = rq->cfs.avg.util_avg;
         |                           ~~~~~~~ ^
   6 warnings and 3 errors generated.


vim +5146 kernel/sched/core.c

  5127	
  5128	static inline void update_cpufreq_ctx_switch(struct rq *rq)
  5129	{
  5130		if (unlikely(current->sched_class == &stop_sched_class))
  5131			return;
  5132	
  5133		if (unlikely(current->sched_class == &idle_sched_class))
  5134			return;
  5135	
  5136		if (unlikely(task_has_idle_policy(current)))
  5137			return;
  5138	
  5139		if (likely(fair_policy(current->policy))) {
  5140			unsigned long uclamp_min, uclamp_max;
  5141			unsigned long rq_util;
  5142	
  5143			/*
  5144			 * Allow cpufreq updates once for every update_load_avg() decay.
  5145			 */
> 5146			if (rq->cfs.decayed) {
  5147				rq->cfs.decayed = false;
  5148				goto force_update;
  5149			}
  5150	
  5151			if (current->in_iowait)
  5152				goto force_update;
  5153	
  5154			/* Force an update if perf hints are required to be applied */
  5155			uclamp_min = uclamp_eff_value(current, UCLAMP_MIN);
  5156			uclamp_max = uclamp_eff_value(current, UCLAMP_MIN);
> 5157			rq_util = rq->cfs.avg.util_avg;
  5158	
  5159			if (uclamp_min > rq_util || uclamp_max < rq_util)
  5160				goto force_update;
  5161	
  5162			return;
  5163		}
  5164	
  5165		/* RT and DL should always send a freq update */
  5166	
  5167		/* XXX ignore updates for sugov worker thread */
  5168	
  5169	force_update:
  5170	
  5171		/*
  5172		 * Request freq update after __balance_callbacks to take into account
  5173		 * any changes to rq.
  5174		 */
  5175		cpufreq_update_util(rq, current->in_iowait ? SCHED_CPUFREQ_IOWAIT : 0);
  5176	}
  5177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
