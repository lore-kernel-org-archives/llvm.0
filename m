Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4554817E8FC;
	Mon, 27 May 2024 19:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716838972; cv=none; b=RiyGNxjle+s8qIvyEyUpxBI7FSyYviWmbrEmla2WCQiPTcMtFy3hUTlmhRkieOh0yTjlOI8Jn4i8c4FKz35lVxe6SUDvZKnHa6dsm5t48pTeueRbqAnfbwK36vHsC0yWJsh24imPSKJhoSadSG6EzA3+EdlMwE/yZGCb/R3MgJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716838972; c=relaxed/simple;
	bh=X3GDXPn1m/8V1r4YKNbqtXRVUrJs+Sh/0PSSVCqYAKM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N8cLGy82KBdqikDsTcOkWUGSJNW/tU8HHBxqI2Oy+nfkHOBbo3o3Nb8DwTkXNZNJfkWHRTl8UK4bEbwqTPHOdGcK+DQj6vjG+nazxFgUaLMnwKEMkn/MihjCS1rSEd/LCYxBMselElhIVTgsAu/Iqyu3ZsGV08ByNBTyJK74zkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y+Y7M/ay; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+Y7M/ay"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838970; x=1748374970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X3GDXPn1m/8V1r4YKNbqtXRVUrJs+Sh/0PSSVCqYAKM=;
  b=Y+Y7M/ayanhrcFG5USiy7/FuMpungyZMp48IzENwrxIEqBKAzA0XBPb9
   swHhHKORAnxO7TVqQbSg0sN+hpfJgePmS+A0p8Ik2MDuTHMG4C08KAJln
   4h+lGmKhSpbXbV5V01CajILwo5uObfT588cBSE1ZgvReIutV5YZiGMSEx
   FpXpUihghtzgc2JuqsKoPXN+fFNaQpNuucXGwK2g7ZNlP7qpEUUV7b9lv
   HROB5qAumZ0Fh8BwoucHKGqyVsSMHQ6/yepOthygr/srbE95KwwIwsiGX
   sFGhoSBhty9Eau6uZsG0kITvPbatrAuD/ZB6G3kwiTaglsFqn5cvistTs
   w==;
X-CSE-ConnectionGUID: IEUohWSWSd2sjUbJNa2Vtw==
X-CSE-MsgGUID: zjQppDYdTiShkNO+2OOiOQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="38550843"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="38550843"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:42:48 -0700
X-CSE-ConnectionGUID: GOGv4u6ERxSCDI1HBpEXLQ==
X-CSE-MsgGUID: ue9PvyLCQrS627xIdd6RTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="39679291"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 27 May 2024 12:42:47 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBgF1-000B24-2O;
	Mon, 27 May 2024 19:42:43 +0000
Date: Tue, 28 May 2024 03:41:37 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_acpi_b2_v6_610_rc1_full 52/54]
 drivers/tty/serial/8250/8250_platform.c:202:23: error: call to undeclared
 function 'devm_ioremap'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202405280316.IjfpQEYc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_acpi_b2_v6_610_rc1_full
head:   0bdb7caa1b23db090f1bdef3c214c52136374124
commit: b46a331e996d877983f97d4636e86d9c608bb69b [52/54] serial: 8250_platform: Enable generic 16550A platform devices
config: i386-buildonly-randconfig-003-20240528 (https://download.01.org/0day-ci/archive/20240528/202405280316.IjfpQEYc-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240528/202405280316.IjfpQEYc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405280316.IjfpQEYc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/serial/8250/8250_platform.c:202:23: error: call to undeclared function 'devm_ioremap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     202 |                 uart.port.membase = devm_ioremap(dev, uart.port.mapbase, uart.port.mapsize);
         |                                     ^
>> drivers/tty/serial/8250/8250_platform.c:202:21: error: incompatible integer to pointer conversion assigning to 'unsigned char *' from 'int' [-Wint-conversion]
     202 |                 uart.port.membase = devm_ioremap(dev, uart.port.mapbase, uart.port.mapsize);
         |                                   ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/devm_ioremap +202 drivers/tty/serial/8250/8250_platform.c

   160	
   161	/*
   162	 * Generic 16550A platform devices
   163	 */
   164	static int serial8250_platform_probe(struct platform_device *pdev)
   165	{
   166		struct device *dev = &pdev->dev;
   167		struct uart_8250_port uart;
   168		struct resource *regs;
   169		unsigned char iotype;
   170		int ret, line;
   171	
   172		memset(&uart, 0, sizeof(uart));
   173		regs = platform_get_resource(pdev, IORESOURCE_IO, 0);
   174		if (regs) {
   175			uart.port.iobase = regs->start;
   176			iotype = UPIO_PORT;
   177		} else {
   178			regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   179			if (!regs) {
   180				dev_err(dev, "no registers defined\n");
   181				return -EINVAL;
   182			}
   183	
   184			uart.port.mapbase = regs->start;
   185			uart.port.mapsize = resource_size(regs);
   186			uart.port.flags = UPF_IOREMAP;
   187			iotype = UPIO_MEM;
   188		}
   189	
   190		uart.port.uartclk = 1843200; // default
   191		uart.port.type = PORT_16550A;
   192		uart.port.dev = &pdev->dev;
   193		uart.port.flags |= UPF_SKIP_TEST | UPF_BOOT_AUTOCONF;
   194		ret = uart_read_and_validate_port_properties(&uart.port);
   195		/* no interrupt -> fall back to polling */
   196		if (ret == -ENXIO)
   197			ret = 0;
   198		if (ret)
   199			return ret;
   200	
   201		if (uart.port.mapbase) {
 > 202			uart.port.membase = devm_ioremap(dev, uart.port.mapbase, uart.port.mapsize);
   203			if (!uart.port.membase)
   204				return -ENOMEM;
   205		}
   206	
   207		/*
   208		 * The previous call may not set iotype correctly when reg-io-width
   209		 * property is absent and it doesn't support IO port resource.
   210		 */
   211		uart.port.iotype = iotype;
   212	
   213		line = serial8250_register_8250_port(&uart);
   214		if (line < 0)
   215			return -ENODEV;
   216	
   217		platform_set_drvdata(pdev, (void *)((long)line + 1));
   218		return 0;
   219	}
   220	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
