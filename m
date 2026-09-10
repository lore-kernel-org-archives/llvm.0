Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1A23DD87B;
	Thu, 10 Sep 2026 22:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789078364; cv=none; b=OwL16fdHtS/4SMblxnGTjvlS80J5Hdr+p+QgN7dmjPb/YqJH6olk5Kl24jVsUURWOMm8y/TUN88tVuL47XXhzlPvI5UzCrqKKtJ3Z6WY7dyqNTdUKdWxaSoykO3w8N+DkHnp3qKAo0GLdoRDku7FqiTPwUkQ+Mhd9o6amzjWAls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789078364; c=relaxed/simple;
	bh=nNF9sBELwbR1ayruD0KyBbwDZBbIP7B3gFKpePKCzJQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GELrQvwhcYm2uOBB2iVjUJm4pkicfnginVvULDN2m2uJNo/yJYSgLCVW+oj/HY9VX/WVTMn4agOFxasHe+yxJ/4yKSqHYymTEXSKAmdUH75IAKCY5UQvMsLGXaHWeuDnaLN0YzeJRKNJTIYde8TMZzffQFD5c3NWwXNJky59q/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Me+iggDZ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Me+iggDZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789078358; x=1820614358;
  h=date:from:to:cc:subject:message-id;
  bh=nNF9sBELwbR1ayruD0KyBbwDZBbIP7B3gFKpePKCzJQ=;
  b=Me+iggDZuX7lfrt95ziO/8moXEbEjwts+/tTqpB4+O+CPxRNtnYe2rSY
   BtrEB2xly35CJy7HfigTehJdPbLPU/4Gr9xhdLhqmSQlJibw47jzE4KSR
   Q0inbbl8T4JPpkMNNN1UYQcDL1BvDjal5pFc00Tik4HG051OWWeXFvTbG
   9sJZmP9yJtYAVrOwq2B325gfl947K4dbXyiSEtzCMhOH9UF2ZV2xTlr1s
   JDvnJslWBaZmi70j7Z5eABpVSBgP4wHc7SXmbN4fYwkApS3JDgrkFQxMc
   xGpvFPrAFEYWDTf0mksvkLoGI3Z9/tTa9XAtOkwgaK69NwJTKofr53wEZ
   w==;
X-CSE-ConnectionGUID: n79juq38QkyWMaG6EduZrQ==
X-CSE-MsgGUID: HH4HpQO1SKqftcg/178Daw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89666451"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="89666451"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 15:12:36 -0700
X-CSE-ConnectionGUID: gkfCVZwpTsKOBF6vIto9Xg==
X-CSE-MsgGUID: UD4uJhQpSGaHeLZFvlRBRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="310002104"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 10 Sep 2026 15:12:34 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4mzG-000000000aT-2tI0;
	Thu, 10 Sep 2026 22:11:38 +0000
Date: Fri, 11 Sep 2026 06:07:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Kuan-Wei Chiu" <visitorckw@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 "Guan-Chun Wu" <409411716@gms.tku.edu.tw>,
 David Laight <david.laight.linux@gmail.com>
Subject: lib/base64.c:58:18: warning: implicit conversion from 'int'
 to 's8' (aka 'signed char') changes value from 131 to -125
Message-ID: <202609110514.S0a0FD6a-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   50d05c7c76c96b90462f24debacca971d2e86713
commit: c4eb7ad32eab13ba64cc452c6f43d518b63f5e03 lib/base64: optimize base64_decode() with reverse lookup tables
date:   10 months ago
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20260911/202609110514.S0a0FD6a-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d3db069999553568848400c84cbf815c03f5470f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609110514.S0a0FD6a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c4eb7ad32eab ("lib/base64: optimize base64_decode() with reverse lookup tables")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609110514.S0a0FD6a-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/base64.c:58:18: warning: implicit conversion from 'int' to 's8' (aka 'signed char') changes value from 131 to -125 [-Wconstant-conversion]
      58 |         [BASE64_IMAP] = BASE64_REV_INIT('+', ',')
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/base64.c:52:2: note: expanded from macro 'BASE64_REV_INIT'
      48 | #define BASE64_REV_INIT(ch_62, ch_63) { \
         |                                       ~
      49 |         [0 ... 0x1f] = -1, \
      50 |         INIT_32(0x20, ch_62, ch_63), \
      51 |         INIT_32(0x40, ch_62, ch_63), \
      52 |         INIT_32(0x60, ch_62, ch_63), \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/base64.c:46:50: note: expanded from macro 'INIT_32'
      46 | #define INIT_32(v, ...) INIT_16(v, __VA_ARGS__), INIT_16((v) + 16, __VA_ARGS__)
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/base64.c:45:49: note: expanded from macro 'INIT_16'
      45 | #define INIT_16(v, ...) INIT_8(v, __VA_ARGS__), INIT_8((v) + 8, __VA_ARGS__)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   lib/base64.c:43:48: note: expanded from macro 'INIT_4'
      43 | #define INIT_4(v, ...) INIT_2(v, __VA_ARGS__), INIT_2((v) + 2, __VA_ARGS__)
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/base64.c:42:48: note: expanded from macro 'INIT_2'
      42 | #define INIT_2(v, ...) INIT_1(v, __VA_ARGS__), INIT_1((v) + 1, __VA_ARGS__)
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/base64.c:34:42: note: expanded from macro 'INIT_1'
      34 |                 : (v) >= '0' && (v) <= '9' ? (v) - '0' + 52 \
         |                                              ~~~~~~~~~~^~~~
   lib/base64.c:58:18: warning: implicit conversion from 'int' to 's8' (aka 'signed char') changes value from 130 to -126 [-Wconstant-conversion]
      58 |         [BASE64_IMAP] = BASE64_REV_INIT('+', ',')
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/base64.c:52:2: note: expanded from macro 'BASE64_REV_INIT'
      48 | #define BASE64_REV_INIT(ch_62, ch_63) { \
         |                                       ~
      49 |         [0 ... 0x1f] = -1, \
      50 |         INIT_32(0x20, ch_62, ch_63), \
      51 |         INIT_32(0x40, ch_62, ch_63), \
      52 |         INIT_32(0x60, ch_62, ch_63), \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/base64.c:46:50: note: expanded from macro 'INIT_32'
      46 | #define INIT_32(v, ...) INIT_16(v, __VA_ARGS__), INIT_16((v) + 16, __VA_ARGS__)
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/base64.c:45:49: note: expanded from macro 'INIT_16'
      45 | #define INIT_16(v, ...) INIT_8(v, __VA_ARGS__), INIT_8((v) + 8, __VA_ARGS__)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   lib/base64.c:43:48: note: expanded from macro 'INIT_4'
      43 | #define INIT_4(v, ...) INIT_2(v, __VA_ARGS__), INIT_2((v) + 2, __VA_ARGS__)
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/base64.c:42:24: note: expanded from macro 'INIT_2'
      42 | #define INIT_2(v, ...) INIT_1(v, __VA_ARGS__), INIT_1((v) + 1, __VA_ARGS__)
         |                        ^~~~~~~~~~~~~~~~~~~~~~
   lib/base64.c:34:42: note: expanded from macro 'INIT_1'
      34 |                 : (v) >= '0' && (v) <= '9' ? (v) - '0' + 52 \
         |                                              ~~~~~~~~~~^~~~
   lib/base64.c:58:18: warning: implicit conversion from 'int' to 's8' (aka 'signed char') changes value from 129 to -127 [-Wconstant-conversion]
      58 |         [BASE64_IMAP] = BASE64_REV_INIT('+', ',')
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/base64.c:52:2: note: expanded from macro 'BASE64_REV_INIT'
      48 | #define BASE64_REV_INIT(ch_62, ch_63) { \
         |                                       ~
      49 |         [0 ... 0x1f] = -1, \
      50 |         INIT_32(0x20, ch_62, ch_63), \
      51 |         INIT_32(0x40, ch_62, ch_63), \
      52 |         INIT_32(0x60, ch_62, ch_63), \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/base64.c:46:50: note: expanded from macro 'INIT_32'
      46 | #define INIT_32(v, ...) INIT_16(v, __VA_ARGS__), INIT_16((v) + 16, __VA_ARGS__)
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/base64.c:45:49: note: expanded from macro 'INIT_16'
      45 | #define INIT_16(v, ...) INIT_8(v, __VA_ARGS__), INIT_8((v) + 8, __VA_ARGS__)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   lib/base64.c:43:24: note: expanded from macro 'INIT_4'
      43 | #define INIT_4(v, ...) INIT_2(v, __VA_ARGS__), INIT_2((v) + 2, __VA_ARGS__)
         |                        ^~~~~~~~~~~~~~~~~~~~~~
   lib/base64.c:42:48: note: expanded from macro 'INIT_2'
      42 | #define INIT_2(v, ...) INIT_1(v, __VA_ARGS__), INIT_1((v) + 1, __VA_ARGS__)
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/base64.c:34:42: note: expanded from macro 'INIT_1'
      34 |                 : (v) >= '0' && (v) <= '9' ? (v) - '0' + 52 \
         |                                              ~~~~~~~~~~^~~~
   lib/base64.c:58:18: warning: implicit conversion from 'int' to 's8' (aka 'signed char') changes value from 128 to -128 [-Wconstant-conversion]
      58 |         [BASE64_IMAP] = BASE64_REV_INIT('+', ',')
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/base64.c:52:2: note: expanded from macro 'BASE64_REV_INIT'
      48 | #define BASE64_REV_INIT(ch_62, ch_63) { \
         |                                       ~
      49 |         [0 ... 0x1f] = -1, \
      50 |         INIT_32(0x20, ch_62, ch_63), \
      51 |         INIT_32(0x40, ch_62, ch_63), \
      52 |         INIT_32(0x60, ch_62, ch_63), \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/base64.c:46:50: note: expanded from macro 'INIT_32'
      46 | #define INIT_32(v, ...) INIT_16(v, __VA_ARGS__), INIT_16((v) + 16, __VA_ARGS__)
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/base64.c:45:49: note: expanded from macro 'INIT_16'
      45 | #define INIT_16(v, ...) INIT_8(v, __VA_ARGS__), INIT_8((v) + 8, __VA_ARGS__)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   lib/base64.c:43:24: note: expanded from macro 'INIT_4'
      43 | #define INIT_4(v, ...) INIT_2(v, __VA_ARGS__), INIT_2((v) + 2, __VA_ARGS__)


vim +58 lib/base64.c

    47	
    48	#define BASE64_REV_INIT(ch_62, ch_63) { \
    49		[0 ... 0x1f] = -1, \
    50		INIT_32(0x20, ch_62, ch_63), \
    51		INIT_32(0x40, ch_62, ch_63), \
    52		INIT_32(0x60, ch_62, ch_63), \
    53		[0x80 ... 0xff] = -1 }
    54	
    55	static const s8 base64_rev_maps[][256] = {
    56		[BASE64_STD] = BASE64_REV_INIT('+', '/'),
    57		[BASE64_URLSAFE] = BASE64_REV_INIT('-', '_'),
  > 58		[BASE64_IMAP] = BASE64_REV_INIT('+', ',')
    59	};
    60	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
