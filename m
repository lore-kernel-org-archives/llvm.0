Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7100F168
	for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 18:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639680145; x=1671216145;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pCFBMB/YyMpu1gKlti3F42W5/YLXsD3/okNzNquS0kI=;
  b=UTpxXv3T/X1Y1IdeNw4TeP0HwBMZygwcfqS8N725n0VRKWE0LfN1v/Lz
   3z1rhN8bxs+YbukXrwJ0soYMagq152q490MO7fz1+flfy3ouzoFtjeI02
   qlg14AQyc8+iE+4sc+Oryzzvpg/Ig5W5tTo7ml0988sWc4+qOWDkVx1sV
   LJMAanhM+eRS60blo5YtJBS9Rvq98l3s4hb1WZxECEhkQcHX3xFna7GwZ
   LxwP8SUaVPv5SCI2pRYyLsFdRCWGrOp3+EIQzz+lMQkeAuhu3WnkCDc9N
   bfLbqwFDUeWkQSrcLvY3iE13FNbRUwyhhjgg3bZRNuf52lGaT7DRV3vUI
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="237109993"
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; 
   d="scan'208";a="237109993"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 10:42:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; 
   d="scan'208";a="615267633"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 16 Dec 2021 10:42:18 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mxvhp-0003g5-Qn; Thu, 16 Dec 2021 18:42:17 +0000
Date: Fri, 17 Dec 2021 02:42:06 +0800
From: kernel test robot <lkp@intel.com>
To: Liu Yi L <yi.l.liu@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [luxis1999-iommufd:iommufd-v5.16-rc3 23/25]
 drivers/iommu/iommufd/io_pagetable.c:1535:6: warning: comparison of distinct
 pointer types ('typeof (iova) *' (aka 'unsigned long *') and 'typeof (length
 - 1) *' (aka 'unsigned int *'))
Message-ID: <202112170238.6pX2L0DT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/luxis1999/iommufd iommufd-v5.16-rc3
head:   21c1bb93447d6cced2f486cdb68b92d11f2e664d
commit: 4aa75d972a71aafba6e3b57ca91f6a04bdd37611 [23/25] vfio/pci: Add bind_iommufd() support
config: i386-randconfig-r013-20211216 (https://download.01.org/0day-ci/archive/20211217/202112170238.6pX2L0DT-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245bab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/luxis1999/iommufd/commit/4aa75d972a71aafba6e3b57ca91f6a04bdd37611
        git remote add luxis1999-iommufd https://github.com/luxis1999/iommufd
        git fetch --no-tags luxis1999-iommufd iommufd-v5.16-rc3
        git checkout 4aa75d972a71aafba6e3b57ca91f6a04bdd37611
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/iommu/iommufd/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/iommu/iommufd/io_pagetable.c:1535:6: warning: comparison of distinct pointer types ('typeof (iova) *' (aka 'unsigned long *') and 'typeof (length - 1) *' (aka 'unsigned int *')) [-Wcompare-distinct-pointer-types]
           if (check_add_overflow(iova, length - 1, &last_iova))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:66:15: note: expanded from macro 'check_add_overflow'
           (void) (&__a == &__b);                  \
                   ~~~~ ^  ~~~~
   drivers/iommu/iommufd/io_pagetable.c:1595:14: warning: comparison of distinct pointer types ('typeof (iova) *' (aka 'unsigned long *') and 'typeof (length - 1) *' (aka 'unsigned int *')) [-Wcompare-distinct-pointer-types]
               WARN_ON(check_add_overflow(iova, length - 1, &last_iova)))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:66:15: note: expanded from macro 'check_add_overflow'
           (void) (&__a == &__b);                  \
                   ~~~~ ^  ~~~~
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IOMMUFD
   Depends on IOMMU_SUPPORT
   Selected by
   - VFIO_PCI_CORE && VFIO && PCI && MMU


vim +1535 drivers/iommu/iommufd/io_pagetable.c

b1baa437fe5478 Jason Gunthorpe 2021-11-11  1509  
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1510  /**
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1511  * iopt_access_pages - Return a list of pages under the iova
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1512  *
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1513  * Reads @npages starting at iova and returns the struct page * pointers. These
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1514  * can be kmap'd by the caller for CPU access.
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1515  *
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1516  * The caller must perform iopt_unaccess_pages() when done to balance this.
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1517  *
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1518  * iova can be unaligned from PAGE_SIZE. The first returned byte starts at
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1519  * page_to_phys(out_pages[0]) + (iova % PAGE_SIZE). The caller promises not
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1520  * to touch memory outside the requested iova subslice.
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1521  *
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1522  * FIXME: callers that need a DMA mapping via a sgl should create another
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1523  * interface to build the SGL efficiently
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1524  */
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1525  int iopt_access_pages(struct io_pagetable *iopt, unsigned long iova,
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1526  		      size_t length, struct page **out_pages, bool write)
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1527  {
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1528  	unsigned long cur_iova = iova;
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1529  	unsigned long last_iova;
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1530  	struct iopt_area *area;
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1531  	int rc;
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1532  
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1533  	if (!length)
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1534  		return -EINVAL;
b1baa437fe5478 Jason Gunthorpe 2021-11-11 @1535  	if (check_add_overflow(iova, length - 1, &last_iova))
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1536  		return -EOVERFLOW;
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1537  
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1538  	down_read(&iopt->rwsem);
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1539  	for (area = iopt_area_iter_first(iopt, iova, last_iova); area;
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1540  	     area = iopt_area_iter_next(area, iova, last_iova)) {
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1541  		unsigned long last = min(last_iova, iopt_area_last_iova(area));
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1542  		unsigned long last_index;
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1543  		unsigned long index;
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1544  
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1545  		/* Need contiguous areas in the access */
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1546  		if (iopt_area_iova(area) < cur_iova) {
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1547  			rc = -EINVAL;
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1548  			goto out_remove;
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1549  		}
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1550  
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1551  		index = iopt_iova_to_index(area, cur_iova);
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1552  		last_index = iopt_iova_to_index(area, last);
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1553  		rc = iopt_pages_add_user(area->pages, index, last_index,
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1554  					 out_pages, write);
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1555  		if (rc)
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1556  			goto out_remove;
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1557  		if (last == last_iova)
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1558  			break;
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1559  		/*
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1560  		 * Can't cross areas that are not aligned to the system page
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1561  		 * size with this API.
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1562  		 */
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1563  		if (cur_iova % PAGE_SIZE) {
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1564  			rc = -EINVAL;
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1565  			goto out_remove;
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1566  		}
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1567  		cur_iova = last + 1;
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1568  		out_pages += last_index - index;
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1569  		atomic_inc(&area->num_users);
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1570  	}
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1571  
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1572  	up_read(&iopt->rwsem);
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1573  	return 0;
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1574  
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1575  out_remove:
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1576  	if (cur_iova != iova)
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1577  		iopt_unaccess_pages(iopt, iova, cur_iova - iova);
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1578  	return rc;
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1579  }
b1baa437fe5478 Jason Gunthorpe 2021-11-11  1580  

:::::: The code at line 1535 was first introduced by commit
:::::: b1baa437fe5478bf8f79e53f49409b2f413ea27e iommufd: Data structure to provide IOVA to PFN mapping

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
