Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF192746C;
	Sat, 21 Dec 2024 13:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734788321; cv=none; b=rZgtJEckbKc3/QEJB+iXKqEJqdVwxa5IB5wyb1fvga1HpkSHeTOn6swUSEIsPqYbrT+2XfYfkHX+iaTgQyu3RbDpna0PG2qJz0XnErgOIlhrki0ZNhe+8R1VyKZmh39VSCqqfpyUne71/4yQ9l28deRId6WR0y6qtk/S92Dn0Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734788321; c=relaxed/simple;
	bh=jz0SLXa2WQhXjh4LRLKQfRa9oBXt4LlMKGaTRg0+t1k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S9im9CnyUSh5W+234uw6OC1bBJtaBg0i/Ocspf5iGpxqqiCGVs8o5PRfpYV4+zC6Y7+WPnwLbv2W9ApBute8BIrcOHTbIZm+kx6r93UyfmQvXgDk+agVeYL053z2DdJ4Nmbg3/ChUqq2i52iUXnuKr2rO0ubN1B/rWENS9VPq+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VSUK9rtI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VSUK9rtI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734788320; x=1766324320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jz0SLXa2WQhXjh4LRLKQfRa9oBXt4LlMKGaTRg0+t1k=;
  b=VSUK9rtI+IuY1xS4vhiQ+8zQNNEbYcO1BRsXKRjOJsZSO9eeLJbtRDrj
   BMx2LUMRrX6Fcn0zHtqKiL9B3Hexw03pvr4Anw71IuuyLeKjy6geEFE/x
   yitglqwsx1Bvx/fabKin9QzD7MadocCAXwJK1dUWbV97KpBX3noRP07BS
   sJ+XDEqrvw3MD2kwNbJ4Hpq37lBbYDJewAThUfib5CwXOCvVlVDifQtwj
   VLniVQFzGeGKPyqckyTCZD9ivpElYfj4V2uqiREodqXmaDjry7qAcJLV0
   Ara9rTM4witClhy7H66JSOY5eHwopGlMRnO0Pb6hmIHzE7ZlFIJ3BtNE2
   A==;
X-CSE-ConnectionGUID: wVH7WwGNRTGBnUW5VVjfmQ==
X-CSE-MsgGUID: zo6YKPQaQmW+k78oTd5AFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="46327594"
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="46327594"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 05:38:39 -0800
X-CSE-ConnectionGUID: lctw5btnS/yrwgOwatJ+jg==
X-CSE-MsgGUID: 9dAr3EUTSMuAXowZ5chxoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="98648518"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Dec 2024 05:38:38 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOzgh-0002CZ-1p;
	Sat, 21 Dec 2024 13:38:35 +0000
Date: Sat, 21 Dec 2024 21:38:20 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:kexec-debug 15/19] arch/x86/kernel/early_printk.c:300:3:
 error: use of undeclared identifier 'kexec_debug_8250_mmio32'
Message-ID: <202412212115.RrW0NOrQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux kexec-debug
head:   fb9fab65d35df319f262a75718987d66f83a088d
commit: d8921caca66f0eb34be26fde01126968ebc875a3 [15/19] x86/kexec: Add 8250 MMIO serial port output
config: i386-randconfig-006-20241221 (https://download.01.org/0day-ci/archive/20241221/202412212115.RrW0NOrQ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412212115.RrW0NOrQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412212115.RrW0NOrQ-lkp@intel.com/

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
