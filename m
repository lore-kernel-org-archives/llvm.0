Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D7B374F8;
	Sat, 24 Feb 2024 11:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708775997; cv=none; b=ZxPPKyrLmxZYCD8YNVvNKA4NteIbdzsvggDNCPSUNFmITjjU18PlBnn6zJ1iTt9QUVdc0LRFk2Xyt5atLGA6XVkg4MJv/QPW66fL3Hsugq21P7/cWt1oJcJbKgci7oY9lVcVyJVe8fwp8U2o2CV3RoQRROQOpp6+fgT5sSjCYrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708775997; c=relaxed/simple;
	bh=JfY9EDxzFUuSqb1/MFfWPlqVk/mEZescQ53zXa4Z/l8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dd/C0n+Z7442b+vCZcEbqWiDFqHjndjy5aqhRTW2ktddECX1T+ceigln+WJW8L/0VloLBPrgJpGyIoC+oY4CLH8ZudaCTGzFBLcHcvH2J8eZVOK3X/Cqb/lungCAj4iWCCsKjggD5WIPx2LzLC87tbjosRR+54cn63Ff+PyIKwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A+p5Q5q6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A+p5Q5q6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708775995; x=1740311995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JfY9EDxzFUuSqb1/MFfWPlqVk/mEZescQ53zXa4Z/l8=;
  b=A+p5Q5q6mCI2pkkwDkG32aI8omTYsUOJjy5bfe2MtuVaOdh8N5v6v4aE
   iXZBgy0dHCODeAf5EAoisRSo64bnvQboz8s7Qu9OZXxyUy0GvFp+w8lIP
   x7bHjqcthQh/ZrksmPfpScrAEkRCRTuuyhKN84RtkpWv9J8PeMY6LdmKQ
   T2ZcNbfNVd9XsPvO4mNWzBgdu99+J/00D0jK3FeFxzotyjCKG6j0kHr8i
   v4TattChICnDHYCbKvD6Jdjkcv7PnNcJZaPrugacoy2vAyvpWX2uLhi1K
   edqzkxXgg4R/Nf1unCgBgDR9rA9J+VMiczFva+szEgbAFhLR06d12Pre1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="28532370"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="28532370"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 03:59:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="6608246"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 24 Feb 2024 03:59:52 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdqh4-0008VQ-17;
	Sat, 24 Feb 2024 11:59:50 +0000
Date: Sat, 24 Feb 2024 19:59:18 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie 2/51] drivers/virtio/virtio_ring.c:3222:2:
 error: call to undeclared function 'dma_check_sync'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202402241915.5tzZ4zxV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie
head:   29cca1ea6c555a8b97694e38f18926da7969dcfe
commit: 9a3aa944b33041331d3bf1c1ad194ecffee0cbf0 [2/51] dma: compile-out DMA sync operations when not used
config: um-randconfig-002-20240224 (https://download.01.org/0day-ci/archive/20240224/202402241915.5tzZ4zxV-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402241915.5tzZ4zxV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402241915.5tzZ4zxV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/virtio/virtio_ring.c:6:
   In file included from include/linux/virtio.h:7:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from drivers/virtio/virtio_ring.c:6:
   In file included from include/linux/virtio.h:7:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/virtio/virtio_ring.c:6:
   In file included from include/linux/virtio.h:7:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from drivers/virtio/virtio_ring.c:6:
   In file included from include/linux/virtio.h:12:
   include/linux/dma-mapping.h:381:2: error: call to undeclared function '__dma_sync_single_for_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     381 |         __dma_sync_single_for_cpu(dev, addr + offset, size, dir);
         |         ^
   include/linux/dma-mapping.h:381:2: note: did you mean 'dma_sync_single_for_cpu'?
   include/linux/dma-mapping.h:227:20: note: 'dma_sync_single_for_cpu' declared here
     227 | static inline void dma_sync_single_for_cpu(struct device *dev, dma_addr_t addr,
         |                    ^
   include/linux/dma-mapping.h:389:2: error: call to undeclared function '__dma_sync_single_for_device'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     389 |         __dma_sync_single_for_device(dev, addr + offset, size, dir);
         |         ^
   include/linux/dma-mapping.h:389:2: note: did you mean 'dma_sync_single_for_device'?
   include/linux/dma-mapping.h:231:20: note: 'dma_sync_single_for_device' declared here
     231 | static inline void dma_sync_single_for_device(struct device *dev,
         |                    ^
>> drivers/virtio/virtio_ring.c:3222:2: error: call to undeclared function 'dma_check_sync'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3222 |         dma_sync_single_range_for_cpu(dev, addr, offset, size, dir);
         |         ^
   include/linux/dma-mapping.h:393:2: note: expanded from macro 'dma_sync_single_range_for_cpu'
     393 |         dma_check_sync(__dma_sync_single_range_for_cpu, d, a, o, s, r)
         |         ^
   drivers/virtio/virtio_ring.c:3248:2: error: call to undeclared function 'dma_check_sync'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3248 |         dma_sync_single_range_for_device(dev, addr, offset, size, dir);
         |         ^
   include/linux/dma-mapping.h:395:2: note: expanded from macro 'dma_sync_single_range_for_device'
     395 |         dma_check_sync(__dma_sync_single_range_for_device, d, a, o, s, r)
         |         ^
   12 warnings and 4 errors generated.


vim +/dma_check_sync +3222 drivers/virtio/virtio_ring.c

8bd2f71054bd0b Xuan Zhuo 2023-08-10  3198  
8bd2f71054bd0b Xuan Zhuo 2023-08-10  3199  /**
8bd2f71054bd0b Xuan Zhuo 2023-08-10  3200   * virtqueue_dma_sync_single_range_for_cpu - dma sync for cpu
8bd2f71054bd0b Xuan Zhuo 2023-08-10  3201   * @_vq: the struct virtqueue we're talking about.
8bd2f71054bd0b Xuan Zhuo 2023-08-10  3202   * @addr: DMA address
8bd2f71054bd0b Xuan Zhuo 2023-08-10  3203   * @offset: DMA address offset
8bd2f71054bd0b Xuan Zhuo 2023-08-10  3204   * @size: buf size for sync
8bd2f71054bd0b Xuan Zhuo 2023-08-10  3205   * @dir: DMA direction
8bd2f71054bd0b Xuan Zhuo 2023-08-10  3206   *
8bd2f71054bd0b Xuan Zhuo 2023-08-10  3207   * Before calling this function, use virtqueue_dma_need_sync() to confirm that
8bd2f71054bd0b Xuan Zhuo 2023-08-10  3208   * the DMA address really needs to be synchronized
8bd2f71054bd0b Xuan Zhuo 2023-08-10  3209   *
8bd2f71054bd0b Xuan Zhuo 2023-08-10  3210   */
8bd2f71054bd0b Xuan Zhuo 2023-08-10  3211  void virtqueue_dma_sync_single_range_for_cpu(struct virtqueue *_vq,
8bd2f71054bd0b Xuan Zhuo 2023-08-10  3212  					     dma_addr_t addr,
8bd2f71054bd0b Xuan Zhuo 2023-08-10  3213  					     unsigned long offset, size_t size,
8bd2f71054bd0b Xuan Zhuo 2023-08-10  3214  					     enum dma_data_direction dir)
8bd2f71054bd0b Xuan Zhuo 2023-08-10  3215  {
8bd2f71054bd0b Xuan Zhuo 2023-08-10  3216  	struct vring_virtqueue *vq = to_vvq(_vq);
8bd2f71054bd0b Xuan Zhuo 2023-08-10  3217  	struct device *dev = vring_dma_dev(vq);
8bd2f71054bd0b Xuan Zhuo 2023-08-10  3218  
8bd2f71054bd0b Xuan Zhuo 2023-08-10  3219  	if (!vq->use_dma_api)
8bd2f71054bd0b Xuan Zhuo 2023-08-10  3220  		return;
8bd2f71054bd0b Xuan Zhuo 2023-08-10  3221  
1f475cd572ea77 Xuan Zhuo 2023-12-01 @3222  	dma_sync_single_range_for_cpu(dev, addr, offset, size, dir);
8bd2f71054bd0b Xuan Zhuo 2023-08-10  3223  }
8bd2f71054bd0b Xuan Zhuo 2023-08-10  3224  EXPORT_SYMBOL_GPL(virtqueue_dma_sync_single_range_for_cpu);
8bd2f71054bd0b Xuan Zhuo 2023-08-10  3225  

:::::: The code at line 3222 was first introduced by commit
:::::: 1f475cd572ea77ae6474a17e693a96bca927efe9 virtio_ring: fix syncs DMA memory with different direction

:::::: TO: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
