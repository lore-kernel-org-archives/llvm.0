Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1075F1B87F0;
	Mon, 10 Mar 2025 20:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741638667; cv=none; b=bwAEiCEbdF3en7tX4WiTPdmrnI2yZ+tYu6byq1FArGNHK5e7vkbj0MmwCVACP6+0RB9DRqquHQ46qjRoywhJ1BAq1rz8Jd1hgn7z6/5W/n7bz9S7GJSUKyRQ/Pkz7fkcRcVvmKYXacdCSEnI7U8hoftdTTLEFmqbgyKwoYeoLVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741638667; c=relaxed/simple;
	bh=2lWjYVwUD4B+ylfpdDXy2c+UG5vZSSB2NoEDcFhh5yc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PSMOdv5bYjFnBmrRGCc1e0vTrl1NpGQi79ide7LED5lG3CLHS+H/cAyCfiyOGcTYF7LZih995mLyH+islJlaynTm616I4B5UJ9QT50KV97Bs1oVVoXkphCMJb9oufIRoveGgf7uviAMT91rdLsWxe6k13E3XQ0hn7OICCKI4mmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qb21qx1C; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qb21qx1C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741638665; x=1773174665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2lWjYVwUD4B+ylfpdDXy2c+UG5vZSSB2NoEDcFhh5yc=;
  b=Qb21qx1CC1iry6v0R67nSPqntR2G92jghm1VAgDteaa+LahnMYqacdza
   esHGLmNcVnsMp3ag42W443LV4YAtWLBcUmcXxqfCvMIsEc5dS+1NXwPPQ
   1D7xjbh6AOgjGFKJp0rKOmELMFyj02++s0nLWLZg1UZsnICnVY/ifWs+B
   dx0yo6RL2OmprlejDQxdYszBcydFZw/oub/KPX7k5sQ1a7Xde68vbTts/
   9i1R0SIdq6uiFx/uMkQ2/TBfy9OGcr/AQt/lRTT/ECAtYSqyEOM/H1eoe
   JXCXkDDB82p2NBsw9VZdfb1HbhRB4bDffPCHGXk7sg6YNh24ATiOdnxee
   A==;
X-CSE-ConnectionGUID: Hc3TTWFBSO6bFmIJ8a+zGw==
X-CSE-MsgGUID: 1VGknH2iStmhh4ZULWDwXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="54030135"
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="54030135"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 13:31:04 -0700
X-CSE-ConnectionGUID: XZgJbwoQRLmNcCgb1HNfmQ==
X-CSE-MsgGUID: Bpa1+CaCTdSnuHBcKhFBww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="125134358"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 10 Mar 2025 13:31:03 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trjm8-00063o-2q;
	Mon, 10 Mar 2025 20:31:00 +0000
Date: Tue, 11 Mar 2025 04:30:14 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [watchdog-next:v6.15-rc1 4/7]
 drivers/watchdog/lenovo_se30_wdt.c:272:24: error: call to undeclared
 function 'devm_ioremap'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202503110448.Q9dbJblV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://www.linux-watchdog.org/linux-watchdog-next.git v6.15-rc1
head:   d127d9ce2c8ee87d51fdcfff7895661a3c06fb24
commit: c284153a2c5537db4fec51ac850c17d2eb1ffcfe [4/7] watchdog: lenovo_se30_wdt: Watchdog driver for Lenovo SE30 platform
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250311/202503110448.Q9dbJblV-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e15545cad8297ec7555f26e5ae74a9f0511203e7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250311/202503110448.Q9dbJblV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503110448.Q9dbJblV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/watchdog/lenovo_se30_wdt.c:10:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:549:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     549 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:567:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     567 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/watchdog/lenovo_se30_wdt.c:10:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/watchdog/lenovo_se30_wdt.c:10:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:601:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     601 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:616:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     616 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:631:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     631 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:724:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
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
>> drivers/watchdog/lenovo_se30_wdt.c:272:24: error: call to undeclared function 'devm_ioremap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     272 |         priv->shm_base_addr = devm_ioremap(dev, base_phys, SHM_WIN_SIZE);
         |                               ^
   drivers/watchdog/lenovo_se30_wdt.c:272:22: error: incompatible integer to pointer conversion assigning to 'unsigned char *' from 'int' [-Wint-conversion]
     272 |         priv->shm_base_addr = devm_ioremap(dev, base_phys, SHM_WIN_SIZE);
         |                             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   12 warnings and 2 errors generated.


vim +/devm_ioremap +272 drivers/watchdog/lenovo_se30_wdt.c

   233	
   234	static int lenovo_se30_wdt_probe(struct platform_device *pdev)
   235	{
   236		struct device *dev = &pdev->dev;
   237		struct lenovo_se30_wdt *priv;
   238		unsigned long base_phys;
   239		unsigned short val;
   240		int err;
   241	
   242		err = superio_enter(UNLOCK_KEY, SIO_REG, LNV_SE30_NAME);
   243		if (err)
   244			return err;
   245	
   246		val = superio_inb(SIO_REG, CHIPID_REG) << 8;
   247		val |= superio_inb(SIO_REG, CHIPID_REG + 1);
   248	
   249		if ((val & CHIPID_MASK) != LNV_SE30_ID) {
   250			superio_exit(LOCK_KEY, SIO_REG);
   251			return -ENODEV;
   252		}
   253	
   254		superio_outb(SIO_REG, LDN_REG, LD_NUM_SHM);
   255		base_phys = (superio_inb(SIO_REG, LD_BASE_ADDR) |
   256				 (superio_inb(SIO_REG, LD_BASE_ADDR + 1) << 8) |
   257				 (superio_inb(SIO_REG, LD_BASE_ADDR + 2) << 16) |
   258				 (superio_inb(SIO_REG, LD_BASE_ADDR + 3) << 24)) &
   259				0xFFFFFFFF;
   260	
   261		superio_exit(LOCK_KEY, SIO_REG);
   262		if (base_phys == 0xFFFFFFFF || base_phys == 0)
   263			return -ENODEV;
   264	
   265		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
   266		if (!priv)
   267			return -ENOMEM;
   268	
   269		if (!devm_request_mem_region(dev, base_phys, SHM_WIN_SIZE, LNV_SE30_NAME))
   270			return -EBUSY;
   271	
 > 272		priv->shm_base_addr = devm_ioremap(dev, base_phys, SHM_WIN_SIZE);
   273	
   274		priv->wdt_cfg.mod = WDT_MODULE;
   275		priv->wdt_cfg.idx = WDT_CFG_INDEX;
   276		priv->wdt_cnt.mod = WDT_MODULE;
   277		priv->wdt_cnt.idx = WDT_CNT_INDEX;
   278	
   279		priv->wdt.ops = &lenovo_se30_wdt_ops;
   280		priv->wdt.info = &lenovo_se30_wdt_info;
   281		priv->wdt.timeout = WATCHDOG_TIMEOUT; /* Set default timeout */
   282		priv->wdt.min_timeout = MIN_TIMEOUT;
   283		priv->wdt.max_timeout = MAX_TIMEOUT;
   284		priv->wdt.parent = dev;
   285	
   286		watchdog_init_timeout(&priv->wdt, timeout, dev);
   287		watchdog_set_drvdata(&priv->wdt, priv);
   288		watchdog_set_nowayout(&priv->wdt, nowayout);
   289		watchdog_stop_on_reboot(&priv->wdt);
   290		watchdog_stop_on_unregister(&priv->wdt);
   291	
   292		return devm_watchdog_register_device(dev, &priv->wdt);
   293	}
   294	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
