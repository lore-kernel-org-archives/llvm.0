Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B611ACEB7;
	Wed, 18 Dec 2024 13:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734528773; cv=none; b=KuMVoyYm4HCuvrYVxwzj0jL6ONcLmZVvNpe5zgiGQh+tHlRj1cljmJ+vK+DjlNmnxyHCnmrpqLRpHj5DffyksXJcRLDIH+N9iH6NmCfFLgy8qi22mkyG7emWBPol1pX8OCLMO7kyE39si2IUl0udPu+RkXW1aN+OSGA4YdiQr9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734528773; c=relaxed/simple;
	bh=HJK0sU7MoPOFapf5lGE1W1KDm9N6stCESjyLXeAmf/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WboTQj6PkyxwkV08uBAp74wjaXtyL4I+I7LeD7Lyu2ENIZzxncwumdIlYU3elgy6yxbF9u/vLcbIHkZVn8cwO9EwGrOd+BcVMZsghqUBOVKBTATIhtcSqtC/wMYpkqEmwBkqoiu8jUds5aLeLpowgWbNEtKHddBBsCLSnUrHbeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yqi268uG; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yqi268uG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734528772; x=1766064772;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HJK0sU7MoPOFapf5lGE1W1KDm9N6stCESjyLXeAmf/s=;
  b=Yqi268uGt2fggbXRPDFRobNL58+u8+G3tkAAVtAIt33YxXE1L2aeMj14
   A6W5Jot9/gOQB3Z1AHRX3pwfJCPX9tus9zYB8nIaJJHkL+wmoCm9HzaN0
   E7cShdClP09uu0shdYnDP0pqkPKhRme5hErIRCDfgElJjhyOnu3TXVxJU
   wxWVhALWvCeUsmS8Kl1YvuwNubP3DHTrbzDqZAfXil7hi5Ltd8MHjLYc7
   Rya9NHULbITPJOCi4rah+IWNBGGRNrxkVOdFh6qBJ+qbqZMrTEfXW7boy
   4nM9cn9uNq5gikcE/bPmEaEpicAmeRiPAzc1hfxQQlA5DyQI/tFRLrqoy
   Q==;
X-CSE-ConnectionGUID: NDTzet39QFykIW67Z83sWQ==
X-CSE-MsgGUID: VRNFPRn3QlmHcEYVRGMSmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="52414449"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="52414449"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 05:32:51 -0800
X-CSE-ConnectionGUID: z7hmA9i0Q7CU7hQa/LHW/w==
X-CSE-MsgGUID: WsFaVOzLRe+Z4L3bo0IU0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="98684806"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Dec 2024 05:32:50 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNuAQ-000GMI-2j;
	Wed, 18 Dec 2024 13:32:46 +0000
Date: Wed, 18 Dec 2024 21:32:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [arm-integrator:p4d_pgd_cdtor 9/10]
 arch/hexagon/include/asm/pgalloc.h:25:2: error: use of undeclared identifier
 'ret'
Message-ID: <202412182106.MIbADAW5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git p4d_pgd_cdtor
head:   5453d8f69ac04a3a31ea973f98de9e0c58248a42
commit: e6431575bf2a3fe883edca4d6d647886a37e3811 [9/10] asm-generic: pgalloc: Provide generic __pgd_{alloc,free}
config: hexagon-randconfig-001-20241218 (https://download.01.org/0day-ci/archive/20241218/202412182106.MIbADAW5-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 2dc22615fd46ab2566d0f26d5ba234ab12dc4bf8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412182106.MIbADAW5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412182106.MIbADAW5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from io_uring/sqpoll.c:9:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from io_uring/sqpoll.c:12:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from io_uring/sqpoll.c:12:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from io_uring/sqpoll.c:12:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from io_uring/sqpoll.c:13:
   In file included from include/linux/cpuset.h:18:
   In file included from include/linux/mmu_context.h:5:
   In file included from arch/hexagon/include/asm/mmu_context.h:15:
>> arch/hexagon/include/asm/pgalloc.h:25:2: error: use of undeclared identifier 'ret'
      25 |         ret = __pgd_alloc(mm, 0);
         |         ^
   7 warnings and 1 error generated.
--
   In file included from io_uring/io-wq.c:16:
   In file included from include/linux/cpuset.h:17:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from io_uring/io-wq.c:16:
   In file included from include/linux/cpuset.h:18:
   In file included from include/linux/mmu_context.h:5:
   In file included from arch/hexagon/include/asm/mmu_context.h:15:
>> arch/hexagon/include/asm/pgalloc.h:25:2: error: use of undeclared identifier 'ret'
      25 |         ret = __pgd_alloc(mm, 0);
         |         ^
   In file included from io_uring/io-wq.c:22:
   In file included from io_uring/io-wq.h:5:
   In file included from include/linux/io_uring_types.h:4:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from io_uring/io-wq.c:22:
   In file included from io_uring/io-wq.h:5:
   In file included from include/linux/io_uring_types.h:4:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from io_uring/io-wq.c:22:
   In file included from io_uring/io-wq.h:5:
   In file included from include/linux/io_uring_types.h:4:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   7 warnings and 1 error generated.


vim +/ret +25 arch/hexagon/include/asm/pgalloc.h

    17	
    18	/*
    19	 * Page table creation interface
    20	 */
    21	static inline pgd_t *pgd_alloc(struct mm_struct *mm)
    22	{
    23		pgd_t *pgd;
    24	
  > 25		ret = __pgd_alloc(mm, 0);
    26	
    27		/*
    28		 * There may be better ways to do this, but to ensure
    29		 * that new address spaces always contain the kernel
    30		 * base mapping, and to ensure that the user area is
    31		 * initially marked invalid, initialize the new map
    32		 * map with a copy of the kernel's persistent map.
    33		 */
    34	
    35		memcpy(pgd, swapper_pg_dir, PTRS_PER_PGD*sizeof(pgd_t));
    36		mm->context.generation = kmap_generation;
    37	
    38		/* Physical version is what is passed to virtual machine on switch */
    39		mm->context.ptbase = __pa(pgd);
    40	
    41		return pgd;
    42	}
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
