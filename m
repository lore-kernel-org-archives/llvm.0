Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B243ACA5C;
	Thu, 14 May 2026 06:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778741641; cv=none; b=FZTHd/nX0CBlZtX8or5ASXJwBSVvlHlIoiDrSwpdOL8EJsYl8TzlgCg476r9F5rOfu6VecBycPaOJxTjTrnOC8BN641Zu+HDqTuAhOL7b7N/Ae3JH51x9hjA0jJirW+Ek34i2s8jHzG0x7pVHf5eoyPem4Z04wyl+isyp+Cuixk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778741641; c=relaxed/simple;
	bh=aneMv8x/M5JDgosuzn92CXBq3rNhjxDt6eIJGYsFpA4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VFRfjqfVZ9luvLeCrP/901BHTzvSazHV6g/unedgIotLV/jO9/zkv/L6Kv/QZPFSCk/SiFbhYmS0c/T66Yb6WqHs6LRgcXJRaezS+VibhmgWtFyks5ketXpZal8HPkJ4fi7+uSOwsJglduBYC5zSpheqgl96v4lBLnPTiH7SnNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e+Bk9M98; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e+Bk9M98"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778741641; x=1810277641;
  h=date:from:to:cc:subject:message-id;
  bh=aneMv8x/M5JDgosuzn92CXBq3rNhjxDt6eIJGYsFpA4=;
  b=e+Bk9M98l8VDhF0iptsD1ptJK/z7rcWkHppcLgbBU21nxxFogypXCQJ7
   iTlgxRhojH8PFHL3fE+7PFY1Ffs7gq9nHb7aCIOwTTMzAxSsfcrF/QvEf
   Iy1Gt7kSMsFjjV732CP4e0dGkNcQzY68n4ND7ivI/N2foXNUIHiSUz/X2
   2mRUscUyU5N3CgfwfgiYmSbrUMK4lWzwZ2X3WaVQOVhxqH/7sfbYWJxsp
   MZuRlfqjSefxulVIQojds0T72K8UgSYEeVmVweRct+iVSP5P26l25OK8N
   hTkuXPMPLBrN0FFjLic4PQNsPp9FWIZMBvHyTKCYoEVq23H8jgMMn8Er0
   w==;
X-CSE-ConnectionGUID: jCWMtkjJREKLPJal53QXHQ==
X-CSE-MsgGUID: VTeC8nyfTUyu1qDNjeN24g==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="91140366"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="91140366"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 23:53:58 -0700
X-CSE-ConnectionGUID: cHJeqxSpSOGKXk2+Qr4ExA==
X-CSE-MsgGUID: +54L/nchQMC+Wo2oEWKrAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="237441310"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 13 May 2026 23:53:56 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNPxA-000000008lf-28f0;
	Thu, 14 May 2026 06:53:52 +0000
Date: Thu, 14 May 2026 08:53:39 +0200
From: kernel test robot <lkp@intel.com>
To: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: lib/tests/string_kunit.c:1014:18: error: use of undeclared
 identifier 'string_bench_memcmp'; did you mean 'string_test_memcmp'?
Message-ID: <202605140827.Qg1DZpcB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Milan-Tripkovic/lib-string_kunit-extend-benchmarks-and-unit-test-to-memcmp/20260514-061117
head:   63994c99c1cec63db18bebab3030f0c0e9d43ea5
commit: 63994c99c1cec63db18bebab3030f0c0e9d43ea5 lib/string_kunit: extend benchmarks and unit test to memcmp()
date:   9 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260514/202605140827.Qg1DZpcB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140827.Qg1DZpcB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140827.Qg1DZpcB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/tests/string_kunit.c:1014:18: error: use of undeclared identifier 'string_bench_memcmp'; did you mean 'string_test_memcmp'?
    1014 |         KUNIT_CASE_SLOW(string_bench_memcmp),
         |                         ^~~~~~~~~~~~~~~~~~~
         |                         string_test_memcmp
   include/kunit/test.h:188:17: note: expanded from macro 'KUNIT_CASE_SLOW'
     188 |                 { .run_case = test_name, .name = #test_name,    \
         |                               ^
   lib/tests/string_kunit.c:883:13: note: 'string_test_memcmp' declared here
     883 | static void string_test_memcmp(struct kunit *test)
         |             ^
   1 error generated.


vim +1014 lib/tests/string_kunit.c

   983	
   984	static struct kunit_case string_test_cases[] = {
   985		KUNIT_CASE(string_test_memset16),
   986		KUNIT_CASE(string_test_memset32),
   987		KUNIT_CASE(string_test_memset64),
   988		KUNIT_CASE(string_test_strlen),
   989		KUNIT_CASE(string_test_strnlen),
   990		KUNIT_CASE(string_test_strchr),
   991		KUNIT_CASE(string_test_strnchr),
   992		KUNIT_CASE(string_test_strrchr),
   993		KUNIT_CASE(string_test_strspn),
   994		KUNIT_CASE(string_test_strcmp),
   995		KUNIT_CASE(string_test_strcmp_long_strings),
   996		KUNIT_CASE(string_test_strncmp),
   997		KUNIT_CASE(string_test_strncmp_long_strings),
   998		KUNIT_CASE(string_test_strcasecmp),
   999		KUNIT_CASE(string_test_strcasecmp_long_strings),
  1000		KUNIT_CASE(string_test_strncasecmp),
  1001		KUNIT_CASE(string_test_strncasecmp_long_strings),
  1002		KUNIT_CASE(string_test_strscpy),
  1003		KUNIT_CASE(string_test_strcat),
  1004		KUNIT_CASE(string_test_strncat),
  1005		KUNIT_CASE(string_test_strlcat),
  1006		KUNIT_CASE(string_test_strtomem),
  1007		KUNIT_CASE(string_test_memtostr),
  1008		KUNIT_CASE(string_test_strends),
  1009		KUNIT_CASE(string_bench_strlen),
  1010		KUNIT_CASE(string_bench_strnlen),
  1011		KUNIT_CASE(string_bench_strchr),
  1012		KUNIT_CASE(string_bench_strrchr),
  1013		KUNIT_CASE(string_test_memcmp),
> 1014		KUNIT_CASE_SLOW(string_bench_memcmp),
  1015		{}
  1016	};
  1017	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
