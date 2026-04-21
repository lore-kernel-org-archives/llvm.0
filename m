Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2B23115A2;
	Tue, 21 Apr 2026 14:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776781569; cv=none; b=DZAZMRKzMQkuUIUkzye5rVDXJ8/c3jfnKg3d0aMms6msQ74Dai6D8GaANSj7G88b/Z0Dm9cSRWLDsFOE65zwBERjDnXuDYwgVdm4ZAbxRbv32rZlcosC7csaR3h3TV6WzIV/NXyZM9Yzbc+Q3CIJ+ckQL0dip+2o2YpgQT1iuO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776781569; c=relaxed/simple;
	bh=nDK9RUOdBbk/cjQIj+2LdIdQlVousq2HxTAw4N6jk2w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kMKMOFZu3TF6QzxsHPOqHfz3YiqMcI7vI86o18Te8SDp4X/SNymcbuTQ55rCuySzA8d4BFSHSv7N3PrKtDvJajGG2VGbrET+PjRhPj7gqxUclDr7Z1ZiS5Z8Phic8l08U9wgsIuFHdHbM8y3mI5DSFjTpxlSVzK6suJ/Tg/neJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ymorvdp2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ymorvdp2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776781568; x=1808317568;
  h=date:from:to:cc:subject:message-id;
  bh=nDK9RUOdBbk/cjQIj+2LdIdQlVousq2HxTAw4N6jk2w=;
  b=Ymorvdp2kLmgsEsGVZiXlMfL5YIZdSzAHUvadZsljTbA0PBMIFldX5YA
   my0XfHpu6V51IXOtM7lqx/TqUVZBtFM5r0X+qgUS3C1z+7GK/PXhalBOF
   u+gCKegMj3PCNrmrwUALNvMTTZLGEsxwPSjdJmtoAG+B8S4CppDTsp0hp
   TA6Y48FvNPfJ8Fr/hvCevEpIKY41xHRsPPJz1tCt6Ef+0GO3QA+MmG0aQ
   vlLZVOar9wbQXu1aY7eMplMEEVnGrhmGUgQiCTK2sV9U3fWGx1b+zJMmE
   joCN7EoD0vCVfOEw1dRpVi8AAq+1qqmP/QgEhob72mvfYYuE7gavPDtIu
   Q==;
X-CSE-ConnectionGUID: 8hCPIHPdRb+L2EcAJ98ehA==
X-CSE-MsgGUID: tl38jjMPTSymjoRfOXLwdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77783587"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="77783587"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 07:26:07 -0700
X-CSE-ConnectionGUID: BPfJvNwDRNKgEV/THZTAYg==
X-CSE-MsgGUID: LEY8zpUzTR+ZNR3+gMUNow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="232332680"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 Apr 2026 07:26:06 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFC39-000000003ck-2XSB;
	Tue, 21 Apr 2026 14:26:03 +0000
Date: Tue, 21 Apr 2026 22:25:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-04-20 127/127]
 sound/soc/amd/acp/acp-legacy-mach.c:149:74: warning: variable 'ret' is
 uninitialized when used here
Message-ID: <202604212200.YzzHzpbL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-04-20
head:   c0eca3aad838fa892c00ca5d3141b136aac51b91
commit: ed950a3f7a9bf4445c6ea314b6e0a5f0733f6505 [127/127] ASoC: amd: acp-legacy-mach: use snd_soc_card_register()
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260421/202604212200.YzzHzpbL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260421/202604212200.YzzHzpbL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604212200.YzzHzpbL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/amd/acp/acp-legacy-mach.c:149:74: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     149 |                 dev_err(dev, "devm_snd_soc_card_register(%s) failed: %d\n", card_name, ret);
         |                                                                                        ^~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   sound/soc/amd/acp/acp-legacy-mach.c:135:9: note: initialize the variable 'ret' to silence this warning
     135 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +149 sound/soc/amd/acp/acp-legacy-mach.c

   126	
   127	static int acp_asoc_probe(struct platform_device *pdev)
   128	{
   129		struct snd_soc_card *card = NULL;
   130		struct device *dev = &pdev->dev;
   131		struct snd_soc_acpi_mach *mach = dev_get_platdata(&pdev->dev);
   132		const struct dmi_system_id *dmi_id;
   133		struct acp_card_drvdata *acp_card_drvdata;
   134		const char *card_name;
   135		int ret;
   136	
   137		if (!pdev->id_entry) {
   138			ret = -EINVAL;
   139			goto out;
   140		}
   141	
   142		card_name = pdev->id_entry->name;
   143	
   144		acp_card_drvdata = (struct acp_card_drvdata *)pdev->id_entry->driver_data;
   145		acp_card_drvdata->acpi_mach = (struct snd_soc_acpi_mach *)pdev->dev.platform_data;
   146	
   147		card = devm_snd_soc_card_alloc(dev, THIS_MODULE, &acp_card_driver, card_name, NULL, NULL);
   148		if (!card) {
 > 149			dev_err(dev, "devm_snd_soc_card_register(%s) failed: %d\n", card_name, ret);
   150			goto out;
   151		}
   152		snd_soc_card_attach_priv(card, acp_card_drvdata);
   153	
   154		acp_asoc_init_ops(acp_card_drvdata);
   155	
   156		/* If widgets and controls are not set in specific callback,
   157		 * they will be added per-codec in acp-mach-common.c
   158		 */
   159		ret = acp_ops_configure_widgets(card);
   160		if (ret < 0) {
   161			dev_err(&pdev->dev,
   162				"Cannot configure widgets for card (%s): %d\n",
   163				card->name, ret);
   164			goto out;
   165		}
   166	
   167		ret = acp_ops_probe(card);
   168		if (ret < 0) {
   169			dev_err(&pdev->dev,
   170				"Cannot probe card (%s): %d\n",
   171				card->name, ret);
   172			goto out;
   173		}
   174		if (!strcmp(pdev->name, "acp-pdm-mach"))
   175			acp_card_drvdata->acp_rev =  *((int *)dev->platform_data);
   176		else
   177			acp_card_drvdata->acp_rev = mach->mach_params.subsystem_rev;
   178	
   179		dmi_id = dmi_first_match(acp_quirk_table);
   180		if (dmi_id && dmi_id->driver_data)
   181			acp_card_drvdata->tdm_mode = dmi_id->driver_data;
   182	
   183		ret = acp_legacy_dai_links_create(card);
   184		if (ret) {
   185			dev_err(&pdev->dev,
   186				"Cannot create dai links for card (%s): %d\n",
   187				card->name, ret);
   188			goto out;
   189		}
   190	
   191		ret = devm_snd_soc_card_register(card);
   192		if (ret) {
   193			dev_err(&pdev->dev,
   194					"devm_snd_soc_register_card(%s) failed: %d\n",
   195					card->name, ret);
   196			goto out;
   197		}
   198	out:
   199		return ret;
   200	}
   201	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
