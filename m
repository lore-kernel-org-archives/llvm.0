Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A886619E96A;
	Sun,  3 Aug 2025 18:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754245929; cv=none; b=IxyPKC9Pzarx0EMYx8Emv9uXVFEPpgCc/aIYxbpxiRUOiLP7iBD51zJaYUaLH7ehPOy0mALQhFZLrhNJxi8jgMMJZ25lbOOC6jeioBUqgZ+O/TPsAU1tOykzbHyzAwXWjzDbKKYJIFxIxnQQaqSwN5GjQk3rsgEGOq7Msw6drMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754245929; c=relaxed/simple;
	bh=JTW3GfpH6wlmMyDXBv5d3T8tqnCvVdpCmvtoOBxJeEo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j6O3OJIcNZI6luxyuDUACKoNxUOwVmQ5xhSOc5tdCKpYIsEQ5E28Nn7Ks8FdKiueYmaKS1mVkDB7bUSMNAza3P03q5q05ox252m9RNEN8RwW7ikCMB7UETsh9pVI4ROJS5VKdCx4U4qUdCV7ZlCdkhtMwvHKfyx4JF2+WS0Sgd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uz+tal3d; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uz+tal3d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754245928; x=1785781928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JTW3GfpH6wlmMyDXBv5d3T8tqnCvVdpCmvtoOBxJeEo=;
  b=Uz+tal3dKqhP3dYjh+7w/HEXdTg+RZT993MFJFgPzUj9Z6Z4C5aGjGcM
   TEtG/qejijjBTwEDsVDoURmTkTQENqMu8fjqDWWM1VLyVtNpOMLWvT7++
   ukrjY8QXqWgopQf4aDx+zOEyTSYyyaPuoiIMgH2nUOrS86yJKuRkDCKas
   e549lm/ID65gu3XWeffvKrGI+ZmD/G5jY9r5v+N9aYPbc85RGgQkCqWaZ
   oR3dlsVKnMP0gYKhBoM42TOfZL5YU8Ycj2gHyPbDAaRh5RKy3AT8BxIK4
   gxwjI7q60VoSlTTu4TTK7bsPGyfstfwxzTq+Zp73GwgvVDffhaD/6XmZ2
   Q==;
X-CSE-ConnectionGUID: 937bkGD7Sbehrkge2qvoBg==
X-CSE-MsgGUID: NYzs+mkGSEWvgJua3auXbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="56443557"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56443557"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 11:32:06 -0700
X-CSE-ConnectionGUID: G211a8JcTJOiy8SVn7Ayhw==
X-CSE-MsgGUID: Ha93zBKjR4Gy+OmlbthdjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163250679"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa010.jf.intel.com with ESMTP; 03 Aug 2025 11:32:05 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uidV4-0001fH-1Q;
	Sun, 03 Aug 2025 18:32:02 +0000
Date: Sun, 3 Aug 2025 20:31:55 +0200
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dmabuf-vfio 11/26] kernel/dma/mapping.c:173:7: warning:
 variable 'addr' is used uninitialized whenever 'if' condition is false
Message-ID: <202508032036.QufxAQJZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dmabuf-vfio
head:   f4212771ee1cf899f5ac8c9b6acd3bb7f49691fc
commit: 697dfe4f4c1161713707900fbf32dbe1a82bd22f [11/26] dma-mapping: export new dma_*map_phys() interface
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250803/202508032036.QufxAQJZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250803/202508032036.QufxAQJZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508032036.QufxAQJZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/dma/mapping.c:173:7: warning: variable 'addr' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     173 |                 if (!ops->map_resource)
         |                     ^~~~~~~~~~~~~~~~~~
   kernel/dma/mapping.c:187:32: note: uninitialized use occurs here
     187 |         trace_dma_map_phys(dev, phys, addr, size, dir, attrs);
         |                                       ^~~~
   kernel/dma/mapping.c:173:3: note: remove the 'if' if its condition is always true
     173 |                 if (!ops->map_resource)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
     174 |                         return DMA_MAPPING_ERROR;
   kernel/dma/mapping.c:160:17: note: initialize the variable 'addr' to silence this warning
     160 |         dma_addr_t addr;
         |                        ^
         |                         = 0
   1 warning generated.


vim +173 kernel/dma/mapping.c

d3fa60d7bfdc9a Christoph Hellwig    2020-07-08  154  
697dfe4f4c1161 Leon Romanovsky      2025-06-17  155  dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
697dfe4f4c1161 Leon Romanovsky      2025-06-17  156  		enum dma_data_direction dir, unsigned long attrs)
d3fa60d7bfdc9a Christoph Hellwig    2020-07-08  157  {
d3fa60d7bfdc9a Christoph Hellwig    2020-07-08  158  	const struct dma_map_ops *ops = get_dma_ops(dev);
813b3f622598fb Leon Romanovsky      2025-06-17  159  	bool is_mmio = attrs & DMA_ATTR_MMIO;
d3fa60d7bfdc9a Christoph Hellwig    2020-07-08  160  	dma_addr_t addr;
d3fa60d7bfdc9a Christoph Hellwig    2020-07-08  161  
d3fa60d7bfdc9a Christoph Hellwig    2020-07-08  162  	BUG_ON(!valid_dma_direction(dir));
f959dcd6ddfd29 Thomas Tai           2020-09-17  163  
f959dcd6ddfd29 Thomas Tai           2020-09-17  164  	if (WARN_ON_ONCE(!dev->dma_mask))
f959dcd6ddfd29 Thomas Tai           2020-09-17  165  		return DMA_MAPPING_ERROR;
f959dcd6ddfd29 Thomas Tai           2020-09-17  166  
8d8d53cf8fd028 Alexey Kardashevskiy 2020-10-29  167  	if (dma_map_direct(dev, ops) ||
813b3f622598fb Leon Romanovsky      2025-06-17  168  	    (!is_mmio && arch_dma_map_phys_direct(dev, phys + size)))
d8bd4b22af5421 Leon Romanovsky      2025-06-17  169  		addr = dma_direct_map_phys(dev, phys, size, dir, attrs);
b5c58b2fdc427e Leon Romanovsky      2024-07-24  170  	else if (use_dma_iommu(dev))
eb3136f8a02a45 Leon Romanovsky      2025-06-17  171  		addr = iommu_dma_map_phys(dev, phys, size, dir, attrs);
813b3f622598fb Leon Romanovsky      2025-06-17  172  	else if (is_mmio) {
813b3f622598fb Leon Romanovsky      2025-06-17 @173  		if (!ops->map_resource)
813b3f622598fb Leon Romanovsky      2025-06-17  174  			return DMA_MAPPING_ERROR;
813b3f622598fb Leon Romanovsky      2025-06-17  175  	} else {
697dfe4f4c1161 Leon Romanovsky      2025-06-17  176  		struct page *page = phys_to_page(phys);
697dfe4f4c1161 Leon Romanovsky      2025-06-17  177  		size_t offset = offset_in_page(phys);
697dfe4f4c1161 Leon Romanovsky      2025-06-17  178  
813b3f622598fb Leon Romanovsky      2025-06-17  179  		/*
813b3f622598fb Leon Romanovsky      2025-06-17  180  		 * All platforms which implement .map_page() don't support
813b3f622598fb Leon Romanovsky      2025-06-17  181  		 * non-struct page backed addresses.
813b3f622598fb Leon Romanovsky      2025-06-17  182  		 */
d3fa60d7bfdc9a Christoph Hellwig    2020-07-08  183  		addr = ops->map_page(dev, page, offset, size, dir, attrs);
813b3f622598fb Leon Romanovsky      2025-06-17  184  	}
813b3f622598fb Leon Romanovsky      2025-06-17  185  
860f94b721982e Leon Romanovsky      2025-06-17  186  	kmsan_handle_dma(phys, size, dir);
f396eedbd0a64a Leon Romanovsky      2025-06-17  187  	trace_dma_map_phys(dev, phys, addr, size, dir, attrs);
1812fc9326aeaa Leon Romanovsky      2025-06-17  188  	debug_dma_map_phys(dev, phys, size, dir, addr, attrs);
d3fa60d7bfdc9a Christoph Hellwig    2020-07-08  189  
d3fa60d7bfdc9a Christoph Hellwig    2020-07-08  190  	return addr;
d3fa60d7bfdc9a Christoph Hellwig    2020-07-08  191  }
697dfe4f4c1161 Leon Romanovsky      2025-06-17  192  EXPORT_SYMBOL_GPL(dma_map_phys);
697dfe4f4c1161 Leon Romanovsky      2025-06-17  193  

:::::: The code at line 173 was first introduced by commit
:::::: 813b3f622598fbaf4ebce96c4ba261f050ef7c06 dma-mapping: handle MMIO flow in dma_map|unmap_page

:::::: TO: Leon Romanovsky <leonro@nvidia.com>
:::::: CC: Leon Romanovsky <leon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
