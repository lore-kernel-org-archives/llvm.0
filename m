Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F062AEFB;
	Wed,  2 Apr 2025 15:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743608310; cv=none; b=hEh/Mkavy3f+qjsnExm0Tos7uYd/ape4H3N03PIGXSoFVs4afhjeskT2OjP6kCxvmOgB+vPLrT87CfJizW1BIYg4eouELBTSH4n7kd4B6/kyDEM6vBO+ub6bxAKB7xbZoXNXmaHLSUCloKVWtm6nLJubINYPO0R+aaBM2TNPFhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743608310; c=relaxed/simple;
	bh=gNOxd76U+ipgsM9PZmHHPd/dSCkiX38U0TsaA6LkgHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=peqPQg46eIi8JHQdka4hVMexurYN86ucCGWa059DxQ8P+vQ7sb1GwxxTnanyIitT+nzvFJW+Qh00OLhttITrgcKdgj5mn26jbVw5Ofzdf4qVD47L6z4p9FmB4nYS/lnSi+V5bUkBCSesgM7QIM91EbBlNBcsGRAUBs07J/1xVDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mDSOnyKY; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mDSOnyKY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743608309; x=1775144309;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gNOxd76U+ipgsM9PZmHHPd/dSCkiX38U0TsaA6LkgHg=;
  b=mDSOnyKYDijjnQus8VkqykxH0GNTPXQd7jeVz5X1++ATyHoPZ+dFLmPL
   XdM3BS7OtVEtdUuC7MMVCwKJQDvoHMpahbQkuYAbxYFe3V45kP2P51be8
   8vcF+q+1bSrTjeGmAqI2Z9I4lx/U4N+nci9abacSfE4E+I6mlsFGIClKh
   GXvZt+3FKdqgerxJq+7T2hvpQL6FFTFPx82SyvpppFWrMTGEOfAPY8SF/
   65j41JS9XTJr7Bvf0FStrYSzsPNGQXvVJAcin24+Vgn+0nMTIBzhJMRF7
   fl0eCBGbAIkBPesnMjGA3O+hXV7mT6Au83yORVKrhWo/OCpbqWwERkMwI
   A==;
X-CSE-ConnectionGUID: xj+RbhJYScas8vRYvKhHeA==
X-CSE-MsgGUID: IQOk7BY3RIGDtgUOblA7og==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44865471"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="44865471"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 08:38:28 -0700
X-CSE-ConnectionGUID: e/D1AUI4SbeM0QiK8R/NPQ==
X-CSE-MsgGUID: 3ygaJ+kMRXq12BGreIgYSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="126696129"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 02 Apr 2025 08:38:27 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u00Aa-000Aqo-2V;
	Wed, 02 Apr 2025 15:38:24 +0000
Date: Wed, 2 Apr 2025 23:37:32 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Machado <luis.machado@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] sched: Improving scheduler debugging/tracing interfaces
Message-ID: <202504022329.cc8TsKhN-lkp@intel.com>
References: <20250402122607.2982523-1-luis.machado@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402122607.2982523-1-luis.machado@arm.com>

Hi Luis,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 328802738e1cd091d04076317f3c2174125c5916]

url:    https://github.com/intel-lab-lkp/linux/commits/Luis-Machado/sched-Improving-scheduler-debugging-tracing-interfaces/20250402-203041
base:   328802738e1cd091d04076317f3c2174125c5916
patch link:    https://lore.kernel.org/r/20250402122607.2982523-1-luis.machado%40arm.com
patch subject: [RFC] sched: Improving scheduler debugging/tracing interfaces
config: hexagon-randconfig-001-20250402 (https://download.01.org/0day-ci/archive/20250402/202504022329.cc8TsKhN-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 7eccafc3c84606587a175c0a8c1ebea6e4fb21cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504022329.cc8TsKhN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504022329.cc8TsKhN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:104:26: error: no member named 'avg' in 'struct cfs_rq'
     104 |         return cfs_rq ? cfs_rq->avg.util_est: 0;
         |                         ~~~~~~  ^
   kernel/sched/core.c:110:18: error: no member named 'avg' in 'struct sched_entity'
     110 |         return se ? se->avg.util_est & ~UTIL_AVG_UNCHANGED : 0;
         |                     ~~  ^
>> kernel/sched/core.c:118:55: error: no member named 'cpu' in 'struct rq'
     118 |         unsigned long capacity_orig = per_cpu(cpu_scale, rq->cpu);
         |                                                          ~~  ^
   include/linux/percpu-defs.h:272:49: note: expanded from macro 'per_cpu'
     272 | #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
         |                                                       ^~~
   include/linux/percpu-defs.h:262:9: note: expanded from macro 'per_cpu_ptr'
     262 |         (void)(cpu);                                                    \
         |                ^~~
   kernel/sched/core.c:119:58: error: no member named 'cpu' in 'struct rq'
     119 |         unsigned long scale_freq = per_cpu(arch_freq_scale, rq->cpu);
         |                                                             ~~  ^
   include/linux/percpu-defs.h:272:49: note: expanded from macro 'per_cpu'
     272 | #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
         |                                                       ^~~
   include/linux/percpu-defs.h:262:9: note: expanded from macro 'per_cpu_ptr'
     262 |         (void)(cpu);                                                    \
         |                ^~~
   kernel/sched/core.c:7707:12: warning: array index -1 is before the beginning of the array [-Warray-bounds]
    7707 |                                        preempt_modes[preempt_dynamic_mode] : "undef",
         |                                        ^             ~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7682:1: note: array 'preempt_modes' declared here
    7682 | const char *preempt_modes[] = {
         | ^
   1 warning and 4 errors generated.


vim +104 kernel/sched/core.c

   101	
   102	static unsigned int cfs_rq_util_est(struct cfs_rq *cfs_rq)
   103	{
 > 104		return cfs_rq ? cfs_rq->avg.util_est: 0;
   105	}
   106	
   107	static unsigned int se_util_est(struct sched_entity *se)
   108	{
   109	
   110		return se ? se->avg.util_est & ~UTIL_AVG_UNCHANGED : 0;
   111	}
   112	
   113	static unsigned long rq_cpu_current_capacity(struct rq *rq)
   114	{
   115		if (rq == NULL)
   116			return 0;
   117	
 > 118		unsigned long capacity_orig = per_cpu(cpu_scale, rq->cpu);
   119		unsigned long scale_freq = per_cpu(arch_freq_scale, rq->cpu);
   120		return cap_scale(capacity_orig, scale_freq);
   121	}
   122	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
