Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F581223DCE;
	Sat, 13 Jun 2026 22:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781390625; cv=none; b=soE0g7XTTuFpoPkRETRWrD1pGWENtZSjCUfSopAePAxh1Jbsm8AyhjH0/dwdC6Yv4T7lN51ViWDBup5n9pl6Mw5aNo+oGlMp3wEGro5LWpujEV+UamwakYYqA3I1Zm+C+tqUp5/feUl1UoFwjmbYuL5ElSJRheLxq461WtAPuPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781390625; c=relaxed/simple;
	bh=d+6rFv3YdWVIFSh8VqcBv5LRJ2tSIEdLmKtMpKsYxHQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RDWFAOsyLcVXkxVdh+V5ijzSei86C0FVERYUbg8R5EWBz3pip2EPVjnWWv7CbUk88i4kzmqe4VPEiheGMLZgXk2kL6s3FBy1a334LawpOw35kcMSipm6a3PkDApoQwjVTxjcgdHZ5QoiB30fqTSn1OaK3PmZSV8O2gJQM9bIwgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KfauS6WB; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KfauS6WB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781390624; x=1812926624;
  h=date:from:to:cc:subject:message-id;
  bh=d+6rFv3YdWVIFSh8VqcBv5LRJ2tSIEdLmKtMpKsYxHQ=;
  b=KfauS6WB50cTSH8+FvnltQOIjskHlfwnGF9jC8INnGF+XkpBlr71npdf
   CtvhSs4zYtP0zRBosBRYU6hDSfILEMqWC1W85SMLx8R5CQFOnzwTkIY95
   wjn+BRUr4Vdmu3GSh2YMaex1PucTZSNrVNQrQp+NY94iCLuusbfB6Ivbb
   6CNC6/vvJjVfIicfMRhn5BQL8LE6Lvj0rjTbHx6ingoobFH+ynVamaOVi
   hekbMHAIYwH2xfbrLA2NFU/rUrqjBMLaaeK2hW3iDtyWgCtDWBi3/IMNs
   8H3GoFRC5y1QaHonW5PoTPlir9rl1+PAx0C14D37sZB9aysMpjESDi03W
   w==;
X-CSE-ConnectionGUID: FUXApI78ScmS+ZIYHIh5OQ==
X-CSE-MsgGUID: c9tXIsSoSciEH/fooKjwbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="82372776"
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="82372776"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 15:43:44 -0700
X-CSE-ConnectionGUID: X40GeLAlRy+fkH/xGJ0Oew==
X-CSE-MsgGUID: R+9ozcfYQtSyBAqeZz96iw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Jun 2026 15:43:41 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYX4k-00000000QKg-2kWr;
	Sat, 13 Jun 2026 22:43:38 +0000
Date: Sun, 14 Jun 2026 06:43:31 +0800
From: kernel test robot <lkp@intel.com>
To: Ming Lei <ming.lei@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@suse.de>,
 Nilay Shroff <nilay@linux.ibm.com>
Subject: arch/um/drivers/ubd_kern.c:780:13: warning: stack frame size
 (2152) exceeds limit (2048) in 'ubd_device_release'
Message-ID: <202606140630.5Zgn7q8o-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Ming,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2b07ea76fd28989bde5993532d7a943a6f90e246
commit: 98e68f67020ce30e1a4d8e2d05d85a453738dfb8 block: prevent adding/deleting disk during updating nr_hw_queues
date:   1 year, 1 month ago
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260614/202606140630.5Zgn7q8o-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 305faf498a4e0b52b40742c927af63ab2082e1a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606140630.5Zgn7q8o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 98e68f67020c ("block: prevent adding/deleting disk during updating nr_hw_queues")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606140630.5Zgn7q8o-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:352:9: note: previous definition is here
     352 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from arch/um/drivers/ubd_kern.c:26:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
   In file included from arch/um/drivers/ubd_kern.c:26:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
   In file included from arch/um/drivers/ubd_kern.c:26:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
   arch/um/drivers/ubd_kern.c:1495:12: warning: variable 'io_count' set but not used [-Wunused-but-set-global]
    1495 | static int io_count;
         |            ^
>> arch/um/drivers/ubd_kern.c:780:13: warning: stack frame size (2152) exceeds limit (2048) in 'ubd_device_release' [-Wframe-larger-than]
     780 | static void ubd_device_release(struct device *dev)
         |             ^
   15 warnings generated.


vim +/ubd_device_release +780 arch/um/drivers/ubd_kern.c

^1da177e4c3f415 Linus Torvalds     2005-04-16  779  
2e3f5251ac71687 Jeff Dike          2007-05-06 @780  static void ubd_device_release(struct device *dev)
2e3f5251ac71687 Jeff Dike          2007-05-06  781  {
5bee35e5389f450 Tiwei Bie          2024-11-05  782  	struct ubd *ubd_dev = container_of(dev, struct ubd, pdev.dev);
2e3f5251ac71687 Jeff Dike          2007-05-06  783  
4e6da0fe8058df9 Richard Weinberger 2017-11-26  784  	blk_mq_free_tag_set(&ubd_dev->tag_set);
2e3f5251ac71687 Jeff Dike          2007-05-06  785  	*ubd_dev = ((struct ubd) DEFAULT_UBD);
2e3f5251ac71687 Jeff Dike          2007-05-06  786  }
2e3f5251ac71687 Jeff Dike          2007-05-06  787  

:::::: The code at line 780 was first introduced by commit
:::::: 2e3f5251ac716879df6b6271f243f657c6e02e9a uml: drivers get release methods

:::::: TO: Jeff Dike <jdike@addtoit.com>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
