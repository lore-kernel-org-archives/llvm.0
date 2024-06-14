Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580B063D;
	Fri, 14 Jun 2024 00:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718325686; cv=none; b=CyD+slE9zHqMOYbJHNI/fKi5B2PzlybOs+cG7liOIBkQBW1s2jyVR8vNEU//Pd/2CwnGAqUhTuy0gDAKBywlso/puhMk8LTpT5ErVxoLjhihtUS+G/3gOVgAlnKHne9/rFq7rKWiyPk4HnSi8AsDN8Hvvmei5MZ5+tClRi/WCGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718325686; c=relaxed/simple;
	bh=cbcYDnRNOI4Jd/xYzGzDQrzq6lLuAWcM19Qs+xXSXeg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hxm3m209MeNCyTFVPrImXyqgqCWz3iQkGpOvKJqO6W4raDMAxTYQWnAJkNhHuu/h3DA+ptjcc4Rcf2i8Aw8m95EGWvSF4jxzFppLGHahvMwsd/ljnZh4lOnwgjY/hkLsjqR9t6A0V+1W5zSekKTg15VaE2YVieIpJr68f2FgwBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WNBfmyn9; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WNBfmyn9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718325684; x=1749861684;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cbcYDnRNOI4Jd/xYzGzDQrzq6lLuAWcM19Qs+xXSXeg=;
  b=WNBfmyn9E+cjDF+nzgWhiiDp9ZlbnZpCwx2DDWKEJDyzLwFx02FHZ+6F
   KW6qk2AkiE0MjsmLS8d3dS7h3lYhNtqtPPhI+vgdvmuTgAexC7NXz0Ka3
   2oHERKN5GYBMZgkLkyX3rUp+erEQTIliHg+rxVkg9W0Ybk3WJ6/X7I5XW
   fgDQ0DXxkrUDlol7LFe0xJp3VV/qwu9RiH83Gr88ecLZncP1KKBF49n/F
   s9svxJXg4Lcn7hvlbFMNRGENAT8RDLtGnJ6fn5mcPnKcMuX1YuRmuZDku
   zQeukRrbcH06zgzRXnkyiH/3Y7wHSCz3A63A+rTfLYBnPSm/kaCh8Rnni
   w==;
X-CSE-ConnectionGUID: akEpMUMCSHW4mzRVSjlG3g==
X-CSE-MsgGUID: eKU4Z0EkTjyE9eYnlaPXjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="12066525"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="12066525"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 17:41:23 -0700
X-CSE-ConnectionGUID: R4sZ16ctR8SYB/g/uvt7sg==
X-CSE-MsgGUID: YKs6i101ScOqL8OE3gfTVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="40187661"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Jun 2024 17:41:21 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHv0J-0000a3-21;
	Fri, 14 Jun 2024 00:41:19 +0000
Date: Fri, 14 Jun 2024 08:41:04 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [broonie-ci:20240612_pierre_louis_bossart_asoc_sof_pci_intel_add_pantherlake_support
 48/51] sound/soc/sof/intel/pci-ptl.c:52:4: error: use of undeclared
 identifier 'PCI_DEVICE_ID_INTEL_HDA_PTL'
Message-ID: <202406140802.gSrav2xQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git 20240612_pierre_louis_bossart_asoc_sof_pci_intel_add_pantherlake_support
head:   95daa00008c78b884a616b34968595d355bec9d1
commit: 9af8c628136b4261930b64a6521ddda1d29962ec [48/51] ASoC: SOF: Intel: add initial support for PTL
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240614/202406140802.gSrav2xQ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406140802.gSrav2xQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406140802.gSrav2xQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from sound/soc/sof/intel/pci-ptl.c:10:
   In file included from include/linux/pci.h:39:
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
   In file included from sound/soc/sof/intel/pci-ptl.c:10:
   In file included from include/linux/pci.h:39:
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
   In file included from sound/soc/sof/intel/pci-ptl.c:10:
   In file included from include/linux/pci.h:39:
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
   sound/soc/sof/intel/pci-ptl.c:23:28: error: use of undeclared identifier 'snd_soc_acpi_intel_ptl_machines'; did you mean 'snd_soc_acpi_intel_mtl_machines'?
      23 |         .machines               = snd_soc_acpi_intel_ptl_machines,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   snd_soc_acpi_intel_mtl_machines
   include/sound/soc-acpi-intel-match.h:33:33: note: 'snd_soc_acpi_intel_mtl_machines' declared here
      33 | extern struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[];
         |                                 ^
   sound/soc/sof/intel/pci-ptl.c:24:19: error: use of undeclared identifier 'snd_soc_acpi_intel_ptl_sdw_machines'; did you mean 'snd_soc_acpi_intel_mtl_sdw_machines'?
      24 |         .alt_machines           = snd_soc_acpi_intel_ptl_sdw_machines,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   snd_soc_acpi_intel_mtl_sdw_machines
   include/sound/soc-acpi-intel-match.h:44:33: note: 'snd_soc_acpi_intel_mtl_sdw_machines' declared here
      44 | extern struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[];
         |                                 ^
>> sound/soc/sof/intel/pci-ptl.c:52:4: error: use of undeclared identifier 'PCI_DEVICE_ID_INTEL_HDA_PTL'
      52 |         { PCI_DEVICE_DATA(INTEL, HDA_PTL, &ptl_desc) }, /* PTL */
         |           ^
   include/linux/pci.h:1063:44: note: expanded from macro 'PCI_DEVICE_DATA'
    1063 |         .vendor = PCI_VENDOR_ID_##vend, .device = PCI_DEVICE_ID_##vend##_##dev, \
         |                                                   ^
   <scratch space>:26:1: note: expanded from here
      26 | PCI_DEVICE_ID_INTEL_HDA_PTL
         | ^
>> sound/soc/sof/intel/pci-ptl.c:55:1: error: definition of variable with array type needs an explicit size or an initializer
      55 | MODULE_DEVICE_TABLE(pci, sof_pci_ids);
         | ^
   include/linux/module.h:244:21: note: expanded from macro 'MODULE_DEVICE_TABLE'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |                     ^
   <scratch space>:30:1: note: expanded from here
      30 | __mod_pci__sof_pci_ids_device_table
         | ^
   17 warnings and 4 errors generated.


vim +/PCI_DEVICE_ID_INTEL_HDA_PTL +52 sound/soc/sof/intel/pci-ptl.c

    49	
    50	/* PCI IDs */
    51	static const struct pci_device_id sof_pci_ids[] = {
  > 52		{ PCI_DEVICE_DATA(INTEL, HDA_PTL, &ptl_desc) }, /* PTL */
    53		{ 0, }
    54	};
  > 55	MODULE_DEVICE_TABLE(pci, sof_pci_ids);
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
