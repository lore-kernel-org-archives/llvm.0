Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEBB3716E;
	Sun, 18 Feb 2024 11:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708256016; cv=none; b=YE6u19zaj1cQud50+UbDNdY71pvM+RHDlxl0L3RJNa+ttPf+zTKkQk5QJhIwar1j2fVDQP6j4WuEtTKDBp6udBPTvHRryJrF6RS6YxtdKtDsF0TYCbUqams4yUoWJJfcZySbKA3Ajp5QQYrS51IsnC7sZvVQlXp1AJNOxKiBeDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708256016; c=relaxed/simple;
	bh=/dH9PVl9ozGszDPSA40WpGxxh9f9JEVGQsxnWDYUXpE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SaV3f+Vf5ynXuCyruebWbHjA0IVpHK5nQovvdwyV/wszsmOVATGauF+6ZwCK01dEc/bqdoyr4h2oAY4UwKf9+Tf4LMQOc6byDqk+KWRHckRVj9SmsLmkPBRMS5f8T3CcnF9i0oT8uYfXWuae1iWCSHVcm93KiCCVoFxv083E3Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lXVRS3qT; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lXVRS3qT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708256013; x=1739792013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/dH9PVl9ozGszDPSA40WpGxxh9f9JEVGQsxnWDYUXpE=;
  b=lXVRS3qTPh1Fr5tmNUmboyGZHDSnax1wOM6RupYzHgQMZTz2HajeqJ9z
   XJDraE4P7lafI0welwNw0ShnOy7Gm/LyvApeyGe0Sk+S5xq/5+di19xey
   120tZ8YHhzHQFre6S5VJ6z0M/LVAN5G2wLehdNaYz9paV46pSEngaB8y+
   FrxykJnP6hG0Vn6iczHXm7+x/EQyFgYnmHZeC+WgTU5NBllkBQRoXsrUd
   rXYoVio28rni5QYitO1HWyArPO3j9x/GAbFjHp1i7cOKCKlkQcCVzbC3T
   SA+R6s6d+znq0rI5/LMHlnbS8eb8OpM1dc2hgFLOsnUBLJGwg1ZM11Bgv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="27789821"
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="27789821"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 03:33:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="8848109"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 18 Feb 2024 03:33:29 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbfQF-0002zK-1u;
	Sun, 18 Feb 2024 11:33:27 +0000
Date: Sun, 18 Feb 2024 19:33:26 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Suren Baghdasaryan <surenb@google.com>
Subject: [surenbaghdasaryan:memalloc_prof_v4 49/49]
 fs/xfs/scrub/agheader.c:175:32: warning: implicit conversion from 'int' to
 '__u16' (aka 'unsigned short') changes value from -49265 to 16271
Message-ID: <202402181942.GsSMR6w4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/surenbaghdasaryan/linux.git memalloc_prof_v4
head:   a9e8134c559030b55a98c4be4b3efaf0604c4e57
commit: a9e8134c559030b55a98c4be4b3efaf0604c4e57 [49/49] fixup: move mem_alloc_profiling_enabled() to be checked earlier
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240218/202402181942.GsSMR6w4-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 36adfec155de366d722f2bac8ff9162289dcf06c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240218/202402181942.GsSMR6w4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402181942.GsSMR6w4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/xfs/scrub/agheader.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:24:
   In file included from fs/xfs/kmem.h:11:
   include/linux/mm.h:3116:6: error: call to undeclared function 'mem_alloc_profiling_enabled'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3116 |         if (mem_alloc_profiling_enabled()) {
         |             ^
   In file included from fs/xfs/scrub/agheader.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/xfs/scrub/agheader.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/xfs/scrub/agheader.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> fs/xfs/scrub/agheader.c:175:32: warning: implicit conversion from 'int' to '__u16' (aka 'unsigned short') changes value from -49265 to 16271 [-Wconstant-conversion]
     168 |         vernum_mask = cpu_to_be16(~XFS_SB_VERSION_OKBITS |
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     169 |                                   XFS_SB_VERSION_NUMBITS |
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~
     170 |                                   XFS_SB_VERSION_ALIGNBIT |
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~
     171 |                                   XFS_SB_VERSION_DALIGNBIT |
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~
     172 |                                   XFS_SB_VERSION_SHAREDBIT |
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~
     173 |                                   XFS_SB_VERSION_LOGV2BIT |
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~
     174 |                                   XFS_SB_VERSION_SECTORBIT |
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~
     175 |                                   XFS_SB_VERSION_EXTFLGBIT |
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~^
     176 |                                   XFS_SB_VERSION_DIRV2BIT);
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:96:21: note: expanded from macro 'cpu_to_be16'
      96 | #define cpu_to_be16 __cpu_to_be16
         |                     ^
   include/uapi/linux/byteorder/little_endian.h:42:53: note: expanded from macro '__cpu_to_be16'
      42 | #define __cpu_to_be16(x) ((__force __be16)__swab16((x)))
         |                                           ~~~~~~~~~~^~~
   include/uapi/linux/swab.h:107:12: note: expanded from macro '__swab16'
     107 |         __fswab16(x))
         |         ~~~~~~~~~ ^
   7 warnings and 1 error generated.
--
   In file included from drivers/iio/adc/fsl-imx25-gcq.c:12:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/iio/adc/fsl-imx25-gcq.c:12:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/iio/adc/fsl-imx25-gcq.c:12:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/iio/adc/fsl-imx25-gcq.c:18:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   include/linux/mm.h:3116:6: error: call to undeclared function 'mem_alloc_profiling_enabled'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3116 |         if (mem_alloc_profiling_enabled()) {
         |             ^
>> drivers/iio/adc/fsl-imx25-gcq.c:115:8: warning: shift count is negative [-Wshift-count-negative]
     115 |                      MX25_ADCQ_ITEM(0, chan->channel));
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mfd/imx25-tsadc.h:54:3: note: expanded from macro 'MX25_ADCQ_ITEM'
      54 |                 _MX25_ADCQ_ITEM((item) - 8, (x)) : _MX25_ADCQ_ITEM((item), (x)))
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mfd/imx25-tsadc.h:52:39: note: expanded from macro '_MX25_ADCQ_ITEM'
      52 | #define _MX25_ADCQ_ITEM(item, x)        ((x) << ((item) * 4))
         |                                              ^  ~~~~~~~~~~~~
   7 warnings and 1 error generated.
--
   In file included from drivers/staging/media/rkvdec/rkvdec.c:13:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/staging/media/rkvdec/rkvdec.c:13:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/staging/media/rkvdec/rkvdec.c:13:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/staging/media/rkvdec/rkvdec.c:23:
   In file included from include/media/v4l2-mem2mem.h:16:
   In file included from include/media/videobuf2-v4l2.h:16:
   In file included from include/media/videobuf2-core.h:18:
   In file included from include/linux/dma-buf.h:19:
   In file included from include/linux/scatterlist.h:8:
   include/linux/mm.h:3116:6: error: call to undeclared function 'mem_alloc_profiling_enabled'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3116 |         if (mem_alloc_profiling_enabled()) {
         |             ^
>> drivers/staging/media/rkvdec/rkvdec.c:1038:46: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
    1038 |         vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~             ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:40: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                        ^~~~~
   7 warnings and 1 error generated.
--
   In file included from drivers/media/platform/verisilicon/hantro_drv.c:23:
   In file included from include/media/v4l2-mem2mem.h:16:
   In file included from include/media/videobuf2-v4l2.h:16:
   In file included from include/media/videobuf2-core.h:18:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/media/platform/verisilicon/hantro_drv.c:23:
   In file included from include/media/v4l2-mem2mem.h:16:
   In file included from include/media/videobuf2-v4l2.h:16:
   In file included from include/media/videobuf2-core.h:18:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/media/platform/verisilicon/hantro_drv.c:23:
   In file included from include/media/v4l2-mem2mem.h:16:
   In file included from include/media/videobuf2-v4l2.h:16:
   In file included from include/media/videobuf2-core.h:18:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/media/platform/verisilicon/hantro_drv.c:23:
   In file included from include/media/v4l2-mem2mem.h:16:
   In file included from include/media/videobuf2-v4l2.h:16:
   In file included from include/media/videobuf2-core.h:18:
   In file included from include/linux/dma-buf.h:19:
   In file included from include/linux/scatterlist.h:8:
   include/linux/mm.h:3116:6: error: call to undeclared function 'mem_alloc_profiling_enabled'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3116 |         if (mem_alloc_profiling_enabled()) {
         |             ^
>> drivers/media/platform/verisilicon/hantro_drv.c:1074:46: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
    1074 |         vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~             ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:40: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                        ^~~~~
   7 warnings and 1 error generated.
--
   In file included from drivers/media/platform/samsung/s5p-g2d/g2d.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/media/platform/samsung/s5p-g2d/g2d.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/media/platform/samsung/s5p-g2d/g2d.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/media/platform/samsung/s5p-g2d/g2d.c:19:
   In file included from include/media/v4l2-mem2mem.h:16:
   In file included from include/media/videobuf2-v4l2.h:16:
   In file included from include/media/videobuf2-core.h:18:
   In file included from include/linux/dma-buf.h:19:
   In file included from include/linux/scatterlist.h:8:
   include/linux/mm.h:3116:6: error: call to undeclared function 'mem_alloc_profiling_enabled'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3116 |         if (mem_alloc_profiling_enabled()) {
         |             ^
>> drivers/media/platform/samsung/s5p-g2d/g2d.c:679:46: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
     679 |         vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~             ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:40: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                        ^~~~~
   7 warnings and 1 error generated.
..


vim +175 fs/xfs/scrub/agheader.c

166d76410d7ac0 Darrick J. Wong     2018-01-16   60  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17   61  /*
21fb4cb1981ef7 Darrick J. Wong     2017-10-17   62   * Scrub the filesystem superblock.
21fb4cb1981ef7 Darrick J. Wong     2017-10-17   63   *
21fb4cb1981ef7 Darrick J. Wong     2017-10-17   64   * Note: We do /not/ attempt to check AG 0's superblock.  Mount is
21fb4cb1981ef7 Darrick J. Wong     2017-10-17   65   * responsible for validating all the geometry information in sb 0, so
21fb4cb1981ef7 Darrick J. Wong     2017-10-17   66   * if the filesystem is capable of initiating online scrub, then clearly
21fb4cb1981ef7 Darrick J. Wong     2017-10-17   67   * sb 0 is ok and we can use its information to check everything else.
21fb4cb1981ef7 Darrick J. Wong     2017-10-17   68   */
21fb4cb1981ef7 Darrick J. Wong     2017-10-17   69  int
c517b3aa02cff1 Darrick J. Wong     2018-07-19   70  xchk_superblock(
1d8a748a8aa94a Darrick J. Wong     2018-07-19   71  	struct xfs_scrub	*sc)
21fb4cb1981ef7 Darrick J. Wong     2017-10-17   72  {
21fb4cb1981ef7 Darrick J. Wong     2017-10-17   73  	struct xfs_mount	*mp = sc->mp;
21fb4cb1981ef7 Darrick J. Wong     2017-10-17   74  	struct xfs_buf		*bp;
21fb4cb1981ef7 Darrick J. Wong     2017-10-17   75  	struct xfs_dsb		*sb;
48c6615cc55759 Darrick J. Wong     2021-08-06   76  	struct xfs_perag	*pag;
21fb4cb1981ef7 Darrick J. Wong     2017-10-17   77  	xfs_agnumber_t		agno;
21fb4cb1981ef7 Darrick J. Wong     2017-10-17   78  	uint32_t		v2_ok;
21fb4cb1981ef7 Darrick J. Wong     2017-10-17   79  	__be32			features_mask;
21fb4cb1981ef7 Darrick J. Wong     2017-10-17   80  	int			error;
21fb4cb1981ef7 Darrick J. Wong     2017-10-17   81  	__be16			vernum_mask;
21fb4cb1981ef7 Darrick J. Wong     2017-10-17   82  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17   83  	agno = sc->sm->sm_agno;
21fb4cb1981ef7 Darrick J. Wong     2017-10-17   84  	if (agno == 0)
21fb4cb1981ef7 Darrick J. Wong     2017-10-17   85  		return 0;
21fb4cb1981ef7 Darrick J. Wong     2017-10-17   86  
48c6615cc55759 Darrick J. Wong     2021-08-06   87  	/*
48c6615cc55759 Darrick J. Wong     2021-08-06   88  	 * Grab an active reference to the perag structure.  If we can't get
48c6615cc55759 Darrick J. Wong     2021-08-06   89  	 * it, we're racing with something that's tearing down the AG, so
48c6615cc55759 Darrick J. Wong     2021-08-06   90  	 * signal that the AG no longer exists.
48c6615cc55759 Darrick J. Wong     2021-08-06   91  	 */
48c6615cc55759 Darrick J. Wong     2021-08-06   92  	pag = xfs_perag_get(mp, agno);
48c6615cc55759 Darrick J. Wong     2021-08-06   93  	if (!pag)
48c6615cc55759 Darrick J. Wong     2021-08-06   94  		return -ENOENT;
48c6615cc55759 Darrick J. Wong     2021-08-06   95  
689e11c84b1586 Darrick J. Wong     2018-05-14   96  	error = xfs_sb_read_secondary(mp, sc->tp, agno, &bp);
e5b37faa932d79 Darrick J. Wong     2018-01-08   97  	/*
e5b37faa932d79 Darrick J. Wong     2018-01-08   98  	 * The superblock verifier can return several different error codes
e5b37faa932d79 Darrick J. Wong     2018-01-08   99  	 * if it thinks the superblock doesn't look right.  For a mount these
e5b37faa932d79 Darrick J. Wong     2018-01-08  100  	 * would all get bounced back to userspace, but if we're here then the
e5b37faa932d79 Darrick J. Wong     2018-01-08  101  	 * fs mounted successfully, which means that this secondary superblock
e5b37faa932d79 Darrick J. Wong     2018-01-08  102  	 * is simply incorrect.  Treat all these codes the same way we treat
e5b37faa932d79 Darrick J. Wong     2018-01-08  103  	 * any corruption.
e5b37faa932d79 Darrick J. Wong     2018-01-08  104  	 */
e5b37faa932d79 Darrick J. Wong     2018-01-08  105  	switch (error) {
e5b37faa932d79 Darrick J. Wong     2018-01-08  106  	case -EINVAL:	/* also -EWRONGFS */
e5b37faa932d79 Darrick J. Wong     2018-01-08  107  	case -ENOSYS:
e5b37faa932d79 Darrick J. Wong     2018-01-08  108  	case -EFBIG:
e5b37faa932d79 Darrick J. Wong     2018-01-08  109  		error = -EFSCORRUPTED;
53004ee78d6273 Gustavo A. R. Silva 2021-04-20  110  		fallthrough;
e5b37faa932d79 Darrick J. Wong     2018-01-08  111  	default:
e5b37faa932d79 Darrick J. Wong     2018-01-08  112  		break;
e5b37faa932d79 Darrick J. Wong     2018-01-08  113  	}
c517b3aa02cff1 Darrick J. Wong     2018-07-19  114  	if (!xchk_process_error(sc, agno, XFS_SB_BLOCK(mp), &error))
48c6615cc55759 Darrick J. Wong     2021-08-06  115  		goto out_pag;
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  116  
3e6e8afd3abb74 Christoph Hellwig   2020-03-10  117  	sb = bp->b_addr;
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  118  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  119  	/*
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  120  	 * Verify the geometries match.  Fields that are permanently
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  121  	 * set by mkfs are checked; fields that can be updated later
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  122  	 * (and are not propagated to backup superblocks) are preen
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  123  	 * checked.
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  124  	 */
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  125  	if (sb->sb_blocksize != cpu_to_be32(mp->m_sb.sb_blocksize))
c517b3aa02cff1 Darrick J. Wong     2018-07-19  126  		xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  127  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  128  	if (sb->sb_dblocks != cpu_to_be64(mp->m_sb.sb_dblocks))
c517b3aa02cff1 Darrick J. Wong     2018-07-19  129  		xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  130  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  131  	if (sb->sb_rblocks != cpu_to_be64(mp->m_sb.sb_rblocks))
c517b3aa02cff1 Darrick J. Wong     2018-07-19  132  		xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  133  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  134  	if (sb->sb_rextents != cpu_to_be64(mp->m_sb.sb_rextents))
c517b3aa02cff1 Darrick J. Wong     2018-07-19  135  		xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  136  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  137  	if (!uuid_equal(&sb->sb_uuid, &mp->m_sb.sb_uuid))
c517b3aa02cff1 Darrick J. Wong     2018-07-19  138  		xchk_block_set_preen(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  139  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  140  	if (sb->sb_logstart != cpu_to_be64(mp->m_sb.sb_logstart))
c517b3aa02cff1 Darrick J. Wong     2018-07-19  141  		xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  142  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  143  	if (sb->sb_rootino != cpu_to_be64(mp->m_sb.sb_rootino))
c517b3aa02cff1 Darrick J. Wong     2018-07-19  144  		xchk_block_set_preen(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  145  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  146  	if (sb->sb_rbmino != cpu_to_be64(mp->m_sb.sb_rbmino))
c517b3aa02cff1 Darrick J. Wong     2018-07-19  147  		xchk_block_set_preen(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  148  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  149  	if (sb->sb_rsumino != cpu_to_be64(mp->m_sb.sb_rsumino))
c517b3aa02cff1 Darrick J. Wong     2018-07-19  150  		xchk_block_set_preen(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  151  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  152  	if (sb->sb_rextsize != cpu_to_be32(mp->m_sb.sb_rextsize))
c517b3aa02cff1 Darrick J. Wong     2018-07-19  153  		xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  154  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  155  	if (sb->sb_agblocks != cpu_to_be32(mp->m_sb.sb_agblocks))
c517b3aa02cff1 Darrick J. Wong     2018-07-19  156  		xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  157  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  158  	if (sb->sb_agcount != cpu_to_be32(mp->m_sb.sb_agcount))
c517b3aa02cff1 Darrick J. Wong     2018-07-19  159  		xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  160  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  161  	if (sb->sb_rbmblocks != cpu_to_be32(mp->m_sb.sb_rbmblocks))
c517b3aa02cff1 Darrick J. Wong     2018-07-19  162  		xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  163  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  164  	if (sb->sb_logblocks != cpu_to_be32(mp->m_sb.sb_logblocks))
c517b3aa02cff1 Darrick J. Wong     2018-07-19  165  		xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  166  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  167  	/* Check sb_versionnum bits that are set at mkfs time. */
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  168  	vernum_mask = cpu_to_be16(~XFS_SB_VERSION_OKBITS |
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  169  				  XFS_SB_VERSION_NUMBITS |
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  170  				  XFS_SB_VERSION_ALIGNBIT |
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  171  				  XFS_SB_VERSION_DALIGNBIT |
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  172  				  XFS_SB_VERSION_SHAREDBIT |
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  173  				  XFS_SB_VERSION_LOGV2BIT |
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  174  				  XFS_SB_VERSION_SECTORBIT |
21fb4cb1981ef7 Darrick J. Wong     2017-10-17 @175  				  XFS_SB_VERSION_EXTFLGBIT |
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  176  				  XFS_SB_VERSION_DIRV2BIT);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  177  	if ((sb->sb_versionnum & vernum_mask) !=
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  178  	    (cpu_to_be16(mp->m_sb.sb_versionnum) & vernum_mask))
c517b3aa02cff1 Darrick J. Wong     2018-07-19  179  		xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  180  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  181  	/* Check sb_versionnum bits that can be set after mkfs time. */
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  182  	vernum_mask = cpu_to_be16(XFS_SB_VERSION_ATTRBIT |
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  183  				  XFS_SB_VERSION_NLINKBIT |
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  184  				  XFS_SB_VERSION_QUOTABIT);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  185  	if ((sb->sb_versionnum & vernum_mask) !=
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  186  	    (cpu_to_be16(mp->m_sb.sb_versionnum) & vernum_mask))
c517b3aa02cff1 Darrick J. Wong     2018-07-19  187  		xchk_block_set_preen(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  188  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  189  	if (sb->sb_sectsize != cpu_to_be16(mp->m_sb.sb_sectsize))
c517b3aa02cff1 Darrick J. Wong     2018-07-19  190  		xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  191  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  192  	if (sb->sb_inodesize != cpu_to_be16(mp->m_sb.sb_inodesize))
c517b3aa02cff1 Darrick J. Wong     2018-07-19  193  		xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  194  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  195  	if (sb->sb_inopblock != cpu_to_be16(mp->m_sb.sb_inopblock))
c517b3aa02cff1 Darrick J. Wong     2018-07-19  196  		xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  197  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  198  	if (memcmp(sb->sb_fname, mp->m_sb.sb_fname, sizeof(sb->sb_fname)))
c517b3aa02cff1 Darrick J. Wong     2018-07-19  199  		xchk_block_set_preen(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  200  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  201  	if (sb->sb_blocklog != mp->m_sb.sb_blocklog)
c517b3aa02cff1 Darrick J. Wong     2018-07-19  202  		xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  203  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  204  	if (sb->sb_sectlog != mp->m_sb.sb_sectlog)
c517b3aa02cff1 Darrick J. Wong     2018-07-19  205  		xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  206  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  207  	if (sb->sb_inodelog != mp->m_sb.sb_inodelog)
c517b3aa02cff1 Darrick J. Wong     2018-07-19  208  		xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  209  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  210  	if (sb->sb_inopblog != mp->m_sb.sb_inopblog)
c517b3aa02cff1 Darrick J. Wong     2018-07-19  211  		xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  212  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  213  	if (sb->sb_agblklog != mp->m_sb.sb_agblklog)
c517b3aa02cff1 Darrick J. Wong     2018-07-19  214  		xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  215  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  216  	if (sb->sb_rextslog != mp->m_sb.sb_rextslog)
c517b3aa02cff1 Darrick J. Wong     2018-07-19  217  		xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  218  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  219  	if (sb->sb_imax_pct != mp->m_sb.sb_imax_pct)
c517b3aa02cff1 Darrick J. Wong     2018-07-19  220  		xchk_block_set_preen(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  221  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  222  	/*
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  223  	 * Skip the summary counters since we track them in memory anyway.
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  224  	 * sb_icount, sb_ifree, sb_fdblocks, sb_frexents
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  225  	 */
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  226  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  227  	if (sb->sb_uquotino != cpu_to_be64(mp->m_sb.sb_uquotino))
c517b3aa02cff1 Darrick J. Wong     2018-07-19  228  		xchk_block_set_preen(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  229  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  230  	if (sb->sb_gquotino != cpu_to_be64(mp->m_sb.sb_gquotino))
c517b3aa02cff1 Darrick J. Wong     2018-07-19  231  		xchk_block_set_preen(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  232  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  233  	/*
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  234  	 * Skip the quota flags since repair will force quotacheck.
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  235  	 * sb_qflags
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  236  	 */
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  237  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  238  	if (sb->sb_flags != mp->m_sb.sb_flags)
c517b3aa02cff1 Darrick J. Wong     2018-07-19  239  		xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  240  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  241  	if (sb->sb_shared_vn != mp->m_sb.sb_shared_vn)
c517b3aa02cff1 Darrick J. Wong     2018-07-19  242  		xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  243  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  244  	if (sb->sb_inoalignmt != cpu_to_be32(mp->m_sb.sb_inoalignmt))
c517b3aa02cff1 Darrick J. Wong     2018-07-19  245  		xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  246  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  247  	if (sb->sb_unit != cpu_to_be32(mp->m_sb.sb_unit))
c517b3aa02cff1 Darrick J. Wong     2018-07-19  248  		xchk_block_set_preen(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  249  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  250  	if (sb->sb_width != cpu_to_be32(mp->m_sb.sb_width))
c517b3aa02cff1 Darrick J. Wong     2018-07-19  251  		xchk_block_set_preen(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  252  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  253  	if (sb->sb_dirblklog != mp->m_sb.sb_dirblklog)
c517b3aa02cff1 Darrick J. Wong     2018-07-19  254  		xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  255  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  256  	if (sb->sb_logsectlog != mp->m_sb.sb_logsectlog)
c517b3aa02cff1 Darrick J. Wong     2018-07-19  257  		xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  258  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  259  	if (sb->sb_logsectsize != cpu_to_be16(mp->m_sb.sb_logsectsize))
c517b3aa02cff1 Darrick J. Wong     2018-07-19  260  		xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  261  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  262  	if (sb->sb_logsunit != cpu_to_be32(mp->m_sb.sb_logsunit))
c517b3aa02cff1 Darrick J. Wong     2018-07-19  263  		xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  264  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  265  	/* Do we see any invalid bits in sb_features2? */
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  266  	if (!xfs_sb_version_hasmorebits(&mp->m_sb)) {
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  267  		if (sb->sb_features2 != 0)
c517b3aa02cff1 Darrick J. Wong     2018-07-19  268  			xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  269  	} else {
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  270  		v2_ok = XFS_SB_VERSION2_OKBITS;
d6837c1aab42e7 Dave Chinner        2021-08-18  271  		if (xfs_sb_is_v5(&mp->m_sb))
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  272  			v2_ok |= XFS_SB_VERSION2_CRCBIT;
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  273  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  274  		if (!!(sb->sb_features2 & cpu_to_be32(~v2_ok)))
c517b3aa02cff1 Darrick J. Wong     2018-07-19  275  			xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  276  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  277  		if (sb->sb_features2 != sb->sb_bad_features2)
c517b3aa02cff1 Darrick J. Wong     2018-07-19  278  			xchk_block_set_preen(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  279  	}
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  280  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  281  	/* Check sb_features2 flags that are set at mkfs time. */
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  282  	features_mask = cpu_to_be32(XFS_SB_VERSION2_LAZYSBCOUNTBIT |
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  283  				    XFS_SB_VERSION2_PROJID32BIT |
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  284  				    XFS_SB_VERSION2_CRCBIT |
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  285  				    XFS_SB_VERSION2_FTYPE);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  286  	if ((sb->sb_features2 & features_mask) !=
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  287  	    (cpu_to_be32(mp->m_sb.sb_features2) & features_mask))
c517b3aa02cff1 Darrick J. Wong     2018-07-19  288  		xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  289  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  290  	/* Check sb_features2 flags that can be set after mkfs time. */
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  291  	features_mask = cpu_to_be32(XFS_SB_VERSION2_ATTR2BIT);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  292  	if ((sb->sb_features2 & features_mask) !=
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  293  	    (cpu_to_be32(mp->m_sb.sb_features2) & features_mask))
4a9bca86806fa6 Darrick J. Wong     2022-01-07  294  		xchk_block_set_preen(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  295  
38c26bfd90e199 Dave Chinner        2021-08-18  296  	if (!xfs_has_crc(mp)) {
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  297  		/* all v5 fields must be zero */
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  298  		if (memchr_inv(&sb->sb_features_compat, 0,
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  299  				sizeof(struct xfs_dsb) -
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  300  				offsetof(struct xfs_dsb, sb_features_compat)))
c517b3aa02cff1 Darrick J. Wong     2018-07-19  301  			xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  302  	} else {
4a9bca86806fa6 Darrick J. Wong     2022-01-07  303  		/* compat features must match */
4a9bca86806fa6 Darrick J. Wong     2022-01-07  304  		if (sb->sb_features_compat !=
4a9bca86806fa6 Darrick J. Wong     2022-01-07  305  				cpu_to_be32(mp->m_sb.sb_features_compat))
4a9bca86806fa6 Darrick J. Wong     2022-01-07  306  			xchk_block_set_corrupt(sc, bp);
4a9bca86806fa6 Darrick J. Wong     2022-01-07  307  
4a9bca86806fa6 Darrick J. Wong     2022-01-07  308  		/* ro compat features must match */
4a9bca86806fa6 Darrick J. Wong     2022-01-07  309  		if (sb->sb_features_ro_compat !=
4a9bca86806fa6 Darrick J. Wong     2022-01-07  310  				cpu_to_be32(mp->m_sb.sb_features_ro_compat))
4a9bca86806fa6 Darrick J. Wong     2022-01-07  311  			xchk_block_set_corrupt(sc, bp);
4a9bca86806fa6 Darrick J. Wong     2022-01-07  312  
4a9bca86806fa6 Darrick J. Wong     2022-01-07  313  		/*
4a9bca86806fa6 Darrick J. Wong     2022-01-07  314  		 * NEEDSREPAIR is ignored on a secondary super, so we should
4a9bca86806fa6 Darrick J. Wong     2022-01-07  315  		 * clear it when we find it, though it's not a corruption.
4a9bca86806fa6 Darrick J. Wong     2022-01-07  316  		 */
4a9bca86806fa6 Darrick J. Wong     2022-01-07  317  		features_mask = cpu_to_be32(XFS_SB_FEAT_INCOMPAT_NEEDSREPAIR);
4a9bca86806fa6 Darrick J. Wong     2022-01-07  318  		if ((cpu_to_be32(mp->m_sb.sb_features_incompat) ^
4a9bca86806fa6 Darrick J. Wong     2022-01-07  319  				sb->sb_features_incompat) & features_mask)
4a9bca86806fa6 Darrick J. Wong     2022-01-07  320  			xchk_block_set_preen(sc, bp);
4a9bca86806fa6 Darrick J. Wong     2022-01-07  321  
4a9bca86806fa6 Darrick J. Wong     2022-01-07  322  		/* all other incompat features must match */
4a9bca86806fa6 Darrick J. Wong     2022-01-07  323  		if ((cpu_to_be32(mp->m_sb.sb_features_incompat) ^
4a9bca86806fa6 Darrick J. Wong     2022-01-07  324  				sb->sb_features_incompat) & ~features_mask)
c517b3aa02cff1 Darrick J. Wong     2018-07-19  325  			xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  326  
4a9bca86806fa6 Darrick J. Wong     2022-01-07  327  		/*
4a9bca86806fa6 Darrick J. Wong     2022-01-07  328  		 * log incompat features protect newer log record types from
4a9bca86806fa6 Darrick J. Wong     2022-01-07  329  		 * older log recovery code.  Log recovery doesn't check the
4a9bca86806fa6 Darrick J. Wong     2022-01-07  330  		 * secondary supers, so we can clear these if needed.
4a9bca86806fa6 Darrick J. Wong     2022-01-07  331  		 */
4a9bca86806fa6 Darrick J. Wong     2022-01-07  332  		if (sb->sb_features_log_incompat)
4a9bca86806fa6 Darrick J. Wong     2022-01-07  333  			xchk_block_set_preen(sc, bp);
4a9bca86806fa6 Darrick J. Wong     2022-01-07  334  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  335  		/* Don't care about sb_crc */
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  336  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  337  		if (sb->sb_spino_align != cpu_to_be32(mp->m_sb.sb_spino_align))
c517b3aa02cff1 Darrick J. Wong     2018-07-19  338  			xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  339  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  340  		if (sb->sb_pquotino != cpu_to_be64(mp->m_sb.sb_pquotino))
c517b3aa02cff1 Darrick J. Wong     2018-07-19  341  			xchk_block_set_preen(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  342  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  343  		/* Don't care about sb_lsn */
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  344  	}
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  345  
38c26bfd90e199 Dave Chinner        2021-08-18  346  	if (xfs_has_metauuid(mp)) {
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  347  		/* The metadata UUID must be the same for all supers */
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  348  		if (!uuid_equal(&sb->sb_meta_uuid, &mp->m_sb.sb_meta_uuid))
c517b3aa02cff1 Darrick J. Wong     2018-07-19  349  			xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  350  	}
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  351  
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  352  	/* Everything else must be zero. */
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  353  	if (memchr_inv(sb + 1, 0,
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  354  			BBTOB(bp->b_length) - sizeof(struct xfs_dsb)))
c517b3aa02cff1 Darrick J. Wong     2018-07-19  355  		xchk_block_set_corrupt(sc, bp);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  356  
c517b3aa02cff1 Darrick J. Wong     2018-07-19  357  	xchk_superblock_xref(sc, bp);
48c6615cc55759 Darrick J. Wong     2021-08-06  358  out_pag:
48c6615cc55759 Darrick J. Wong     2021-08-06  359  	xfs_perag_put(pag);
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  360  	return error;
21fb4cb1981ef7 Darrick J. Wong     2017-10-17  361  }
ab9d5dc59fe615 Darrick J. Wong     2017-10-17  362  

:::::: The code at line 175 was first introduced by commit
:::::: 21fb4cb1981ef7e02f35a42b2a5ae619517dfe1b xfs: scrub the secondary superblocks

:::::: TO: Darrick J. Wong <darrick.wong@oracle.com>
:::::: CC: Darrick J. Wong <darrick.wong@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
