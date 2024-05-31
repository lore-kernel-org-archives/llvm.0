Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81A414F9EF;
	Fri, 31 May 2024 10:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717149773; cv=none; b=EvwDdQ6YcfwgNNiJTJpJ57GfaaGxVDrZ+RNX3ReUCgYVgM3sJ+cVDuyritEt27iSjhEGgI4Yi6Iu2egF6U/kbwXiKC5fANWBfq9y57AOt8NlCZqwLk4KH52kRrPdK9DqAnEsstyXEw4+UdGZMjH165a1vB3Wr8I09ZfECMcQ0Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717149773; c=relaxed/simple;
	bh=RQPNd648itqoZcPP7q6/S41Hfs26JfXNYn/aZGE1GN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N2xks36/Cf0xO8kIfPinAIegWhZsZP0cXJjavsrk/U9RJ/MbH4sT2J7YPwOHLYi2bWZjCMiVrZEI6/FEPraVQkjRVZoXOowVqABZaMMMhfO2ayiHq0tEuBk+oyBRvs2+MTn+rIdtOjeOOX534nRo+1i1Xnx5b69MO62nNC8K6BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ou5iQawb; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ou5iQawb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717149772; x=1748685772;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RQPNd648itqoZcPP7q6/S41Hfs26JfXNYn/aZGE1GN0=;
  b=Ou5iQawbaWczMisJFrSjJ/W/V9LTSUiEM1xHn3NuqHCRQgYLYpwynVOW
   uRLxkFfxFn5L/pvSZvkijnaFFbkX43L1dWjV1cYBmy/7h1kM9ce1+sVK2
   ncoFrn1ASylA3wTVSq3qW/Nu2/0s4K0LaCSmP+kgv0jN/6AfeHQ+6vQtI
   DAUUvNjiMlzzGJv6QeJ2FwgioyWDI2mfuUQi+HhGEXYL02LBLoHZ+dVcr
   lPWVo3WlBMTipy2XLSCCEOBzgnBVNGIMFd0ebuBZK8JtpG09qrzvelFEo
   YimI3l2zmRD9TcdAfuIUBkZv8a5BoBd+19xvcoV127RgI3XtR8osHyQPk
   w==;
X-CSE-ConnectionGUID: URVSq7TnSZOO8RygrYgJFQ==
X-CSE-MsgGUID: jIR5dU7JTCehX/JAVkc8Eg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="17533724"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="17533724"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 03:02:51 -0700
X-CSE-ConnectionGUID: 2xSjkgVlQuqUixlxL1D5fg==
X-CSE-MsgGUID: gXglRW5uRx2tNq+dum25jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="67314163"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 31 May 2024 03:02:49 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCz5w-000Gtz-1S;
	Fri, 31 May 2024 10:02:44 +0000
Date: Fri, 31 May 2024 18:02:05 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diff 1/3] arch/arm/vdso/note.c:14:1: error: a
 parameter list without types is only allowed in a function definition
Message-ID: <202405311709.BlYsv7gI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   c400d5b1cd1124fd45c7b1a966ce9caad1e406fc
commit: 6a1b99664af09b91f30739d6ecaa83f17545654a [1/3] todo
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240531/202405311709.BlYsv7gI-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405311709.BlYsv7gI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405311709.BlYsv7gI-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/arm/vdso/note.c:14:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
   ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
   ^
   include/linux/elfnote.h:93:37: note: expanded from macro 'ELFNOTE32'
   #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
                                       ^
   include/linux/elfnote.h:91:2: note: expanded from macro 'ELFNOTE'
           _ELFNOTE(size, name, __COUNTER__, type, desc)
           ^
   include/linux/elfnote.h:71:9: note: expanded from macro '_ELFNOTE'
           static const struct {                                           \
                  ^
>> arch/arm/vdso/note.c:14:1: error: a parameter list without types is only allowed in a function definition
   include/linux/elfnote.h:93:37: note: expanded from macro 'ELFNOTE32'
   #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
                                       ^
   include/linux/elfnote.h:91:2: note: expanded from macro 'ELFNOTE'
           _ELFNOTE(size, name, __COUNTER__, type, desc)
           ^
   include/linux/elfnote.h:77:16: note: expanded from macro '_ELFNOTE'
           } __UNIQUE_ID(_note_)                                           \
                         ^
   arch/arm/vdso/note.c:15:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
   BUILD_SALT;
   ^
   include/linux/build-salt.h:16:8: note: expanded from macro 'BUILD_SALT'
          ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
          ^
   include/linux/elfnote.h:93:37: note: expanded from macro 'ELFNOTE32'
   #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
                                       ^
   include/linux/elfnote.h:91:2: note: expanded from macro 'ELFNOTE'
           _ELFNOTE(size, name, __COUNTER__, type, desc)
           ^
   include/linux/elfnote.h:71:9: note: expanded from macro '_ELFNOTE'
           static const struct {                                           \
                  ^
   arch/arm/vdso/note.c:15:1: error: a parameter list without types is only allowed in a function definition
   include/linux/build-salt.h:16:8: note: expanded from macro 'BUILD_SALT'
          ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
          ^
   include/linux/elfnote.h:93:37: note: expanded from macro 'ELFNOTE32'
   #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
                                       ^
   include/linux/elfnote.h:91:2: note: expanded from macro 'ELFNOTE'
           _ELFNOTE(size, name, __COUNTER__, type, desc)
           ^
   include/linux/elfnote.h:77:16: note: expanded from macro '_ELFNOTE'
           } __UNIQUE_ID(_note_)                                           \
                         ^
   2 warnings and 2 errors generated.


vim +14 arch/arm/vdso/note.c

20e2fc42312f96 Vincenzo Frascino 2019-11-04  13  
20e2fc42312f96 Vincenzo Frascino 2019-11-04 @14  ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);

:::::: The code at line 14 was first introduced by commit
:::::: 20e2fc42312f960f497ac2d617e3742754e1fa5e ARM: 8930/1: Add support for generic vDSO

:::::: TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
:::::: CC: Russell King <rmk+kernel@armlinux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
