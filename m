Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02ED82BEFF3;
	Tue, 17 Jun 2025 10:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750155760; cv=none; b=IFfM7pMBQ1CRBFzDhOjBPxbhEELaaY1b6ednvRADIkTsbsaUbsblQVa7Qr58Z7j3+HDnchE/5p2xFWTMrwWQiE8YxBZir8uzDKk6Xjbo+rErPcuw/bTRSZ4pN/6GEGC7ZQ+JRCUgXRnaE7TgiNvuZqfjvA6a35XTohMV71IPUUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750155760; c=relaxed/simple;
	bh=TPwC6j7kXRScA8KX1U6o2/cOIJTxixhqfAh8uxtLiCg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ktp8kY7brvmAZ3oMWfk4RUYtlYBuSXp09ZoKRAwMtiSQ0TeP1Sgv6GjvsFZ2Scvt6ETejnOaPYB4XiqJOa2QSbx1y/RZDzs4sW3yYINgKGcW/GNZVtpEEZvQaKvUpqz1M/Jv4coBA0YwD51DMVwkig2u4j+X4c6nEqXwRUmAnSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HVtdgqzd; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HVtdgqzd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750155758; x=1781691758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TPwC6j7kXRScA8KX1U6o2/cOIJTxixhqfAh8uxtLiCg=;
  b=HVtdgqzd1aDFHw7/1J/04K6VGnTF9Qe+pv3DsG71yMJcZV+vZGFWx7tU
   gIYsoAgxU+BdRYHhDbOf+aL4SorVrQ6PiQSSfrBWPePffNZ11q+kUlyQ2
   CK2zoaLWcLL/+mgO05G9sKvswTYxdcABDS7F3VvxiTYDW2se6832Fk4TZ
   bCOSPJFFiAT/lThKVJM06yL3Gy5oDa2CNfFj7Z7znqGrB4o9xI11QIja5
   FAtZWUN8P0kGoHvqfb4at7sVOTq2oQux7YSrvV3NtvPpkUAlIg5IQQoQY
   9hyrmpxZgHLOXx/CLGLsTVBjqRcg1uH9lta29kW2aty/8OjX8W9XtgVzP
   g==;
X-CSE-ConnectionGUID: j5YdiQbgShmktodDRsRXbA==
X-CSE-MsgGUID: 6rag67TsQ2KdY0R7F3/DqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63680286"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="63680286"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 03:22:16 -0700
X-CSE-ConnectionGUID: bjcKqiLQQo2kucbItShnBA==
X-CSE-MsgGUID: vni4Gef/QtqqSsjXcsA2uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="153701551"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Jun 2025 03:22:16 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRTSG-000Fs8-2E;
	Tue, 17 Jun 2025 10:22:12 +0000
Date: Tue, 17 Jun 2025 18:22:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt_all 48/62]
 drivers/iommu/generic_pt/fmt/../iommu_pt.h:1407:15: warning: result of
 comparison of constant 18446744073709551615 with expression of type
 'pt_vaddr_t' (aka 'unsigned int') is always false
Message-ID: <202506171801.prNmVQ9a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt_all
head:   95229c50e3ce2b6ecb8126b5f765996c1b73f4c1
commit: b5ab032ccb1dde4c53ef839f2260e48a1b701ec8 [48/62] iommupt: Add the 32 bit ARMv7s page table format
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250617/202506171801.prNmVQ9a-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506171801.prNmVQ9a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506171801.prNmVQ9a-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/generic_pt/fmt/iommu_armv7s.c:11:
   In file included from drivers/iommu/generic_pt/fmt/iommu_template.h:40:
>> drivers/iommu/generic_pt/fmt/../iommu_pt.h:1407:15: warning: result of comparison of constant 18446744073709551615 with expression of type 'pt_vaddr_t' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
    1407 |             range.va > ULONG_MAX)
         |             ~~~~~~~~ ^ ~~~~~~~~~
   1 warning generated.


vim +1407 drivers/iommu/generic_pt/fmt/../iommu_pt.h

c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1383  
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1384  static int pt_iommu_init_domain(struct pt_iommu *iommu_table,
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1385  				struct iommu_domain *domain)
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1386  {
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1387  	struct pt_common *common = common_from_iommu(iommu_table);
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1388  	struct pt_iommu_info info;
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1389  	struct pt_range range;
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1390  
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1391  	NS(get_info)(iommu_table, &info);
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1392  
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1393  	domain->type = __IOMMU_DOMAIN_PAGING;
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1394  	domain->pgsize_bitmap = info.pgsize_bitmap;
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1395  
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1396  	if (pt_feature(common, PT_FEAT_DYNAMIC_TOP))
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1397  		range = _pt_top_range(common,
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1398  				      _pt_top_set(NULL, PT_MAX_TOP_LEVEL));
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1399  	else
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1400  		range = pt_top_range(common);
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1401  
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1402  	/*
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1403  	 * A 64 bit high address space table on a 32 bit system cannot work.
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1404  	 */
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1405  	domain->geometry.aperture_start = (unsigned long)range.va;
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1406  	if ((pt_vaddr_t)domain->geometry.aperture_start != range.va ||
c4cba9b274fd58 Jason Gunthorpe 2025-02-04 @1407  	    range.va > ULONG_MAX)
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1408  		return -EOVERFLOW;
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1409  
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1410  	/*
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1411  	 * The aperture is limited to what the API can do after considering all
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1412  	 * the different types dma_addr_t/unsigned long/pt_vaddr_t that are used
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1413  	 * to store a VA. Set the aperture to something that is valid for all
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1414  	 * cases. Saturate instead of truncate the end if the types are smaller
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1415  	 * than the top range. aperture_end is a last.
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1416  	 */
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1417  	domain->geometry.aperture_end = (unsigned long)range.last_va;
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1418  	if ((pt_vaddr_t)domain->geometry.aperture_end != range.last_va) {
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1419  		domain->geometry.aperture_end = ULONG_MAX;
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1420  		domain->pgsize_bitmap &= ULONG_MAX;
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1421  	}
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1422  	domain->geometry.force_aperture = true;
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1423  
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1424  	return 0;
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1425  }
c4cba9b274fd58 Jason Gunthorpe 2025-02-04  1426  

:::::: The code at line 1407 was first introduced by commit
:::::: c4cba9b274fd586da4c847940a5498bd78d10443 iommupt: Add the basic structure of the iommu implementation

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
