Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C5FCA76;
	Fri,  4 Aug 2023 14:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691160465; x=1722696465;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OkOv3ZD33zY4/JDbpRTOuyRV+qPqy96F3mLKrDbYlgs=;
  b=B17IojrZHz6fejZvtkthqITL5FkBqzOclbhDKdG+ka1MKMroP2GZZH11
   ArzBnsH4lnPsekVff0VWVIXy9rNTMgzfLS9cPJPUvBuyCo1/ndwVoJeVX
   VkfIhGsRFgQkF8TSLwx5f0/obDCc1QCa4RI9TMQgjozTcebKj8QN6z2kx
   NJxSWRBMjxdMsEtREEEUB8Pbmxch6TzF2JVsOSOhj7PbJgpfmxkoShikm
   EdSgJuPVoEWeyfPcIlslo50PM5mmXmGIVSU9Ak+EZjdmikzDNOGHBaaY/
   SZF7db6nKRLi6OFGSkZp4sslczriNAVkUupYBDDAnBfuqoAUWGMaA7Ifl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="369067649"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="369067649"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 07:47:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="976615208"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="976615208"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 04 Aug 2023 07:47:35 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRw5X-0002uA-0O;
	Fri, 04 Aug 2023 14:47:35 +0000
Date: Fri, 4 Aug 2023 22:47:28 +0800
From: kernel test robot <lkp@intel.com>
To: Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	jani.nikula@intel.com, jerry.zuo@amd.com,
	Wayne Lin <Wayne.Lin@amd.com>
Subject: Re: [PATCH 2/3] drm/mst: Refactor the flow for payload
 allocation/removement
Message-ID: <202308042253.lM5xMnnA-lkp@intel.com>
References: <20230804062029.5686-3-Wayne.Lin@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804062029.5686-3-Wayne.Lin@amd.com>

Hi Wayne,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-intel/for-linux-next-fixes drm/drm-next linus/master v6.5-rc4 next-20230804]
[cannot apply to drm-intel/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wayne-Lin/drm-mst-delete-unnecessary-case-in-drm_dp_add_payload_part2/20230804-142405
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230804062029.5686-3-Wayne.Lin%40amd.com
patch subject: [PATCH 2/3] drm/mst: Refactor the flow for payload allocation/removement
config: s390-randconfig-r044-20230731 (https://download.01.org/0day-ci/archive/20230804/202308042253.lM5xMnnA-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308042253.lM5xMnnA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308042253.lM5xMnnA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/nouveau/dispnv50/disp.c:24:
   In file included from drivers/gpu/drm/nouveau/dispnv50/disp.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvif/mem.h:3:
   In file included from drivers/gpu/drm/nouveau/include/nvif/mmu.h:3:
   In file included from drivers/gpu/drm/nouveau/include/nvif/object.h:4:
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
   In file included from drivers/gpu/drm/nouveau/dispnv50/disp.c:24:
   In file included from drivers/gpu/drm/nouveau/dispnv50/disp.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvif/mem.h:3:
   In file included from drivers/gpu/drm/nouveau/include/nvif/mmu.h:3:
   In file included from drivers/gpu/drm/nouveau/include/nvif/object.h:4:
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
   In file included from drivers/gpu/drm/nouveau/dispnv50/disp.c:24:
   In file included from drivers/gpu/drm/nouveau/dispnv50/disp.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvif/mem.h:3:
   In file included from drivers/gpu/drm/nouveau/include/nvif/mmu.h:3:
   In file included from drivers/gpu/drm/nouveau/include/nvif/object.h:4:
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
>> drivers/gpu/drm/nouveau/dispnv50/disp.c:919:46: warning: variable 'old_payload' set but not used [-Wunused-but-set-variable]
     919 |         struct drm_dp_mst_atomic_payload *payload, *old_payload;
         |                                                     ^
   13 warnings generated.


vim +/old_payload +919 drivers/gpu/drm/nouveau/dispnv50/disp.c

f479c0ba4a170a drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs 2016-11-04  908  
f479c0ba4a170a drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs 2016-11-04  909  static void
4d07b0bc403403 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-08-17  910  nv50_msto_prepare(struct drm_atomic_state *state,
4d07b0bc403403 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-08-17  911  		  struct drm_dp_mst_topology_state *mst_state,
4d07b0bc403403 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-08-17  912  		  struct drm_dp_mst_topology_mgr *mgr,
4d07b0bc403403 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-08-17  913  		  struct nv50_msto *msto)
f479c0ba4a170a drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs 2016-11-04  914  {
f479c0ba4a170a drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs 2016-11-04  915  	struct nouveau_drm *drm = nouveau_drm(msto->encoder.dev);
f479c0ba4a170a drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs 2016-11-04  916  	struct nv50_mstc *mstc = msto->mstc;
f479c0ba4a170a drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs 2016-11-04  917  	struct nv50_mstm *mstm = mstc->mstm;
8fb3e25c3dd1a2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-06-13  918  	struct drm_dp_mst_topology_state *old_mst_state;
8fb3e25c3dd1a2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-06-13 @919  	struct drm_dp_mst_atomic_payload *payload, *old_payload;
f479c0ba4a170a drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs 2016-11-04  920  
f479c0ba4a170a drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs 2016-11-04  921  	NV_ATOMIC(drm, "%s: msto prepare\n", msto->encoder.name);
4d07b0bc403403 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-08-17  922  
8fb3e25c3dd1a2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-06-13  923  	old_mst_state = drm_atomic_get_old_mst_topology_state(state, mgr);
8fb3e25c3dd1a2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-06-13  924  
4d07b0bc403403 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-08-17  925  	payload = drm_atomic_get_mst_payload_state(mst_state, mstc->port);
8fb3e25c3dd1a2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-06-13  926  	old_payload = drm_atomic_get_mst_payload_state(old_mst_state, mstc->port);
4d07b0bc403403 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-08-17  927  
4d07b0bc403403 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-08-17  928  	// TODO: Figure out if we want to do a better job of handling VCPI allocation failures here?
4d07b0bc403403 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-08-17  929  	if (msto->disabled) {
c9e8c7f37133c0 drivers/gpu/drm/nouveau/dispnv50/disp.c Wayne Lin  2023-08-04  930  		drm_dp_remove_payload_part1(mgr, mst_state, payload);
8c7d980da9ba3e drivers/gpu/drm/nouveau/dispnv50/disp.c Ben Skeggs 2022-06-01  931  
8c7d980da9ba3e drivers/gpu/drm/nouveau/dispnv50/disp.c Ben Skeggs 2022-06-01  932  		nvif_outp_dp_mst_vcpi(&mstm->outp->outp, msto->head->base.index, 0, 0, 0, 0);
4d07b0bc403403 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-08-17  933  	} else {
4d07b0bc403403 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-08-17  934  		if (msto->enabled)
4d07b0bc403403 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-08-17  935  			drm_dp_add_payload_part1(mgr, mst_state, payload);
4d07b0bc403403 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-08-17  936  
8c7d980da9ba3e drivers/gpu/drm/nouveau/dispnv50/disp.c Ben Skeggs 2022-06-01  937  		nvif_outp_dp_mst_vcpi(&mstm->outp->outp, msto->head->base.index,
8c7d980da9ba3e drivers/gpu/drm/nouveau/dispnv50/disp.c Ben Skeggs 2022-06-01  938  				      payload->vc_start_slot, payload->time_slots,
8c7d980da9ba3e drivers/gpu/drm/nouveau/dispnv50/disp.c Ben Skeggs 2022-06-01  939  				      payload->pbn, payload->time_slots * mst_state->pbn_div);
f479c0ba4a170a drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs 2016-11-04  940  	}
f479c0ba4a170a drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs 2016-11-04  941  }
f479c0ba4a170a drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs 2016-11-04  942  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
