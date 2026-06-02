Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C1E3EA66;
	Tue,  2 Jun 2026 00:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780359795; cv=none; b=RVmKfSlmm8EtqVmPFpXxJu9l8i6iYytyzMmkD5va1DbBa0oNHQzN909BdbuxuDtcJGZD6brv3PT2UpqZcGoR9jmdZ2EzbLpkjHG7GHIufQPabfyomYaAbCxhe7X3xxOUrydDw22R5Lq2tTKHAazlbWYAT9fcCCJVI2dg4r8xcQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780359795; c=relaxed/simple;
	bh=u2xx1Shy0HQ/a3hcG/QT41eGAoDfQrEhO0JI3Swj37g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RZMEl6bBEDXo4vEfJTXOAYHUIQxYHHhd2oS5qdJMXPqrKjq0TvKal4IePPYXzDBuChWv6D0Vje8jLz1Ivx2PI6aAylqz/k0+49YxVIAbe4FhwO1vRctcG5wE0D6C1bbfBUaMpq+qRUWNz+utoGqViXIEEt6L907Hw5UGzbwdsdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cLdjEAIu; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cLdjEAIu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780359794; x=1811895794;
  h=date:from:to:cc:subject:message-id;
  bh=u2xx1Shy0HQ/a3hcG/QT41eGAoDfQrEhO0JI3Swj37g=;
  b=cLdjEAIuAcp3zhVuo1prQhfn3028nSu2al36sDOiobxyg5SOb1C2GP0I
   ebLRrtNs6L2mHan48wxrUQrCRTWGmFYM6zZMKepuncSfCfjmZgzVOHRoR
   ByJEGdxiM9fE03PCwbYhYHO+LeDdCI97NRObkphfCJcbi62oeSsfmWGrS
   hGTwWdswnYs/le/nhMjxcqaifBhCz4JvX5WUfn/n56ZzMVY/ukfCkfIVo
   tXPwfqcdM16SqPL1SKE2Y4gBXB7EDw5E2loPzyT0VJtuUSduQENWtAUpj
   N/Uhxa9B76rJ38mreHIwDlm+rKcUjOIbJiZLHRZrZjLIA1s7zXWT1gKkQ
   g==;
X-CSE-ConnectionGUID: IvHOYCDNQLywS8S6BVmxYA==
X-CSE-MsgGUID: 8mS4DmkIRg+Oi6Xy6T/l1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81122130"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="81122130"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 17:23:14 -0700
X-CSE-ConnectionGUID: kk51ihs5REycSn9Y7rIPFw==
X-CSE-MsgGUID: p6Zu6elQQ/qD45Z3yBbbZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="274000544"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 Jun 2026 17:23:13 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUCuT-00000000BFS-2o8J;
	Tue, 02 Jun 2026 00:23:09 +0000
Date: Tue, 02 Jun 2026 08:22:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/fsl/imx-es8328.c:168:51: error: too many arguments to function
 call, expected 2, have 6
Message-ID: <202606020826.sp0yY8ma-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: 96152fea95db604513be69582e07cab8587750e8 [290/290] ASoC: fsl: imx-es8328: use snd_soc_card_register()
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260602/202606020826.sp0yY8ma-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606020826.sp0yY8ma-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606020826.sp0yY8ma-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/fsl/imx-es8328.c:168:51: error: too many arguments to function call, expected 2, have 6
     168 |         card = devm_snd_soc_card_alloc(dev, THIS_MODULE, &data->card_driver,
         |                ~~~~~~~~~~~~~~~~~~~~~~~                   ^~~~~~~~~~~~~~~~~~~
     169 |                                        NULL, NULL, NULL);
         |                                        ~~~~~~~~~~~~~~~~
   include/sound/soc-card.h:90:22: note: 'devm_snd_soc_card_alloc' declared here
      90 | struct snd_soc_card *devm_snd_soc_card_alloc(struct device *dev,
         |                      ^                       ~~~~~~~~~~~~~~~~~~~
      91 |                                              struct snd_soc_card_driver *driver);
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +168 sound/soc/fsl/imx-es8328.c

    85	
    86	static int imx_es8328_probe(struct platform_device *pdev)
    87	{
    88		struct device_node *np = pdev->dev.of_node;
    89		struct device_node *ssi_np = NULL, *codec_np = NULL;
    90		struct platform_device *ssi_pdev;
    91		struct imx_es8328_data *data;
    92		struct snd_soc_dai_link_component *comp;
    93		struct snd_soc_card *card;
    94		u32 int_port, ext_port;
    95		int ret;
    96		struct device *dev = &pdev->dev;
    97	
    98		ret = of_property_read_u32(np, "mux-int-port", &int_port);
    99		if (ret) {
   100			dev_err(dev, "mux-int-port missing or invalid\n");
   101			goto fail;
   102		}
   103		if (int_port > MUX_PORT_MAX || int_port == 0) {
   104			dev_err(dev, "mux-int-port: hardware only has %d mux ports\n",
   105				MUX_PORT_MAX);
   106			ret = -EINVAL;
   107			goto fail;
   108		}
   109	
   110		ret = of_property_read_u32(np, "mux-ext-port", &ext_port);
   111		if (ret) {
   112			dev_err(dev, "mux-ext-port missing or invalid\n");
   113			goto fail;
   114		}
   115		if (ext_port > MUX_PORT_MAX || ext_port == 0) {
   116			dev_err(dev, "mux-ext-port: hardware only has %d mux ports\n",
   117				MUX_PORT_MAX);
   118			ret = -EINVAL;
   119			goto fail;
   120		}
   121	
   122		/*
   123		 * The port numbering in the hardware manual starts at 1, while
   124		 * the audmux API expects it starts at 0.
   125		 */
   126		int_port--;
   127		ext_port--;
   128		ret = imx_audmux_v2_configure_port(int_port,
   129				IMX_AUDMUX_V2_PTCR_SYN |
   130				IMX_AUDMUX_V2_PTCR_TFSEL(ext_port) |
   131				IMX_AUDMUX_V2_PTCR_TCSEL(ext_port) |
   132				IMX_AUDMUX_V2_PTCR_TFSDIR |
   133				IMX_AUDMUX_V2_PTCR_TCLKDIR,
   134				IMX_AUDMUX_V2_PDCR_RXDSEL(ext_port));
   135		if (ret) {
   136			dev_err(dev, "audmux internal port setup failed\n");
   137			return ret;
   138		}
   139		ret = imx_audmux_v2_configure_port(ext_port,
   140				IMX_AUDMUX_V2_PTCR_SYN,
   141				IMX_AUDMUX_V2_PDCR_RXDSEL(int_port));
   142		if (ret) {
   143			dev_err(dev, "audmux external port setup failed\n");
   144			return ret;
   145		}
   146	
   147		ssi_np = of_parse_phandle(pdev->dev.of_node, "ssi-controller", 0);
   148		codec_np = of_parse_phandle(pdev->dev.of_node, "audio-codec", 0);
   149		if (!ssi_np || !codec_np) {
   150			dev_err(dev, "phandle missing or invalid\n");
   151			ret = -EINVAL;
   152			goto fail;
   153		}
   154	
   155		ssi_pdev = of_find_device_by_node(ssi_np);
   156		if (!ssi_pdev) {
   157			dev_err(dev, "failed to find SSI platform device\n");
   158			ret = -EINVAL;
   159			goto fail;
   160		}
   161	
   162		data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
   163		if (!data) {
   164			ret = -ENOMEM;
   165			goto put_device;
   166		}
   167	
 > 168		card = devm_snd_soc_card_alloc(dev, THIS_MODULE, &data->card_driver,
   169					       NULL, NULL, NULL);
   170		if (!card) {
   171			ret = -ENOMEM;
   172			goto put_device;
   173		}
   174	
   175		comp = devm_kzalloc(dev, 2 * sizeof(*comp), GFP_KERNEL);
   176		if (!comp) {
   177			ret = -ENOMEM;
   178			goto put_device;
   179		}
   180	
   181		data->dev = dev;
   182	
   183		data->jack_gpiod = devm_gpiod_get_optional(dev, "jack", GPIOD_IN);
   184		if (IS_ERR(data->jack_gpiod)) {
   185			ret = PTR_ERR(data->jack_gpiod);
   186			goto put_device;
   187		}
   188	
   189		/*
   190		 * CPU == Platform
   191		 * platform is using soc-generic-dmaengine-pcm
   192		 */
   193		data->dai.cpus		=
   194		data->dai.platforms	= &comp[0];
   195		data->dai.codecs	= &comp[1];
   196	
   197		data->dai.num_cpus	= 1;
   198		data->dai.num_codecs	= 1;
   199		data->dai.num_platforms	= 1;
   200	
   201		data->dai.name = "hifi";
   202		data->dai.stream_name = "hifi";
   203		data->dai.codecs->dai_name = "es8328-hifi-analog";
   204		data->dai.codecs->of_node = codec_np;
   205		data->dai.cpus->of_node = ssi_np;
   206		data->dai.init = &imx_es8328_dai_init;
   207		data->dai.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
   208				    SND_SOC_DAIFMT_CBP_CFP;
   209	
   210		data->card_driver.dapm_widgets = imx_es8328_dapm_widgets;
   211		data->card_driver.num_dapm_widgets = ARRAY_SIZE(imx_es8328_dapm_widgets);
   212		data->card_driver.controls = imx_es8328_controls;
   213		data->card_driver.num_controls = ARRAY_SIZE(imx_es8328_controls);
   214		ret = snd_soc_card_of_parse_name(card, "model");
   215		if (ret) {
   216			dev_err(dev, "Unable to parse card name\n");
   217			goto put_device;
   218		}
   219		ret = snd_soc_card_of_parse_audio_routing(card, "audio-routing");
   220		if (ret) {
   221			dev_err(dev, "Unable to parse routing: %d\n", ret);
   222			goto put_device;
   223		}
   224		data->card_driver.num_links = 1;
   225		data->card_driver.dai_link = &data->dai;
   226	
   227		ret = devm_snd_soc_card_register(card);
   228		if (ret) {
   229			dev_err(dev, "Unable to register: %d\n", ret);
   230			goto put_device;
   231		}
   232	
   233		platform_set_drvdata(pdev, data);
   234	put_device:
   235		put_device(&ssi_pdev->dev);
   236	fail:
   237		of_node_put(ssi_np);
   238		of_node_put(codec_np);
   239	
   240		return ret;
   241	}
   242	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
