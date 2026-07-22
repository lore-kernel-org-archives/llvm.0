Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7805A3812DA;
	Wed, 22 Jul 2026 06:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784702057; cv=none; b=jH17Vozc46xeEC/wHDJfuXuc/MQCiYY+lHlR2Gjzn554VIjqHUu/HcPdMSvVL4kB4nhF3VRD2YpU7Bu2FTTKs/VfY+RLm+gWgL3usxtFWWyYEwW62APvn4Vyx9mG0K9w1yJLWGIsBMCBEIMYL7evsLuOrAl+QrTeLyr2yY7P0U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784702057; c=relaxed/simple;
	bh=N4fwxtkvE1mX2EhVOQpUgCUAchnwuyshEFSuuDBiDT0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bnz02TYg2nbsWnxPHO+XCsso9TMqbtNjxEYWhg090YU0Qxk5JNuehi+mxJmjMDRUzNlCGDPAfroYFVc4UVtmwm0d9dvJOtfuJQcP2XSQVIX0HZLaer7u3Z2+azCwOPe7in/QIEsdWuZLenBEm+YTT49lauIKwi8bmVRcMXrwnt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KRkrfbqr; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KRkrfbqr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784702055; x=1816238055;
  h=date:from:to:cc:subject:message-id;
  bh=N4fwxtkvE1mX2EhVOQpUgCUAchnwuyshEFSuuDBiDT0=;
  b=KRkrfbqrImD1PKbsP8tPtcN5tiLdXPMFbvW3cCBUaJtXRSs+yr120zVP
   cHkK7/GKFf1y7KRB7nElBPQ5BR+CyMztbA5wnO0vJLOYeHfP6YV14jXtU
   WafSgL0N4agJS2zDfYS7xgICclFtOUFzNggdOqDa7jn5LvTTI0ACavcyf
   LEWK0+4pYdaJusAnavXYogmg8695WYli2iuTY2bEm8jobGSzQHHxzXEVl
   3L6CkCGkOyr3yF6Wd5jSUKwlRMKLq6PiR20T2mY0ghYW+5ePOqjBfBkUw
   6Yjdn5PEuqGilc3apshNh3r1pxOiKaLO7mLCLc6lgV4BsemUdJ9vZBZDc
   Q==;
X-CSE-ConnectionGUID: gUsdzQSbRciNgphdBBMiYw==
X-CSE-MsgGUID: brQNM/xvRImZNc03/KciFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85369500"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="85369500"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 23:34:15 -0700
X-CSE-ConnectionGUID: eKB2BT14SbK7tCA8sUSIcg==
X-CSE-MsgGUID: JV5/S/hwQy+00F5bcBM6eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="251678226"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 21 Jul 2026 23:34:13 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmQWw-00000000YVl-3uRk;
	Wed, 22 Jul 2026 06:34:10 +0000
Date: Wed, 22 Jul 2026 14:34:01 +0800
From: kernel test robot <lkp@intel.com>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Guenter Roeck <linux@roeck-us.net>
Subject: [linux-next:master 6905/8209]
 drivers/watchdog/npcm_wdt.c:103:35: warning: unused variable 'npcm750_data'
Message-ID: <202607221427.uOhZCcPN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   290aaf24a551d5a0dce037e3fab30820f9113a10
commit: b483970ee8c9bc2a2dde70776e6c8902ed331674 [6905/8209] watchdog: npcm: add bootstatus support
config: x86_64-buildonly-randconfig-004-20260722 (https://download.01.org/0day-ci/archive/20260722/202607221427.uOhZCcPN-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260722/202607221427.uOhZCcPN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607221427.uOhZCcPN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/watchdog/npcm_wdt.c:103:35: warning: unused variable 'npcm750_data' [-Wunused-const-variable]
     103 | static const struct npcm_wdt_data npcm750_data = {
         |                                   ^~~~~~~~~~~~
>> drivers/watchdog/npcm_wdt.c:125:35: warning: unused variable 'npcm845_data' [-Wunused-const-variable]
     125 | static const struct npcm_wdt_data npcm845_data = {
         |                                   ^~~~~~~~~~~~
   2 warnings generated.


vim +/npcm750_data +103 drivers/watchdog/npcm_wdt.c

   102	
 > 103	static const struct npcm_wdt_data npcm750_data = {
   104		.rst_map = npcm750_rst_map,
   105		.rst_map_size = ARRAY_SIZE(npcm750_rst_map),
   106		.status_map = npcm750_status_map,
   107		.status_map_size = ARRAY_SIZE(npcm750_status_map),
   108	};
   109	
   110	static const struct npcm_wdt_rst_map npcm845_rst_map[] = {
   111		{ 0xf000801c, NPCM_WD0RST },
   112		{ 0xf000901c, NPCM_WD1RST },
   113		{ 0xf000a01c, NPCM_WD2RST },
   114	};
   115	
   116	static const struct npcm_wdt_status_map npcm845_status_map[] = {
   117		{ NPCM_PORST, WDIOF_OVERHEAT },
   118		{ NPCM_CORST, WDIOF_FANFAULT },
   119		{ NPCM_SWR1RST, WDIOF_EXTERN1 },
   120		{ NPCM_SWR2RST, WDIOF_EXTERN2 },
   121		{ NPCM_SWR3RST, WDIOF_POWERUNDER },
   122		{ NPCM8XX_TIP_RESET, WDIOF_POWEROVER },
   123	};
   124	
 > 125	static const struct npcm_wdt_data npcm845_data = {
   126		.rst_map = npcm845_rst_map,
   127		.rst_map_size = ARRAY_SIZE(npcm845_rst_map),
   128		.status_map = npcm845_status_map,
   129		.status_map_size = ARRAY_SIZE(npcm845_status_map),
   130	};
   131	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
