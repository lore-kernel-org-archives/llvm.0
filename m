Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC82C2EB;
	Fri, 25 Aug 2023 11:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692962755; x=1724498755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dZCkDVpzdGis2FkhXG4Y9vSWt92TtsbxnFXC3X8+rus=;
  b=i9h7qdm199udcYy+yNoX4tHea1K+JDC3pZ2d28sJ2ZN38i9uUMBYgmLD
   mWQfjwabubfjSuaXnGIw++gKsx6SMXRTydqfH7IUMik/4NkjhFOVbISQo
   5m+91P+2W0iExw5qL1W+lSL6eflSi45z898ke4VhsuT1Gth56+b2z6qN0
   mfm8d1Rxwyj5xYYlDjsevXgGd/8HfYayppKJ0+xuG4xUYe+faPESaJjI3
   9YCM+GJ4uZ3CrCooriWzm0JAGNZqRU38GCiIMUC33+rjlxZGPpX+NpvpD
   vyljFMb5xkxt9vA4LQLWMvU7ZJVeQ0Je85FL6qSWAzK4D2EiLd66iupEX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="378475236"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="378475236"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 04:25:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="687268624"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="687268624"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 25 Aug 2023 04:25:52 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZUw0-0003VW-0O;
	Fri, 25 Aug 2023 11:25:09 +0000
Date: Fri, 25 Aug 2023 19:23:29 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [linux-next:master 3581/12910]
 arch/powerpc/kvm/../../../virt/kvm/vfio.c:89:7: error: attribute declaration
 must precede definition
Message-ID: <202308251949.5IiaV0sz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6269320850097903b30be8f07a5c61d9f7592393
commit: c1cce6d079b875396c9a7c6838fc5b024758e540 [3581/12910] vfio: Compile vfio_group infrastructure optionally
config: powerpc64-randconfig-r001-20230825 (https://download.01.org/0day-ci/archive/20230825/202308251949.5IiaV0sz-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308251949.5IiaV0sz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308251949.5IiaV0sz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/kvm/../../../virt/kvm/vfio.c:89:7: error: attribute declaration must precede definition [-Werror,-Wignored-attributes]
           fn = symbol_get(vfio_file_iommu_group);
                ^
   include/linux/module.h:805:60: note: expanded from macro 'symbol_get'
   #define symbol_get(x) ({ extern typeof(x) x __attribute__((weak,visibility("hidden"))); &(x); })
                                                              ^
   include/linux/vfio.h:294:35: note: previous definition is here
   static inline struct iommu_group *vfio_file_iommu_group(struct file *file)
                                     ^
>> arch/powerpc/kvm/../../../virt/kvm/vfio.c:89:7: error: attribute declaration must precede definition [-Werror,-Wignored-attributes]
           fn = symbol_get(vfio_file_iommu_group);
                ^
   include/linux/module.h:805:65: note: expanded from macro 'symbol_get'
   #define symbol_get(x) ({ extern typeof(x) x __attribute__((weak,visibility("hidden"))); &(x); })
                                                                   ^
   include/linux/vfio.h:294:35: note: previous definition is here
   static inline struct iommu_group *vfio_file_iommu_group(struct file *file)
                                     ^
   2 errors generated.


vim +89 arch/powerpc/kvm/../../../virt/kvm/vfio.c

4b22ef042d6f54 Jason Gunthorpe      2022-10-07  82  
4b22ef042d6f54 Jason Gunthorpe      2022-10-07  83  #ifdef CONFIG_SPAPR_TCE_IOMMU
50d63b5bbfd122 Jason Gunthorpe      2022-05-04  84  static struct iommu_group *kvm_vfio_file_iommu_group(struct file *file)
121f80ba68f1a5 Alexey Kardashevskiy 2017-03-22  85  {
50d63b5bbfd122 Jason Gunthorpe      2022-05-04  86  	struct iommu_group *(*fn)(struct file *file);
50d63b5bbfd122 Jason Gunthorpe      2022-05-04  87  	struct iommu_group *ret;
121f80ba68f1a5 Alexey Kardashevskiy 2017-03-22  88  
50d63b5bbfd122 Jason Gunthorpe      2022-05-04 @89  	fn = symbol_get(vfio_file_iommu_group);
121f80ba68f1a5 Alexey Kardashevskiy 2017-03-22  90  	if (!fn)
50d63b5bbfd122 Jason Gunthorpe      2022-05-04  91  		return NULL;
121f80ba68f1a5 Alexey Kardashevskiy 2017-03-22  92  
50d63b5bbfd122 Jason Gunthorpe      2022-05-04  93  	ret = fn(file);
121f80ba68f1a5 Alexey Kardashevskiy 2017-03-22  94  
50d63b5bbfd122 Jason Gunthorpe      2022-05-04  95  	symbol_put(vfio_file_iommu_group);
121f80ba68f1a5 Alexey Kardashevskiy 2017-03-22  96  
121f80ba68f1a5 Alexey Kardashevskiy 2017-03-22  97  	return ret;
121f80ba68f1a5 Alexey Kardashevskiy 2017-03-22  98  }
121f80ba68f1a5 Alexey Kardashevskiy 2017-03-22  99  

:::::: The code at line 89 was first introduced by commit
:::::: 50d63b5bbfd12262069ad062611cd5e69c5e9e05 vfio: Change vfio_external_user_iommu_id() to vfio_file_iommu_group()

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Alex Williamson <alex.williamson@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
