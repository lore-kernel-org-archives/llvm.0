Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1971E8B8B;
	Fri,  6 Sep 2024 18:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725646074; cv=none; b=kHIvY/nAus5VT537sHpEODkC9JmxsS+j69RzmMXW3BLwuaiZblFpeSYyuk38EjjnIGxBnMr8dQBMDv3uASAjy2ah/AMi+LXKWVtctcbdA0szi91rMlISt9lcan0p2eKOw/nQwDt2eSzguoGTkjzCxY5Wgf7IT9rx7fksaki5g7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725646074; c=relaxed/simple;
	bh=at0RJRAgB6KKngaiw4GEXG+GDj4hMlOisXwdzmUj89M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rhjW1FYklxkZLNB0VliTkY4YKgweW0tN6FHu3M8BiPpLxOkxjleWjcGsS1BwuTS3U/XPheSqntjTH8OHDaWVIXcbhJiuHgBKx6cuGK5Ib4LBNWM3LN9V4CQUZjY482D+N2ssP/O4GnCWhOIBy16AkLJqWL1zmLko0q/334xSVxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dZzz43ZQ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dZzz43ZQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725646068; x=1757182068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=at0RJRAgB6KKngaiw4GEXG+GDj4hMlOisXwdzmUj89M=;
  b=dZzz43ZQxdbVgQmnCLqCXjO6sdraLiVd/m4t4yk7QRaiVS76Meew07i2
   oG7evwv/BN8UTaGHwN8PwTsFqZbS+rHnwqb30fThG0KgfzPjGMIV6V3xh
   8z/bifLyjnfOCaVRgNDca2u5hNLHqPLi2Hn/b1YCZ3IHZc6FJXE45XD42
   KUJNI0/P1QxoW9tfNnC/l7uUKK9XoJLztXsWIRUgXpvoF8ciIe1ywfd1J
   dfQMM3deHVBmcr5cEmJf1iVlywm1VqjRXDxtbbN2fqBW3u7l9w2b3SCPZ
   D5aaI+S4UFk9JwfEsrjFJFTEmQT9aUjeZYcTphNvykSO1bPq4Yj28abd/
   Q==;
X-CSE-ConnectionGUID: jFfLMkkQQCSLcibkQrSWfQ==
X-CSE-MsgGUID: WlGMnts1Qnu2qeM1N2lOPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24576449"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="24576449"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 11:07:45 -0700
X-CSE-ConnectionGUID: NjTi+iEYT9y1X+6sfbboiA==
X-CSE-MsgGUID: rw/+RuYTSleZPMVJxL9jGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="65666577"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Sep 2024 11:07:44 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smdMz-000BZd-32;
	Fri, 06 Sep 2024 18:07:41 +0000
Date: Sat, 7 Sep 2024 02:06:53 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [broonie-ci:fileBvmP2G 5/13]
 sound/soc/mediatek/mt8365/mt8365-afe-clk.c:298:5: warning: no previous
 prototype for function 'mt8365_afe_hd_engen_enable'
Message-ID: <202409070215.jyACyWFf-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git fileBvmP2G
head:   241c044e743f9c55886828763c99b51b0392c21d
commit: 5bbfdad8cf8d4b2c3189fee8e6300b38f65f8d72 [5/13] ASoC: mediatek: Add MT8365 support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240907/202409070215.jyACyWFf-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409070215.jyACyWFf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409070215.jyACyWFf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/mediatek/mt8365/mt8365-afe-clk.c:11:
   In file included from sound/soc/mediatek/mt8365/mt8365-afe-common.h:16:
   In file included from include/sound/soc.h:26:
   In file included from include/sound/ac97_codec.h:17:
   In file included from include/sound/pcm.h:15:
   In file included from include/linux/mm.h:2228:
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
   In file included from include/linux/mm.h:2228:
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
   In file included from include/linux/mm.h:2228:
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
   In file included from include/linux/mm.h:2228:
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
   In file included from include/linux/mm.h:2228:
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

ef307b40b7f004 Alexandre Mergnat 2024-07-22  297  
ef307b40b7f004 Alexandre Mergnat 2024-07-22 @298  int mt8365_afe_hd_engen_enable(struct mtk_base_afe *afe, bool apll1)
ef307b40b7f004 Alexandre Mergnat 2024-07-22  299  {
ef307b40b7f004 Alexandre Mergnat 2024-07-22  300  	if (apll1)
ef307b40b7f004 Alexandre Mergnat 2024-07-22  301  		regmap_update_bits(afe->regmap, AFE_HD_ENGEN_ENABLE,
ef307b40b7f004 Alexandre Mergnat 2024-07-22  302  				   AFE_22M_PLL_EN, AFE_22M_PLL_EN);
ef307b40b7f004 Alexandre Mergnat 2024-07-22  303  	else
ef307b40b7f004 Alexandre Mergnat 2024-07-22  304  		regmap_update_bits(afe->regmap, AFE_HD_ENGEN_ENABLE,
ef307b40b7f004 Alexandre Mergnat 2024-07-22  305  				   AFE_24M_PLL_EN, AFE_24M_PLL_EN);
ef307b40b7f004 Alexandre Mergnat 2024-07-22  306  
ef307b40b7f004 Alexandre Mergnat 2024-07-22  307  	return 0;
ef307b40b7f004 Alexandre Mergnat 2024-07-22  308  }
ef307b40b7f004 Alexandre Mergnat 2024-07-22  309  
ef307b40b7f004 Alexandre Mergnat 2024-07-22 @310  int mt8365_afe_hd_engen_disable(struct mtk_base_afe *afe, bool apll1)
ef307b40b7f004 Alexandre Mergnat 2024-07-22  311  {
ef307b40b7f004 Alexandre Mergnat 2024-07-22  312  	if (apll1)
ef307b40b7f004 Alexandre Mergnat 2024-07-22  313  		regmap_update_bits(afe->regmap, AFE_HD_ENGEN_ENABLE,
ef307b40b7f004 Alexandre Mergnat 2024-07-22 @314  				   AFE_22M_PLL_EN, ~AFE_22M_PLL_EN);
ef307b40b7f004 Alexandre Mergnat 2024-07-22  315  	else
ef307b40b7f004 Alexandre Mergnat 2024-07-22  316  		regmap_update_bits(afe->regmap, AFE_HD_ENGEN_ENABLE,
ef307b40b7f004 Alexandre Mergnat 2024-07-22  317  				   AFE_24M_PLL_EN, ~AFE_24M_PLL_EN);
ef307b40b7f004 Alexandre Mergnat 2024-07-22  318  
ef307b40b7f004 Alexandre Mergnat 2024-07-22  319  	return 0;
ef307b40b7f004 Alexandre Mergnat 2024-07-22  320  }
ef307b40b7f004 Alexandre Mergnat 2024-07-22  321  

:::::: The code at line 298 was first introduced by commit
:::::: ef307b40b7f0042d54f020bccb3e728ced292282 ASoC: mediatek: mt8365: Add audio clock control support

:::::: TO: Alexandre Mergnat <amergnat@baylibre.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
