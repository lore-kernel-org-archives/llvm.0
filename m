Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28031465A1;
	Tue,  1 Jul 2025 22:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751408701; cv=none; b=jDtQlSQBCXJacwfePzjTENWdu0Q1YBX+DSUiJdQEaUDC8nnbjbskHlWrCn7uqPKAJOpTNFykSds+12pQYtmEviAUg2EvAeM+XgDZXrOZ3MNaKhjW2XXDOHx2iKbEVin//wjOQrdDAdiM6w891oSJeEtqprbRYV7NtoSEKTaCW54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751408701; c=relaxed/simple;
	bh=freauFV52GedCioC8e15khgYmbNLd/dVdpiRcfb6JxI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f9DDCS7Z1bPEhVgzf4QdleU9o9hjVGu3JmbTzH5J2/EUYHbNiLEF2zGGjIlaXQm9lVXIuFZlThipzj9QH1YcI5bEVAeRb/c4He40FAN4t54bZGy5dMgLopw1ecqkhnStZ39VHJ67wETFtvfP0KDl0bL5UTxA+GR+1QJ0c/weRtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V8ZhY2uF; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V8ZhY2uF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751408699; x=1782944699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=freauFV52GedCioC8e15khgYmbNLd/dVdpiRcfb6JxI=;
  b=V8ZhY2uF4kZsZDMEiMaKtWxmpY6ELRyI1aanA8aX/o5ePPhLRcAY1afg
   F9LqG3FdBQh+VIAZy3UNcKSeqYvxhiNLdzZK36HTBVakaQCpKLzMYZOKH
   trr+DTZ9as54W7MTEGvkvTM0DiCQEk5qJuyi+pbG6TsikKlDcryiCKWm9
   yZvdS5dEFenj/kTgmosgl1H5Lve37qFGIvFIHTOu765yMNxO7s9C2THdT
   7vundtTDW70NLfFDu82XCb1KKjCV+3+xs4k6tbphdpOmKne7AtBKGD/Uz
   Pu7y7TzOa1PVjv/Hu+NO1VH7d5dYjd4Nq8N476vOerIMk7HITouuc8Z1I
   g==;
X-CSE-ConnectionGUID: tPCNAgoHT6mWm/CER/HG8g==
X-CSE-MsgGUID: PoLNuyrKR2aozaRDsuZhJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="57500074"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="57500074"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 15:24:58 -0700
X-CSE-ConnectionGUID: HyA2nrYHR0uXqZdWKp2uUA==
X-CSE-MsgGUID: AedtnnyATJmhV7aIT/AQfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="153663890"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 01 Jul 2025 15:24:57 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWjPK-0000A9-2l;
	Tue, 01 Jul 2025 22:24:54 +0000
Date: Wed, 2 Jul 2025 00:24:11 +0200
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:kunit-kselftests-integration 46/47]
 kernel/time/tests/timens-tests-main.c:34:3: error: Could not find incbin
 file 'timens_test_gettime_perf'
Message-ID: <202507020055.xm5jic62-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git kunit-kselftests-integration
head:   1d66824abdccea956a455fc694f5967c0163ce31
commit: ab2c318d8f620f55c8a89b91e878a8246a24aecd [46/47] timens
config: x86_64-buildonly-randconfig-2004-20250701 (https://download.01.org/0day-ci/archive/20250702/202507020055.xm5jic62-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507020055.xm5jic62-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507020055.xm5jic62-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/time/tests/timens-tests-main.c:25:2: error: Could not find incbin file 'timens_test_futex'
      25 |         KUNIT_UAPI_EMBED_BLOB(timens_test_futex, "timens_test_futex");
         |         ^
   include/kunit/uapi.h:43:3: note: expanded from macro 'KUNIT_UAPI_EMBED_BLOB'
      43 |         "       .incbin " __stringify(_path) "                          \n"     \
         |          ^
   <inline asm>:4:10: note: instantiated into assembly here
       4 |         .incbin "timens_test_futex"                             
         |                 ^
>> kernel/time/tests/timens-tests-main.c:34:3: error: Could not find incbin file 'timens_test_gettime_perf'
      34 |                 KUNIT_UAPI_EMBED_BLOB(timens_test_gettime_perf, "timens_test_gettime_perf");
         |                 ^
   include/kunit/uapi.h:43:3: note: expanded from macro 'KUNIT_UAPI_EMBED_BLOB'
      43 |         "       .incbin " __stringify(_path) "                          \n"     \
         |          ^
   <inline asm>:4:10: note: instantiated into assembly here
       4 |         .incbin "timens_test_gettime_perf"                              
         |                 ^
   kernel/time/tests/timens-tests-main.c:60:2: error: Could not find incbin file 'timens_test_timer'
      60 |         KUNIT_UAPI_EMBED_BLOB(timens_test_timer, "timens_test_timer");
         |         ^
   include/kunit/uapi.h:43:3: note: expanded from macro 'KUNIT_UAPI_EMBED_BLOB'
      43 |         "       .incbin " __stringify(_path) "                          \n"     \
         |          ^
   <inline asm>:4:10: note: instantiated into assembly here
       4 |         .incbin "timens_test_timer"                             
         |                 ^
   kernel/time/tests/timens-tests-main.c:67:2: error: Could not find incbin file 'timens_test_timerfd'
      67 |         KUNIT_UAPI_EMBED_BLOB(timens_test_timerfd, "timens_test_timerfd");
         |         ^
   include/kunit/uapi.h:43:3: note: expanded from macro 'KUNIT_UAPI_EMBED_BLOB'
      43 |         "       .incbin " __stringify(_path) "                          \n"     \
         |          ^
   <inline asm>:4:10: note: instantiated into assembly here
       4 |         .incbin "timens_test_timerfd"                           
         |                 ^
   4 errors generated.


vim +/timens_test_gettime_perf +34 kernel/time/tests/timens-tests-main.c

    32	
    33		if (IS_ENABLED(CONFIG_CC_CAN_LINK_STATIC)) {
  > 34			KUNIT_UAPI_EMBED_BLOB(timens_test_gettime_perf, "timens_test_gettime_perf");
    35			kunit_uapi_run_kselftest(test, &timens_test_gettime_perf);
    36		} else {
    37			kunit_skip(test, "no nolibc");
    38		}
    39	}
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
