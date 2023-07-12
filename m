Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3DD214E5;
	Wed, 12 Jul 2023 15:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689176522; x=1720712522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yGl990ayjvNcYAAT668WonCAg9+5TRkua8H5N/gpkwk=;
  b=dycCQ7F1K/fhDGbH1KbjNAooimTbdYstH3BGWip3Th/GA3UN44uE+RNj
   zWKO7ZqY135eIKSalXR/PkArBWkgmFG6yIWz5Lk64LdcobffIjS3LW63P
   ISUS/ngp1luON6xOZ2vp+h9Cpn4xzHseN3tPcZz+hovj+IA+FiwwUPhpC
   Qf0llFMqIJTwVVusAdxjtD3xLAQMHQVPGBIuCkK7AmG9bYZp6xTNvt4Bf
   i3sWHaeko0YsJj9D7k+3VsHX3q908x5U7wgtwY2b1jcQgg2SZOmUmw00S
   hGB21vXamlihGuHPKouAA4MVueOMoshjuFzNm3QHsVwOPCALmqJZ2PHgZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="364957666"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="364957666"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 08:42:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="968239965"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="968239965"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 12 Jul 2023 08:41:58 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJbyX-0005mj-26;
	Wed, 12 Jul 2023 15:41:57 +0000
Date: Wed, 12 Jul 2023 23:41:37 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:00.02-gsp-rm 70/83]
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c:172:1: warning: no previous
 prototype for function 'nvkm_gsp_fwsec_v2'
Message-ID: <202307122326.VQukrJb4-lkp@intel.com>
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
commit: f96cac9d383d166bb0a7d85437ed2d87ee8610e9 [70/83] WIPdrm/nouveau/gsp/r535: add support for booting GSP-RM
config: s390-randconfig-r044-20230712 (https://download.01.org/0day-ci/archive/20230712/202307122326.VQukrJb4-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307122326.VQukrJb4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307122326.VQukrJb4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c:22:
   In file included from drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h:4:
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
   In file included from drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c:22:
   In file included from drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h:4:
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
   In file included from drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c:22:
   In file included from drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h:4:
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
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c:172:1: warning: no previous prototype for function 'nvkm_gsp_fwsec_v2' [-Wmissing-prototypes]
     172 | nvkm_gsp_fwsec_v2(struct nvkm_gsp *gsp, const char *name,
         | ^
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c:171:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     171 | int
         | ^
         | static 
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c:222:1: warning: no previous prototype for function 'nvkm_gsp_fwsec_v3' [-Wmissing-prototypes]
     222 | nvkm_gsp_fwsec_v3(struct nvkm_gsp *gsp, const char *name,
         | ^
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c:221:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     221 | int
         | ^
         | static 
   14 warnings generated.


vim +/nvkm_gsp_fwsec_v2 +172 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c

   170	
   171	int
 > 172	nvkm_gsp_fwsec_v2(struct nvkm_gsp *gsp, const char *name,
   173			  const struct nvkm_falcon_ucode_desc_v2 *desc, u32 size, u32 init_cmd,
   174			  struct nvkm_falcon_fw *fw)
   175	{
   176		struct nvkm_subdev *subdev = &gsp->subdev;
   177		const struct firmware *bl;
   178		const struct nvfw_bin_hdr *hdr;
   179		const struct nvfw_bl_desc *bld;
   180		int ret;
   181	
   182		/* Build ucode. */
   183		ret = nvkm_falcon_fw_ctor(gsp->func->fwsec, name, subdev->device, true,
   184					  (u8 *)desc + size, desc->IMEMLoadSize + desc->DMEMLoadSize,
   185					  &gsp->falcon, fw);
   186		if (WARN_ON(ret))
   187			return ret;
   188	
   189		fw->nmem_base_img = 0;
   190		fw->nmem_base = desc->IMEMPhysBase;
   191		fw->nmem_size = desc->IMEMLoadSize - desc->IMEMSecSize;
   192	
   193		fw->imem_base_img = 0;
   194		fw->imem_base = desc->IMEMSecBase;
   195		fw->imem_size = desc->IMEMSecSize;
   196	
   197		fw->dmem_base_img = desc->DMEMOffset;
   198		fw->dmem_base = desc->DMEMPhysBase;
   199		fw->dmem_size = desc->DMEMLoadSize;
   200	
   201		/* Bootloader. */
   202		ret = nvkm_firmware_get(subdev, "acr/bl", 0, &bl);
   203		if (ret)
   204			return ret;
   205	
   206		hdr = nvfw_bin_hdr(subdev, bl->data);
   207		bld = nvfw_bl_desc(subdev, bl->data + hdr->header_offset);
   208	
   209		fw->boot_addr = bld->start_tag << 8;
   210		fw->boot_size = bld->code_size;
   211		fw->boot = kmemdup(bl->data + hdr->data_offset + bld->code_off, fw->boot_size, GFP_KERNEL);
   212		if (!fw->boot)
   213			ret = -ENOMEM;
   214	
   215		nvkm_firmware_put(bl);
   216	
   217		/* Patch in interface data. */
   218		return nvkm_gsp_fwsec_patch(gsp, fw, desc->InterfaceOffset, init_cmd);
   219	}
   220	
   221	int
 > 222	nvkm_gsp_fwsec_v3(struct nvkm_gsp *gsp, const char *name,
   223			  const struct nvkm_falcon_ucode_desc_v3 *desc, u32 size, u32 init_cmd,
   224			  struct nvkm_falcon_fw *fw)
   225	{
   226		struct nvkm_device *device = gsp->subdev.device;
   227		struct nvkm_bios *bios = device->bios;
   228		int ret;
   229	
   230		/* Build ucode. */
   231		ret = nvkm_falcon_fw_ctor(gsp->func->fwsec, name, device, true,
   232					  (u8 *)desc + size, desc->IMEMLoadSize + desc->DMEMLoadSize,
   233					  &gsp->falcon, fw);
   234		if (WARN_ON(ret))
   235			return ret;
   236	
   237		fw->imem_base_img = 0;
   238		fw->imem_base = desc->IMEMPhysBase;
   239		fw->imem_size = desc->IMEMLoadSize;
   240		fw->dmem_base_img = desc->IMEMLoadSize;
   241		fw->dmem_base = desc->DMEMPhysBase;
   242		fw->dmem_size = ALIGN(desc->DMEMLoadSize, 256);
   243		fw->dmem_sign = desc->PKCDataOffset;
   244		fw->boot_addr = 0;
   245		fw->fuse_ver = desc->SignatureVersions;
   246		fw->ucode_id = desc->UcodeId;
   247		fw->engine_id = desc->EngineIdMask;
   248	
   249		/* Patch in signature. */
   250		ret = nvkm_falcon_fw_sign(fw, fw->dmem_base_img + desc->PKCDataOffset, 96 * 4,
   251					  nvbios_pointer(bios, 0), desc->SignatureCount,
   252					  (u8 *)desc + 0x2c - (u8 *)nvbios_pointer(bios, 0), 0, 0);
   253		if (WARN_ON(ret))
   254			return ret;
   255	
   256		/* Patch in interface data. */
   257		return nvkm_gsp_fwsec_patch(gsp, fw, desc->InterfaceOffset, init_cmd);
   258	}
   259	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
