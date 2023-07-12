Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF2E2AB42;
	Wed, 12 Jul 2023 13:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689170399; x=1720706399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PRlPBqYoM/SN6JYafk7V3kd7ra6x3eS+M88Gw+/PiOI=;
  b=MaHGgt5pQDlmXj1S4DgOmR57xQybTsjWN36dnynIm55Xkx3o7qLjU9oz
   dOgkhalofAygmbyBRRk3qteFxDvSL9s03qKsEGtkAjOE+NwRvaC9+xE1A
   ydRHtfe5wzvoEofvSmHkELjmTTbVTQTEOajC2RcXBmIKtAJCh0V4hExfA
   RFDBXe/HxfsWfK+wv8JbJlYTVWhpuAv5ZwVYoE9QLN5l2nFCF5bMs8VPC
   CTGtgjMR/7ca/jAUWG17iwG37wY4br7p4yzVar6oLs1x57sGG0F+c25zp
   gbWToZWL8KJpUZYknMuyjgLRch5FAnmwSRCW3gSpz3sCR4m2E1b/RW+lN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="354800827"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="354800827"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 06:59:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="756769852"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="756769852"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 12 Jul 2023 06:59:56 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJaNo-0005kN-1N;
	Wed, 12 Jul 2023 13:59:56 +0000
Date: Wed, 12 Jul 2023 21:59:07 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:00.02-gsp-rm 53/83]
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:399:1: warning: no
 previous prototype for function 'nv50_instmem_dtor'
Message-ID: <202307122123.IFMlZWGG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 00.02-gsp-rm
head:   3f6fc48703e02597683babc04c512ca13bb95e19
commit: ae58a2cfdd7490ba3d968e3d898b1c953455f936 [53/83] drm/nouveau/imem/tu102-: prepare for GSP-RM
config: s390-randconfig-r044-20230712 (https://download.01.org/0day-ci/archive/20230712/202307122123.IFMlZWGG-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307122123.IFMlZWGG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307122123.IFMlZWGG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:25:
   In file included from drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h:5:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/subdev/instmem.h:4:
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
   In file included from drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:25:
   In file included from drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h:5:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/subdev/instmem.h:4:
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
   In file included from drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:25:
   In file included from drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h:5:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/subdev/instmem.h:4:
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
>> drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:399:1: warning: no previous prototype for function 'nv50_instmem_dtor' [-Wmissing-prototypes]
     399 | nv50_instmem_dtor(struct nvkm_instmem *base)
         | ^
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:398:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     398 | void *
         | ^
         | static 
   13 warnings generated.


vim +/nv50_instmem_dtor +399 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c

   397	
   398	void *
 > 399	nv50_instmem_dtor(struct nvkm_instmem *base)
   400	{
   401		return nv50_instmem(base);
   402	}
   403	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
