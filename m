Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABF2EBB;
	Tue, 28 Mar 2023 08:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679991778; x=1711527778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aD7G6SxSTY2w7dGmyZx3hYnq1f6jV1sX0zZ8VZt/k5Q=;
  b=jRux0NtBfECxcgjI5F0eASn0OuOx+hKBdgTLMuDji0Q/MANSwOj6UoBI
   2LSrmdgTEStCDyW9t9ooRH+hnBEMB8TjuttGi7BqZKxRqzVtko7TEHEhu
   ncVIdo4p4UnaUTeZavRv8bSKPR3i0P0+01+Iq10g/WVfrLB/b/6GWTDDo
   WYBFCwaRHd2pGOVISjH4RxKMWXk9RM82dGCrVsRWqlG8f3vqShVrSsDN0
   zddNTwk2n/DnygrHnmShqIxT0Ei9DOi+mLMI40CbfoUcDJByHUxBICPtE
   L4472tMwC6AH+rvsjmkHUKEXowFILwBK2qBaAASZ2ttYqggfzPDmhpu+t
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="320155811"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400"; 
   d="scan'208";a="320155811"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 01:22:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="683801160"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400"; 
   d="scan'208";a="683801160"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 28 Mar 2023 01:22:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ph4bX-000IOB-2y;
	Tue, 28 Mar 2023 08:22:55 +0000
Date: Tue, 28 Mar 2023 16:22:22 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:gpu/rust-wip 4/13] drivers/iommu/dma-iommu.c:1604:22:
 warning: unused variable 'iovad'
Message-ID: <202303281638.RDc36hX0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux gpu/rust-wip
head:   788bde65c9dd9d364288b590d05f3592ed46a06c
commit: 61599c1f83fab238bffde7b734cd1c4743e5ae3a [4/13] iommu hack for DCP
config: i386-randconfig-a013-20230327 (https://download.01.org/0day-ci/archive/20230328/202303281638.RDc36hX0-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/61599c1f83fab238bffde7b734cd1c4743e5ae3a
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux gpu/rust-wip
        git checkout 61599c1f83fab238bffde7b734cd1c4743e5ae3a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/iommu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303281638.RDc36hX0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/dma-iommu.c:1604:22: warning: unused variable 'iovad' [-Wunused-variable]
           struct iova_domain *iovad = &cookie->iovad;
                               ^
   1 warning generated.


vim +/iovad +1604 drivers/iommu/dma-iommu.c

06d60728ff5c01 Christoph Hellwig 2019-05-20  1597  
06d60728ff5c01 Christoph Hellwig 2019-05-20  1598  static int iommu_dma_get_sgtable(struct device *dev, struct sg_table *sgt,
06d60728ff5c01 Christoph Hellwig 2019-05-20  1599  		void *cpu_addr, dma_addr_t dma_addr, size_t size,
06d60728ff5c01 Christoph Hellwig 2019-05-20  1600  		unsigned long attrs)
06d60728ff5c01 Christoph Hellwig 2019-05-20  1601  {
400cb9633e4ea3 Asahi Lina        2023-03-22  1602  	struct iommu_domain *domain = iommu_get_dma_domain(dev);
400cb9633e4ea3 Asahi Lina        2023-03-22  1603  	struct iommu_dma_cookie *cookie = domain->iova_cookie;
400cb9633e4ea3 Asahi Lina        2023-03-22 @1604  	struct iova_domain *iovad = &cookie->iovad;
3fb3378bb1eb29 Christoph Hellwig 2019-05-20  1605  	struct page *page;
3fb3378bb1eb29 Christoph Hellwig 2019-05-20  1606  	int ret;
06d60728ff5c01 Christoph Hellwig 2019-05-20  1607  
f5ff79fddf0efe Christoph Hellwig 2022-02-26  1608  	if (is_vmalloc_addr(cpu_addr)) {
5cf4537975bbd5 Christoph Hellwig 2019-06-03  1609  		struct page **pages = dma_common_find_pages(cpu_addr);
3fb3378bb1eb29 Christoph Hellwig 2019-05-20  1610  
3fb3378bb1eb29 Christoph Hellwig 2019-05-20  1611  		if (pages) {
3fb3378bb1eb29 Christoph Hellwig 2019-05-20  1612  			return sg_alloc_table_from_pages(sgt, pages,
3fb3378bb1eb29 Christoph Hellwig 2019-05-20  1613  					PAGE_ALIGN(size) >> PAGE_SHIFT,
3fb3378bb1eb29 Christoph Hellwig 2019-05-20  1614  					0, size, GFP_KERNEL);
06d60728ff5c01 Christoph Hellwig 2019-05-20  1615  		}
06d60728ff5c01 Christoph Hellwig 2019-05-20  1616  
3fb3378bb1eb29 Christoph Hellwig 2019-05-20  1617  		page = vmalloc_to_page(cpu_addr);
3fb3378bb1eb29 Christoph Hellwig 2019-05-20  1618  	} else {
3fb3378bb1eb29 Christoph Hellwig 2019-05-20  1619  		page = virt_to_page(cpu_addr);
06d60728ff5c01 Christoph Hellwig 2019-05-20  1620  	}
06d60728ff5c01 Christoph Hellwig 2019-05-20  1621  
3fb3378bb1eb29 Christoph Hellwig 2019-05-20  1622  	ret = sg_alloc_table(sgt, 1, GFP_KERNEL);
3fb3378bb1eb29 Christoph Hellwig 2019-05-20  1623  	if (!ret)
3fb3378bb1eb29 Christoph Hellwig 2019-05-20  1624  		sg_set_page(sgt->sgl, page, PAGE_ALIGN(size), 0);
3fb3378bb1eb29 Christoph Hellwig 2019-05-20  1625  	return ret;
06d60728ff5c01 Christoph Hellwig 2019-05-20  1626  }
06d60728ff5c01 Christoph Hellwig 2019-05-20  1627  

:::::: The code at line 1604 was first introduced by commit
:::::: 400cb9633e4ea394e64348bc48f8da816b69e8d7 4k iommu hack

:::::: TO: Asahi Lina <lina@asahilina.net>
:::::: CC: Asahi Lina <lina@asahilina.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
