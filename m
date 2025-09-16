Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A168A2DD60F;
	Tue, 16 Sep 2025 20:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758053996; cv=none; b=pslhdtZswkNsfeogJCnucsZdkZBOSA7Hl2DknUao0pKkiCXbeXNEud9Ji/Y1nUAuW5TmR2LP7lXih94LwfQ1O8JUKfr8/ZlG1nObQtch4Mn6GQ3+X7XR/anbf3i/2vvAhwCiCiYOonurYyq7IGILDiLtSkU7YNEFuoLjs16s+co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758053996; c=relaxed/simple;
	bh=QRyrY3mZglOsp3cknKA9nwk8NNGbN1ybYI28G5fU28w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UtuPPcsIG2Gi/OYPslanOSGigUl9os4mUrgiee3fgDFU7vqdieweue4eD3Kq+BOq6rP2BEDAg0vwVFpvSQZKixWahLojtj4DV4+aZvoryh96yRfN61F08x8+JN7Eo/ioYWx9zJmAb39cMQzvBJjSAe6JEbcTg+pHwsZE4yB4HMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m1RZaIcv; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m1RZaIcv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758053995; x=1789589995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QRyrY3mZglOsp3cknKA9nwk8NNGbN1ybYI28G5fU28w=;
  b=m1RZaIcv1JWB5fkFyrjpleXEDlqReQS8u5uj6do6L9ESEcOq9hTkX43+
   N/2JdFOgB4Vtu//UbFLnZQX5LN1kKpkM6bfcu0qXuCE8J3iXdh7KhzzoD
   jqrj4i9hUZKoUfyRQaYPAxJk4NSjQ90edUy08JqTe5FezYiJxC7igYZH+
   mlT9FWUx1CB/XpPLYr8mI/bAGQWIM8VXa6n6IezCm1rqMPTu8BcEmwDtB
   /ifHwgfJGEWW1Flgxc3uuHVjIXWwsVE65oXsZPAHZtXrZFTTqpL2nJiAU
   yVuCD2SIuWzRjxT9z7Iij77rssF+bF9Y2BAIWzFw4mfzaNvzQelWeuBpJ
   A==;
X-CSE-ConnectionGUID: +w6oIlN/SOm4izuA74RIEQ==
X-CSE-MsgGUID: hixp3HFWTb2RjPXjZFsIDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="64167523"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="64167523"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 13:19:52 -0700
X-CSE-ConnectionGUID: OHXcJtZWRfqsZnfknOl3fQ==
X-CSE-MsgGUID: CJEt3bBxQxaBRNTVbVaBZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="175822197"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Sep 2025 13:19:50 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyc9U-0000iB-0R;
	Tue, 16 Sep 2025 20:19:48 +0000
Date: Wed, 17 Sep 2025 04:19:06 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dmabuf-vfio 42/42] kernel/dma/mapping.c:174:2: warning:
 non-void function does not return a value in all control paths
Message-ID: <202509170453.TJrTBB4U-lkp@intel.com>
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
commit: 887b59804850b679831fda6eba707cc1b1b077e0 [42/42] dma-mapping: remove unused map_page callback
config: x86_64-buildonly-randconfig-002-20250916 (https://download.01.org/0day-ci/archive/20250917/202509170453.TJrTBB4U-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509170453.TJrTBB4U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509170453.TJrTBB4U-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/dma/mapping.c:160:13: warning: variable 'addr' set but not used [-Wunused-but-set-variable]
     160 |         dma_addr_t addr = DMA_MAPPING_ERROR;
         |                    ^
>> kernel/dma/mapping.c:174:2: warning: non-void function does not return a value in all control paths [-Wreturn-type]
     174 |         }
         |         ^
   kernel/dma/mapping.c:176:2: error: expected identifier or '('
     176 |         if (!is_mmio)
         |         ^
   kernel/dma/mapping.c:178:2: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     178 |         trace_dma_map_phys(dev, phys, addr, size, dir, attrs);
         |         ^
         |         int
   kernel/dma/mapping.c:178:21: error: a parameter list without types is only allowed in a function definition
     178 |         trace_dma_map_phys(dev, phys, addr, size, dir, attrs);
         |                            ^
   kernel/dma/mapping.c:179:2: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     179 |         debug_dma_map_phys(dev, phys, size, dir, addr, attrs);
         |         ^
         |         int
   kernel/dma/mapping.c:179:21: error: a parameter list without types is only allowed in a function definition
     179 |         debug_dma_map_phys(dev, phys, size, dir, addr, attrs);
         |                            ^
   kernel/dma/mapping.c:181:2: error: expected identifier or '('
     181 |         return addr;
         |         ^
   kernel/dma/mapping.c:182:1: error: extraneous closing brace ('}')
     182 | }
         | ^
   2 warnings and 7 errors generated.


vim +174 kernel/dma/mapping.c

d3fa60d7bfdc9a Christoph Hellwig    2020-07-08  154  
98aa19211ca8ab Leon Romanovsky      2025-06-17  155  dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
98aa19211ca8ab Leon Romanovsky      2025-06-17  156  		enum dma_data_direction dir, unsigned long attrs)
d3fa60d7bfdc9a Christoph Hellwig    2020-07-08  157  {
d3fa60d7bfdc9a Christoph Hellwig    2020-07-08  158  	const struct dma_map_ops *ops = get_dma_ops(dev);
c332420ebc1822 Leon Romanovsky      2025-06-17  159  	bool is_mmio = attrs & DMA_ATTR_MMIO;
19e1683200df53 Leon Romanovsky      2025-09-15 @160  	dma_addr_t addr = DMA_MAPPING_ERROR;
d3fa60d7bfdc9a Christoph Hellwig    2020-07-08  161  
d3fa60d7bfdc9a Christoph Hellwig    2020-07-08  162  	BUG_ON(!valid_dma_direction(dir));
f959dcd6ddfd29 Thomas Tai           2020-09-17  163  
f959dcd6ddfd29 Thomas Tai           2020-09-17  164  	if (WARN_ON_ONCE(!dev->dma_mask))
f959dcd6ddfd29 Thomas Tai           2020-09-17  165  		return DMA_MAPPING_ERROR;
f959dcd6ddfd29 Thomas Tai           2020-09-17  166  
8d8d53cf8fd028 Alexey Kardashevskiy 2020-10-29  167  	if (dma_map_direct(dev, ops) ||
c332420ebc1822 Leon Romanovsky      2025-06-17  168  	    (!is_mmio && arch_dma_map_phys_direct(dev, phys + size)))
907f79a29dcbc1 Leon Romanovsky      2025-06-17  169  		addr = dma_direct_map_phys(dev, phys, size, dir, attrs);
b5c58b2fdc427e Leon Romanovsky      2024-07-24  170  	else if (use_dma_iommu(dev))
fe635b87c42ebd Leon Romanovsky      2025-06-17  171  		addr = iommu_dma_map_phys(dev, phys, size, dir, attrs);
098e1e1eeeee44 Leon Romanovsky      2025-09-15  172  	else if (ops->map_phys)
098e1e1eeeee44 Leon Romanovsky      2025-09-15  173  		addr = ops->map_phys(dev, phys, size, dir, attrs);
c332420ebc1822 Leon Romanovsky      2025-06-17 @174  	}
00730608c19fca Leon Romanovsky      2025-06-17  175  
c332420ebc1822 Leon Romanovsky      2025-06-17  176  	if (!is_mmio)
00730608c19fca Leon Romanovsky      2025-06-17  177  		kmsan_handle_dma(phys, size, dir);
7d6250d472a5fb Leon Romanovsky      2025-06-17  178  	trace_dma_map_phys(dev, phys, addr, size, dir, attrs);
46758939d12150 Leon Romanovsky      2025-06-17  179  	debug_dma_map_phys(dev, phys, size, dir, addr, attrs);
d3fa60d7bfdc9a Christoph Hellwig    2020-07-08  180  
d3fa60d7bfdc9a Christoph Hellwig    2020-07-08  181  	return addr;
d3fa60d7bfdc9a Christoph Hellwig    2020-07-08  182  }
98aa19211ca8ab Leon Romanovsky      2025-06-17  183  EXPORT_SYMBOL_GPL(dma_map_phys);
98aa19211ca8ab Leon Romanovsky      2025-06-17  184  

:::::: The code at line 174 was first introduced by commit
:::::: c332420ebc1822897e61cef6b9f361cde917dc21 dma-mapping: implement DMA_ATTR_MMIO for dma_(un)map_page_attrs()

:::::: TO: Leon Romanovsky <leonro@nvidia.com>
:::::: CC: Leon Romanovsky <leon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
