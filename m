Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999A126771F;
	Tue, 29 Apr 2025 20:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745959790; cv=none; b=not0kbjb4DL3GX3TsjGEqxKPHkfbOjuQSkgEGKSIAaiV8wu2cO2KH8hwOUOI8COyzXMakAUvnT4XdhmfcPPYgtM6orDlknXZRDduR1FWRvKmESulpD7WCwIidQ7eSbxoAKVVLYQN/5/x+L93cwZRc7s4ys/v+V7S1EwUBVz1mVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745959790; c=relaxed/simple;
	bh=2TsJPzitKfRPXDhgrE5k4Zj8BIskIlg82RTg8R48FGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D8dyfgJyqfAa3zZv5aYS0XuoFKT5RusQEfnMyt9VKU0YyJ7dO/Q8XIgG1CejKKiWnzEKO4tE51rVBR32GnruKbcaQnjtJSchPnOl2WFoJj3iGEWbWPY/Kw6wFHGA5+82RkTqU2XxXc4BvLeEpvPOW6FbfDTedsp822Snb50uDIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C2cojefH; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2cojefH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745959789; x=1777495789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2TsJPzitKfRPXDhgrE5k4Zj8BIskIlg82RTg8R48FGw=;
  b=C2cojefHuSlPN4UYXtxEKyJJJJp5eKYvEfAHrIxJHQu14voqhW8tAkIU
   aBmH4KOEcBnj/OE5f/pQg30O5wMGUrxmFvzuhix2LIztrH1cdR60Kyzsd
   8a/ZodT4ND4SH3Avwqbf2CvZ5MEu9F0RaUmY97PUpM7FVlHEtdha+MBo0
   VklhQSfxfPeZcmTrn3c9O52h3YRt8V6tqpoCQrhq3VkPqxRYFtJH9B33v
   mg6jKUleTkuROgOXSTNN/+WInZW6m+rMflSCRJ5DK9r2moGxFKr0YkKgd
   YJjaYqpC6jwx98sqhfOXcsAbdlhCz+s5MWpgYQ1fXC1F818nbhMNcUZAd
   g==;
X-CSE-ConnectionGUID: lNcpvDNFTA+EvkH8D0U9Ow==
X-CSE-MsgGUID: Q5lZFJRcSvmCgXXWtdy+Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="58966499"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="58966499"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 13:49:44 -0700
X-CSE-ConnectionGUID: NEzo0ZNPS4Gr7FTS5UBQmA==
X-CSE-MsgGUID: 7GerdhgLT7y1ZTkMTBv6zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="134434106"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Apr 2025 13:49:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9rtd-0002vt-1V;
	Tue, 29 Apr 2025 20:49:41 +0000
Date: Wed, 30 Apr 2025 04:48:45 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/core 12/14] arch/x86/hyperv/ivm.c:395:60: warning:
 non-void function does not return a value
Message-ID: <202504300410.yCsLT0DE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
head:   a4f560f88ebe36d504463b63e648dbf3468f836c
commit: 34c83ece500350809581ca9365b38908a8973471 [12/14] x86,hyperv: Clean up hv_do_hypercall()
config: x86_64-buildonly-randconfig-002-20250430 (https://download.01.org/0day-ci/archive/20250430/202504300410.yCsLT0DE-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300410.yCsLT0DE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300410.yCsLT0DE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/hyperv/ivm.c:395:60: warning: non-void function does not return a value [-Wreturn-type]
     395 | u64 hv_snp_hypercall(u64 control, u64 param1, u64 param2) {}
         |                                                            ^
   arch/x86/hyperv/ivm.c:445:60: warning: non-void function does not return a value [-Wreturn-type]
     445 | u64 hv_tdx_hypercall(u64 control, u64 param1, u64 param2) {}
         |                                                            ^
   arch/x86/hyperv/ivm.c:393:20: warning: unused function 'hv_ghcb_msr_write' [-Wunused-function]
     393 | static inline void hv_ghcb_msr_write(u64 msr, u64 value) {}
         |                    ^~~~~~~~~~~~~~~~~
   arch/x86/hyperv/ivm.c:394:20: warning: unused function 'hv_ghcb_msr_read' [-Wunused-function]
     394 | static inline void hv_ghcb_msr_read(u64 msr, u64 *value) {}
         |                    ^~~~~~~~~~~~~~~~
   arch/x86/hyperv/ivm.c:443:20: warning: unused function 'hv_tdx_msr_write' [-Wunused-function]
     443 | static inline void hv_tdx_msr_write(u64 msr, u64 value) {}
         |                    ^~~~~~~~~~~~~~~~
   arch/x86/hyperv/ivm.c:444:20: warning: unused function 'hv_tdx_msr_read' [-Wunused-function]
     444 | static inline void hv_tdx_msr_read(u64 msr, u64 *value) {}
         |                    ^~~~~~~~~~~~~~~
   6 warnings generated.


vim +395 arch/x86/hyperv/ivm.c

   391	
   392	#else
   393	static inline void hv_ghcb_msr_write(u64 msr, u64 value) {}
   394	static inline void hv_ghcb_msr_read(u64 msr, u64 *value) {}
 > 395	u64 hv_snp_hypercall(u64 control, u64 param1, u64 param2) {}
   396	#endif /* CONFIG_AMD_MEM_ENCRYPT */
   397	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
