Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4667A20485F;
	Tue, 18 Mar 2025 08:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742288147; cv=none; b=XVEXKAI2qj5BuwQ/8XSBmQ+TTsdalhDN++8yRk65dEj34l26djpmCvGkjyQ/OoPBHmQYB9js43mtuxUdtxHCSJfCovKciFAw1uE+g+qchGVz45VTZt8upQcj5uObgsB5k6bxILbQ4DM+mlKxwXoWgjJhyjqfRvqlvBdHhJtu6u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742288147; c=relaxed/simple;
	bh=d852++R4Z8qfuBp2rmYw9Ji8iv3IP8iNK+etD5OTlck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qFhTHrz0ga/+Z05vdc/PpRsUR0BRaGLpA4PbfKI/Zb4+lgR1dmpYpjbJ66cZgjfOnE9n1rTgCpzAf/oHe0k6nds4rFykWaXVCDrvQYdIimnvU4o+dkVZeZfhbCjoGgB3lfTeyWVoeOQMlG7jK3ZSFkckRnwrxgJfUKQ6OcuxJqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QS6XQbQf; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QS6XQbQf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742288142; x=1773824142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d852++R4Z8qfuBp2rmYw9Ji8iv3IP8iNK+etD5OTlck=;
  b=QS6XQbQfBXrdpyGkOL50STLxDF5yOhu74Zw6OtWwdwytF1PGjwi7TXk3
   t9exw7yFGdIet+guUR/Y7En2cW0YO6PTjmdwvRRVk5RVDD+BDBsXwFocG
   yFGi9/99ZMBIMbOrhVuiaAB0D+I8P1FGNHyHD8aATa/s4U7c5jfdwQ/yI
   mjB1+oiz8RgXyZRIJXs3RIbUYN1P1Otk9OdO1KmjlmuAeWE52AlsnJ/9O
   gnens1t05qSNw486d/bQHNj4M2tv+ctDuifcqmmJo2Gh/4w/L+mGuLi1T
   zV2J+Fr69VJgx8+kTfpPIClVcGW++NsYyN+L/8NzPpXrxAowM7aOKSr82
   A==;
X-CSE-ConnectionGUID: qWghhsnASD6RNfdB/7G73g==
X-CSE-MsgGUID: 8VNc0bLKTAGDlIjRydRsjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="47305268"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="47305268"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 01:55:41 -0700
X-CSE-ConnectionGUID: XJnHQItKTqWkkm8EA12/5w==
X-CSE-MsgGUID: MhA08L9BRnqBWj2lUvnA2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="122697324"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 18 Mar 2025 01:55:38 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuSjX-000Dbj-2R;
	Tue, 18 Mar 2025 08:55:35 +0000
Date: Tue, 18 Mar 2025 16:54:30 +0800
From: kernel test robot <lkp@intel.com>
To: Balamurugan S <quic_bselvara@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	ath12k@lists.infradead.org,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	P Praneesh <quic_ppranees@quicinc.com>,
	Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [ath:pending 19/19] drivers/net/wireless/ath/ath12k/ahb.c:1011:11:
 warning: cast to smaller integer type 'enum ath12k_hw_rev' from 'const void
 *'
Message-ID: <202503181631.ckurxYu4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Balamurugan,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending
head:   5bc3e6ca41aa7982442c7c2002d339f1a3343eae
commit: 5bc3e6ca41aa7982442c7c2002d339f1a3343eae [19/19] wifi: ath12k: enable ath12k AHB support
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250318/202503181631.ckurxYu4-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250318/202503181631.ckurxYu4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503181631.ckurxYu4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/ath/ath12k/ahb.c:7:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:549:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     549 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:567:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     567 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/net/wireless/ath/ath12k/ahb.c:7:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/net/wireless/ath/ath12k/ahb.c:7:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:601:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     601 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:616:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     616 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:631:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     631 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:724:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     724 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:737:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     737 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:750:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     750 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:764:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     764 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:778:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     778 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:792:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     792 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/net/wireless/ath/ath12k/ahb.c:1011:11: warning: cast to smaller integer type 'enum ath12k_hw_rev' from 'const void *' [-Wvoid-pointer-to-enum-cast]
    1011 |         hw_rev = (enum ath12k_hw_rev)of_device_get_match_data(&pdev->dev);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   13 warnings generated.


vim +1011 drivers/net/wireless/ath/ath12k/ahb.c

940301a74ff47d Balamurugan S           2025-03-18   990  
940301a74ff47d Balamurugan S           2025-03-18   991  static int ath12k_ahb_probe(struct platform_device *pdev)
940301a74ff47d Balamurugan S           2025-03-18   992  {
940301a74ff47d Balamurugan S           2025-03-18   993  	struct ath12k_base *ab;
940301a74ff47d Balamurugan S           2025-03-18   994  	const struct ath12k_hif_ops *hif_ops;
f0b813f6eec3b8 Sowmiya Sree Elavalagan 2025-03-18   995  	struct ath12k_ahb *ab_ahb;
940301a74ff47d Balamurugan S           2025-03-18   996  	enum ath12k_hw_rev hw_rev;
dde5891d65c67e Sowmiya Sree Elavalagan 2025-03-18   997  	u32 addr, userpd_id;
940301a74ff47d Balamurugan S           2025-03-18   998  	int ret;
940301a74ff47d Balamurugan S           2025-03-18   999  
940301a74ff47d Balamurugan S           2025-03-18  1000  	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
940301a74ff47d Balamurugan S           2025-03-18  1001  	if (ret) {
940301a74ff47d Balamurugan S           2025-03-18  1002  		dev_err(&pdev->dev, "Failed to set 32-bit coherent dma\n");
940301a74ff47d Balamurugan S           2025-03-18  1003  		return ret;
940301a74ff47d Balamurugan S           2025-03-18  1004  	}
940301a74ff47d Balamurugan S           2025-03-18  1005  
940301a74ff47d Balamurugan S           2025-03-18  1006  	ab = ath12k_core_alloc(&pdev->dev, sizeof(struct ath12k_ahb),
940301a74ff47d Balamurugan S           2025-03-18  1007  			       ATH12K_BUS_AHB);
940301a74ff47d Balamurugan S           2025-03-18  1008  	if (!ab)
940301a74ff47d Balamurugan S           2025-03-18  1009  		return -ENOMEM;
940301a74ff47d Balamurugan S           2025-03-18  1010  
940301a74ff47d Balamurugan S           2025-03-18 @1011  	hw_rev = (enum ath12k_hw_rev)of_device_get_match_data(&pdev->dev);
940301a74ff47d Balamurugan S           2025-03-18  1012  	switch (hw_rev) {
940301a74ff47d Balamurugan S           2025-03-18  1013  	case ATH12K_HW_IPQ5332_HW10:
940301a74ff47d Balamurugan S           2025-03-18  1014  		hif_ops = &ath12k_ahb_hif_ops_ipq5332;
dde5891d65c67e Sowmiya Sree Elavalagan 2025-03-18  1015  		userpd_id = ATH12K_IPQ5332_USERPD_ID;
940301a74ff47d Balamurugan S           2025-03-18  1016  		break;
940301a74ff47d Balamurugan S           2025-03-18  1017  	default:
940301a74ff47d Balamurugan S           2025-03-18  1018  		ret = -EOPNOTSUPP;
940301a74ff47d Balamurugan S           2025-03-18  1019  		goto err_core_free;
940301a74ff47d Balamurugan S           2025-03-18  1020  	}
940301a74ff47d Balamurugan S           2025-03-18  1021  
940301a74ff47d Balamurugan S           2025-03-18  1022  	ab->hif.ops = hif_ops;
940301a74ff47d Balamurugan S           2025-03-18  1023  	ab->pdev = pdev;
940301a74ff47d Balamurugan S           2025-03-18  1024  	ab->hw_rev = hw_rev;
940301a74ff47d Balamurugan S           2025-03-18  1025  	platform_set_drvdata(pdev, ab);
f0b813f6eec3b8 Sowmiya Sree Elavalagan 2025-03-18  1026  	ab_ahb = ath12k_ab_to_ahb(ab);
f0b813f6eec3b8 Sowmiya Sree Elavalagan 2025-03-18  1027  	ab_ahb->ab = ab;
dde5891d65c67e Sowmiya Sree Elavalagan 2025-03-18  1028  	ab_ahb->userpd_id = userpd_id;
940301a74ff47d Balamurugan S           2025-03-18  1029  
940301a74ff47d Balamurugan S           2025-03-18  1030  	/* Set fixed_mem_region to true for platforms that support fixed memory
940301a74ff47d Balamurugan S           2025-03-18  1031  	 * reservation from DT. If memory is reserved from DT for FW, ath12k driver
940301a74ff47d Balamurugan S           2025-03-18  1032  	 * need not to allocate memory.
940301a74ff47d Balamurugan S           2025-03-18  1033  	 */
940301a74ff47d Balamurugan S           2025-03-18  1034  	if (!of_property_read_u32(ab->dev->of_node, "memory-region", &addr))
940301a74ff47d Balamurugan S           2025-03-18  1035  		set_bit(ATH12K_FLAG_FIXED_MEM_REGION, &ab->dev_flags);
940301a74ff47d Balamurugan S           2025-03-18  1036  
940301a74ff47d Balamurugan S           2025-03-18  1037  	ret = ath12k_core_pre_init(ab);
940301a74ff47d Balamurugan S           2025-03-18  1038  	if (ret)
940301a74ff47d Balamurugan S           2025-03-18  1039  		goto err_core_free;
940301a74ff47d Balamurugan S           2025-03-18  1040  
940301a74ff47d Balamurugan S           2025-03-18  1041  	ret = ath12k_ahb_resource_init(ab);
940301a74ff47d Balamurugan S           2025-03-18  1042  	if (ret)
940301a74ff47d Balamurugan S           2025-03-18  1043  		goto err_core_free;
940301a74ff47d Balamurugan S           2025-03-18  1044  
940301a74ff47d Balamurugan S           2025-03-18  1045  	ret = ath12k_hal_srng_init(ab);
940301a74ff47d Balamurugan S           2025-03-18  1046  	if (ret)
940301a74ff47d Balamurugan S           2025-03-18  1047  		goto err_resource_deinit;
940301a74ff47d Balamurugan S           2025-03-18  1048  
940301a74ff47d Balamurugan S           2025-03-18  1049  	ret = ath12k_ce_alloc_pipes(ab);
940301a74ff47d Balamurugan S           2025-03-18  1050  	if (ret) {
940301a74ff47d Balamurugan S           2025-03-18  1051  		ath12k_err(ab, "failed to allocate ce pipes: %d\n", ret);
940301a74ff47d Balamurugan S           2025-03-18  1052  		goto err_hal_srng_deinit;
940301a74ff47d Balamurugan S           2025-03-18  1053  	}
940301a74ff47d Balamurugan S           2025-03-18  1054  
940301a74ff47d Balamurugan S           2025-03-18  1055  	ath12k_ahb_init_qmi_ce_config(ab);
940301a74ff47d Balamurugan S           2025-03-18  1056  
f0b813f6eec3b8 Sowmiya Sree Elavalagan 2025-03-18  1057  	ret = ath12k_ahb_configure_rproc(ab);
f0b813f6eec3b8 Sowmiya Sree Elavalagan 2025-03-18  1058  	if (ret)
f0b813f6eec3b8 Sowmiya Sree Elavalagan 2025-03-18  1059  		goto err_ce_free;
f0b813f6eec3b8 Sowmiya Sree Elavalagan 2025-03-18  1060  
940301a74ff47d Balamurugan S           2025-03-18  1061  	ret = ath12k_ahb_config_irq(ab);
940301a74ff47d Balamurugan S           2025-03-18  1062  	if (ret) {
940301a74ff47d Balamurugan S           2025-03-18  1063  		ath12k_err(ab, "failed to configure irq: %d\n", ret);
f0b813f6eec3b8 Sowmiya Sree Elavalagan 2025-03-18  1064  		goto err_rproc_deconfigure;
940301a74ff47d Balamurugan S           2025-03-18  1065  	}
940301a74ff47d Balamurugan S           2025-03-18  1066  
940301a74ff47d Balamurugan S           2025-03-18  1067  	ret = ath12k_core_init(ab);
940301a74ff47d Balamurugan S           2025-03-18  1068  	if (ret) {
940301a74ff47d Balamurugan S           2025-03-18  1069  		ath12k_err(ab, "failed to init core: %d\n", ret);
f0b813f6eec3b8 Sowmiya Sree Elavalagan 2025-03-18  1070  		goto err_rproc_deconfigure;
940301a74ff47d Balamurugan S           2025-03-18  1071  	}
940301a74ff47d Balamurugan S           2025-03-18  1072  
940301a74ff47d Balamurugan S           2025-03-18  1073  	return 0;
940301a74ff47d Balamurugan S           2025-03-18  1074  
f0b813f6eec3b8 Sowmiya Sree Elavalagan 2025-03-18  1075  err_rproc_deconfigure:
f0b813f6eec3b8 Sowmiya Sree Elavalagan 2025-03-18  1076  	ath12k_ahb_deconfigure_rproc(ab);
f0b813f6eec3b8 Sowmiya Sree Elavalagan 2025-03-18  1077  
940301a74ff47d Balamurugan S           2025-03-18  1078  err_ce_free:
940301a74ff47d Balamurugan S           2025-03-18  1079  	ath12k_ce_free_pipes(ab);
940301a74ff47d Balamurugan S           2025-03-18  1080  
940301a74ff47d Balamurugan S           2025-03-18  1081  err_hal_srng_deinit:
940301a74ff47d Balamurugan S           2025-03-18  1082  	ath12k_hal_srng_deinit(ab);
940301a74ff47d Balamurugan S           2025-03-18  1083  
940301a74ff47d Balamurugan S           2025-03-18  1084  err_resource_deinit:
940301a74ff47d Balamurugan S           2025-03-18  1085  	ath12k_ahb_resource_deinit(ab);
940301a74ff47d Balamurugan S           2025-03-18  1086  
940301a74ff47d Balamurugan S           2025-03-18  1087  err_core_free:
940301a74ff47d Balamurugan S           2025-03-18  1088  	ath12k_core_free(ab);
940301a74ff47d Balamurugan S           2025-03-18  1089  	platform_set_drvdata(pdev, NULL);
940301a74ff47d Balamurugan S           2025-03-18  1090  
940301a74ff47d Balamurugan S           2025-03-18  1091  	return ret;
940301a74ff47d Balamurugan S           2025-03-18  1092  }
940301a74ff47d Balamurugan S           2025-03-18  1093  

:::::: The code at line 1011 was first introduced by commit
:::::: 940301a74ff47d4a2bcdab6800991e875b728d5f wifi: ath12k: add AHB driver support for IPQ5332

:::::: TO: Balamurugan S <quic_bselvara@quicinc.com>
:::::: CC: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
