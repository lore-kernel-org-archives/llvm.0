Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C9C1474B6;
	Thu, 11 Apr 2024 10:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712831425; cv=none; b=pDdPmya8+pJpZhusRr0d5zg2ox82bJ17i+LQ9SiA5aVfL5D8Mfi9j0a/y7zHq+Ta/4iyEiedTyq3jbuEidzMk5EA5ZjpzGmdzpaQO8E4ZPxnzJy/NhAqfu5AZLoDFzsZj2dBjeyy74WyRRjmSA26W7HaLyK+URAUjmIMNi2+Pj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712831425; c=relaxed/simple;
	bh=xwWz6WzblqLXZaOGbCppkbnOXhCj/HsxU71wZeTfN7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CGqJY+VDkOfVZfxeatR0O2gOKM05B3AJ4o1hkcrREivOH2D5E/GBy600idlTOxzpnmlEyyya1oqh/Vm38oBrPRFqCUxhsF6zrJ+a2qWmgi/jWQ6/rGNO+MekT+zbHkdRPElWiL9+Uynjzr2ZfbMcP0rl3iTd7/JSUtqFuRb7s6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=InTiVPzC; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="InTiVPzC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712831423; x=1744367423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xwWz6WzblqLXZaOGbCppkbnOXhCj/HsxU71wZeTfN7Q=;
  b=InTiVPzCMuSg/B3qWjjTTJxoEf2AjLjLzHbKL+nsiHEbDmYz/AJsiPgI
   vK81AAcG+sXV0ocNm3oq4Xje0aeN8ziklNQV+mRzuQ5gG+sFlRBfkPpyq
   8nuCHXpOm/okzU7AmcgagMelxPdKlR6tm1tE7p2ekHfGBez4yKfgj/RFR
   Dp9w27CeqTNczyRcu//1rq57sPBuHUgBFfSElwQLBTPq63ClvtbEC9T3a
   zfEpmFt5IsEWGiaDGj0+Qe8dRbfjWB8Hm7N1akeQKqdVzALB+gQ2Z0Wno
   KMUGpVxc9c+L5l011gi28X9TVkdwr4GFsmBKNfgu9nh155078POTLIDX9
   w==;
X-CSE-ConnectionGUID: v/oSgZD0QgG7p0wvoVS+Rw==
X-CSE-MsgGUID: xNK6LMvrQUaESmkLgvQQ5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19384463"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="19384463"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 03:30:21 -0700
X-CSE-ConnectionGUID: 5Jqp+hwNSw6rCeCCpW+4eQ==
X-CSE-MsgGUID: vGuiZIxWQQucg/C40RS0SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="25635448"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Apr 2024 03:30:20 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rurhB-0008W7-1f;
	Thu, 11 Apr 2024 10:30:17 +0000
Date: Thu, 11 Apr 2024 18:29:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/v4+x86-rox 16/23] arch/um/kernel/um_arch.c:473:7:
 warning: no previous prototype for function 'text_poke_copy'
Message-ID: <202404111824.LvZ6Iwcn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git execmem/v4+x86-rox
head:   98afa1d7e1d9deaee05261840ca6939daf8b6245
commit: 63d06c41f948a7ec5d1566a2398f72b87040b983 [16/23] asm-generic: introduce text-patching.h
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20240411/202404111824.LvZ6Iwcn-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111824.LvZ6Iwcn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111824.LvZ6Iwcn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/um/kernel/um_arch.c:19:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from arch/um/kernel/um_arch.c:19:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from arch/um/kernel/um_arch.c:19:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
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
   arch/um/kernel/um_arch.c:408:19: warning: no previous prototype for function 'read_initrd' [-Wmissing-prototypes]
     408 | int __init __weak read_initrd(void)
         |                   ^
   arch/um/kernel/um_arch.c:408:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     408 | int __init __weak read_initrd(void)
         | ^
         | static 
   arch/um/kernel/um_arch.c:461:7: warning: no previous prototype for function 'text_poke' [-Wmissing-prototypes]
     461 | void *text_poke(void *addr, const void *opcode, size_t len)
         |       ^
   arch/um/kernel/um_arch.c:461:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     461 | void *text_poke(void *addr, const void *opcode, size_t len)
         | ^
         | static 
>> arch/um/kernel/um_arch.c:473:7: warning: no previous prototype for function 'text_poke_copy' [-Wmissing-prototypes]
     473 | void *text_poke_copy(void *addr, const void *opcode, size_t len)
         |       ^
   arch/um/kernel/um_arch.c:473:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     473 | void *text_poke_copy(void *addr, const void *opcode, size_t len)
         | ^
         | static 
   arch/um/kernel/um_arch.c:478:6: warning: no previous prototype for function 'text_poke_sync' [-Wmissing-prototypes]
     478 | void text_poke_sync(void)
         |      ^
   arch/um/kernel/um_arch.c:478:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     478 | void text_poke_sync(void)
         | ^
         | static 
   16 warnings generated.


vim +/text_poke_copy +473 arch/um/kernel/um_arch.c

   472	
 > 473	void *text_poke_copy(void *addr, const void *opcode, size_t len)
   474	{
   475		return text_poke(addr, opcode, len);
   476	}
   477	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
