Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44754383C6A;
	Tue, 24 Mar 2026 02:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774319139; cv=none; b=JpH2LGoGDHKDR0QHrnPv2dsLEOb2Ukz6FeOCFd4NmBd5u3408APUriom2HPRE+6Gk71gfSpHxn6VNuiNuDzLmM2YHQ/WxFOiMhOXCK7jO/MQy3eAlcsHhV1ka4wiApeADttFQjDXSlI7EvKRfAaqXDp8Wkcgp7gvLDfFRqMePXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774319139; c=relaxed/simple;
	bh=QtkcO+/XPDeyxYTYDSlS1yMQGaETD249Yr/K5dJZijg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gUXvjxd4SI+jFcsJVvkUe9nuebN5WjnudxxydcriGLtkwtXGywQoo3ufXwNWuf4tx5/3cSBivL53Pe/qsM/FdyodoqMoxRsVYm3bp2iYv5rYMcVdupO6qOqPsyffJuDqjlTU7eMn10xPsY9KxvKFD1wx9czGhUbY8Obhy85DcdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LLoOLZ51; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LLoOLZ51"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774319137; x=1805855137;
  h=date:from:to:cc:subject:message-id;
  bh=QtkcO+/XPDeyxYTYDSlS1yMQGaETD249Yr/K5dJZijg=;
  b=LLoOLZ51RfXq+/vUZHDtVE6/LHBEthfAk8NPXb4MYq3DcoerxNaPgKsZ
   k1hE7gWU2/55pTStA4YW/9kg3gXES6eLnPJFF5ZsLHqZBmIJJ0CfIl+Ew
   2HxMv7f+9uQoOLO17CngqMtwPxFjBkJsc1vrARIU4bgQdYvTA9Dbr/Q5a
   /vldcKXyM4qorXYdsKmZ5hpptj/bzQS1x9TOOKAgmLU7tYbHO0nBnM5OS
   BSwz9BiZpfRiEHqSZkrHVd59Y4h/Br1IG+y/XSSA1PL4WOs3Y2ZJ9sW3E
   Xp2RZJYv1sstsQMq+oWQAtzar+5l5aCYV//Uer5aWBPZfV6cjG5vYVuNk
   w==;
X-CSE-ConnectionGUID: 2M8p3+2LS6q2yFTyTOvgTQ==
X-CSE-MsgGUID: rZNXLvFUT7OXhy8yJ11jZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="100783791"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="100783791"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 19:25:37 -0700
X-CSE-ConnectionGUID: IqT8tGTERNiNXBfbsQDnRw==
X-CSE-MsgGUID: jW/HNj5XRI+2aRx2G/18tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="223430153"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Mar 2026 19:25:35 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4rSW-000000003aZ-26wO;
	Tue, 24 Mar 2026 02:25:32 +0000
Date: Tue, 24 Mar 2026 10:24:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/v7.0-rc2/strncpy 11/11]
 drivers/misc/lkdtm/fortify.c:28:2: error: call to undeclared library function
 'strncpy' with type 'char *(char *, const char *, unsigned long)'; ISO C99
 and later do not support implicit function declarations
Message-ID: <202603241035.G4pY8cMm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v7.0-rc2/strncpy
head:   da9b6bdc716b766da262998c114c86ebb1b96d43
commit: da9b6bdc716b766da262998c114c86ebb1b96d43 [11/11] string: Remove strncpy() from the kernel
config: x86_64-buildonly-randconfig-006-20260324 (https://download.01.org/0day-ci/archive/20260324/202603241035.G4pY8cMm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603241035.G4pY8cMm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241035.G4pY8cMm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/misc/lkdtm/fortify.c:28:2: error: call to undeclared library function 'strncpy' with type 'char *(char *, const char *, unsigned long)'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      28 |         strncpy(target[0].a, target[1].a, size);
         |         ^
   drivers/misc/lkdtm/fortify.c:28:2: note: include the header <string.h> or explicitly provide a declaration for 'strncpy'
   1 error generated.


vim +28 drivers/misc/lkdtm/fortify.c

fe8e353bfda6d6 Kees Cook 2021-08-18  12  
325bf6d84bad3f Kees Cook 2022-08-31  13  static void lkdtm_FORTIFY_STR_OBJECT(void)
fe8e353bfda6d6 Kees Cook 2021-08-18  14  {
fe8e353bfda6d6 Kees Cook 2021-08-18  15  	struct target {
fe8e353bfda6d6 Kees Cook 2021-08-18  16  		char a[10];
325bf6d84bad3f Kees Cook 2022-08-31  17  		int foo;
325bf6d84bad3f Kees Cook 2022-08-31  18  	} target[3] = {};
fe8e353bfda6d6 Kees Cook 2021-08-18  19  	/*
fe8e353bfda6d6 Kees Cook 2021-08-18  20  	 * Using volatile prevents the compiler from determining the value of
fe8e353bfda6d6 Kees Cook 2021-08-18  21  	 * 'size' at compile time. Without that, we would get a compile error
fe8e353bfda6d6 Kees Cook 2021-08-18  22  	 * rather than a runtime error.
fe8e353bfda6d6 Kees Cook 2021-08-18  23  	 */
325bf6d84bad3f Kees Cook 2022-08-31  24  	volatile int size = 20;
325bf6d84bad3f Kees Cook 2022-08-31  25  
325bf6d84bad3f Kees Cook 2022-08-31  26  	pr_info("trying to strcmp() past the end of a struct\n");
fe8e353bfda6d6 Kees Cook 2021-08-18  27  
325bf6d84bad3f Kees Cook 2022-08-31 @28  	strncpy(target[0].a, target[1].a, size);
fe8e353bfda6d6 Kees Cook 2021-08-18  29  
fe8e353bfda6d6 Kees Cook 2021-08-18  30  	/* Store result to global to prevent the code from being eliminated */
325bf6d84bad3f Kees Cook 2022-08-31  31  	fortify_scratch_space = target[0].a[3];
fe8e353bfda6d6 Kees Cook 2021-08-18  32  
325bf6d84bad3f Kees Cook 2022-08-31  33  	pr_err("FAIL: fortify did not block a strncpy() object write overflow!\n");
fe8e353bfda6d6 Kees Cook 2021-08-18  34  	pr_expected_config(CONFIG_FORTIFY_SOURCE);
fe8e353bfda6d6 Kees Cook 2021-08-18  35  }
fe8e353bfda6d6 Kees Cook 2021-08-18  36  

:::::: The code at line 28 was first introduced by commit
:::::: 325bf6d84bad3fc641b94fad6e69c70e960fdf2e lkdtm: Update tests for memcpy() run-time warnings

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
