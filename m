Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787676AB8;
	Fri, 14 Jul 2023 06:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689314546; x=1720850546;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mbBnkihTYFStSDD8PDcxvsI9UJ7zIKaATu5Cg0ZskCU=;
  b=YGWQQpgdOxJy96pou1pJkoPa+HvzoKmVmc8QYUkBcywWizBeHOp/Kbb0
   islndCfHiaPqjLj86cmNvSSt102HUJ4JW+ktSDUJltio/jtUxqHsX+iDz
   3t8MkyZAmI8SLtijbD3F2CSvkfU/hDsW6TvCY1txKc4cafjiLHJJFNyHB
   xwc3z/apHWvCNmGubdoMa8F8LFpPfVJyGPep0sDXkm3yjfsZxAaxZgEsq
   oWJkOikvftQg3/2q7LpSKfASK/90xU4xj5DuUi5vZC14E+NX2E7vo6Gm2
   hbJsA1LwAoXJPNgeNcwmCUUWhVkuLN5CR28+ILDKhB+3v1MBlGq49Nzid
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="429164504"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="429164504"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 23:02:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="787722778"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="787722778"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 13 Jul 2023 23:02:23 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKBsl-0007Dl-0Q;
	Fri, 14 Jul 2023 06:02:23 +0000
Date: Fri, 14 Jul 2023 14:02:14 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 104/106] drivers/mmc/host/jz4740_mmc.c:1027:34:
 warning: unused variable 'jz4740_mmc_of_match'
Message-ID: <202307141339.dPzLGU2a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   6d526c484caa62c36428fc20236387f34d8f5c75
commit: 00ffe6b38678094157b3bfd21e035e2cf3a3965c [104/106] Use of_device_get_match_data
config: mips-randconfig-r015-20230713 (https://download.01.org/0day-ci/archive/20230714/202307141339.dPzLGU2a-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307141339.dPzLGU2a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307141339.dPzLGU2a-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mmc/host/jz4740_mmc.c:1043:29: warning: unused variable 'match' [-Wunused-variable]
    1043 |         const struct of_device_id *match;
         |                                    ^
>> drivers/mmc/host/jz4740_mmc.c:1027:34: warning: unused variable 'jz4740_mmc_of_match' [-Wunused-const-variable]
    1027 | static const struct of_device_id jz4740_mmc_of_match[] = {
         |                                  ^
   2 warnings generated.


vim +/jz4740_mmc_of_match +1027 drivers/mmc/host/jz4740_mmc.c

61bfbdb856879c Lars-Peter Clausen        2010-07-15  1026  
61e11eba23c3c1 Ezequiel Garcia           2018-03-28 @1027  static const struct of_device_id jz4740_mmc_of_match[] = {
61e11eba23c3c1 Ezequiel Garcia           2018-03-28  1028  	{ .compatible = "ingenic,jz4740-mmc", .data = (void *) JZ_MMC_JZ4740 },
a0c938b5dd701c Paul Cercueil             2018-08-21  1029  	{ .compatible = "ingenic,jz4725b-mmc", .data = (void *)JZ_MMC_JZ4725B },
2af2af9940b0ce Zhou Yanjie               2019-10-12  1030  	{ .compatible = "ingenic,jz4760-mmc", .data = (void *) JZ_MMC_JZ4760 },
d1c777ee5c5e0a 周琰杰 (Zhou Yanjie       2021-06-10  1031) 	{ .compatible = "ingenic,jz4775-mmc", .data = (void *) JZ_MMC_JZ4780 },
6a78768af70fa5 Alex Smith                2018-03-28  1032  	{ .compatible = "ingenic,jz4780-mmc", .data = (void *) JZ_MMC_JZ4780 },
fea5fcc25788d5 Zhou Yanjie               2019-10-12  1033  	{ .compatible = "ingenic,x1000-mmc", .data = (void *) JZ_MMC_X1000 },
61e11eba23c3c1 Ezequiel Garcia           2018-03-28  1034  	{},
61e11eba23c3c1 Ezequiel Garcia           2018-03-28  1035  };
61e11eba23c3c1 Ezequiel Garcia           2018-03-28  1036  MODULE_DEVICE_TABLE(of, jz4740_mmc_of_match);
61e11eba23c3c1 Ezequiel Garcia           2018-03-28  1037  
c3be1efd41a97f Bill Pemberton            2012-11-19  1038  static int jz4740_mmc_probe(struct platform_device* pdev)
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1039  {
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1040  	int ret;
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1041  	struct mmc_host *mmc;
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1042  	struct jz4740_mmc_host *host;
61e11eba23c3c1 Ezequiel Garcia           2018-03-28 @1043  	const struct of_device_id *match;
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1044  
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1045  	mmc = mmc_alloc_host(sizeof(struct jz4740_mmc_host), &pdev->dev);
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1046  	if (!mmc) {
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1047  		dev_err(&pdev->dev, "Failed to alloc mmc host structure\n");
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1048  		return -ENOMEM;
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1049  	}
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1050  
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1051  	host = mmc_priv(mmc);
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1052  
00ffe6b3867809 Rob Herring               2021-01-19  1053  	/* Default if no match is JZ4740 */
00ffe6b3867809 Rob Herring               2021-01-19  1054  	host->version = (enum jz4740_mmc_version)of_device_get_match_data(&pdev->dev);
0539552745af0e Paul Cercueil             2019-01-25  1055  
61e11eba23c3c1 Ezequiel Garcia           2018-03-28  1056  	ret = mmc_of_parse(mmc);
61e11eba23c3c1 Ezequiel Garcia           2018-03-28  1057  	if (ret) {
295208a6666de8 Krzysztof Kozlowski       2020-09-02  1058  		dev_err_probe(&pdev->dev, ret, "could not parse device properties\n");
61e11eba23c3c1 Ezequiel Garcia           2018-03-28  1059  		goto err_free_host;
61e11eba23c3c1 Ezequiel Garcia           2018-03-28  1060  	}
61e11eba23c3c1 Ezequiel Garcia           2018-03-28  1061  
0539552745af0e Paul Cercueil             2019-01-25  1062  	mmc_regulator_get_supply(mmc);
0539552745af0e Paul Cercueil             2019-01-25  1063  
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1064  	host->irq = platform_get_irq(pdev, 0);
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1065  	if (host->irq < 0) {
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1066  		ret = host->irq;
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1067  		goto err_free_host;
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1068  	}
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1069  
017d84bd45d1d2 Lars-Peter Clausen        2013-06-09  1070  	host->clk = devm_clk_get(&pdev->dev, "mmc");
3119cbda858fc9 Jamie Iles                2011-01-11  1071  	if (IS_ERR(host->clk)) {
3119cbda858fc9 Jamie Iles                2011-01-11  1072  		ret = PTR_ERR(host->clk);
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1073  		dev_err(&pdev->dev, "Failed to get mmc clock\n");
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1074  		goto err_free_host;
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1075  	}
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1076  
e3d1672741eda6 Yang Li                   2023-03-15  1077  	host->base = devm_platform_get_and_ioremap_resource(pdev, 0, &host->mem_res);
3e7e8c18a15102 Wei Yongjun               2013-06-29  1078  	if (IS_ERR(host->base)) {
3e7e8c18a15102 Wei Yongjun               2013-06-29  1079  		ret = PTR_ERR(host->base);
017d84bd45d1d2 Lars-Peter Clausen        2013-06-09  1080  		goto err_free_host;
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1081  	}
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1082  
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1083  	mmc->ops = &jz4740_mmc_ops;
61e11eba23c3c1 Ezequiel Garcia           2018-03-28  1084  	if (!mmc->f_max)
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1085  		mmc->f_max = JZ_MMC_CLK_RATE;
3f18c5046e633c Paul Cercueil             2023-01-31  1086  
3f18c5046e633c Paul Cercueil             2023-01-31  1087  	/*
3f18c5046e633c Paul Cercueil             2023-01-31  1088  	 * There seems to be a problem with this driver on the JZ4760 and
3f18c5046e633c Paul Cercueil             2023-01-31  1089  	 * JZ4760B SoCs. There, when using the maximum rate supported (50 MHz),
3f18c5046e633c Paul Cercueil             2023-01-31  1090  	 * the communication fails with many SD cards.
3f18c5046e633c Paul Cercueil             2023-01-31  1091  	 * Until this bug is sorted out, limit the maximum rate to 24 MHz.
3f18c5046e633c Paul Cercueil             2023-01-31  1092  	 */
3f18c5046e633c Paul Cercueil             2023-01-31  1093  	if (host->version == JZ_MMC_JZ4760 && mmc->f_max > JZ_MMC_CLK_RATE)
3f18c5046e633c Paul Cercueil             2023-01-31  1094  		mmc->f_max = JZ_MMC_CLK_RATE;
3f18c5046e633c Paul Cercueil             2023-01-31  1095  
61e11eba23c3c1 Ezequiel Garcia           2018-03-28  1096  	mmc->f_min = mmc->f_max / 128;
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1097  	mmc->ocr_avail = MMC_VDD_32_33 | MMC_VDD_33_34;
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1098  
d422f8b9ed4e47 Ulf Hansson               2020-04-14  1099  	/*
d422f8b9ed4e47 Ulf Hansson               2020-04-14  1100  	 * We use a fixed timeout of 5s, hence inform the core about it. A
d422f8b9ed4e47 Ulf Hansson               2020-04-14  1101  	 * future improvement should instead respect the cmd->busy_timeout.
d422f8b9ed4e47 Ulf Hansson               2020-04-14  1102  	 */
d422f8b9ed4e47 Ulf Hansson               2020-04-14  1103  	mmc->max_busy_timeout = JZ_MMC_REQ_TIMEOUT_MS;
d422f8b9ed4e47 Ulf Hansson               2020-04-14  1104  
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1105  	mmc->max_blk_size = (1 << 10) - 1;
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1106  	mmc->max_blk_count = (1 << 15) - 1;
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1107  	mmc->max_req_size = mmc->max_blk_size * mmc->max_blk_count;
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1108  
a36274e0184193 Martin K. Petersen        2010-09-10  1109  	mmc->max_segs = 128;
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1110  	mmc->max_seg_size = mmc->max_req_size;
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1111  
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1112  	host->mmc = mmc;
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1113  	host->pdev = pdev;
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1114  	spin_lock_init(&host->lock);
6a78768af70fa5 Alex Smith                2018-03-28  1115  	host->irq_mask = ~0;
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1116  
436a3cfddcb7a9 Zubair Lutfullah Kakakhel 2018-03-28  1117  	jz4740_mmc_reset(host);
436a3cfddcb7a9 Zubair Lutfullah Kakakhel 2018-03-28  1118  
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1119  	ret = request_threaded_irq(host->irq, jz_mmc_irq, jz_mmc_irq_worker, 0,
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1120  			dev_name(&pdev->dev), host);
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1121  	if (ret) {
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1122  		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
0f6f3235b816ef Linus Walleij             2018-11-12  1123  		goto err_free_host;
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1124  	}
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1125  
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1126  	jz4740_mmc_clock_disable(host);
2ee4f6200597bd Kees Cook                 2017-10-24  1127  	timer_setup(&host->timeout_timer, jz4740_mmc_timeout, 0);
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1128  
7e8466e222798f Paul Cercueil             2018-03-28  1129  	ret = jz4740_mmc_acquire_dma_channels(host);
7e8466e222798f Paul Cercueil             2018-03-28  1130  	if (ret == -EPROBE_DEFER)
7e8466e222798f Paul Cercueil             2018-03-28  1131  		goto err_free_irq;
7e8466e222798f Paul Cercueil             2018-03-28  1132  	host->use_dma = !ret;
7ca27a6f80a404 Apelete Seketeli          2014-07-21  1133  
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1134  	platform_set_drvdata(pdev, host);
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1135  	ret = mmc_add_host(mmc);
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1136  
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1137  	if (ret) {
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1138  		dev_err(&pdev->dev, "Failed to add mmc host: %d\n", ret);
7e8466e222798f Paul Cercueil             2018-03-28  1139  		goto err_release_dma;
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1140  	}
fea5fcc25788d5 Zhou Yanjie               2019-10-12  1141  	dev_info(&pdev->dev, "Ingenic SD/MMC card driver registered\n");
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1142  
7ca27a6f80a404 Apelete Seketeli          2014-07-21  1143  	dev_info(&pdev->dev, "Using %s, %d-bit mode\n",
7ca27a6f80a404 Apelete Seketeli          2014-07-21  1144  		 host->use_dma ? "DMA" : "PIO",
a02f8f48c194ba Zhou Yanjie               2019-10-12  1145  		 (mmc->caps & MMC_CAP_8_BIT_DATA) ? 8 :
a02f8f48c194ba Zhou Yanjie               2019-10-12  1146  		 ((mmc->caps & MMC_CAP_4_BIT_DATA) ? 4 : 1));
7ca27a6f80a404 Apelete Seketeli          2014-07-21  1147  
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1148  	return 0;
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1149  
7e8466e222798f Paul Cercueil             2018-03-28  1150  err_release_dma:
7e8466e222798f Paul Cercueil             2018-03-28  1151  	if (host->use_dma)
7e8466e222798f Paul Cercueil             2018-03-28  1152  		jz4740_mmc_release_dma_channels(host);
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1153  err_free_irq:
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1154  	free_irq(host->irq, host);
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1155  err_free_host:
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1156  	mmc_free_host(mmc);
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1157  
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1158  	return ret;
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1159  }
61bfbdb856879c Lars-Peter Clausen        2010-07-15  1160  

:::::: The code at line 1027 was first introduced by commit
:::::: 61e11eba23c3c1e68d2a58f196eaa376d55ab366 mmc: jz4740: Introduce devicetree probe

:::::: TO: Ezequiel Garcia <ezequiel@collabora.co.uk>
:::::: CC: Ulf Hansson <ulf.hansson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
