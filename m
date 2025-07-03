Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355532D4B53;
	Thu,  3 Jul 2025 23:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751587046; cv=none; b=UkkaEoZg84iNdlEZ+kup3t8vcVFx2bVmKkfCTnURLjd4hpp79lpGzQQccGzDukb58igbf4EAWL0qUT+YhxK9LQcEutHGyTN4o1bP6MOi7rfgrLkwuB0gDrAsxS+aZMJWmDCV+3g0dZv7NNeH6wwhpwfr9Rgrd8CMEOYABaUz6k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751587046; c=relaxed/simple;
	bh=+OzV2HSYYytAJJSKGvoKmaN4zyRPEvwrHukxGSGSEKg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gIFKFQUZk5rVZ2qOrA9HbjOVI5i9LOt9L/UuZe2DgizscCm48A3Wkp8YXHMP7XQPikkA+ZFVW2U726ntLVpFSDA8j0NEqm6MZKnOHp8nGVqDpDUdAeaEZnCQ29Ru3sJ3tt0bxoFtbFFiEqdlVqPkDJ/vDtVko7zLNp2w5QgMK9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fBpAxDrl; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fBpAxDrl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751587045; x=1783123045;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+OzV2HSYYytAJJSKGvoKmaN4zyRPEvwrHukxGSGSEKg=;
  b=fBpAxDrl1aDaMp+h//tx+IdpA2tq11uZKkE4vwo69D9Nqj9duDJmSN02
   UY4T9XQykiaySihQuQ1orUvflmKzx3oxdD71DUDZXfKkz+6d9m/+mY6Ms
   K67Q928snWI1JodPHc+fEebf5dM3xKcVf+lbMmHTGzhQanKYpETrQ6WOz
   1OD0Gr2d4K8y38qB/Ymv6UeobJRg+TVdhv4HTGAg7Y5ocUxFKMQ4ikQsl
   1avLatxHyQbZ0p36Twc3Gk3IybCKG1qiCMGkZnIMauJDNXbyMO/KQmPbB
   wxwnLA0MGWPH3WVv19l5I5MMwn6f/7PqNGMBs1OY2VUySDvbTCzxtwQ6s
   w==;
X-CSE-ConnectionGUID: gE6cUTQdQzyA0CVcdo8eNQ==
X-CSE-MsgGUID: 4SzzUwRmRNCRbW+t+is4EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64615829"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="64615829"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 16:57:25 -0700
X-CSE-ConnectionGUID: 1qKnkmseR4e79JcFRj7P/Q==
X-CSE-MsgGUID: V57d7JsxRESxrNIDzSBXhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="159060486"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 03 Jul 2025 16:57:24 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXTnt-0000YX-0Y;
	Thu, 03 Jul 2025 23:57:21 +0000
Date: Fri, 4 Jul 2025 01:56:52 +0200
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:kunit-kselftests-integration 47/47]
 kernel/time/tests/timens-tests-main.c:25:2: error: Could not find incbin
 file 'timens_test_futex'
Message-ID: <202507040136.Xc2iIR1M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git kunit-kselftests-integration
head:   1d66824abdccea956a455fc694f5967c0163ce31
commit: 1d66824abdccea956a455fc694f5967c0163ce31 [47/47] kunit: test can't have same name as test
config: powerpc-randconfig-2002-20250701 (https://download.01.org/0day-ci/archive/20250704/202507040136.Xc2iIR1M-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507040136.Xc2iIR1M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507040136.Xc2iIR1M-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/time/tests/timens-tests-main.c:18:2: error: Could not find incbin file 'timens_test_exec'
      18 |         KUNIT_UAPI_EMBED_BLOB(timens_test_exec, "timens_test_exec");
         |         ^
   include/kunit/uapi.h:43:3: note: expanded from macro 'KUNIT_UAPI_EMBED_BLOB'
      43 |         "       .incbin " __stringify(_path) "                          \n"     \
         |          ^
   <inline asm>:4:10: note: instantiated into assembly here
       4 |         .incbin "timens_test_exec"                              
         |                 ^
>> kernel/time/tests/timens-tests-main.c:25:2: error: Could not find incbin file 'timens_test_futex'
      25 |         KUNIT_UAPI_EMBED_BLOB(timens_test_futex, "timens_test_futex");
         |         ^
   include/kunit/uapi.h:43:3: note: expanded from macro 'KUNIT_UAPI_EMBED_BLOB'
      43 |         "       .incbin " __stringify(_path) "                          \n"     \
         |          ^
   <inline asm>:4:10: note: instantiated into assembly here
       4 |         .incbin "timens_test_futex"                             
         |                 ^
   kernel/time/tests/timens-tests-main.c:43:2: error: Could not find incbin file 'timens_test_procfs'
      43 |         KUNIT_UAPI_EMBED_BLOB(timens_test_procfs, "timens_test_procfs");
         |         ^
   include/kunit/uapi.h:43:3: note: expanded from macro 'KUNIT_UAPI_EMBED_BLOB'
      43 |         "       .incbin " __stringify(_path) "                          \n"     \
         |          ^
   <inline asm>:4:10: note: instantiated into assembly here
       4 |         .incbin "timens_test_procfs"                            
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
   5 errors generated.


vim +/timens_test_futex +25 kernel/time/tests/timens-tests-main.c

ab2c318d8f620f Thomas Weiﬂschuh 2025-03-24  15  
ab2c318d8f620f Thomas Weiﬂschuh 2025-03-24  16  static void exec(struct kunit *test)
ab2c318d8f620f Thomas Weiﬂschuh 2025-03-24  17  {
ab2c318d8f620f Thomas Weiﬂschuh 2025-03-24 @18  	KUNIT_UAPI_EMBED_BLOB(timens_test_exec, "timens_test_exec");
ab2c318d8f620f Thomas Weiﬂschuh 2025-03-24  19  
ab2c318d8f620f Thomas Weiﬂschuh 2025-03-24  20  	kunit_uapi_run_kselftest(test, &timens_test_exec);
ab2c318d8f620f Thomas Weiﬂschuh 2025-03-24  21  }
ab2c318d8f620f Thomas Weiﬂschuh 2025-03-24  22  
ab2c318d8f620f Thomas Weiﬂschuh 2025-03-24  23  static void futex(struct kunit *test)
ab2c318d8f620f Thomas Weiﬂschuh 2025-03-24  24  {
ab2c318d8f620f Thomas Weiﬂschuh 2025-03-24 @25  	KUNIT_UAPI_EMBED_BLOB(timens_test_futex, "timens_test_futex");
ab2c318d8f620f Thomas Weiﬂschuh 2025-03-24  26  
ab2c318d8f620f Thomas Weiﬂschuh 2025-03-24  27  	kunit_uapi_run_kselftest(test, &timens_test_futex);
ab2c318d8f620f Thomas Weiﬂschuh 2025-03-24  28  }
ab2c318d8f620f Thomas Weiﬂschuh 2025-03-24  29  

:::::: The code at line 25 was first introduced by commit
:::::: ab2c318d8f620f55c8a89b91e878a8246a24aecd timens

:::::: TO: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
:::::: CC: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
