Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DD31CFEB0;
	Wed, 21 Aug 2024 10:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724236469; cv=none; b=q6RpTZz6cyknR2r0kEb1J5AOHO98kEnia7vYR1S2VXASLRRMVGnioTvrosI1NfPP7LIMLzehhd9Ii8irbcyTfSRFvanOopqnWPmguT6LKHJz6wHTputYBTux1GFK0sQ7z7/b24bPd7a9QYbkuus5fWCZ9B1QNRSfgucySTXKarg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724236469; c=relaxed/simple;
	bh=ApC3dYZnASpZEkrdgzg4z1gCt/+jcmNFIHMXCf8gO7I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tKMa7H7h+ES8qnD03arNNhXFnh+uPfj0+CODm97mXu4ZxtZB9eUwt+8X/5mStCjLqKgMdwT4Ede0+2Yc47sA7hqZLMR1Ma9AT8iWjKn/P5nFIE3MNPz85s7GB9rVnNo/iL1pFKSLWbpklbo1m7geRZHQ6PAihlxXuNM/HcVBrqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LqtmjUhS; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LqtmjUhS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724236467; x=1755772467;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ApC3dYZnASpZEkrdgzg4z1gCt/+jcmNFIHMXCf8gO7I=;
  b=LqtmjUhSDy3rGMIEYQMCN+rvqJESayevWKlnJyy9coo34mkEcBb1iSIg
   x9wx0bdjWlpw3z+nm25nKIyUCrs1OL9HMzb8odWHIiKu36tPmD+JXJB0w
   6SS+Z448HhAiM1kLA85uOcQuUTJ3xwrmO4G6QV9R0yB0Ytm3nUKiX7Ozd
   oldIhCG5DzsNoosW/yQYxFr/xwULt7xSP90K8ruERGKPszteEMobNlDWV
   R0MvUaopLnBbiiJ6XX3u0grTQTvsONn3egSw7iclpmo/AL0yH8Z9LPaAE
   Qv522GLx5q7cK+BR4/WWTFsT8K1aUW+Mn18+q+O5hTDViir2MBCKaxHzZ
   A==;
X-CSE-ConnectionGUID: c2wS5WaYTX6vuI70HKsnzQ==
X-CSE-MsgGUID: ZGN7SV4uROO/5TpGXsj9+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="25485191"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="25485191"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 03:34:26 -0700
X-CSE-ConnectionGUID: QhTcvkzWQzCzFJzpgM7rTg==
X-CSE-MsgGUID: vs7zntD1RS+j1sS8TlCu1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="84230136"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Aug 2024 03:34:25 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgifW-000BDK-34;
	Wed, 21 Aug 2024 10:34:22 +0000
Date: Wed, 21 Aug 2024 18:34:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt 37/39]
 drivers/iommu/generic_pt/fmt/../kunit_iommu_cmp.h:248:36: warning: result of
 comparison of constant 18446744073709551615 with expression of type
 'pt_vaddr_t' (aka 'unsigned int') is always false
Message-ID: <202408211835.Vvquoj9B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt
head:   28e5c232e8c5600527c5a952c2cdefc13f181689
commit: a4c365a564b1662e6ff2fd1c97ed4fbc40adfe25 [37/39] iommupt: Add the 32 bit ARMv7s page table format
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240821/202408211835.Vvquoj9B-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240821/202408211835.Vvquoj9B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408211835.Vvquoj9B-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/generic_pt/fmt/iommu_armv7s.c:11:
   In file included from drivers/iommu/generic_pt/fmt/iommu_template.h:36:
   In file included from drivers/iommu/generic_pt/fmt/armv7s.h:377:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:503:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     503 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     504 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:510:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     510 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     511 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:523:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     523 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     524 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv7s.c:11:
   In file included from drivers/iommu/generic_pt/fmt/iommu_template.h:36:
   In file included from drivers/iommu/generic_pt/fmt/armv7s.h:377:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv7s.c:11:
   In file included from drivers/iommu/generic_pt/fmt/iommu_template.h:36:
   In file included from drivers/iommu/generic_pt/fmt/armv7s.h:377:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv7s.c:11:
   In file included from drivers/iommu/generic_pt/fmt/iommu_template.h:36:
   In file included from drivers/iommu/generic_pt/fmt/armv7s.h:377:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
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
>> drivers/iommu/generic_pt/fmt/../kunit_iommu_cmp.h:248:36: warning: result of comparison of constant 18446744073709551615 with expression of type 'pt_vaddr_t' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
     248 |         if (pt_top_range(priv->common).va >= ULONG_MAX) {
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~
   17 warnings generated.


vim +248 drivers/iommu/generic_pt/fmt/../kunit_iommu_cmp.h

f65d1677795653 Jason Gunthorpe 2024-06-28  231  
f65d1677795653 Jason Gunthorpe 2024-06-28  232  static int pt_kunit_iommu_cmp_init(struct kunit *test)
f65d1677795653 Jason Gunthorpe 2024-06-28  233  {
f65d1677795653 Jason Gunthorpe 2024-06-28  234  	struct kunit_iommu_cmp_priv *cmp_priv;
f65d1677795653 Jason Gunthorpe 2024-06-28  235  	struct kunit_iommu_priv *priv;
f65d1677795653 Jason Gunthorpe 2024-06-28  236  	int ret;
f65d1677795653 Jason Gunthorpe 2024-06-28  237  
f65d1677795653 Jason Gunthorpe 2024-06-28  238  	test->priv = cmp_priv = kzalloc(sizeof(*cmp_priv), GFP_KERNEL);
f65d1677795653 Jason Gunthorpe 2024-06-28  239  	if (!cmp_priv)
f65d1677795653 Jason Gunthorpe 2024-06-28  240  		return -ENOMEM;
f65d1677795653 Jason Gunthorpe 2024-06-28  241  	priv = &cmp_priv->fmt;
f65d1677795653 Jason Gunthorpe 2024-06-28  242  
f65d1677795653 Jason Gunthorpe 2024-06-28  243  	ret = pt_kunit_priv_init(test, priv);
f65d1677795653 Jason Gunthorpe 2024-06-28  244  	if (ret)
f65d1677795653 Jason Gunthorpe 2024-06-28  245  		goto err_priv;
f65d1677795653 Jason Gunthorpe 2024-06-28  246  
f65d1677795653 Jason Gunthorpe 2024-06-28  247  	/* io-pgtable uses unsigned long for passing the IOVA, not dma_addr_t */
f65d1677795653 Jason Gunthorpe 2024-06-28 @248  	if (pt_top_range(priv->common).va >= ULONG_MAX) {
f65d1677795653 Jason Gunthorpe 2024-06-28  249  		kunit_skip(test,
f65d1677795653 Jason Gunthorpe 2024-06-28  250  			   "This configuration cannot be tested on 32 bit");
f65d1677795653 Jason Gunthorpe 2024-06-28  251  		return -EOPNOTSUPP;
f65d1677795653 Jason Gunthorpe 2024-06-28  252  	}
f65d1677795653 Jason Gunthorpe 2024-06-28  253  
f65d1677795653 Jason Gunthorpe 2024-06-28  254  	cmp_priv->pgtbl_ops = pt_iommu_alloc_io_pgtable(
f65d1677795653 Jason Gunthorpe 2024-06-28  255  		&priv->cfg, priv->dummy_dev, &cmp_priv->fmt_memory);
f65d1677795653 Jason Gunthorpe 2024-06-28  256  	if (cmp_priv->pgtbl_ops == ERR_PTR(-EOPNOTSUPP)) {
f65d1677795653 Jason Gunthorpe 2024-06-28  257  		cmp_priv->pgtbl_ops = NULL;
f65d1677795653 Jason Gunthorpe 2024-06-28  258  		kunit_skip(test,
f65d1677795653 Jason Gunthorpe 2024-06-28  259  			   "io-pgtable does not support this configuration");
f65d1677795653 Jason Gunthorpe 2024-06-28  260  		return -EOPNOTSUPP;
f65d1677795653 Jason Gunthorpe 2024-06-28  261  	}
f65d1677795653 Jason Gunthorpe 2024-06-28  262  	if (!cmp_priv->pgtbl_ops) {
f65d1677795653 Jason Gunthorpe 2024-06-28  263  		ret = -ENOMEM;
f65d1677795653 Jason Gunthorpe 2024-06-28  264  		goto err_fmt_table;
f65d1677795653 Jason Gunthorpe 2024-06-28  265  	}
f65d1677795653 Jason Gunthorpe 2024-06-28  266  
f65d1677795653 Jason Gunthorpe 2024-06-28  267  	cmp_priv->ref_table = priv->fmt_table;
f65d1677795653 Jason Gunthorpe 2024-06-28  268  	return 0;
f65d1677795653 Jason Gunthorpe 2024-06-28  269  
f65d1677795653 Jason Gunthorpe 2024-06-28  270  err_fmt_table:
f65d1677795653 Jason Gunthorpe 2024-06-28  271  	pt_iommu_deinit(priv->iommu);
f65d1677795653 Jason Gunthorpe 2024-06-28  272  err_priv:
f65d1677795653 Jason Gunthorpe 2024-06-28  273  	kfree(test->priv);
f65d1677795653 Jason Gunthorpe 2024-06-28  274  	test->priv = NULL;
f65d1677795653 Jason Gunthorpe 2024-06-28  275  	return ret;
f65d1677795653 Jason Gunthorpe 2024-06-28  276  }
f65d1677795653 Jason Gunthorpe 2024-06-28  277  

:::::: The code at line 248 was first introduced by commit
:::::: f65d16777956538f54bfa34982b8b5575f832e51 iommupt: Add a kunit test to compare against iopt

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
