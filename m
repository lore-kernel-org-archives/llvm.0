Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D0B33C5;
	Sat, 18 Feb 2023 14:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676730245; x=1708266245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wmk0yCQCTv9DA/H2zM5vOMZs4CT7qq1GRcze0vSqEr0=;
  b=BKX3UAKpHvCIq/UUL9LV9NPZGgBn5BdSL61gaN8SySXJqk9LJtOnaAxQ
   2Wl5R2z8qBFlXaGJhQrmjB9MohxgObzCiFXEth8h384GoQYtJuFDvIT30
   gYkIbYzHa1hZ3+8GJ5DtOHXXUBN3v0huaE79GVxMISN4gRo3kkoQE3+xQ
   kix5AAUtXTCGraAftYn/jcNev8pNDA1y4sSaS0jsGT7ghAE8kjumxIMpx
   +CSChoV/VBYYBT1ygmO3zWBQwMnf2/nWckwW+IYZsxkw6lDCOQjGvnMjg
   JBJ2lmk8oVyhCrZh1lQBv5X5IjVPoDGkYyFc12VsYX1nDCilHT/av2mIo
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="312537724"
X-IronPort-AV: E=Sophos;i="5.97,307,1669104000"; 
   d="scan'208";a="312537724"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 06:24:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="916399081"
X-IronPort-AV: E=Sophos;i="5.97,307,1669104000"; 
   d="scan'208";a="916399081"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 18 Feb 2023 06:24:03 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTO8A-000CSj-28;
	Sat, 18 Feb 2023 14:24:02 +0000
Date: Sat, 18 Feb 2023 22:23:25 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:iommufd_hwpt 23/30] drivers/iommu/iommu.c:2192:5:
 warning: no previous prototype for function 'iommu_group_replace_domain'
Message-ID: <202302182229.I3pZGr2U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommufd_hwpt
head:   81e455ea8edf14c10d6c4db85d654bbbb3e0c387
commit: 86076ff7edfa93947a9d97fd573e795cf3a0505f [23/30] iommu: Introduce a new iommu_group_replace_domain() API
config: powerpc-randconfig-r004-20230217 (https://download.01.org/0day-ci/archive/20230218/202302182229.I3pZGr2U-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/jgunthorpe/linux/commit/86076ff7edfa93947a9d97fd573e795cf3a0505f
        git remote add jgunthorpe https://github.com/jgunthorpe/linux
        git fetch --no-tags jgunthorpe iommufd_hwpt
        git checkout 86076ff7edfa93947a9d97fd573e795cf3a0505f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/iommu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302182229.I3pZGr2U-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/iommu.c:2192:5: warning: no previous prototype for function 'iommu_group_replace_domain' [-Wmissing-prototypes]
   int iommu_group_replace_domain(struct iommu_group *group,
       ^
   drivers/iommu/iommu.c:2192:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int iommu_group_replace_domain(struct iommu_group *group,
   ^
   static 
   1 warning generated.


vim +/iommu_group_replace_domain +2192 drivers/iommu/iommu.c

  2180	
  2181	/**
  2182	 * iommu_group_replace_domain - replace the domain that a group is attached to
  2183	 * @new_domain: new IOMMU domain to replace with
  2184	 * @group: IOMMU group that will be attached to the new domain
  2185	 *
  2186	 * This API allows the group to switch domains without being forced to go to
  2187	 * the blocking domain in-between.
  2188	 *
  2189	 * If the currently attached domain is a core domain (e.g. a default_domain),
  2190	 * it will act just like the iommu_attach_group().
  2191	 */
> 2192	int iommu_group_replace_domain(struct iommu_group *group,
  2193				       struct iommu_domain *new_domain)
  2194	{
  2195		int ret;
  2196	
  2197		if (!new_domain)
  2198			return -EINVAL;
  2199	
  2200		mutex_lock(&group->mutex);
  2201		ret = __iommu_group_set_domain(group, new_domain);
  2202		if (ret)
  2203			__iommu_group_set_domain(group, group->domain);
  2204		mutex_unlock(&group->mutex);
  2205		return ret;
  2206	}
  2207	EXPORT_SYMBOL_NS_GPL(iommu_group_replace_domain, IOMMUFD_INTERNAL);
  2208	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
