Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E7510E3;
	Fri, 19 Apr 2024 02:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713495139; cv=none; b=s3CIljND/X6L4ekkzzpd2sh9gstUipfqgK0WI79ltENSrenmfBjLglDazSC2XZm44oWvgZPsvC8f60xhDvmz2Oq4tQLZRMW/2j4+xFdORef1V+SV9muoLnjoSrlMD6E9FXRuyytKMFZHGVoAVDqclbdBTIxZiZXzgjWOHHIwOcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713495139; c=relaxed/simple;
	bh=iYsC5wS5yzouBsYmQHmbqltVIfjZJhkBUK1fRuyWjkA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OKpRh5wEOeQ3lK5sWxpuGtk/XMgmHE0Ramwb+E36+Tfros6Vk8dSq2hcHdho7vfL1TmcOH+7XfZ/gy0lxAR1jVvFf9Vsh3meEFKdkCOY+zH/thByIc06Jb/vtwzj0YyKQ2Fl4s8ibzMTQISZ8LRcivT88H2QArgEkGg2r9J5z1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JOb7/jE9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JOb7/jE9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713495137; x=1745031137;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iYsC5wS5yzouBsYmQHmbqltVIfjZJhkBUK1fRuyWjkA=;
  b=JOb7/jE9p+5aJic8yu0msOgDV3QtKRQFaoLOHBVgXSk8g1OFL93YhIcI
   dTf51Vg5HwY4kAmCGVSEfEHKgbJzQm2tKPMQEL9JEMLE7Zn04nXMdjezl
   KNkQLolUeHcP2JMdhfdiJTF/wK3zi7B1/xUkjmnLPtGR8YdUogzsK7TBj
   EqGQLae9RsN1VFgF2gJ5APH10f7OmXaTa2fnmdiDjF1Ks97OCAhxyKInU
   oteKGtc0jiEBlVK7IQBSiBvmT1SEP2JW87SqtlFo4K6Ou9bjQ05sz7IO6
   mfk7glE7fqK6Jq7v5TmSjAb28ir2aCG5iRb7UlHODM8vXbI+nofgp0Uta
   Q==;
X-CSE-ConnectionGUID: Gt70yqfAR2GCQlLMy8YzNQ==
X-CSE-MsgGUID: lWa7gWo1RquuhatCNvYmpg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="34477955"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="34477955"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 19:52:16 -0700
X-CSE-ConnectionGUID: yE2zBEJtSLub0L1mAACBig==
X-CSE-MsgGUID: QxrmNeASSUi/Fy330y+J1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="54399883"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 18 Apr 2024 19:52:15 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxeMH-0009XI-1g;
	Fri, 19 Apr 2024 02:52:13 +0000
Date: Fri, 19 Apr 2024 10:51:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-tdx-asm 41/41] arch/x86/hyperv/ivm.c:395:12: error:
 call to undeclared function '__tdx_hypercall'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202404191044.kNOxYlUp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-tdx-asm
head:   c579a842993d071476b16a8c24221b1ed3387b35
commit: c579a842993d071476b16a8c24221b1ed3387b35 [41/41] drop unused TDCALL wrappers
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240419/202404191044.kNOxYlUp-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404191044.kNOxYlUp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404191044.kNOxYlUp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/hyperv/ivm.c:395:12: error: call to undeclared function '__tdx_hypercall'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     395 |         u64 ret = __tdx_hypercall(&args);
         |                   ^
   arch/x86/hyperv/ivm.c:395:12: note: did you mean 'hv_tdx_hypercall'?
   include/asm-generic/mshyperv.h:288:5: note: 'hv_tdx_hypercall' declared here
     288 | u64 hv_tdx_hypercall(u64 control, u64 param1, u64 param2);
         |     ^
   arch/x86/hyperv/ivm.c:408:12: error: call to undeclared function '__tdx_hypercall'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     408 |         u64 ret = __tdx_hypercall(&args);
         |                   ^
   arch/x86/hyperv/ivm.c:424:8: error: call to undeclared function '__tdx_hypercall'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     424 |         (void)__tdx_hypercall(&args);
         |               ^
   3 errors generated.


vim +/__tdx_hypercall +395 arch/x86/hyperv/ivm.c

d3a9d7e49d1531 Dexuan Cui 2023-08-24  384  
b9b4fe3a72b60c Dexuan Cui 2023-08-24  385  #ifdef CONFIG_INTEL_TDX_GUEST
b9b4fe3a72b60c Dexuan Cui 2023-08-24  386  static void hv_tdx_msr_write(u64 msr, u64 val)
b9b4fe3a72b60c Dexuan Cui 2023-08-24  387  {
8a8544bde858e5 Kai Huang  2023-08-15  388  	struct tdx_module_args args = {
b9b4fe3a72b60c Dexuan Cui 2023-08-24  389  		.r10 = TDX_HYPERCALL_STANDARD,
b9b4fe3a72b60c Dexuan Cui 2023-08-24  390  		.r11 = EXIT_REASON_MSR_WRITE,
b9b4fe3a72b60c Dexuan Cui 2023-08-24  391  		.r12 = msr,
b9b4fe3a72b60c Dexuan Cui 2023-08-24  392  		.r13 = val,
b9b4fe3a72b60c Dexuan Cui 2023-08-24  393  	};
b9b4fe3a72b60c Dexuan Cui 2023-08-24  394  
b9b4fe3a72b60c Dexuan Cui 2023-08-24 @395  	u64 ret = __tdx_hypercall(&args);
b9b4fe3a72b60c Dexuan Cui 2023-08-24  396  
b9b4fe3a72b60c Dexuan Cui 2023-08-24  397  	WARN_ONCE(ret, "Failed to emulate MSR write: %lld\n", ret);
b9b4fe3a72b60c Dexuan Cui 2023-08-24  398  }
b9b4fe3a72b60c Dexuan Cui 2023-08-24  399  

:::::: The code at line 395 was first introduced by commit
:::::: b9b4fe3a72b60c8d74a9ffb61aa778f04eaddd87 x86/hyperv: Use TDX GHCI to access some MSRs in a TDX VM with the paravisor

:::::: TO: Dexuan Cui <decui@microsoft.com>
:::::: CC: Wei Liu <wei.liu@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
