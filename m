Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899121AA3F1;
	Tue, 30 Jul 2024 19:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722367019; cv=none; b=LB80jFEhP+aginrSRZ0JNGDnVWC71sSBV2zORZ8fHLi7QGQKY0Q/H7W0EGGprKhwr4lMzchlZZLZvNmZF41Uo/4MmEke4y80G3JcfmScRYdi2NTR34DjNnKFreVTT8QPj9soplU9N2isOnWwzep29taSUHnQ2oXuVvMjtw94x70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722367019; c=relaxed/simple;
	bh=53Dk+QMdyWW6JqKJp9VufRcGcHzD7k4IB39FsFxMhoo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iRjmS4tLK2k1ndM0XHg2s9eGDahc2KB1aQvjg0iaiF1lmBkbTLB3JcIAr54HYpbcEYR7W99VxkaOxhoEB30EnjTn1YtSPIMi7GHHVN9s7Ot+wHao+rLDsnSVcrmu9eTtvo2Sb3gVkQrxPdd9v3QYbUwDvu/49f32Rny9lPKyl6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NcjJ3Ud5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NcjJ3Ud5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722367017; x=1753903017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=53Dk+QMdyWW6JqKJp9VufRcGcHzD7k4IB39FsFxMhoo=;
  b=NcjJ3Ud5cPjb7AS8I9B/h13I8g2LrUyiTQl/tSGl565+y4bti8NacGvm
   lK4fogsu47wA4jj2czHyO4a+yKzygNlRPmSvahOMyCarrG4VuYFnooDz3
   BqjCtDmkc/KiupU1YN0dlmQ1wUv5Dih326/Vv3SNa0Pmp2NUsbSZ3c5LA
   DLWddEp+MmgVv0OjWALG0q21RrIWkREIwLm6ZMFY9YR7KB7cKudwqm/GM
   3LPlVsr9y4ZzaBc2BXaCRG3mTYX612LzmzSH3pCtEY7c1TSO53EMgUVP9
   vDv7wusIYPDi//JkSaWEnnQ+cosJb5cIMv8D99jb5Icm6nvRd9vZN91Qn
   Q==;
X-CSE-ConnectionGUID: 4UCKazGnRPGqVA+cxGWUyA==
X-CSE-MsgGUID: V9tbmR6WQwyGJNy9ohay7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="19803035"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="19803035"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 12:16:57 -0700
X-CSE-ConnectionGUID: RS1/dDqlQAOEsXiNvd6k3w==
X-CSE-MsgGUID: L/Muple/SpCAjqzn1GM3LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="54437279"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Jul 2024 12:16:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYsL7-000tGS-0d;
	Tue, 30 Jul 2024 19:16:53 +0000
Date: Wed, 31 Jul 2024 03:15:59 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_acpi_b2_v7_611_rc1_full 40/40]
 drivers/tty/serial/8250/8250_platform.c:111:33: error: initializer for
 aggregate with no elements requires explicit braces
Message-ID: <202407310329.UvSZglfK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_acpi_b2_v7_611_rc1_full
head:   4423be73ba644a89e48da1cebbdf901f04b801f3
commit: 4423be73ba644a89e48da1cebbdf901f04b801f3 [40/40] serial: 8250_platform: Enable generic 16550A platform devices
config: arm-aspeed_g4_defconfig (https://download.01.org/0day-ci/archive/20240731/202407310329.UvSZglfK-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ccae7b461be339e717d02f99ac857cf0bc7d17fc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407310329.UvSZglfK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407310329.UvSZglfK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/tty/serial/8250/8250_platform.c:17:
   In file included from include/linux/serial_8250.h:11:
   In file included from include/linux/serial_core.h:16:
   In file included from include/linux/tty.h:11:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:40:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/tty/serial/8250/8250_platform.c:111:33: error: initializer for aggregate with no elements requires explicit braces
     111 |         struct uart_8250_port uart = { 0 };
         |                                        ^
   1 warning and 1 error generated.


vim +111 drivers/tty/serial/8250/8250_platform.c

   104	
   105	/*
   106	 * Generic 16550A platform devices
   107	 */
   108	static int serial8250_platform_probe(struct platform_device *pdev)
   109	{
   110		struct device *dev = &pdev->dev;
 > 111		struct uart_8250_port uart = { 0 };
   112		struct resource *regs;
   113		unsigned char iotype;
   114		int ret, line;
   115	
   116		regs = platform_get_resource(pdev, IORESOURCE_IO, 0);
   117		if (regs) {
   118			uart.port.iobase = regs->start;
   119			iotype = UPIO_PORT;
   120		} else {
   121			regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   122			if (!regs) {
   123				dev_err(dev, "no registers defined\n");
   124				return -EINVAL;
   125			}
   126	
   127			uart.port.mapbase = regs->start;
   128			uart.port.mapsize = resource_size(regs);
   129			uart.port.flags = UPF_IOREMAP;
   130			iotype = UPIO_MEM;
   131		}
   132	
   133		/* Default clock frequency*/
   134		uart.port.uartclk = 1843200;
   135		uart.port.type = PORT_16550A;
   136		uart.port.dev = &pdev->dev;
   137		uart.port.flags |= UPF_SKIP_TEST | UPF_BOOT_AUTOCONF;
   138		ret = uart_read_and_validate_port_properties(&uart.port);
   139		/* no interrupt -> fall back to polling */
   140		if (ret == -ENXIO)
   141			ret = 0;
   142		if (ret)
   143			return ret;
   144	
   145		if (uart.port.mapbase) {
   146			uart.port.membase = devm_ioremap(dev, uart.port.mapbase, uart.port.mapsize);
   147			if (!uart.port.membase)
   148				return -ENOMEM;
   149		}
   150	
   151		/*
   152		 * The previous call may not set iotype correctly when reg-io-width
   153		 * property is absent and it doesn't support IO port resource.
   154		 */
   155		uart.port.iotype = iotype;
   156	
   157		line = serial8250_register_8250_port(&uart);
   158		if (line < 0)
   159			return -ENODEV;
   160	
   161		return 0;
   162	}
   163	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
