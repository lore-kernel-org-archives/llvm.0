Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB93838C;
	Thu,  5 Dec 2024 03:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733368926; cv=none; b=i6abTQcbnGJRiGp2awMCbS/j6vom+Ks8hXM4tKId1rODdLUgDNRMJOarr47kzaYoxnkMvySc20JIUiA0MmUecV4fbWZhcMWdoW6d6lvESVKXG7ZpfEfCsx0oPYKqzbarEvZwngV7ZLG4NtFfZ6ECYT/XP074x0insrv36/xwzHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733368926; c=relaxed/simple;
	bh=LW97UTbUEzETtIv8YKM1GDFiyphI7gKF3SRR1b3SAgM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Et3r9xfs4D3fQlM364yRVZbtGdNQqfODUm7IIzEZ1TGrqLl37cvTJ9VCxVyJOxjFha5Q6+6wgybDek+l0TJPQRSnHEIsG1DDr/2R1NT1K71xO37XnmYpCq5EwhCPTf53A2+W4ywdEjuJlZnd72HddnqrJm6Otzrj0amVoWpLqa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8AjjGBL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8AjjGBL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733368924; x=1764904924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LW97UTbUEzETtIv8YKM1GDFiyphI7gKF3SRR1b3SAgM=;
  b=X8AjjGBLZP1lCmxHj1gDATahZkOZYZL1k1yBsBN8Gtx0XXv6mVzdCrr2
   uGgewZ2BI4ZOHEPaAHeubKHF3nCnGQn1IP54I86S5l1Oy8JpNtwZvRjA6
   5cMVWpcOHpKLEqxiwyI1ZOoes04bbAPJehfH4arBDGFTPWz9WZ6o2AouK
   zohx5ABFfWTP+l7ooOctqGJF60fKShlTIA7IBsispRAJn8Pwd12wvGu5m
   083R9z+LJe6KxlHHzA/Ndl8FTHvzkx4V5sd1LLQWmqjrNLAzTySIOb8TN
   PYNecnkNio+xHD0DA5vsvn7EhdjnKBrAWL66TYRijpnj6/pVjDucewZSo
   g==;
X-CSE-ConnectionGUID: vCw8gx25RPiQZvF5B9d9Uw==
X-CSE-MsgGUID: 00hhNWPHRt2IImeMfNinwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="37600510"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="37600510"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 19:22:01 -0800
X-CSE-ConnectionGUID: 0CmyDsdjS1imlORgG3mfJQ==
X-CSE-MsgGUID: KvOKe41IQCiilsdHWBC/Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="94396092"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 04 Dec 2024 19:22:00 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ2RB-0003jc-2T;
	Thu, 05 Dec 2024 03:21:57 +0000
Date: Thu, 5 Dec 2024 11:21:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:for-nicolin 2/3] drivers/iommu/dma-iommu.c:1811:23:
 error: call to undeclared function 'msi_desc_to_dev'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202412051135.OFiFJMAy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux for-nicolin
head:   0e29e6b0fc354c5123d013751f75aedb565ffa86
commit: f4c17c72b6d21df5fa405ad0924fc298debd1b09 [2/3] iommu: Make iommu_dma_prepare/compose_msi() into a generic operation
config: i386-buildonly-randconfig-002 (https://download.01.org/0day-ci/archive/20241205/202412051135.OFiFJMAy-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412051135.OFiFJMAy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412051135.OFiFJMAy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/dma-iommu.c:13:
   In file included from include/linux/crash_dump.h:5:
   In file included from include/linux/kexec.h:18:
   In file included from include/linux/vmcore_info.h:6:
   In file included from include/linux/elfcore.h:11:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/iommu/dma-iommu.c:1811:23: error: call to undeclared function 'msi_desc_to_dev'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1811 |         struct device *dev = msi_desc_to_dev(desc);
         |                              ^
>> drivers/iommu/dma-iommu.c:1811:17: error: incompatible integer to pointer conversion initializing 'struct device *' with an expression of type 'int' [-Wint-conversion]
    1811 |         struct device *dev = msi_desc_to_dev(desc);
         |                        ^     ~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/dma-iommu.c:1815:7: error: incomplete definition of type 'struct msi_desc'
    1815 |                 desc->iommu_cookie = NULL;
         |                 ~~~~^
   include/linux/iommu.h:47:8: note: forward declaration of 'struct msi_desc'
      47 | struct msi_desc;
         |        ^
>> drivers/iommu/dma-iommu.c:1821:14: error: call to undeclared function 'msi_desc_get_iommu_cookie'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1821 |                 msi_page = msi_desc_get_iommu_cookie(desc);
         |                            ^
>> drivers/iommu/dma-iommu.c:1821:12: error: incompatible integer to pointer conversion assigning to 'const struct iommu_dma_msi_page *' from 'int' [-Wint-conversion]
    1821 |                 msi_page = msi_desc_get_iommu_cookie(desc);
         |                          ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/dma-iommu.c:1826:6: error: incomplete definition of type 'struct msi_msg'
    1826 |                 msg->address_hi = upper_32_bits(msi_page->iova);
         |                 ~~~^
   include/linux/iommu.h:48:8: note: forward declaration of 'struct msi_msg'
      48 | struct msi_msg;
         |        ^
   drivers/iommu/dma-iommu.c:1827:6: error: incomplete definition of type 'struct msi_msg'
    1827 |                 msg->address_lo &= cookie_msi_granule(domain->iova_cookie) - 1;
         |                 ~~~^
   include/linux/iommu.h:48:8: note: forward declaration of 'struct msi_msg'
      48 | struct msi_msg;
         |        ^
   drivers/iommu/dma-iommu.c:1828:6: error: incomplete definition of type 'struct msi_msg'
    1828 |                 msg->address_lo += lower_32_bits(msi_page->iova);
         |                 ~~~^
   include/linux/iommu.h:48:8: note: forward declaration of 'struct msi_msg'
      48 | struct msi_msg;
         |        ^
>> drivers/iommu/dma-iommu.c:1835:2: error: call to undeclared function 'msi_desc_set_iommu_cookie'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1835 |         msi_desc_set_iommu_cookie(desc, msi_page);
         |         ^
   1 warning and 9 errors generated.


vim +/msi_desc_to_dev +1811 drivers/iommu/dma-iommu.c

44bb7e243bd4b4 Robin Murphy      2016-09-12  1807  
f4c17c72b6d21d Jason Gunthorpe   2024-12-03  1808  static int iommu_dma_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
f4c17c72b6d21d Jason Gunthorpe   2024-12-03  1809  			    phys_addr_t msi_addr, struct msi_msg *msg)
44bb7e243bd4b4 Robin Murphy      2016-09-12  1810  {
ece6e6f0218b77 Julien Grall      2019-05-01 @1811  	struct device *dev = msi_desc_to_dev(desc);
f4c17c72b6d21d Jason Gunthorpe   2024-12-03  1812  	const struct iommu_dma_msi_page *msi_page;
44bb7e243bd4b4 Robin Murphy      2016-09-12  1813  
f4c17c72b6d21d Jason Gunthorpe   2024-12-03  1814  	if (!domain->iova_cookie) {
ece6e6f0218b77 Julien Grall      2019-05-01 @1815  		desc->iommu_cookie = NULL;
ece6e6f0218b77 Julien Grall      2019-05-01  1816  		return 0;
ece6e6f0218b77 Julien Grall      2019-05-01  1817  	}
44bb7e243bd4b4 Robin Murphy      2016-09-12  1818  
f4c17c72b6d21d Jason Gunthorpe   2024-12-03  1819  	/* Compose an already prepared mapping */
f4c17c72b6d21d Jason Gunthorpe   2024-12-03  1820  	if (msg) {
f4c17c72b6d21d Jason Gunthorpe   2024-12-03 @1821  		msi_page = msi_desc_get_iommu_cookie(desc);
44bb7e243bd4b4 Robin Murphy      2016-09-12  1822  
f4c17c72b6d21d Jason Gunthorpe   2024-12-03  1823  		if (!domain->iova_cookie || WARN_ON(!msi_page))
f4c17c72b6d21d Jason Gunthorpe   2024-12-03  1824  			return 0;
ece6e6f0218b77 Julien Grall      2019-05-01  1825  
f4c17c72b6d21d Jason Gunthorpe   2024-12-03 @1826  		msg->address_hi = upper_32_bits(msi_page->iova);
f4c17c72b6d21d Jason Gunthorpe   2024-12-03  1827  		msg->address_lo &= cookie_msi_granule(domain->iova_cookie) - 1;
f4c17c72b6d21d Jason Gunthorpe   2024-12-03 @1828  		msg->address_lo += lower_32_bits(msi_page->iova);
ece6e6f0218b77 Julien Grall      2019-05-01  1829  		return 0;
ece6e6f0218b77 Julien Grall      2019-05-01  1830  	}
ece6e6f0218b77 Julien Grall      2019-05-01  1831  
f4c17c72b6d21d Jason Gunthorpe   2024-12-03  1832  	iommu_group_mutex_assert(dev);
f4c17c72b6d21d Jason Gunthorpe   2024-12-03  1833  	msi_page = iommu_dma_get_msi_page(dev, msi_addr, domain);
ece6e6f0218b77 Julien Grall      2019-05-01  1834  
f4c17c72b6d21d Jason Gunthorpe   2024-12-03 @1835  	msi_desc_set_iommu_cookie(desc, msi_page);
ece6e6f0218b77 Julien Grall      2019-05-01  1836  
f4c17c72b6d21d Jason Gunthorpe   2024-12-03  1837  	if (!msi_page)
f4c17c72b6d21d Jason Gunthorpe   2024-12-03  1838  		return -ENOMEM;
f4c17c72b6d21d Jason Gunthorpe   2024-12-03  1839  	return 0;
44bb7e243bd4b4 Robin Murphy      2016-09-12  1840  }
06d60728ff5c01 Christoph Hellwig 2019-05-20  1841  

:::::: The code at line 1811 was first introduced by commit
:::::: ece6e6f0218b7777e650bf93728130ae6f4feb7d iommu/dma-iommu: Split iommu_dma_map_msi_msg() in two parts

:::::: TO: Julien Grall <julien.grall@arm.com>
:::::: CC: Marc Zyngier <marc.zyngier@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
