Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D1127453;
	Tue, 29 Apr 2025 17:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745946741; cv=none; b=JXpxC9lU8jP4Odc8YALTl6LFgAEma0BH3MIU4elFH2yZIgwTfoVphuZKe7IKVXiaZ0gFqWoDadaiMuq0qM7TrGDef6BwomIYz1mUZjUH1zxhD6entVR+5Y6dCePV5betKD9jUNdrnHEPtU4a9S2gXhhGyDC/CugsWSZm4Rf6RHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745946741; c=relaxed/simple;
	bh=3DFjIwMtmG/FdRER6ipr/0gy0ErrYs0TAPAw5n8jEnU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MqvWWfmzQwyyeS4sXWNwtti+Ao3VThlwHC7WWIl8wSf9ZsfLjT23Shl3MbOm/IxfKFuEne6rNy7IbPgL/umW7+Ktk6MuxRZJCWwtwCjTsO88D3C9PN5lQeMnTOdp79tFcUzUpEpOC/fYydfU6T6eGEQHneNeJis3T5uYPVtP9tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kGNGiFkt; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kGNGiFkt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745946740; x=1777482740;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3DFjIwMtmG/FdRER6ipr/0gy0ErrYs0TAPAw5n8jEnU=;
  b=kGNGiFktOQFAu9bMCY00+NrGQi+g28DqLwKd4SMkMFN03sgO/cNWAYhB
   quQQYuELcB/PKmRhrVCC/dzcfMhqzHN0ACL1smL0LoN6LCF3Qc6uodRgm
   U0/M//AVvxc2UU0g9jZGiu1ZPSRuf6OLB9FayvQ/uO3mE76yOchxNCPKM
   su7xIKgFyQEzJUfCIDZyNHu176GgwC+32UciTN7XvKw6y3YgGVFOL3LV7
   0Yit+59X6P5n5sEZa1qcNDWa1jrbD0cbEBxpXVfWKWnmDF4F6UJO1uTW+
   rsZg54shi3XC4rqFueE1+0E7qPUHikFtP++Mv5TZNqAokB5Huo00PJoTl
   A==;
X-CSE-ConnectionGUID: ZeKaj75sT/e7TBFaIJMCvg==
X-CSE-MsgGUID: dXpE1IQ8TCe5XX0w4eAdnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="51249346"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="51249346"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 10:12:20 -0700
X-CSE-ConnectionGUID: 4SgmBBsvRAKeAm5S7AOoUA==
X-CSE-MsgGUID: 1u6uIlYeQyyk7vNVBXjsMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="164832013"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Apr 2025 10:12:18 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9oVD-0001NR-0D;
	Tue, 29 Apr 2025 17:12:15 +0000
Date: Wed, 30 Apr 2025 01:11:49 +0800
From: kernel test robot <lkp@intel.com>
To: Alessevan <44125445+Alessevan@users.noreply.github.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>
Subject: [rust:pr/1161 56/195] drivers/net/ethernet/realtek/8139c.c:152:10:
 error: expected ')'
Message-ID: <202504300150.JUlnKTmF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux pr/1161
head:   9f5fa1ba161d636d346f72ba808ce20ee4a3fa70
commit: 15b4eed3e4b6bd5d5799c52a1550ad763e31adda [56/195] feat: print MAC address in C driver
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250430/202504300150.JUlnKTmF-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300150.JUlnKTmF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300150.JUlnKTmF-lkp@intel.com/

All errors (new ones prefixed by >>):

     724 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:737:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     737 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:750:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     750 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:764:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     764 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:778:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     778 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:792:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     792 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from drivers/net/ethernet/realtek/8139c.c:11:
   In file included from include/linux/pci.h:1644:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   drivers/net/ethernet/realtek/8139c.c:139:43: error: use of undeclared identifier 'rtl8139c_suspend'; did you mean 'rtl8139c_reset'?
     139 | static SIMPLE_DEV_PM_OPS(rtl8139c_pm_ops, rtl8139c_suspend, rtl8139c_resume);
         |                                           ^~~~~~~~~~~~~~~~
         |                                           rtl8139c_reset
   include/linux/pm.h:441:26: note: expanded from macro 'SIMPLE_DEV_PM_OPS'
     441 |         SET_SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |                                 ^
   include/linux/pm.h:343:22: note: expanded from macro 'SET_SYSTEM_SLEEP_PM_OPS'
     343 |         SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn)
         |                             ^
   include/linux/pm.h:313:26: note: expanded from macro 'SYSTEM_SLEEP_PM_OPS'
     313 |         .suspend = pm_sleep_ptr(suspend_fn), \
         |                                 ^
   include/linux/pm.h:476:65: note: expanded from macro 'pm_sleep_ptr'
     476 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                                                                 ^
   include/linux/kernel.h:48:38: note: expanded from macro 'PTR_IF'
      48 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                            ^
   drivers/net/ethernet/realtek/8139c.c:46:12: note: 'rtl8139c_reset' declared here
      46 | static int rtl8139c_reset(struct rtl8139c_priv *drv_priv)
         |            ^
   drivers/net/ethernet/realtek/8139c.c:139:61: error: use of undeclared identifier 'rtl8139c_resume'
     139 | static SIMPLE_DEV_PM_OPS(rtl8139c_pm_ops, rtl8139c_suspend, rtl8139c_resume);
         |                                                             ^
   drivers/net/ethernet/realtek/8139c.c:139:43: error: use of undeclared identifier 'rtl8139c_suspend'; did you mean 'rtl8139c_reset'?
     139 | static SIMPLE_DEV_PM_OPS(rtl8139c_pm_ops, rtl8139c_suspend, rtl8139c_resume);
         |                                           ^~~~~~~~~~~~~~~~
         |                                           rtl8139c_reset
   include/linux/pm.h:441:26: note: expanded from macro 'SIMPLE_DEV_PM_OPS'
     441 |         SET_SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |                                 ^
   include/linux/pm.h:343:22: note: expanded from macro 'SET_SYSTEM_SLEEP_PM_OPS'
     343 |         SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn)
         |                             ^
   include/linux/pm.h:315:25: note: expanded from macro 'SYSTEM_SLEEP_PM_OPS'
     315 |         .freeze = pm_sleep_ptr(suspend_fn), \
         |                                ^
   include/linux/pm.h:476:65: note: expanded from macro 'pm_sleep_ptr'
     476 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                                                                 ^
   include/linux/kernel.h:48:38: note: expanded from macro 'PTR_IF'
      48 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                            ^
   drivers/net/ethernet/realtek/8139c.c:46:12: note: 'rtl8139c_reset' declared here
      46 | static int rtl8139c_reset(struct rtl8139c_priv *drv_priv)
         |            ^
   drivers/net/ethernet/realtek/8139c.c:139:61: error: use of undeclared identifier 'rtl8139c_resume'
     139 | static SIMPLE_DEV_PM_OPS(rtl8139c_pm_ops, rtl8139c_suspend, rtl8139c_resume);
         |                                                             ^
   drivers/net/ethernet/realtek/8139c.c:139:43: error: use of undeclared identifier 'rtl8139c_suspend'; did you mean 'rtl8139c_reset'?
     139 | static SIMPLE_DEV_PM_OPS(rtl8139c_pm_ops, rtl8139c_suspend, rtl8139c_resume);
         |                                           ^~~~~~~~~~~~~~~~
         |                                           rtl8139c_reset
   include/linux/pm.h:441:26: note: expanded from macro 'SIMPLE_DEV_PM_OPS'
     441 |         SET_SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |                                 ^
   include/linux/pm.h:343:22: note: expanded from macro 'SET_SYSTEM_SLEEP_PM_OPS'
     343 |         SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn)
         |                             ^
   include/linux/pm.h:317:27: note: expanded from macro 'SYSTEM_SLEEP_PM_OPS'
     317 |         .poweroff = pm_sleep_ptr(suspend_fn), \
         |                                  ^
   include/linux/pm.h:476:65: note: expanded from macro 'pm_sleep_ptr'
     476 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                                                                 ^
   include/linux/kernel.h:48:38: note: expanded from macro 'PTR_IF'
      48 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                            ^
   drivers/net/ethernet/realtek/8139c.c:46:12: note: 'rtl8139c_reset' declared here
      46 | static int rtl8139c_reset(struct rtl8139c_priv *drv_priv)
         |            ^
   drivers/net/ethernet/realtek/8139c.c:139:61: error: use of undeclared identifier 'rtl8139c_resume'
     139 | static SIMPLE_DEV_PM_OPS(rtl8139c_pm_ops, rtl8139c_suspend, rtl8139c_resume);
         |                                                             ^
>> drivers/net/ethernet/realtek/8139c.c:152:10: error: expected ')'
     152 |         pr_info(RTL8139c_DRIVER_NAME "\n");
         |                 ^
   drivers/net/ethernet/realtek/8139c.c:152:2: note: to match this '('
     152 |         pr_info(RTL8139c_DRIVER_NAME "\n");
         |         ^
   include/linux/printk.h:574:2: note: expanded from macro 'pr_info'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^
   include/linux/printk.h:501:26: note: expanded from macro 'printk'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^
   include/linux/printk.h:472:3: note: expanded from macro 'printk_index_wrap'
     472 |                 __printk_index_emit(_fmt, NULL, NULL);                  \
         |                 ^
   include/linux/printk.h:425:27: note: expanded from macro '__printk_index_emit'
     425 |                 if (__builtin_constant_p(_fmt) && __builtin_constant_p(_level)) { \
         |                                         ^
>> drivers/net/ethernet/realtek/8139c.c:152:10: error: expected ')'
     152 |         pr_info(RTL8139c_DRIVER_NAME "\n");
         |                 ^
   drivers/net/ethernet/realtek/8139c.c:152:2: note: to match this '('
     152 |         pr_info(RTL8139c_DRIVER_NAME "\n");
         |         ^
   include/linux/printk.h:574:2: note: expanded from macro 'pr_info'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^
   include/linux/printk.h:501:26: note: expanded from macro 'printk'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^
   include/linux/printk.h:472:3: note: expanded from macro 'printk_index_wrap'
     472 |                 __printk_index_emit(_fmt, NULL, NULL);                  \
         |                 ^
   include/linux/printk.h:434:32: note: expanded from macro '__printk_index_emit'
     434 |                                 .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
         |                                                            ^
>> drivers/net/ethernet/realtek/8139c.c:152:10: error: expected ')'
     152 |         pr_info(RTL8139c_DRIVER_NAME "\n");
         |                 ^
   drivers/net/ethernet/realtek/8139c.c:152:2: note: to match this '('
     152 |         pr_info(RTL8139c_DRIVER_NAME "\n");
         |         ^
   include/linux/printk.h:574:2: note: expanded from macro 'pr_info'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^
   include/linux/printk.h:501:26: note: expanded from macro 'printk'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^
   include/linux/printk.h:472:3: note: expanded from macro 'printk_index_wrap'
     472 |                 __printk_index_emit(_fmt, NULL, NULL);                  \
         |                 ^
   include/linux/printk.h:434:41: note: expanded from macro '__printk_index_emit'
     434 |                                 .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
         |                                                                     ^
>> drivers/net/ethernet/realtek/8139c.c:152:10: error: expected ')'
     152 |         pr_info(RTL8139c_DRIVER_NAME "\n");
         |                 ^
   drivers/net/ethernet/realtek/8139c.c:152:2: note: to match this '('
     152 |         pr_info(RTL8139c_DRIVER_NAME "\n");
         |         ^
   include/linux/printk.h:574:2: note: expanded from macro 'pr_info'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^
   include/linux/printk.h:501:26: note: expanded from macro 'printk'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^
   include/linux/printk.h:473:10: note: expanded from macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                        ^
   13 warnings and 10 errors generated.


vim +152 drivers/net/ethernet/realtek/8139c.c

    45	
  > 46	static int rtl8139c_reset(struct rtl8139c_priv *drv_priv)
    47	{
    48		writeb(CmdReset, drv_priv->hwmem + ChipCmd);
    49		int i = 1000;
    50		while (--i) {
    51			if (readb(drv_priv->hwmem + ChipCmd) & CmdReset) {
    52				break;
    53			}
    54			udelay(10);
    55		}
    56		return i;
    57	}
    58	
    59	static int rtl8139c_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
    60	{
    61		u16 vendor, device;
    62		pci_read_config_word(pdev, PCI_VENDOR_ID, &vendor);
    63		pci_read_config_word(pdev, PCI_DEVICE_ID, &device);
    64		printk(KERN_INFO "Device vid: 0x%X pid: 0x%X\n", vendor, device);
    65	
    66		// enable pci device
    67		int err = pci_enable_device_mem(pdev);
    68		// enable bus mastering
    69		pci_set_master(pdev);
    70	
    71		if (err) {
    72			pci_disable_device(pdev);
    73			return err;
    74		}
    75	
    76		// request regions for memory mapped I/O
    77		err = pci_request_regions(pdev, DRV_NAME);
    78		if (err) {
    79			pci_disable_device(pdev);
    80			return err;
    81		}
    82	
    83		// get the base address of the PCI device
    84		resource_size_t pciaddr = pci_resource_start(pdev, 1);
    85		// allocate memory for the driver private data
    86		struct rtl8139c_priv *drv_priv = kzalloc(sizeof(*drv_priv), GFP_KERNEL);
    87		// map the PCI device memory to the driver private data
    88		drv_priv->hwmem = ioremap(pciaddr, END);
    89	
    90		// save data for other functions
    91		pci_set_drvdata(pdev, drv_priv);
    92	
    93		// turn on the RTL8139
    94		writeb(0x0, drv_priv->hwmem + CONFIG1);
    95	
    96		// reset the RTL8139
    97		err = rtl8139c_reset(drv_priv);
    98		if (err) {
    99			pr_err("RTL8139c reset failed\n");
   100			pci_disable_device(pdev);
   101			return err;
   102		}
   103	
   104		// print MAC address
   105		char mac[6] = {};
   106		for (int i = 0; i < 6; i++) {
   107			mac[i] = readb(drv_priv->hwmem + MAC0 + i);
   108		}
   109		pr_info("\b[RTL8139c] MAC address: %02x:%02x:%02x:%02x:%02x:%02x\n",
   110			mac[0], mac[1], mac[2], mac[3], mac[4], mac[5]);
   111	
   112		return 0;
   113	}
   114	
   115	static void rtl8139c_remove(struct pci_dev *pdev)
   116	{
   117		struct rtl8139c_priv *drv_priv = pci_get_drvdata(pdev);
   118		if (drv_priv->hwmem) {
   119			iounmap(drv_priv->hwmem);
   120			kfree(drv_priv);
   121		}
   122		pr_info("RTL8139c removed\n");
   123	}
   124	
   125	/* Perhaps it will be useful later
   126	 *
   127	static void rtl8139c_resume(struct device *device)
   128	{
   129		pr_info("RTL8139c resume\n");
   130	}
   131	
   132	static int rtl8139c_suspend(struct device *device)
   133	{
   134		pr_info("RTL8139c suspend\n");
   135		return 0;
   136	}
   137	 */
   138	
   139	static SIMPLE_DEV_PM_OPS(rtl8139c_pm_ops, rtl8139c_suspend, rtl8139c_resume);
   140	
   141	static struct pci_driver rtl8139c_pci_driver = {
   142		.name = DRV_NAME,
   143		.id_table = rtl8139c_pci_tbl,
   144		.probe = rtl8139c_probe,
   145		.remove = rtl8139c_remove,
   146		.driver.pm = &rtl8139c_pm_ops,
   147	};
   148	
   149	static int __init rtl8139c_init_module(void)
   150	{
   151	#ifdef MODULE
 > 152		pr_info(RTL8139c_DRIVER_NAME "\n");
   153	#endif
   154	
   155		return pci_register_driver(&rtl8139c_pci_driver);
   156	}
   157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
