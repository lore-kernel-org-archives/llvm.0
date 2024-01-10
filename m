Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D8538D;
	Wed, 10 Jan 2024 01:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cImeVMeD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704848422; x=1736384422;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tP43jgXPpYAfjo/Dl+pi0GmMd9QLP+51As3B/QrHoUQ=;
  b=cImeVMeDTlvFH0YeOyMgtLSMCgMJ9KcBLbN8qvdFr5/9/T2E0Vi0r6L4
   H4e2FxMe/fBJCbUEoEBxuMhh3+ChpJ3SoLf6uiyoQKqHfyM4Tif0CleXY
   ril5FA+8C9GqChR93hrwQdnPFS1HWHHWOKJUeiSFVPprq88I4awEw9kWa
   Ko2W60jM9u3ujvfS8jVE1c+dTEfJ/aNs9NM5lUJtpgOc+lIpIL+fE5J8s
   81a6L+iumOgeeJ5gX1ZpPd/uNjTGd4XN6i5A3fqjcpQsk9rpy1VyQYpD5
   /Oc9SoNVrLPBhaD52SVgN9AV4QSc5lDNM5g8wGmwE0hU7WKzfYp2WJZ4V
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="19868466"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="19868466"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 17:00:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="30388572"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 09 Jan 2024 17:00:19 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNMx7-0006Rq-1l;
	Wed, 10 Jan 2024 01:00:17 +0000
Date: Wed, 10 Jan 2024 09:00:07 +0800
From: kernel test robot <lkp@intel.com>
To: Tina Zhang <tina.zhang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tinazhangzw:per-iommu_IOTLB_invalidation-20240109 11/11]
 drivers/iommu/intel/svm.c:152:38: warning: variable 'dev_pasid' is
 uninitialized when used here
Message-ID: <202401100826.evbTGKns-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/TinaZhangZW/linux.git per-iommu_IOTLB_invalidation-20240109
head:   74540430ca110f26be1eab1c6f36e915e3d94d66
commit: 74540430ca110f26be1eab1c6f36e915e3d94d66 [11/11] iommu/vt-d: Remove superfluous IOMMU IOTLB invalidations
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240110/202401100826.evbTGKns-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240110/202401100826.evbTGKns-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401100826.evbTGKns-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/intel/svm.c:152:38: warning: variable 'dev_pasid' is uninitialized when used here [-Wuninitialized]
     152 |                 qi_flush_piotlb(iommu_info->iommu, dev_pasid->did,
         |                                                    ^~~~~~~~~
   drivers/iommu/intel/svm.c:144:34: note: initialize the variable 'dev_pasid' to silence this warning
     144 |         struct dev_pasid_info *dev_pasid;
         |                                         ^
         |                                          = NULL
   1 warning generated.


vim +/dev_pasid +152 drivers/iommu/intel/svm.c

   136	
   137	static void __flush_svm_range(struct iommu_domain *domain,
   138					  unsigned long address,
   139					  unsigned long pages, int ih)
   140	{
   141		u32 pasid = mm_get_enqcmd_pasid(domain->mm);
   142		struct device_domain_info *dev_info;
   143		struct iommu_domain_info *iommu_info;
   144		struct dev_pasid_info *dev_pasid;
   145		unsigned long idx;
   146	
   147		if (WARN_ON(!pages))
   148			return;
   149	
   150		rcu_read_lock();
   151		xa_for_each(&to_dmar_domain(domain)->iommu_array, idx, iommu_info)
 > 152			qi_flush_piotlb(iommu_info->iommu, dev_pasid->did,
   153					pasid, address, pages, ih);
   154	
   155		list_for_each_entry_rcu(dev_pasid, &to_dmar_domain(domain)->dev_pasids, link_domain) {
   156			dev_info = dev_iommu_priv_get(dev_pasid->dev);
   157			if (dev_info->ats_enabled) {
   158				qi_flush_dev_iotlb_pasid(dev_info->iommu, dev_pasid->sid, dev_info->pfsid,
   159							 pasid, dev_pasid->qdep, address,
   160							 order_base_2(pages));
   161				quirk_extra_dev_tlb_flush(dev_info, address, order_base_2(pages),
   162							  pasid, dev_pasid->qdep);
   163			}
   164		}
   165		rcu_read_unlock();
   166	}
   167	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
