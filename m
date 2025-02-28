Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AD917BA3;
	Fri, 28 Feb 2025 03:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740714928; cv=none; b=IR+8eBkn42ek1J49iI9pofrTkQdaUUnOi6ddFi7HPAf2KIgSw8A/eAVaqc32yDzzn/i1zKvlWVWDg7itLJb8hNp7ed+SMNiguQfkwS0z5JBllwVLfyyd9+RLKVBaJEiTxEaNuO+nbBKYyT+iKcHvLQW/Nueuu3PDJQId9UQER98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740714928; c=relaxed/simple;
	bh=llyHHsG1VZ/VARbVGPtK+tEMngxC6yU3SXGG96JBmiY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l9B1v3dOQaps+Oh3ix3ehWmtbPOIKB4NqQ75D6gee88Rgjq+wnzrjMYn25JMm2rT7Ofo1rshcZ0FhDr9S6jzKPus3yVRQyM1BnxRf8xd+mDn0G5w2Qmhp9xwr2qlWOiUxB64gbFTIixHpXEnIbxm80Lp5gqHzBNax2ySsUvnD+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hld6rpuT; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hld6rpuT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740714927; x=1772250927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=llyHHsG1VZ/VARbVGPtK+tEMngxC6yU3SXGG96JBmiY=;
  b=Hld6rpuT1XMybqyoK5h1vcCPw0uWotuPZyNYzd/q43NB3O4J6l7pVqa+
   4PIPSbuCCzsn4DDeWFw+Vtz/m4MOgMnCJwCVRBict0Od7WzrrJ4OK1yb6
   sHY5cGQjE6Hs+V9HN48twdjispu/+cWQTrlUqVCRqSp56YwzXD7p1GSlV
   nYITDa4mkBJuvpIiQsMbsJlz5r7qjQxL3M57FjjoUo8gCfeig3pCaOnRL
   waYeZpHUzQVvPZ9th6Ed503DECXomA+wcthjHp4bfodbpj6G+40M3Kb6a
   7MmwUiYEmhNnEt6qP8c8yx6j5DGnUwlR3Hf/xienBFef5sNprnQv/e9W0
   Q==;
X-CSE-ConnectionGUID: g5b6a5VHRX2EvMmSu6nmlQ==
X-CSE-MsgGUID: SoNDG+DwS06r2jBjtfNcjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="53025399"
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; 
   d="scan'208";a="53025399"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 19:55:26 -0800
X-CSE-ConnectionGUID: 4NoNO4c3SEmyMbGRjE5tBA==
X-CSE-MsgGUID: /dilRKRnRySB1CLz6B2MBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; 
   d="scan'208";a="117252670"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 27 Feb 2025 19:55:24 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnrT8-000EOo-0X;
	Fri, 28 Feb 2025 03:55:22 +0000
Date: Fri, 28 Feb 2025 11:54:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 2690/5524] lib/tests/bitfield_kunit.c:119:13:
 warning: implicit conversion from 'unsigned long long' to 'unsigned int'
 changes value from 9223372036854775808 to 0
Message-ID: <202502281153.TG2XK5SI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kees,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
commit: 0ef71a1dc3a5355f229e2869e97de94e8e7ec7d0 [2690/5524] Merge branch 'for-next/hardening' into for-next/kspp
config: powerpc-randconfig-003-20250228 (https://download.01.org/0day-ci/archive/20250228/202502281153.TG2XK5SI-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502281153.TG2XK5SI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502281153.TG2XK5SI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from lib/tests/bitfield_kunit.c:8:
   In file included from include/kunit/test.h:20:
   In file included from include/linux/jump_label.h:257:
   In file included from include/linux/atomic.h:7:
   In file included from arch/powerpc/include/asm/atomic.h:11:
   In file included from arch/powerpc/include/asm/cmpxchg.h:755:
   In file included from include/asm-generic/cmpxchg-local.h:6:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/powerpc/include/asm/irqflags.h:12:
   In file included from arch/powerpc/include/asm/hw_irq.h:12:
   In file included from arch/powerpc/include/asm/ptrace.h:342:
   include/linux/thread_info.h:225:26: error: expected parameter declarator
     225 | DECLARE_STATIC_KEY_MAYBE(CONFIG_HARDENED_USERCOPY_DEFAULT_ON,
         |                          ^
   ./include/generated/autoconf.h:1888:45: note: expanded from macro 'CONFIG_HARDENED_USERCOPY_DEFAULT_ON'
    1888 | #define CONFIG_HARDENED_USERCOPY_DEFAULT_ON 1
         |                                             ^
   In file included from lib/tests/bitfield_kunit.c:8:
   In file included from include/kunit/test.h:20:
   In file included from include/linux/jump_label.h:257:
   In file included from include/linux/atomic.h:7:
   In file included from arch/powerpc/include/asm/atomic.h:11:
   In file included from arch/powerpc/include/asm/cmpxchg.h:755:
   In file included from include/asm-generic/cmpxchg-local.h:6:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/powerpc/include/asm/irqflags.h:12:
   In file included from arch/powerpc/include/asm/hw_irq.h:12:
   In file included from arch/powerpc/include/asm/ptrace.h:342:
   include/linux/thread_info.h:225:26: error: expected ')'
   ./include/generated/autoconf.h:1888:45: note: expanded from macro 'CONFIG_HARDENED_USERCOPY_DEFAULT_ON'
    1888 | #define CONFIG_HARDENED_USERCOPY_DEFAULT_ON 1
         |                                             ^
   include/linux/thread_info.h:225:25: note: to match this '('
     225 | DECLARE_STATIC_KEY_MAYBE(CONFIG_HARDENED_USERCOPY_DEFAULT_ON,
         |                         ^
   include/linux/thread_info.h:225:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     225 | DECLARE_STATIC_KEY_MAYBE(CONFIG_HARDENED_USERCOPY_DEFAULT_ON,
         | ^
         | int
   include/linux/thread_info.h:225:25: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
     225 | DECLARE_STATIC_KEY_MAYBE(CONFIG_HARDENED_USERCOPY_DEFAULT_ON,
         |                         ^
     226 |                            validate_usercopy_range);
         |                                                   
         |                                                   void
   include/linux/thread_info.h:232:6: error: call to undeclared function 'static_branch_maybe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     232 |             static_branch_maybe(CONFIG_HARDENED_USERCOPY_DEFAULT_ON,
         |             ^
   include/linux/thread_info.h:233:6: error: use of undeclared identifier 'validate_usercopy_range'
     233 |                                 &validate_usercopy_range)) {
         |                                  ^
>> lib/tests/bitfield_kunit.c:119:13: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 9223372036854775808 to 0 [-Wconstant-conversion]
     119 |         CHECK(u64, 0x8000000000000000ull);
         |         ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   lib/tests/bitfield_kunit.c:98:34: note: expanded from macro 'CHECK'
      98 |                 for (v = 0; v < 1 << hweight32(mask); v++)              \
         |                                      ~~~~~~~~~~^~~~~
   include/asm-generic/bitops/const_hweight.h:28:89: note: expanded from macro 'hweight32'
      28 | #define hweight32(w) (__builtin_constant_p(w) ? __const_hweight32(w) : __arch_hweight32(w))
         |                                                                        ~~~~~~~~~~~~~~~~ ^
   lib/tests/bitfield_kunit.c:120:13: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 9151314442816847872 to 0 [-Wconstant-conversion]
     120 |         CHECK(u64, 0x7f00000000000000ull);
         |         ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   lib/tests/bitfield_kunit.c:98:34: note: expanded from macro 'CHECK'
      98 |                 for (v = 0; v < 1 << hweight32(mask); v++)              \
         |                                      ~~~~~~~~~~^~~~~
   include/asm-generic/bitops/const_hweight.h:28:89: note: expanded from macro 'hweight32'
      28 | #define hweight32(w) (__builtin_constant_p(w) ? __const_hweight32(w) : __arch_hweight32(w))
         |                                                                        ~~~~~~~~~~~~~~~~ ^
   lib/tests/bitfield_kunit.c:121:13: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 422212465065984 to 0 [-Wconstant-conversion]
     121 |         CHECK(u64, 0x0001800000000000ull);
         |         ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   lib/tests/bitfield_kunit.c:98:34: note: expanded from macro 'CHECK'
      98 |                 for (v = 0; v < 1 << hweight32(mask); v++)              \
         |                                      ~~~~~~~~~~^~~~~
   include/asm-generic/bitops/const_hweight.h:28:89: note: expanded from macro 'hweight32'
      28 | #define hweight32(w) (__builtin_constant_p(w) ? __const_hweight32(w) : __arch_hweight32(w))
         |                                                                        ~~~~~~~~~~~~~~~~ ^
   lib/tests/bitfield_kunit.c:125:13: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 8455716864 to 4160749568 [-Wconstant-conversion]
     125 |         CHECK(u64, 0x0000001f8000000ull);
         |         ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   lib/tests/bitfield_kunit.c:98:34: note: expanded from macro 'CHECK'
      98 |                 for (v = 0; v < 1 << hweight32(mask); v++)              \
         |                                      ~~~~~~~~~~^~~~~
   include/asm-generic/bitops/const_hweight.h:28:89: note: expanded from macro 'hweight32'
      28 | #define hweight32(w) (__builtin_constant_p(w) ? __const_hweight32(w) : __arch_hweight32(w))
         |                                                                        ~~~~~~~~~~~~~~~~ ^
   4 warnings and 6 errors generated.


vim +119 lib/tests/bitfield_kunit.c

0e2dc70e3d0d50 lib/test_bitfield.c  Johannes Berg     2018-06-20   94  
0e2dc70e3d0d50 lib/test_bitfield.c  Johannes Berg     2018-06-20   95  #define CHECK(tp, mask) do {						\
0e2dc70e3d0d50 lib/test_bitfield.c  Johannes Berg     2018-06-20   96  		u64 v;							\
0e2dc70e3d0d50 lib/test_bitfield.c  Johannes Berg     2018-06-20   97  									\
0e2dc70e3d0d50 lib/test_bitfield.c  Johannes Berg     2018-06-20   98  		for (v = 0; v < 1 << hweight32(mask); v++)		\
d2585f5164c298 lib/bitfield_kunit.c Vitor Massaru Iha 2020-07-29   99  			KUNIT_ASSERT_FALSE(context,			\
d2585f5164c298 lib/bitfield_kunit.c Vitor Massaru Iha 2020-07-29  100  				tp##_encode_bits(v, mask) != v << __ffs64(mask));\
0e2dc70e3d0d50 lib/test_bitfield.c  Johannes Berg     2018-06-20  101  	} while (0)
0e2dc70e3d0d50 lib/test_bitfield.c  Johannes Berg     2018-06-20  102  
d2585f5164c298 lib/bitfield_kunit.c Vitor Massaru Iha 2020-07-29  103  static void __init test_bitfields_variables(struct kunit *context)
0e2dc70e3d0d50 lib/test_bitfield.c  Johannes Berg     2018-06-20  104  {
0e2dc70e3d0d50 lib/test_bitfield.c  Johannes Berg     2018-06-20  105  	CHECK(u8, 0x0f);
0e2dc70e3d0d50 lib/test_bitfield.c  Johannes Berg     2018-06-20  106  	CHECK(u8, 0xf0);
0e2dc70e3d0d50 lib/test_bitfield.c  Johannes Berg     2018-06-20  107  	CHECK(u8, 0x38);
0e2dc70e3d0d50 lib/test_bitfield.c  Johannes Berg     2018-06-20  108  
0e2dc70e3d0d50 lib/test_bitfield.c  Johannes Berg     2018-06-20  109  	CHECK(u16, 0x0038);
0e2dc70e3d0d50 lib/test_bitfield.c  Johannes Berg     2018-06-20  110  	CHECK(u16, 0x0380);
0e2dc70e3d0d50 lib/test_bitfield.c  Johannes Berg     2018-06-20  111  	CHECK(u16, 0x3800);
0e2dc70e3d0d50 lib/test_bitfield.c  Johannes Berg     2018-06-20  112  	CHECK(u16, 0x8000);
0e2dc70e3d0d50 lib/test_bitfield.c  Johannes Berg     2018-06-20  113  
0e2dc70e3d0d50 lib/test_bitfield.c  Johannes Berg     2018-06-20  114  	CHECK(u32, 0x80000000);
0e2dc70e3d0d50 lib/test_bitfield.c  Johannes Berg     2018-06-20  115  	CHECK(u32, 0x7f000000);
0e2dc70e3d0d50 lib/test_bitfield.c  Johannes Berg     2018-06-20  116  	CHECK(u32, 0x07e00000);
0e2dc70e3d0d50 lib/test_bitfield.c  Johannes Berg     2018-06-20  117  	CHECK(u32, 0x00018000);
0e2dc70e3d0d50 lib/test_bitfield.c  Johannes Berg     2018-06-20  118  
0e2dc70e3d0d50 lib/test_bitfield.c  Johannes Berg     2018-06-20 @119  	CHECK(u64, 0x8000000000000000ull);
0e2dc70e3d0d50 lib/test_bitfield.c  Johannes Berg     2018-06-20  120  	CHECK(u64, 0x7f00000000000000ull);
0e2dc70e3d0d50 lib/test_bitfield.c  Johannes Berg     2018-06-20  121  	CHECK(u64, 0x0001800000000000ull);
0e2dc70e3d0d50 lib/test_bitfield.c  Johannes Berg     2018-06-20  122  	CHECK(u64, 0x0000000080000000ull);
0e2dc70e3d0d50 lib/test_bitfield.c  Johannes Berg     2018-06-20  123  	CHECK(u64, 0x000000007f000000ull);
0e2dc70e3d0d50 lib/test_bitfield.c  Johannes Berg     2018-06-20  124  	CHECK(u64, 0x0000000018000000ull);
0e2dc70e3d0d50 lib/test_bitfield.c  Johannes Berg     2018-06-20  125  	CHECK(u64, 0x0000001f8000000ull);
0e2dc70e3d0d50 lib/test_bitfield.c  Johannes Berg     2018-06-20  126  }
0e2dc70e3d0d50 lib/test_bitfield.c  Johannes Berg     2018-06-20  127  

:::::: The code at line 119 was first introduced by commit
:::::: 0e2dc70e3d0d503b0cc9c5f74db3eb6db52c9e22 bitfield: add tests

:::::: TO: Johannes Berg <johannes@sipsolutions.net>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
