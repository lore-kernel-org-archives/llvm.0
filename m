Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C647C218AD1;
	Thu,  5 Jun 2025 23:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749165882; cv=none; b=VeGZ5llBajT21ELtLrZb9IYhQOhAWY2CeCY7G+4muRHK4AIcBWD/3z1CNE4P3ZQMo+s05oCN4kJvuy2HJl67jNDwC5zytr+BtkN4jdRdZZjI+0/emgX0rgJ1WVeRJkBSbS+9fNjFIgTvn6KLv02BH2moHTfHzaNfbfnUcNs1KDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749165882; c=relaxed/simple;
	bh=0XRp09v0H3JYs138Hm4oCRVEFr5gTyjj0AgWJkl4Kjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bIBS9TchaH2V0g6L7pW/TTok1DiIeH/vLbAcaadj8ypy4ilJ8F0oZNkPkJUa5Aik7DAP7+GsjeTNEpxqrHtEJUvtlIq23WTtBt9cG8V87RIcbiHIyMPB8E/CNL2NRjgEKI+Is6odE7sii5z2JMIZLlx72ZyjiM8egPN5Q0NXC+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lTOF0Yj+; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lTOF0Yj+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749165881; x=1780701881;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0XRp09v0H3JYs138Hm4oCRVEFr5gTyjj0AgWJkl4Kjo=;
  b=lTOF0Yj+uJCdhw2tEjG3KP2Rp8p2+Ruk1PJULGEMXe/hK23ujlSs2YGR
   H2MWh29lUnZZpaRYcOpmsnpHZNKobHj74KNf/wmeVdDYM5TmcgTDFqLHm
   ybahj2nHLxqLSy5emF+5s8gnx97bTeRUi3g86+ZIimuUr8COzbIU5Nbob
   RKRkw9a1vrlwOXi/soWjVesUZtfHPrqPBIOJ2isIjILXG7RILINfDQW5s
   XXKe5YrByMP+9NCbrCsiMM1Sj9jotQSOsXOOjDcyZe91oZGq2YldujWeg
   tOeN01ib6xDD25AUeiVDnniPacjA2VWJDuiycMpuS8XqjqV2cJa5X1cEy
   Q==;
X-CSE-ConnectionGUID: uG0gLMb4TFGsqlQkCBdomg==
X-CSE-MsgGUID: jSbDn+aaRDiURbTECEIJJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="68744757"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; 
   d="scan'208";a="68744757"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 16:24:40 -0700
X-CSE-ConnectionGUID: 35bukaDuQBWuJ+E5WoTq5g==
X-CSE-MsgGUID: VU0jlhy4R2eeFsrIjARdyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; 
   d="scan'208";a="182839509"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Jun 2025 16:24:39 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNJwq-0004XZ-2i;
	Thu, 05 Jun 2025 23:24:36 +0000
Date: Fri, 6 Jun 2025 07:24:32 +0800
From: kernel test robot <lkp@intel.com>
To: lizhe.67@bytedance.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] vfio/type1: optimize vfio_unpin_pages_remote() for large
 folio
Message-ID: <202506060749.d93rQNLD-lkp@intel.com>
References: <20250605124923.21896-1-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605124923.21896-1-lizhe.67@bytedance.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on awilliam-vfio/next]
[also build test ERROR on awilliam-vfio/for-linus linus/master v6.15 next-20250605]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/lizhe-67-bytedance-com/vfio-type1-optimize-vfio_unpin_pages_remote-for-large-folio/20250605-205109
base:   https://github.com/awilliam/linux-vfio.git next
patch link:    https://lore.kernel.org/r/20250605124923.21896-1-lizhe.67%40bytedance.com
patch subject: [RFC] vfio/type1: optimize vfio_unpin_pages_remote() for large folio
config: s390-randconfig-002-20250606 (https://download.01.org/0day-ci/archive/20250606/202506060749.d93rQNLD-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506060749.d93rQNLD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506060749.d93rQNLD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/vfio/vfio_iommu_type1.c:778:14: error: call to undeclared function 'vpfn_pages'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     778 |                         locked += vpfn_pages(dma, iova, step);
         |                                   ^
   drivers/vfio/vfio_iommu_type1.c:778:14: note: did you mean 'vma_pages'?
   include/linux/mm.h:3590:29: note: 'vma_pages' declared here
    3590 | static inline unsigned long vma_pages(struct vm_area_struct *vma)
         |                             ^
   1 error generated.


vim +/vpfn_pages +778 drivers/vfio/vfio_iommu_type1.c

   761	
   762	static long vfio_unpin_pages_remote(struct vfio_dma *dma, dma_addr_t iova,
   763					    unsigned long pfn, unsigned long npage,
   764					    bool do_accounting)
   765	{
   766		long unlocked = 0, locked = 0;
   767	
   768		while (npage) {
   769			long step = get_step(pfn, npage);
   770	
   771			/*
   772			 * Although the third parameter of put_pfns() is of type int,
   773			 * the value of step here will not exceed the range that int
   774			 * can represent. Therefore, it is safe to pass step.
   775			 */
   776			if (put_pfns(pfn, dma->prot, step)) {
   777				unlocked += step;
 > 778				locked += vpfn_pages(dma, iova, step);
   779			}
   780			pfn += step;
   781			iova += PAGE_SIZE * step;
   782			npage -= step;
   783		}
   784	
   785		if (do_accounting)
   786			vfio_lock_acct(dma, locked - unlocked, true);
   787	
   788		return unlocked;
   789	}
   790	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
