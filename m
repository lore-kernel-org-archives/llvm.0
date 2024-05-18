Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51164A29;
	Sat, 18 May 2024 08:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716019245; cv=none; b=cPFNLoKbrESmkJNp0iYMIhTJLL3dJb6a7zIVNKdgR9WOHQc1SH3BSvAqSUZsMm4oOFHAxy2QqOPM1bgLjUNP80pd9AwPrvMoF4ooY+pQ5qPw8NT+yBC5mi+rQAJgOkgGFyMk8CDMTgTO7Ftwwv4lQV9DE6sTDZH9azv+x84YuxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716019245; c=relaxed/simple;
	bh=zinhGNopBPbNKt4s1sBSH8qEcbPY2QCSiqLKtJGTCyU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B3TJsruFhoJ+K6gDeAxQ083QQE/g6uPLicpbrDjnFdb+x3PzhoRM2ZoLf7gqYNB+b5e/gWm1ogWPL+l1Tcir3mS+NmUB79tEic+Hm6q291IlQ6PBwnI/bIsBuYxt9y07w6kI2elbxvsXEcRXe3zpyYDA1TNUWiHcwWF1p21F4V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Es5f8YuK; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Es5f8YuK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716019244; x=1747555244;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zinhGNopBPbNKt4s1sBSH8qEcbPY2QCSiqLKtJGTCyU=;
  b=Es5f8YuKXZlgaMyffCfsXr0HdvA0GtY0ITgRz25XGppOmRD/tUkUi/X3
   hvo9s2LG1wz2M0+1MUFW/M1j0liyVt1pcAOvlJp8oFwOR/X+2cXApb/ad
   4QJJ845s9978A+hqHEgw+ncNEBNuzi6TvgJYwVgM9Y2ki4dwAq5tmtalb
   03qQ2XL/TvkLEAFRgmSgjG40mstRPCfT89bYD4G4ttCtPoFtB7zG+Tjtn
   lIf46XL03o6J8YMjYSYOfa4eplmRUZoYqM1B3oR+dSNLpaCwEXDd7VPPe
   QmHkghpw/6BIExw8PqHZCx+pH+Cd8y2y5Bm/uOCrlxUyIKmO5knhNmgUq
   Q==;
X-CSE-ConnectionGUID: 3SliURr5SO6QchQ1JCUEWQ==
X-CSE-MsgGUID: SggTZvXISdWrF3btF4v23w==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12059741"
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="12059741"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 01:00:43 -0700
X-CSE-ConnectionGUID: EGiKrHPKRqix52eWg94Q7Q==
X-CSE-MsgGUID: YhLs+XKVTVGUx+r+G3kOIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="32448774"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 18 May 2024 01:00:41 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8Ezd-0001m6-1y;
	Sat, 18 May 2024 08:00:38 +0000
Date: Sat, 18 May 2024 15:59:46 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Janne Grunau <j@jannau.net>
Subject: [arm-platforms:kvm-arm64/mmu-pgt 309/874]
 drivers/tty/serial/samsung_tty.c:2085:3: warning: misleading indentation;
 statement is not part of the previous 'if'
Message-ID: <202405181545.QHb8P5Ei-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/mmu-pgt
head:   1ed29f79e7c6441ef29c25a43d7c82d91e884dcc
commit: 05c68699aca4de1b69a49a8a6b2b80ff2956cf12 [309/874] tty: serial: samsung_tty: Support runtime PM
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240518/202405181545.QHb8P5Ei-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405181545.QHb8P5Ei-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405181545.QHb8P5Ei-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/samsung_tty.c:2085:3: warning: misleading indentation; statement is not part of the previous 'if' [-Wmisleading-indentation]
                   uart_remove_one_port(&s3c24xx_uart_drv, port);
                   ^
   drivers/tty/serial/samsung_tty.c:2083:2: note: previous statement is here
           if (port)
           ^
   1 warning generated.


vim +/if +2085 drivers/tty/serial/samsung_tty.c

b497549a035c2a drivers/serial/samsung.c         Ben Dooks        2008-07-03  2077  
77772addc1f110 drivers/tty/serial/samsung_tty.c Uwe Kleine-König 2023-11-10  2078  static void s3c24xx_serial_remove(struct platform_device *dev)
b497549a035c2a drivers/serial/samsung.c         Ben Dooks        2008-07-03  2079  {
b497549a035c2a drivers/serial/samsung.c         Ben Dooks        2008-07-03  2080  	struct uart_port *port = s3c24xx_dev_to_port(&dev->dev);
05c68699aca4de drivers/tty/serial/samsung_tty.c Hector Martin    2021-09-20  2081  	struct s3c24xx_uart_port *ourport = to_ourport(port);
b497549a035c2a drivers/serial/samsung.c         Ben Dooks        2008-07-03  2082  
b1617c7888476e drivers/tty/serial/samsung_tty.c Tudor Ambarus    2024-01-19  2083  	if (port)
05c68699aca4de drivers/tty/serial/samsung_tty.c Hector Martin    2021-09-20  2084  		pm_runtime_get_sync(&dev->dev);
b497549a035c2a drivers/serial/samsung.c         Ben Dooks        2008-07-03 @2085  		uart_remove_one_port(&s3c24xx_uart_drv, port);
b497549a035c2a drivers/serial/samsung.c         Ben Dooks        2008-07-03  2086  
05c68699aca4de drivers/tty/serial/samsung_tty.c Hector Martin    2021-09-20  2087  		clk_disable_unprepare(ourport->clk);
05c68699aca4de drivers/tty/serial/samsung_tty.c Hector Martin    2021-09-20  2088  		if (!IS_ERR(ourport->baudclk))
05c68699aca4de drivers/tty/serial/samsung_tty.c Hector Martin    2021-09-20  2089  			clk_disable_unprepare(ourport->baudclk);
05c68699aca4de drivers/tty/serial/samsung_tty.c Hector Martin    2021-09-20  2090  
05c68699aca4de drivers/tty/serial/samsung_tty.c Hector Martin    2021-09-20  2091  		pm_runtime_disable(&dev->dev);
05c68699aca4de drivers/tty/serial/samsung_tty.c Hector Martin    2021-09-20  2092  		pm_runtime_set_suspended(&dev->dev);
05c68699aca4de drivers/tty/serial/samsung_tty.c Hector Martin    2021-09-20  2093  		pm_runtime_put_noidle(&dev->dev);
05c68699aca4de drivers/tty/serial/samsung_tty.c Hector Martin    2021-09-20  2094  
6f134c3c770355 drivers/tty/serial/samsung.c     Tushar Behera    2014-01-20  2095  	uart_unregister_driver(&s3c24xx_uart_drv);
b497549a035c2a drivers/serial/samsung.c         Ben Dooks        2008-07-03  2096  }
b497549a035c2a drivers/serial/samsung.c         Ben Dooks        2008-07-03  2097  

:::::: The code at line 2085 was first introduced by commit
:::::: b497549a035c2a81b71c7a27f2b00c8a16c09423 [ARM] S3C24XX: Split serial driver into core and per-cpu drivers

:::::: TO: Ben Dooks <ben-linux@fluff.org>
:::::: CC: Ben Dooks <ben-linux@fluff.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
