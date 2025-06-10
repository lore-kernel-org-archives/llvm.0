Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F30194080;
	Tue, 10 Jun 2025 06:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749537101; cv=none; b=loHPPaD8XydiXDtu8eAA2ionSBsC3dnYv6IyPvs5Sqw9sahbiVJRLSmK1MewY8AcggCw2nhB4jOmsElV2Y72eg1tBgfxL0eQi/CApAydSgR2cMI21WPZphmvB7Tr4pViA0jLU/59B9lU1vMsKbAChYevFnF9f70+8qwq/K5I69A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749537101; c=relaxed/simple;
	bh=u+lXOC4z3TPeQ1aU2Py9PX3L7O16f89fVuC1nGPhaUM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZulJTsaJxnKlSf9ST56NTheG6sQRNbKwtejMKagKNca8bKScOx/bH7gnV4nwK4HaNzTypJZoJnbw/wrKf2pBrr0NdfSs8F+/EnjrM/g+5J7BOiRGwObYEtdKbOIJDr2/Iat3Cf5bxKcIKt71D53btqzuXUMuVRY4+qe4jkcOk7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vb1mULUz; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vb1mULUz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749537099; x=1781073099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u+lXOC4z3TPeQ1aU2Py9PX3L7O16f89fVuC1nGPhaUM=;
  b=Vb1mULUzOYjZHjMR5dFCOm0h9MToyV/0ygeuKS1p35yuvMvGhG/4xdGY
   nqLmyX50xcKmiefVujuSKLHB9PYGmNOMigRdlRMFenTs7JzizU5ggmDwr
   aM8z846Kk1ECewzAiYKkR0pSShJhofNw6UgOaAjSrzNHUymsdLQHtdLFp
   mBri35iWoHwyIt4uleU74VnWUMG4ti6PDdC8vaHZeKarpaaT7giumwnwP
   H3hiullgol2GcI4BZbPxWMMUIMBcyEcCmIqOafnFO2oqZUF+p3B04RpCB
   cXjCynwrFJFFlypvQZQSdU/9W1FqNFBJvpM12wkrH5cPZHjli1I0AlHkh
   g==;
X-CSE-ConnectionGUID: fBHbOpC3QlK4r0KrOoHvgQ==
X-CSE-MsgGUID: wh9v3sXzS8mNY0dGYpjYdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="55423722"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="55423722"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 23:31:36 -0700
X-CSE-ConnectionGUID: O7wFsnSTQp+79qgOJ8KNcg==
X-CSE-MsgGUID: zOg7wEHBTOenMKSZwUp1UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="151545884"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Jun 2025 23:31:35 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOsWC-0007sv-0v;
	Tue, 10 Jun 2025 06:31:32 +0000
Date: Tue, 10 Jun 2025 14:30:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt_vtd 1/40] drivers/iommu/intel/pasid.c:415:5:
 error: conflicting types for 'intel_pasid_replace_first_level'
Message-ID: <202506101446.9WrayqVm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt_vtd
head:   282698ed3a69e2f70fd682b369cf39c972c0bb2b
commit: 15e2836383d140dd2d0f316de73239d1c7cffadb [1/40] iommu/vtd: Lift the __pa to domain_setup_first_level/intel_svm_set_dev_pasid()
config: i386-buildonly-randconfig-003-20250610 (https://download.01.org/0day-ci/archive/20250610/202506101446.9WrayqVm-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506101446.9WrayqVm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506101446.9WrayqVm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/intel/pasid.c:415:5: error: conflicting types for 'intel_pasid_replace_first_level'
     415 | int intel_pasid_replace_first_level(struct intel_iommu *iommu,
         |     ^
   drivers/iommu/intel/pasid.h:304:5: note: previous declaration is here
     304 | int intel_pasid_replace_first_level(struct intel_iommu *iommu,
         |     ^
   1 error generated.


vim +/intel_pasid_replace_first_level +415 drivers/iommu/intel/pasid.c

437f35e1cd4c8d0 drivers/iommu/intel-pasid.c Lu Baolu        2018-12-10  414  
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08 @415  int intel_pasid_replace_first_level(struct intel_iommu *iommu,
15e2836383d140d drivers/iommu/intel/pasid.c Jason Gunthorpe 2025-05-12  416  				    struct device *dev, u64 fsptptr,
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  417  				    u32 pasid, u16 did, u16 old_did,
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  418  				    int flags)
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  419  {
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  420  	struct pasid_entry *pte, new_pte;
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  421  
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  422  	if (!ecap_flts(iommu->ecap)) {
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  423  		pr_err("No first level translation support on %s\n",
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  424  		       iommu->name);
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  425  		return -EINVAL;
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  426  	}
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  427  
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  428  	if ((flags & PASID_FLAG_FL5LP) && !cap_fl5lp_support(iommu->cap)) {
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  429  		pr_err("No 5-level paging support for first-level on %s\n",
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  430  		       iommu->name);
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  431  		return -EINVAL;
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  432  	}
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  433  
15e2836383d140d drivers/iommu/intel/pasid.c Jason Gunthorpe 2025-05-12  434  	pasid_pte_config_first_level(iommu, &new_pte, fsptptr, did, flags);
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  435  
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  436  	spin_lock(&iommu->lock);
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  437  	pte = intel_pasid_get_entry(dev, pasid);
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  438  	if (!pte) {
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  439  		spin_unlock(&iommu->lock);
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  440  		return -ENODEV;
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  441  	}
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  442  
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  443  	if (!pasid_pte_is_present(pte)) {
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  444  		spin_unlock(&iommu->lock);
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  445  		return -EINVAL;
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  446  	}
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  447  
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  448  	WARN_ON(old_did != pasid_get_domain_id(pte));
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  449  
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  450  	*pte = new_pte;
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  451  	spin_unlock(&iommu->lock);
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  452  
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  453  	intel_pasid_flush_present(iommu, dev, pasid, old_did, pte);
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  454  	intel_iommu_drain_pasid_prq(dev, pasid);
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  455  
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  456  	return 0;
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  457  }
7543ee63e8113aa drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  458  

:::::: The code at line 415 was first introduced by commit
:::::: 7543ee63e8113aa34b07df3b16b3b9d2c5f73939 iommu/vt-d: Add pasid replace helpers

:::::: TO: Yi Liu <yi.l.liu@intel.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
