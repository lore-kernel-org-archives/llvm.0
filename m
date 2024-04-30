Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2BD38C;
	Tue, 30 Apr 2024 00:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714436024; cv=none; b=YwzkzHw9Yl31ekY0vTqFrOD8Z6+cqEk8AcKXzjauRHwLe7YQsvXSq7e26ciAbRGhEuHal/XPLaxMFtTtCdhQ/eEXli2Kwq6zddy3w4REVQ3/4dJbtJMY98N09zsNwM+mi5tlW4MeO2W3U6t74JPVvsePNFV8ny2laSxjr9nZKos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714436024; c=relaxed/simple;
	bh=CAuthUYbFaEBvRfqH4sAFKVD5BWpl1RL0gkZT5B0vWA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iZL3+gj2MvqbqhiS4Mo/8NRNTs5AYp6cLlwMn3ih9R+xAaJduCnrSmMv0H0Mp44VwU6JMYPhtcelyA5irzzbVdKk0YgD7JvaT3l6VI+bBNBY1dCaPN4IdkO4w3KnRfIm7AClpPMTJV1T1I0J2BNok/6x7WUyIOGAXM02W9NJh0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SWbkrj+3; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SWbkrj+3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714436024; x=1745972024;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CAuthUYbFaEBvRfqH4sAFKVD5BWpl1RL0gkZT5B0vWA=;
  b=SWbkrj+3XiYHCswgHEeErROiVnqmdaWQ8br08vENHh4anAsC0ZQWlNBb
   inDZmDN12vRY2czN1c5rxvQfpyM9evxfkpo3bM7x+1qYDdlUlgYXEDxgS
   C89vpYIKMs8O2Zc35W+TXTFU7MANQBsuNw07paIWrcIBYPzql+ynER5AW
   FoTTkWn37gRLYRiaTbEXbNLZZG77cNTWsftnEsO5Fkaoi8uXUx0Kg7235
   jid4b3YqQrf13xm1h1p4YN0L0xGQDcsswxnCydx6abJUC7i+YVeyKu12V
   XYv2TJj+5GpBv8j7DJCtSXt00+AZKZstHrDSZXGgJurkWjeqRKcmrHf1L
   Q==;
X-CSE-ConnectionGUID: jNuMI0yyRE+wPYUNRANmOQ==
X-CSE-MsgGUID: 3wg5jiQDQfipCdU9kCTecQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10043629"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="10043629"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 17:13:43 -0700
X-CSE-ConnectionGUID: d3RxB0TcShme3fx1ZNph1w==
X-CSE-MsgGUID: H9PkcojbQnOzQL2pHbAIRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="57473209"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Apr 2024 17:13:41 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1b7q-0007Xk-2Q;
	Tue, 30 Apr 2024 00:13:38 +0000
Date: Tue, 30 Apr 2024 08:13:15 +0800
From: kernel test robot <lkp@intel.com>
To: Vasant Hegde <vasant.hegde@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Joerg Roedel <jroedel@suse.de>, Jason Gunthorpe <jgg@nvidia.com>
Subject: [linux-next:master 8395/9390] drivers/iommu/amd/pasid.c:172:3:
 error: call to undeclared function 'mmu_notifier_unregister'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202404300810.iTQNKCkI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b0a2c79c6f3590b74742cbbc76687014d47972d8
commit: a5a91e54846d35c234939fb9170e035805353049 [8395/9390] iommu/amd: Add SVA domain support
config: x86_64-buildonly-randconfig-006-20240430 (https://download.01.org/0day-ci/archive/20240430/202404300810.iTQNKCkI-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404300810.iTQNKCkI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404300810.iTQNKCkI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/amd/pasid.c:172:3: error: call to undeclared function 'mmu_notifier_unregister'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     172 |                 mmu_notifier_unregister(&sva_pdom->mn, domain->mm);
         |                 ^
   drivers/iommu/amd/pasid.c:172:3: note: did you mean 'mmu_notifier_release'?
   include/linux/mmu_notifier.h:636:20: note: 'mmu_notifier_release' declared here
     636 | static inline void mmu_notifier_release(struct mm_struct *mm)
         |                    ^
>> drivers/iommu/amd/pasid.c:195:8: error: call to undeclared function 'mmu_notifier_register'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     195 |         ret = mmu_notifier_register(&pdom->mn, mm);
         |               ^
   drivers/iommu/amd/pasid.c:195:8: note: did you mean 'mmu_notifier_release'?
   include/linux/mmu_notifier.h:636:20: note: 'mmu_notifier_release' declared here
     636 | static inline void mmu_notifier_release(struct mm_struct *mm)
         |                    ^
   2 errors generated.


vim +/mmu_notifier_unregister +172 drivers/iommu/amd/pasid.c

   166	
   167	static void iommu_sva_domain_free(struct iommu_domain *domain)
   168	{
   169		struct protection_domain *sva_pdom = to_pdomain(domain);
   170	
   171		if (sva_pdom->mn.ops)
 > 172			mmu_notifier_unregister(&sva_pdom->mn, domain->mm);
   173	
   174		amd_iommu_domain_free(domain);
   175	}
   176	
   177	static const struct iommu_domain_ops amd_sva_domain_ops = {
   178		.set_dev_pasid = iommu_sva_set_dev_pasid,
   179		.free	       = iommu_sva_domain_free
   180	};
   181	
   182	struct iommu_domain *amd_iommu_domain_alloc_sva(struct device *dev,
   183							struct mm_struct *mm)
   184	{
   185		struct protection_domain *pdom;
   186		int ret;
   187	
   188		pdom = protection_domain_alloc(IOMMU_DOMAIN_SVA);
   189		if (!pdom)
   190			return ERR_PTR(-ENOMEM);
   191	
   192		pdom->domain.ops = &amd_sva_domain_ops;
   193		pdom->mn.ops = &sva_mn;
   194	
 > 195		ret = mmu_notifier_register(&pdom->mn, mm);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
