Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1423257E;
	Fri, 24 Feb 2023 08:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677228525; x=1708764525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IyHpCXRczHBsyfVG3u54glx0LTt4/W7+CgmYEkytCgU=;
  b=AfU4FfRwoNqmzc+mEIgP/zgfyrpv/Cuz+FPogHjh9qSrvzLA8XFhaKZf
   RTILtMtdwhhUDWmX/oZ5kqZeicCx6zOAizSG56U83tRsshvnAFoxLLv9V
   /A2pR0o0FemyXyDpdFqBwY/f37cNNfFBxRY34pRO6C6V8O2QT7em2mtNr
   oEwUte9N2OczKXZtp9zsyfx/jXTZTK3NalQWA8c0aOz4WIznItimRWBiM
   5mUVQ4+NdagS5n1s0bDwxokKJxBclNEPWqKK4FUt3fYOEpjpcOVCBO1cU
   qYhdTYunPtBsY/sdmsldfsCY5uiPCe6ILi7ghSeA9k0SPZNjt6CeDLnIa
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="395940654"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; 
   d="scan'208";a="395940654"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 00:48:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="703119962"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; 
   d="scan'208";a="703119962"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 24 Feb 2023 00:48:44 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVTkx-0002Gf-18;
	Fri, 24 Feb 2023 08:48:43 +0000
Date: Fri, 24 Feb 2023 16:48:36 +0800
From: kernel test robot <lkp@intel.com>
To: Georgi Djakov <djakov@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [djakov-icc:iommu-map 1/2] include/linux/iommu.h:1239:1: error:
 non-void function does not return a value
Message-ID: <202302241620.nHkolaqL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc.git iommu-map
head:   fb4d192f5ce8218ca4172f2b36249ee3cc07ac4d
commit: 7bd4d27440eb9947782c3f58fd6f049f3e882e55 [1/2] iommu/dma: Export the iommu ops to allow them to be called from dma mapping code
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20230224/202302241620.nHkolaqL-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc.git/commit/?id=7bd4d27440eb9947782c3f58fd6f049f3e882e55
        git remote add djakov-icc https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc.git
        git fetch --no-tags djakov-icc iommu-map
        git checkout 7bd4d27440eb9947782c3f58fd6f049f3e882e55
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/vfio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302241620.nHkolaqL-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/vfio/vfio_main.c:18:
>> include/linux/iommu.h:1217:6: warning: no previous prototype for function 'iommu_dma_sync_single_for_cpu' [-Wmissing-prototypes]
   void iommu_dma_sync_single_for_cpu(struct device *dev,
        ^
   include/linux/iommu.h:1217:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void iommu_dma_sync_single_for_cpu(struct device *dev,
   ^
   static 
>> include/linux/iommu.h:1221:6: warning: no previous prototype for function 'iommu_dma_sync_single_for_device' [-Wmissing-prototypes]
   void iommu_dma_sync_single_for_device(struct device *dev,
        ^
   include/linux/iommu.h:1221:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void iommu_dma_sync_single_for_device(struct device *dev,
   ^
   static 
>> include/linux/iommu.h:1225:6: warning: no previous prototype for function 'iommu_dma_sync_sg_for_cpu' [-Wmissing-prototypes]
   void iommu_dma_sync_sg_for_cpu(struct device *dev,
        ^
   include/linux/iommu.h:1225:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void iommu_dma_sync_sg_for_cpu(struct device *dev,
   ^
   static 
>> include/linux/iommu.h:1230:6: warning: no previous prototype for function 'iommu_dma_sync_sg_for_device' [-Wmissing-prototypes]
   void iommu_dma_sync_sg_for_device(struct device *dev,
        ^
   include/linux/iommu.h:1230:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void iommu_dma_sync_sg_for_device(struct device *dev,
   ^
   static 
>> include/linux/iommu.h:1235:12: warning: no previous prototype for function 'iommu_dma_map_page' [-Wmissing-prototypes]
   dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
              ^
   include/linux/iommu.h:1235:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
   ^
   static 
>> include/linux/iommu.h:1239:1: error: non-void function does not return a value [-Werror,-Wreturn-type]
   }
   ^
>> include/linux/iommu.h:1240:6: warning: no previous prototype for function 'iommu_dma_unmap_page' [-Wmissing-prototypes]
   void iommu_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
        ^
   include/linux/iommu.h:1240:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void iommu_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
   ^
   static 
>> include/linux/iommu.h:1244:5: warning: no previous prototype for function 'iommu_dma_map_sg' [-Wmissing-prototypes]
   int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
       ^
   include/linux/iommu.h:1244:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
   ^
   static 
>> include/linux/iommu.h:1249:6: warning: no previous prototype for function 'iommu_dma_unmap_sg' [-Wmissing-prototypes]
   void iommu_dma_unmap_sg(struct device *dev, struct scatterlist *sg,
        ^
   include/linux/iommu.h:1249:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void iommu_dma_unmap_sg(struct device *dev, struct scatterlist *sg,
   ^
   static 
>> include/linux/iommu.h:1253:12: warning: no previous prototype for function 'iommu_dma_map_resource' [-Wmissing-prototypes]
   dma_addr_t iommu_dma_map_resource(struct device *dev, phys_addr_t phys,
              ^
   include/linux/iommu.h:1253:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   dma_addr_t iommu_dma_map_resource(struct device *dev, phys_addr_t phys,
   ^
   static 
>> include/linux/iommu.h:1258:6: warning: no previous prototype for function 'iommu_dma_unmap_resource' [-Wmissing-prototypes]
   void iommu_dma_unmap_resource(struct device *dev, dma_addr_t handle,
        ^
   include/linux/iommu.h:1258:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void iommu_dma_unmap_resource(struct device *dev, dma_addr_t handle,
   ^
   static 
>> include/linux/iommu.h:1262:6: warning: no previous prototype for function 'iommu_dma_free' [-Wmissing-prototypes]
   void iommu_dma_free(struct device *dev, size_t size, void *cpu_addr,
        ^
   include/linux/iommu.h:1262:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void iommu_dma_free(struct device *dev, size_t size, void *cpu_addr,
   ^
   static 
>> include/linux/iommu.h:1266:7: warning: no previous prototype for function 'iommu_dma_alloc' [-Wmissing-prototypes]
   void *iommu_dma_alloc(struct device *dev, size_t size,
         ^
   include/linux/iommu.h:1266:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void *iommu_dma_alloc(struct device *dev, size_t size,
   ^
   static 
>> include/linux/iommu.h:1271:5: warning: no previous prototype for function 'iommu_dma_mmap' [-Wmissing-prototypes]
   int iommu_dma_mmap(struct device *dev, struct vm_area_struct *vma,
       ^
   include/linux/iommu.h:1271:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int iommu_dma_mmap(struct device *dev, struct vm_area_struct *vma,
   ^
   static 
>> include/linux/iommu.h:1277:5: warning: no previous prototype for function 'iommu_dma_get_sgtable' [-Wmissing-prototypes]
   int iommu_dma_get_sgtable(struct device *dev, struct sg_table *sgt,
       ^
   include/linux/iommu.h:1277:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int iommu_dma_get_sgtable(struct device *dev, struct sg_table *sgt,
   ^
   static 
>> include/linux/iommu.h:1283:15: warning: no previous prototype for function 'iommu_dma_get_merge_boundary' [-Wmissing-prototypes]
   unsigned long iommu_dma_get_merge_boundary(struct device *dev)
                 ^
   include/linux/iommu.h:1283:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned long iommu_dma_get_merge_boundary(struct device *dev)
   ^
   static 
>> include/linux/iommu.h:1287:8: warning: no previous prototype for function 'iommu_dma_opt_mapping_size' [-Wmissing-prototypes]
   size_t iommu_dma_opt_mapping_size(void)
          ^
   include/linux/iommu.h:1287:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   size_t iommu_dma_opt_mapping_size(void)
   ^
   static 
   16 warnings and 1 error generated.
--
   In file included from drivers/vfio/vfio_iommu_type1.c:28:
>> include/linux/iommu.h:1217:6: warning: no previous prototype for function 'iommu_dma_sync_single_for_cpu' [-Wmissing-prototypes]
   void iommu_dma_sync_single_for_cpu(struct device *dev,
        ^
   include/linux/iommu.h:1217:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void iommu_dma_sync_single_for_cpu(struct device *dev,
   ^
   static 
>> include/linux/iommu.h:1221:6: warning: no previous prototype for function 'iommu_dma_sync_single_for_device' [-Wmissing-prototypes]
   void iommu_dma_sync_single_for_device(struct device *dev,
        ^
   include/linux/iommu.h:1221:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void iommu_dma_sync_single_for_device(struct device *dev,
   ^
   static 
>> include/linux/iommu.h:1225:6: warning: no previous prototype for function 'iommu_dma_sync_sg_for_cpu' [-Wmissing-prototypes]
   void iommu_dma_sync_sg_for_cpu(struct device *dev,
        ^
   include/linux/iommu.h:1225:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void iommu_dma_sync_sg_for_cpu(struct device *dev,
   ^
   static 
>> include/linux/iommu.h:1230:6: warning: no previous prototype for function 'iommu_dma_sync_sg_for_device' [-Wmissing-prototypes]
   void iommu_dma_sync_sg_for_device(struct device *dev,
        ^
   include/linux/iommu.h:1230:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void iommu_dma_sync_sg_for_device(struct device *dev,
   ^
   static 
>> include/linux/iommu.h:1235:12: warning: no previous prototype for function 'iommu_dma_map_page' [-Wmissing-prototypes]
   dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
              ^
   include/linux/iommu.h:1235:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
   ^
   static 
>> include/linux/iommu.h:1239:1: error: non-void function does not return a value [-Werror,-Wreturn-type]
   }
   ^
>> include/linux/iommu.h:1240:6: warning: no previous prototype for function 'iommu_dma_unmap_page' [-Wmissing-prototypes]
   void iommu_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
        ^
   include/linux/iommu.h:1240:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void iommu_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
   ^
   static 
>> include/linux/iommu.h:1244:5: warning: no previous prototype for function 'iommu_dma_map_sg' [-Wmissing-prototypes]
   int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
       ^
   include/linux/iommu.h:1244:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
   ^
   static 
>> include/linux/iommu.h:1249:6: warning: no previous prototype for function 'iommu_dma_unmap_sg' [-Wmissing-prototypes]
   void iommu_dma_unmap_sg(struct device *dev, struct scatterlist *sg,
        ^
   include/linux/iommu.h:1249:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void iommu_dma_unmap_sg(struct device *dev, struct scatterlist *sg,
   ^
   static 
>> include/linux/iommu.h:1253:12: warning: no previous prototype for function 'iommu_dma_map_resource' [-Wmissing-prototypes]
   dma_addr_t iommu_dma_map_resource(struct device *dev, phys_addr_t phys,
              ^
   include/linux/iommu.h:1253:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   dma_addr_t iommu_dma_map_resource(struct device *dev, phys_addr_t phys,
   ^
   static 
>> include/linux/iommu.h:1258:6: warning: no previous prototype for function 'iommu_dma_unmap_resource' [-Wmissing-prototypes]
   void iommu_dma_unmap_resource(struct device *dev, dma_addr_t handle,
        ^
   include/linux/iommu.h:1258:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void iommu_dma_unmap_resource(struct device *dev, dma_addr_t handle,
   ^
   static 
>> include/linux/iommu.h:1262:6: warning: no previous prototype for function 'iommu_dma_free' [-Wmissing-prototypes]
   void iommu_dma_free(struct device *dev, size_t size, void *cpu_addr,
        ^
   include/linux/iommu.h:1262:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void iommu_dma_free(struct device *dev, size_t size, void *cpu_addr,
   ^
   static 
>> include/linux/iommu.h:1266:7: warning: no previous prototype for function 'iommu_dma_alloc' [-Wmissing-prototypes]
   void *iommu_dma_alloc(struct device *dev, size_t size,
         ^
   include/linux/iommu.h:1266:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void *iommu_dma_alloc(struct device *dev, size_t size,
   ^
   static 
>> include/linux/iommu.h:1271:5: warning: no previous prototype for function 'iommu_dma_mmap' [-Wmissing-prototypes]
   int iommu_dma_mmap(struct device *dev, struct vm_area_struct *vma,
       ^
   include/linux/iommu.h:1271:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int iommu_dma_mmap(struct device *dev, struct vm_area_struct *vma,
   ^
   static 
>> include/linux/iommu.h:1277:5: warning: no previous prototype for function 'iommu_dma_get_sgtable' [-Wmissing-prototypes]
   int iommu_dma_get_sgtable(struct device *dev, struct sg_table *sgt,
       ^
   include/linux/iommu.h:1277:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int iommu_dma_get_sgtable(struct device *dev, struct sg_table *sgt,
   ^
   static 
>> include/linux/iommu.h:1283:15: warning: no previous prototype for function 'iommu_dma_get_merge_boundary' [-Wmissing-prototypes]
   unsigned long iommu_dma_get_merge_boundary(struct device *dev)
                 ^
   include/linux/iommu.h:1283:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned long iommu_dma_get_merge_boundary(struct device *dev)
   ^
   static 
>> include/linux/iommu.h:1287:8: warning: no previous prototype for function 'iommu_dma_opt_mapping_size' [-Wmissing-prototypes]
   size_t iommu_dma_opt_mapping_size(void)
          ^
   include/linux/iommu.h:1287:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   size_t iommu_dma_opt_mapping_size(void)
   ^
   static 
   drivers/vfio/vfio_iommu_type1.c:2175:35: warning: cast to smaller integer type 'enum iommu_cap' from 'void *' [-Wvoid-pointer-to-enum-cast]
           return device_iommu_capable(dev, (enum iommu_cap)data);
                                            ^~~~~~~~~~~~~~~~~~~~
   17 warnings and 1 error generated.


vim +1239 include/linux/iommu.h

  1206	
  1207	static inline struct sg_table *iommu_dma_alloc_noncontiguous(struct device *dev,
  1208			size_t size, enum dma_data_direction dir, gfp_t gfp,
  1209			unsigned long attrs)
  1210	{
  1211		return NULL;
  1212	}
  1213	static inline void iommu_dma_free_noncontiguous(struct device *dev, size_t size,
  1214			struct sg_table *sgt, enum dma_data_direction dir)
  1215	{
  1216	}
> 1217	void iommu_dma_sync_single_for_cpu(struct device *dev,
  1218			dma_addr_t dma_handle, size_t size, enum dma_data_direction dir)
  1219	{
  1220	}
> 1221	void iommu_dma_sync_single_for_device(struct device *dev,
  1222			dma_addr_t dma_handle, size_t size, enum dma_data_direction dir)
  1223	{
  1224	}
> 1225	void iommu_dma_sync_sg_for_cpu(struct device *dev,
  1226			struct scatterlist *sgl, int nelems,
  1227			enum dma_data_direction dir)
  1228	{
  1229	}
> 1230	void iommu_dma_sync_sg_for_device(struct device *dev,
  1231			struct scatterlist *sgl, int nelems,
  1232			enum dma_data_direction dir)
  1233	{
  1234	}
> 1235	dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
  1236			unsigned long offset, size_t size, enum dma_data_direction dir,
  1237			unsigned long attrs)
  1238	{
> 1239	}
> 1240	void iommu_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
  1241			size_t size, enum dma_data_direction dir, unsigned long attrs)
  1242	{
  1243	}
> 1244	int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
  1245			int nents, enum dma_data_direction dir, unsigned long attrs)
  1246	{
  1247		return -EOPNOTSUPP;
  1248	}
> 1249	void iommu_dma_unmap_sg(struct device *dev, struct scatterlist *sg,
  1250			int nents, enum dma_data_direction dir, unsigned long attrs)
  1251	{
  1252	}
> 1253	dma_addr_t iommu_dma_map_resource(struct device *dev, phys_addr_t phys,
  1254			size_t size, enum dma_data_direction dir, unsigned long attrs)
  1255	{
  1256		return 0;
  1257	}
> 1258	void iommu_dma_unmap_resource(struct device *dev, dma_addr_t handle,
  1259			size_t size, enum dma_data_direction dir, unsigned long attrs)
  1260	{
  1261	}
> 1262	void iommu_dma_free(struct device *dev, size_t size, void *cpu_addr,
  1263			dma_addr_t handle, unsigned long attrs)
  1264	{
  1265	}
> 1266	void *iommu_dma_alloc(struct device *dev, size_t size,
  1267			dma_addr_t *handle, gfp_t gfp, unsigned long attrs)
  1268	{
  1269		return NULL;
  1270	}
> 1271	int iommu_dma_mmap(struct device *dev, struct vm_area_struct *vma,
  1272			void *cpu_addr, dma_addr_t dma_addr, size_t size,
  1273			unsigned long attrs)
  1274	{
  1275		return -EOPNOTSUPP;
  1276	}
> 1277	int iommu_dma_get_sgtable(struct device *dev, struct sg_table *sgt,
  1278			void *cpu_addr, dma_addr_t dma_addr, size_t size,
  1279			unsigned long attrs)
  1280	{
  1281		return -EOPNOTSUPP;
  1282	}
> 1283	unsigned long iommu_dma_get_merge_boundary(struct device *dev)
  1284	{
  1285		return 0;
  1286	}
> 1287	size_t iommu_dma_opt_mapping_size(void)
  1288	{
  1289		return 0;
  1290	}
  1291	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
