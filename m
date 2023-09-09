Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0301FC2;
	Sat,  9 Sep 2023 11:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694259318; x=1725795318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iDsksRpphmCrSKFxJT+7c6Q93SaWARKm56okQy1/msY=;
  b=OY5eupWOc5FTt9vckYZCYUMuXI8E8oO7PQ214LUvQEA/qVX+eKGVX8XK
   5A64+l/2wmWqd5nPGsdW823uEUKGULo6adDziNrKs3pibspcOgGCvH0yd
   WSdkp/l8qZTnGwhLLRMgoX+b8+RM9hxX5P50GBbpNwIZV7Otl/yVuJMn0
   nWr1cSk8ZL8v1LJWRbG2YqjkpCaDjh+AgmytybmLTFMkgVdR1uhQFv7A4
   Q8zu98Z3pWt61A86cZ4/vPq9j/o4Yewf/y93B9bNfdqJwP+/pAgYXmkVW
   1kGpFI02OylgYn39L2ZkAJ9RAe1DY/46bpEUkoeKY5NeVc/bZI7c077Rf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="376722723"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="376722723"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 04:35:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="866390996"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="866390996"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 09 Sep 2023 04:35:15 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qewF7-0003Q6-0q;
	Sat, 09 Sep 2023 11:35:13 +0000
Date: Sat, 9 Sep 2023 19:34:35 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:00.02-gsp-rm 80/88]
 drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c:65:1: error: non-void
 function does not return a value in all control paths
Message-ID: <202309091917.lLDZlknC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 00.02-gsp-rm
head:   dcd62291d3f1ba328303b1617495fa4542117fc1
commit: fd76a81787aec016955dcd36f13da3943510b0d1 [80/88] WIPdrm/nouveau/disp/r535: initial support
config: s390-randconfig-r031-20230909 (https://download.01.org/0day-ci/archive/20230909/202309091917.lLDZlknC-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309091917.lLDZlknC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309091917.lLDZlknC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c:22:
   In file included from drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h:5:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h:5:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/engine.h:5:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/device.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h:3:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/os.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvif/os.h:8:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
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
   In file included from drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c:22:
   In file included from drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h:5:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h:5:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/engine.h:5:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/device.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h:3:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/os.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvif/os.h:8:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c:22:
   In file included from drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h:5:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h:5:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/engine.h:5:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/device.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h:3:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/os.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvif/os.h:8:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
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
>> drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c:65:1: error: non-void function does not return a value in all control paths [-Werror,-Wreturn-type]
      65 | }
         | ^
   drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c:1139:21: warning: variable 'type' set but not used [-Wunused-but-set-variable]
    1139 |         enum nvkm_ior_type type;
         |                            ^
   13 warnings and 1 error generated.


vim +65 drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c

    52	
    53	static u64
    54	r535_chan_user(struct nvkm_disp_chan *chan, u64 *psize)
    55	{
    56		switch (chan->object.oclass & 0xff) {
    57		case 0x7d: *psize = 0x10000; return 0x680000;
    58		case 0x7e: *psize = 0x01000; return 0x690000 + (chan->head * *psize);
    59		case 0x7b: *psize = 0x01000; return 0x6b0000 + (chan->head * *psize);
    60		case 0x7a: *psize = 0x01000; return 0x6d8000 + (chan->head * *psize);
    61		default:
    62			BUG_ON(1);
    63			break;
    64		}
  > 65	}
    66	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
