Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57862253950;
	Tue, 21 Apr 2026 03:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776742283; cv=none; b=fkShxdCHOqK7IQ2CQOz9jXKvalYxorsFruUGjW9FyCZChBEnxqhg0h9hzk16lPvLqNIUP9TUo84Z8iQbVoyD+I0nvqbVfEoB3o0RFaPtqyZ2ClP6yfsFwqKib7TGgZIlx/tGDQeLc/SyLosRH48atWlzNaF7m8nNdxvEce8x7aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776742283; c=relaxed/simple;
	bh=BxYw6IyDjc/GoW7Tb90cjX0thjMKyiSYAeJDNEwCMd0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Zy2Iw8m6vFw8ziGQPGaWcRNaKxhbNR1tUHD61lOL0xJaUNwu4fFnVNakr/BmHVT4Hez3GK5o0GM+IN2waAq0qXl7vYV8pYCUjOLyMKZqj+HrTdqqd15yaLjzLj0/PvoSY4cx3guTFhKBZLv79OWrcfL78v3OGF511qzfpmd0Kds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UwZ6or3P; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UwZ6or3P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776742282; x=1808278282;
  h=date:from:to:cc:subject:message-id;
  bh=BxYw6IyDjc/GoW7Tb90cjX0thjMKyiSYAeJDNEwCMd0=;
  b=UwZ6or3PDUDySz74qF+988e0CHZjSRml5HbDCfyeQ6/KHaNyWVK22wgZ
   DNVKV9sSIcsbMucSo9lPO9Fh+WSYv593qLyKtWeqaQGW+yVzxa4sqaGfd
   S5NiR9iLEVPMk72nkQLS5YLYGu/SWz/W0MZxzn+yiCa3WTbKNjVMXLBKD
   iSnZ1JwNt0mVVmmEH/eTGWbL7IHo6foTr82wIn9o6Zu/EsUOQ2cnuR8Lr
   lMKo31CTJt2RG0yblcS/WkV0GwwSzMJCw1KT2JB7wrt71OT6Aq3H8CqtO
   aXQ1oc0sOPjXtydDbqOuYD5cfocYkzha3JbyE+ntPnNVeOpEjveiT4VzS
   w==;
X-CSE-ConnectionGUID: 4dzQIy8jSKex5adQJhgFuw==
X-CSE-MsgGUID: HopZIJDeTyCh1Wve2kHjRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="88367414"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="88367414"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 20:31:22 -0700
X-CSE-ConnectionGUID: K4JXcVLaQEGlbpf6eMPabQ==
X-CSE-MsgGUID: EPOBB6THT1am8bkyRNBi0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="230869760"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Apr 2026 20:31:20 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wF1pV-000000003BQ-1hR4;
	Tue, 21 Apr 2026 03:31:17 +0000
Date: Tue, 21 Apr 2026 11:31:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-04-20 127/127]
 sound/soc/atmel/sam9x5_wm8731.c:95:21: warning: variable 'dai' is
 uninitialized when used here
Message-ID: <202604211119.8rdJyDuK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-04-20
head:   c0eca3aad838fa892c00ca5d3141b136aac51b91
commit: c0eca3aad838fa892c00ca5d3141b136aac51b91 [127/127] ASoC: atmel: sam9x5_wm8731: use snd_soc_card_register()
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260421/202604211119.8rdJyDuK-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260421/202604211119.8rdJyDuK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604211119.8rdJyDuK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/atmel/sam9x5_wm8731.c:95:21: warning: variable 'dai' is uninitialized when used here [-Wuninitialized]
      95 |         driver->dai_link = dai;
         |                            ^~~
   sound/soc/atmel/sam9x5_wm8731.c:79:30: note: initialize the variable 'dai' to silence this warning
      79 |         struct snd_soc_dai_link *dai;
         |                                     ^
         |                                      = NULL
   1 warning generated.


vim +/dai +95 sound/soc/atmel/sam9x5_wm8731.c

    72	
    73	static int sam9x5_wm8731_driver_probe(struct platform_device *pdev)
    74	{
    75		struct device_node *np = pdev->dev.of_node;
    76		struct device_node *codec_np, *cpu_np;
    77		struct snd_soc_card_driver *driver;
    78		struct snd_soc_card *card;
    79		struct snd_soc_dai_link *dai;
    80		struct sam9x5_drvdata *priv;
    81		struct snd_soc_dai_link_component *comp;
    82		int ret;
    83	
    84		if (!np) {
    85			dev_err(&pdev->dev, "No device node supplied\n");
    86			return -EINVAL;
    87		}
    88	
    89		driver = devm_kzalloc(&pdev->dev, sizeof(*driver), GFP_KERNEL);
    90		if (!driver) {
    91			ret = -ENOMEM;
    92			goto out;
    93		}
    94	
  > 95		driver->dai_link = dai;
    96		driver->num_links = 1;
    97		driver->dapm_widgets = sam9x5_dapm_widgets;
    98		driver->num_dapm_widgets = ARRAY_SIZE(sam9x5_dapm_widgets);
    99	
   100		card = devm_snd_soc_card_alloc(&pdev->dev, THIS_MODULE, driver,
   101					       NULL, NULL, NULL);
   102		priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
   103		dai = devm_kzalloc(&pdev->dev, sizeof(*dai), GFP_KERNEL);
   104		comp = devm_kzalloc(&pdev->dev, 3 * sizeof(*comp), GFP_KERNEL);
   105		if (!dai || !card || !priv || !comp) {
   106			ret = -ENOMEM;
   107			goto out;
   108		}
   109		snd_soc_card_attach_priv(card, priv);
   110	
   111		dai->cpus = &comp[0];
   112		dai->num_cpus = 1;
   113		dai->codecs = &comp[1];
   114		dai->num_codecs = 1;
   115		dai->platforms = &comp[2];
   116		dai->num_platforms = 1;
   117	
   118		dai->name = "WM8731";
   119		dai->stream_name = "WM8731 PCM";
   120		dai->codecs->dai_name = "wm8731-hifi";
   121		dai->init = sam9x5_wm8731_init;
   122		dai->dai_fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_NB_NF
   123			| SND_SOC_DAIFMT_CBP_CFP;
   124	
   125		ret = snd_soc_of_parse_card_name(card, "atmel,model");
   126		if (ret) {
   127			dev_err(&pdev->dev, "atmel,model node missing\n");
   128			goto out;
   129		}
   130	
   131		ret = snd_soc_of_parse_audio_routing(card, "atmel,audio-routing");
   132		if (ret) {
   133			dev_err(&pdev->dev, "atmel,audio-routing node missing\n");
   134			goto out;
   135		}
   136	
   137		codec_np = of_parse_phandle(np, "atmel,audio-codec", 0);
   138		if (!codec_np) {
   139			dev_err(&pdev->dev, "atmel,audio-codec node missing\n");
   140			ret = -EINVAL;
   141			goto out;
   142		}
   143	
   144		dai->codecs->of_node = codec_np;
   145	
   146		cpu_np = of_parse_phandle(np, "atmel,ssc-controller", 0);
   147		if (!cpu_np) {
   148			dev_err(&pdev->dev, "atmel,ssc-controller node missing\n");
   149			ret = -EINVAL;
   150			goto out_put_codec_np;
   151		}
   152		dai->cpus->of_node = cpu_np;
   153		dai->platforms->of_node = cpu_np;
   154	
   155		priv->ssc_id = of_alias_get_id(cpu_np, "ssc");
   156	
   157		ret = atmel_ssc_set_audio(priv->ssc_id);
   158		if (ret != 0) {
   159			dev_err(&pdev->dev, "Failed to set SSC %d for audio: %d\n",
   160				ret, priv->ssc_id);
   161			goto out_put_cpu_np;
   162		}
   163	
   164		ret = devm_snd_soc_card_register(card);
   165		if (ret) {
   166			dev_err(&pdev->dev, "Platform device allocation failed\n");
   167			goto out_put_audio;
   168		}
   169	
   170		dev_dbg(&pdev->dev, "%s ok\n", __func__);
   171	
   172		goto out_put_cpu_np;
   173	
   174	out_put_audio:
   175		atmel_ssc_put_audio(priv->ssc_id);
   176	out_put_cpu_np:
   177		of_node_put(cpu_np);
   178	out_put_codec_np:
   179		of_node_put(codec_np);
   180	out:
   181		return ret;
   182	}
   183	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
