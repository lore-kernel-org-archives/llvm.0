Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9164303A35;
	Mon,  1 Jun 2026 19:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780341302; cv=none; b=HO+zUHwvVEziJKAxrTuLLyd4a+SwHZ6YndiwGTZT5ezN0+Ak2mr80XYWdwBdP4Tqj/GQn1OGv5T9bmPNYxPgD2mh17Xw0GplPcS8dp7QZ7Y4QUyH6HvJSUZ5WBb1mpPfXByN6NPeNSq5E4nSzFlYuue1ksB5S0UCGN6ZddYj6EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780341302; c=relaxed/simple;
	bh=7lmabJPasWrY6uualkK8nL5U1EO14ylNex6xC70nGaw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HWx2eMIcow25RfUdxsHVOnPQkep2bBkOAbtOn2q5IWKyEgnCym1MvxF1s5iVyZn5wTPhND1RU+29s7arkDRSIU1HXlcBQwdWT5YvqNO6woB1OAeX8NVkhNBLqDMIyZ9FQtwOYVjhOW3Y8F0jtzPG1uTdGQqRmsR+P6HStKMuVBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T1u2jYYO; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T1u2jYYO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780341299; x=1811877299;
  h=date:from:to:cc:subject:message-id;
  bh=7lmabJPasWrY6uualkK8nL5U1EO14ylNex6xC70nGaw=;
  b=T1u2jYYOV4wFO+Eo0MTpUTUyfMJG8iMC5OhPEy4/3LVJuT7h9bo+ivUp
   dmHfKGlXVkSURqOQYjKomuGSb9s8IZU29QJw37VNoYdXmItCsFT4Ttiin
   IuBZHDjgh935nA/75SZ4nGLhytwzArUkPGdfKltInoQXKuwfrsrmiXx/k
   hPSl0YasuBVCns7bpFIYrqcYmzJ9B4b2bU5iNl1HnciKbxy1Vxp2Vzba5
   h0JotSP4JcnfR+aHQj7XD2maN+1TsEtVgrKEHp3oSlBPZm/xPgjyW2+tX
   npOyqKclRYL+0p3trS80sbuyn3K8Om9V28HK7Ru08Gt2xlX5nrXapey9J
   Q==;
X-CSE-ConnectionGUID: fHSOgkHyQXGU2QKoAuSBlw==
X-CSE-MsgGUID: 6DL0OcIKQfC/G8a+wx95vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81082924"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="81082924"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 12:14:59 -0700
X-CSE-ConnectionGUID: 0oEo0LnaRPCkACIeYqCR2Q==
X-CSE-MsgGUID: x9dMIns9QL2QQcX/uPDuhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="273942580"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 Jun 2026 12:14:57 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU86A-00000000AzK-1V1I;
	Mon, 01 Jun 2026 19:14:54 +0000
Date: Tue, 02 Jun 2026 03:14:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/mediatek/mt8186/mt8186-mt6366.c:1303:3: error: initializer element
 is not a compile-time constant
Message-ID: <202606020221.IAtsG18f-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: cc97e5ee4f734c20e86677cf9ed8ac4c87277f2a [290/290] ASoC: mediatek: common: use snd_soc_card_register()
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20260602/202606020221.IAtsG18f-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e5ab4f8a1f766febdc65ce89c00dec85393cfd68)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606020221.IAtsG18f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606020221.IAtsG18f-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1099:37: error: variable has incomplete type 'struct snd_soc_card_platform'
    1099 | static struct snd_soc_card_platform mt8186_mt6366_da7219_max98357_soc_card = {
         |                                     ^
   sound/soc/mediatek/mt8186/../common/mtk-soundcard-driver.h:30:9: note: forward declaration of 'struct snd_soc_card_platform'
      30 |         struct snd_soc_card_platform *card_platform;
         |                ^
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1116:37: error: variable has incomplete type 'struct snd_soc_card_platform'
    1116 | static struct snd_soc_card_platform mt8186_mt6366_rt1019_rt5682s_soc_card = {
         |                                     ^
   sound/soc/mediatek/mt8186/../common/mtk-soundcard-driver.h:30:9: note: forward declaration of 'struct snd_soc_card_platform'
      30 |         struct snd_soc_card_platform *card_platform;
         |                ^
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1133:37: error: variable has incomplete type 'struct snd_soc_card_platform'
    1133 | static struct snd_soc_card_platform mt8186_mt6366_rt5682s_max98360_soc_card = {
         |                                     ^
   sound/soc/mediatek/mt8186/../common/mtk-soundcard-driver.h:30:9: note: forward declaration of 'struct snd_soc_card_platform'
      30 |         struct snd_soc_card_platform *card_platform;
         |                ^
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1150:37: error: variable has incomplete type 'struct snd_soc_card_platform'
    1150 | static struct snd_soc_card_platform mt8186_mt6366_rt5650_soc_card = {
         |                                     ^
   sound/soc/mediatek/mt8186/../common/mtk-soundcard-driver.h:30:9: note: forward declaration of 'struct snd_soc_card_platform'
      30 |         struct snd_soc_card_platform *card_platform;
         |                ^
>> sound/soc/mediatek/mt8186/mt8186-mt6366.c:1303:3: error: initializer element is not a compile-time constant
    1303 |                 .num_jacks = MT8186_JACK_MAX,
         |                 ^
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1315:3: error: initializer element is not a compile-time constant
    1315 |                 .num_jacks = MT8186_JACK_MAX,
         |                 ^
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1326:3: error: initializer element is not a compile-time constant
    1326 |                 .num_jacks = MT8186_JACK_MAX,
         |                 ^
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1337:3: error: initializer element is not a compile-time constant
    1337 |                 .num_jacks = MT8186_JACK_MAX,
         |                 ^
   8 errors generated.
--
   sound/soc/mediatek/mt8188/mt8188-mt6359.c:1307:37: error: variable has incomplete type 'struct snd_soc_card_platform'
    1307 | static struct snd_soc_card_platform mt8188_mt6359_soc_card = {
         |                                     ^
   sound/soc/mediatek/mt8188/../common/mtk-soundcard-driver.h:30:9: note: forward declaration of 'struct snd_soc_card_platform'
      30 |         struct snd_soc_card_platform *card_platform;
         |                ^
>> sound/soc/mediatek/mt8188/mt8188-mt6359.c:1417:3: error: initializer element is not a compile-time constant
    1417 |                 .num_jacks = MT8188_JACK_MAX,
         |                 ^
   sound/soc/mediatek/mt8188/mt8188-mt6359.c:1427:3: error: initializer element is not a compile-time constant
    1427 |                 .num_jacks = MT8188_JACK_MAX,
         |                 ^
   sound/soc/mediatek/mt8188/mt8188-mt6359.c:1438:3: error: initializer element is not a compile-time constant
    1438 |                 .num_jacks = MT8188_JACK_MAX,
         |                 ^
   sound/soc/mediatek/mt8188/mt8188-mt6359.c:1449:3: error: initializer element is not a compile-time constant
    1449 |                 .num_jacks = MT8188_JACK_MAX,
         |                 ^
   5 errors generated.
--
   sound/soc/mediatek/mt8195/mt8195-mt6359.c:1246:37: error: variable has incomplete type 'struct snd_soc_card_platform'
    1246 | static struct snd_soc_card_platform mt8195_mt6359_soc_card = {
         |                                     ^
   sound/soc/mediatek/mt8195/../common/mtk-soundcard-driver.h:30:9: note: forward declaration of 'struct snd_soc_card_platform'
      30 |         struct snd_soc_card_platform *card_platform;
         |                ^
>> sound/soc/mediatek/mt8195/mt8195-mt6359.c:1499:3: error: initializer element is not a compile-time constant
    1499 |                 .num_jacks = MT8195_JACK_MAX,
         |                 ^
   sound/soc/mediatek/mt8195/mt8195-mt6359.c:1512:3: error: initializer element is not a compile-time constant
    1512 |                 .num_jacks = MT8195_JACK_MAX,
         |                 ^
   sound/soc/mediatek/mt8195/mt8195-mt6359.c:1525:3: error: initializer element is not a compile-time constant
    1525 |                 .num_jacks = MT8195_JACK_MAX,
         |                 ^
   sound/soc/mediatek/mt8195/mt8195-mt6359.c:1538:3: error: initializer element is not a compile-time constant
    1538 |                 .num_jacks = MT8195_JACK_MAX,
         |                 ^
   5 errors generated.


vim +1303 sound/soc/mediatek/mt8186/mt8186-mt6366.c

6e1dbf694d7cd1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c tongjian                   2022-12-28  1149  
cc97e5ee4f734c sound/soc/mediatek/mt8186/mt8186-mt6366.c                Kuninori Morimoto          2026-05-18 @1150  static struct snd_soc_card_platform mt8186_mt6366_rt5650_soc_card = {
d88c433831015a sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c xiazhengqiao               2023-10-19  1151  	.name = "mt8186_rt5650",
d88c433831015a sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c xiazhengqiao               2023-10-19  1152  	.owner = THIS_MODULE,
cc97e5ee4f734c sound/soc/mediatek/mt8186/mt8186-mt6366.c                Kuninori Morimoto          2026-05-18  1153  	.driver = {
d88c433831015a sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c xiazhengqiao               2023-10-19  1154  		.dai_link = mt8186_mt6366_rt1019_rt5682s_dai_links,
d88c433831015a sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c xiazhengqiao               2023-10-19  1155  		.num_links = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_dai_links),
d88c433831015a sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c xiazhengqiao               2023-10-19  1156  		.controls = mt8186_mt6366_rt1019_rt5682s_controls,
d88c433831015a sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c xiazhengqiao               2023-10-19  1157  		.num_controls = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_controls),
d88c433831015a sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c xiazhengqiao               2023-10-19  1158  		.dapm_widgets = mt8186_mt6366_rt1019_rt5682s_widgets,
d88c433831015a sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c xiazhengqiao               2023-10-19  1159  		.num_dapm_widgets = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_widgets),
d88c433831015a sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c xiazhengqiao               2023-10-19  1160  		.dapm_routes = mt8186_mt6366_rt5650_routes,
d88c433831015a sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c xiazhengqiao               2023-10-19  1161  		.num_dapm_routes = ARRAY_SIZE(mt8186_mt6366_rt5650_routes),
d88c433831015a sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c xiazhengqiao               2023-10-19  1162  		.codec_conf = mt8186_mt6366_rt1019_rt5682s_codec_conf,
d88c433831015a sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c xiazhengqiao               2023-10-19  1163  		.num_configs = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_codec_conf),
cc97e5ee4f734c sound/soc/mediatek/mt8186/mt8186-mt6366.c                Kuninori Morimoto          2026-05-18  1164  	},
d88c433831015a sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c xiazhengqiao               2023-10-19  1165  };
d88c433831015a sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c xiazhengqiao               2023-10-19  1166  
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1167  static int mt8186_mt6366_legacy_probe(struct mtk_soc_card_data *soc_card_data)
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1168  {
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1169  	struct mtk_platform_card_data *card_data = soc_card_data->card_data;
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1170  	struct snd_soc_card *card = card_data->card;
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1171  	struct device *dev = card->dev;
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1172  	struct snd_soc_dai_link *dai_link;
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1173  	struct device_node *headset_codec, *playback_codec;
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1174  	int ret, i;
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1175  
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1176  	playback_codec = of_get_child_by_name(dev->of_node, "playback-codecs");
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1177  	if (!playback_codec)
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1178  		return dev_err_probe(dev, -EINVAL,
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1179  				     "Property 'playback-codecs' missing or invalid\n");
e14657c0f0022e sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Ajye Huang                 2022-11-02  1180  
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1181  	headset_codec = of_get_child_by_name(dev->of_node, "headset-codec");
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1182  	if (!headset_codec) {
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1183  		of_node_put(playback_codec);
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1184  		return dev_err_probe(dev, -EINVAL,
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1185  				     "Property 'headset-codec' missing or invalid\n");
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1186  	}
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1187  
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1188  	for_each_card_prelinks(card, i, dai_link) {
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1189  		ret = mt8186_mt6366_card_set_be_link(card, dai_link, playback_codec, "I2S3");
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1190  		if (ret) {
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1191  			dev_err_probe(dev, ret, "%s set playback_codec fail\n",
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1192  				      dai_link->name);
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1193  			break;
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1194  		}
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1195  
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1196  		ret = mt8186_mt6366_card_set_be_link(card, dai_link, headset_codec, "I2S0");
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1197  		if (ret) {
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1198  			dev_err_probe(dev, ret, "%s set headset_codec fail\n",
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1199  				      dai_link->name);
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1200  			break;
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1201  		}
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1202  
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1203  		ret = mt8186_mt6366_card_set_be_link(card, dai_link, headset_codec, "I2S1");
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1204  		if (ret) {
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1205  			dev_err_probe(dev, ret, "%s set headset_codec fail\n",
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1206  				      dai_link->name);
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1207  			break;
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1208  		}
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1209  	}
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1210  	of_node_put(headset_codec);
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1211  	of_node_put(playback_codec);
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1212  
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1213  	return ret;
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1214  }
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1215  
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1216  static int mt8186_mt6366_soc_card_probe(struct mtk_soc_card_data *soc_card_data, bool legacy)
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1217  {
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1218  	struct mtk_platform_card_data *card_data = soc_card_data->card_data;
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1219  	struct snd_soc_card *card = card_data->card;
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1220  	struct snd_soc_dai_link *dai_link;
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1221  	struct mt8186_mt6366_rt1019_rt5682s_priv *mach_priv;
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1222  	int i, ret;
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1223  
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1224  	mach_priv = devm_kzalloc(card->dev, sizeof(*mach_priv), GFP_KERNEL);
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1225  	if (!mach_priv)
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1226  		return -ENOMEM;
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1227  
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1228  	soc_card_data->mach_priv = mach_priv;
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1229  
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1230  	mach_priv->dmic_sel = devm_gpiod_get_optional(card->dev,
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1231  						      "dmic", GPIOD_OUT_LOW);
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1232  	if (IS_ERR(mach_priv->dmic_sel))
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1233  		return dev_err_probe(card->dev, PTR_ERR(mach_priv->dmic_sel),
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1234  				     "DMIC gpio failed\n");
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1235  
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1236  	for_each_card_prelinks(card, i, dai_link) {
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1237  		if (strcmp(dai_link->name, "I2S0") == 0 ||
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1238  		    strcmp(dai_link->name, "I2S1") == 0 ||
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1239  		    strcmp(dai_link->name, "I2S2") == 0) {
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1240  			if (card_data->flags & DA7219_CODEC_PRESENT) {
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1241  				dai_link->be_hw_params_fixup = mt8186_i2s_hw_params_32le_fixup;
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1242  				dai_link->ops = &mt8186_da7219_i2s_ops;
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1243  			} else {
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1244  				dai_link->be_hw_params_fixup = mt8186_i2s_hw_params_24le_fixup;
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1245  				dai_link->ops = &mt8186_rt5682s_i2s_ops;
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1246  			}
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1247  		} else if (strcmp(dai_link->name, "I2S3") == 0) {
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1248  			if (card_data->flags & DA7219_CODEC_PRESENT)
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1249  				dai_link->be_hw_params_fixup = mt8186_i2s_hw_params_24le_fixup;
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1250  			else
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1251  				dai_link->be_hw_params_fixup = mt8186_i2s_hw_params_32le_fixup;
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1252  		}
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1253  	}
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1254  
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1255  	if (legacy) {
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1256  		ret = mt8186_mt6366_legacy_probe(soc_card_data);
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1257  		if (ret)
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1258  			return ret;
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1259  	}
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1260  
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1261  	ret = mt8186_afe_gpio_init(card->dev);
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1262  	if (ret)
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1263  		return dev_err_probe(card->dev, ret, "init AFE gpio error\n");
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1264  
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1265  	return 0;
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1266  }
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1267  
f103ce4ff6932b sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1268  static const unsigned int mt8186_pcm_playback_channels[] = { 2 };
f103ce4ff6932b sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1269  static const unsigned int mt8186_pcm_capture_channels[] = { 1, 2 };
f103ce4ff6932b sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1270  static const unsigned int mt8186_pcm_rates[] = { 48000 };
f103ce4ff6932b sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1271  
f103ce4ff6932b sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1272  static const struct snd_pcm_hw_constraint_list mt8186_rate_constraint = {
f103ce4ff6932b sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1273  	.list = mt8186_pcm_rates,
f103ce4ff6932b sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1274  	.count = ARRAY_SIZE(mt8186_pcm_rates)
f103ce4ff6932b sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1275  };
f103ce4ff6932b sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1276  
f103ce4ff6932b sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1277  static const struct mtk_pcm_constraints_data mt8186_pcm_constraints[MTK_CONSTRAINT_CAPTURE + 1] = {
f103ce4ff6932b sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1278  	[MTK_CONSTRAINT_PLAYBACK] = {
f103ce4ff6932b sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1279  		.channels = &(const struct snd_pcm_hw_constraint_list) {
f103ce4ff6932b sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1280  			.list = mt8186_pcm_playback_channels,
f103ce4ff6932b sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1281  			.count = ARRAY_SIZE(mt8186_pcm_playback_channels)
f103ce4ff6932b sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1282  		},
f103ce4ff6932b sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1283  		.rates = &mt8186_rate_constraint,
f103ce4ff6932b sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1284  	},
f103ce4ff6932b sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1285  	[MTK_CONSTRAINT_CAPTURE] = {
f103ce4ff6932b sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1286  		.channels = &(const struct snd_pcm_hw_constraint_list) {
f103ce4ff6932b sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1287  			.list = mt8186_pcm_capture_channels,
f103ce4ff6932b sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1288  			.count = ARRAY_SIZE(mt8186_pcm_capture_channels)
f103ce4ff6932b sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1289  		},
f103ce4ff6932b sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1290  		.rates = &mt8186_rate_constraint,
f103ce4ff6932b sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1291  	}
f103ce4ff6932b sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1292  };
f103ce4ff6932b sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1293  
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1294  static const struct mtk_sof_priv mt8186_sof_priv = {
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1295  	.conn_streams = g_sof_conn_streams,
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1296  	.num_streams = ARRAY_SIZE(g_sof_conn_streams),
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1297  	.sof_dai_link_fixup = mt8186_sof_dai_link_fixup
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1298  };
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1299  
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1300  static const struct mtk_soundcard_pdata mt8186_mt6366_da7219_max98357_pdata = {
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1301  	.card_data = &(struct mtk_platform_card_data) {
cc97e5ee4f734c sound/soc/mediatek/mt8186/mt8186-mt6366.c                Kuninori Morimoto          2026-05-18  1302  		.card_platform = &mt8186_mt6366_da7219_max98357_soc_card,
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16 @1303  		.num_jacks = MT8186_JACK_MAX,
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1304  		.pcm_constraints = mt8186_pcm_constraints,
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1305  		.num_pcm_constraints = ARRAY_SIZE(mt8186_pcm_constraints),
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1306  		.flags = DA7219_CODEC_PRESENT,
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1307  	},
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1308  	.sof_priv = &mt8186_sof_priv,
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1309  	.soc_probe = mt8186_mt6366_soc_card_probe
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1310  };
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1311  

:::::: The code at line 1303 was first introduced by commit
:::::: 6ed619b348bf0a490e70dea7a330cf44dc81c16d ASoC: mediatek: mt8186: Unify mt8186-mt6366 machine drivers

:::::: TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
