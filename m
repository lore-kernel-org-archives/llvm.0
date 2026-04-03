Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5414381AF9;
	Fri,  3 Apr 2026 08:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205848; cv=none; b=Kn+J53GZeios58jxeYqF4X3UPaol/8kwj39WrV/frpijll2m7i+WZVWnx77GZM4tjh8iFL4Sgysxrxd97oAU+NXNq0JK+iefNafAKp5AdiyG5doBtWzrc0W4MM3FFOyoLRckG98iIWCttwFNgMfmMQVtB8xg9th+cxc/dm3eI30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205848; c=relaxed/simple;
	bh=pTPqZhOaMgTEXrfFaxlIcHBzK4Roy3McN/4LyZ5dkJU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=koWIApqYFf87yq1Nxnn2eucKX6NnyR6bbUuqL5wWLd03L1b4UAGYaMvsSzho8thLUHf+niMCEZsd/SAJLvdLN37RlKAcLsGvLRqO7grUVjZKLS+F9HD5HiDEDug9yoaJffJMFWkkdI6JjckYw8g3c/YuvLOgN+PYW5g+2u/KSfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SbYJRKr9; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SbYJRKr9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205845; x=1806741845;
  h=date:from:to:cc:subject:message-id;
  bh=pTPqZhOaMgTEXrfFaxlIcHBzK4Roy3McN/4LyZ5dkJU=;
  b=SbYJRKr9OwUclILhoxZKJYbtjESfy3R7TWAKALBMRm4NF5fWX3MsgUQp
   wlUfgbwXsP1LC+77Rqnj4BC54YMEplbXwdTYN/J3IpZoZ0GZmQXqCQoE6
   OpGMUtqpvJcmMQlS962rf4cy9la1qWlIfTozk1Zvlid2Q7/HmTIuL0cxd
   OIlxafz0H0A4vpkYwhRyAOjSp6iLMsNyQk7hjPqTWkPmSG7Pw9m11FMu6
   /zaZi2TtyZyQG/qHMG6a/nIJ+BO0l85J6p0QsKildnMTt8hpvl2etgHXT
   1b5g1UteexJgqMFi2sWSRfhMFfBQpNqE5i8FhLxW0PnMVfM7o8xM9sIOr
   A==;
X-CSE-ConnectionGUID: U6eV19TmSp+qEmM1Fe0T+A==
X-CSE-MsgGUID: 7f7cG0XFREudQzcnfpJVPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="93852256"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="93852256"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:44:01 -0700
X-CSE-ConnectionGUID: lZkrJq+oTuKH01t2yCrMoA==
X-CSE-MsgGUID: R5YMWp32S5ucjDJisfmj0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="223943439"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Apr 2026 01:43:59 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a8C-0000000014k-0f8Q;
	Fri, 03 Apr 2026 08:43:56 +0000
Date: Fri, 03 Apr 2026 16:43:10 +0800
From: kernel test robot <lkp@intel.com>
To: Ming Lei <ming.lei@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@suse.de>,
 Nilay Shroff <nilay@linux.ibm.com>
Subject: arch/um/drivers/ubd_kern.c:780:13: warning: stack frame size
 (2152) exceeds limit (2048) in 'ubd_device_release'
Message-ID: <202604030228.nSQwaWdx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Ming,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5619b098e2fbf3a23bf13d91897056a1fe238c6d
commit: 98e68f67020ce30e1a4d8e2d05d85a453738dfb8 block: prevent adding/deleting disk during updating nr_hw_queues
date:   11 months ago
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260403/202604030228.nSQwaWdx-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604030228.nSQwaWdx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 98e68f67020c ("block: prevent adding/deleting disk during updating nr_hw_queues")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604030228.nSQwaWdx-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
>> arch/um/drivers/ubd_kern.c:780:13: warning: stack frame size (2152) exceeds limit (2048) in 'ubd_device_release' [-Wframe-larger-than]
     780 | static void ubd_device_release(struct device *dev)
         |             ^
   13 warnings generated.


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
