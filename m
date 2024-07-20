Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33FC13AA35;
	Sat, 20 Jul 2024 15:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721488592; cv=none; b=mahwm10wYtO6Gj3eIkcIHX0xhZ1stF3Lnu2GEZ9k15FTrz9MhUdNQFdfBj1jpUvJ5H5OtsK95gHnNEImxtP1HFftcv9uheSHbXu5geN60hO4TralGz7UdKm2U9UC6G9YcawZZy2UNRxc5Ul6y7TM/Jlo8DAn47RshPZ67OKq82U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721488592; c=relaxed/simple;
	bh=VfHHwG90riVulejEb8imt9hPI0kE9VjxQiK6L9TNPjg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I8tX8c3v16qBU8CP7edvQpHj7dx/yDghKY5EcCOpA1s36VSC7FFkWC0tspYbAf+jaOxoJ9cVW9Gg2dXxj+1kx0CYK8lGTO16N0pHjTv1k8WfODBZY/lZqrOhCl2hCew8+bicIWrP91GYnZKLAkR0IvRWfkA6XPgRMC4Apu555IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=joiOQlqA; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="joiOQlqA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721488592; x=1753024592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VfHHwG90riVulejEb8imt9hPI0kE9VjxQiK6L9TNPjg=;
  b=joiOQlqAgOGsSkyR8IHGL9F9IBewL/6RKJOr6urCc1njOLSyAUnGMHAF
   ZxdE6f6EpVWatRrbyrOgS5HNkcaLVjBGmdL0XOptVKGIeopFxhFUHKR1m
   3vEGX7ImFogC1jfKDUB6JQ8A5kSBQCwUa12LB6hSq2ScO8SfKe4w3VGyI
   hu65EzbJrKVCnHCGHGOXkorKioKRLhDid0f0RrQv0RMT5IzPQg189V9+E
   VvR02Yqa1ZTv5fuceWVsTxRrJmRRP/W4O5JI7ctzl5xNlHv75YMG80E0d
   yfvsDic826f6i0S4cWLWF8Q6SsWQWLjS/SQXQnfW6fgBOFhl7IT2ONWxN
   g==;
X-CSE-ConnectionGUID: STFRcOUWQniR0vAbNeVOuw==
X-CSE-MsgGUID: lAPw5VVvQkGWc27oyLsSNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="19232127"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="19232127"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 08:16:28 -0700
X-CSE-ConnectionGUID: BNqPcu1/S9yFzi/m+Q99eg==
X-CSE-MsgGUID: /7jwRG9eTke1D7iO6o4r6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="88871731"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Jul 2024 08:16:26 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVBou-000jKU-16;
	Sat, 20 Jul 2024 15:16:24 +0000
Date: Sat, 20 Jul 2024 23:16:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable2 40/42] arch/s390/include/asm/pgalloc.h:147:6:
 error: conflicting types for 'pte_free_defer'
Message-ID: <202407202358.uLTykVrw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable2
head:   17ce8ec8001d3efaa81c659d6ec565025c3f42b0
commit: 5977eb978554280c83da90a90ef2916b90b65a5f [40/42] mm/pgtable: pass ptdesc in pte_free_defer()
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240720/202407202358.uLTykVrw-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407202358.uLTykVrw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407202358.uLTykVrw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2221:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:27:
   In file included from include/linux/irq.h:20:
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
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:27:
   In file included from include/linux/irq.h:20:
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
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:27:
   In file included from include/linux/irq.h:20:
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
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:27:
   In file included from include/linux/irq.h:591:
   In file included from arch/s390/include/asm/hw_irq.h:6:
   In file included from include/linux/pci.h:37:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
>> arch/s390/include/asm/pgalloc.h:147:6: error: conflicting types for 'pte_free_defer'
     147 | void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable);
         |      ^
   arch/s390/include/asm/pgalloc.h:146:24: note: expanded from macro 'pte_free_defer'
     146 | #define pte_free_defer pte_free_defer
         |                        ^
   include/linux/pgtable.h:119:6: note: previous declaration is here
     119 | void pte_free_defer(struct mm_struct *mm, struct ptdesc *ptdesc);
         |      ^
   13 warnings and 1 error generated.
   make[3]: *** [scripts/Makefile.build:117: arch/s390/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1208: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/pte_free_defer +147 arch/s390/include/asm/pgalloc.h

^1da177e4c3f41 include/asm-s390/pgalloc.h      Linus Torvalds 2005-04-16  144  
8211dad6279817 arch/s390/include/asm/pgalloc.h Hugh Dickins   2023-07-11  145  /* arch use pte_free_defer() implementation in arch/s390/mm/pgalloc.c */
8211dad6279817 arch/s390/include/asm/pgalloc.h Hugh Dickins   2023-07-11  146  #define pte_free_defer pte_free_defer
8211dad6279817 arch/s390/include/asm/pgalloc.h Hugh Dickins   2023-07-11 @147  void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable);
8211dad6279817 arch/s390/include/asm/pgalloc.h Hugh Dickins   2023-07-11  148  

:::::: The code at line 147 was first introduced by commit
:::::: 8211dad6279817a8966ff6b74c2c588dd4166f45 s390: add pte_free_defer() for pgtables sharing page

:::::: TO: Hugh Dickins <hughd@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
