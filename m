Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D7C381AFB;
	Thu, 10 Sep 2026 02:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789008861; cv=none; b=AxU6do7V6GoGp/7WOqB/f1hshiqz2Ax+Lq0blQ/qweFw9kjf/bwKC8TDTlBhy//d+jRFXvRMAv+JmqHCPIX1Bm7ZLHNj2TjaEVa7dlnWmgPQn/rP0j2lXpoJHKd7HJMJqiCBLVoKzysTLUEfdSEA9wTvJ5vb9ac0EApn/GwWgj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789008861; c=relaxed/simple;
	bh=C6Jc5eqnf/8H8AjbyhL/+6LQdET6OV+4LLLS6tuFkZ8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SussMHlCXKtbWmMVZFBESRJKetVTBmDfIMXkYKLhcTUbDoZyC1fRsBhvvt0Q4tZiBrePEcQbeFxROxkEQOE3dALsmzaYNGEKnrQ1q5MEukQzB3qnJin2B/4qra0uS4b94NkEIIj9FNT1VlzHiqoHbu+sg3DEBHa3qxQ+uZvmQ4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NVVE58OE; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NVVE58OE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789008859; x=1820544859;
  h=date:from:to:cc:subject:message-id;
  bh=C6Jc5eqnf/8H8AjbyhL/+6LQdET6OV+4LLLS6tuFkZ8=;
  b=NVVE58OEIPIJgoMcvfIzaBT7iWeGhn5eWgCw6A8j2UDW05GBw98PZyNI
   up96GoCkQs24bbhSQZbY6vHXwbz2ZxMzGmZqz7tHWmVNYE72lLtIWfjHx
   VYOchGfxC10eSInXgSV18RlYZTRU/WPFSzuCsZwlTuPGn5DkUKPrVwqNr
   R2sFKMygnAvFy+BJz2+7SOwU61I0SqCOKbxWfwUxJxMk9zZiZMzJV5kIu
   mTwv0Unnm9tS9l5gHvQFPxMZD8PfH4+PnvNm0QKmz1lSi3lciVWIbgLPz
   6tDlSBxaQyGa6N+8v+HjGnaLYRan7eoNU9iR+mVHJH/y0TYiv9umrNY/Z
   w==;
X-CSE-ConnectionGUID: K4KdS4u0Qi6vUucNoOg8dA==
X-CSE-MsgGUID: ApCWM+pwQ2e6Dp8pduXP7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="106818216"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="106818216"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 19:54:19 -0700
X-CSE-ConnectionGUID: CSAacqFwTBS08QgBIPx2qA==
X-CSE-MsgGUID: EJPknACySJ6WZ5lH18SP2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="271015333"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Sep 2026 19:54:17 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4UvW-000000001IK-49J9;
	Thu, 10 Sep 2026 02:54:14 +0000
Date: Thu, 10 Sep 2026 10:53:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-09-04 265/343]
 sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:79:36: error: call to
 undeclared function 'snd_soc_card_get_drvdata'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202609101046.H3n8Zm20-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-09-04
head:   dfa282dfe99643be782149d948208f3d514ebb99
commit: 9d6fae1badfb21786797586c01016e4413a98c3a [265/343] ASoC: soc-card.h: remove compatible definition
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260910/202609101046.H3n8Zm20-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609101046.H3n8Zm20-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609101046.H3n8Zm20-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:79:36: error: call to undeclared function 'snd_soc_card_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      79 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^
>> sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:79:30: error: incompatible integer to pointer conversion initializing 'struct asoc_sdw_mc_private *' with an expression of type 'int' [-Wint-conversion]
      79 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                     ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:85:17: error: incomplete definition of type 'struct snd_soc_dai'
      85 |         component = dai->component;
         |                     ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:88:35: error: incomplete definition of type 'struct snd_soc_component'
      88 |                                           card->components, component->name_prefix);
         |                                                             ~~~~~~~~~^
   include/sound/soc.h:422:8: note: forward declaration of 'struct snd_soc_component'
     422 | struct snd_soc_component;
         |        ^
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:93:24: error: incomplete definition of type 'struct snd_soc_component'
      93 |                 if (!strstr(component->name_prefix, need_sdca_suffix[i]))
         |                             ~~~~~~~~~^
   include/sound/soc.h:422:8: note: forward declaration of 'struct snd_soc_component'
     422 | struct snd_soc_component;
         |        ^
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:112:56: error: incomplete definition of type 'struct snd_soc_component'
     112 |                 dev_err(card->dev, "%s is not supported\n", component->name_prefix);
         |                                                             ~~~~~~~~~^
   include/sound/soc.h:422:8: note: forward declaration of 'struct snd_soc_component'
     422 | struct snd_soc_component;
         |        ^
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:148:36: error: call to undeclared function 'snd_soc_card_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     148 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:148:30: error: incompatible integer to pointer conversion initializing 'struct asoc_sdw_mc_private *' with an expression of type 'int' [-Wint-conversion]
     148 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                     ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:173:36: error: call to undeclared function 'snd_soc_card_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     173 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:173:30: error: incompatible integer to pointer conversion initializing 'struct asoc_sdw_mc_private *' with an expression of type 'int' [-Wint-conversion]
     173 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                     ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   10 errors generated.
--
>> sound/soc/sdw_utils/soc_sdw_senary_amp.c:23:36: error: call to undeclared function 'snd_soc_card_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      23 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^
>> sound/soc/sdw_utils/soc_sdw_senary_amp.c:23:30: error: incompatible integer to pointer conversion initializing 'struct asoc_sdw_mc_private *' with an expression of type 'int' [-Wint-conversion]
      23 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                     ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sdw_utils/soc_sdw_senary_amp.c:44:36: error: call to undeclared function 'snd_soc_card_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      44 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^
   sound/soc/sdw_utils/soc_sdw_senary_amp.c:44:30: error: incompatible integer to pointer conversion initializing 'struct asoc_sdw_mc_private *' with an expression of type 'int' [-Wint-conversion]
      44 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                     ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +/snd_soc_card_get_drvdata +79 sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c

77272ecd96d73a9 Qianghua Wang 2026-09-01   74  
77272ecd96d73a9 Qianghua Wang 2026-09-01   75  int asoc_sdw_senary_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
77272ecd96d73a9 Qianghua Wang 2026-09-01   76  {
77272ecd96d73a9 Qianghua Wang 2026-09-01   77  	struct snd_soc_card *card = rtd->card;
77272ecd96d73a9 Qianghua Wang 2026-09-01   78  	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
77272ecd96d73a9 Qianghua Wang 2026-09-01  @79  	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
77272ecd96d73a9 Qianghua Wang 2026-09-01   80  	struct snd_soc_component *component;
77272ecd96d73a9 Qianghua Wang 2026-09-01   81  	struct snd_soc_jack *jack;
77272ecd96d73a9 Qianghua Wang 2026-09-01   82  	int ret;
77272ecd96d73a9 Qianghua Wang 2026-09-01   83  	int i;
77272ecd96d73a9 Qianghua Wang 2026-09-01   84  
77272ecd96d73a9 Qianghua Wang 2026-09-01   85  	component = dai->component;
77272ecd96d73a9 Qianghua Wang 2026-09-01   86  	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
77272ecd96d73a9 Qianghua Wang 2026-09-01   87  					  "%s hs:%s",
77272ecd96d73a9 Qianghua Wang 2026-09-01   88  					  card->components, component->name_prefix);
77272ecd96d73a9 Qianghua Wang 2026-09-01   89  	if (!card->components)
77272ecd96d73a9 Qianghua Wang 2026-09-01   90  		return -ENOMEM;
77272ecd96d73a9 Qianghua Wang 2026-09-01   91  
77272ecd96d73a9 Qianghua Wang 2026-09-01   92  	for (i = 0; i < ARRAY_SIZE(need_sdca_suffix); i++) {
77272ecd96d73a9 Qianghua Wang 2026-09-01   93  		if (!strstr(component->name_prefix, need_sdca_suffix[i]))
77272ecd96d73a9 Qianghua Wang 2026-09-01   94  			continue;
77272ecd96d73a9 Qianghua Wang 2026-09-01   95  
77272ecd96d73a9 Qianghua Wang 2026-09-01   96  		card->components = devm_kasprintf(card->dev, GFP_KERNEL,
77272ecd96d73a9 Qianghua Wang 2026-09-01   97  						  "%s-sdca", card->components);
77272ecd96d73a9 Qianghua Wang 2026-09-01   98  		if (!card->components)
77272ecd96d73a9 Qianghua Wang 2026-09-01   99  			return -ENOMEM;
77272ecd96d73a9 Qianghua Wang 2026-09-01  100  
77272ecd96d73a9 Qianghua Wang 2026-09-01  101  		ret = snd_soc_dapm_add_routes(dapm, senary_sdca_jack_map,
77272ecd96d73a9 Qianghua Wang 2026-09-01  102  					      ARRAY_SIZE(senary_sdca_jack_map));
77272ecd96d73a9 Qianghua Wang 2026-09-01  103  		if (ret) {
77272ecd96d73a9 Qianghua Wang 2026-09-01  104  			dev_err(card->dev,
77272ecd96d73a9 Qianghua Wang 2026-09-01  105  				"senary sdca jack map addition failed: %d\n", ret);
77272ecd96d73a9 Qianghua Wang 2026-09-01  106  			return ret;
77272ecd96d73a9 Qianghua Wang 2026-09-01  107  		}
77272ecd96d73a9 Qianghua Wang 2026-09-01  108  		break;
77272ecd96d73a9 Qianghua Wang 2026-09-01  109  	}
77272ecd96d73a9 Qianghua Wang 2026-09-01  110  
77272ecd96d73a9 Qianghua Wang 2026-09-01  111  	if (i == ARRAY_SIZE(need_sdca_suffix)) {
77272ecd96d73a9 Qianghua Wang 2026-09-01  112  		dev_err(card->dev, "%s is not supported\n", component->name_prefix);
77272ecd96d73a9 Qianghua Wang 2026-09-01  113  		return -EINVAL;
77272ecd96d73a9 Qianghua Wang 2026-09-01  114  	}
77272ecd96d73a9 Qianghua Wang 2026-09-01  115  
77272ecd96d73a9 Qianghua Wang 2026-09-01  116  	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
77272ecd96d73a9 Qianghua Wang 2026-09-01  117  					 SND_JACK_HEADSET | SND_JACK_BTN_0 |
77272ecd96d73a9 Qianghua Wang 2026-09-01  118  					 SND_JACK_BTN_1 | SND_JACK_BTN_2 |
77272ecd96d73a9 Qianghua Wang 2026-09-01  119  					 SND_JACK_BTN_3,
77272ecd96d73a9 Qianghua Wang 2026-09-01  120  					 &ctx->sdw_headset,
77272ecd96d73a9 Qianghua Wang 2026-09-01  121  					 senary_sdca_jack_pins,
77272ecd96d73a9 Qianghua Wang 2026-09-01  122  					 ARRAY_SIZE(senary_sdca_jack_pins));
77272ecd96d73a9 Qianghua Wang 2026-09-01  123  	if (ret) {
77272ecd96d73a9 Qianghua Wang 2026-09-01  124  		dev_err(rtd->card->dev, "Headset Jack creation failed: %d\n",
77272ecd96d73a9 Qianghua Wang 2026-09-01  125  			ret);
77272ecd96d73a9 Qianghua Wang 2026-09-01  126  		return ret;
77272ecd96d73a9 Qianghua Wang 2026-09-01  127  	}
77272ecd96d73a9 Qianghua Wang 2026-09-01  128  
77272ecd96d73a9 Qianghua Wang 2026-09-01  129  	jack = &ctx->sdw_headset;
77272ecd96d73a9 Qianghua Wang 2026-09-01  130  
77272ecd96d73a9 Qianghua Wang 2026-09-01  131  	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
77272ecd96d73a9 Qianghua Wang 2026-09-01  132  	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
77272ecd96d73a9 Qianghua Wang 2026-09-01  133  	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
77272ecd96d73a9 Qianghua Wang 2026-09-01  134  	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
77272ecd96d73a9 Qianghua Wang 2026-09-01  135  
77272ecd96d73a9 Qianghua Wang 2026-09-01  136  	ret = snd_soc_component_set_jack(component, jack, NULL);
77272ecd96d73a9 Qianghua Wang 2026-09-01  137  
77272ecd96d73a9 Qianghua Wang 2026-09-01  138  	if (ret)
77272ecd96d73a9 Qianghua Wang 2026-09-01  139  		dev_err(rtd->card->dev, "Headset Jack call-back failed: %d\n",
77272ecd96d73a9 Qianghua Wang 2026-09-01  140  			ret);
77272ecd96d73a9 Qianghua Wang 2026-09-01  141  
77272ecd96d73a9 Qianghua Wang 2026-09-01  142  	return ret;
77272ecd96d73a9 Qianghua Wang 2026-09-01  143  }
77272ecd96d73a9 Qianghua Wang 2026-09-01  144  EXPORT_SYMBOL_NS(asoc_sdw_senary_sdca_jack_rtd_init, "SND_SOC_SDW_UTILS");
77272ecd96d73a9 Qianghua Wang 2026-09-01  145  

:::::: The code at line 79 was first introduced by commit
:::::: 77272ecd96d73a90ffc6d4f7939d16ce45303f5b ASoC: sdw_utils: add Senary SN624x helpers and codec_info

:::::: TO: Qianghua Wang <qianghua.wang@senarytech.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
