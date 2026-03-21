Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D88F310762;
	Sat, 21 Mar 2026 09:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774086948; cv=none; b=mDff9BkXEuolXLjty5b+L+LJADmX6B097WHoOdJhyFHVVTn05YQaus/cQv4BqOyJsPNS5/VczCBqcSYQ3/tKND/xZjD70MWfONIweeDcIsSZG1IL1OZb3WHrxBxAE/8crAnDl+0xvAFqUU0rjtlAuSl5BcDNGPU/P2iDl/J5+1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774086948; c=relaxed/simple;
	bh=iIDckQuJYj6FLu3ZR+j+iDEfOkownsygLzYyLZVB3hY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fITOT9K1VAR6lFvQ6bcjGXi1xKUfYq2y84rQHpkH5NaETNrJHwdeIQlQuuXYDkYobiB+lbD7kj+CvBITdVn6zOkFe1ZEcfB+UiY5svhrxqUvR6WwFqlLx+Q3kK5PJqwSRs6PvCQl6Af7kp+7ORzlGnIM2DxdejwAwEsagc5ugzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AHxZpABt; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AHxZpABt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774086946; x=1805622946;
  h=date:from:to:cc:subject:message-id;
  bh=iIDckQuJYj6FLu3ZR+j+iDEfOkownsygLzYyLZVB3hY=;
  b=AHxZpABtEnEzUWlhhcBzvQ25ze202FXmcG4OhG9HFRv0DTx6VeTBywxm
   OB9beo1fpACusWhXXblsU8iRVpQZ7tp3mw7uSzpsPBlaHdB/BMoTQHV6d
   VQvTicCcy7mQ7tj3tdKlOLyb6juhzzvv6AoaaMjJP5wh0dZfiEihSW4+T
   ptpVondAIxgvT2FoxwOLKUbmNwWlFtaJV2GKJOVtSl8zHuon1BfDtt5oS
   pKVBbiPlbu/zkb4r8pmOyLhBbuDqYoCENhqNClymVvsLj/jfN30HpaiLF
   LBgE//b/kDGrDogd/TDC62NUgdBrmKwpN1KnloS+KaI5g2nZ74oQuMYFN
   w==;
X-CSE-ConnectionGUID: KSy2IJNuRZ24ZGjI0mQGFw==
X-CSE-MsgGUID: uDKkD9FSQkWT9+nSw3y2PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75046965"
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="75046965"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 02:55:44 -0700
X-CSE-ConnectionGUID: K9c5eWw6RnyPMaS2Bq1E+Q==
X-CSE-MsgGUID: wovMpdiSTs+ey5Kp5jgINg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="246560428"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 21 Mar 2026 02:55:42 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3t3T-000000000ZV-44CS;
	Sat, 21 Mar 2026 09:55:39 +0000
Date: Sat, 21 Mar 2026 17:55:36 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:libcrypto-pending 38/50] crypto/sha1.c:23:15:
 error: static assertion failed due to requirement 'sizeof(struct sha1_ctx) ==
 sizeof(struct sha1_state)': sizeof(struct sha1_ctx) == sizeof(struct
 sha1_state)
Message-ID: <202603211729.eY5qHyS4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git libcrypto-pending
head:   68eff526dd94e97b9b25a9c01865062bc99264b0
commit: 06e5e9868540eb7be8630b1466d1571b52f3c82f [38/50] lib/crypto: sha1: Explicitly specify alignment of sha1_ctx::buf
config: i386-randconfig-013-20260321 (https://download.01.org/0day-ci/archive/20260321/202603211729.eY5qHyS4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603211729.eY5qHyS4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603211729.eY5qHyS4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> crypto/sha1.c:23:15: error: static assertion failed due to requirement 'sizeof(struct sha1_ctx) == sizeof(struct sha1_state)': sizeof(struct sha1_ctx) == sizeof(struct sha1_state)
      23 | static_assert(sizeof(struct sha1_ctx) == sizeof(struct sha1_state));
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   crypto/sha1.c:23:39: note: expression evaluates to '96 == 92'
      23 | static_assert(sizeof(struct sha1_ctx) == sizeof(struct sha1_state));
         |               ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
>> crypto/sha1.c:26:15: error: static assertion failed due to requirement '__builtin_offsetof(struct sha1_ctx, buf) == __builtin_offsetof(struct sha1_state, buffer)': offsetof(struct sha1_ctx, buf) == offsetof(struct sha1_state, buffer)
      26 | static_assert(offsetof(struct sha1_ctx, buf) == offsetof(struct sha1_state, buffer));
         | ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   crypto/sha1.c:26:46: note: expression evaluates to '32 == 28'
      26 | static_assert(offsetof(struct sha1_ctx, buf) == offsetof(struct sha1_state, buffer));
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   2 errors generated.


vim +23 crypto/sha1.c

8bc79ab67d78e2 Eric Biggers 2025-07-12  14  
b10a74abcfc5c6 Eric Biggers 2025-07-12  15  /*
b10a74abcfc5c6 Eric Biggers 2025-07-12  16   * Export and import functions.  crypto_shash wants a particular format that
b10a74abcfc5c6 Eric Biggers 2025-07-12  17   * matches that used by some legacy drivers.  It currently is the same as the
b10a74abcfc5c6 Eric Biggers 2025-07-12  18   * library SHA context, except the value in bytecount must be block-aligned and
b10a74abcfc5c6 Eric Biggers 2025-07-12  19   * the remainder must be stored in an extra u8 appended to the struct.
b10a74abcfc5c6 Eric Biggers 2025-07-12  20   */
b10a74abcfc5c6 Eric Biggers 2025-07-12  21  
b10a74abcfc5c6 Eric Biggers 2025-07-12  22  #define SHA1_SHASH_STATE_SIZE (sizeof(struct sha1_ctx) + 1)
b10a74abcfc5c6 Eric Biggers 2025-07-12 @23  static_assert(sizeof(struct sha1_ctx) == sizeof(struct sha1_state));
b10a74abcfc5c6 Eric Biggers 2025-07-12  24  static_assert(offsetof(struct sha1_ctx, state) == offsetof(struct sha1_state, state));
b10a74abcfc5c6 Eric Biggers 2025-07-12  25  static_assert(offsetof(struct sha1_ctx, bytecount) == offsetof(struct sha1_state, count));
b10a74abcfc5c6 Eric Biggers 2025-07-12 @26  static_assert(offsetof(struct sha1_ctx, buf) == offsetof(struct sha1_state, buffer));
b10a74abcfc5c6 Eric Biggers 2025-07-12  27  

:::::: The code at line 23 was first introduced by commit
:::::: b10a74abcfc5c61afc63a567c457038be57eeb6e crypto: sha1 - Use same state format as legacy drivers

:::::: TO: Eric Biggers <ebiggers@kernel.org>
:::::: CC: Eric Biggers <ebiggers@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
