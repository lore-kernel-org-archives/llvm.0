Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34442231C;
	Sat, 22 Jun 2024 04:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719030217; cv=none; b=pybo/CpdEIU+QWE4rqTMnRAEGaQ1zRvj6/o83d+b4D04kQI004K3Mfc2qF3cAUm+aFHFkYkxOuiyno5O6YFK2O0Bt212o/rPxDmYYDmgoXsRhGLKp3SdlpsUq3X5wgwdTBf1Dw4wjgB4cyG2kKoEeqRRz/UPSktkF2z3zgG9jjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719030217; c=relaxed/simple;
	bh=C/vIk+XIZ6LrQKWz08F76uSKtzfzfSVvNgGngX7i1UM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vEjwpfUI+ZaejdN5nEcr6Cf7s9vKd/gACrsFFk2I6WqXGNJc4buWUbQaw0XYvssYSpPgfIxHkjmVntVxwioz071GFrWkW106u32xqg/eYMQuFRRLOdu7ZRpjRgITKRD9zGZKFKKaiaILRq/6kJnip4ebcjUF87jyf9X4slMf9v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mR45C1k0; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mR45C1k0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719030215; x=1750566215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C/vIk+XIZ6LrQKWz08F76uSKtzfzfSVvNgGngX7i1UM=;
  b=mR45C1k0x8BuUedpmZmb+lb5SnAMUdXw2RLb9GhT4xOM1eZimQFck2GF
   /8y1a4pYFH+IKWM/7/UIt0AkAOX6OgICnfQITT9tM5OTQqDEwq/8NpX8/
   HwFqCKgg/T1AN+IXzcqTlb3iK/2SjsA5VzhInEVDU1pnZKH/wUZSatbCQ
   tQ1h1Rf0PTladl3VUaqd+JGHlKWyc+hIfL92WuqyhCIsPAtonTj5XYDMG
   6aLHNrDbm8fwDpUBitbf2GVBPFFhfvq/d2roSNjT03rS9ce2eeZGPjCxt
   If1AQHeCzhmIDKjll4NMeLhJ9AefMA1HBuJg1gQf0D6hUI8EHpj10oxnZ
   Q==;
X-CSE-ConnectionGUID: SbVPET81RvubKDEGC1sNdw==
X-CSE-MsgGUID: IEzWoigDRvmb/AlO/5kjHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="19960222"
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="19960222"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 21:23:34 -0700
X-CSE-ConnectionGUID: gYMeEBYZTyiQo2yo6+6IKQ==
X-CSE-MsgGUID: pdJrtc93Rg2gbI5Zr0kAfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="42750016"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Jun 2024 21:23:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKsHi-0009Id-1J;
	Sat, 22 Jun 2024 04:23:30 +0000
Date: Sat, 22 Jun 2024 12:22:41 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [broonie-ci:v6_20240619_amergnat_add_audio_support_for_the_mediatek_genio_350_evk_board
 34/34] sound/soc/mediatek/mt8365/mt8365-afe-clk.c:298:5: warning: no
 previous prototype for function 'mt8365_afe_hd_engen_enable'
Message-ID: <202406221249.REEiRekU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alexandre,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v6_20240619_amergnat_add_audio_support_for_the_mediatek_genio_350_evk_board
head:   bb7947bc00dc3b464cc5ce3db7617d3ef9a9d753
commit: bb7947bc00dc3b464cc5ce3db7617d3ef9a9d753 [34/34] ASoC: mediatek: Add MT8365 support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240622/202406221249.REEiRekU-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240622/202406221249.REEiRekU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406221249.REEiRekU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/mediatek/mt8365/mt8365-afe-clk.c:11:
   In file included from sound/soc/mediatek/mt8365/mt8365-afe-common.h:16:
   In file included from include/sound/soc.h:26:
   In file included from include/sound/ac97_codec.h:17:
   In file included from include/sound/pcm.h:15:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/mediatek/mt8365/mt8365-afe-clk.c:298:5: warning: no previous prototype for function 'mt8365_afe_hd_engen_enable' [-Wmissing-prototypes]
     298 | int mt8365_afe_hd_engen_enable(struct mtk_base_afe *afe, bool apll1)
         |     ^
   sound/soc/mediatek/mt8365/mt8365-afe-clk.c:298:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     298 | int mt8365_afe_hd_engen_enable(struct mtk_base_afe *afe, bool apll1)
         | ^
         | static 
>> sound/soc/mediatek/mt8365/mt8365-afe-clk.c:310:5: warning: no previous prototype for function 'mt8365_afe_hd_engen_disable' [-Wmissing-prototypes]
     310 | int mt8365_afe_hd_engen_disable(struct mtk_base_afe *afe, bool apll1)
         |     ^
   sound/soc/mediatek/mt8365/mt8365-afe-clk.c:310:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     310 | int mt8365_afe_hd_engen_disable(struct mtk_base_afe *afe, bool apll1)
         | ^
         | static 
>> sound/soc/mediatek/mt8365/mt8365-afe-clk.c:314:24: warning: implicit conversion from 'unsigned long' to 'unsigned int' changes value from 18446744073709551614 to 4294967294 [-Wconstant-conversion]
     313 |                 regmap_update_bits(afe->regmap, AFE_HD_ENGEN_ENABLE,
         |                 ~~~~~~~~~~~~~~~~~~
     314 |                                    AFE_22M_PLL_EN, ~AFE_22M_PLL_EN);
         |                                                    ^~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8365/mt8365-afe-clk.c:317:24: warning: implicit conversion from 'unsigned long' to 'unsigned int' changes value from 18446744073709551613 to 4294967293 [-Wconstant-conversion]
     316 |                 regmap_update_bits(afe->regmap, AFE_HD_ENGEN_ENABLE,
         |                 ~~~~~~~~~~~~~~~~~~
     317 |                                    AFE_24M_PLL_EN, ~AFE_24M_PLL_EN);
         |                                                    ^~~~~~~~~~~~~~~
   9 warnings generated.
--
   In file included from sound/soc/mediatek/mt8365/mt8365-afe-pcm.c:14:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/mediatek/mt8365/mt8365-afe-pcm.c:173:6: warning: no previous prototype for function 'mt8365_afe_clk_group_44k' [-Wmissing-prototypes]
     173 | bool mt8365_afe_clk_group_44k(int sample_rate)
         |      ^
   sound/soc/mediatek/mt8365/mt8365-afe-pcm.c:173:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     173 | bool mt8365_afe_clk_group_44k(int sample_rate)
         | ^
         | static 
>> sound/soc/mediatek/mt8365/mt8365-afe-pcm.c:499:5: warning: no previous prototype for function 'mt8365_afe_fe_startup' [-Wmissing-prototypes]
     499 | int mt8365_afe_fe_startup(struct snd_pcm_substream *substream,
         |     ^
   sound/soc/mediatek/mt8365/mt8365-afe-pcm.c:499:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     499 | int mt8365_afe_fe_startup(struct snd_pcm_substream *substream,
         | ^
         | static 
>> sound/soc/mediatek/mt8365/mt8365-afe-pcm.c:575:9: warning: implicit conversion from 'unsigned long' to 'unsigned int' changes value from 18446744073709547519 to 4294963199 [-Wconstant-conversion]
     573 |                         regmap_update_bits(afe->regmap, AFE_CM2_CON0,
         |                         ~~~~~~~~~~~~~~~~~~
     574 |                                            CM_AFE_CM2_TDM_SEL,
     575 |                                            ~CM_AFE_CM2_TDM_SEL);
         |                                            ^~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8365/mt8365-afe-pcm.c:654:29: warning: unused variable 'memif' [-Wunused-variable]
     654 |         struct mtk_base_afe_memif *memif = &afe->memif[dai_id];
         |                                    ^~~~~
>> sound/soc/mediatek/mt8365/mt8365-afe-pcm.c:717:5: warning: no previous prototype for function 'mt8365_afe_fe_trigger' [-Wmissing-prototypes]
     717 | int mt8365_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
         |     ^
   sound/soc/mediatek/mt8365/mt8365-afe-pcm.c:717:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     717 | int mt8365_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
         | ^
         | static 
   sound/soc/mediatek/mt8365/mt8365-afe-pcm.c:746:23: warning: implicit conversion from 'unsigned long' to 'unsigned int' changes value from 18446744073709551599 to 4294967279 [-Wconstant-conversion]
     745 |                         regmap_update_bits(afe->regmap, AFE_CM1_CON0,
         |                         ~~~~~~~~~~~~~~~~~~
     746 |                                            CM_AFE_CM_ON, ~CM_AFE_CM_ON);
         |                                                          ^~~~~~~~~~~~~
   sound/soc/mediatek/mt8365/mt8365-afe-pcm.c:750:23: warning: implicit conversion from 'unsigned long' to 'unsigned int' changes value from 18446744073709551599 to 4294967279 [-Wconstant-conversion]
     749 |                         regmap_update_bits(afe->regmap, AFE_CM2_CON0,
         |                         ~~~~~~~~~~~~~~~~~~
     750 |                                            CM_AFE_CM_ON, ~CM_AFE_CM_ON);
         |                                                          ^~~~~~~~~~~~~
   12 warnings generated.
--
   In file included from sound/soc/mediatek/mt8365/mt8365-dai-adda.c:12:
   In file included from include/sound/pcm_params.h:10:
   In file included from include/sound/pcm.h:15:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/mediatek/mt8365/mt8365-dai-adda.c:93:8: warning: implicit conversion from 'unsigned long' to 'unsigned int' changes value from 18446744073709551614 to 4294967294 [-Wconstant-conversion]
      91 |                 regmap_update_bits(afe->regmap, AFE_ADDA_UL_DL_CON0,
         |                 ~~~~~~~~~~~~~~~~~~
      92 |                                    AFE_ADDA_UL_DL_ADDA_AFE_ON,
      93 |                                    ~AFE_ADDA_UL_DL_ADDA_AFE_ON);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   6 warnings generated.
--
   In file included from sound/soc/mediatek/mt8365/mt8365-dai-dmic.c:12:
   In file included from include/sound/pcm_params.h:10:
   In file included from include/sound/pcm.h:15:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/mediatek/mt8365/mt8365-dai-dmic.c:64:7: warning: implicit conversion from 'unsigned long' to 'unsigned int' changes value from 18446744073709551613 to 4294967293 [-Wconstant-conversion]
      62 |         regmap_update_bits(afe->regmap, AFE_ADDA_UL_DL_CON0,
         |         ~~~~~~~~~~~~~~~~~~
      63 |                            AFE_ADDA_UL_DL_DMIC_CLKDIV_ON,
      64 |                            ~AFE_ADDA_UL_DL_DMIC_CLKDIV_ON);
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8365/mt8365-dai-dmic.c:134:12: warning: unused function 'mt8365_dai_load_dmic_iir_coeff_table' [-Wunused-function]
     134 | static int mt8365_dai_load_dmic_iir_coeff_table(struct mtk_base_afe *afe)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   7 warnings generated.
--
   In file included from sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:12:
   In file included from include/sound/pcm_params.h:10:
   In file included from include/sound/pcm.h:15:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:388:8: warning: implicit conversion from 'unsigned long' to 'unsigned int' changes value from 18446744073709551613 to 4294967293 [-Wconstant-conversion]
     386 |                 regmap_update_bits(afe->regmap, AFE_ASRC_2CH_CON0,
         |                 ~~~~~~~~~~~~~~~~~~
     387 |                                    COEFF_SRAM_CTRL,
     388 |                                    (unsigned long)~COEFF_SRAM_CTRL);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:396:16: warning: implicit conversion from 'unsigned long' to 'unsigned int' changes value from 18446744073709549567 to 4294965247 [-Wconstant-conversion]
     395 |                 regmap_update_bits(afe->regmap, AFE_ASRC_2CH_CON2,
         |                 ~~~~~~~~~~~~~~~~~~
     396 |                                    IIR_EN, (unsigned long)~IIR_EN);
         |                                            ^~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:459:16: warning: implicit conversion from 'unsigned long' to 'unsigned int' changes value from 18446744073709551614 to 4294967294 [-Wconstant-conversion]
     458 |                 regmap_update_bits(afe->regmap, AFE_ASRC_2CH_CON0,
         |                 ~~~~~~~~~~~~~~~~~~
     459 |                                    ASM_ON, (unsigned long)~ASM_ON);
         |                                            ^~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:785:33: warning: unused variable 'mt8365_i2s_enum' [-Wunused-const-variable]
     785 | static SOC_ENUM_SINGLE_EXT_DECL(mt8365_i2s_enum, mt8365_i2s_hd_str);
         |                                 ^~~~~~~~~~~~~~~
   include/sound/soc.h:411:24: note: expanded from macro 'SOC_ENUM_SINGLE_EXT_DECL'
     411 |         const struct soc_enum name = SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(xtexts), xtexts)
         |                               ^~~~
   9 warnings generated.


vim +/mt8365_afe_hd_engen_enable +298 sound/soc/mediatek/mt8365/mt8365-afe-clk.c

04f09b11a08d4f Alexandre Mergnat 2024-06-19  297  
04f09b11a08d4f Alexandre Mergnat 2024-06-19 @298  int mt8365_afe_hd_engen_enable(struct mtk_base_afe *afe, bool apll1)
04f09b11a08d4f Alexandre Mergnat 2024-06-19  299  {
04f09b11a08d4f Alexandre Mergnat 2024-06-19  300  	if (apll1)
04f09b11a08d4f Alexandre Mergnat 2024-06-19  301  		regmap_update_bits(afe->regmap, AFE_HD_ENGEN_ENABLE,
04f09b11a08d4f Alexandre Mergnat 2024-06-19  302  				   AFE_22M_PLL_EN, AFE_22M_PLL_EN);
04f09b11a08d4f Alexandre Mergnat 2024-06-19  303  	else
04f09b11a08d4f Alexandre Mergnat 2024-06-19  304  		regmap_update_bits(afe->regmap, AFE_HD_ENGEN_ENABLE,
04f09b11a08d4f Alexandre Mergnat 2024-06-19  305  				   AFE_24M_PLL_EN, AFE_24M_PLL_EN);
04f09b11a08d4f Alexandre Mergnat 2024-06-19  306  
04f09b11a08d4f Alexandre Mergnat 2024-06-19  307  	return 0;
04f09b11a08d4f Alexandre Mergnat 2024-06-19  308  }
04f09b11a08d4f Alexandre Mergnat 2024-06-19  309  
04f09b11a08d4f Alexandre Mergnat 2024-06-19 @310  int mt8365_afe_hd_engen_disable(struct mtk_base_afe *afe, bool apll1)
04f09b11a08d4f Alexandre Mergnat 2024-06-19  311  {
04f09b11a08d4f Alexandre Mergnat 2024-06-19  312  	if (apll1)
04f09b11a08d4f Alexandre Mergnat 2024-06-19  313  		regmap_update_bits(afe->regmap, AFE_HD_ENGEN_ENABLE,
04f09b11a08d4f Alexandre Mergnat 2024-06-19 @314  				   AFE_22M_PLL_EN, ~AFE_22M_PLL_EN);
04f09b11a08d4f Alexandre Mergnat 2024-06-19  315  	else
04f09b11a08d4f Alexandre Mergnat 2024-06-19  316  		regmap_update_bits(afe->regmap, AFE_HD_ENGEN_ENABLE,
04f09b11a08d4f Alexandre Mergnat 2024-06-19  317  				   AFE_24M_PLL_EN, ~AFE_24M_PLL_EN);
04f09b11a08d4f Alexandre Mergnat 2024-06-19  318  
04f09b11a08d4f Alexandre Mergnat 2024-06-19  319  	return 0;
04f09b11a08d4f Alexandre Mergnat 2024-06-19  320  }
04f09b11a08d4f Alexandre Mergnat 2024-06-19  321  

:::::: The code at line 298 was first introduced by commit
:::::: 04f09b11a08d4fc785f0cbea3ea1dfa20bb9df2a ASoC: mediatek: mt8365: Add audio clock control support

:::::: TO: Alexandre Mergnat <amergnat@baylibre.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
