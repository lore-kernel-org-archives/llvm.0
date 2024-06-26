Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3EA433B3;
	Wed, 26 Jun 2024 21:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719439135; cv=none; b=naaU5PBNoYTIbHdTUJo2370kP2BZ/28OR11ZEow72sdMsYnKSatnOTusIMKdN/X0NSR52VQ9BSsY7KRj3bJfu19gvrfBvcaqV6jjvMEHwrSKpeW8A3Spr7SZ4MApZBNVGs4wDTpCGJ/BhCBRM6peFBiz/EDX/sYh4iKvYGYkiH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719439135; c=relaxed/simple;
	bh=0fewRG9apOAXsu6MdbDeeIpACWMxRzcivX0n9apKXwg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FgXUPUT1n3S0x3tcIhVtO24hcVsNqj7R0naUaIlxAHWBQGCmzpnnLCA2GFEWq0GVgQtLQh/PJelOsWOmlLM3/53FkuXZ9xVWEo13MIKHQ88mUYtmSA+G27nT/Drjg32e8f3Pdg5w+kru7FTR1jNRxWWc4Ad0Bbsz979Em3dW8RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U2egQM4/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U2egQM4/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719439133; x=1750975133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0fewRG9apOAXsu6MdbDeeIpACWMxRzcivX0n9apKXwg=;
  b=U2egQM4/NScPonFwRigpuEizaafiyHGRlrEC6pLSUHbcOdLKZUolExZG
   raTu04YL8gnPKC2v1D7glfB/y1ojD4s9RETo5sK/18lkASdL3X6T569GK
   gBoDdr5fK0KEo0508ikN60h6qbaVwWAye7tJWZ0zv8ktKwFoPT4Gcy4YY
   1iY+9oRObZjwrkFKyA7EJqTNqYGWBD/xZD5C22/0o/EkzfDJwDxyGJlU4
   oecfTU/NXe0MThf7xDrZsTfleifuSCOG2SJA5bd0fNOHGs9EYtpwNu0CU
   3MPOamQoRzRvcC0G7FaRbLBGgRWQSusRw9hDj78sjww8Fi69qvANr/U1e
   g==;
X-CSE-ConnectionGUID: fXGdDDw/Q2moouYuMKqAvw==
X-CSE-MsgGUID: OB+LnOdOS2yD0HZg6ymBow==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16423331"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; 
   d="scan'208";a="16423331"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 14:58:53 -0700
X-CSE-ConnectionGUID: BIVMztFbR6i+urgxsffMBQ==
X-CSE-MsgGUID: x3K1Tp+6Qmq/5yEjUMzTSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; 
   d="scan'208";a="49064519"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 26 Jun 2024 14:58:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMafA-000Fas-0Y;
	Wed, 26 Jun 2024 21:58:48 +0000
Date: Thu, 27 Jun 2024 05:58:18 +0800
From: kernel test robot <lkp@intel.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jens Axboe <axboe@kernel.dk>, Anuj Gupta <anuj20.g@samsung.com>,
	Kanchan Joshi <joshi.k@samsung.com>, Christoph Hellwig <hch@lst.de>
Subject: [axboe-block:for-next 94/104] include/linux/blk-integrity.h:151:9:
 error: returning 'struct bio_vec' from a function with incompatible result
 type 'struct bio_vec *'; take the address with &
Message-ID: <202406270508.qSWqG6e7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
head:   c1440ed442a58eb4060a58f7c1f85775b6bb72ae
commit: cf546dd289e0f6d2594c25e2fb4e19ee67c6d988 [94/104] block: change rq_integrity_vec to respect the iterator
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20240627/202406270508.qSWqG6e7-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406270508.qSWqG6e7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406270508.qSWqG6e7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from block/bdev.c:14:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
   In file included from block/bdev.c:14:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
   In file included from block/bdev.c:14:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
   In file included from block/bdev.c:15:
>> include/linux/blk-integrity.h:151:9: error: returning 'struct bio_vec' from a function with incompatible result type 'struct bio_vec *'; take the address with &
     151 |         return (struct bio_vec){ };
         |                ^~~~~~~~~~~~~~~~~~~
         |                &(                 )
   12 warnings and 1 error generated.


vim +151 include/linux/blk-integrity.h

   147	
   148	static inline struct bio_vec *rq_integrity_vec(struct request *rq)
   149	{
   150		/* the optimizer will remove all calls to this function */
 > 151		return (struct bio_vec){ };
   152	}
   153	#endif /* CONFIG_BLK_DEV_INTEGRITY */
   154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
