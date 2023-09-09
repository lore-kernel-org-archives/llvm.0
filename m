Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2166315B4;
	Sat,  9 Sep 2023 10:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694255952; x=1725791952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UWKGKKSLauY8/pmOCs5x77V6up4JJCBujfB/dmkKSjc=;
  b=m96Pn0oILyNoeVfkMpnIt8rMfFjj/MwJGCj20Idl8XD7wqd486SEaCos
   x5ESX66Kfo8i5v1A/9ZhsiKlckvb+tZiRbE1WotXGmXzxRCBAqv2/oNB5
   3NJCZZ3Hg4JLJILjQUDCD4KWz1Fdni52XqchajvTcXxL/pvgyZHoDTM/m
   +MI7KWmcISlWx2MCiJod8XU9cTQ8JsHf1Kj7YN9XUvrU6FOvNseIJgNyG
   jF8gouaKmlF24U6qSInVKDBRfoLorSvmNygXoq5qTrZX9fF/PUTZB0Xy0
   5olUFWLSTH7xo0ro4C5Cx3QJwPwsrTnj8t0ayrluJCq+mANLiy6UHJseH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="377722081"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="377722081"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 03:39:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="777862519"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="777862519"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 Sep 2023 03:39:09 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qevMo-0003Jq-3B;
	Sat, 09 Sep 2023 10:39:06 +0000
Date: Sat, 9 Sep 2023 18:38:48 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:00.02-gsp-rm 75/88]
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:862:64: error: incompatible
 pointer types passing 'u64 *' (aka 'unsigned long long *') to parameter of
 type 'dma_addr_t *' (aka 'unsigned int *')
Message-ID: <202309091838.zcUs1iZD-lkp@intel.com>
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
commit: be0fbb4280f503fc23755c670bb9279fea89e46a [75/88] WIPdrm/nouveau/gsp/r535: add support for booting GSP-RM
config: arm-randconfig-r024-20230909 (https://download.01.org/0day-ci/archive/20230909/202309091838.zcUs1iZD-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309091838.zcUs1iZD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309091838.zcUs1iZD-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

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
   2 warnings generated.
--
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:489:2: warning: array index 0 is past the end of the array (that has type 'PACKED_REGISTRY_ENTRY[0]' (aka 'struct PACKED_REGISTRY_ENTRY[0]')) [-Warray-bounds]
     489 |         rpc->entries[0].nameOffset = offsetof(typeof(*rpc), entries[1]);
         |         ^            ~
   drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_os_nvoc.h:41:5: note: array 'entries' declared here
      41 |     PACKED_REGISTRY_ENTRY   entries[0];
         |     ^
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:490:2: warning: array index 0 is past the end of the array (that has type 'PACKED_REGISTRY_ENTRY[0]' (aka 'struct PACKED_REGISTRY_ENTRY[0]')) [-Warray-bounds]
     490 |         rpc->entries[0].type = 1;
         |         ^            ~
   drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_os_nvoc.h:41:5: note: array 'entries' declared here
      41 |     PACKED_REGISTRY_ENTRY   entries[0];
         |     ^
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:491:2: warning: array index 0 is past the end of the array (that has type 'PACKED_REGISTRY_ENTRY[0]' (aka 'struct PACKED_REGISTRY_ENTRY[0]')) [-Warray-bounds]
     491 |         rpc->entries[0].data = 0;
         |         ^            ~
   drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_os_nvoc.h:41:5: note: array 'entries' declared here
      41 |     PACKED_REGISTRY_ENTRY   entries[0];
         |     ^
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:492:2: warning: array index 0 is past the end of the array (that has type 'PACKED_REGISTRY_ENTRY[0]' (aka 'struct PACKED_REGISTRY_ENTRY[0]')) [-Warray-bounds]
     492 |         rpc->entries[0].length = 4;
         |         ^            ~
   drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_os_nvoc.h:41:5: note: array 'entries' declared here
      41 |     PACKED_REGISTRY_ENTRY   entries[0];
         |     ^
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:862:64: error: incompatible pointer types passing 'u64 *' (aka 'unsigned long long *') to parameter of type 'dma_addr_t *' (aka 'unsigned int *') [-Werror,-Wincompatible-pointer-types]
     862 |         mem->data = dma_alloc_coherent(gsp->subdev.device->dev, size, &mem->addr, GFP_KERNEL);
         |                                                                       ^~~~~~~~~~
   include/linux/dma-mapping.h:422:15: note: passing argument to parameter 'dma_handle' here
     422 |                 dma_addr_t *dma_handle, gfp_t gfp)
         |                             ^
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1191:13: error: incompatible pointer types passing 'u64 *' (aka 'unsigned long long *') to parameter of type 'dma_addr_t *' (aka 'unsigned int *') [-Werror,-Wincompatible-pointer-types]
    1191 |                                                       &rx3->mem[i].addr, GFP_KERNEL);
         |                                                       ^~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:422:15: note: passing argument to parameter 'dma_handle' here
     422 |                 dma_addr_t *dma_handle, gfp_t gfp)
         |                             ^
   4 warnings and 2 errors generated.


vim +862 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c

   857	
   858	static int
   859	nvkm_gsp_mem_ctor(struct nvkm_gsp *gsp, u32 size, struct nvkm_gsp_mem *mem)
   860	{
   861		mem->size = size;
 > 862		mem->data = dma_alloc_coherent(gsp->subdev.device->dev, size, &mem->addr, GFP_KERNEL);
   863		if (WARN_ON(!mem->data))
   864			return -ENOMEM;
   865	
   866		return 0;
   867	}
   868	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
