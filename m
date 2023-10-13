Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A00F1C3C;
	Fri, 13 Oct 2023 05:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QPU19xI+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697173991; x=1728709991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fq+2aXruiq6cYxjIPxlEZ/+Q8nqk9oZLyJpiOkqszL4=;
  b=QPU19xI+jY+16rgMs2uLx1Qh1RugFMNTXHGP80z9YqE4ZJYGKQ3f5tka
   PaUKXVcO3MN4acQ8VSaI6TK6e+S6OF6NePxktJw0yJw9Xd8NO1PzpYAKe
   U12NCU2JG6J4aNsp3RjePiQ0XiY86JYzKX3/YI49TqXt2B6sjdGMFs2pl
   KlzuCEsWlQRzV94Kok7i4X1PjPtdDTB/ln9iDG9d/sh4cENW4C9SKX1RK
   J4icnIQGFEROmQ/m23dE9iyjxh6D5ZrqUPCrg6mc3vVQcm+d6Sni0QgAP
   zg5JNvJHlEsmZUBUY17H9SEZdvAwmtOaA0Rf4aIPd9U8GNT5bsk7vdEVj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="387961523"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="387961523"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 22:13:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="824893364"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="824893364"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 12 Oct 2023 22:13:00 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrATp-0004ML-3A;
	Fri, 13 Oct 2023 05:12:58 +0000
Date: Fri, 13 Oct 2023 13:12:16 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 10163/11653]
 sound/soc/rockchip/rockchip_i2s_tdm.c:1315:34: warning: unused variable
 'rockchip_i2s_tdm_match'
Message-ID: <202310131310.Em4Ucd4e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f9a6bea131849702d591d18d5c8b8a0eda6f62b3
commit: 9958d85968ed2df4b704105fd2a9c3669eb9cd97 [10163/11653] ASoC: Use device_get_match_data()
config: hexagon-randconfig-r002-20211203 (https://download.01.org/0day-ci/archive/20231013/202310131310.Em4Ucd4e-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131310.Em4Ucd4e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131310.Em4Ucd4e-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/rockchip/rockchip_i2s_tdm.c:15:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from sound/soc/rockchip/rockchip_i2s_tdm.c:15:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from sound/soc/rockchip/rockchip_i2s_tdm.c:15:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> sound/soc/rockchip/rockchip_i2s_tdm.c:1315:34: warning: unused variable 'rockchip_i2s_tdm_match' [-Wunused-const-variable]
   static const struct of_device_id rockchip_i2s_tdm_match[] = {
                                    ^
   7 warnings generated.


vim +/rockchip_i2s_tdm_match +1315 sound/soc/rockchip/rockchip_i2s_tdm.c

081068fd641403 Nicolas Frattaroli 2021-10-01  1314  
081068fd641403 Nicolas Frattaroli 2021-10-01 @1315  static const struct of_device_id rockchip_i2s_tdm_match[] = {
081068fd641403 Nicolas Frattaroli 2021-10-01  1316  	{ .compatible = "rockchip,px30-i2s-tdm", .data = &px30_i2s_soc_data },
081068fd641403 Nicolas Frattaroli 2021-10-01  1317  	{ .compatible = "rockchip,rk1808-i2s-tdm", .data = &rk1808_i2s_soc_data },
081068fd641403 Nicolas Frattaroli 2021-10-01  1318  	{ .compatible = "rockchip,rk3308-i2s-tdm", .data = &rk3308_i2s_soc_data },
081068fd641403 Nicolas Frattaroli 2021-10-01  1319  	{ .compatible = "rockchip,rk3568-i2s-tdm", .data = &rk3568_i2s_soc_data },
c619bd4268ff98 Nicolas Frattaroli 2022-10-25  1320  	{ .compatible = "rockchip,rk3588-i2s-tdm" },
081068fd641403 Nicolas Frattaroli 2021-10-01  1321  	{ .compatible = "rockchip,rv1126-i2s-tdm", .data = &rv1126_i2s_soc_data },
081068fd641403 Nicolas Frattaroli 2021-10-01  1322  	{},
081068fd641403 Nicolas Frattaroli 2021-10-01  1323  };
081068fd641403 Nicolas Frattaroli 2021-10-01  1324  

:::::: The code at line 1315 was first introduced by commit
:::::: 081068fd641403994f0505e6b91e021d3925f348 ASoC: rockchip: add support for i2s-tdm controller

:::::: TO: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
