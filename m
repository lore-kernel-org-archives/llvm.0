Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0371FF7C7;
	Wed, 26 Nov 2025 22:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764196468; cv=none; b=cMDOfeXcG8IybiuwHV3rTSVXJyrvqVy9NOSqOBm5YeEn3RtAqRgEsan7TI0KWOuHaQzo6r6AglNVObxDPB2nq8fMxwmeBCRemL+UQklK8vK83hJ8Ck/pzcOag5+94+bh5LpKFvIMROZJqhvBMzbqU/zOvdK/vxKgoGgRm54AtWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764196468; c=relaxed/simple;
	bh=3tsd/18QVXDKN2vmEYwXTtosJ8PTpLYYjlTwm2VjzdU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p7HEN2Ju+mKafitm+mhdy8D61ODdcSaUDIcVEOxQq2u3cHQ7bDMNNkaIsN9rFVIwHtcD7QgTr1Ht2Scj5l+xwjmclQ1M5mXIWc/7q98Hpmb4PJM5y3vMWvQA3bGDvvsjkfjRxzqYWL93dtkLMxOy45GClZw/0US+attBcx9r2Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SEWtpJjO; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SEWtpJjO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764196466; x=1795732466;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3tsd/18QVXDKN2vmEYwXTtosJ8PTpLYYjlTwm2VjzdU=;
  b=SEWtpJjO8EBd5KUpKA/aO3ow/idexLNt+vTbk2+LAu9C1a3AJdEnMhGY
   U7AVo07zj4vuGKnT2tVfXOY4TsFIWfuh37AFiqxZOD+CXaOghZdWCHwmE
   vS6DvP+BHLYX9GF6I+ZrTMIp8ylw/he9+B+d/dMBYp4r48yGIvkq2hDVJ
   WqynZYB5QHgjkzQbfof6VeySUbAlcyZZjSvF+7CrwMwbjoQwqDSQrPRJE
   0d3vR4jqDn8z3GHu2ksUidwuNcwWyvKfPVxGe2doPZzX5DNBWQoYLaBkh
   DXZY9mFZ4T+Bj09MIDx5UX/TbTBX/igW1QxrIG+yaQqjTByFN9L2j+dYL
   g==;
X-CSE-ConnectionGUID: P/ukgT3mR2qx83nkixX8ig==
X-CSE-MsgGUID: WgoTHDlcS26fUreZOaSufA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66135087"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="66135087"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 14:34:26 -0800
X-CSE-ConnectionGUID: IBrMk1HDQnC5phZt9CmM6A==
X-CSE-MsgGUID: 0qy5YB24SH2Shq2HafNHoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="197395565"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Nov 2025 14:34:25 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOO5f-000000003QL-0MSB;
	Wed, 26 Nov 2025 22:34:23 +0000
Date: Thu, 27 Nov 2025 06:33:34 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:for-kernelci 2/4] drivers/char/random.c:570:1: error: call to
 undeclared function 'arch_cmpxchg64_local'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202511270626.hCGshYma-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git for-kernelci
head:   36c8d6393fcd1f917beed0c0b3cbd2969cfda4c4
commit: 93d36d27a0ec6d3d42148038c6e3d50a443c8a16 [2/4] random: Use a lockless fast path for get_random_uXX()
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20251127/202511270626.hCGshYma-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511270626.hCGshYma-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511270626.hCGshYma-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/char/random.c:570:1: error: call to undeclared function 'arch_cmpxchg64_local'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     570 | DEFINE_BATCHED_ENTROPY(u8)
         | ^
   drivers/char/random.c:552:6: note: expanded from macro 'DEFINE_BATCHED_ENTROPY'
     552 |         if (cmpxchg64_local(&batch->posgen, next, next - 1) != next - 1) {      \
         |             ^
   include/linux/atomic/atomic-instrumented.h:4998:2: note: expanded from macro 'cmpxchg64_local'
    4998 |         raw_cmpxchg64_local(__ai_ptr, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:399:29: note: expanded from macro 'raw_cmpxchg64_local'
     399 | #define raw_cmpxchg64_local arch_cmpxchg64_local
         |                             ^
   drivers/char/random.c:571:1: error: call to undeclared function 'arch_cmpxchg64_local'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     571 | DEFINE_BATCHED_ENTROPY(u16)
         | ^
   drivers/char/random.c:552:6: note: expanded from macro 'DEFINE_BATCHED_ENTROPY'
     552 |         if (cmpxchg64_local(&batch->posgen, next, next - 1) != next - 1) {      \
         |             ^
   include/linux/atomic/atomic-instrumented.h:4998:2: note: expanded from macro 'cmpxchg64_local'
    4998 |         raw_cmpxchg64_local(__ai_ptr, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:399:29: note: expanded from macro 'raw_cmpxchg64_local'
     399 | #define raw_cmpxchg64_local arch_cmpxchg64_local
         |                             ^
   drivers/char/random.c:572:1: error: call to undeclared function 'arch_cmpxchg64_local'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     572 | DEFINE_BATCHED_ENTROPY(u32)
         | ^
   drivers/char/random.c:552:6: note: expanded from macro 'DEFINE_BATCHED_ENTROPY'
     552 |         if (cmpxchg64_local(&batch->posgen, next, next - 1) != next - 1) {      \
         |             ^
   include/linux/atomic/atomic-instrumented.h:4998:2: note: expanded from macro 'cmpxchg64_local'
    4998 |         raw_cmpxchg64_local(__ai_ptr, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:399:29: note: expanded from macro 'raw_cmpxchg64_local'
     399 | #define raw_cmpxchg64_local arch_cmpxchg64_local
         |                             ^
   drivers/char/random.c:573:1: error: call to undeclared function 'arch_cmpxchg64_local'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     573 | DEFINE_BATCHED_ENTROPY(u64)
         | ^
   drivers/char/random.c:552:6: note: expanded from macro 'DEFINE_BATCHED_ENTROPY'
     552 |         if (cmpxchg64_local(&batch->posgen, next, next - 1) != next - 1) {      \
         |             ^
   include/linux/atomic/atomic-instrumented.h:4998:2: note: expanded from macro 'cmpxchg64_local'
    4998 |         raw_cmpxchg64_local(__ai_ptr, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:399:29: note: expanded from macro 'raw_cmpxchg64_local'
     399 | #define raw_cmpxchg64_local arch_cmpxchg64_local
         |                             ^
   4 errors generated.


vim +/arch_cmpxchg64_local +570 drivers/char/random.c

3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  569  
585cd5fe9f7378 Jason A. Donenfeld 2022-09-28 @570  DEFINE_BATCHED_ENTROPY(u8)
a890d1c657ecba Jason A. Donenfeld 2022-10-05  571  DEFINE_BATCHED_ENTROPY(u16)
a890d1c657ecba Jason A. Donenfeld 2022-10-05  572  DEFINE_BATCHED_ENTROPY(u32)
a890d1c657ecba Jason A. Donenfeld 2022-10-05  573  DEFINE_BATCHED_ENTROPY(u64)
3655adc7089da4 Jason A. Donenfeld 2022-02-11  574  

:::::: The code at line 570 was first introduced by commit
:::::: 585cd5fe9f7378601b1d4915ad6e9088333b5e5e random: add 8-bit and 16-bit batches

:::::: TO: Jason A. Donenfeld <Jason@zx2c4.com>
:::::: CC: Jason A. Donenfeld <Jason@zx2c4.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
