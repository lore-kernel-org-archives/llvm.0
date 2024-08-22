Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D161CE71E;
	Thu, 22 Aug 2024 17:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724347293; cv=none; b=r3406dCsIXtKkH5ucW3NxxRw2pYxRRJtuix8ZYruN6aJQOYaeN/S4yahLSz40IKm/2GCYXthcDsR2EJKKhmAlyOWtbDacAtdFvoymB3J/Mn1ijHPWSJtlBeAyt/iDspCLG5yyTk36pKRY/yR6C7mJVbhJys8CB/Zl+SwEYPSE3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724347293; c=relaxed/simple;
	bh=UPk7V+df2pMuzBGAqK0t6Odae7g7frVhA8gjKAq548A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nl015oO0Le0Tn6JaLeFjNKnBiDtdLwrbhr6bztiNoEiazHmMa/yDTM6NDtteOip3Gkt9A9Xh3aaj09B3xTu+yiEAgiNMmzCx4ZRoR/DsbpsQm/9JzQTUPyrSAyeBTJePYFvTY1S6TI0jSoo1p6IrGwGq1N88EZoFKkNLw1ik60A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D9ddTWzV; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D9ddTWzV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724347291; x=1755883291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UPk7V+df2pMuzBGAqK0t6Odae7g7frVhA8gjKAq548A=;
  b=D9ddTWzV6My0Xq0jv5sSNqMsespY4CPzPiMk0QjSF/l0uiXJRD8XwAIC
   4mfrXsUW9KI2ZCKWnNYSDozamEqpLkt7BE0abJQei9Sh9rcsU3KMRc6R8
   xylzJAGCzqpn7GNkGkqvLXD1XyjNLpDA5EvgNFS96YuzwmpOwkpwLIXwu
   xnwh9ysWMQBcCSF3yyMv7baZTkd73/QTli08JTenTJBTe7XJxsDSyedbF
   kmDLi8n9r/H9aGVc9+SK4T5CXfN9JEL+fZDX/Xi8birVoiwrFKj4+JFKD
   U0BiVmkj6OPvL7lsEqUMf06frSYAJBqFZyFHUx3xmT5F+94I9qqCZW168
   w==;
X-CSE-ConnectionGUID: hM3YS7QSTBWmln1VISczCg==
X-CSE-MsgGUID: RbcYvlM+TwWe664YiCpevw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33447540"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="33447540"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 10:21:30 -0700
X-CSE-ConnectionGUID: jr29qA87QF6sTCRFTxnTkw==
X-CSE-MsgGUID: oQreIR7tRrCDpJ0QEwY7Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="61498657"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Aug 2024 10:21:23 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shBUu-000D22-28;
	Thu, 22 Aug 2024 17:21:20 +0000
Date: Fri, 23 Aug 2024 01:20:21 +0800
From: kernel test robot <lkp@intel.com>
To: Lei Liu <liulei.rjpt@vivo.com>, Paul Cercueil <paul@crapouillou.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Valentin Caron <valentin.caron@foss.st.com>,
	Lino Sanfilippo <l.sanfilippo@kunbus.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5/8] tty: mps2-uart: Use devm_clk_get_enabled() helpers
Message-ID: <202408230137.c8NBMil9-lkp@intel.com>
References: <20240822033924.32397-6-liulei.rjpt@vivo.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822033924.32397-6-liulei.rjpt@vivo.com>

Hi Lei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus atorgue-stm32/stm32-next mani-mhi/mhi-next linus/master v6.11-rc4 next-20240822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lei-Liu/tty-8250_ingenic-Use-devm_clk_get_enabled-helpers/20240822-114359
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20240822033924.32397-6-liulei.rjpt%40vivo.com
patch subject: [PATCH 5/8] tty: mps2-uart: Use devm_clk_get_enabled() helpers
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240823/202408230137.c8NBMil9-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408230137.c8NBMil9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408230137.c8NBMil9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/tty/serial/mps2-uart.c:17:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/tty/serial/mps2-uart.c:17:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/tty/serial/mps2-uart.c:17:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from drivers/tty/serial/mps2-uart.c:20:
   In file included from include/linux/platform_device.h:13:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:503:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     503 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     504 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:510:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     510 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     511 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:523:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     523 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     524 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/tty/serial/mps2-uart.c:567:9: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     567 |         return ret;
         |                ^~~
   drivers/tty/serial/mps2-uart.c:539:9: note: initialize the variable 'ret' to silence this warning
     539 |         int ret;
         |                ^
         |                 = 0
   17 warnings generated.


vim +/ret +567 drivers/tty/serial/mps2-uart.c

041f031def3305 Vladimir Murzin 2016-04-25  534  
9f25e07b882bd1 Vladimir Murzin 2019-01-30  535  static int mps2_init_port(struct platform_device *pdev,
9f25e07b882bd1 Vladimir Murzin 2019-01-30  536  			  struct mps2_uart_port *mps_port)
041f031def3305 Vladimir Murzin 2016-04-25  537  {
041f031def3305 Vladimir Murzin 2016-04-25  538  	struct resource *res;
041f031def3305 Vladimir Murzin 2016-04-25  539  	int ret;
041f031def3305 Vladimir Murzin 2016-04-25  540  
6b4cda0248360d Yangtao Li      2023-07-12  541  	mps_port->port.membase = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
041f031def3305 Vladimir Murzin 2016-04-25  542  	if (IS_ERR(mps_port->port.membase))
041f031def3305 Vladimir Murzin 2016-04-25  543  		return PTR_ERR(mps_port->port.membase);
041f031def3305 Vladimir Murzin 2016-04-25  544  
041f031def3305 Vladimir Murzin 2016-04-25  545  	mps_port->port.mapbase = res->start;
041f031def3305 Vladimir Murzin 2016-04-25  546  	mps_port->port.mapsize = resource_size(res);
041f031def3305 Vladimir Murzin 2016-04-25  547  	mps_port->port.iotype = UPIO_MEM;
041f031def3305 Vladimir Murzin 2016-04-25  548  	mps_port->port.flags = UPF_BOOT_AUTOCONF;
041f031def3305 Vladimir Murzin 2016-04-25  549  	mps_port->port.fifosize = 1;
041f031def3305 Vladimir Murzin 2016-04-25  550  	mps_port->port.ops = &mps2_uart_pops;
041f031def3305 Vladimir Murzin 2016-04-25  551  	mps_port->port.dev = &pdev->dev;
041f031def3305 Vladimir Murzin 2016-04-25  552  
7a06cfee297041 Lei Liu         2024-08-22  553  	mps_port->clk = devm_clk_get_enabled(&pdev->dev, NULL);
041f031def3305 Vladimir Murzin 2016-04-25  554  	if (IS_ERR(mps_port->clk))
041f031def3305 Vladimir Murzin 2016-04-25  555  		return PTR_ERR(mps_port->clk);
041f031def3305 Vladimir Murzin 2016-04-25  556  
041f031def3305 Vladimir Murzin 2016-04-25  557  	mps_port->port.uartclk = clk_get_rate(mps_port->clk);
041f031def3305 Vladimir Murzin 2016-04-25  558  
775ea4ea2fd9a4 Vladimir Murzin 2019-01-30  559  	if (mps_port->flags & UART_PORT_COMBINED_IRQ) {
775ea4ea2fd9a4 Vladimir Murzin 2019-01-30  560  		mps_port->port.irq = platform_get_irq(pdev, 0);
775ea4ea2fd9a4 Vladimir Murzin 2019-01-30  561  	} else {
775ea4ea2fd9a4 Vladimir Murzin 2019-01-30  562  		mps_port->rx_irq = platform_get_irq(pdev, 0);
775ea4ea2fd9a4 Vladimir Murzin 2019-01-30  563  		mps_port->tx_irq = platform_get_irq(pdev, 1);
775ea4ea2fd9a4 Vladimir Murzin 2019-01-30  564  		mps_port->port.irq = platform_get_irq(pdev, 2);
775ea4ea2fd9a4 Vladimir Murzin 2019-01-30  565  	}
775ea4ea2fd9a4 Vladimir Murzin 2019-01-30  566  
041f031def3305 Vladimir Murzin 2016-04-25 @567  	return ret;
041f031def3305 Vladimir Murzin 2016-04-25  568  }
041f031def3305 Vladimir Murzin 2016-04-25  569  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
