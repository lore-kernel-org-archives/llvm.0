Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8E237B3F1;
	Mon,  9 Feb 2026 15:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770651455; cv=none; b=myS311tfGkChQgUOi7snfEYAJZbHjMj0uM7Q1UWoPgCwwskhDGV7rqUCGJHPAMg3bG7nuMdMfHzQScNOhb0DV6BcWCCKZzkpMSeNmaYLohOH8avbnYiH6fOVndydgKRXHfkZ7WDuHwbsMoASl87YlyQ4NARSn3ArrYSkGLFLWwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770651455; c=relaxed/simple;
	bh=IKCR4lvEQuc2Tydtoh143FaKcDcntZb/L2bYA7aAPxc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G/TryL9YRmaJ9Kit+9+st/mjcrYE7ZnHveTHG10JNXsV48rj/yFN9WODf/y2aekFekCfNdRLg4lusR6+9uvQ9mxlLgsV5S0Ix2Zy11a+444zXkLrdJ19AUVPQeo67xVJdADr8SCPTYtX5jAPORmITnOS9bBu/U/SwOosI0DFksk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AnW875Y4; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AnW875Y4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770651455; x=1802187455;
  h=date:from:to:cc:subject:message-id;
  bh=IKCR4lvEQuc2Tydtoh143FaKcDcntZb/L2bYA7aAPxc=;
  b=AnW875Y4a2DNexJiui73rzgXmkcvE1Avzi0tVzAgZ7eP+RGDSZCKxawf
   b1Zz1LxKJRj1vKYWt0ZgfBQ6RyZh6KDviA7dWdMY2aIkbXx2jqxrGcTGA
   DSUb7rpjDCvAQByCxGtW3jHK0CzT8V7z3dLYn6nV58QC1ku9MfMPyDgYT
   WUBr8wm5zMzzwFRJAXDsB6cEwJFTWQb6bb7JJNPtwZ5mkh2XV7zb+4qzi
   j6PWJuaxpeoMGRToWc1c7gpXWNZHubbM7km+J9zfLI324HA8hSQOddr8o
   0kutcMam1AxzRT8SfBiVz44cMR2NT238qSMZKI0F5Dxhpoa2bvfPhXDN3
   Q==;
X-CSE-ConnectionGUID: yJOPSKx9Sr+CD1aEVjkKXg==
X-CSE-MsgGUID: dcrdb0W+QQyZiKE/jt2Log==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71665089"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="71665089"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 07:37:35 -0800
X-CSE-ConnectionGUID: Om9r6mcXRoOq9Gj0e73n5w==
X-CSE-MsgGUID: aCouv1DPSxaD70JRWYBgeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="210922205"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Feb 2026 07:37:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpTKM-00000000o52-2QyZ;
	Mon, 09 Feb 2026 15:37:30 +0000
Date: Mon, 09 Feb 2026 23:37:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [sre-misc:thinkpad-t14s-x1e 20/129]
 drivers/media/platform/qcom/camss/camss-csiphy.c:821:59: warning: variable
 'ret' is uninitialized when used here
Message-ID: <202602092340.TG38Rxvc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git thinkpad-t14s-x1e
head:   e59893f5d6ef4c024a8ce76f6922057dc52b8a9b
commit: 73974b13359f2522448c9ea16fde5c0d56bba10e [20/129] media: qcom: camss: Add support for PHY API devices
config: powerpc-randconfig-002-20260209 (https://download.01.org/0day-ci/archive/20260209/202602092340.TG38Rxvc-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260209/202602092340.TG38Rxvc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602092340.TG38Rxvc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/qcom/camss/camss-csiphy.c:643:44: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 3)' attribute to the declaration of 'csiphy_match_clock_name' [-Wmissing-format-attribute]
     638 | static bool csiphy_match_clock_name(const char *clock_name, const char *format,
         | __attribute__((format(printf, 2, 3))) 
     639 |                                     int index)
     640 | {
     641 |         char name[16]; /* csiphyXXX_timer\0 */
     642 | 
     643 |         snprintf(name, sizeof(name), format, index);
         |                                                   ^
   drivers/media/platform/qcom/camss/camss-csiphy.c:638:13: note: 'csiphy_match_clock_name' declared here
     638 | static bool csiphy_match_clock_name(const char *clock_name, const char *format,
         |             ^
>> drivers/media/platform/qcom/camss/camss-csiphy.c:821:59: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     821 |                 dev_err(dev, "failed to get phy %s %d\n", csiphy->name, ret);
         |                                                                         ^~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:808:9: note: initialize the variable 'ret' to silence this warning
     808 |         int ret;
         |                ^
         |                 = 0
   2 warnings generated.


vim +/ret +821 drivers/media/platform/qcom/camss/camss-csiphy.c

   637	
 > 638	static bool csiphy_match_clock_name(const char *clock_name, const char *format,
   639					    int index)
   640	{
   641		char name[16]; /* csiphyXXX_timer\0 */
   642	
   643		snprintf(name, sizeof(name), format, index);
   644		return !strcmp(clock_name, name);
   645	}
   646	
   647	/*
   648	 * msm_csiphy_subdev_init_legacy - Initialize CSIPHY device structure and resources
   649	 * @csiphy: CSIPHY device
   650	 * @res: CSIPHY module resources table
   651	 * @id: CSIPHY module id
   652	 *
   653	 * Return 0 on success or a negative error code otherwise
   654	 */
   655	int msm_csiphy_subdev_init_legacy(struct camss *camss,
   656					  struct csiphy_device *csiphy,
   657					  const struct camss_subdev_resources *res, u8 id)
   658	{
   659		struct device *dev = camss->dev;
   660		struct platform_device *pdev = to_platform_device(dev);
   661		int i, j;
   662		int ret;
   663	
   664		csiphy->camss = camss;
   665		csiphy->id = id;
   666		csiphy->cfg.combo_mode = 0;
   667		csiphy->res = &res->csiphy;
   668	
   669		ret = csiphy->res->hw_ops->init(csiphy);
   670		if (ret)
   671			return ret;
   672	
   673		/* Memory */
   674	
   675		csiphy->base = devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
   676		if (IS_ERR(csiphy->base))
   677			return PTR_ERR(csiphy->base);
   678	
   679		if (camss->res->version == CAMSS_8x16 ||
   680		    camss->res->version == CAMSS_8x53 ||
   681		    camss->res->version == CAMSS_8x96) {
   682			csiphy->base_clk_mux =
   683				devm_platform_ioremap_resource_byname(pdev, res->reg[1]);
   684			if (IS_ERR(csiphy->base_clk_mux))
   685				return PTR_ERR(csiphy->base_clk_mux);
   686		} else {
   687			csiphy->base_clk_mux = NULL;
   688		}
   689	
   690		/* Interrupt */
   691	
   692		ret = platform_get_irq_byname(pdev, res->interrupt[0]);
   693		if (ret < 0)
   694			return ret;
   695	
   696		csiphy->irq = ret;
   697		snprintf(csiphy->irq_name, sizeof(csiphy->irq_name), "%s_%s%d",
   698			 dev_name(dev), MSM_CSIPHY_NAME, csiphy->id);
   699	
   700		ret = devm_request_irq(dev, csiphy->irq, csiphy->res->hw_ops->isr,
   701				       IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN,
   702				       csiphy->irq_name, csiphy);
   703		if (ret < 0) {
   704			dev_err(dev, "request_irq failed: %d\n", ret);
   705			return ret;
   706		}
   707	
   708		/* Clocks */
   709	
   710		csiphy->nclocks = 0;
   711		while (res->clock[csiphy->nclocks])
   712			csiphy->nclocks++;
   713	
   714		csiphy->clock = devm_kcalloc(dev,
   715					     csiphy->nclocks, sizeof(*csiphy->clock),
   716					     GFP_KERNEL);
   717		if (!csiphy->clock)
   718			return -ENOMEM;
   719	
   720		csiphy->rate_set = devm_kcalloc(dev,
   721						csiphy->nclocks,
   722						sizeof(*csiphy->rate_set),
   723						GFP_KERNEL);
   724		if (!csiphy->rate_set)
   725			return -ENOMEM;
   726	
   727		for (i = 0; i < csiphy->nclocks; i++) {
   728			struct camss_clock *clock = &csiphy->clock[i];
   729	
   730			clock->clk = devm_clk_get(dev, res->clock[i]);
   731			if (IS_ERR(clock->clk))
   732				return PTR_ERR(clock->clk);
   733	
   734			clock->name = res->clock[i];
   735	
   736			clock->nfreqs = 0;
   737			while (res->clock_rate[i][clock->nfreqs])
   738				clock->nfreqs++;
   739	
   740			if (!clock->nfreqs) {
   741				clock->freq = NULL;
   742				continue;
   743			}
   744	
   745			clock->freq = devm_kcalloc(dev,
   746						   clock->nfreqs,
   747						   sizeof(*clock->freq),
   748						   GFP_KERNEL);
   749			if (!clock->freq)
   750				return -ENOMEM;
   751	
   752			for (j = 0; j < clock->nfreqs; j++)
   753				clock->freq[j] = res->clock_rate[i][j];
   754	
   755			csiphy->rate_set[i] = csiphy_match_clock_name(clock->name,
   756								      "csiphy%d_timer",
   757								      csiphy->id);
   758			if (csiphy->rate_set[i])
   759				continue;
   760	
   761			if (camss->res->version == CAMSS_660) {
   762				csiphy->rate_set[i] = csiphy_match_clock_name(clock->name,
   763									      "csi%d_phy",
   764									       csiphy->id);
   765				if (csiphy->rate_set[i])
   766					continue;
   767			}
   768	
   769			csiphy->rate_set[i] = csiphy_match_clock_name(clock->name, "csiphy%d", csiphy->id);
   770		}
   771	
   772		/* CSIPHY supplies */
   773		for (i = 0; i < ARRAY_SIZE(res->regulators); i++) {
   774			if (res->regulators[i])
   775				csiphy->num_supplies++;
   776		}
   777	
   778		if (csiphy->num_supplies) {
   779			csiphy->supplies = devm_kmalloc_array(camss->dev,
   780							      csiphy->num_supplies,
   781							      sizeof(*csiphy->supplies),
   782							      GFP_KERNEL);
   783			if (!csiphy->supplies)
   784				return -ENOMEM;
   785		}
   786	
   787		for (i = 0; i < csiphy->num_supplies; i++)
   788			csiphy->supplies[i].supply = res->regulators[i];
   789	
   790		ret = devm_regulator_bulk_get(camss->dev, csiphy->num_supplies,
   791					      csiphy->supplies);
   792		return ret;
   793	}
   794	
   795	/*
   796	 * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resources
   797	 * @csiphy: CSIPHY device
   798	 * @res: CSIPHY module resources table
   799	 * @id: CSIPHY module id
   800	 *
   801	 * Return 0 on success or a negative error code otherwise
   802	 */
   803	int msm_csiphy_subdev_init(struct camss *camss,
   804				   struct csiphy_device *csiphy,
   805				   const struct camss_subdev_resources *res, u8 id)
   806	{
   807		struct device *dev = camss->dev;
   808		int ret;
   809	
   810		csiphy->camss = camss;
   811		csiphy->id = id;
   812		csiphy->cfg.combo_mode = 0;
   813		csiphy->res = &res->csiphy;
   814	
   815		snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csiphy%d",
   816			 csiphy->id);
   817	
   818		csiphy->phy = devm_phy_get(dev, csiphy->name);
   819	
   820		if (IS_ERR(csiphy->phy)) {
 > 821			dev_err(dev, "failed to get phy %s %d\n", csiphy->name, ret);
   822			return PTR_ERR(csiphy->phy);
   823		}
   824	
   825		ret = phy_init(csiphy->phy);
   826		if (ret)
   827			dev_err(dev, "phy %s init fail %d\n", csiphy->name, ret);
   828	
   829		return ret;
   830	}
   831	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
