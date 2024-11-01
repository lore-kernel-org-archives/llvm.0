Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A4013C67C;
	Fri,  1 Nov 2024 02:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730428939; cv=none; b=ngB39xs7fum0Dm3g8EVKcBdtBSYPwM9aPTjz6i3Xj1Z/hbNFQ3cuk3xiwEBCLRR6B3DFVqzsufikRamG0Rq9EAIcwPQ41oDQ+p8pnv314AEZ28fWIZ0qiuoJlQDjd59RRVmzowTLY3SfJy6IepwJrJq/QHmqSLmEE9JD2PidYkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730428939; c=relaxed/simple;
	bh=NWvtRPPypRkjOn9lgHhIxrLyJ1hgJvd8zENcQLONLyg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l7DIrqjyVXC18j95w3inxWBYjstS+OLFjbp7ELEWJjvTJSK9chwv1u30RnmS2MqPhf5679pku8J/WdbSbcs5XZwdh0rsrG8K3vYB6eR7aUMLKvZDiOL95yQpdQMaKj0IsUDEpQg8h1wC23T9wd8nvdVdHTKR8Y79LT0KXbkloyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m+fk6atq; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m+fk6atq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730428933; x=1761964933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NWvtRPPypRkjOn9lgHhIxrLyJ1hgJvd8zENcQLONLyg=;
  b=m+fk6atqR4I8TczLGQYaFURbPX8he8FlmhZ/J6+0uf9K6JFD31Ckvk4N
   npU6Cn0nNEA2NvIc5gIZvEVMB6QeNvaoXFWcbwNSUabCPf0G3V9VFqazO
   mPoDy+R6vTz/na5t5G/MsVOVZ0cDOVGgtrJjVfS2VpDrdsPcoYqbTouGU
   DcgmHRjNrVI7eaMJQfOB+ukLGUTKwN0g5WwZ8d7nSM5v7K5QchzAKaB+B
   NHMB8gcYE9lJC/oqukLOuG1qP6Q2CYvKkTbcoQwRN8lDpaDshOb8czLtn
   a3D4JYAbwsxIt4CAqxtrKWnDUAgX938rPAUQBwGT9DEzhgrzLVdUem98W
   Q==;
X-CSE-ConnectionGUID: ACh1/VPWSDigGaKrbjHjeA==
X-CSE-MsgGUID: CA7vVS1iTgeO5ROxZcKeQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33880828"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="33880828"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 19:42:05 -0700
X-CSE-ConnectionGUID: xNo2GMFtT5CurpjzSQFK2A==
X-CSE-MsgGUID: sBwAVZx8Ty2VYgOLo7ObBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="113671412"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Oct 2024 19:42:04 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6hbt-000h3M-2Y;
	Fri, 01 Nov 2024 02:42:01 +0000
Date: Fri, 1 Nov 2024 10:41:32 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/extended-linear 5/5] drivers/cxl/core/mce.c:23:20:
 error: no member named 'x86_phys_bits' in 'struct cpuinfo_um'
Message-ID: <202411011004.o1eX0Z5P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/extended-linear
head:   82adadebb1e8f20174c708e13571db27b13c64c7
commit: 82adadebb1e8f20174c708e13571db27b13c64c7 [5/5] cxl: Add mce notifier to emit aliased address for extended linear cache
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20241101/202411011004.o1eX0Z5P-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411011004.o1eX0Z5P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411011004.o1eX0Z5P-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                                                  ^
   arch/x86/include/asm/mce.h:241:51: warning: declaration of 'struct cpuinfo_x86' will not be visible outside of this function [-Wvisibility]
     241 | static inline void mce_intel_feature_clear(struct cpuinfo_x86 *c) { }
         |                                                   ^
   arch/x86/include/asm/mce.h:248:26: warning: declaration of 'struct cpuinfo_x86' will not be visible outside of this function [-Wvisibility]
     248 | int mce_available(struct cpuinfo_x86 *c);
         |                          ^
   arch/x86/include/asm/mce.h:355:48: warning: declaration of 'struct cpuinfo_x86' will not be visible outside of this function [-Wvisibility]
     355 | static inline void mce_amd_feature_init(struct cpuinfo_x86 *c)          { }
         |                                                ^
   arch/x86/include/asm/mce.h:358:50: warning: declaration of 'struct cpuinfo_x86' will not be visible outside of this function [-Wvisibility]
     358 | static inline void mce_hygon_feature_init(struct cpuinfo_x86 *c)        { return mce_amd_feature_init(c); }
         |                                                  ^
   arch/x86/include/asm/mce.h:358:96: error: incompatible pointer types passing 'struct cpuinfo_x86 *' to parameter of type 'struct cpuinfo_x86 *' [-Werror,-Wincompatible-pointer-types]
     358 | static inline void mce_hygon_feature_init(struct cpuinfo_x86 *c)        { return mce_amd_feature_init(c); }
         |                                                                                                       ^
   arch/x86/include/asm/mce.h:355:61: note: passing argument to parameter 'c' here
     355 | static inline void mce_amd_feature_init(struct cpuinfo_x86 *c)          { }
         |                                                             ^
   In file included from drivers/cxl/core/mce.c:6:
   In file included from drivers/cxl/cxlmem.h:6:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/cxl/core/mce.c:6:
   In file included from drivers/cxl/cxlmem.h:6:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/cxl/core/mce.c:6:
   In file included from drivers/cxl/cxlmem.h:6:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
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
   In file included from drivers/cxl/core/mce.c:6:
   In file included from drivers/cxl/cxlmem.h:6:
   In file included from include/linux/pci.h:1650:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/cxl/core/mce.c:23:20: error: no member named 'x86_phys_bits' in 'struct cpuinfo_um'
      23 |         spa = mce->addr & MCI_ADDR_PHYSADDR;
         |                           ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/mce.h:94:53: note: expanded from macro 'MCI_ADDR_PHYSADDR'
      94 | #define MCI_ADDR_PHYSADDR       GENMASK_ULL(boot_cpu_data.x86_phys_bits - 1, 0)
         |                                             ~~~~~~~~~~~~~ ^
   include/linux/bits.h:37:23: note: expanded from macro 'GENMASK_ULL'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
         |                              ^
   include/linux/bits.h:25:25: note: expanded from macro 'GENMASK_INPUT_CHECK'
      25 |                 __is_constexpr((l) > (h)), (l) > (h), 0)))
         |                                       ^
   include/linux/compiler.h:293:48: note: expanded from macro '__is_constexpr'
     293 |         (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
         |                                                       ^
   include/linux/build_bug.h:16:62: note: expanded from macro 'BUILD_BUG_ON_ZERO'
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                              ^
>> drivers/cxl/core/mce.c:23:20: error: no member named 'x86_phys_bits' in 'struct cpuinfo_um'
      23 |         spa = mce->addr & MCI_ADDR_PHYSADDR;
         |                           ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/mce.h:94:53: note: expanded from macro 'MCI_ADDR_PHYSADDR'
      94 | #define MCI_ADDR_PHYSADDR       GENMASK_ULL(boot_cpu_data.x86_phys_bits - 1, 0)
         |                                             ~~~~~~~~~~~~~ ^
   include/linux/bits.h:37:23: note: expanded from macro 'GENMASK_ULL'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
         |                              ^
   include/linux/bits.h:25:37: note: expanded from macro 'GENMASK_INPUT_CHECK'
      25 |                 __is_constexpr((l) > (h)), (l) > (h), 0)))
         |                                                   ^
   include/linux/build_bug.h:16:62: note: expanded from macro 'BUILD_BUG_ON_ZERO'
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                              ^
>> drivers/cxl/core/mce.c:23:20: error: no member named 'x86_phys_bits' in 'struct cpuinfo_um'
      23 |         spa = mce->addr & MCI_ADDR_PHYSADDR;
         |                           ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/mce.h:94:53: note: expanded from macro 'MCI_ADDR_PHYSADDR'
      94 | #define MCI_ADDR_PHYSADDR       GENMASK_ULL(boot_cpu_data.x86_phys_bits - 1, 0)
         |                                             ~~~~~~~~~~~~~ ^
   include/linux/bits.h:37:45: note: expanded from macro 'GENMASK_ULL'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
         |                                                    ^
   include/uapi/linux/bits.h:13:52: note: expanded from macro '__GENMASK_ULL'
      13 |          (~_ULL(0) >> (__BITS_PER_LONG_LONG - 1 - (h))))
         |                                                    ^
   20 warnings and 4 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +23 drivers/cxl/core/mce.c

     8	
     9	static int cxl_handle_mce(struct notifier_block *nb, unsigned long val,
    10				  void *data)
    11	{
    12		struct cxl_memdev_state *mds = container_of(nb, struct cxl_memdev_state,
    13							    mce_notifier);
    14		struct cxl_memdev *cxlmd = mds->cxlds.cxlmd;
    15		struct cxl_port *endpoint = cxlmd->endpoint;
    16		struct mce *mce = (struct mce *)data;
    17		u64 spa, spa_alias;
    18		unsigned long pfn;
    19	
    20		if (!mce || !mce_usable_address(mce))
    21			return NOTIFY_DONE;
    22	
  > 23		spa = mce->addr & MCI_ADDR_PHYSADDR;
    24	
    25		pfn = spa >> PAGE_SHIFT;
    26		if (!pfn_valid(pfn))
    27			return NOTIFY_DONE;
    28	
    29		spa_alias = cxl_port_get_spa_cache_alias(endpoint, spa);
    30		if (!spa_alias)
    31			return NOTIFY_DONE;
    32	
    33		pfn = spa_alias >> PAGE_SHIFT;
    34	
    35		/*
    36		 * Take down the aliased memory page. The original memory page flagged
    37		 * by the MCE will be taken cared of by the standard MCE handler.
    38		 */
    39		dev_emerg(mds->cxlds.dev, "Offlining aliased SPA address: %#llx\n",
    40			  spa_alias);
    41		if (!memory_failure(pfn, 0))
    42			set_mce_nospec(pfn);
    43	
    44		return NOTIFY_OK;
    45	}
    46	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
