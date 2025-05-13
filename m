Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCBD944E;
	Tue, 13 May 2025 02:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747103460; cv=none; b=OJfQ+o/oe5oAGJwxAmRSI34vBuDCWavTvowXJ2uYz4gsAVr06qkEXzwB0h+6Sqz+LLQpqkfuR/Q++msvPSlr/Jpe1f1rhl8XrSOfsKmZoMlNb/qPLLku4vrlfdhMl1SPyGnKn7R9GF+5JV002PvMIPxMGe/GSGjpKUZDZiRPL8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747103460; c=relaxed/simple;
	bh=u3nSYHc/QHShTYqOjQwRaRhflm4266y82et22pvikO0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bZjXcK1VuudXbYmCZ+LNIOrUiDpZ9zVX588gpLYTDQTZZlI3TV18cRmgMbCcM20D5VV+0qno2knpfluEoYrSsoPfRjgNmXrW4dRb+vbqa1Z+Gg0zhIa5sEvm6QQ3uE2/KeSl5F6QwxCwgph0buDksrvgeMOEJ39n0OCIfVHoVKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=avYlBAmh; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="avYlBAmh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747103458; x=1778639458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u3nSYHc/QHShTYqOjQwRaRhflm4266y82et22pvikO0=;
  b=avYlBAmhXeWHTz0RGyJ7o8nKWg+qwO8eiX7TpxO7Can9IJZM7dkzS0zs
   supLU0ap+fWpZZ6wmfzR4SBmDqKdP4uslK/Cgr3YElpUoYci2CK2OYqoC
   tLP/qug9jVp03SSEvIkQiRtK8haJQfNTvB6wyf8yO1oxefLtq2STIgCfa
   McDmmq0leNemTKacCNCHPWfR9lbaD/rozKmrRk9sRuoAsBXnwHE29wtHd
   o+P3EBCKMCxJzBwkGWkFHl9SQpq/qNZ6gKqHI7yizeuklbR71jLFSKrMD
   tx8jryzNUQ8107BthkXow1SmURLeZqaLLtmyKFoLnzoN8DxR5ayZnvEMW
   Q==;
X-CSE-ConnectionGUID: RbVb5sjpQpOGqplzWpqfSw==
X-CSE-MsgGUID: YAzz8GN6RQS509DtolHjLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48920709"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="48920709"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 19:30:56 -0700
X-CSE-ConnectionGUID: K1cbyLtOSNi8izCXMnk/mQ==
X-CSE-MsgGUID: oSabCcYkQHSVi0ADOvRR0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="138486173"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 May 2025 19:30:55 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEfPw-000Fbb-1e;
	Tue, 13 May 2025 02:30:52 +0000
Date: Tue, 13 May 2025 10:30:37 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>
Subject: [iwlwifi-next:next 165/176]
 drivers/net/wireless/intel/iwlwifi/pcie/drv.c:669:24: warning: implicit
 truncation from 'int' to bit-field changes value from -1 to 15
Message-ID: <202505131020.Aq1n2iE7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git next
head:   c6f67ba09fcbbc3e4f307db56e6f554ab1fe1929
commit: 8748623e07c9089f40baddb6163475dd9e872701 [165/176] wifi: iwlwifi: cfg: reduce configuration struct size
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250513/202505131020.Aq1n2iE7-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505131020.Aq1n2iE7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505131020.Aq1n2iE7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/intel/iwlwifi/pcie/drv.c:10:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
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
   In file included from drivers/net/wireless/intel/iwlwifi/pcie/drv.c:10:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/net/wireless/intel/iwlwifi/pcie/drv.c:10:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
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
>> drivers/net/wireless/intel/iwlwifi/pcie/drv.c:669:24: warning: implicit truncation from 'int' to bit-field changes value from -1 to 15 [-Wbitfield-constant-conversion]
     668 |         IWL_DEV_INFO(iwl6005_n_cfg, iwl6005_2agn_sff_name,
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     669 |                      DEVICE(0x0082), SUBDEV_MASKED(0xC000, 0xF000)),
         |                      ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:576:21: note: expanded from macro 'SUBDEV_MASKED'
     576 |                         .subdevice_m_h = _HIGHEST_BIT(m)
         |                                          ^
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:569:25: note: expanded from macro '_HIGHEST_BIT'
     569 | #define _HIGHEST_BIT(n) (__builtin_ffs((n) + 1) - 2)
         |                         ^
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:564:29: note: expanded from macro 'IWL_DEV_INFO'
     564 |         _IWL_DEV_INFO(_cfg, _name, __VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:561:2: note: expanded from macro '_IWL_DEV_INFO'
     561 |         __VA_ARGS__                             \
         |         ^~~~~~~~~~~
   13 warnings generated.


vim +/int +669 drivers/net/wireless/intel/iwlwifi/pcie/drv.c

2a612a60ab440e Luca Coelho   2019-10-10  584  
cf74ce02e39410 Johannes Berg 2024-01-23  585  VISIBLE_IF_IWLWIFI_KUNIT const struct iwl_dev_info iwl_dev_info_table[] = {
35ac275ebe0c4a Johannes Berg 2025-05-02  586  #if IS_ENABLED(CONFIG_IWLDVM)
35ac275ebe0c4a Johannes Berg 2025-05-02  587  	IWL_DEV_INFO(iwl5100_n_cfg, iwl5100_agn_name,
1fb053d9876f2a Johannes Berg 2025-05-02  588  		     DEVICE(0x4232), SUBDEV_MASKED(0x1, 0xF)),
35ac275ebe0c4a Johannes Berg 2025-05-02  589  	IWL_DEV_INFO(iwl5100_n_cfg, iwl5100_agn_name,
1fb053d9876f2a Johannes Berg 2025-05-02  590  		     DEVICE(0x4232), SUBDEV_MASKED(0x4, 0xF)),
35ac275ebe0c4a Johannes Berg 2025-05-02  591  	IWL_DEV_INFO(iwl5100_n_cfg, iwl5100_bgn_name,
1fb053d9876f2a Johannes Berg 2025-05-02  592  		     DEVICE(0x4232), SUBDEV_MASKED(0x5, 0xF)),
35ac275ebe0c4a Johannes Berg 2025-05-02  593  	IWL_DEV_INFO(iwl5100_abg_cfg, iwl5100_abg_name,
1fb053d9876f2a Johannes Berg 2025-05-02  594  		     DEVICE(0x4232), SUBDEV_MASKED(0x6, 0xF)),
35ac275ebe0c4a Johannes Berg 2025-05-02  595  	IWL_DEV_INFO(iwl5100_n_cfg, iwl5100_agn_name,
1fb053d9876f2a Johannes Berg 2025-05-02  596  		     DEVICE(0x4237), SUBDEV_MASKED(0x1, 0xF)),
35ac275ebe0c4a Johannes Berg 2025-05-02  597  	IWL_DEV_INFO(iwl5100_n_cfg, iwl5100_agn_name,
1fb053d9876f2a Johannes Berg 2025-05-02  598  		     DEVICE(0x4237), SUBDEV_MASKED(0x4, 0xF)),
35ac275ebe0c4a Johannes Berg 2025-05-02  599  	IWL_DEV_INFO(iwl5100_n_cfg, iwl5100_bgn_name,
1fb053d9876f2a Johannes Berg 2025-05-02  600  		     DEVICE(0x4237), SUBDEV_MASKED(0x5, 0xF)),
35ac275ebe0c4a Johannes Berg 2025-05-02  601  	IWL_DEV_INFO(iwl5100_abg_cfg, iwl5100_abg_name,
1fb053d9876f2a Johannes Berg 2025-05-02  602  		     DEVICE(0x4237), SUBDEV_MASKED(0x6, 0xF)),
35ac275ebe0c4a Johannes Berg 2025-05-02  603  
35ac275ebe0c4a Johannes Berg 2025-05-02  604  /* 5300 Series WiFi */
35ac275ebe0c4a Johannes Berg 2025-05-02  605  	IWL_DEV_INFO(iwl5300_agn_cfg, iwl5300_agn_name,
1fb053d9876f2a Johannes Berg 2025-05-02  606  		     DEVICE(0x4235), SUBDEV_MASKED(0x1, 0xF)),
35ac275ebe0c4a Johannes Berg 2025-05-02  607  	IWL_DEV_INFO(iwl5300_agn_cfg, iwl5300_agn_name,
1fb053d9876f2a Johannes Berg 2025-05-02  608  		     DEVICE(0x4235), SUBDEV_MASKED(0x4, 0xF)),
35ac275ebe0c4a Johannes Berg 2025-05-02  609  	IWL_DEV_INFO(iwl5300_agn_cfg, iwl5300_agn_name,
1fb053d9876f2a Johannes Berg 2025-05-02  610  		     DEVICE(0x4236), SUBDEV_MASKED(0x1, 0xF)),
35ac275ebe0c4a Johannes Berg 2025-05-02  611  	IWL_DEV_INFO(iwl5300_agn_cfg, iwl5300_agn_name,
1fb053d9876f2a Johannes Berg 2025-05-02  612  		     DEVICE(0x4236), SUBDEV_MASKED(0x4, 0xF)),
35ac275ebe0c4a Johannes Berg 2025-05-02  613  
35ac275ebe0c4a Johannes Berg 2025-05-02  614  /* 5350 Series WiFi/WiMax */
35ac275ebe0c4a Johannes Berg 2025-05-02  615  	IWL_DEV_INFO(iwl5350_agn_cfg, iwl5350_agn_name,
1fb053d9876f2a Johannes Berg 2025-05-02  616  		     DEVICE(0x423A)),
35ac275ebe0c4a Johannes Berg 2025-05-02  617  	IWL_DEV_INFO(iwl5350_agn_cfg, iwl5350_agn_name,
1fb053d9876f2a Johannes Berg 2025-05-02  618  		     DEVICE(0x423B)),
35ac275ebe0c4a Johannes Berg 2025-05-02  619  
35ac275ebe0c4a Johannes Berg 2025-05-02  620  /* 5150 Series Wifi/WiMax */
35ac275ebe0c4a Johannes Berg 2025-05-02  621  	IWL_DEV_INFO(iwl5150_agn_cfg, iwl5150_agn_name,
1fb053d9876f2a Johannes Berg 2025-05-02  622  		     DEVICE(0x423C), SUBDEV_MASKED(0x1, 0xF)),
35ac275ebe0c4a Johannes Berg 2025-05-02  623  	IWL_DEV_INFO(iwl5150_abg_cfg, iwl5150_abg_name,
1fb053d9876f2a Johannes Berg 2025-05-02  624  		     DEVICE(0x423C), SUBDEV_MASKED(0x6, 0xF)),
35ac275ebe0c4a Johannes Berg 2025-05-02  625  
35ac275ebe0c4a Johannes Berg 2025-05-02  626  	IWL_DEV_INFO(iwl5150_agn_cfg, iwl5150_agn_name,
1fb053d9876f2a Johannes Berg 2025-05-02  627  		     DEVICE(0x423D), SUBDEV_MASKED(0x1, 0xF)),
35ac275ebe0c4a Johannes Berg 2025-05-02  628  	IWL_DEV_INFO(iwl5150_abg_cfg, iwl5150_abg_name,
1fb053d9876f2a Johannes Berg 2025-05-02  629  		     DEVICE(0x423D), SUBDEV_MASKED(0x6, 0xF)),
35ac275ebe0c4a Johannes Berg 2025-05-02  630  
35ac275ebe0c4a Johannes Berg 2025-05-02  631  /* 6x00 Series */
35ac275ebe0c4a Johannes Berg 2025-05-02  632  	IWL_DEV_INFO(iwl6000_3agn_cfg, iwl6000_3agn_name,
1fb053d9876f2a Johannes Berg 2025-05-02  633  		     DEVICE(0x422B), SUBDEV_MASKED(0x1, 0xF)),
35ac275ebe0c4a Johannes Berg 2025-05-02  634  	IWL_DEV_INFO(iwl6000_3agn_cfg, iwl6000_3agn_name,
1fb053d9876f2a Johannes Berg 2025-05-02  635  		     DEVICE(0x422B), SUBDEV_MASKED(0x8, 0xF)),
35ac275ebe0c4a Johannes Berg 2025-05-02  636  	IWL_DEV_INFO(iwl6000i_2agn_cfg, iwl6000i_2agn_name,
1fb053d9876f2a Johannes Berg 2025-05-02  637  		     DEVICE(0x422C), SUBDEV_MASKED(0x1, 0xF)),
35ac275ebe0c4a Johannes Berg 2025-05-02  638  	IWL_DEV_INFO(iwl6000i_non_n_cfg, iwl6000i_2abg_name,
1fb053d9876f2a Johannes Berg 2025-05-02  639  		     DEVICE(0x422C), SUBDEV_MASKED(0x6, 0xF)),
35ac275ebe0c4a Johannes Berg 2025-05-02  640  	IWL_DEV_INFO(iwl6000i_non_n_cfg, iwl6000i_2bg_name,
1fb053d9876f2a Johannes Berg 2025-05-02  641  		     DEVICE(0x422C), SUBDEV_MASKED(0x7, 0xF)),
35ac275ebe0c4a Johannes Berg 2025-05-02  642  	IWL_DEV_INFO(iwl6000_3agn_cfg, iwl6000_3agn_name,
35ac275ebe0c4a Johannes Berg 2025-05-02  643  		     DEVICE(0x4238), SUBDEV(0x1111)),
35ac275ebe0c4a Johannes Berg 2025-05-02  644  	IWL_DEV_INFO(iwl6000_3agn_cfg, iwl6000_3agn_name,
35ac275ebe0c4a Johannes Berg 2025-05-02  645  		     DEVICE(0x4238), SUBDEV(0x1118)),
35ac275ebe0c4a Johannes Berg 2025-05-02  646  	IWL_DEV_INFO(iwl6000i_2agn_cfg, iwl6000i_2agn_name,
35ac275ebe0c4a Johannes Berg 2025-05-02  647  		     DEVICE(0x4239), SUBDEV(0x1311)),
35ac275ebe0c4a Johannes Berg 2025-05-02  648  	IWL_DEV_INFO(iwl6000i_non_n_cfg, iwl6000i_2abg_name,
35ac275ebe0c4a Johannes Berg 2025-05-02  649  		     DEVICE(0x4239), SUBDEV(0x1316)),
35ac275ebe0c4a Johannes Berg 2025-05-02  650  
35ac275ebe0c4a Johannes Berg 2025-05-02  651  /* 6x05 Series */
35ac275ebe0c4a Johannes Berg 2025-05-02  652  	IWL_DEV_INFO(iwl6005_n_cfg, iwl6005_2agn_name,
1fb053d9876f2a Johannes Berg 2025-05-02  653  		     DEVICE(0x0082), SUBDEV_MASKED(0x1, 0xF)),
35ac275ebe0c4a Johannes Berg 2025-05-02  654  	IWL_DEV_INFO(iwl6005_non_n_cfg, iwl6005_2abg_name,
1fb053d9876f2a Johannes Berg 2025-05-02  655  		     DEVICE(0x0082), SUBDEV_MASKED(0x6, 0xF)),
35ac275ebe0c4a Johannes Berg 2025-05-02  656  	IWL_DEV_INFO(iwl6005_non_n_cfg, iwl6005_2bg_name,
1fb053d9876f2a Johannes Berg 2025-05-02  657  		     DEVICE(0x0082), SUBDEV_MASKED(0x7, 0xF)),
35ac275ebe0c4a Johannes Berg 2025-05-02  658  	IWL_DEV_INFO(iwl6005_n_cfg, iwl6005_2agn_name,
1fb053d9876f2a Johannes Berg 2025-05-02  659  		     DEVICE(0x0082), SUBDEV_MASKED(0x8, 0xF)),
1fb053d9876f2a Johannes Berg 2025-05-02  660  
35ac275ebe0c4a Johannes Berg 2025-05-02  661  	IWL_DEV_INFO(iwl6005_n_cfg, iwl6005_2agn_name,
1fb053d9876f2a Johannes Berg 2025-05-02  662  		     DEVICE(0x0085), SUBDEV_MASKED(0x1, 0xF)),
35ac275ebe0c4a Johannes Berg 2025-05-02  663  	IWL_DEV_INFO(iwl6005_n_cfg, iwl6005_2agn_name,
1fb053d9876f2a Johannes Berg 2025-05-02  664  		     DEVICE(0x0085), SUBDEV_MASKED(0x8, 0xF)),
35ac275ebe0c4a Johannes Berg 2025-05-02  665  	IWL_DEV_INFO(iwl6005_non_n_cfg, iwl6005_2abg_name,
1fb053d9876f2a Johannes Berg 2025-05-02  666  		     DEVICE(0x0085), SUBDEV_MASKED(0x6, 0xF)),
1fb053d9876f2a Johannes Berg 2025-05-02  667  
35ac275ebe0c4a Johannes Berg 2025-05-02  668  	IWL_DEV_INFO(iwl6005_n_cfg, iwl6005_2agn_sff_name,
a2ec30065c3170 Johannes Berg 2025-05-05 @669  		     DEVICE(0x0082), SUBDEV_MASKED(0xC000, 0xF000)),
35ac275ebe0c4a Johannes Berg 2025-05-02  670  	IWL_DEV_INFO(iwl6005_n_cfg, iwl6005_2agn_d_name,
35ac275ebe0c4a Johannes Berg 2025-05-02  671  		     DEVICE(0x0082), SUBDEV(0x4820)),
35ac275ebe0c4a Johannes Berg 2025-05-02  672  	IWL_DEV_INFO(iwl6005_n_cfg, iwl6005_2agn_mow1_name,
35ac275ebe0c4a Johannes Berg 2025-05-02  673  		     DEVICE(0x0082), SUBDEV(0x1304)),/* low 5GHz active */
35ac275ebe0c4a Johannes Berg 2025-05-02  674  	IWL_DEV_INFO(iwl6005_n_cfg, iwl6005_2agn_mow2_name,
35ac275ebe0c4a Johannes Berg 2025-05-02  675  		     DEVICE(0x0082), SUBDEV(0x1305)),/* high 5GHz active */
35ac275ebe0c4a Johannes Berg 2025-05-02  676  

:::::: The code at line 669 was first introduced by commit
:::::: a2ec30065c3170376de38ac496c087fad1ccbd4b wifi: iwlwifi: fix 6005N/SFF match

:::::: TO: Johannes Berg <johannes.berg@intel.com>
:::::: CC: Miri Korenblit <miriam.rachel.korenblit@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
