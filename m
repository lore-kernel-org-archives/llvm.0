Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7097C
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 11:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644839640; x=1676375640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=78NBjTW1Usi2nU8xVnJBMuVMyBmU+wkZ71QX/Ue0630=;
  b=MsB0pwev7lKx4T308RNkRCu7iIombQAeqqrzgBzX1eGWwQT6BX9JZuNr
   /HsIWsBpFpZEqzHl5aztyYyxgkKYLi7cjn+pdJVghCDqMTjOx/4Oumo+3
   oH6qvXJcS980EbQQ8LpSy6UEI48HZ5pCC9mjkOdFR63Yy/DA3tF4VV/nS
   4HAyosiiNTX5s01D5j4sxdEkGel3EdOtvVMIuXiGYFtRyFqN9sJSVK1ZB
   Mw0qC9UOFxRHz3bNoREfzB535bA4EE7o8DP1gJPYpKk25sfURi45hefBR
   8T6f0zxXfKVp6vhsOwW6kq4YYk275fU+pIIVeM1pL6atFGFz2DCrWQ0g5
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="237484374"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; 
   d="scan'208";a="237484374"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 03:54:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; 
   d="scan'208";a="775107823"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 14 Feb 2022 03:53:58 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nJZva-0008Tt-4t; Mon, 14 Feb 2022 11:53:58 +0000
Date: Mon, 14 Feb 2022 19:53:50 +0800
From: kernel test robot <lkp@intel.com>
To: Liu Yi L <yi.l.liu@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [luxis1999-iommufd:iommufd-v5.17-rc1 29/29]
 drivers/iommu/iommufd/pages.c:482:2: error: implicit declaration of function
 'kunmap_atomic'
Message-ID: <202202141921.KB6IvVIV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/luxis1999/iommufd iommufd-v5.17-rc1
head:   0afc8638a638ddb14a59876ee72e869b770f4c02
commit: 0afc8638a638ddb14a59876ee72e869b770f4c02 [29/29] iommufd: Add device mmio map support
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20220214/202202141921.KB6IvVIV-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ea071884b0cc7210b3cc5fe858f0e892a779a23b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/luxis1999/iommufd/commit/0afc8638a638ddb14a59876ee72e869b770f4c02
        git remote add luxis1999-iommufd https://github.com/luxis1999/iommufd
        git fetch --no-tags luxis1999-iommufd iommufd-v5.17-rc1
        git checkout 0afc8638a638ddb14a59876ee72e869b770f4c02
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/iommu/iommufd/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/iommu/iommufd/pages.c:482:2: error: implicit declaration of function 'kunmap_atomic' [-Werror,-Wimplicit-function-declaration]
           pte_unmap_unlock(ptep, ptl);
           ^
   include/linux/mm.h:2345:2: note: expanded from macro 'pte_unmap_unlock'
           pte_unmap(pte);                                 \
           ^
   include/linux/pgtable.h:99:24: note: expanded from macro 'pte_unmap'
   #define pte_unmap(pte) kunmap_atomic((pte))
                          ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IOMMUFD
   Depends on IOMMU_SUPPORT
   Selected by
   - VFIO_PCI_CORE && VFIO && PCI && MMU


vim +/kunmap_atomic +482 drivers/iommu/iommufd/pages.c

   449	
   450	static int follow_fault_pfn(struct vm_area_struct *vma, struct mm_struct *mm,
   451				    unsigned long vaddr, unsigned long *pfn,
   452				    bool write_fault)
   453	{
   454		pte_t *ptep;
   455		spinlock_t *ptl;
   456		int ret;
   457	
   458		ret = follow_pte(vma->vm_mm, vaddr, &ptep, &ptl);
   459		if (ret) {
   460			bool unlocked = false;
   461	
   462			ret = fixup_user_fault(mm, vaddr,
   463					       FAULT_FLAG_REMOTE |
   464					       (write_fault ?  FAULT_FLAG_WRITE : 0),
   465					       &unlocked);
   466			if (unlocked)
   467				return -EAGAIN;
   468	
   469			if (ret)
   470				return ret;
   471	
   472			ret = follow_pte(vma->vm_mm, vaddr, &ptep, &ptl);
   473			if (ret)
   474				return ret;
   475		}
   476	
   477		if (write_fault && !pte_write(*ptep))
   478			ret = -EFAULT;
   479		else
   480			*pfn = pte_pfn(*ptep);
   481	
 > 482		pte_unmap_unlock(ptep, ptl);
   483		return ret;
   484	}
   485	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
