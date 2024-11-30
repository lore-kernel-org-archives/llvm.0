Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFE61C28E;
	Sat, 30 Nov 2024 00:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732925051; cv=none; b=IqtoPjnL0mQg8Lrkt7FFj49cFaRd9hdv0PaYf5lUTlUTMugLcsL47we61IaDFG040+dQCR4bwTTyXeAy2OQYKHNcmQW7NkruhqW+5MJCXUxzZTiu2LGvjboNUyYrSdw5ZYwOl2H26IEBDjIeHonI0ClGAwMwfMfF+MRogJQI+fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732925051; c=relaxed/simple;
	bh=V6cgUql3cA0jYWYIcc482aDGtn74gmVtWqOcGOtQfVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iyJQBQiMUOYieYJBA0s1thCejqLCUDRB0ht92p5fw1Lg7fDNpeUyuyr8NY5K7LQliKp4MEoS79hNotTLvxrz8FsOvBMrStnYPDrFMeu7nM+uATP61JsJH2/T31hLgAQWe7oJ1yt8gGLTZ3P7FkoklkrOcZAupHOaVndtl+ax4u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A9BknRpG; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A9BknRpG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732925049; x=1764461049;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V6cgUql3cA0jYWYIcc482aDGtn74gmVtWqOcGOtQfVU=;
  b=A9BknRpGjHfKuXdfABRfI0Pkq7elAHyMQxnybWfjwTq/vA3PgfJkgE12
   HyXB83Ho/UZq4I8olT3DfUvHK5KYn5/GdDynJVynzixEl7tMeITbJu7Rv
   qnzgXlr+cUZVGd53yOKqjaXsSnne/9vvcY1AVz1SbWYlOPbqlNRWvCPFY
   SnL3GSdLYDPP3ZC70/S84nteibY8Si6G+odY2bVhZsnjdebtYwbuOYIIo
   RxNswa662lWnV5AWWVqOvxsQLcflNGcmnYkOFXBt89RRfweQ2tcDZAz6n
   bIEoeaGpPNdadJs+QebLV6sf8loDv58kestLqUNyjzFA6KMcztuQ3MQlu
   g==;
X-CSE-ConnectionGUID: eiZwq2phTmWtwvLXpsS0Og==
X-CSE-MsgGUID: xUOzzw7nQ+mUtBD4BFdQ5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="44537616"
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="44537616"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 16:04:08 -0800
X-CSE-ConnectionGUID: TpUC+A3nTh2dm3YmnyAK9w==
X-CSE-MsgGUID: ihv+8QdzS7CrA/p4Ehe1ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="92762291"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Nov 2024 16:04:07 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHAxx-0000mR-0c;
	Sat, 30 Nov 2024 00:04:05 +0000
Date: Sat, 30 Nov 2024 08:03:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt 32/48] include/linux/iommu.h:938:19: error: no
 member named 'flush_iotlb_all' in 'struct iommu_domain_ops'
Message-ID: <202411300721.dR8xMAwk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt
head:   87e70b0c76695339b0163fde25b260773b0720c2
commit: 8e43ac717967eb0f573622be728fc994e3942095 [32/48] iommu: Bind the iommu page table operations to iommupt
config: i386-buildonly-randconfig-006-20241130 (https://download.01.org/0day-ci/archive/20241130/202411300721.dR8xMAwk-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411300721.dR8xMAwk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411300721.dR8xMAwk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/fork.c:35:
   In file included from include/linux/mempolicy.h:15:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from kernel/fork.c:47:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from kernel/fork.c:104:
>> include/linux/iommu.h:938:19: error: no member named 'flush_iotlb_all' in 'struct iommu_domain_ops'
     938 |         if (domain->ops->flush_iotlb_all)
         |             ~~~~~~~~~~~  ^
   include/linux/iommu.h:939:16: error: no member named 'flush_iotlb_all' in 'struct iommu_domain_ops'
     939 |                 domain->ops->flush_iotlb_all(domain);
         |                 ~~~~~~~~~~~  ^
   3 warnings and 2 errors generated.


vim +938 include/linux/iommu.h

4a77a6cf6d9bf9 Joerg Roedel 2008-11-26  932  
207c6e36f122eb Joerg Roedel 2017-04-26  933  extern int report_iommu_fault(struct iommu_domain *domain, struct device *dev,
207c6e36f122eb Joerg Roedel 2017-04-26  934  			      unsigned long iova, int flags);
4a77a6cf6d9bf9 Joerg Roedel 2008-11-26  935  
aae4c8e27bd756 Tom Murphy   2020-08-17  936  static inline void iommu_flush_iotlb_all(struct iommu_domain *domain)
add02cfdc9bc29 Joerg Roedel 2017-08-23  937  {
add02cfdc9bc29 Joerg Roedel 2017-08-23 @938  	if (domain->ops->flush_iotlb_all)
add02cfdc9bc29 Joerg Roedel 2017-08-23  939  		domain->ops->flush_iotlb_all(domain);
add02cfdc9bc29 Joerg Roedel 2017-08-23  940  }
add02cfdc9bc29 Joerg Roedel 2017-08-23  941  

:::::: The code at line 938 was first introduced by commit
:::::: add02cfdc9bc2987b0121861d5bb0c7392865be9 iommu: Introduce Interface for IOMMU TLB Flushing

:::::: TO: Joerg Roedel <jroedel@suse.de>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
