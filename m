Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C500980C0C;
	Mon, 21 Oct 2024 22:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729549977; cv=none; b=qyMhj+L2R9KF9YJigXsuBEnwg1DyPvKTpaUw2v6zweekMFBLmmn/bVFW3qo6tfvXkeUsw9zYV+jC/S3ZPoib2UeQcc88YocTqVjjtAbrZlOiatBbpWpyqrZT3kX58lAogOvSkqwzrijFBWIF/H6WxlppLv2VXod/SAjM/g1oERo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729549977; c=relaxed/simple;
	bh=cSP3lLKozo3iu7d5diIKn1QcFF3riVCb5pA/E/aMkes=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ocAHwVPkppCSl9Lcai4VBdExqZzV5CWnTgZTHunJKSw8W890CNuKoeakbuLU4jXPdPJIGmqkNDD7ZNGxGD7+2EofIXQ9zQEShpv8kxt2+fJ/Ff5aJGWGsH8XS8aw/yRl7aSvQcMtDd9oqG6On5PsRljUHCPetlLV1jZ/3dLpRA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hOIlHYkl; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hOIlHYkl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729549976; x=1761085976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cSP3lLKozo3iu7d5diIKn1QcFF3riVCb5pA/E/aMkes=;
  b=hOIlHYklXKhzz04k6YpyKJNL/BewMaIf4LDjP9SQtRtlaLhJv+yPDXqP
   O/HlWIv1SS4Zr/5tK7STWmRVvy/I9jdFeDOWbdn8iuaImlNb+VaNii5Eo
   6TQCmAs8O/e51MSHwVIR2pkpLy+qt8DGxxsFGXoBJi5Fe5iqhjSDPBQFU
   332ypHkF9wPo23fBaEVRKOxzT8cC9pJy8M0SL2mWYWKj+txPGYeleLMwc
   t7gbFtd4OYa6V5iOS9x/LGIO4h+oj+Zqxrs4CnRM7RJYI3Q8XrOyvJo+Z
   L95U39Hx/NxyTI97Bqy5fjd8AP48EQmTYRUAWYIwTdnIibI+ymo6tZEEF
   g==;
X-CSE-ConnectionGUID: 6wc2NyugTRGeH6+NGFcLyg==
X-CSE-MsgGUID: 9qJhUzcyT9upr+Rp5q9/qQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29170036"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29170036"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 15:32:55 -0700
X-CSE-ConnectionGUID: caBgQqvgTr+dQEpMWPjTqg==
X-CSE-MsgGUID: sP2g0mNWT6aGXYQ2Bh5ZOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="79598357"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Oct 2024 15:32:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t30xH-000Sgy-1e;
	Mon, 21 Oct 2024 22:32:51 +0000
Date: Tue, 22 Oct 2024 06:32:42 +0800
From: kernel test robot <lkp@intel.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:filef2zPFW 34/90]
 sound/soc/loongson/loongson_i2s_pci.c:157:1: error: type specifier missing,
 defaults to 'int'
Message-ID: <202410220638.Xlkbqgi8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git filef2zPFW
head:   5337ff41d37d4171868bb7b34dade68e269743f0
commit: ba4c5fad598c07492844e514add3ccda467063b2 [34/90] ASoC: loongson: Add I2S controller driver as platform device
config: hexagon-randconfig-001-20241022 (https://download.01.org/0day-ci/archive/20241022/202410220638.Xlkbqgi8-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241022/202410220638.Xlkbqgi8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410220638.Xlkbqgi8-lkp@intel.com/

Note: the broonie-ci/filef2zPFW HEAD 5337ff41d37d4171868bb7b34dade68e269743f0 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from sound/soc/loongson/loongson_i2s_pci.c:12:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from sound/soc/loongson/loongson_i2s_pci.c:12:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from sound/soc/loongson/loongson_i2s_pci.c:12:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> sound/soc/loongson/loongson_i2s_pci.c:157:1: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
   module_pci_driver(loongson_i2s_driver);
   ^
   sound/soc/loongson/loongson_i2s_pci.c:157:19: error: a parameter list without types is only allowed in a function definition
   module_pci_driver(loongson_i2s_driver);
                     ^
   6 warnings and 2 errors generated.


vim +/int +157 sound/soc/loongson/loongson_i2s_pci.c

d84881e06836dc Yingkun Meng 2023-06-15  148  
d84881e06836dc Yingkun Meng 2023-06-15  149  static struct pci_driver loongson_i2s_driver = {
d84881e06836dc Yingkun Meng 2023-06-15  150  	.name = "loongson-i2s-pci",
d84881e06836dc Yingkun Meng 2023-06-15  151  	.id_table = loongson_i2s_ids,
d84881e06836dc Yingkun Meng 2023-06-15  152  	.probe = loongson_i2s_pci_probe,
d84881e06836dc Yingkun Meng 2023-06-15  153  	.driver = {
d84881e06836dc Yingkun Meng 2023-06-15  154  		.pm = pm_sleep_ptr(&loongson_i2s_pm),
d84881e06836dc Yingkun Meng 2023-06-15  155  	},
d84881e06836dc Yingkun Meng 2023-06-15  156  };
d84881e06836dc Yingkun Meng 2023-06-15 @157  module_pci_driver(loongson_i2s_driver);
d84881e06836dc Yingkun Meng 2023-06-15  158  

:::::: The code at line 157 was first introduced by commit
:::::: d84881e06836dc1655777a592b4279be76ad7324 ASoC: Add support for Loongson I2S controller

:::::: TO: Yingkun Meng <mengyingkun@loongson.cn>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
