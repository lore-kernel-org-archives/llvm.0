Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A9634752D;
	Thu, 10 Sep 2026 05:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789019140; cv=none; b=lEYrwI0rEzC+F8ZKGG2gaxEbR3DYbJj0Ixq1/XakGYY48jHJV3FpqmMmVVdGtb4KKSxGd+ka0PG4ICM17eVRLxMolDt6sflbPIR99LnCfjYUMR+0+t+/C0EAahsdFqhFVxtlUSeOSMSo/tPAeTY22wcxdZGUDBUTZ60QFSbg1tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789019140; c=relaxed/simple;
	bh=QZkymt7/O+KqPkeaScDqQ7IvxICTSV8hCwPeJ8ekLZU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pJwUAEzEkr8f2VvsuXbCvn5Pkm5E4rgMrNLz9KlVsf4Uqlgfvy1ubxd38bX6bTOv71hnxwn+NUkJTWjnmKZoRV1T/2LOYRBm5g8Ib+DzzwFSAEwvlHhqmMOTdF3RliP25wq0CObJK4CQ8S5YGxqTCTkMyu8/8XKlE10yl5g+RvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A772cyx4; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A772cyx4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789019138; x=1820555138;
  h=date:from:to:cc:subject:message-id;
  bh=QZkymt7/O+KqPkeaScDqQ7IvxICTSV8hCwPeJ8ekLZU=;
  b=A772cyx4jMsX5CdBqGd+O3/ZldQKHmy8OrZ8amZu81JJnWSD+EpM47lj
   6nBeZXINDyFEzRMTrHKybxdrzpL/h3UpzPiVp9JrPRuGCbWtwT9wrK5JM
   2bcJCmR1SDQhLhmoT/pWOctYVBgtMavGdT836KKtEKBvWgLmsOQtHyiSY
   tNWup6JW0rGqxqeSYiCdctHMJa/j7nPwuA5H6T0TcN+x1/SLOxaGJuwxx
   5jtdykB+/Teuedf8MVp/x54CCIKKeHZBfp3zxMp44ZaNKJaga5c/qFZ7v
   YptzxFZ5FrYfKBe72fzxyvDK13nvEfbL2FGMTvGa1HqcQCj6QbQt3L1z1
   w==;
X-CSE-ConnectionGUID: +wZIvndqQuWtl1xVf3ExcA==
X-CSE-MsgGUID: uxlY5BVeRcSoS7H4zYqfpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89474547"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="89474547"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 22:45:38 -0700
X-CSE-ConnectionGUID: sJPYhOMEQ7aAn/cs26y88w==
X-CSE-MsgGUID: 8SH+ST19RK6HL/nz0sMjkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="267240945"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Sep 2026 22:45:36 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4XbJ-000000001QK-2yOA;
	Thu, 10 Sep 2026 05:45:33 +0000
Date: Thu, 10 Sep 2026 13:44:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-09-04 266/343]
 sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:86:6: error: incomplete
 definition of type 'struct snd_soc_card'
Message-ID: <202609101331.nnc3ILxg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-09-04
head:   dfa282dfe99643be782149d948208f3d514ebb99
commit: 90917afe259f4da802e7a1bdc3771d74b7534a63 [266/343] ASoC: move struct snd_soc_card/snd_soc_card_driver to soc-card.[hc]
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260910/202609101331.nnc3ILxg-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609101331.nnc3ILxg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609101331.nnc3ILxg-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:79:36: error: call to undeclared function 'snd_soc_card_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      79 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:79:30: error: incompatible integer to pointer conversion initializing 'struct asoc_sdw_mc_private *' with an expression of type 'int' [-Wint-conversion]
      79 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                     ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:85:17: error: incomplete definition of type 'struct snd_soc_dai'
      85 |         component = dai->component;
         |                     ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
>> sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:86:6: error: incomplete definition of type 'struct snd_soc_card'
      86 |         card->components = devm_kasprintf(card->dev, GFP_KERNEL,
         |         ~~~~^
   include/sound/soc.h:417:8: note: forward declaration of 'struct snd_soc_card'
     417 | struct snd_soc_card;
         |        ^
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:86:40: error: incomplete definition of type 'struct snd_soc_card'
      86 |         card->components = devm_kasprintf(card->dev, GFP_KERNEL,
         |                                           ~~~~^
   include/sound/soc.h:417:8: note: forward declaration of 'struct snd_soc_card'
     417 | struct snd_soc_card;
         |        ^
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:88:12: error: incomplete definition of type 'struct snd_soc_card'
      88 |                                           card->components, component->name_prefix);
         |                                           ~~~~^
   include/sound/soc.h:417:8: note: forward declaration of 'struct snd_soc_card'
     417 | struct snd_soc_card;
         |        ^
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:88:35: error: incomplete definition of type 'struct snd_soc_component'
      88 |                                           card->components, component->name_prefix);
         |                                                             ~~~~~~~~~^
   include/sound/soc.h:422:8: note: forward declaration of 'struct snd_soc_component'
     422 | struct snd_soc_component;
         |        ^
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:89:11: error: incomplete definition of type 'struct snd_soc_card'
      89 |         if (!card->components)
         |              ~~~~^
   include/sound/soc.h:417:8: note: forward declaration of 'struct snd_soc_card'
     417 | struct snd_soc_card;
         |        ^
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:93:24: error: incomplete definition of type 'struct snd_soc_component'
      93 |                 if (!strstr(component->name_prefix, need_sdca_suffix[i]))
         |                             ~~~~~~~~~^
   include/sound/soc.h:422:8: note: forward declaration of 'struct snd_soc_component'
     422 | struct snd_soc_component;
         |        ^
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:96:7: error: incomplete definition of type 'struct snd_soc_card'
      96 |                 card->components = devm_kasprintf(card->dev, GFP_KERNEL,
         |                 ~~~~^
   include/sound/soc.h:417:8: note: forward declaration of 'struct snd_soc_card'
     417 | struct snd_soc_card;
         |        ^
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:96:41: error: incomplete definition of type 'struct snd_soc_card'
      96 |                 card->components = devm_kasprintf(card->dev, GFP_KERNEL,
         |                                                   ~~~~^
   include/sound/soc.h:417:8: note: forward declaration of 'struct snd_soc_card'
     417 | struct snd_soc_card;
         |        ^
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:97:24: error: incomplete definition of type 'struct snd_soc_card'
      97 |                                                   "%s-sdca", card->components);
         |                                                              ~~~~^
   include/sound/soc.h:417:8: note: forward declaration of 'struct snd_soc_card'
     417 | struct snd_soc_card;
         |        ^
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:98:12: error: incomplete definition of type 'struct snd_soc_card'
      98 |                 if (!card->components)
         |                      ~~~~^
   include/sound/soc.h:417:8: note: forward declaration of 'struct snd_soc_card'
     417 | struct snd_soc_card;
         |        ^
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:104:16: error: incomplete definition of type 'struct snd_soc_card'
     104 |                         dev_err(card->dev,
         |                                 ~~~~^
   include/sound/soc.h:417:8: note: forward declaration of 'struct snd_soc_card'
     417 | struct snd_soc_card;
         |        ^
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:112:15: error: incomplete definition of type 'struct snd_soc_card'
     112 |                 dev_err(card->dev, "%s is not supported\n", component->name_prefix);
         |                         ~~~~^
   include/sound/soc.h:417:8: note: forward declaration of 'struct snd_soc_card'
     417 | struct snd_soc_card;
         |        ^
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:112:56: error: incomplete definition of type 'struct snd_soc_component'
     112 |                 dev_err(card->dev, "%s is not supported\n", component->name_prefix);
         |                                                             ~~~~~~~~~^
   include/sound/soc.h:422:8: note: forward declaration of 'struct snd_soc_component'
     422 | struct snd_soc_component;
         |        ^
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:124:20: error: incomplete definition of type 'struct snd_soc_card'
     124 |                 dev_err(rtd->card->dev, "Headset Jack creation failed: %d\n",
         |                         ~~~~~~~~~^
   include/linux/dev_printk.h:154:44: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                   ^~~
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   include/sound/soc.h:417:8: note: forward declaration of 'struct snd_soc_card'
     417 | struct snd_soc_card;
         |        ^
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:139:20: error: incomplete definition of type 'struct snd_soc_card'
     139 |                 dev_err(rtd->card->dev, "Headset Jack call-back failed: %d\n",
         |                         ~~~~~~~~~^
   include/linux/dev_printk.h:154:44: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                   ^~~
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   include/sound/soc.h:417:8: note: forward declaration of 'struct snd_soc_card'
     417 | struct snd_soc_card;
--
   sound/soc/sdw_utils/soc_sdw_senary_dmic.c:26:17: error: incomplete definition of type 'struct snd_soc_dai'
      26 |         component = dai->component;
         |                     ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
>> sound/soc/sdw_utils/soc_sdw_senary_dmic.c:31:15: error: incomplete definition of type 'struct snd_soc_card'
      31 |                 dev_err(card->dev, "senary dmic map addition failed: %d\n", ret);
         |                         ~~~~^
   include/sound/soc.h:417:8: note: forward declaration of 'struct snd_soc_card'
     417 | struct snd_soc_card;
         |        ^
   sound/soc/sdw_utils/soc_sdw_senary_dmic.c:35:32: error: incomplete definition of type 'struct snd_soc_card'
      35 |         mic_name = devm_kasprintf(card->dev, GFP_KERNEL, "%s", component->name_prefix);
         |                                   ~~~~^
   include/sound/soc.h:417:8: note: forward declaration of 'struct snd_soc_card'
     417 | struct snd_soc_card;
         |        ^
   sound/soc/sdw_utils/soc_sdw_senary_dmic.c:35:66: error: incomplete definition of type 'struct snd_soc_component'
      35 |         mic_name = devm_kasprintf(card->dev, GFP_KERNEL, "%s", component->name_prefix);
         |                                                                ~~~~~~~~~^
   include/sound/soc.h:422:8: note: forward declaration of 'struct snd_soc_component'
     422 | struct snd_soc_component;
         |        ^
   sound/soc/sdw_utils/soc_sdw_senary_dmic.c:39:6: error: incomplete definition of type 'struct snd_soc_card'
      39 |         card->components = devm_kasprintf(card->dev, GFP_KERNEL,
         |         ~~~~^
   include/sound/soc.h:417:8: note: forward declaration of 'struct snd_soc_card'
     417 | struct snd_soc_card;
         |        ^
   sound/soc/sdw_utils/soc_sdw_senary_dmic.c:39:40: error: incomplete definition of type 'struct snd_soc_card'
      39 |         card->components = devm_kasprintf(card->dev, GFP_KERNEL,
         |                                           ~~~~^
   include/sound/soc.h:417:8: note: forward declaration of 'struct snd_soc_card'
     417 | struct snd_soc_card;
         |        ^
   sound/soc/sdw_utils/soc_sdw_senary_dmic.c:40:30: error: incomplete definition of type 'struct snd_soc_card'
      40 |                                           "%s mic:%s-dmic", card->components,
         |                                                             ~~~~^
   include/sound/soc.h:417:8: note: forward declaration of 'struct snd_soc_card'
     417 | struct snd_soc_card;
         |        ^
   sound/soc/sdw_utils/soc_sdw_senary_dmic.c:42:11: error: incomplete definition of type 'struct snd_soc_card'
      42 |         if (!card->components)
         |              ~~~~^
   include/sound/soc.h:417:8: note: forward declaration of 'struct snd_soc_card'
     417 | struct snd_soc_card;
         |        ^
   sound/soc/sdw_utils/soc_sdw_senary_dmic.c:45:14: error: incomplete definition of type 'struct snd_soc_card'
      45 |         dev_dbg(card->dev, "card->components: %s\n", card->components);
         |                 ~~~~^
   include/sound/soc.h:417:8: note: forward declaration of 'struct snd_soc_card'
     417 | struct snd_soc_card;
         |        ^
   sound/soc/sdw_utils/soc_sdw_senary_dmic.c:45:51: error: incomplete definition of type 'struct snd_soc_card'
      45 |         dev_dbg(card->dev, "card->components: %s\n", card->components);
         |                                                      ~~~~^
   include/sound/soc.h:417:8: note: forward declaration of 'struct snd_soc_card'
     417 | struct snd_soc_card;
         |        ^
   10 errors generated.


vim +86 sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c

77272ecd96d73a Qianghua Wang 2026-09-01   74  
77272ecd96d73a Qianghua Wang 2026-09-01   75  int asoc_sdw_senary_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
77272ecd96d73a Qianghua Wang 2026-09-01   76  {
77272ecd96d73a Qianghua Wang 2026-09-01   77  	struct snd_soc_card *card = rtd->card;
77272ecd96d73a Qianghua Wang 2026-09-01   78  	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
77272ecd96d73a Qianghua Wang 2026-09-01   79  	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
77272ecd96d73a Qianghua Wang 2026-09-01   80  	struct snd_soc_component *component;
77272ecd96d73a Qianghua Wang 2026-09-01   81  	struct snd_soc_jack *jack;
77272ecd96d73a Qianghua Wang 2026-09-01   82  	int ret;
77272ecd96d73a Qianghua Wang 2026-09-01   83  	int i;
77272ecd96d73a Qianghua Wang 2026-09-01   84  
77272ecd96d73a Qianghua Wang 2026-09-01   85  	component = dai->component;
77272ecd96d73a Qianghua Wang 2026-09-01  @86  	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
77272ecd96d73a Qianghua Wang 2026-09-01   87  					  "%s hs:%s",
77272ecd96d73a Qianghua Wang 2026-09-01   88  					  card->components, component->name_prefix);
77272ecd96d73a Qianghua Wang 2026-09-01   89  	if (!card->components)
77272ecd96d73a Qianghua Wang 2026-09-01   90  		return -ENOMEM;
77272ecd96d73a Qianghua Wang 2026-09-01   91  
77272ecd96d73a Qianghua Wang 2026-09-01   92  	for (i = 0; i < ARRAY_SIZE(need_sdca_suffix); i++) {
77272ecd96d73a Qianghua Wang 2026-09-01   93  		if (!strstr(component->name_prefix, need_sdca_suffix[i]))
77272ecd96d73a Qianghua Wang 2026-09-01   94  			continue;
77272ecd96d73a Qianghua Wang 2026-09-01   95  
77272ecd96d73a Qianghua Wang 2026-09-01   96  		card->components = devm_kasprintf(card->dev, GFP_KERNEL,
77272ecd96d73a Qianghua Wang 2026-09-01   97  						  "%s-sdca", card->components);
77272ecd96d73a Qianghua Wang 2026-09-01   98  		if (!card->components)
77272ecd96d73a Qianghua Wang 2026-09-01   99  			return -ENOMEM;
77272ecd96d73a Qianghua Wang 2026-09-01  100  
77272ecd96d73a Qianghua Wang 2026-09-01  101  		ret = snd_soc_dapm_add_routes(dapm, senary_sdca_jack_map,
77272ecd96d73a Qianghua Wang 2026-09-01  102  					      ARRAY_SIZE(senary_sdca_jack_map));
77272ecd96d73a Qianghua Wang 2026-09-01  103  		if (ret) {
77272ecd96d73a Qianghua Wang 2026-09-01  104  			dev_err(card->dev,
77272ecd96d73a Qianghua Wang 2026-09-01  105  				"senary sdca jack map addition failed: %d\n", ret);
77272ecd96d73a Qianghua Wang 2026-09-01  106  			return ret;
77272ecd96d73a Qianghua Wang 2026-09-01  107  		}
77272ecd96d73a Qianghua Wang 2026-09-01  108  		break;
77272ecd96d73a Qianghua Wang 2026-09-01  109  	}
77272ecd96d73a Qianghua Wang 2026-09-01  110  
77272ecd96d73a Qianghua Wang 2026-09-01  111  	if (i == ARRAY_SIZE(need_sdca_suffix)) {
77272ecd96d73a Qianghua Wang 2026-09-01  112  		dev_err(card->dev, "%s is not supported\n", component->name_prefix);
77272ecd96d73a Qianghua Wang 2026-09-01  113  		return -EINVAL;
77272ecd96d73a Qianghua Wang 2026-09-01  114  	}
77272ecd96d73a Qianghua Wang 2026-09-01  115  
77272ecd96d73a Qianghua Wang 2026-09-01  116  	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
77272ecd96d73a Qianghua Wang 2026-09-01  117  					 SND_JACK_HEADSET | SND_JACK_BTN_0 |
77272ecd96d73a Qianghua Wang 2026-09-01  118  					 SND_JACK_BTN_1 | SND_JACK_BTN_2 |
77272ecd96d73a Qianghua Wang 2026-09-01  119  					 SND_JACK_BTN_3,
77272ecd96d73a Qianghua Wang 2026-09-01  120  					 &ctx->sdw_headset,
77272ecd96d73a Qianghua Wang 2026-09-01  121  					 senary_sdca_jack_pins,
77272ecd96d73a Qianghua Wang 2026-09-01  122  					 ARRAY_SIZE(senary_sdca_jack_pins));
77272ecd96d73a Qianghua Wang 2026-09-01  123  	if (ret) {
77272ecd96d73a Qianghua Wang 2026-09-01  124  		dev_err(rtd->card->dev, "Headset Jack creation failed: %d\n",
77272ecd96d73a Qianghua Wang 2026-09-01  125  			ret);
77272ecd96d73a Qianghua Wang 2026-09-01  126  		return ret;
77272ecd96d73a Qianghua Wang 2026-09-01  127  	}
77272ecd96d73a Qianghua Wang 2026-09-01  128  
77272ecd96d73a Qianghua Wang 2026-09-01  129  	jack = &ctx->sdw_headset;
77272ecd96d73a Qianghua Wang 2026-09-01  130  
77272ecd96d73a Qianghua Wang 2026-09-01  131  	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
77272ecd96d73a Qianghua Wang 2026-09-01  132  	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
77272ecd96d73a Qianghua Wang 2026-09-01  133  	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
77272ecd96d73a Qianghua Wang 2026-09-01  134  	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
77272ecd96d73a Qianghua Wang 2026-09-01  135  
77272ecd96d73a Qianghua Wang 2026-09-01  136  	ret = snd_soc_component_set_jack(component, jack, NULL);
77272ecd96d73a Qianghua Wang 2026-09-01  137  
77272ecd96d73a Qianghua Wang 2026-09-01  138  	if (ret)
77272ecd96d73a Qianghua Wang 2026-09-01  139  		dev_err(rtd->card->dev, "Headset Jack call-back failed: %d\n",
77272ecd96d73a Qianghua Wang 2026-09-01  140  			ret);
77272ecd96d73a Qianghua Wang 2026-09-01  141  
77272ecd96d73a Qianghua Wang 2026-09-01  142  	return ret;
77272ecd96d73a Qianghua Wang 2026-09-01  143  }
77272ecd96d73a Qianghua Wang 2026-09-01  144  EXPORT_SYMBOL_NS(asoc_sdw_senary_sdca_jack_rtd_init, "SND_SOC_SDW_UTILS");
77272ecd96d73a Qianghua Wang 2026-09-01  145  

:::::: The code at line 86 was first introduced by commit
:::::: 77272ecd96d73a90ffc6d4f7939d16ce45303f5b ASoC: sdw_utils: add Senary SN624x helpers and codec_info

:::::: TO: Qianghua Wang <qianghua.wang@senarytech.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
