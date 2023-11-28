Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0939B63CD;
	Tue, 28 Nov 2023 03:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WJEmM77L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701140536; x=1732676536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RQPDeqB3zTp9n8Hqmy3+jUcf5NdzsW625z7CVAvYe88=;
  b=WJEmM77LImVtoV/zceP+VMy4nLCkxOzb9FTujgJ0uY/CaCA0zjB9anRr
   kyZ66KnHLl81VnV94xiIDqyTgwscTz/Txt4Ga2Hlfh8IvNldBAEWSyYmv
   ScByp+/Pke+tf+drVvXySWknEvbfcTzLxE2Fg/HhmwO61dN1DRoqGgj1q
   tB08ZBXMv13ViCYoUmeaPQxfvFyv5biUOfQjpR2tFK/TWsug2eHJWbzxb
   KU4ZSj/15UtBW/iiFeS69mskk8J6+3XgvmWOFo0ppw/Ji39SnqUFtE2gf
   qFpq0XM2QtU8yPExSF4xVYS6Ok6FOD8ODh2Wrbj/zVo6Zcj38sKqq9RtI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="457170224"
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; 
   d="scan'208";a="457170224"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 19:02:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; 
   d="scan'208";a="16482955"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Nov 2023 19:02:12 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7oMT-0006vG-0O;
	Tue, 28 Nov 2023 03:02:09 +0000
Date: Tue, 28 Nov 2023 11:01:45 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alex Williamson <alex.williamson@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: arch/powerpc/kvm/../../../virt/kvm/vfio.c:89:7: warning: attribute
 declaration must precede definition
Message-ID: <202311280814.KwQVhwqI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yi,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2cc14f52aeb78ce3f29677c2de1f06c0e91471ab
commit: c1cce6d079b875396c9a7c6838fc5b024758e540 vfio: Compile vfio_group infrastructure optionally
date:   4 months ago
config: powerpc64-randconfig-002-20231128 (https://download.01.org/0day-ci/archive/20231128/202311280814.KwQVhwqI-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231128/202311280814.KwQVhwqI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311280814.KwQVhwqI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/kvm/../../../virt/kvm/vfio.c:89:7: warning: attribute declaration must precede definition [-Wignored-attributes]
           fn = symbol_get(vfio_file_iommu_group);
                ^
   include/linux/module.h:805:60: note: expanded from macro 'symbol_get'
   #define symbol_get(x) ({ extern typeof(x) x __attribute__((weak,visibility("hidden"))); &(x); })
                                                              ^
   include/linux/vfio.h:294:35: note: previous definition is here
   static inline struct iommu_group *vfio_file_iommu_group(struct file *file)
                                     ^
>> arch/powerpc/kvm/../../../virt/kvm/vfio.c:89:7: warning: attribute declaration must precede definition [-Wignored-attributes]
           fn = symbol_get(vfio_file_iommu_group);
                ^
   include/linux/module.h:805:65: note: expanded from macro 'symbol_get'
   #define symbol_get(x) ({ extern typeof(x) x __attribute__((weak,visibility("hidden"))); &(x); })
                                                                   ^
   include/linux/vfio.h:294:35: note: previous definition is here
   static inline struct iommu_group *vfio_file_iommu_group(struct file *file)
                                     ^
   2 warnings generated.


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
