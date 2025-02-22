Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756BD1D7E42;
	Sat, 22 Feb 2025 21:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740259118; cv=none; b=PDTQ+yTqa90sDzkhIIAfw/uoO5P9yexdh/Oq7H46F5oWUs5hN1HYNHydzNhwpqPdfPuIFqRjLi7DIvSNelfxlwRWYW9Y6g8qpEeMKICTQ2J8j9yD59VIYKlfiLSWpnvZXgaYfVuXCKbo2cVhVbGrziAWJyufO1sQ+mur67GAY6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740259118; c=relaxed/simple;
	bh=0Br3t29Hv9ubwtRHxRhjaO15RSiTznt5AZe+Aq5R+u4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fv/rGzxrmRpOpXoGkmnjm+HOPRNw22pG3stUZ1IiP45trrqWDHQKdl/cNNLGn9fwgcSqCIecwHC8fMLiztTCGKEHdcYBdaDVihJKH5tkDiga+KWgtg6nmkYHbkypfZzJ0cU1ESL/nuYlkQ5AXXYs7s0+vFatTuKJOp+foIHzOIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dVsvJ7mg; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dVsvJ7mg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740259116; x=1771795116;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0Br3t29Hv9ubwtRHxRhjaO15RSiTznt5AZe+Aq5R+u4=;
  b=dVsvJ7mgsH0TvoFRxg83FRUF1uJolAL9y54GJk9UPl5Ss1e6uSO9sQL0
   hBYVBgBBoIWFytVkYBgFZmoTgwAGW7z6wmiRLpo06BqnZTou/3UbkkYH0
   fQngG6mEZLs9ZE00C9QrJ1WTDrAzqqzM+mYNDFHL0BziNUVpvTV7uamAv
   Zb6mi/Jp7d2AI81p8OMw1+xdgaAZE599jGjvNC5eXb/6c6QLYw/YeE++X
   K4W99nTSTMLuq3DMDyBizTrVhzF5lfDQXthNnM3ZvQMzoOGGR2IaxmyR2
   bUlHFphEnkM5a2i7A9TO/6aEi9VfdE/PWRTRBXzaGlARWcragiudcZtUo
   Q==;
X-CSE-ConnectionGUID: HQ7tKJ9HSDm1EqhH13EM8w==
X-CSE-MsgGUID: 3YiHMVSZRE20V53SLlmPCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="66426582"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="66426582"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 13:18:35 -0800
X-CSE-ConnectionGUID: q5B4lbyqTw21w/P2w1jLvg==
X-CSE-MsgGUID: l+j3r8o0RGSpMekfHE/INA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="146528692"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 22 Feb 2025 13:18:33 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlwtL-0006v1-00;
	Sat, 22 Feb 2025 21:18:31 +0000
Date: Sun, 23 Feb 2025 05:18:02 +0800
From: kernel test robot <lkp@intel.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 22/22] [DEBUG] sched/fair: Debug pick_eevdf()
 returning NULL!
Message-ID: <202502230452.TjpiO8JM-lkp@intel.com>
References: <20250220093257.9380-23-kprateek.nayak@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220093257.9380-23-kprateek.nayak@amd.com>

Hi Prateek,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on d34e798094ca7be935b629a42f8b237d4d5b7f1d]

url:    https://github.com/intel-lab-lkp/linux/commits/K-Prateek-Nayak/kernel-entry-common-Move-syscall_enter_from_user_mode_work-out-of-header/20250220-174233
base:   d34e798094ca7be935b629a42f8b237d4d5b7f1d
patch link:    https://lore.kernel.org/r/20250220093257.9380-23-kprateek.nayak%40amd.com
patch subject: [RFC PATCH 22/22] [DEBUG] sched/fair: Debug pick_eevdf() returning NULL!
config: arm-randconfig-002-20250221 (https://download.01.org/0day-ci/archive/20250223/202502230452.TjpiO8JM-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502230452.TjpiO8JM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502230452.TjpiO8JM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/fair.c:5618:98: error: no member named 'kernel_cs_count' in 'struct sched_entity'
    5618 |         pr_warn("CPU%d: se kcs: kernel_cs_count(%d) min_kcs_vruntime(%lld) pick_entity(%d)\n", cpu, se->kernel_cs_count, se->min.kcs_vruntime, pick_entity(cfs_rq, se, h_throttled));
         |                                                                                                     ~~  ^
   include/linux/printk.h:554:37: note: expanded from macro 'pr_warn'
     554 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                            ^~~~~~~~~~~
   include/linux/printk.h:501:60: note: expanded from macro 'printk'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:473:19: note: expanded from macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
>> kernel/sched/fair.c:5624:166: error: no member named 'throttled' in 'struct cfs_rq'
    5624 |         pr_warn("CPU%d: cfs_rq: throttled?(%d) cfs_rq->throttled(%d) h_nr_queued(%d) h_nr_runnable(%d) nr_queued(%d) gse->kernel_cs_count(%d)\n", cpu, h_throttled, cfs_rq->throttled, cfs_rq->h_nr_queued, cfs_rq->h_nr_runnable, cfs_rq->nr_queued, (se)? se->kernel_cs_count: -1);
         |                                                                                                                                                                     ~~~~~~  ^
   include/linux/printk.h:554:37: note: expanded from macro 'pr_warn'
     554 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                            ^~~~~~~~~~~
   include/linux/printk.h:501:60: note: expanded from macro 'printk'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:473:19: note: expanded from macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   kernel/sched/fair.c:5624:250: error: no member named 'kernel_cs_count' in 'struct sched_entity'
    5624 |         pr_warn("CPU%d: cfs_rq: throttled?(%d) cfs_rq->throttled(%d) h_nr_queued(%d) h_nr_runnable(%d) nr_queued(%d) gse->kernel_cs_count(%d)\n", cpu, h_throttled, cfs_rq->throttled, cfs_rq->h_nr_queued, cfs_rq->h_nr_runnable, cfs_rq->nr_queued, (se)? se->kernel_cs_count: -1);
         |                                                                                                                                                                                                                                                             ~~  ^
   include/linux/printk.h:554:37: note: expanded from macro 'pr_warn'
     554 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                            ^~~~~~~~~~~
   include/linux/printk.h:501:60: note: expanded from macro 'printk'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:473:19: note: expanded from macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
>> kernel/sched/fair.c:5625:166: error: no member named 'avg_kcs_vruntime' in 'struct cfs_rq'; did you mean 'avg_vruntime'?
    5625 |         pr_warn("CPU%d: cfs_rq EEVDF: avg_vruntime(%lld) avg_load(%lld) avg_kcs_vruntime(%lld) avg_kcs_load(%lld) \n", cpu, cfs_rq->avg_vruntime, cfs_rq->avg_load, cfs_rq->avg_kcs_vruntime, cfs_rq->avg_kcs_load);
         |                                                                                                                                                                             ^~~~~~~~~~~~~~~~
         |                                                                                                                                                                             avg_vruntime
   include/linux/printk.h:554:37: note: expanded from macro 'pr_warn'
     554 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                            ^
   include/linux/printk.h:501:60: note: expanded from macro 'printk'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^
   include/linux/printk.h:473:19: note: expanded from macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^
   kernel/sched/sched.h:658:8: note: 'avg_vruntime' declared here
     658 |         s64                     avg_vruntime;
         |                                 ^
>> kernel/sched/fair.c:5625:192: error: no member named 'avg_kcs_load' in 'struct cfs_rq'; did you mean 'avg_load'?
    5625 |         pr_warn("CPU%d: cfs_rq EEVDF: avg_vruntime(%lld) avg_load(%lld) avg_kcs_vruntime(%lld) avg_kcs_load(%lld) \n", cpu, cfs_rq->avg_vruntime, cfs_rq->avg_load, cfs_rq->avg_kcs_vruntime, cfs_rq->avg_kcs_load);
         |                                                                                                                                                                                                       ^~~~~~~~~~~~
         |                                                                                                                                                                                                       avg_load
   include/linux/printk.h:554:37: note: expanded from macro 'pr_warn'
     554 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                            ^
   include/linux/printk.h:501:60: note: expanded from macro 'printk'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^
   include/linux/printk.h:473:19: note: expanded from macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^
   kernel/sched/sched.h:659:8: note: 'avg_load' declared here
     659 |         u64                     avg_load;
         |                                 ^
   5 errors generated.


vim +5618 kernel/sched/fair.c

  5612	
  5613	static void debug_print_se(int cpu, struct sched_entity *se, bool h_throttled)
  5614	{
  5615		struct cfs_rq *cfs_rq = cfs_rq_of(se);
  5616	
  5617		pr_warn("CPU%d: se: load(%lu) vruntime(%lld) entity_key(%lld) deadline(%lld) min_vruntime(%lld) on_rq(%d)\n", cpu, scale_load_down(se->load.weight), se->vruntime, entity_key(cfs_rq, se), se->deadline, se->min.vruntime, se->on_rq);
> 5618		pr_warn("CPU%d: se kcs: kernel_cs_count(%d) min_kcs_vruntime(%lld) pick_entity(%d)\n", cpu, se->kernel_cs_count, se->min.kcs_vruntime, pick_entity(cfs_rq, se, h_throttled));
  5619	}
  5620	
  5621	static void debug_print_cfs_rq(int cpu, struct cfs_rq *cfs_rq, struct sched_entity *se, bool h_throttled)
  5622	{
  5623		pr_warn("CPU%d: ----- cfs_rq ----\n", cpu);
> 5624		pr_warn("CPU%d: cfs_rq: throttled?(%d) cfs_rq->throttled(%d) h_nr_queued(%d) h_nr_runnable(%d) nr_queued(%d) gse->kernel_cs_count(%d)\n", cpu, h_throttled, cfs_rq->throttled, cfs_rq->h_nr_queued, cfs_rq->h_nr_runnable, cfs_rq->nr_queued, (se)? se->kernel_cs_count: -1);
> 5625		pr_warn("CPU%d: cfs_rq EEVDF: avg_vruntime(%lld) avg_load(%lld) avg_kcs_vruntime(%lld) avg_kcs_load(%lld) \n", cpu, cfs_rq->avg_vruntime, cfs_rq->avg_load, cfs_rq->avg_kcs_vruntime, cfs_rq->avg_kcs_load);
  5626	
  5627		if (cfs_rq->curr) {
  5628			pr_warn("CPU%d: ----- cfs_rq->curr ----\n", cpu);
  5629			debug_print_se(cpu, cfs_rq->curr, h_throttled);
  5630		}
  5631		pr_warn("CPU%d: ----- cfs_rq done ----\n", cpu);
  5632	}
  5633	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
