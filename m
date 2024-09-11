Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC4A184548;
	Wed, 11 Sep 2024 10:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726049526; cv=none; b=rNvtPyoP7Dt3fhqsmVTAhMez8jYg2omhq9f3tJK+hEfc5JB8OIsCRaTIOCcHDj+NYuTy7IKkodvLDqFjzXcJZ49tX3efd/a7UwTCHDC/HQq9jM30jVwZCwAXPaZiV5u2BU2mFBPumS02Y/RCRCvDTxhdBfMvWETJb9A8e9eClgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726049526; c=relaxed/simple;
	bh=LaiVa6XdtmGuQzuWO3PvKv0+gxDGO8yEG22F5PIWc14=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GIcSBQrDC+buWYD+zm4ze0EgO9Nh2Yy4lQ3hLsAv0/fIFz1y6PFhQ0IS02k5EGLOT/qgSOiV2qBU5wyyogPyF2h9GDHhoIZlswRn2NHXXz/oxZ+kThzBFqo7U3goIMUr4KyTu2QJUfECccMXwqrqHFhlMJKkDMsy6FzVfDLUayw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CpXFMB0n; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CpXFMB0n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726049525; x=1757585525;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LaiVa6XdtmGuQzuWO3PvKv0+gxDGO8yEG22F5PIWc14=;
  b=CpXFMB0nh27VzsJEzZ8lAnRZ/uwe4rlXm2wrUaZF94bhujTYbROioU1a
   qCmFwGNPnNvKvRWgtxDP8FEWDCTGosJZx4O1Zsi9KzkR4KTbGm+18G0qD
   Vbl7av/mE0sfh2ydDea4SInDeo9Fe9FLjuuRRicgCDaDDbPjOEXMRn2Kl
   oKBMTlLPP25SAasPg5ur3FOClLsFLhQvAgqYx7VurwOFzgkn0Q99ajh6U
   fSytCy0Vnt4bQZlswWM84qrc/2JxVPDNiR5a5VM+6O0EOHh/j3rrSzx2X
   wj43SJ7AlL2ADQjTPLkr9zoY0GOQiZ4zmKEGN3uKUeGrLTF7cu4O3sMBX
   w==;
X-CSE-ConnectionGUID: zRuFX8JSTxC1lhq07A5gTg==
X-CSE-MsgGUID: 1EJGg78nTxerLY35h92LlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24711234"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="24711234"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 03:11:48 -0700
X-CSE-ConnectionGUID: ma57YWcNQyitOI7IDY1PXQ==
X-CSE-MsgGUID: Duuh0LWCTDyQwrQzpm+3kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="66948429"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Sep 2024 03:11:45 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soKK7-0003MY-0s;
	Wed, 11 Sep 2024 10:11:43 +0000
Date: Wed, 11 Sep 2024 18:11:17 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/asahi-base-6.11 23/29]
 drivers/tty/serial/samsung_tty.c:2087:3: warning: misleading indentation;
 statement is not part of the previous 'if'
Message-ID: <202409111822.YAWw8dDO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/asahi-base-6.11
head:   0619e126e13837cf7e2cc8dfda13d762d37dc10a
commit: ce041b76229de01c9de3bd890e2710b59f23bf1c [23/29] Revert "fixup! tty: serial: samsung_tty: Support runtime PM"
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240911/202409111822.YAWw8dDO-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409111822.YAWw8dDO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409111822.YAWw8dDO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/samsung_tty.c:2087:3: warning: misleading indentation; statement is not part of the previous 'if' [-Wmisleading-indentation]
    2087 |                 uart_remove_one_port(&s3c24xx_uart_drv, port);
         |                 ^
   drivers/tty/serial/samsung_tty.c:2085:2: note: previous statement is here
    2085 |         if (port)
         |         ^
   1 warning generated.


vim +/if +2087 drivers/tty/serial/samsung_tty.c

b497549a035c2a drivers/serial/samsung.c         Ben Dooks        2008-07-03  2079  
77772addc1f110 drivers/tty/serial/samsung_tty.c Uwe Kleine-König 2023-11-10  2080  static void s3c24xx_serial_remove(struct platform_device *dev)
b497549a035c2a drivers/serial/samsung.c         Ben Dooks        2008-07-03  2081  {
b497549a035c2a drivers/serial/samsung.c         Ben Dooks        2008-07-03  2082  	struct uart_port *port = s3c24xx_dev_to_port(&dev->dev);
9df94f66b70292 drivers/tty/serial/samsung_tty.c Hector Martin    2021-09-20  2083  	struct s3c24xx_uart_port *ourport = to_ourport(port);
b497549a035c2a drivers/serial/samsung.c         Ben Dooks        2008-07-03  2084  
ce041b76229de0 drivers/tty/serial/samsung_tty.c Marc Zyngier     2024-07-30  2085  	if (port)
9df94f66b70292 drivers/tty/serial/samsung_tty.c Hector Martin    2021-09-20  2086  		pm_runtime_get_sync(&dev->dev);
b497549a035c2a drivers/serial/samsung.c         Ben Dooks        2008-07-03 @2087  		uart_remove_one_port(&s3c24xx_uart_drv, port);
b497549a035c2a drivers/serial/samsung.c         Ben Dooks        2008-07-03  2088  
9df94f66b70292 drivers/tty/serial/samsung_tty.c Hector Martin    2021-09-20  2089  		clk_disable_unprepare(ourport->clk);
9df94f66b70292 drivers/tty/serial/samsung_tty.c Hector Martin    2021-09-20  2090  		if (!IS_ERR(ourport->baudclk))
9df94f66b70292 drivers/tty/serial/samsung_tty.c Hector Martin    2021-09-20  2091  			clk_disable_unprepare(ourport->baudclk);
9df94f66b70292 drivers/tty/serial/samsung_tty.c Hector Martin    2021-09-20  2092  
9df94f66b70292 drivers/tty/serial/samsung_tty.c Hector Martin    2021-09-20  2093  		pm_runtime_disable(&dev->dev);
9df94f66b70292 drivers/tty/serial/samsung_tty.c Hector Martin    2021-09-20  2094  		pm_runtime_set_suspended(&dev->dev);
9df94f66b70292 drivers/tty/serial/samsung_tty.c Hector Martin    2021-09-20  2095  		pm_runtime_put_noidle(&dev->dev);
9df94f66b70292 drivers/tty/serial/samsung_tty.c Hector Martin    2021-09-20  2096  
6f134c3c770355 drivers/tty/serial/samsung.c     Tushar Behera    2014-01-20  2097  	uart_unregister_driver(&s3c24xx_uart_drv);
b497549a035c2a drivers/serial/samsung.c         Ben Dooks        2008-07-03  2098  }
b497549a035c2a drivers/serial/samsung.c         Ben Dooks        2008-07-03  2099  

:::::: The code at line 2087 was first introduced by commit
:::::: b497549a035c2a81b71c7a27f2b00c8a16c09423 [ARM] S3C24XX: Split serial driver into core and per-cpu drivers

:::::: TO: Ben Dooks <ben-linux@fluff.org>
:::::: CC: Ben Dooks <ben-linux@fluff.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
