Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794338255;
	b=x0VHSMpGn/ZaCjx9PIeZ0fzuln2s5lMGdeJkyd1kEOpaiH2rG7SLzIzsfpOOYNRi+/qb
	 a4aMsZyc4TGRSLNRdOjbFv4Eoe1WKXWr2t7qlGom8Gyl6oIw1CeWXFMTqVqT6E5oSgP5F
	 CZlglv4GSmJGBDkfF6cLkENvkrcRW3/NlsxA9z2Cj5w4pvrJVP3fIwLU952t3qVBNSZHv
	 GvOT09jyq6DpgpB2Vw87biEvesTlgdx2FtQvnEsEHbL8QSKhstpq7lGi5SK6rEsVdIYdF
	 5g1J1wEW4gMld82LRuDhh46mUq+0f3uXxy7g7/7rJfgmR/PuNIKIRjco5k5EcVHeIBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794338255;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=CPfsNAnpmnrq3fX5zyMn0APrLv2YMf9rzKjRxaOzVS0=;
	b=XvsKk+KUtsMTvbmMBhGUgoOS7W6vT0wi8NB7VwjcqE8FX5LqTav2Ha1pBDt6cUJKdZBc
	 N3+PpaUPiSuNw4PgZqHUdB6Vgs+ciIazCI3FN7rUESsNQINW0AlJbO4zxd6Gub2l+waTB
	 N9Kox0JDlC/fy1L58MDvQX/N298TVSJIIO/0l1h7x6UBkNV+MWahej74/reHVajpbpg01
	 phpIcGsRhJM2IOrmpsb5wRePQxqIB7mIIng5lAbb7hUpxj38uzJmu06qHYvsz4q79Pn7F
	 V7rkX4UuwDC/ngTy7BBY92ApITLXmU+jFMCPfX04ZaUjJ7TChzF950gEU1O+zrwS+GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZqQ1ptm8;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B60C606A323;
	Tue, 10 Nov 2026 19:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B60C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZqQ1ptm8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794338254; x=1825874254;
  h=date:from:to:cc:subject:message-id;
  bh=NoZ0W4IU+rGL65IYhg7H+fPMMmYA+l6uQcMEqhfYGxg=;
  b=ZqQ1ptm8dL3ndfv6puLGj1Ldqkj2x7Hy9kF02Q0CUQIpzJrjdRsSQxqg
   KTfC935D1erN25k9m2mS35l4hLqk3tSmWm+WNBnNR+B+aEMpI7+KcEyIg
   Noy/1IUM6v5WZV2WmDevbm/zwPpV+Tc2BqFUl1ditZgF0C895hUx1ruQ7
   0jvBN4/EFQCwD/Slo7t4hvuLIybXK8Vr/Z49jyl9h8jD6Xjxh+qjYZoMN
   MhGz/SOYfcrnXJCuAkp5bvb5nf8moKk6EV+cK2Nq3uD7slDPvDBnhxtET
   gk1O3Iw06IRyg3abdW0pKh7h8sBHq+9timHHF+lxzakBkqIZp7H9FSzOj
   A==;
X-CSE-ConnectionGUID: lFVlkXblR2CkU0o/In/yWg==
X-CSE-MsgGUID: HU8qlRwuQtKjmiB1eVPimg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3099563"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3099563"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 11:17:30 -0800
X-CSE-ConnectionGUID: 9gBMjfLcR8ShSY5Q10MdnA==
X-CSE-MsgGUID: 1J0pPiTVTJOBvsCiPbYU7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8231119"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Nov 2026 11:17:28 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQrLR-00000000xLn-1yDd;
	Tue, 10 Nov 2026 19:17:25 +0000
Date: Wed, 11 Nov 2026 03:17:10 +0800
From: kernel test robot <lkp@intel.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Ulf Hansson <ulfh@kernel.org>
Subject: [ulfh-pm:fixes 1/3] drivers/pmdomain/imx/gpc.c:554:1: error:
 function definition is not allowed here
Message-ID: <202611110330.2CY99RuH-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git fixes
head:   29030cd58b1e7e788728bc5bf4ae3c44881b7bbc
commit: d7262971a2acc2a835d8727d6833a6f764f56124 [1/3] pmdomain: imx: gpc: remove all initialized power domains
config: arm-randconfig-1003-20261110 (https://download.01.org/0day-ci/archive/20261111/202611110330.2CY99RuH-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project e73e336290028f26553b46c9fba844c13da38c9c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611110330.2CY99RuH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611110330.2CY99RuH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pmdomain/imx/gpc.c:554:1: error: function definition is not allowed here
     554 | builtin_platform_driver(imx_gpc_driver)
         | ^
   include/linux/platform_device.h:345:2: note: expanded from macro 'builtin_platform_driver'
     345 |         builtin_driver(__platform_driver, platform_driver_register)
         |         ^
   include/linux/device/driver.h:294:41: note: expanded from macro 'builtin_driver'
     294 | static int __init __driver##_init(void) \
         |                                         ^
>> drivers/pmdomain/imx/gpc.c:554:1: error: use of undeclared identifier 'imx_gpc_driver_init'; did you mean 'imx_gpc_driver'?
     554 | builtin_platform_driver(imx_gpc_driver)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_device.h:345:2: note: expanded from macro 'builtin_platform_driver'
     345 |         builtin_driver(__platform_driver, platform_driver_register)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device/driver.h:298:17: note: expanded from macro 'builtin_driver'
     298 | device_initcall(__driver##_init);
         |                 ^~~~~~~~~~~~~~~
   <scratch space>:189:1: note: expanded from here
     189 | imx_gpc_driver_init
         | ^~~~~~~~~~~~~~~~~~~
   drivers/pmdomain/imx/gpc.c:546:31: note: 'imx_gpc_driver' declared here
     546 | static struct platform_driver imx_gpc_driver = {
         |                               ^
>> drivers/pmdomain/imx/gpc.c:554:1: error: initializing 'initcall_t' (aka 'int (*)(void)') with an expression of incompatible type 'struct platform_driver'
     554 | builtin_platform_driver(imx_gpc_driver)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_device.h:345:2: note: expanded from macro 'builtin_platform_driver'
     345 |         builtin_driver(__platform_driver, platform_driver_register)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device/driver.h:297:3: note: expanded from macro 'builtin_driver'
     297 | } \
         |   ^
     298 | device_initcall(__driver##_init);
         |                 ~~~~~~~~~~~~~~~
   include/linux/init.h:306:30: note: expanded from macro '\
   device_initcall'
     306 | #define device_initcall(fn)             __define_initcall(fn, 6)
         |                                         ^                 ~~
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   <scratch space>:4:1: note: expanded from here
       4 | __initcall__kmod_gpc__483_554_imx_gpc_driver_init6
         | ^
   include/linux/init.h:264:20: note: expanded from macro '____define_initcall'
     264 |         static initcall_t __name __used                         \
         |                           ^
     265 |                 __attribute__((__section__(__sec))) = fn;
         |                                                       ~~
>> drivers/pmdomain/imx/gpc.c:554:40: error: expected '}'
     554 | builtin_platform_driver(imx_gpc_driver)
         |                                        ^
   drivers/pmdomain/imx/gpc.c:504:1: note: to match this '{'
     504 | {
         | ^
   4 errors generated.


vim +554 drivers/pmdomain/imx/gpc.c

721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  545  
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17 @546  static struct platform_driver imx_gpc_driver = {
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  547  	.driver = {
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  548  		.name = "imx-gpc",
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  549  		.of_match_table = imx_gpc_dt_ids,
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  550  	},
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  551  	.probe = imx_gpc_probe,
e70140ba0d2b1a drivers/pmdomain/imx/gpc.c Linus Torvalds 2024-12-01  552  	.remove = imx_gpc_remove,
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  553  };
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17 @554  builtin_platform_driver(imx_gpc_driver)

:::::: The code at line 554 was first introduced by commit
:::::: 721cabf6c6600dbe689ee2782bc087270e97e652 soc: imx: move PGC handling to a new GPC driver

:::::: TO: Lucas Stach <l.stach@pengutronix.de>
:::::: CC: Shawn Guo <shawnguo@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
