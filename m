Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3A7EC3;
	Fri,  3 Mar 2023 00:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677804045; x=1709340045;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aoD6IFLzRqTMKNh+zS3eUpsQXFjxlijryMCMNgZA+NA=;
  b=Dw39R+NI3E2wzx7ax1EQOUgPNQ5SBEs5qo3zoeMiez5frnk0NHDqNy6i
   QCptvVCxtkB3dwWk+AMuNn0Bm/HvkAhAhOrp4FnNE9vUTQoHFDThSDcj+
   VqSxdIj9owkLFfLkiUx3SqvaNs1toVQbIXTngRMehrYyZ/37O79xT3Vfb
   OPa3D3JDFxBSitnJNh2rAmljwR5L9jK6/kEBTHdfNlbeZ4zMdcciFlgUW
   SVsLolqXriImJoFYM1VKEJPyiozYfiE0CaOL69vrOb+EFW917tLfFGoM+
   t1ViKtKcijMwGmYLTIZNaYkY5LbE1gFQCaaCAvFDDqvO/tOieUFPoAds1
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="421179534"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="421179534"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 16:40:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="785061082"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="785061082"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 02 Mar 2023 16:40:43 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXtTW-00012q-2T;
	Fri, 03 Mar 2023 00:40:42 +0000
Date: Fri, 3 Mar 2023 08:40:08 +0800
From: kernel test robot <lkp@intel.com>
To: Georgi Djakov <djakov@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [djakov-icc:iommu-map 1/2] include/linux/iommu.h:1239:1: error:
 non-void function does not return a value
Message-ID: <202303030811.yUsRvULl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc.git iommu-map
head:   e2620c92a19b9e64162ce85e924a6adc5af285e2
commit: 4d1d75a34b0213312809518528a6a01bba0376a5 [1/2] iommu/dma: Allow the iommu ops to be called from dma mapping code
config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20230303/202303030811.yUsRvULl-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc.git/commit/?id=4d1d75a34b0213312809518528a6a01bba0376a5
        git remote add djakov-icc https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc.git
        git fetch --no-tags djakov-icc iommu-map
        git checkout 4d1d75a34b0213312809518528a6a01bba0376a5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303030811.yUsRvULl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pci/pci-driver.c:23:
>> include/linux/iommu.h:1239:1: error: non-void function does not return a value [-Werror,-Wreturn-type]
   }
   ^
   1 error generated.


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
  1217	static inline void iommu_dma_sync_single_for_cpu(struct device *dev,
  1218			dma_addr_t dma_handle, size_t size, enum dma_data_direction dir)
  1219	{
  1220	}
  1221	static inline void iommu_dma_sync_single_for_device(struct device *dev,
  1222			dma_addr_t dma_handle, size_t size, enum dma_data_direction dir)
  1223	{
  1224	}
  1225	static inline void iommu_dma_sync_sg_for_cpu(struct device *dev,
  1226			struct scatterlist *sgl, int nelems,
  1227			enum dma_data_direction dir)
  1228	{
  1229	}
  1230	static inline void iommu_dma_sync_sg_for_device(struct device *dev,
  1231			struct scatterlist *sgl, int nelems,
  1232			enum dma_data_direction dir)
  1233	{
  1234	}
  1235	static inline dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
  1236			unsigned long offset, size_t size, enum dma_data_direction dir,
  1237			unsigned long attrs)
  1238	{
> 1239	}
  1240	static inline void iommu_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
  1241			size_t size, enum dma_data_direction dir, unsigned long attrs)
  1242	{
  1243	}
  1244	static inline int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
  1245			int nents, enum dma_data_direction dir, unsigned long attrs)
  1246	{
  1247		return -EOPNOTSUPP;
  1248	}
  1249	static inline void iommu_dma_unmap_sg(struct device *dev, struct scatterlist *sg,
  1250			int nents, enum dma_data_direction dir, unsigned long attrs)
  1251	{
  1252	}
  1253	static inline dma_addr_t iommu_dma_map_resource(struct device *dev, phys_addr_t phys,
  1254			size_t size, enum dma_data_direction dir, unsigned long attrs)
  1255	{
  1256		return 0;
  1257	}
  1258	static inline void iommu_dma_unmap_resource(struct device *dev, dma_addr_t handle,
  1259			size_t size, enum dma_data_direction dir, unsigned long attrs)
  1260	{
  1261	}
  1262	static inline void iommu_dma_free(struct device *dev, size_t size, void *cpu_addr,
  1263			dma_addr_t handle, unsigned long attrs)
  1264	{
  1265	}
  1266	static inline void *iommu_dma_alloc(struct device *dev, size_t size,
  1267			dma_addr_t *handle, gfp_t gfp, unsigned long attrs)
  1268	{
  1269		return NULL;
  1270	}
  1271	static inline int iommu_dma_mmap(struct device *dev, struct vm_area_struct *vma,
  1272			void *cpu_addr, dma_addr_t dma_addr, size_t size,
  1273			unsigned long attrs)
  1274	{
  1275		return -EOPNOTSUPP;
  1276	}
  1277	static inline int iommu_dma_get_sgtable(struct device *dev, struct sg_table *sgt,
  1278			void *cpu_addr, dma_addr_t dma_addr, size_t size,
  1279			unsigned long attrs)
  1280	{
  1281		return -EOPNOTSUPP;
  1282	}
  1283	static inline unsigned long iommu_dma_get_merge_boundary(struct device *dev)
  1284	{
  1285		return 0;
  1286	}
  1287	static inline size_t iommu_dma_opt_mapping_size(void)
  1288	{
  1289		return 0;
  1290	}
  1291	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
