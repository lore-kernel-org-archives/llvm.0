Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D60862D;
	Sat, 22 Jul 2023 04:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690001780; x=1721537780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=heb7IZlriJxN2lrll1tBvrBk4PYg351cGSu8o73j9O0=;
  b=V3ApjwhAajIm1QNBJqZwBQEEp/R6n1Y1r2xRzUNQyGedLdCk+9HNocbE
   BCfHS+mJ69t8AvrHuva2OB9TU8UcbAA8EDFUy1gSljpgSQm1sqTcNAkTv
   TF5WtO++ITB5AstrA8XfdmW9W/CSVi1uLMdLRMRatsZMy4w0QoQY5Qtac
   d5DcJLzeGVLdV2kK4Ncg81dTRSeLIoO1XUgqP8WHN4NCWYNBiVXK7O3kn
   2U4wsxYRHnUfGPOEB3hXjqMlqIjK+Gn1FaPZAccJG5RTENCcHRAfpXzWN
   8t6xDEI68Ogx2FwdghLyM6/7nx+9ATU0TYTmxhRwedunpyeUfPjafTJN4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="369828641"
X-IronPort-AV: E=Sophos;i="6.01,223,1684825200"; 
   d="scan'208";a="369828641"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 21:56:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="838784480"
X-IronPort-AV: E=Sophos;i="6.01,223,1684825200"; 
   d="scan'208";a="838784480"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 21 Jul 2023 21:56:18 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qN4fB-0007yn-1e;
	Sat, 22 Jul 2023 04:56:17 +0000
Date: Sat, 22 Jul 2023 12:55:33 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:00.02-gsp-rm 70/83]
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:678:64: error: incompatible
 pointer types passing 'u64 *' (aka 'unsigned long long *') to parameter of
 type 'dma_addr_t *' (aka 'unsigned int *')
Message-ID: <202307221204.SJ6hU4xa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 00.02-gsp-rm
head:   19545cf2c6adc9e9dc95a3edb138d6734142a8ca
commit: 02f0bbcb4d7d0867a087b60a69f6c6250c2a65a6 [70/83] WIPdrm/nouveau/gsp/r535: add support for booting GSP-RM
config: arm-randconfig-r046-20230721 (https://download.01.org/0day-ci/archive/20230722/202307221204.SJ6hU4xa-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307221204.SJ6hU4xa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307221204.SJ6hU4xa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:678:64: error: incompatible pointer types passing 'u64 *' (aka 'unsigned long long *') to parameter of type 'dma_addr_t *' (aka 'unsigned int *') [-Werror,-Wincompatible-pointer-types]
     678 |         mem->data = dma_alloc_coherent(gsp->subdev.device->dev, size, &mem->addr, GFP_KERNEL);
         |                                                                       ^~~~~~~~~~
   include/linux/dma-mapping.h:421:15: note: passing argument to parameter 'dma_handle' here
     421 |                 dma_addr_t *dma_handle, gfp_t gfp)
         |                             ^
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1007:13: error: incompatible pointer types passing 'u64 *' (aka 'unsigned long long *') to parameter of type 'dma_addr_t *' (aka 'unsigned int *') [-Werror,-Wincompatible-pointer-types]
    1007 |                                                       &rx3->mem[i].addr, GFP_KERNEL);
         |                                                       ^~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:421:15: note: passing argument to parameter 'dma_handle' here
     421 |                 dma_addr_t *dma_handle, gfp_t gfp)
         |                             ^
   2 errors generated.


vim +678 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c

   673	
   674	static int
   675	nvkm_gsp_mem_ctor(struct nvkm_gsp *gsp, u32 size, struct nvkm_gsp_mem *mem)
   676	{
   677		mem->size = size;
 > 678		mem->data = dma_alloc_coherent(gsp->subdev.device->dev, size, &mem->addr, GFP_KERNEL);
   679		if (WARN_ON(!mem->data))
   680			return -ENOMEM;
   681	
   682		return 0;
   683	}
   684	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
