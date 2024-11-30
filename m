Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C5C29A0;
	Sat, 30 Nov 2024 05:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732943828; cv=none; b=PzgW8yWJJLriFsfsoxJPGiYOGxE4YlWuJh+z2JDwjHEUtPUkCRVPcZgvk0pgCvNLipQEoNkeBVuV5vxnmvyfybp+ENjiSii4sj9M3F81Ej71mVZyUxNnfywMQhtTSjD7pFjURrDv0uj1lm/ppLYd47kL+1ZD9O+PqXL8OfOLs/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732943828; c=relaxed/simple;
	bh=u6sPGOa5xVzmic7r1NYocbdxD7BAe5llpde9RnS7J0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dz2tZFoendGOdWqffUhrxNnoP4knnN6BS44dLVXpmfkyOC3lQKAdlr623mtLOhaAwW725xuLJJQbyAZDtY1x54I2uQZ0Vw9WF+VWJbIZ9PMKkeKBHcEo+vQ5DvULkYTfsNljD2awXNnLpaTllwl+P/sbQKl3S6W6opBjp0n/ni0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A4Qy0FuD; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A4Qy0FuD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732943825; x=1764479825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u6sPGOa5xVzmic7r1NYocbdxD7BAe5llpde9RnS7J0U=;
  b=A4Qy0FuD8pbrj835HwCdxpT+arovc94QVxuR0haaJapoQtNB+IFo98+j
   Za/iR3aofZkQwvcD3MPqYa9YVmovBG27tPDOscb6s47s6kfNp9lBOOuSQ
   CqZc8kyB4M19D9TpPN5OdqNiR7Hl9rhw1Dsv1LEbA7eGbMwOnHh6liiq2
   1dR+ACv1cAmYc8b8zF89uClCq8C4BZ5S2E9hcxHqSvTDaq3WejTTPUrgl
   8agFCPsN++gtpVKaSnz1E7MICObIKamVaNx3XNYHeJ5dwNCJFlBjABAPa
   4f2HL47NeyMu2jAtn4cB36TU/AAkAtv2ygwnC1Zoq1Xwmn/eGgIqycx4p
   w==;
X-CSE-ConnectionGUID: B69L5FMsTb+epklSr7+OFA==
X-CSE-MsgGUID: 1EvtLLmRQnG2OJ5q/DBFWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="33219609"
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="33219609"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 21:17:05 -0800
X-CSE-ConnectionGUID: sUfMkDUJRO65DYIes9zuJQ==
X-CSE-MsgGUID: LFEnlM8kSP2RvUejZPfpUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="93103378"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 29 Nov 2024 21:17:03 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHFqX-000069-2H;
	Sat, 30 Nov 2024 05:16:49 +0000
Date: Sat, 30 Nov 2024 13:16:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt 29/48]
 drivers/iommu/generic_pt/fmt/../kunit_iommu_cmp.h:323:36: warning: result of
 comparison of constant 18446744073709551615 with expression of type
 'pt_vaddr_t' (aka 'unsigned int') is always false
Message-ID: <202411301317.nM3azfEl-lkp@intel.com>
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
commit: 3203d9625915912d06fcf248ae426d3e37af51d4 [29/48] iommupt: Add the 32 bit ARMv7s page table format
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20241130/202411301317.nM3azfEl-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411301317.nM3azfEl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411301317.nM3azfEl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/generic_pt/fmt/iommu_armv7s.c:11:
   In file included from drivers/iommu/generic_pt/fmt/iommu_template.h:36:
   In file included from drivers/iommu/generic_pt/fmt/armv7s.h:361:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv7s.c:11:
   In file included from drivers/iommu/generic_pt/fmt/iommu_template.h:36:
   In file included from drivers/iommu/generic_pt/fmt/armv7s.h:361:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv7s.c:11:
   In file included from drivers/iommu/generic_pt/fmt/iommu_template.h:36:
   In file included from drivers/iommu/generic_pt/fmt/armv7s.h:361:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv7s.c:11:
   In file included from drivers/iommu/generic_pt/fmt/iommu_template.h:36:
   In file included from drivers/iommu/generic_pt/fmt/armv7s.h:361:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv7s.c:11:
   In file included from drivers/iommu/generic_pt/fmt/iommu_template.h:49:
>> drivers/iommu/generic_pt/fmt/../kunit_iommu_cmp.h:323:36: warning: result of comparison of constant 18446744073709551615 with expression of type 'pt_vaddr_t' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
     323 |         if (pt_top_range(priv->common).va >= ULONG_MAX) {
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~
   14 warnings generated.


vim +323 drivers/iommu/generic_pt/fmt/../kunit_iommu_cmp.h

de667502f1c0fb Jason Gunthorpe 2024-06-28  306  
de667502f1c0fb Jason Gunthorpe 2024-06-28  307  static int pt_kunit_iommu_cmp_init(struct kunit *test)
de667502f1c0fb Jason Gunthorpe 2024-06-28  308  {
de667502f1c0fb Jason Gunthorpe 2024-06-28  309  	struct kunit_iommu_cmp_priv *cmp_priv;
de667502f1c0fb Jason Gunthorpe 2024-06-28  310  	struct kunit_iommu_priv *priv;
de667502f1c0fb Jason Gunthorpe 2024-06-28  311  	int ret;
de667502f1c0fb Jason Gunthorpe 2024-06-28  312  
de667502f1c0fb Jason Gunthorpe 2024-06-28  313  	test->priv = cmp_priv = kzalloc(sizeof(*cmp_priv), GFP_KERNEL);
de667502f1c0fb Jason Gunthorpe 2024-06-28  314  	if (!cmp_priv)
de667502f1c0fb Jason Gunthorpe 2024-06-28  315  		return -ENOMEM;
de667502f1c0fb Jason Gunthorpe 2024-06-28  316  	priv = &cmp_priv->fmt;
de667502f1c0fb Jason Gunthorpe 2024-06-28  317  
de667502f1c0fb Jason Gunthorpe 2024-06-28  318  	ret = pt_kunit_priv_init(test, priv);
de667502f1c0fb Jason Gunthorpe 2024-06-28  319  	if (ret)
de667502f1c0fb Jason Gunthorpe 2024-06-28  320  		goto err_priv;
de667502f1c0fb Jason Gunthorpe 2024-06-28  321  
de667502f1c0fb Jason Gunthorpe 2024-06-28  322  	/* io-pgtable uses unsigned long for passing the IOVA, not dma_addr_t */
de667502f1c0fb Jason Gunthorpe 2024-06-28 @323  	if (pt_top_range(priv->common).va >= ULONG_MAX) {
de667502f1c0fb Jason Gunthorpe 2024-06-28  324  		kunit_skip(test,
de667502f1c0fb Jason Gunthorpe 2024-06-28  325  			   "This configuration cannot be tested on 32 bit");
de667502f1c0fb Jason Gunthorpe 2024-06-28  326  		return -EOPNOTSUPP;
de667502f1c0fb Jason Gunthorpe 2024-06-28  327  	}
de667502f1c0fb Jason Gunthorpe 2024-06-28  328  
de667502f1c0fb Jason Gunthorpe 2024-06-28  329  	cmp_priv->pgtbl_ops = pt_iommu_alloc_io_pgtable(
de667502f1c0fb Jason Gunthorpe 2024-06-28  330  		&priv->cfg, priv->dummy_dev, &cmp_priv->fmt_memory);
de667502f1c0fb Jason Gunthorpe 2024-06-28  331  	if (cmp_priv->pgtbl_ops == ERR_PTR(-EOPNOTSUPP)) {
de667502f1c0fb Jason Gunthorpe 2024-06-28  332  		cmp_priv->pgtbl_ops = NULL;
de667502f1c0fb Jason Gunthorpe 2024-06-28  333  		kunit_skip(test,
de667502f1c0fb Jason Gunthorpe 2024-06-28  334  			   "io-pgtable does not support this configuration");
de667502f1c0fb Jason Gunthorpe 2024-06-28  335  		return -EOPNOTSUPP;
de667502f1c0fb Jason Gunthorpe 2024-06-28  336  	}
de667502f1c0fb Jason Gunthorpe 2024-06-28  337  	if (!cmp_priv->pgtbl_ops) {
de667502f1c0fb Jason Gunthorpe 2024-06-28  338  		ret = -ENOMEM;
de667502f1c0fb Jason Gunthorpe 2024-06-28  339  		goto err_fmt_table;
de667502f1c0fb Jason Gunthorpe 2024-06-28  340  	}
de667502f1c0fb Jason Gunthorpe 2024-06-28  341  
de667502f1c0fb Jason Gunthorpe 2024-06-28  342  	cmp_priv->ref_table = priv->fmt_table;
de667502f1c0fb Jason Gunthorpe 2024-06-28  343  	return 0;
de667502f1c0fb Jason Gunthorpe 2024-06-28  344  
de667502f1c0fb Jason Gunthorpe 2024-06-28  345  err_fmt_table:
de667502f1c0fb Jason Gunthorpe 2024-06-28  346  	pt_iommu_deinit(priv->iommu);
de667502f1c0fb Jason Gunthorpe 2024-06-28  347  err_priv:
de667502f1c0fb Jason Gunthorpe 2024-06-28  348  	kfree(test->priv);
de667502f1c0fb Jason Gunthorpe 2024-06-28  349  	test->priv = NULL;
de667502f1c0fb Jason Gunthorpe 2024-06-28  350  	return ret;
de667502f1c0fb Jason Gunthorpe 2024-06-28  351  }
de667502f1c0fb Jason Gunthorpe 2024-06-28  352  

:::::: The code at line 323 was first introduced by commit
:::::: de667502f1c0fb0d99e1930a056103d5b4e1116c iommupt: Add a kunit test to compare against iopt

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
