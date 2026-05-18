Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311EC405C33;
	Mon, 18 May 2026 20:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779135470; cv=none; b=dcS9ChWX0tJgJBx9qXyzJjgbwazeH+XaHsvPUqdKxp66SjQeQzrSeborNmohtDAwkcgvLr5ZRRUjTneJW3BiudkXidD79tIiNV+zQaL4aSiecW5rEfJvFEZpPsRPEhu7eY5ZHU5f1lawNtUhrBz5MkqS3GakzZlVN4OS5CkKHcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779135470; c=relaxed/simple;
	bh=8MiUc5vvN/0LaIUUT2YyeFvfEhbQo6fCtHVY69xx37c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kdpruqNYck5oN9EOiFHS422OSkeWEn233FOhOAWUTE9LGqxh4Vhwf+Wx5MS1KGp7ZrJPJF764LIoBokCmin+imdMmVWLlelKYIRC8VAVeostEw1qeFLxcaoO9F7KUuxWm0FwU1xKPn3Mn6sFQpWoeDFNeJKV4nNTbJQ09Ec0R4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IYpCYobJ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IYpCYobJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779135468; x=1810671468;
  h=date:from:to:cc:subject:message-id;
  bh=8MiUc5vvN/0LaIUUT2YyeFvfEhbQo6fCtHVY69xx37c=;
  b=IYpCYobJVa9JL761ysSbgM9d3pGCmyTXIBqfu3Qz/lnOlA/ao1iq7Guy
   VF4hi7GVMjX5FNPYFm3DXVPJ0VCi/FRfPXIOk+UYgNTObIVYccDe20qI2
   y0HwF2IkxFavRl2AFFvGToAWu6OjxgrhMFbpNy9Sgi/nxw7VgUFDtUXUT
   5YiGhmzaWcP1YFITXwPr4VwGLnUZdPzjRBvFkMZQmIyqtR5vqC/CfF+06
   X5V+NlTiIX42i5s5mxNBoKwUzQzKGO9ukEYXlCrMVBvGkL2NL//zpRz03
   iQeRaOLM4yaKs9nCoeVQCJ/p47up3IPuJjNc9VH+rx/LI1w0v3JOMwg6E
   w==;
X-CSE-ConnectionGUID: l02mDkunT96Q4sDQr4cJwQ==
X-CSE-MsgGUID: MKMJFBN6Ra2rff/THX72jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="91465627"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="91465627"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 13:17:47 -0700
X-CSE-ConnectionGUID: 7abdR9j6TW2pmuVn+zByjQ==
X-CSE-MsgGUID: A7C6sm+IR1mSt7NxFs80VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="244532855"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 May 2026 13:17:46 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP4PH-000000003MM-2vAt;
	Mon, 18 May 2026 20:17:43 +0000
Date: Tue, 19 May 2026 04:17:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/v0.1 110/238]
 drivers/pci/controller/pcie-rzg3s-host.c:766:13: error: incompatible pointer
 to integer conversion assigning to 'unsigned long' from 'typeof
 (kmalloc_noprof(((1UL) << 12), (((gfp_t)(((((1UL))) <<
 (___GFP_DIRECT_RECLAIM_BIT)) | ((((1UL))) << (___GFP_KSWAPD...
Message-ID: <202605190442.bLpRs2kP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/v0.1
head:   cf8f69ff9142effba4d8d9a70a1a4f275044376c
commit: 5e333910ab4a4568b501b9ebb83c53098a939f2f [110/238] PCI: rzg3s-host: replace __get_free_pages() with kmalloc()
config: arm-randconfig-001-20260519 (https://download.01.org/0day-ci/archive/20260519/202605190442.bLpRs2kP-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190442.bLpRs2kP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190442.bLpRs2kP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/controller/pcie-rzg3s-host.c:766:13: error: incompatible pointer to integer conversion assigning to 'unsigned long' from 'typeof (kmalloc_noprof(((1UL) << 12), (((gfp_t)(((((1UL))) << (___GFP_DIRECT_RECLAIM_BIT)) | ((((1UL))) << (___GFP_KSWAPD_RECLAIM_BIT)))) | ((gfp_t)((((1UL))) << (___GFP_IO_BIT))) | ((gfp_t)((((1UL))) << (___GFP_FS_BIT)))) | ((gfp_t)((((1UL))) << (___GFP_DMA_BIT)))))' (aka 'void *') [-Wint-conversion]
     766 |         msi->pages = kmalloc(PAGE_SIZE, GFP_KERNEL | GFP_DMA);
         |                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +766 drivers/pci/controller/pcie-rzg3s-host.c

   758	
   759	static int rzg3s_pcie_msi_setup(struct rzg3s_pcie_host *host)
   760	{
   761		size_t size = RZG3S_PCI_MSI_INT_NR * sizeof(u32);
   762		struct rzg3s_pcie_msi *msi = &host->msi;
   763		struct device *dev = host->dev;
   764		int id, ret;
   765	
 > 766		msi->pages = kmalloc(PAGE_SIZE, GFP_KERNEL | GFP_DMA);
   767		if (!msi->pages)
   768			return -ENOMEM;
   769	
   770		msi->dma_addr = dma_map_single(dev, (void *)msi->pages, size * 2,
   771					       DMA_BIDIRECTIONAL);
   772		if (dma_mapping_error(dev, msi->dma_addr)) {
   773			ret = -ENOMEM;
   774			goto free_pages;
   775		}
   776	
   777		/*
   778		 * According to the RZ/G3S HW manual (Rev.1.10, section 34.4.5.2 Setting
   779		 * the MSI Window) the MSI window needs to fall within one of the
   780		 * enabled AXI windows. Find an enabled AXI window to setup the MSI
   781		 * window.
   782		 */
   783		for (id = 0; id < RZG3S_MAX_WINDOWS; id++) {
   784			u64 base, basel, baseu;
   785			u64 mask, maskl, masku;
   786	
   787			basel = readl_relaxed(host->axi + RZG3S_PCI_AWBASEL(id));
   788			/* Skip checking this AXI window if it's not enabled */
   789			if (!(basel & RZG3S_PCI_AWBASEL_WIN_ENA))
   790				continue;
   791	
   792			baseu = readl_relaxed(host->axi + RZG3S_PCI_AWBASEU(id));
   793			base = baseu << 32 | basel;
   794	
   795			maskl = readl_relaxed(host->axi + RZG3S_PCI_AWMASKL(id));
   796			masku = readl_relaxed(host->axi + RZG3S_PCI_AWMASKU(id));
   797			mask = masku << 32 | maskl;
   798	
   799			if (msi->dma_addr < base || msi->dma_addr > base + mask)
   800				continue;
   801	
   802			break;
   803		}
   804	
   805		if (id == RZG3S_MAX_WINDOWS) {
   806			ret = -EINVAL;
   807			goto dma_unmap;
   808		}
   809	
   810		/* The MSI base address must be aligned to the MSI size */
   811		msi->window_base = ALIGN(msi->dma_addr, size);
   812		if (msi->window_base < msi->dma_addr) {
   813			ret = -EINVAL;
   814			goto dma_unmap;
   815		}
   816	
   817		rzg3s_pcie_msi_hw_setup(host);
   818	
   819		return 0;
   820	
   821	dma_unmap:
   822		dma_unmap_single(dev, msi->dma_addr, size * 2, DMA_BIDIRECTIONAL);
   823	free_pages:
   824		kfree((void *)msi->pages);
   825		return ret;
   826	}
   827	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
