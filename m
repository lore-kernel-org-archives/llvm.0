Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6339E14883F;
	Sun, 20 Jul 2025 13:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753017013; cv=none; b=RmY30sCm0L4NXCimQx0OxK3EGDKdj0rab6QWmO8mbD0e0AeUJHESpd3mlnCuJLKdx8BVQhBebJFPtkvM3q2UYsUaS0lzfmrI8nu5XwRgtRpSYXp/HIHFqqLaU7rnw8dWZW7q+82BgOBcLhw+Vf2kwGGzwmmZxa4Z5Azgqo/8yhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753017013; c=relaxed/simple;
	bh=LrvFxCv+1AQ+WO/3zsn/2a1P1a5OWslkk1EiDutur6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RH6cAp9vlAq/ZbQj76/vJOv4mZpd9jiBXLOYCJ0HZ5n24pTedNrWY/2u96i49ydsQ+QsCVOg6Tk66VvKBw9e3c9LbSqzfrEo8Ps/XWYrr++wJghvLOpOPMU8a/Cu+Pcjdunq+9vsflV6z9CtvBkoY9AGBpAxexKAWyIiPnxACWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tdg+DZUt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tdg+DZUt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65C91C4CEE7;
	Sun, 20 Jul 2025 13:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753017012;
	bh=LrvFxCv+1AQ+WO/3zsn/2a1P1a5OWslkk1EiDutur6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tdg+DZUtHDMqWtkVmvy9pK4T7tGtKmkBHO8KNxEYGgS/ft8Rhnc6WOlXMvz0tA3Ov
	 FKXf8/DG240My46PIPunMOAOFqSTeqT9lh+iajOieFwzY09DF/hpTdFnmMmShj2BiE
	 2NrcaichsAKLtkb2uuFXWWq192ccNBFccnChDPu5wYgghMTriaS8ZHpIum1NuMAxET
	 Z385Vtx85RifgxFDS59hsNzpbsouuHcNUIuzs6mPgYBtJ6gEnP6c2fw8rdtz/GrWKd
	 et5GWWxQz5xNsGKvWNBBoGl3BIYkuBQz2NFGw818EHyJm0dJdb8O1AhY0QUAp/DU9N
	 5Ou5slRo2RoFQ==
Date: Sun, 20 Jul 2025 16:10:08 +0300
From: Leon Romanovsky <leon@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 1/2] dma-mapping: prepare dma_map_ops to conversion to
 physical address
Message-ID: <20250720131008.GJ402218@unreal>
References: <184fc9bda626efc62c5022ace01a20b80d1dc93b.1753003879.git.leon@kernel.org>
 <202507201935.hwB4Ebxp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202507201935.hwB4Ebxp-lkp@intel.com>

On Sun, Jul 20, 2025 at 07:28:05PM +0800, kernel test robot wrote:
> Hi Leon,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on next-20250718]
> [cannot apply to linus/master v6.16-rc6 v6.16-rc5 v6.16-rc4 v6.16-rc6]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Leon-Romanovsky/dma-mapping-prepare-dma_map_ops-to-conversion-to-physical-address/20250720-173726
> base:   next-20250718
> patch link:    https://lore.kernel.org/r/184fc9bda626efc62c5022ace01a20b80d1dc93b.1753003879.git.leon%40kernel.org
> patch subject: [PATCH v1 1/2] dma-mapping: prepare dma_map_ops to conversion to physical address
> config: s390-randconfig-001-20250720 (https://download.01.org/0day-ci/archive/20250720/202507201935.hwB4Ebxp-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 16534d19bf50bde879a83f0ae62875e2c5120e64)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250720/202507201935.hwB4Ebxp-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507201935.hwB4Ebxp-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> kernel/dma/mapping.c:192:12: warning: variable 'addr' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
>      192 |                 else if (ops->map_page)
>          |                          ^~~~~~~~~~~~~
>    kernel/dma/mapping.c:198:32: note: uninitialized use occurs here
>      198 |         trace_dma_map_phys(dev, phys, addr, size, dir, attrs);
>          |                                       ^~~~
>    kernel/dma/mapping.c:192:8: note: remove the 'if' if its condition is always true
>      192 |                 else if (ops->map_page)
>          |                      ^~~~~~~~~~~~~~~~~~
>      193 |                         addr = ops->map_page(dev, page, offset, size, dir,
>    kernel/dma/mapping.c:159:17: note: initialize the variable 'addr' to silence this warning
>      159 |         dma_addr_t addr;
>          |                        ^
>          |                         = 0
>    1 warning generated.

Strange, I didn't get any warning about it for v1.

Thanks

> 
> 
> vim +192 kernel/dma/mapping.c
> 
>    154	
>    155	dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
>    156			enum dma_data_direction dir, unsigned long attrs)
>    157	{
>    158		const struct dma_map_ops *ops = get_dma_ops(dev);
>    159		dma_addr_t addr;
>    160	
>    161		BUG_ON(!valid_dma_direction(dir));
>    162	
>    163		if (WARN_ON_ONCE(!dev->dma_mask))
>    164			return DMA_MAPPING_ERROR;
>    165	
>    166		if (dma_map_direct(dev, ops) ||
>    167		    arch_dma_map_phys_direct(dev, phys + size))
>    168			addr = dma_direct_map_phys(dev, phys, size, dir, attrs);
>    169		else if (use_dma_iommu(dev))
>    170			addr = iommu_dma_map_phys(dev, phys, size, dir, attrs);
>    171		else {
>    172			struct page *page = phys_to_page(phys);
>    173			size_t offset = offset_in_page(phys);
>    174			bool is_pfn_valid = true;
>    175	
>    176			if (IS_ENABLED(CONFIG_DMA_API_DEBUG)) {
>    177				is_pfn_valid = pfn_valid(PHYS_PFN(phys));
>    178	
>    179				/* We shouldn't have both functions */
>    180				WARN_ON_ONCE(ops->map_page && ops->map_phys);
>    181			}
>    182	
>    183			if (unlikely(!is_pfn_valid))
>    184				return DMA_MAPPING_ERROR;
>    185	
>    186			/*
>    187			 * All platforms which implement .map_page() don't support
>    188			 * non-struct page backed addresses.
>    189			 */
>    190			if (ops->map_phys)
>    191				addr = ops->map_phys(dev, phys, size, dir, attrs);
>  > 192			else if (ops->map_page)
>    193				addr = ops->map_page(dev, page, offset, size, dir,
>    194						     attrs);
>    195		}
>    196	
>    197		kmsan_handle_dma(phys, size, dir);
>    198		trace_dma_map_phys(dev, phys, addr, size, dir, attrs);
>    199		debug_dma_map_phys(dev, phys, size, dir, addr, attrs);
>    200	
>    201		return addr;
>    202	}
>    203	EXPORT_SYMBOL_GPL(dma_map_phys);
>    204	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
