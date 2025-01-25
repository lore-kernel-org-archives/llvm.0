Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6F0182B4;
	Sat, 25 Jan 2025 14:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737814630; cv=none; b=sjuKPETICF8ter+D1cQ7/lQDtvQgSMXYWDNpT1Iz/GKgmqJhTwBkqcyoR6+40Ajfu1vSkf2dAJ6xzMAGdXvUbeqEyObLsqjilzgFGTvcIBi69FgDEJv2cvpKIJQ3/Fj6NdLI7kyHVDfZM6AGBpV9BuamauiCc0r3SKWqwIZBGpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737814630; c=relaxed/simple;
	bh=rI9sXN1TocENFUObIS7yRrQTelSSj/+i8bXYyPLx0YE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XjAw9wwbL2sHEidNDISxhzh+ePHQf6ASg+/7iNpXh6HZR2jVL5hC9Q+umxUToQZcmswz+hSSKcGv/Kez15NwoG/mn+umUMCKdWu1mTuYjdHdlbXc6bmFpOjzm17fJ5P0xIdhEtEi3JmyodmS9dbCNvtXjFNOCSTNDcU2ZlT3bZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ffyrTLRs; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ffyrTLRs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737814628; x=1769350628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rI9sXN1TocENFUObIS7yRrQTelSSj/+i8bXYyPLx0YE=;
  b=ffyrTLRsqVP3GGIg+z87QSkCNFja2r5hKVrOZFGO07VwDVDfqCRzbM99
   WhfC1ozIXKyYICU8T4dECZ9Wy+BynIHXuuQLiUq9oP1d0sUHMRZ0xBPeZ
   3uMQS+1jpw+mdThI6A1h4v/rZUwtgVOlsqvrOvlyn6E/XrudaxWmVjage
   3LOaIYBs1d8luwFdLZkvj0ca89qCl9e/b1C537F5C3ZhkZP0uIIoEOIwv
   L0KfdRerFcUCFXCaVHyKalPg/m7XSowGSlz19SYaLox2VDROD41cvoZpD
   E+kWcAeNy1NzE73OlKWSkviOjAEVb/tMa6mYWNj5C08pefHvN+I49EU5r
   A==;
X-CSE-ConnectionGUID: ageGeFvWR12yyzHrL7B1EQ==
X-CSE-MsgGUID: 2e0d7wBnRlaZ4C81ULgeeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="41175467"
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="41175467"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 06:17:07 -0800
X-CSE-ConnectionGUID: VEmMetYUQJiKAjus14uRJA==
X-CSE-MsgGUID: htatfoaVT6+UgRP1chagAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="107820528"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Jan 2025 06:17:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbgy7-000dsH-2f;
	Sat, 25 Jan 2025 14:17:03 +0000
Date: Sat, 25 Jan 2025 22:16:07 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:kexec-debug-6 6/7] arch/x86/kernel/early_printk.c:300:3:
 error: use of undeclared identifier 'kexec_debug_8250_mmio32'
Message-ID: <202501252148.NYpXCWTP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux kexec-debug-6
head:   145ae55a8834381a4011861d8607cb4c0f9cf88e
commit: 8554a40bd8f38281f7d2ca9654edc1a5f43a2b5e [6/7] x86/kexec: Add 8250 MMIO serial port output
config: x86_64-randconfig-076-20250124 (https://download.01.org/0day-ci/archive/20250125/202501252148.NYpXCWTP-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501252148.NYpXCWTP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501252148.NYpXCWTP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/early_printk.c:4:
   In file included from include/linux/kexec.h:18:
   In file included from include/linux/vmcore_info.h:6:
   In file included from include/linux/elfcore.h:11:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   arch/x86/kernel/early_printk.c:148:3: error: use of undeclared identifier 'kexec_debug_8250_port'
     148 |                 kexec_debug_8250_port = early_serial_base;
         |                 ^
>> arch/x86/kernel/early_printk.c:300:3: error: use of undeclared identifier 'kexec_debug_8250_mmio32'
     300 |                 kexec_debug_8250_mmio32 = bar0 & PCI_BASE_ADDRESS_MEM_MASK;
         |                 ^
   1 warning and 2 errors generated.


vim +/kexec_debug_8250_mmio32 +300 arch/x86/kernel/early_printk.c

   130	
   131	static __init void early_serial_hw_init(unsigned divisor)
   132	{
   133		unsigned char c;
   134	
   135		serial_out(early_serial_base, LCR, 0x3);	/* 8n1 */
   136		serial_out(early_serial_base, IER, 0);	/* no interrupt */
   137		serial_out(early_serial_base, FCR, 0);	/* no fifo */
   138		serial_out(early_serial_base, MCR, 0x3);	/* DTR + RTS */
   139	
   140		c = serial_in(early_serial_base, LCR);
   141		serial_out(early_serial_base, LCR, c | DLAB);
   142		serial_out(early_serial_base, DLL, divisor & 0xff);
   143		serial_out(early_serial_base, DLH, (divisor >> 8) & 0xff);
   144		serial_out(early_serial_base, LCR, c & ~DLAB);
   145	
   146	#ifdef CONFIG_KEXEC_DEBUG
   147		if (serial_in == io_serial_in)
 > 148			kexec_debug_8250_port = early_serial_base;
   149	#endif
   150	}
   151	
   152	#define DEFAULT_BAUD 9600
   153	
   154	static __init void early_serial_init(char *s)
   155	{
   156		unsigned divisor;
   157		unsigned long baud = DEFAULT_BAUD;
   158		char *e;
   159	
   160		if (*s == ',')
   161			++s;
   162	
   163		if (*s) {
   164			unsigned port;
   165			if (!strncmp(s, "0x", 2)) {
   166				early_serial_base = simple_strtoul(s, &e, 16);
   167			} else {
   168				static const int __initconst bases[] = { 0x3f8, 0x2f8 };
   169	
   170				if (!strncmp(s, "ttyS", 4))
   171					s += 4;
   172				port = simple_strtoul(s, &e, 10);
   173				if (port > 1 || s == e)
   174					port = 0;
   175				early_serial_base = bases[port];
   176			}
   177			s += strcspn(s, ",");
   178			if (*s == ',')
   179				s++;
   180		}
   181	
   182		if (*s) {
   183			baud = simple_strtoull(s, &e, 0);
   184	
   185			if (baud == 0 || s == e)
   186				baud = DEFAULT_BAUD;
   187		}
   188	
   189		/* Convert from baud to divisor value */
   190		divisor = 115200 / baud;
   191	
   192		/* These will always be IO based ports */
   193		serial_in = io_serial_in;
   194		serial_out = io_serial_out;
   195	
   196		/* Set up the HW */
   197		early_serial_hw_init(divisor);
   198	}
   199	
   200	#ifdef CONFIG_PCI
   201	static void mem32_serial_out(unsigned long addr, int offset, int value)
   202	{
   203		u32 __iomem *vaddr = (u32 __iomem *)addr;
   204		/* shift implied by pointer type */
   205		writel(value, vaddr + offset);
   206	}
   207	
   208	static unsigned int mem32_serial_in(unsigned long addr, int offset)
   209	{
   210		u32 __iomem *vaddr = (u32 __iomem *)addr;
   211		/* shift implied by pointer type */
   212		return readl(vaddr + offset);
   213	}
   214	
   215	/*
   216	 * early_pci_serial_init()
   217	 *
   218	 * This function is invoked when the early_printk param starts with "pciserial"
   219	 * The rest of the param should be "[force],B:D.F,baud", where B, D & F describe
   220	 * the location of a PCI device that must be a UART device. "force" is optional
   221	 * and overrides the use of an UART device with a wrong PCI class code.
   222	 */
   223	static __init void early_pci_serial_init(char *s)
   224	{
   225		unsigned divisor;
   226		unsigned long baud = DEFAULT_BAUD;
   227		u8 bus, slot, func;
   228		u32 classcode, bar0;
   229		u16 cmdreg;
   230		char *e;
   231		int force = 0;
   232	
   233		if (*s == ',')
   234			++s;
   235	
   236		if (*s == 0)
   237			return;
   238	
   239		/* Force the use of an UART device with wrong class code */
   240		if (!strncmp(s, "force,", 6)) {
   241			force = 1;
   242			s += 6;
   243		}
   244	
   245		/*
   246		 * Part the param to get the BDF values
   247		 */
   248		bus = (u8)simple_strtoul(s, &e, 16);
   249		s = e;
   250		if (*s != ':')
   251			return;
   252		++s;
   253		slot = (u8)simple_strtoul(s, &e, 16);
   254		s = e;
   255		if (*s != '.')
   256			return;
   257		++s;
   258		func = (u8)simple_strtoul(s, &e, 16);
   259		s = e;
   260	
   261		/* A baud might be following */
   262		if (*s == ',')
   263			s++;
   264	
   265		/*
   266		 * Find the device from the BDF
   267		 */
   268		cmdreg = read_pci_config(bus, slot, func, PCI_COMMAND);
   269		classcode = read_pci_config(bus, slot, func, PCI_CLASS_REVISION);
   270		bar0 = read_pci_config(bus, slot, func, PCI_BASE_ADDRESS_0);
   271	
   272		/*
   273		 * Verify it is a 16550-UART type device
   274		 */
   275		if (((classcode >> 16 != PCI_CLASS_COMMUNICATION_MODEM) &&
   276		     (classcode >> 16 != PCI_CLASS_COMMUNICATION_SERIAL)) ||
   277		    (((classcode >> 8) & 0xff) != PCI_SERIAL_16550_COMPATIBLE)) {
   278			if (!force)
   279				return;
   280		}
   281	
   282		/*
   283		 * Determine if it is IO or memory mapped
   284		 */
   285		if ((bar0 & PCI_BASE_ADDRESS_SPACE) == PCI_BASE_ADDRESS_SPACE_IO) {
   286			/* it is IO mapped */
   287			serial_in = io_serial_in;
   288			serial_out = io_serial_out;
   289			early_serial_base = bar0 & PCI_BASE_ADDRESS_IO_MASK;
   290			write_pci_config(bus, slot, func, PCI_COMMAND,
   291					 cmdreg|PCI_COMMAND_IO);
   292		} else {
   293			/* It is memory mapped - assume 32-bit alignment */
   294			serial_in = mem32_serial_in;
   295			serial_out = mem32_serial_out;
   296			/* WARNING! assuming the address is always in the first 4G */
   297			early_serial_base =
   298				(unsigned long)early_ioremap(bar0 & PCI_BASE_ADDRESS_MEM_MASK, 0x10);
   299	#ifdef CONFIG_KEXEC_DEBUG
 > 300			kexec_debug_8250_mmio32 = bar0 & PCI_BASE_ADDRESS_MEM_MASK;
   301	#endif
   302			write_pci_config(bus, slot, func, PCI_COMMAND,
   303					 cmdreg|PCI_COMMAND_MEMORY);
   304		}
   305	
   306		/*
   307		 * Initialize the hardware
   308		 */
   309		if (*s) {
   310			if (strcmp(s, "nocfg") == 0)
   311				/* Sometimes, we want to leave the UART alone
   312				 * and assume the BIOS has set it up correctly.
   313				 * "nocfg" tells us this is the case, and we
   314				 * should do no more setup.
   315				 */
   316				return;
   317			if (kstrtoul(s, 0, &baud) < 0 || baud == 0)
   318				baud = DEFAULT_BAUD;
   319		}
   320	
   321		/* Convert from baud to divisor value */
   322		divisor = 115200 / baud;
   323	
   324		/* Set up the HW */
   325		early_serial_hw_init(divisor);
   326	}
   327	#endif
   328	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
