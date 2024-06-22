Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D35F79FE;
	Sat, 22 Jun 2024 02:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719023858; cv=none; b=YHPChnALjMOO3MZnGm0pvfeGb3vJ3EDFqV25KjUN39ReO83k18hoUK2t2cs6zNhoBwgRBLtIi5LALrfrBDvIWnzPEoP2HGTulxoDKRHcLaDMNQbJGLaT2mQLL4lyeie4kPXHT5MNxPxSvpDqWWiClTYSh5j32uH64ygF+WcNaH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719023858; c=relaxed/simple;
	bh=am9vgmZQNfTTmF700bFIL8OmDBsSKQ+y6dVte/yWPP0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q7Tz5W9FXNQBbBzIIA4VX6iAtZcv10FO/4gdwTnKT5wjfoyBfRjCbttUjH6cl5IUmugULAlgjJHRiSBUd+kNMrWUX35bhK57nzbvP85MYGPIJTWCCzmdpXfn7PqK86J+vPgMuni8fwKGC7s/10wHczjWi6aCkFN54S4t2/BhZ1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZQRdXG66; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZQRdXG66"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719023856; x=1750559856;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=am9vgmZQNfTTmF700bFIL8OmDBsSKQ+y6dVte/yWPP0=;
  b=ZQRdXG66EDwBjZQ4VCu/9DcBVMC/eEI1MYtnr4wJetdx0fC8UBkjVuA+
   h3PvDu/f9l9SyUzbukTR6vZaeS4EB7AnOIdBxqNH6REfPHR8FnDn7MVYH
   kjSDDSH3J2Cg5lJa/xK7w/ZgTqR/zfWMQAmXh/p+HhlgJ3DEYJtDA4NQU
   FTZdiwbqRdXTRtq1IZGqgi2jSo7HH6FsVlspX4KgmsnsP6aKQ0OnVicuK
   L0N9lpZeZ7aviq74t4IuCiAZFqFdpO+cFZUWHRf9jWLLpzpXSkRuLe/D2
   3JJYJUJ1cm1nFjHjL/n68/pLLZ9Zug6+Jrqhyyx8yz5ecUjjo1qJwkgew
   w==;
X-CSE-ConnectionGUID: fWkccDIARwWZH3MK4Pb2XA==
X-CSE-MsgGUID: BpOnkyCLQnKupgVxCsYQzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="33616908"
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="33616908"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 19:37:31 -0700
X-CSE-ConnectionGUID: POR+V8vvSGC3QwUWIs4MPw==
X-CSE-MsgGUID: Q0zdNxQMTsS5MJh1V5ep9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="42736564"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Jun 2024 19:37:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKqd6-0009F1-0B;
	Sat, 22 Jun 2024 02:37:28 +0000
Date: Sat, 22 Jun 2024 10:37:07 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolas Belin <nbelin@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [broonie-ci:v6_20240619_amergnat_add_audio_support_for_the_mediatek_genio_350_evk_board
 33/34] sound/soc/codecs/mt6357.c:1867:66: warning: data argument not used by
 format string
Message-ID: <202406221020.lmwa7ULZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v6_20240619_amergnat_add_audio_support_for_the_mediatek_genio_350_evk_board
head:   bb7947bc00dc3b464cc5ce3db7617d3ef9a9d753
commit: 60c32c70aea34f30fbf5d754189b32581cf6a425 [33/34] ASoC: codecs: add MT6357 support
config: hexagon-randconfig-002-20240622 (https://download.01.org/0day-ci/archive/20240622/202406221020.lmwa7ULZ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240622/202406221020.lmwa7ULZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406221020.lmwa7ULZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/codecs/mt6357.c:9:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from sound/soc/codecs/mt6357.c:9:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from sound/soc/codecs/mt6357.c:9:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from sound/soc/codecs/mt6357.c:9:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   sound/soc/codecs/mt6357.c:993:22: warning: unused variable 'priv' [-Wunused-variable]
     993 |         struct mt6357_priv *priv = snd_soc_component_get_drvdata(cmpnt);
         |                             ^~~~
>> sound/soc/codecs/mt6357.c:1867:66: warning: data argument not used by format string [-Wformat-extra-args]
    1867 |                 return dev_err_probe(&pdev->dev, ret, "Failed to parse dts\n", __func__);
         |                                                       ~~~~~~~~~~~~~~~~~~~~~~~  ^
   9 warnings generated.


vim +1867 sound/soc/codecs/mt6357.c

  1843	
  1844	static int mt6357_platform_driver_probe(struct platform_device *pdev)
  1845	{
  1846		struct mt6397_chip *mt6397 = dev_get_drvdata(pdev->dev.parent);
  1847		struct mt6357_priv *priv;
  1848		int ret;
  1849	
  1850		ret = devm_regulator_get_enable(&pdev->dev, "vaud28");
  1851		if (ret)
  1852			return dev_err_probe(&pdev->dev, ret, "Failed to enable vaud28 regulator\n");
  1853	
  1854		priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
  1855		if (!priv)
  1856			return -ENOMEM;
  1857	
  1858		dev_set_drvdata(&pdev->dev, priv);
  1859		priv->dev = &pdev->dev;
  1860	
  1861		priv->regmap = mt6397->regmap;
  1862		if (IS_ERR(priv->regmap))
  1863			return PTR_ERR(priv->regmap);
  1864	
  1865		ret = mt6357_parse_dt(priv);
  1866		if (ret)
> 1867			return dev_err_probe(&pdev->dev, ret, "Failed to parse dts\n", __func__);
  1868	
  1869		pdev->dev.coherent_dma_mask = DMA_BIT_MASK(64);
  1870		if (!pdev->dev.dma_mask)
  1871			pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
  1872	
  1873		return devm_snd_soc_register_component(&pdev->dev,
  1874						       &mt6357_soc_component_driver,
  1875						       mtk_6357_dai_codecs,
  1876						       ARRAY_SIZE(mtk_6357_dai_codecs));
  1877	}
  1878	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
