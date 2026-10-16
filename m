Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB182EEE86;
	Fri, 16 Oct 2026 01:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792113748; cv=none; b=j+mK/4mLsxsePiNdv0FGbRwLMX98+x6tKsfGQ0hBIHMEa524YkD5w5p22rVbYWdOIvTV6TxhJmE/zgowijcauBwBUn91YgPPrWvBMPqH6QikGESPUo6sfwJf6GPJrCmdcKMBp4Hm3ofWN/XPgabBTl24j/WL0xnTmz4cfmS7aho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792113748; c=relaxed/simple;
	bh=bCJAYOAU3VXH0Zf2LCUIzFgcgWksgl9XY7HRvox6UvA=;
	h=Date:From:Cc:Subject:Message-ID; b=Hb+1DJaf0ZNcOln4Gm4pMPj7romVKuATNHhvrywmEJKT1lxIRWaoEi12ivlfs8ud4jQIQIedJhzUF9cYTFzCLt/HjlQPM5mKDcZEjWEkWa0FxehCwj+3M6b1JmoqzsKdNibPdo2dk7Mi/sa27pi7CNb0NDKIR1kgkTSjb+lxebU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B3qiVqkx; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B3qiVqkx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792113747; x=1823649747;
  h=date:from:cc:subject:message-id;
  bh=bCJAYOAU3VXH0Zf2LCUIzFgcgWksgl9XY7HRvox6UvA=;
  b=B3qiVqkxTefJD/cu6gEwWrSn53922DVdG8tBvAYRl9OgA9wSYW3GEzb0
   r9mlfAYU5Zyz0AilK1aUF3NTwfmoEl82PhcDqdwyXfV/8gBI9F+kX2rF8
   oU/gGwcBpd1JDhCIj8+gLpx2hDG7g9FLO2Nfl89ypTY1FbHy3l06Q3m6p
   Bd+9NTdsT9ESAkjMSGZCUkpQZRAs2Ly9jz6yLcK3tYZdXN7P2Bvgl9Is1
   kNU9nuBv2KiMOHVet2g7u2DremvcV8s1GXhTqatnaaZ2G8/6P/mPRShOE
   XBPTngzn1N9itkXpvXGwqKF7b9k7hKnQrDzH4Zl9plpoL+PmAv32zDC9A
   w==;
X-CSE-ConnectionGUID: Qxm9Lh9vSeWK+LbWAGLT9A==
X-CSE-MsgGUID: gVWfHKVBQ/qJWjyRosqyxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="910345"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="910345"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 18:22:24 -0700
X-CSE-ConnectionGUID: G9uerjSvRkKhKb2oBY6ZZw==
X-CSE-MsgGUID: o4di6fN9RmWJ+MaY42UPIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="3657548"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 15 Oct 2026 18:22:23 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHWeK-00000000HO4-31k4;
	Fri, 16 Oct 2026 01:22:20 +0000
Date: Fri, 16 Oct 2026 09:21:43 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [leon-rdma:rxe-rust-v1 65/106] Unable to generate bindings:
 clang diagnosed error: rust/helpers/net/device.c:36:9: error: invalid
 application of 'sizeof' to bit-field
Message-ID: <202610160917.DsbpZfde-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

TO: Leon Romanovsky <leonro@nvidia.com>

Hi Leon,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rxe-rust-v1
head:   bb839a6cc0506a07f63d8931ee7cf500e82f362a
commit: 5909e537a0a6265f69309aac377dd5ab2a3672c4 [65/106] rust: net: Add borrowed network devices and notifier registrations
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20261016/202610160917.DsbpZfde-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610160917.DsbpZfde-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610160917.DsbpZfde-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
   |                                                   ~~~~~~~~~~ ^
   1 warning generated.
   In file included from rust/helpers/helpers.c:48:
   In file included from rust/helpers/blk.c:3:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
   |                                                   ~~~~~~~~~~ ^
   In file included from rust/helpers/helpers.c:80:
   rust/helpers/net/device.c:36:9: error: invalid application of 'sizeof' to bit-field
   36 |         return READ_ONCE(dev->priv_flags) & IFF_802_1Q_VLAN;
   |                ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
   49 |         compiletime_assert_rwonce_type(x);                              \
   |         ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
   |                            ^
   include/linux/compiler_types.h:663:9: note: expanded from macro '__native_word'
   663 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
   |                ^
   In file included from rust/helpers/helpers.c:80:
   rust/helpers/net/device.c:36:9: error: invalid application of 'sizeof' to bit-field
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
   49 |         compiletime_assert_rwonce_type(x);                              \
   |         ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
   |                            ^
   include/linux/compiler_types.h:663:38: note: expanded from macro '__native_word'
   663 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
   |                                             ^
   In file included from rust/helpers/helpers.c:80:
   rust/helpers/net/device.c:36:9: error: invalid application of 'sizeof' to bit-field
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
   49 |         compiletime_assert_rwonce_type(x);                              \
   |         ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
   |                            ^
   include/linux/compiler_types.h:664:9: note: expanded from macro '__native_word'
   664 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
   |                ^
   In file included from rust/helpers/helpers.c:80:
   rust/helpers/net/device.c:36:9: error: invalid application of 'sizeof' to bit-field
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
   49 |         compiletime_assert_rwonce_type(x);                              \
   |         ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
   |                            ^
   include/linux/compiler_types.h:664:37: note: expanded from macro '__native_word'
   664 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
   |                                            ^
   In file included from rust/helpers/helpers.c:80:
   rust/helpers/net/device.c:36:9: error: invalid application of 'sizeof' to bit-field
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
   49 |         compiletime_assert_rwonce_type(x);                              \
   |         ^
   include/asm-generic/rwonce.h:36:47: note: expanded from macro 'compiletime_assert_rwonce_type'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
   |                                                      ^
   In file included from rust/helpers/helpers.c:80:
   rust/helpers/net/device.c:36:9: error: address of bit-field requested
   36 |         return READ_ONCE(dev->priv_flags) & IFF_802_1Q_VLAN;
   |                ^         ~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
   50 |         __READ_ONCE(x);                                                 \
   |         ^           ~
   include/asm-generic/rwonce.h:44:70: note: expanded from macro '__READ_ONCE'
   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
   |                                                                       ^ ~
   clang diag: include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   1 warning and 6 errors generated.
   make[3]: *** [rust/Makefile:729: rust/helpers/helpers.o] Error 1
   clang diag: include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   rust/helpers/net/device.c:36:9: error: invalid application of 'sizeof' to bit-field
   rust/helpers/net/device.c:36:9: error: invalid application of 'sizeof' to bit-field
   rust/helpers/net/device.c:36:9: error: invalid application of 'sizeof' to bit-field
   rust/helpers/net/device.c:36:9: error: invalid application of 'sizeof' to bit-field
   rust/helpers/net/device.c:36:9: error: invalid application of 'sizeof' to bit-field
   rust/helpers/net/device.c:36:9: error: address of bit-field requested
   clang diag: include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>> Unable to generate bindings: clang diagnosed error: rust/helpers/net/device.c:36:9: error: invalid application of 'sizeof' to bit-field
   rust/helpers/net/device.c:36:9: error: invalid application of 'sizeof' to bit-field
   rust/helpers/net/device.c:36:9: error: invalid application of 'sizeof' to bit-field
   rust/helpers/net/device.c:36:9: error: invalid application of 'sizeof' to bit-field
   rust/helpers/net/device.c:36:9: error: invalid application of 'sizeof' to bit-field
   rust/helpers/net/device.c:36:9: error: address of bit-field requested

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
