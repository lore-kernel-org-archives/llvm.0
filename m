Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D0E39DBC5;
	Mon,  1 Jun 2026 16:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780333078; cv=none; b=e1RUDboYfm6rDtgyRcZhfC9Ll6SseHrvSOMsAPh/3aB8+JSTtZ7TpGSMUcQE4HgBqUVa+nU7W3mHQT9auiUdeh5JuqYaYaoLU3pmiTgXZIyCyZMjIxI8dkgX6khWAadQUbAccRHfZ31FR3rDVsEv9biSLkBSJUpEnF1QK/ONEug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780333078; c=relaxed/simple;
	bh=/zGNLRR4uyg0sPIMcyzYdDsLm5eXyF+zmkEicrGHW2g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DNPNJAZ/pMoACZI0SO48xesK/FgaeIlBcPPVIArs6sa4oYxNoNWC0TpqQXXmz/38DfOCp3joBFngfOq10W4X8njx8wbtZoraVGnum+FB69v9cnuqjTFcxMIiQT3A7GFWFLeTVpEL3IuAhnR/1/qmkAx6vQ3Vh20aGMKvUU+bZzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RXeQEaGl; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RXeQEaGl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780333074; x=1811869074;
  h=date:from:to:cc:subject:message-id;
  bh=/zGNLRR4uyg0sPIMcyzYdDsLm5eXyF+zmkEicrGHW2g=;
  b=RXeQEaGlucyq+e1M/frSgiKgWiWuM7fV8+Uy/VL0F/U/gU6N/1ZIHv1a
   JIFXCCQQ2//v0J9qGHDl6oAK1zwWvuU+PTs0xZKdOL0FoYmF/HM6EaXie
   lPVACDsDkBvyjrxwmDJIniUbjDoGv+My01hVjKRGH3FdnkorpfvVasQ8M
   nJm1S/CuAlxFhij6gVGZDBnSzNt6sBKYlvZ5mDxklR5jvVLPVKDZymcBx
   9HKhy6oVPuX8hNlaYfuBE//cXLwYNjrk0qCZrm5Z5kll4pjDKNIrrnmZM
   cOPhS3uU1ZvMYaC4Ncxb2XDrFDGa8odmQbVdXZrj7BPC5vreLaH1wz8Je
   Q==;
X-CSE-ConnectionGUID: Tm9axQVpSDmyYOjLZVg54A==
X-CSE-MsgGUID: ZBX8c5QdRmaeIKRbeDU8Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="98515269"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="98515269"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 09:57:53 -0700
X-CSE-ConnectionGUID: s48lFvDCQHynqbsjYsdfgw==
X-CSE-MsgGUID: Ec/8wMAVTsak/bY4oilF+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="247909729"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Jun 2026 09:57:50 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU5xU-00000000Apg-0ldf;
	Mon, 01 Jun 2026 16:57:48 +0000
Date: Tue, 02 Jun 2026 00:57:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/intel/boards/cht_bsw_rt5645.c:693:45: error: incompatible pointer
 types passing 'struct snd_soc_card_platform *' to parameter of type 'struct
 snd_soc_card_driver *'
Message-ID: <202606020044.xk6sN7xT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: be523d87f62e84d2688d2184fedff0b1dab28389 [290/290] ASoC: intel: cht_bsw_rt5645: use snd_soc_card_register()
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20260602/202606020044.xk6sN7xT-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e5ab4f8a1f766febdc65ce89c00dec85393cfd68)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606020044.xk6sN7xT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606020044.xk6sN7xT-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/intel/boards/cht_bsw_rt5645.c:486:37: error: variable has incomplete type 'struct snd_soc_card_platform'
     486 | static struct snd_soc_card_platform snd_soc_card_chtrt5645 = {
         |                                     ^
   sound/soc/intel/boards/cht_bsw_rt5645.c:37:9: note: forward declaration of 'struct snd_soc_card_platform'
      37 |         struct snd_soc_card_platform *soc_card_platform;
         |                ^
   sound/soc/intel/boards/cht_bsw_rt5645.c:500:37: error: variable has incomplete type 'struct snd_soc_card_platform'
     500 | static struct snd_soc_card_platform snd_soc_card_chtrt5650 = {
         |                                     ^
   sound/soc/intel/boards/cht_bsw_rt5645.c:37:9: note: forward declaration of 'struct snd_soc_card_platform'
      37 |         struct snd_soc_card_platform *soc_card_platform;
         |                ^
>> sound/soc/intel/boards/cht_bsw_rt5645.c:693:45: error: incompatible pointer types passing 'struct snd_soc_card_platform *' to parameter of type 'struct snd_soc_card_driver *' [-Wincompatible-pointer-types]
     693 |         card = devm_snd_soc_card_alloc(&pdev->dev, card_platform);
         |                                                    ^~~~~~~~~~~~~
   include/sound/soc-card.h:91:39: note: passing argument to parameter 'driver' here
      91 |                                              struct snd_soc_card_driver *driver);
         |                                                                          ^
   3 errors generated.


vim +693 sound/soc/intel/boards/cht_bsw_rt5645.c

   528	
   529	static int snd_cht_mc_probe(struct platform_device *pdev)
   530	{
   531		struct snd_soc_card_platform *card_platform = snd_soc_cards[0].soc_card_platform;
   532		struct snd_soc_card *card;
   533		struct snd_soc_acpi_mach *mach;
   534		const char *platform_name;
   535		struct cht_mc_private *drv;
   536		struct acpi_device *adev;
   537		struct device *codec_dev;
   538		bool sof_parent;
   539		bool found = false;
   540		bool is_bytcr = false;
   541		int dai_index = 0;
   542		int ret_val = 0;
   543		int i;
   544		const char *mclk_name;
   545	
   546		drv = devm_kzalloc(&pdev->dev, sizeof(*drv), GFP_KERNEL);
   547		if (!drv)
   548			return -ENOMEM;
   549	
   550		mach = pdev->dev.platform_data;
   551	
   552		for (i = 0; i < ARRAY_SIZE(snd_soc_cards); i++) {
   553			if (acpi_dev_found(snd_soc_cards[i].codec_id) &&
   554				(!strncmp(snd_soc_cards[i].codec_id, mach->id, 8))) {
   555				dev_dbg(&pdev->dev,
   556					"found codec %s\n", snd_soc_cards[i].codec_id);
   557				card_platform = snd_soc_cards[i].soc_card_platform;
   558				drv->acpi_card = &snd_soc_cards[i];
   559				found = true;
   560				break;
   561			}
   562		}
   563	
   564		if (!found) {
   565			dev_err(&pdev->dev, "No matching HID found in supported list\n");
   566			return -ENODEV;
   567		}
   568	
   569		/* set correct codec name */
   570		for (i = 0; i < ARRAY_SIZE(cht_dailink); i++)
   571			if (cht_dailink[i].num_codecs &&
   572			    !strcmp(cht_dailink[i].codecs->name,
   573				    "i2c-10EC5645:00")) {
   574				dai_index = i;
   575				break;
   576			}
   577	
   578		/* fixup codec name based on HID */
   579		adev = acpi_dev_get_first_match_dev(mach->id, NULL, -1);
   580		if (adev) {
   581			snprintf(cht_rt5645_codec_name, sizeof(cht_rt5645_codec_name),
   582				 "i2c-%s", acpi_dev_name(adev));
   583			cht_dailink[dai_index].codecs->name = cht_rt5645_codec_name;
   584		} else {
   585			dev_err(&pdev->dev, "Error cannot find '%s' dev\n", mach->id);
   586			return -ENOENT;
   587		}
   588	
   589		/* acpi_get_first_physical_node() returns a borrowed ref, no need to deref */
   590		codec_dev = acpi_get_first_physical_node(adev);
   591		acpi_dev_put(adev);
   592		if (!codec_dev)
   593			return -EPROBE_DEFER;
   594	
   595		snd_soc_card_chtrt5645.components = rt5645_components(codec_dev);
   596		snd_soc_card_chtrt5650.components = rt5645_components(codec_dev);
   597	
   598		/*
   599		 * swap SSP0 if bytcr is detected
   600		 * (will be overridden if DMI quirk is detected)
   601		 */
   602		if (soc_intel_is_byt()) {
   603			if (mach->mach_params.acpi_ipc_irq_index == 0)
   604				is_bytcr = true;
   605		}
   606	
   607		if (is_bytcr) {
   608			/*
   609			 * Baytrail CR platforms may have CHAN package in BIOS, try
   610			 * to find relevant routing quirk based as done on Windows
   611			 * platforms. We have to read the information directly from the
   612			 * BIOS, at this stage the card is not created and the links
   613			 * with the codec driver/pdata are non-existent
   614			 */
   615	
   616			struct acpi_chan_package chan_package = { 0 };
   617	
   618			/* format specified: 2 64-bit integers */
   619			struct acpi_buffer format = {sizeof("NN"), "NN"};
   620			struct acpi_buffer state = {0, NULL};
   621			struct snd_soc_acpi_package_context pkg_ctx;
   622			bool pkg_found = false;
   623	
   624			state.length = sizeof(chan_package);
   625			state.pointer = &chan_package;
   626	
   627			pkg_ctx.name = "CHAN";
   628			pkg_ctx.length = 2;
   629			pkg_ctx.format = &format;
   630			pkg_ctx.state = &state;
   631			pkg_ctx.data_valid = false;
   632	
   633			pkg_found = snd_soc_acpi_find_package_from_hid(mach->id,
   634								       &pkg_ctx);
   635			if (pkg_found) {
   636				if (chan_package.aif_value == 1) {
   637					dev_info(&pdev->dev, "BIOS Routing: AIF1 connected\n");
   638					cht_rt5645_quirk |= CHT_RT5645_SSP0_AIF1;
   639				} else  if (chan_package.aif_value == 2) {
   640					dev_info(&pdev->dev, "BIOS Routing: AIF2 connected\n");
   641					cht_rt5645_quirk |= CHT_RT5645_SSP0_AIF2;
   642				} else {
   643					dev_info(&pdev->dev, "BIOS Routing isn't valid, ignored\n");
   644					pkg_found = false;
   645				}
   646			}
   647	
   648			if (!pkg_found) {
   649				/* no BIOS indications, assume SSP0-AIF2 connection */
   650				cht_rt5645_quirk |= CHT_RT5645_SSP0_AIF2;
   651			}
   652		}
   653	
   654		/* check quirks before creating card */
   655		dmi_check_system(cht_rt5645_quirk_table);
   656		log_quirks(&pdev->dev);
   657	
   658		if ((cht_rt5645_quirk & CHT_RT5645_SSP2_AIF2) ||
   659		    (cht_rt5645_quirk & CHT_RT5645_SSP0_AIF2))
   660			cht_dailink[dai_index].codecs->dai_name = "rt5645-aif2";
   661	
   662		if ((cht_rt5645_quirk & CHT_RT5645_SSP0_AIF1) ||
   663		    (cht_rt5645_quirk & CHT_RT5645_SSP0_AIF2))
   664			cht_dailink[dai_index].cpus->dai_name = "ssp0-port";
   665	
   666		if (cht_rt5645_quirk & CHT_RT5645_PMC_PLT_CLK_0)
   667			mclk_name = "pmc_plt_clk_0";
   668		else
   669			mclk_name = "pmc_plt_clk_3";
   670	
   671		drv->mclk = devm_clk_get(&pdev->dev, mclk_name);
   672		if (IS_ERR(drv->mclk)) {
   673			dev_err(&pdev->dev, "Failed to get MCLK from %s: %ld\n",
   674				mclk_name, PTR_ERR(drv->mclk));
   675			return PTR_ERR(drv->mclk);
   676		}
   677	
   678		sof_parent = snd_soc_acpi_sof_parent(&pdev->dev);
   679	
   680		/* set card and driver name */
   681		if (sof_parent) {
   682			snd_soc_card_chtrt5645.name = SOF_CARD_RT5645_NAME;
   683			snd_soc_card_chtrt5645.driver.name = SOF_DRIVER_NAME;
   684			snd_soc_card_chtrt5650.name = SOF_CARD_RT5650_NAME;
   685			snd_soc_card_chtrt5650.driver.name = SOF_DRIVER_NAME;
   686		} else {
   687			snd_soc_card_chtrt5645.name = CARD_RT5645_NAME;
   688			snd_soc_card_chtrt5645.driver.name = DRIVER_NAME;
   689			snd_soc_card_chtrt5650.name = CARD_RT5650_NAME;
   690			snd_soc_card_chtrt5650.driver.name = DRIVER_NAME;
   691		}
   692	
 > 693		card = devm_snd_soc_card_alloc(&pdev->dev, card_platform);
   694		if (!card)
   695			return -ENOMEM;
   696	
   697		/* set pm ops */
   698		if (sof_parent)
   699			pdev->dev.driver->pm = &snd_soc_pm_ops;
   700	
   701		/* override platform name, if required */
   702		platform_name = mach->mach_params.platform;
   703	
   704		ret_val = snd_soc_fixup_dai_links_platform_name(card, platform_name);
   705		if (ret_val)
   706			return ret_val;
   707	
   708		snd_soc_card_attach_priv(card, drv);
   709	
   710		ret_val = devm_snd_soc_card_register(card);
   711		if (ret_val) {
   712			dev_err(&pdev->dev,
   713				"snd_soc_card_register() failed %d\n", ret_val);
   714			return ret_val;
   715		}
   716		platform_set_drvdata(pdev, card);
   717		return ret_val;
   718	}
   719	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
