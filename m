Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BC216D9CF;
	Wed, 12 Jun 2024 09:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718184226; cv=none; b=nZMwArJpYm0WBhPV4oBmv/5TwngBIE/cwCrbTm5CF0zkq3rnIqZvBN8wmh/tCMjMMJ0YZcD4tzrXMyWi+rWxYSiwvom+2SPIas7YNKWAMyy2bTPMZvfPWOl7DiC6pkN0RqrDW7j2lbd3o8CQoXeHufLzO/YRoStf0jXx3caTi/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718184226; c=relaxed/simple;
	bh=2RQUB5p99djTQLkljiuGmo8nQAUbsFMfxfASFlupWgc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ebR3EdEvh9dG2xolTcefs3Bzy7csgQarvvbYDvw4QjnUbC4LC4j4wxvN8dPR1Nnga65xA1RqdaBnLdfgQGKO3ggvZ0C6DiWGwW43+61LxAALOsZ8k2LLRWj/hPvqJ+vwCsRFINQ7gjq2L9guW3Y0D2F84BDf+Z5/hHP2YwNdBn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AAZ4Df+G; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AAZ4Df+G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718184224; x=1749720224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2RQUB5p99djTQLkljiuGmo8nQAUbsFMfxfASFlupWgc=;
  b=AAZ4Df+GYnk+7mqOOx/q84vpR695SiE+CzADtp6akGBE0xzOWRU5PdTG
   y3EteZc+RWz0EL3LvZ+F6lVMBZFzKpPW8+V8XCg1uZKFqJcORIzSL3uLz
   0i3HyB1S6HrqQGfOygUqrqVQmFH3xYqEIGc43SduNvFl5DT7yvtJQHBdm
   cpYDZycumslpeRIsPMo3r/BoSrGM2Na6C4aaaca4drMGXrAGVxcIqOhGZ
   zN0S8DwmzWvgGQLm43BQt2EHCJpzaK8pz1bMUWCBMsPCsTYSNFZwybaQ/
   RUx2xmaSxcJqT2ebnBtW9MvfPsQX4kltlfAbQF35nwHVghphJEbt1nLW7
   w==;
X-CSE-ConnectionGUID: jVLmmpXaTgGiert2SYiBAg==
X-CSE-MsgGUID: M+lkVfeXT8q8mLEEnFTjvA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="18795048"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="18795048"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 02:23:44 -0700
X-CSE-ConnectionGUID: yioRuD7wRzGDKTS+TUD4zQ==
X-CSE-MsgGUID: Z2+kpXtxRGmdqxfjdLCtnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="62904471"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Jun 2024 02:23:42 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHKCi-0001PK-11;
	Wed, 12 Jun 2024 09:23:40 +0000
Date: Wed, 12 Jun 2024 17:22:55 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diff 3/3] drivers/infiniband/hw/mlx5/dm.c:598:1:
 error: redefinition of '_object_methods_UVERBS_OBJECT_DM0'
Message-ID: <202406121704.M1qPiECz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   8d7a4a25d5c44f7e03ab4145e1957f0b0cdb8c13
commit: 8d7a4a25d5c44f7e03ab4145e1957f0b0cdb8c13 [3/3] todo
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240612/202406121704.M1qPiECz-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 4403cdbaf01379de96f8d0d6ea4f51a085e37766)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406121704.M1qPiECz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406121704.M1qPiECz-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> warning: unknown warning option '-Wno-dangling-pointer' [-Wunknown-warning-option]
>> warning: unknown warning option '-Werror=designated-init' [-Wunknown-warning-option]
   warning: unknown warning option '-Wrestrict' [-Wunknown-warning-option]
   warning: unknown warning option '-Wpacked-not-aligned'; did you mean '-Wpacked-non-pod'? [-Wunknown-warning-option]
   warning: unknown warning option '-Wstringop-truncation'; did you mean '-Wformat-truncation'? [-Wunknown-warning-option]
   In file included from <built-in>:360:
>> <command line>:5:9: warning: redefining builtin macro [-Wbuiltin-macro-redefined]
       5 | #define __LINE__ 0
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:27:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:27:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:27:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   23 warnings generated.
--
>> warning: unknown warning option '-Wno-dangling-pointer' [-Wunknown-warning-option]
>> warning: unknown warning option '-Werror=designated-init' [-Wunknown-warning-option]
   warning: unknown warning option '-Wrestrict' [-Wunknown-warning-option]
   warning: unknown warning option '-Wpacked-not-aligned'; did you mean '-Wpacked-non-pod'? [-Wunknown-warning-option]
   warning: unknown warning option '-Wstringop-truncation'; did you mean '-Wformat-truncation'? [-Wunknown-warning-option]
   In file included from <built-in>:360:
>> <command line>:5:9: warning: redefining builtin macro [-Wbuiltin-macro-redefined]
       5 | #define __LINE__ 0
         |         ^
   6 warnings generated.
--
>> warning: unknown warning option '-Wno-dangling-pointer' [-Wunknown-warning-option]
>> warning: unknown warning option '-Werror=designated-init' [-Wunknown-warning-option]
   warning: unknown warning option '-Wrestrict' [-Wunknown-warning-option]
   warning: unknown warning option '-Wpacked-not-aligned'; did you mean '-Wpacked-non-pod'? [-Wunknown-warning-option]
   warning: unknown warning option '-Wstringop-truncation'; did you mean '-Wformat-truncation'? [-Wunknown-warning-option]
   In file included from <built-in>:360:
>> <command line>:5:9: warning: redefining builtin macro [-Wbuiltin-macro-redefined]
       5 | #define __LINE__ 0
         |         ^
   In file included from arch/s390/kernel/idle.c:14:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   11 warnings generated.
--
>> warning: unknown warning option '-Wno-dangling-pointer' [-Wunknown-warning-option]
>> warning: unknown warning option '-Werror=designated-init' [-Wunknown-warning-option]
   warning: unknown warning option '-Wrestrict' [-Wunknown-warning-option]
   warning: unknown warning option '-Wpacked-not-aligned'; did you mean '-Wpacked-non-pod'? [-Wunknown-warning-option]
   warning: unknown warning option '-Wstringop-truncation'; did you mean '-Wformat-truncation'? [-Wunknown-warning-option]
   In file included from <built-in>:360:
   <command line>:6:9: warning: redefining builtin macro [-Wbuiltin-macro-redefined]
       6 | #define __LINE__ 0
         |         ^
   6 warnings generated.
--
>> warning: unknown warning option '-Wno-dangling-pointer' [-Wunknown-warning-option]
>> warning: unknown warning option '-Werror=designated-init' [-Wunknown-warning-option]
   warning: unknown warning option '-Wrestrict' [-Wunknown-warning-option]
   warning: unknown warning option '-Wpacked-not-aligned'; did you mean '-Wpacked-non-pod'? [-Wunknown-warning-option]
   warning: unknown warning option '-Wstringop-truncation'; did you mean '-Wformat-truncation'? [-Wunknown-warning-option]
   In file included from <built-in>:360:
>> <command line>:5:9: warning: redefining builtin macro [-Wbuiltin-macro-redefined]
       5 | #define __LINE__ 0
         |         ^
   In file included from arch/s390/kernel/lgr.c:17:
   In file included from arch/s390/include/asm/ipl.h:13:
   In file included from arch/s390/include/asm/cio.h:10:
   In file included from arch/s390/include/asm/dma-types.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from arch/s390/kernel/lgr.c:17:
   In file included from arch/s390/include/asm/ipl.h:13:
   In file included from arch/s390/include/asm/cio.h:10:
   In file included from arch/s390/include/asm/dma-types.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from arch/s390/kernel/lgr.c:17:
   In file included from arch/s390/include/asm/ipl.h:13:
   In file included from arch/s390/include/asm/cio.h:10:
   In file included from arch/s390/include/asm/dma-types.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   18 warnings generated.
--
>> warning: unknown warning option '-Wno-dangling-pointer' [-Wunknown-warning-option]
>> warning: unknown warning option '-Werror=designated-init' [-Wunknown-warning-option]
   warning: unknown warning option '-Wrestrict' [-Wunknown-warning-option]
   warning: unknown warning option '-Wpacked-not-aligned'; did you mean '-Wpacked-non-pod'? [-Wunknown-warning-option]
   warning: unknown warning option '-Wstringop-truncation'; did you mean '-Wformat-truncation'? [-Wunknown-warning-option]
   In file included from <built-in>:360:
>> <command line>:5:9: warning: redefining builtin macro [-Wbuiltin-macro-redefined]
       5 | #define __LINE__ 0
         |         ^
   In file included from arch/s390/kernel/perf_pai_crypto.c:17:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from arch/s390/kernel/perf_pai_crypto.c:17:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from arch/s390/kernel/perf_pai_crypto.c:17:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from arch/s390/kernel/perf_pai_crypto.c:18:
   In file included from include/linux/perf_event.h:25:
   In file included from arch/s390/include/asm/perf_event.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   23 warnings generated.
..


vim +/_object_methods_UVERBS_OBJECT_DM0 +598 drivers/infiniband/hw/mlx5/dm.c

cea85fa5dbc2e0 Maor Gottlieb 2021-04-11  561  
18731642d4e1f7 Maor Gottlieb 2021-04-11  562  DECLARE_UVERBS_NAMED_METHOD(
18731642d4e1f7 Maor Gottlieb 2021-04-11  563  	MLX5_IB_METHOD_DM_QUERY,
18731642d4e1f7 Maor Gottlieb 2021-04-11  564  	UVERBS_ATTR_IDR(MLX5_IB_ATTR_QUERY_DM_REQ_HANDLE, UVERBS_OBJECT_DM,
18731642d4e1f7 Maor Gottlieb 2021-04-11  565  			UVERBS_ACCESS_READ, UA_MANDATORY),
18731642d4e1f7 Maor Gottlieb 2021-04-11  566  	UVERBS_ATTR_PTR_OUT(MLX5_IB_ATTR_QUERY_DM_RESP_START_OFFSET,
18731642d4e1f7 Maor Gottlieb 2021-04-11  567  			    UVERBS_ATTR_TYPE(u64), UA_MANDATORY),
18731642d4e1f7 Maor Gottlieb 2021-04-11  568  	UVERBS_ATTR_PTR_OUT(MLX5_IB_ATTR_QUERY_DM_RESP_PAGE_INDEX,
18731642d4e1f7 Maor Gottlieb 2021-04-11  569  			    UVERBS_ATTR_TYPE(u16), UA_MANDATORY),
18731642d4e1f7 Maor Gottlieb 2021-04-11  570  	UVERBS_ATTR_PTR_OUT(MLX5_IB_ATTR_QUERY_DM_RESP_LENGTH,
18731642d4e1f7 Maor Gottlieb 2021-04-11  571  			    UVERBS_ATTR_TYPE(u64), UA_MANDATORY));
18731642d4e1f7 Maor Gottlieb 2021-04-11  572  
831df88381f73b Maor Gottlieb 2021-04-11  573  ADD_UVERBS_ATTRIBUTES_SIMPLE(
831df88381f73b Maor Gottlieb 2021-04-11  574  	mlx5_ib_dm, UVERBS_OBJECT_DM, UVERBS_METHOD_DM_ALLOC,
831df88381f73b Maor Gottlieb 2021-04-11  575  	UVERBS_ATTR_PTR_OUT(MLX5_IB_ATTR_ALLOC_DM_RESP_START_OFFSET,
831df88381f73b Maor Gottlieb 2021-04-11  576  			    UVERBS_ATTR_TYPE(u64), UA_MANDATORY),
831df88381f73b Maor Gottlieb 2021-04-11  577  	UVERBS_ATTR_PTR_OUT(MLX5_IB_ATTR_ALLOC_DM_RESP_PAGE_INDEX,
831df88381f73b Maor Gottlieb 2021-04-11  578  			    UVERBS_ATTR_TYPE(u16), UA_OPTIONAL),
831df88381f73b Maor Gottlieb 2021-04-11  579  	UVERBS_ATTR_CONST_IN(MLX5_IB_ATTR_ALLOC_DM_REQ_TYPE,
831df88381f73b Maor Gottlieb 2021-04-11  580  			     enum mlx5_ib_uapi_dm_type, UA_OPTIONAL));
831df88381f73b Maor Gottlieb 2021-04-11  581  
cea85fa5dbc2e0 Maor Gottlieb 2021-04-11  582  DECLARE_UVERBS_NAMED_METHOD(
cea85fa5dbc2e0 Maor Gottlieb 2021-04-11  583  	MLX5_IB_METHOD_DM_MAP_OP_ADDR,
cea85fa5dbc2e0 Maor Gottlieb 2021-04-11  584  	UVERBS_ATTR_IDR(MLX5_IB_ATTR_DM_MAP_OP_ADDR_REQ_HANDLE,
cea85fa5dbc2e0 Maor Gottlieb 2021-04-11  585  			UVERBS_OBJECT_DM,
cea85fa5dbc2e0 Maor Gottlieb 2021-04-11  586  			UVERBS_ACCESS_READ,
cea85fa5dbc2e0 Maor Gottlieb 2021-04-11  587  			UA_MANDATORY),
cea85fa5dbc2e0 Maor Gottlieb 2021-04-11  588  	UVERBS_ATTR_PTR_IN(MLX5_IB_ATTR_DM_MAP_OP_ADDR_REQ_OP,
cea85fa5dbc2e0 Maor Gottlieb 2021-04-11  589  			   UVERBS_ATTR_TYPE(u8),
cea85fa5dbc2e0 Maor Gottlieb 2021-04-11  590  			   UA_MANDATORY),
cea85fa5dbc2e0 Maor Gottlieb 2021-04-11  591  	UVERBS_ATTR_PTR_OUT(MLX5_IB_ATTR_DM_MAP_OP_ADDR_RESP_START_OFFSET,
cea85fa5dbc2e0 Maor Gottlieb 2021-04-11  592  			    UVERBS_ATTR_TYPE(u64),
cea85fa5dbc2e0 Maor Gottlieb 2021-04-11  593  			    UA_MANDATORY),
cea85fa5dbc2e0 Maor Gottlieb 2021-04-11  594  	UVERBS_ATTR_PTR_OUT(MLX5_IB_ATTR_DM_MAP_OP_ADDR_RESP_PAGE_INDEX,
cea85fa5dbc2e0 Maor Gottlieb 2021-04-11  595  			    UVERBS_ATTR_TYPE(u16),
cea85fa5dbc2e0 Maor Gottlieb 2021-04-11  596  			    UA_OPTIONAL));
cea85fa5dbc2e0 Maor Gottlieb 2021-04-11  597  
cea85fa5dbc2e0 Maor Gottlieb 2021-04-11 @598  DECLARE_UVERBS_GLOBAL_METHODS(UVERBS_OBJECT_DM,
18731642d4e1f7 Maor Gottlieb 2021-04-11  599  			      &UVERBS_METHOD(MLX5_IB_METHOD_DM_MAP_OP_ADDR),
18731642d4e1f7 Maor Gottlieb 2021-04-11  600  			      &UVERBS_METHOD(MLX5_IB_METHOD_DM_QUERY));
cea85fa5dbc2e0 Maor Gottlieb 2021-04-11  601  

:::::: The code at line 598 was first introduced by commit
:::::: cea85fa5dbc2e0206b58095c0c12ff035b11d129 RDMA/mlx5: Add support in MEMIC operations

:::::: TO: Maor Gottlieb <maorg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
