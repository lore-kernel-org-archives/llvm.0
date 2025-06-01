Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275D925F780;
	Sun,  1 Jun 2025 23:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748820339; cv=none; b=DiHYktBVVN95+cmOahiaTwHAF921TJzM5wY56DemoSr2NDeqIl4xdD6fU6tNGk93SLkVzRGDX1zL3XWk6LUq2pPDOX3rgrrPOaNE1oCY1AI5xFnYFBCSwTnEW7D03jDiQ1YhJjQmVO8t0Z808zoFsnhvcBTmX4RJBE49CMEJ9tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748820339; c=relaxed/simple;
	bh=nyVoVbw6is92ImfXkkazm71ZXz3L54g8SmMWcdgxB0A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bBrOcOolHTc6VE1h/gsJEt/jWb7kpz/O7XvNN0D0Jl5nHR3tyIvkBufPX9qMgAB9DwqwZllU9Cls1/IIWOtNypmNBoy37HX6h9/Rq+rGhWmsvtf1yuLLjaOFaQz/8Wgpf+Cev3bqTP4gif2t959fVR8QEzQMY9N5Glb/q8yLxKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G3xQ5hYo; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G3xQ5hYo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748820337; x=1780356337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nyVoVbw6is92ImfXkkazm71ZXz3L54g8SmMWcdgxB0A=;
  b=G3xQ5hYocJSWxSWdLnT9YY/au/fh9aLF7KsGEIBw7AgSwCNA3flcabLK
   A8H8nReUM1VqL6txLcHOQNyBNz0u2o6hwV+MJ9uCINeNKaNTG78Wr+cnI
   rKhcy31WpYQqLhFdZHV/uuQ1K/ryxOR9owuOAmKPDgG7kHbVJw0WKncuu
   owILH+c2GDbfitzumtUJOBnGpLd2Qk0F3vr/sH+V5UllQcaIqswuq/kw+
   nM8dRZka/jYSx7x59rD6boF1/JP9JksWI6f1QtELVReBzj3ZDqyR3sdX3
   Tw9UG7pXZFWvHnsJBsft9p8MqAWc9ow+b4wgsHwFl1R3UGVs/0SiKX3CH
   w==;
X-CSE-ConnectionGUID: K0hUpQAOS6mQ1AUBxVxPUw==
X-CSE-MsgGUID: iNfdur2nRj2Pn/RFoOWLEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="54630819"
X-IronPort-AV: E=Sophos;i="6.16,202,1744095600"; 
   d="scan'208";a="54630819"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2025 16:25:36 -0700
X-CSE-ConnectionGUID: SkavTO8PRSyKkPdzj4FMAQ==
X-CSE-MsgGUID: 7tE1ZVqwQCyg5emzdmfHxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,202,1744095600"; 
   d="scan'208";a="144365552"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Jun 2025 16:25:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLs3Y-000Z6i-2P;
	Sun, 01 Jun 2025 23:25:32 +0000
Date: Mon, 2 Jun 2025 07:25:20 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/bitmap-initializer 3/5]
 lib/tests/foreach_macros_kunit.c:18:39: warning: shift count >= width of
 type
Message-ID: <202506020750.h5ue0vJG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/bitmap-initializer
head:   a2f50b59c4c10c1b348be838a119c2ba4566c82a
commit: ad77b763a6de29773ece034131d2ffcc10708629 [3/5] lib/tests: add a KUnit test for linux/foreach_macros.h
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250602/202506020750.h5ue0vJG-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250602/202506020750.h5ue0vJG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506020750.h5ue0vJG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/tests/foreach_macros_kunit.c:18:39: warning: shift count >= width of type [-Wshift-count-overflow]
      18 |         static const u64 many_args      = FOREACH(FOREACH_BIT, 1, 2, 3, 15, 30, 63) FOREACH_END(0);
         |                                           ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/foreach_macros.h:20:47: note: expanded from macro 'FOREACH'
      20 |         __VA_OPT__(__FOREACH_EXPAND(__FOREACH_HELPER(MACRO, __VA_ARGS__)))
         |                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
   include/linux/foreach_macros.h:24:47: note: expanded from macro '__FOREACH_HELPER'
      24 |         __VA_OPT__(__FOREACH_AGAIN __FOREACH_PARENS (MACRO, __VA_ARGS__))
         |                                                      ^
   include/linux/foreach_macros.h:13:85: note: expanded from macro '__FOREACH_EXPAND'
      13 | #define __FOREACH_EXPAND(...) __FOREACH_EXPAND3(__FOREACH_EXPAND3(__FOREACH_EXPAND3(__VA_ARGS__)))
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
   note: (skipping 43 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/foreach_macros.h:16:32: note: expanded from macro '__FOREACH_EXPAND1'
      16 | #define __FOREACH_EXPAND1(...) __VA_ARGS__
         |                                ^
   include/linux/foreach_macros.h:16:32: note: expanded from macro '__FOREACH_EXPAND1'
   include/linux/foreach_macros.h:16:32: note: expanded from macro '__FOREACH_EXPAND1'
      16 | #define __FOREACH_EXPAND1(...) __VA_ARGS__
         |                                ^~~~~~~~~~~
   lib/tests/foreach_macros_kunit.c:22:82: warning: shift count >= width of type [-Wshift-count-overflow]
      22 |         KUNIT_EXPECT_EQ(test, many_args, BIT(1) | BIT(2) | BIT(3) | BIT(15) | BIT(30) | BIT(63));
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^
   include/kunit/test.h:968:34: note: expanded from macro 'KUNIT_EXPECT_EQ'
     968 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/kunit/test.h:973:18: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
     971 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     972 |                                    KUNIT_EXPECTATION,                          \
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     973 |                                    left, ==, right,                            \
         |                                    ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     974 |                                    fmt,                                        \
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     975 |                                     ##__VA_ARGS__)
         |                                     ~~~~~~~~~~~~~~
   include/kunit/test.h:809:19: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
     805 |         KUNIT_BASE_BINARY_ASSERTION(test,                                      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     806 |                                     kunit_binary_assert,                       \
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     807 |                                     kunit_binary_assert_format,                \
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     808 |                                     assert_type,                               \
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     809 |                                     left, op, right,                           \
         |                                     ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     810 |                                     fmt,                                       \
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     811 |                                     ##__VA_ARGS__)
         |                                     ~~~~~~~~~~~~~~
   include/kunit/test.h:776:33: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
     776 |         const typeof(right) __right = (right);                                 \
         |                                        ^~~~~
   2 warnings generated.


vim +18 lib/tests/foreach_macros_kunit.c

    15	
    16		static const u64 empty_args	= FOREACH(FOREACH_BIT) FOREACH_END(0);
    17		static const u64 one_arg	= FOREACH(FOREACH_BIT, 7) FOREACH_END(0);
  > 18		static const u64 many_args	= FOREACH(FOREACH_BIT, 1, 2, 3, 15, 30, 63) FOREACH_END(0);
    19	
    20		KUNIT_EXPECT_EQ(test, empty_args, 0);
    21		KUNIT_EXPECT_EQ(test, one_arg, BIT(7));
    22		KUNIT_EXPECT_EQ(test, many_args, BIT(1) | BIT(2) | BIT(3) | BIT(15) | BIT(30) | BIT(63));
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
