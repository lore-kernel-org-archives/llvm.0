Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E48C2144DA;
	Wed,  7 May 2025 10:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746613597; cv=none; b=po65BTe941JyBYj1nIfDH1HJifAV2zmk4wO88i7q/iK/dG0o7DoQzMaZWCA8F9qdxg3+/DXW2sy+CVhhYX+HN43EL8TRNduIGlwzt7LFerz5CO87dYKFpfGjXNy8U/zgZLb+rMlip/zl3L945Fry6Arp3/oQgVHiXljQG9tqjj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746613597; c=relaxed/simple;
	bh=uhD1R3I5pwgpMN7Ur9rxpZ0IIUo9wWe23aBJHhwCY7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IylcCjpCtj4+qNP66ERArYlZUV4CXKVPYs0zAugXeAflZDO75dOp8F2+WY9jYBK4J1aXmpFmUkvodyaC/kTFTRVIt3lYunzH/xM37hqRpC6OAMTJSXSRqhMHn0RtBHmqYfR97V/cykVEcy58GEBkgvHFndGWQEKEzYbbV57WOaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XeV7+rB8; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XeV7+rB8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746613596; x=1778149596;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uhD1R3I5pwgpMN7Ur9rxpZ0IIUo9wWe23aBJHhwCY7o=;
  b=XeV7+rB8AGYXw4wXpaFOqLli1BZtHkdTKQ7+R9gmgmIJFwMbcv+D3ACq
   vcuK44B0zREUFdou8ChOEV8rHdl7Txm1v8AdfQqGZg+d44xKo0TSG7l6U
   PGPlkfFHy4rOSoowIMefVcXQ4fLGgcqgR074oqkWPlQDHIs4+W/bfMzIL
   28EbVrG/BrEpjCsvm15hFbG5YhwbIErvq2pYiBydxygS2A4Idjzq2TPsk
   75xX8ZUplA+I7fcPZJSekVa0C6mZQrPjiCeJlFWGDgY2n2XNo/eOqJjkB
   yeJWlxjtYRSfUfkK5kldk72hVDoGZ6dLdFgtAbCOya+KOyFlkQ7OIGyWR
   w==;
X-CSE-ConnectionGUID: uYkTLKHTScCPNOdt8/C5dw==
X-CSE-MsgGUID: YrsZXoLKSqafdesIs2dcOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48484141"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48484141"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 03:26:14 -0700
X-CSE-ConnectionGUID: Qrvahdx2QqCT1oHwrs8g0A==
X-CSE-MsgGUID: BvMPVd1xRbqKH5Hx4eW6EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="135819759"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 May 2025 03:26:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCbyc-0007az-1x;
	Wed, 07 May 2025 10:26:10 +0000
Date: Wed, 7 May 2025 18:25:12 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Kisel <romank@linux.microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH hyperv-next v3] arch/x86: Provide the CPU number in the
 wakeup AP callback
Message-ID: <202505071859.8y4PxgRA-lkp@intel.com>
References: <20250430204720.108962-1-romank@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430204720.108962-1-romank@linux.microsoft.com>

Hi Roman,

kernel test robot noticed the following build errors:

[auto build test ERROR on 628cc040b3a2980df6032766e8ef0688e981ab95]

url:    https://github.com/intel-lab-lkp/linux/commits/Roman-Kisel/arch-x86-Provide-the-CPU-number-in-the-wakeup-AP-callback/20250501-044909
base:   628cc040b3a2980df6032766e8ef0688e981ab95
patch link:    https://lore.kernel.org/r/20250430204720.108962-1-romank%40linux.microsoft.com
patch subject: [PATCH hyperv-next v3] arch/x86: Provide the CPU number in the wakeup AP callback
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250507/202505071859.8y4PxgRA-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071859.8y4PxgRA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071859.8y4PxgRA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/apic/apic_numachip.c:228:27: error: incompatible function pointer types initializing 'int (*)(u32, unsigned long, unsigned int)' (aka 'int (*)(unsigned int, unsigned long, unsigned int)') with an expression of type 'int (u32, unsigned long)' (aka 'int (unsigned int, unsigned long)') [-Wincompatible-function-pointer-types]
     228 |         .wakeup_secondary_cpu           = numachip_wakeup_secondary,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/apic/apic_numachip.c:262:27: error: incompatible function pointer types initializing 'int (*)(u32, unsigned long, unsigned int)' (aka 'int (*)(unsigned int, unsigned long, unsigned int)') with an expression of type 'int (u32, unsigned long)' (aka 'int (unsigned int, unsigned long)') [-Wincompatible-function-pointer-types]
     262 |         .wakeup_secondary_cpu           = numachip_wakeup_secondary,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +228 arch/x86/kernel/apic/apic_numachip.c

d9d4dee6cedfa1 Daniel J Blueman 2015-09-21  204  
db1003a719d75c Daniel J Blueman 2015-09-21  205  static const struct apic apic_numachip1 __refconst = {
44b111b519160e Steffen Persvold 2011-12-06  206  	.name				= "NumaConnect system",
db1003a719d75c Daniel J Blueman 2015-09-21  207  	.probe				= numachip1_probe,
db1003a719d75c Daniel J Blueman 2015-09-21  208  	.acpi_madt_oem_check		= numachip1_acpi_madt_oem_check,
44b111b519160e Steffen Persvold 2011-12-06  209  
8c44963b603db7 Thomas Gleixner  2020-10-24  210  	.dest_mode_logical		= false,
44b111b519160e Steffen Persvold 2011-12-06  211  
44b111b519160e Steffen Persvold 2011-12-06  212  	.disable_esr			= 0,
44b111b519160e Steffen Persvold 2011-12-06  213  
44b111b519160e Steffen Persvold 2011-12-06  214  	.cpu_present_to_apicid		= default_cpu_present_to_apicid,
44b111b519160e Steffen Persvold 2011-12-06  215  
d92e5e7cf580ac Thomas Gleixner  2023-08-08  216  	.max_apic_id			= UINT_MAX,
db1003a719d75c Daniel J Blueman 2015-09-21  217  	.get_apic_id			= numachip1_get_apic_id,
44b111b519160e Steffen Persvold 2011-12-06  218  
9f9e3bb1cf2ecb Thomas Gleixner  2017-09-13  219  	.calc_dest_apicid		= apic_default_calc_apicid,
44b111b519160e Steffen Persvold 2011-12-06  220  
c61a0d31ba0ce7 Thomas Gleixner  2015-11-04  221  	.send_IPI			= numachip_send_IPI_one,
44b111b519160e Steffen Persvold 2011-12-06  222  	.send_IPI_mask			= numachip_send_IPI_mask,
44b111b519160e Steffen Persvold 2011-12-06  223  	.send_IPI_mask_allbutself	= numachip_send_IPI_mask_allbutself,
44b111b519160e Steffen Persvold 2011-12-06  224  	.send_IPI_allbutself		= numachip_send_IPI_allbutself,
44b111b519160e Steffen Persvold 2011-12-06  225  	.send_IPI_all			= numachip_send_IPI_all,
44b111b519160e Steffen Persvold 2011-12-06  226  	.send_IPI_self			= numachip_send_IPI_self,
44b111b519160e Steffen Persvold 2011-12-06  227  
44b111b519160e Steffen Persvold 2011-12-06 @228  	.wakeup_secondary_cpu		= numachip_wakeup_secondary,
44b111b519160e Steffen Persvold 2011-12-06  229  
44b111b519160e Steffen Persvold 2011-12-06  230  	.read				= native_apic_mem_read,
44b111b519160e Steffen Persvold 2011-12-06  231  	.write				= native_apic_mem_write,
185c8f33a048bd Thomas Gleixner  2023-08-08  232  	.eoi				= native_apic_mem_eoi,
44b111b519160e Steffen Persvold 2011-12-06  233  	.icr_read			= native_apic_icr_read,
44b111b519160e Steffen Persvold 2011-12-06  234  	.icr_write			= native_apic_icr_write,
44b111b519160e Steffen Persvold 2011-12-06  235  };
44b111b519160e Steffen Persvold 2011-12-06  236  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
