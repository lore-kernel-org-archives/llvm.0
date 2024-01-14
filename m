Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A28F7E;
	Sun, 14 Jan 2024 11:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W/e8RcgR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705231818; x=1736767818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xCj8tyAjmlaSY2HrGWUIi+VbiQrkc6cDnG+ZjCnTNcw=;
  b=W/e8RcgROgvQqjAFVJ592vpm5h8RwcC5Zk5KIIcQDMUP2oB4mTbtb7U/
   y5lMrk/31f6aoaVK4HifdpET6oP/gusJu3x/gEgfEFv1qz4yvBK1tj4bB
   DOKLYMiK0hvuskBtBRyP1sduZGMmH0Nl4fCPr0oKm1gh3wwDZ7VGoUxN6
   tGGSmAP3FLhNbU3gSgnzCpdFzS6EIRPV/CbJrJpbREVU8ytBiiusyJ6bI
   US4ULHOkXbx8TZznl4TmxHK6rjtqhuPaAdVSn75ZDQevramNnLIo7c7mK
   wRZH6RXfZhaz7UfRp79T7P2rm0Tr04I+ymWV7tut2jGfrWR0KrK+oshzj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="12819119"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="12819119"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 03:30:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="1114669503"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="1114669503"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 14 Jan 2024 03:30:15 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOygv-000BS0-2g;
	Sun, 14 Jan 2024 11:30:13 +0000
Date: Sun, 14 Jan 2024 19:29:26 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie 2/51]
 drivers/media/platform/ti/omap3isp/ispstat.c:82:7: error: use of undeclared
 identifier 'dma_sync_single_range_for_device'; did you mean
 '__dma_sync_single_range_for_device'?
Message-ID: <202401141935.KMy75VlX-lkp@intel.com>
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
config: hexagon-randconfig-002-20240114 (https://download.01.org/0day-ci/archive/20240114/202401141935.KMy75VlX-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 9bde5becb44ea071f5e1fa1f5d4071dc8788b18c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240114/202401141935.KMy75VlX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401141935.KMy75VlX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/platform/ti/omap3isp/ispstat.c:15:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from drivers/media/platform/ti/omap3isp/ispstat.c:15:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/media/platform/ti/omap3isp/ispstat.c:15:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
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
>> drivers/media/platform/ti/omap3isp/ispstat.c:82:7: error: use of undeclared identifier 'dma_sync_single_range_for_device'; did you mean '__dma_sync_single_range_for_device'?
      82 |                                   dma_sync_single_range_for_device);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   __dma_sync_single_range_for_device
   include/linux/dma-mapping.h:385:1: note: '__dma_sync_single_range_for_device' declared here
     385 | __dma_sync_single_range_for_device(struct device *dev, dma_addr_t addr,
         | ^
>> drivers/media/platform/ti/omap3isp/ispstat.c:94:7: error: use of undeclared identifier 'dma_sync_single_range_for_cpu'; did you mean '__dma_sync_single_range_for_cpu'?
      94 |                                   dma_sync_single_range_for_cpu);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   __dma_sync_single_range_for_cpu
   include/linux/dma-mapping.h:377:1: note: '__dma_sync_single_range_for_cpu' declared here
     377 | __dma_sync_single_range_for_cpu(struct device *dev, dma_addr_t addr,
         | ^
   6 warnings and 2 errors generated.


vim +82 drivers/media/platform/ti/omap3isp/ispstat.c

68e342b3068cae drivers/media/video/omap3isp/ispstat.c    David Cohen      2011-02-12  72  
68e342b3068cae drivers/media/video/omap3isp/ispstat.c    David Cohen      2011-02-12  73  static void isp_stat_buf_sync_magic_for_device(struct ispstat *stat,
68e342b3068cae drivers/media/video/omap3isp/ispstat.c    David Cohen      2011-02-12  74  					       struct ispstat_buffer *buf,
68e342b3068cae drivers/media/video/omap3isp/ispstat.c    David Cohen      2011-02-12  75  					       u32 buf_size,
68e342b3068cae drivers/media/video/omap3isp/ispstat.c    David Cohen      2011-02-12  76  					       enum dma_data_direction dir)
68e342b3068cae drivers/media/video/omap3isp/ispstat.c    David Cohen      2011-02-12  77  {
63746b5ff12a9a drivers/media/platform/omap3isp/ispstat.c Laurent Pinchart 2014-01-02  78  	if (ISP_STAT_USES_DMAENGINE(stat))
68e342b3068cae drivers/media/video/omap3isp/ispstat.c    David Cohen      2011-02-12  79  		return;
68e342b3068cae drivers/media/video/omap3isp/ispstat.c    David Cohen      2011-02-12  80  
68e342b3068cae drivers/media/video/omap3isp/ispstat.c    David Cohen      2011-02-12  81  	__isp_stat_buf_sync_magic(stat, buf, buf_size, dir,
68e342b3068cae drivers/media/video/omap3isp/ispstat.c    David Cohen      2011-02-12 @82  				  dma_sync_single_range_for_device);
68e342b3068cae drivers/media/video/omap3isp/ispstat.c    David Cohen      2011-02-12  83  }
68e342b3068cae drivers/media/video/omap3isp/ispstat.c    David Cohen      2011-02-12  84  
68e342b3068cae drivers/media/video/omap3isp/ispstat.c    David Cohen      2011-02-12  85  static void isp_stat_buf_sync_magic_for_cpu(struct ispstat *stat,
68e342b3068cae drivers/media/video/omap3isp/ispstat.c    David Cohen      2011-02-12  86  					    struct ispstat_buffer *buf,
68e342b3068cae drivers/media/video/omap3isp/ispstat.c    David Cohen      2011-02-12  87  					    u32 buf_size,
68e342b3068cae drivers/media/video/omap3isp/ispstat.c    David Cohen      2011-02-12  88  					    enum dma_data_direction dir)
68e342b3068cae drivers/media/video/omap3isp/ispstat.c    David Cohen      2011-02-12  89  {
63746b5ff12a9a drivers/media/platform/omap3isp/ispstat.c Laurent Pinchart 2014-01-02  90  	if (ISP_STAT_USES_DMAENGINE(stat))
68e342b3068cae drivers/media/video/omap3isp/ispstat.c    David Cohen      2011-02-12  91  		return;
68e342b3068cae drivers/media/video/omap3isp/ispstat.c    David Cohen      2011-02-12  92  
68e342b3068cae drivers/media/video/omap3isp/ispstat.c    David Cohen      2011-02-12  93  	__isp_stat_buf_sync_magic(stat, buf, buf_size, dir,
68e342b3068cae drivers/media/video/omap3isp/ispstat.c    David Cohen      2011-02-12 @94  				  dma_sync_single_range_for_cpu);
68e342b3068cae drivers/media/video/omap3isp/ispstat.c    David Cohen      2011-02-12  95  }
68e342b3068cae drivers/media/video/omap3isp/ispstat.c    David Cohen      2011-02-12  96  

:::::: The code at line 82 was first introduced by commit
:::::: 68e342b3068cae62f3378cb4a1d385734ea52784 [media] omap3isp: Statistics

:::::: TO: David Cohen <dacohen@gmail.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
