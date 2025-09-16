Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B47C31BCB7;
	Tue, 16 Sep 2025 20:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758055255; cv=none; b=PbuHgn6y27JPjXIkrnfaIlgHLYLeZM61sYnkb9UVlYi2I9kSZX4TYmcML5EkdmWorOrjOHvu1nYCoGSevNVlgsr7J4GxlJPBcCswy0UO7xSUA+/xNcNOqLZTiHzjSYVE3ulTk9T4uxqkwNkcAgkSivxFA1ZfQ+EGITeVLfS3ZqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758055255; c=relaxed/simple;
	bh=0EdQpIgD201QKXjXLh+kBU03jgCePaGoUC70p3TLIuE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TFfAhHcqWovAxjwXqjRTOxfwurLM44ahVti1n0oDw7n7z9g5DeGNuTOLRmDF/pWgdWKMzPYAHcYQtytBjcP+83z9p6kOAfU/oMKK3C6fYc38gIuB9OdlsyiBkyBxJQDTZl964vPX9TRIxQ+1m6XpzQqa0h3i5jpXlwXDLxQjmFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=He3JJ1k2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="He3JJ1k2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758055254; x=1789591254;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0EdQpIgD201QKXjXLh+kBU03jgCePaGoUC70p3TLIuE=;
  b=He3JJ1k2WfJSjnjwKEFKSCWASaGiSo6DcI8vYJFtkAzkboFe2tlKt2ca
   DawEPl2bd21KWgXULV+DUdzeHnX7EP5NTAVU230xBzz3upirQ8PKm/4Y9
   RrvkoPw0M/bgshMy8CR5y2I4u9I5oK1NSWei4t3bssfiHkBldI25Ive28
   D8+pKFSB+HBIvn1orGyW7YaKoETrsl4f0qHUIfJpxjETGFTSCxsVgRKKG
   ouNDlpfPhIUvmIdWpiWZ4HRhPHmQLPhwkkPuzjnuNbL1njZ7C/evefqPU
   Nmq5FZByZX+tiuSPptxbg9hYyHnuMuCzBTha0awWHUVDn5yQo023eo+cZ
   w==;
X-CSE-ConnectionGUID: bc/coQtoRz657iavSihfJg==
X-CSE-MsgGUID: 7LDrxj6nS+6uEJSKXMCNMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="60418495"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; 
   d="scan'208";a="60418495"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 13:40:53 -0700
X-CSE-ConnectionGUID: GRao4B8/RTykVpTgkwxJpg==
X-CSE-MsgGUID: /jTQgUmXQ7a9WrrpZye7nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; 
   d="scan'208";a="205828694"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Sep 2025 13:40:52 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uycTp-0000it-34;
	Tue, 16 Sep 2025 20:40:49 +0000
Date: Wed, 17 Sep 2025 04:40:01 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dmabuf-vfio 38/42] arch/sparc/kernel/iommu.c:275:6:
 warning: variable 'iommu' is used uninitialized whenever 'if' condition is
 true
Message-ID: <202509170425.PYGuKwZR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dmabuf-vfio
head:   887b59804850b679831fda6eba707cc1b1b077e0
commit: ea58d5c1de6355a98e58cad814b5f77271e9032e [38/42] sparc64: Use physical address DMA mapping
config: sparc64-randconfig-002-20250916 (https://download.01.org/0day-ci/archive/20250917/202509170425.PYGuKwZR-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 65ad21d730d25789454d18e811f8ff5db79cb5d4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509170425.PYGuKwZR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509170425.PYGuKwZR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/sparc/kernel/iommu.c:275:6: warning: variable 'iommu' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     275 |         if (attrs & DMA_ATTR_MMIO)
         |             ^~~~~~~~~~~~~~~~~~~~~
   arch/sparc/kernel/iommu.c:315:17: note: uninitialized use occurs here
     315 |         iommu_free_ctx(iommu, ctx);
         |                        ^~~~~
   arch/sparc/kernel/iommu.c:275:2: note: remove the 'if' if its condition is always false
     275 |         if (attrs & DMA_ATTR_MMIO)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
     276 |                 goto bad;
         |                 ~~~~~~~~
   arch/sparc/kernel/iommu.c:267:21: note: initialize the variable 'iommu' to silence this warning
     267 |         struct iommu *iommu;
         |                            ^
         |                             = NULL
>> arch/sparc/kernel/iommu.c:275:6: warning: variable 'ctx' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     275 |         if (attrs & DMA_ATTR_MMIO)
         |             ^~~~~~~~~~~~~~~~~~~~~
   arch/sparc/kernel/iommu.c:315:24: note: uninitialized use occurs here
     315 |         iommu_free_ctx(iommu, ctx);
         |                               ^~~
   arch/sparc/kernel/iommu.c:275:2: note: remove the 'if' if its condition is always false
     275 |         if (attrs & DMA_ATTR_MMIO)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
     276 |                 goto bad;
         |                 ~~~~~~~~
   arch/sparc/kernel/iommu.c:271:34: note: initialize the variable 'ctx' to silence this warning
     271 |         unsigned long i, base_paddr, ctx;
         |                                         ^
         |                                          = 0
   2 warnings generated.


vim +275 arch/sparc/kernel/iommu.c

   262	
   263	static dma_addr_t dma_4u_map_phys(struct device *dev, phys_addr_t phys,
   264					  size_t sz, enum dma_data_direction direction,
   265					  unsigned long attrs)
   266	{
   267		struct iommu *iommu;
   268		struct strbuf *strbuf;
   269		iopte_t *base;
   270		unsigned long flags, npages, oaddr;
   271		unsigned long i, base_paddr, ctx;
   272		u32 bus_addr, ret;
   273		unsigned long iopte_protection;
   274	
 > 275		if (attrs & DMA_ATTR_MMIO)
   276			goto bad;
   277	
   278		iommu = dev->archdata.iommu;
   279		strbuf = dev->archdata.stc;
   280	
   281		if (unlikely(direction == DMA_NONE))
   282			goto bad_no_ctx;
   283	
   284		oaddr = (unsigned long)(phys_to_virt(phys));
   285		npages = IO_PAGE_ALIGN(oaddr + sz) - (oaddr & IO_PAGE_MASK);
   286		npages >>= IO_PAGE_SHIFT;
   287	
   288		base = alloc_npages(dev, iommu, npages);
   289		spin_lock_irqsave(&iommu->lock, flags);
   290		ctx = 0;
   291		if (iommu->iommu_ctxflush)
   292			ctx = iommu_alloc_ctx(iommu);
   293		spin_unlock_irqrestore(&iommu->lock, flags);
   294	
   295		if (unlikely(!base))
   296			goto bad;
   297	
   298		bus_addr = (iommu->tbl.table_map_base +
   299			    ((base - iommu->page_table) << IO_PAGE_SHIFT));
   300		ret = bus_addr | (oaddr & ~IO_PAGE_MASK);
   301		base_paddr = __pa(oaddr & IO_PAGE_MASK);
   302		if (strbuf->strbuf_enabled)
   303			iopte_protection = IOPTE_STREAMING(ctx);
   304		else
   305			iopte_protection = IOPTE_CONSISTENT(ctx);
   306		if (direction != DMA_TO_DEVICE)
   307			iopte_protection |= IOPTE_WRITE;
   308	
   309		for (i = 0; i < npages; i++, base++, base_paddr += IO_PAGE_SIZE)
   310			iopte_val(*base) = iopte_protection | base_paddr;
   311	
   312		return ret;
   313	
   314	bad:
   315		iommu_free_ctx(iommu, ctx);
   316	bad_no_ctx:
   317		if (printk_ratelimit())
   318			WARN_ON(1);
   319		return DMA_MAPPING_ERROR;
   320	}
   321	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
