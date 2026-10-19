Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02D74F5E0F;
	Mon, 19 Oct 2026 13:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415312; cv=none; b=PdaXiFQoF6LBdwHDdY7MhoVKZIYdz5OQsCGQn6dcRs8TbOXeLb2eaGOkeVBjWyLuNs0tS/bcgDJWEmBhCARVHAd2x9gj1yRgFANExbGS7Tkq/zqF2axeK9li8IQFc9SqbXhHQYFqacC/L0TRULAOgOkbpOEoEQwmrpeA0vHUzOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415312; c=relaxed/simple;
	bh=q+f6QWMl7j8i6E3m6M3J/KJVYkqDsNVCMZSuXAQK3hE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GWjEtm+QqJowkvzbdMFkdt6ktWExvJXfJT5/VJljmP7O2RYI6PdEqey+zFYle0diyD9HN/g4smGup3x0yDtNzgO6bPPAKc/X0zbepIgrLiKBUsm4yfUTta5mHwEh+DOpXWuSVBzP98Zl47vSoVZIaaDM7ZcyltNWXP2c9PkDaa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fd5P8V3v; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fd5P8V3v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792415311; x=1823951311;
  h=date:from:to:cc:subject:message-id;
  bh=q+f6QWMl7j8i6E3m6M3J/KJVYkqDsNVCMZSuXAQK3hE=;
  b=fd5P8V3v7DPMs1rPkeHyLXM2IA0CG4RZQEqT0fJlB7KYxtEe/GY6nV9L
   dux1vze6wpfhF6+JUcHiHET4DN0a7si1bEayv1jPJeQ0mHFlNSRLYiaOk
   4+K6xJsLalthpWy77HNR9srsrRWvV1BG0TLU4APxMj8AsYpexCFH+QxEB
   ACgDbdjd8UCUQJbDgxXmKTJKsOiSPU9kIQYoLgVERb7ot12bWMZH8aF70
   6QDQX4gEZI7JGqHuJWTS/o+vxuHyglo8OXXIhU91jXxCo1E1sdirTTOgQ
   cbk4zqXbeou/MTDLZt1gkwnjIuqObew7Y9J/eQJ2ygnFbE6GVKyeY1ebY
   A==;
X-CSE-ConnectionGUID: sH0Eq7Q2Tbipcw041tEXMA==
X-CSE-MsgGUID: SAj8OEL/T1SHtvFdJLOM3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="979358"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="979358"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 06:08:30 -0700
X-CSE-ConnectionGUID: qTe2QUsgTeSw90xHtQ75rA==
X-CSE-MsgGUID: 3r8Fcl4dRHCSQi6iGL4Jjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2632378"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Oct 2026 06:08:29 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIn6I-00000000LiE-0iFW;
	Mon, 19 Oct 2026 13:08:26 +0000
Date: Mon, 19 Oct 2026 21:08:10 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-rm-ldmxcsr 54/55]
 lib/raid/xor/x86/xor-sse.c:435:2: error: call to undeclared function
 'kernel_fpu_begin_mask'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202610192057.l8bmrIHr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-rm-ldmxcsr
head:   bfbfcfc62eeabb32ed80c920f158a9262aadeb89
commit: a86e2a52063aaf13992ddd8ba68a42798d6d1faf [54/55] raid: Opt out of initializing MXCSR and 387 state
config: um-randconfig-1000-20261019 (https://download.01.org/0day-ci/archive/20261019/202610192057.l8bmrIHr-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6719b9e31d6a93099612c474eec76d9f41d0275a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610192057.l8bmrIHr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610192057.l8bmrIHr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/raid/xor/x86/xor-sse.c:435:2: error: call to undeclared function 'kernel_fpu_begin_mask'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     435 |         kernel_fpu_begin_mask(0);
         |         ^
   lib/raid/xor/x86/xor-sse.c:451:2: error: call to undeclared function 'kernel_fpu_begin_mask'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     451 |         kernel_fpu_begin_mask(0);
         |         ^
   2 errors generated.
--
>> lib/raid/xor/x86/xor-avx.c:148:2: error: call to undeclared function 'kernel_fpu_begin_mask'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     148 |         kernel_fpu_begin_mask(0);
         |         ^
   1 error generated.


vim +/kernel_fpu_begin_mask +435 lib/raid/xor/x86/xor-sse.c

   431	
   432	static void xor_gen_sse(void *dest, void **srcs, unsigned int src_cnt,
   433				unsigned int bytes)
   434	{
 > 435		kernel_fpu_begin_mask(0);
   436		xor_gen_sse_inner(dest, srcs, src_cnt, bytes);
   437		kernel_fpu_end();
   438	}
   439	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
