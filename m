Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC13317A2EC;
	Sun, 30 Mar 2025 21:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743370906; cv=none; b=Z+h7qeUdpDjfMC16/7hwSzBCOjKJN6m3muNvvzKI0AcI1dZWE5DNOF0y2UpyHRfGmkm4+1IiWkxvqTgODxGqSQuiSaXtx49HbHDoVo3aQNacWbRBc+cOjqFdI6jp6L6X21BSoef50Pph0mN7wIxJjxFcjIjN6IjnDqnnX37TbWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743370906; c=relaxed/simple;
	bh=dyM4+v6OdarTsG96PaNrPHUQhZ7Fu5PGB33yTya4UXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z75WxVMuy98auxGDR530IV7KuOAASX+tQLurQPASHBOtV15T19RRKjO/74cmsPGLDSErNMtNbw+7IQPZJaxMJG+2Wlmwd2bW3ES6uoGTGANlGCzMbomk/P5iO6k+njXkBh9hMiONc2HNCM3WNgFL/hZz79iv82arfE8pgJ9gGCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NDtrO7Mq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NDtrO7Mq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743370905; x=1774906905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dyM4+v6OdarTsG96PaNrPHUQhZ7Fu5PGB33yTya4UXs=;
  b=NDtrO7MqI4iyygpv0YMd31CUnY6gjXp7O55vFrbPZUPBNjdXX7yFLa0x
   VJDsaLm9ys8S0zocDSvaOgjhUGwOPrsWdpZyxrwK6MDHNTkaq9x0B5oW8
   53OvZYQwMIw2Y3fAPKLMm2m3wugMCWhwNVvB/txYFNBWxE2t1tu0QheCv
   mOrtmEOW0qNNVryDbN8MEkyUtnffvDvRwvNelEUi6qu7heTIcOyrQ6SZx
   2Jx+Nz7PWcWUes0MhmBeE3b8mjAk+z090f8+FZnRi5dICKU6EBzI1Luru
   +BN+agJNfT3VM+QOi3RQ6MnyhtnWj6zsU1Yjc+AYxibcdH2TVRWmsbpUp
   w==;
X-CSE-ConnectionGUID: EzzWc4MyQY+T66Ldyvb6IQ==
X-CSE-MsgGUID: mhcWYdc0QaKQYg4LpDUvRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="48443408"
X-IronPort-AV: E=Sophos;i="6.14,289,1736841600"; 
   d="scan'208";a="48443408"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2025 14:41:44 -0700
X-CSE-ConnectionGUID: PJrS0EwjR8WmuYVL00cPHA==
X-CSE-MsgGUID: WDCoYuyoS7K6FVg4/Fkxiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,289,1736841600"; 
   d="scan'208";a="126173710"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 30 Mar 2025 14:41:42 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tz0PU-0008to-23;
	Sun, 30 Mar 2025 21:41:40 +0000
Date: Mon, 31 Mar 2025 05:40:44 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-crypto 9/12]
 arch/x86/crypto/sm4_aesni_avx2_glue.c:110:7: error: call to undeclared
 function 'cpu_has_xfeatures'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202503310513.JIGyzevF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-crypto
head:   5e0c73a309dc89400fca72e888f4879582465293
commit: 761d601c8ce5b23a4c90843f7d2ce55f75302516 [9/12] crypto: x86/sm4 - stop using the SIMD helper
config: x86_64-buildonly-randconfig-001-20250331 (https://download.01.org/0day-ci/archive/20250331/202503310513.JIGyzevF-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250331/202503310513.JIGyzevF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503310513.JIGyzevF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/crypto/sm4_aesni_avx2_glue.c:110:7: error: call to undeclared function 'cpu_has_xfeatures'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     110 |         if (!cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM,
         |              ^
   1 error generated.
--
>> arch/x86/crypto/sm4_aesni_avx_glue.c:49:3: error: call to undeclared function 'kernel_fpu_begin'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      49 |                 kernel_fpu_begin();
         |                 ^
>> arch/x86/crypto/sm4_aesni_avx_glue.c:63:3: error: call to undeclared function 'kernel_fpu_end'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      63 |                 kernel_fpu_end();
         |                 ^
   arch/x86/crypto/sm4_aesni_avx_glue.c:137:3: error: call to undeclared function 'kernel_fpu_begin'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     137 |                 kernel_fpu_begin();
         |                 ^
   arch/x86/crypto/sm4_aesni_avx_glue.c:173:3: error: call to undeclared function 'kernel_fpu_end'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     173 |                 kernel_fpu_end();
         |                 ^
   arch/x86/crypto/sm4_aesni_avx_glue.c:202:3: error: call to undeclared function 'kernel_fpu_begin'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     202 |                 kernel_fpu_begin();
         |                 ^
   arch/x86/crypto/sm4_aesni_avx_glue.c:231:3: error: call to undeclared function 'kernel_fpu_end'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     231 |                 kernel_fpu_end();
         |                 ^
>> arch/x86/crypto/sm4_aesni_avx_glue.c:324:7: error: call to undeclared function 'cpu_has_xfeatures'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     324 |         if (!cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM,
         |              ^
   7 errors generated.


vim +/cpu_has_xfeatures +110 arch/x86/crypto/sm4_aesni_avx2_glue.c

5b2efa2bb865eb Tianjia Zhang 2021-08-18   97  
5b2efa2bb865eb Tianjia Zhang 2021-08-18   98  static int __init sm4_init(void)
5b2efa2bb865eb Tianjia Zhang 2021-08-18   99  {
5b2efa2bb865eb Tianjia Zhang 2021-08-18  100  	const char *feature_name;
5b2efa2bb865eb Tianjia Zhang 2021-08-18  101  
5b2efa2bb865eb Tianjia Zhang 2021-08-18  102  	if (!boot_cpu_has(X86_FEATURE_AVX) ||
5b2efa2bb865eb Tianjia Zhang 2021-08-18  103  	    !boot_cpu_has(X86_FEATURE_AVX2) ||
5b2efa2bb865eb Tianjia Zhang 2021-08-18  104  	    !boot_cpu_has(X86_FEATURE_AES) ||
5b2efa2bb865eb Tianjia Zhang 2021-08-18  105  	    !boot_cpu_has(X86_FEATURE_OSXSAVE)) {
5b2efa2bb865eb Tianjia Zhang 2021-08-18  106  		pr_info("AVX2 or AES-NI instructions are not detected.\n");
5b2efa2bb865eb Tianjia Zhang 2021-08-18  107  		return -ENODEV;
5b2efa2bb865eb Tianjia Zhang 2021-08-18  108  	}
5b2efa2bb865eb Tianjia Zhang 2021-08-18  109  
5b2efa2bb865eb Tianjia Zhang 2021-08-18 @110  	if (!cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM,
5b2efa2bb865eb Tianjia Zhang 2021-08-18  111  				&feature_name)) {
5b2efa2bb865eb Tianjia Zhang 2021-08-18  112  		pr_info("CPU feature '%s' is not supported.\n", feature_name);
5b2efa2bb865eb Tianjia Zhang 2021-08-18  113  		return -ENODEV;
5b2efa2bb865eb Tianjia Zhang 2021-08-18  114  	}
5b2efa2bb865eb Tianjia Zhang 2021-08-18  115  
761d601c8ce5b2 Eric Biggers  2025-03-30  116  	return crypto_register_skciphers(sm4_aesni_avx2_skciphers,
761d601c8ce5b2 Eric Biggers  2025-03-30  117  					 ARRAY_SIZE(sm4_aesni_avx2_skciphers));
5b2efa2bb865eb Tianjia Zhang 2021-08-18  118  }
5b2efa2bb865eb Tianjia Zhang 2021-08-18  119  

:::::: The code at line 110 was first introduced by commit
:::::: 5b2efa2bb865eb784e06987c7ce98c3c835b495b crypto: x86/sm4 - add AES-NI/AVX2/x86_64 implementation

:::::: TO: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
