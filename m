Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD22F21421A;
	Sat, 10 May 2025 23:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746920680; cv=none; b=mO/e3cTIxYOH1xsqle0sKOive4PMOorCXfquzHEsAI0nJbcedrpHZzF6qeg1ZdJCrqJCoIoNahPql2i66jozPu/xpVl0F1bQqimqLYprGeSrFNpM69+b5uJ960MOz3uX3Spdb7l+CxNNvkcFAnefag9liM3w0vfFLP8c8/kNhsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746920680; c=relaxed/simple;
	bh=7ZvSarleHa/MjL/z4qnQXJbCzefrLMHSNLjH/SoWYVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f+0JQ2Aow+PxEDgSXSJCyXmwDHs1fn02vLCSzYHvLxuRE014YnSrYIcsgQhy/t21PCM1RQ1evUSyTXktIwml0leJNLPDABReuztEqyjHxEr8pq/ZAeiqwKGiS9y+ZimfoCfax8E8nLSrjMfkQXlUwnPSTYYDw14AONN1IUKKOdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W/50YvMc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W/50YvMc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746920679; x=1778456679;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7ZvSarleHa/MjL/z4qnQXJbCzefrLMHSNLjH/SoWYVE=;
  b=W/50YvMc1PWIHzOEX9OcoiaAi8hcVxuYktdEdmRlLL33GS90G8PXlxc7
   GZ1O9A+70rTwLWOn/zuqemmplN0M+cGhTX3cwA6XFIhUOTSVpC/y8DfnS
   pLWmnqt5NjvAENA47kKGzhULRSoAX1koN1u8JhshositZGSrRRPKfr4fn
   LyR2Wf08aoKiXs9IiYawByc2q1A67VEIGwRumRzazMWmTkkAkS5X7FlMS
   IxxUFQ1mFnWzIQWkZOQE5p6zDAOJKgzU9Ns2JgMSYKlwHGqVpPX9bmAV9
   Wo8n9bl3J/3xIYodXNDhQ9h+ptPvPVRDhloRhPU0mH9BFe5dE+xKoEjmN
   A==;
X-CSE-ConnectionGUID: wKH8OIizQqmiD1a33DAuNA==
X-CSE-MsgGUID: xf9J/YlUT26Sc1C26aloKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="51394159"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="51394159"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 16:44:36 -0700
X-CSE-ConnectionGUID: uJG14slFQWKbrgHvxxdp7g==
X-CSE-MsgGUID: Ke5+kLPaR9GiYqk+DhkqWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="136858505"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 May 2025 16:44:34 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDtrs-000DTb-22;
	Sat, 10 May 2025 23:44:32 +0000
Date: Sun, 11 May 2025 07:43:43 +0800
From: kernel test robot <lkp@intel.com>
To: Kai Huang <kai.huang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 4/5] x86/virt/tdx: Remove the !KEXEC_CORE dependency
Message-ID: <202505110749.3WJFCO0R-lkp@intel.com>
References: <0c0d9d250a7961e4aca325f970e73e204d650ad9.1746874095.git.kai.huang@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c0d9d250a7961e4aca325f970e73e204d650ad9.1746874095.git.kai.huang@intel.com>

Hi Kai,

kernel test robot noticed the following build errors:

[auto build test ERROR on 5b036d3516a8be54c24c05d8d1dc86f9815ba53e]

url:    https://github.com/intel-lab-lkp/linux/commits/Kai-Huang/x86-sme-Use-percpu-boolean-to-control-wbinvd-during-kexec/20250510-192315
base:   5b036d3516a8be54c24c05d8d1dc86f9815ba53e
patch link:    https://lore.kernel.org/r/0c0d9d250a7961e4aca325f970e73e204d650ad9.1746874095.git.kai.huang%40intel.com
patch subject: [PATCH v2 4/5] x86/virt/tdx: Remove the !KEXEC_CORE dependency
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250511/202505110749.3WJFCO0R-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250511/202505110749.3WJFCO0R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505110749.3WJFCO0R-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/coco/tdx/debug.c:8:
>> arch/x86/include/asm/tdx.h:109:2: error: call to undeclared function 'preempt_disable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     109 |         preempt_disable();
         |         ^
>> arch/x86/include/asm/tdx.h:127:2: error: call to undeclared function 'preempt_enable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     127 |         preempt_enable();
         |         ^
   2 errors generated.


vim +/preempt_disable +109 arch/x86/include/asm/tdx.h

1e66a7e27539305 Kai Huang 2023-12-08  103  
448631f05539246 Kai Huang 2025-05-10  104  static inline u64 do_seamcall(sc_func_t func, u64 fn,
448631f05539246 Kai Huang 2025-05-10  105  			      struct tdx_module_args *args)
448631f05539246 Kai Huang 2025-05-10  106  {
448631f05539246 Kai Huang 2025-05-10  107  	u64 ret;
448631f05539246 Kai Huang 2025-05-10  108  
448631f05539246 Kai Huang 2025-05-10 @109  	preempt_disable();
448631f05539246 Kai Huang 2025-05-10  110  
448631f05539246 Kai Huang 2025-05-10  111  	/*
448631f05539246 Kai Huang 2025-05-10  112  	 * SEAMCALLs are made to the TDX module and can generate dirty
448631f05539246 Kai Huang 2025-05-10  113  	 * cachelines of TDX private memory.  Mark cache state incoherent
448631f05539246 Kai Huang 2025-05-10  114  	 * so that the cache can be flushed during kexec.
448631f05539246 Kai Huang 2025-05-10  115  	 *
448631f05539246 Kai Huang 2025-05-10  116  	 * Not all SEAMCALL leaf functions generate dirty cachelines
448631f05539246 Kai Huang 2025-05-10  117  	 * but for simplicity just treat all of them do.
448631f05539246 Kai Huang 2025-05-10  118  	 *
448631f05539246 Kai Huang 2025-05-10  119  	 * This needs to be done before actually making the SEAMCALL,
448631f05539246 Kai Huang 2025-05-10  120  	 * because kexec-ing CPU could send NMI to stop remote CPUs,
448631f05539246 Kai Huang 2025-05-10  121  	 * in which case even disabling IRQ won't help here.
448631f05539246 Kai Huang 2025-05-10  122  	 */
448631f05539246 Kai Huang 2025-05-10  123  	this_cpu_write(cache_state_incoherent, true);
448631f05539246 Kai Huang 2025-05-10  124  
448631f05539246 Kai Huang 2025-05-10  125  	ret = func(fn, args);
448631f05539246 Kai Huang 2025-05-10  126  
448631f05539246 Kai Huang 2025-05-10 @127  	preempt_enable();
448631f05539246 Kai Huang 2025-05-10  128  
448631f05539246 Kai Huang 2025-05-10  129  	return ret;
448631f05539246 Kai Huang 2025-05-10  130  }
448631f05539246 Kai Huang 2025-05-10  131  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
