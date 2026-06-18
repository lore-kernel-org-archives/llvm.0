Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1BA257854;
	Thu, 18 Jun 2026 05:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781760469; cv=none; b=g2GVlNOKlAIR54DKj5mwuXggzv1/ICbmASUYvwUAqQQMg6nHN4glvwtYdpZ8CX60DZLUihDuZsfzRzorcv09E1+NNkIItGLiJjZfBf4PqMni4spWsvlh02i/vsa4h1fFWPMMC+qtVempxBLY/Jl+SSbf+onnCKRZ5fcDrJD7C6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781760469; c=relaxed/simple;
	bh=Bufpcyan5APVO8sGeoZS1h40pWx1RNwJauGj9zwlxbI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jeh3l0tywhfxtWprFBbl0+p/4WEsWWb3IbFmlMWWhJOHwS821uUGPi6glf/o9NPhjFEgn4V780lKNK1BciGwLbNXQivalP7GLLp8ekH9qhqrJYZRqvgc2bWvnll/G6thILjbwlX5jyqC4HGs4GG3Afo/VRpkSx0fuDzk55CvGFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nPDmJj0i; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nPDmJj0i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781760468; x=1813296468;
  h=date:from:to:cc:subject:message-id;
  bh=Bufpcyan5APVO8sGeoZS1h40pWx1RNwJauGj9zwlxbI=;
  b=nPDmJj0isnwPS66hc+Foe02ea7QOB6AmEQUh9pxDfzYWpCtlo8nXE3hC
   x9ZBrNCOWcgZ1pQmMeyYt6E6IrJ+JaB9eTUqb/AAwco8upklTUUsJ2zyY
   LLavGD9mN+hGFHOiAY5DiUepCng3RFJS+wePwbwUt791mDtPyJmQ3ulKu
   3yByr4ZK5LXZRKJmz7uRLSvRQd+ibuIgG/sotfkDUda17y213V6ELVw7v
   ovYYAp3f5ggcO42lrpLbngr/b0Zjfm+fD6L5qO+x5v1GQpgzXtYs4Tmr3
   uIDkrL87kY47LajdkJNHyPsidR4z+WSxhqBjWz5hiSjmjFqmG/qgoOclg
   A==;
X-CSE-ConnectionGUID: PwdcEjr3SauFhuCj2iVaRw==
X-CSE-MsgGUID: yIlLzJLJQVWnidJWCAZWEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="93238535"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="93238535"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 22:27:47 -0700
X-CSE-ConnectionGUID: x+b0Vb0UQ8Oq/jmUKThmbQ==
X-CSE-MsgGUID: 7sApJLVTQae7wCLh4+xgdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="250158273"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Jun 2026 22:27:45 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wa5Hz-00000000VGg-10uz;
	Thu, 18 Jun 2026 05:27:43 +0000
Date: Thu, 18 Jun 2026 13:27:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-16 326/326]
 sound/soc/soc-card.c:1272:8: error: no member named 'pci_subsystem_vendor' in
 'struct snd_soc_card'
Message-ID: <202606181207.dum73gpK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-16
head:   5ce50ac7d0a59c6fb15e1baa7e6824ac096fe092
commit: bcca3afbe4030eb595d239674303afc5fd051920 [326/326] ASoC: soc-card.h: remove compatible definition
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260618/202606181207.dum73gpK-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e19d1f51a2c80b63cd8ca95bcc757b7077112808)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260618/202606181207.dum73gpK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606181207.dum73gpK-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> sound/soc/soc-card.c:42:6: warning: no previous prototype for function 'snd_soc_card_attach_priv' [-Wmissing-prototypes]
      42 | void snd_soc_card_attach_priv(struct snd_soc_card *card, void *data)
         |      ^
   sound/soc/soc-card.c:42:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      42 | void snd_soc_card_attach_priv(struct snd_soc_card *card, void *data)
         | ^
         | static 
   sound/soc/soc-card.c:886:20: error: no member named 'probed' in 'struct snd_soc_card_driver'
     886 |         if (card->driver->probed &&
         |             ~~~~~~~~~~~~  ^
>> sound/soc/soc-card.c:1272:8: error: no member named 'pci_subsystem_vendor' in 'struct snd_soc_card'
    1272 |         card->pci_subsystem_vendor = vendor;
         |         ~~~~  ^
>> sound/soc/soc-card.c:1273:8: error: no member named 'pci_subsystem_device' in 'struct snd_soc_card'
    1273 |         card->pci_subsystem_device = device;
         |         ~~~~  ^
>> sound/soc/soc-card.c:1274:8: error: no member named 'pci_subsystem_set' in 'struct snd_soc_card'
    1274 |         card->pci_subsystem_set = true;
         |         ~~~~  ^
>> sound/soc/soc-card.c:1268:6: warning: no previous prototype for function 'snd_soc_card_set_pci_ssid' [-Wmissing-prototypes]
    1268 | void snd_soc_card_set_pci_ssid(struct snd_soc_card *card,
         |      ^
   sound/soc/soc-card.c:1268:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1268 | void snd_soc_card_set_pci_ssid(struct snd_soc_card *card,
         | ^
         | static 
   sound/soc/soc-card.c:1297:13: error: no member named 'pci_subsystem_set' in 'struct snd_soc_card'
    1297 |         if (!card->pci_subsystem_set)
         |              ~~~~  ^
   sound/soc/soc-card.c:1300:18: error: no member named 'pci_subsystem_vendor' in 'struct snd_soc_card'
    1300 |         *vendor = card->pci_subsystem_vendor;
         |                   ~~~~  ^
   sound/soc/soc-card.c:1301:18: error: no member named 'pci_subsystem_device' in 'struct snd_soc_card'
    1301 |         *device = card->pci_subsystem_device;
         |                   ~~~~  ^
>> sound/soc/soc-card.c:1293:5: warning: no previous prototype for function 'snd_soc_card_get_pci_ssid' [-Wmissing-prototypes]
    1293 | int snd_soc_card_get_pci_ssid(struct snd_soc_card *card,
         |     ^
   sound/soc/soc-card.c:1293:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1293 | int snd_soc_card_get_pci_ssid(struct snd_soc_card *card,
         | ^
         | static 
>> sound/soc/soc-card.c:1337:7: error: use of undeclared identifier 'card_driver'
    1337 |         if (!card_driver->name)
         |              ^~~~~~~~~~~
>> sound/soc/soc-card.c:1351:10: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct snd_soc_card *' [-Wint-conversion]
    1351 |                 return -ENOMEM;
         |                        ^~~~~~~
   3 warnings and 9 errors generated.
--
>> sound/soc/codecs/cs35l56-test.c:84:2: error: call to undeclared function 'snd_soc_card_set_pci_ssid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      84 |         snd_soc_card_set_pci_ssid(card, 0x12b4, 0xa7c8);
         |         ^
   sound/soc/codecs/cs35l56-test.c:84:2: note: did you mean 'snd_soc_card_driver_set_pci_ssid'?
   include/sound/soc-card.h:167:6: note: 'snd_soc_card_driver_set_pci_ssid' declared here
     167 | void snd_soc_card_driver_set_pci_ssid(struct snd_soc_card_driver *card_driver,
         |      ^
   sound/soc/codecs/cs35l56-test.c:98:2: error: call to undeclared function 'snd_soc_card_set_pci_ssid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      98 |         snd_soc_card_set_pci_ssid(card, 0x12b4, 0xa7c8);
         |         ^
   sound/soc/codecs/cs35l56-test.c:260:2: error: call to undeclared function 'snd_soc_card_set_pci_ssid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     260 |         snd_soc_card_set_pci_ssid(card, PCI_VENDOR_ID_DELL, 0x1234);
         |         ^
   sound/soc/codecs/cs35l56-test.c:287:2: error: call to undeclared function 'snd_soc_card_set_pci_ssid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     287 |         snd_soc_card_set_pci_ssid(card, PCI_VENDOR_ID_DELL, 0x1234);
         |         ^
   sound/soc/codecs/cs35l56-test.c:327:2: error: call to undeclared function 'snd_soc_card_set_pci_ssid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     327 |         snd_soc_card_set_pci_ssid(card, PCI_VENDOR_ID_DELL, 0x1234);
         |         ^
   sound/soc/codecs/cs35l56-test.c:558:23: error: call to undeclared function 'snd_soc_component_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     558 |         cs35l56->component = snd_soc_component_alloc(cs35l56->base.dev, &component_driver,
         |                              ^
   sound/soc/codecs/cs35l56-test.c:558:23: note: did you mean 'snd_soc_component_close'?
   include/sound/soc-component.h:347:5: note: 'snd_soc_component_close' declared here
     347 | int snd_soc_component_close(struct snd_soc_component *component,
         |     ^
   sound/soc/codecs/cs35l56-test.c:558:21: error: incompatible integer to pointer conversion assigning to 'struct snd_soc_component *' from 'int' [-Wint-conversion]
     558 |         cs35l56->component = snd_soc_component_alloc(cs35l56->base.dev, &component_driver,
         |                            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     559 |                                                      NULL, NULL, NULL, NULL);
         |                                                      ~~~~~~~~~~~~~~~~~~~~~~~
   7 errors generated.


vim +1272 sound/soc/soc-card.c

9666422c9fc116 Kuninori Morimoto 2026-06-10  1266  
9666422c9fc116 Kuninori Morimoto 2026-06-10  1267  /* REMOVE ME */
789d6dc80311d8 Kuninori Morimoto 2026-03-26 @1268  void snd_soc_card_set_pci_ssid(struct snd_soc_card *card,
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1269  			       unsigned short vendor,
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1270  			       unsigned short device)
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1271  {
789d6dc80311d8 Kuninori Morimoto 2026-03-26 @1272  	card->pci_subsystem_vendor = vendor;
789d6dc80311d8 Kuninori Morimoto 2026-03-26 @1273  	card->pci_subsystem_device = device;
789d6dc80311d8 Kuninori Morimoto 2026-03-26 @1274  	card->pci_subsystem_set = true;
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1275  }
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1276  EXPORT_SYMBOL_GPL(snd_soc_card_set_pci_ssid);
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1277  
9666422c9fc116 Kuninori Morimoto 2026-06-10  1278  int snd_soc_card_driver_get_pci_ssid(struct snd_soc_card_driver *card_driver,
9666422c9fc116 Kuninori Morimoto 2026-06-10  1279  				     unsigned short *vendor,
9666422c9fc116 Kuninori Morimoto 2026-06-10  1280  				     unsigned short *device)
9666422c9fc116 Kuninori Morimoto 2026-06-10  1281  {
9666422c9fc116 Kuninori Morimoto 2026-06-10  1282  	if (!card_driver->pci_subsystem_set)
9666422c9fc116 Kuninori Morimoto 2026-06-10  1283  		return -ENOENT;
9666422c9fc116 Kuninori Morimoto 2026-06-10  1284  
9666422c9fc116 Kuninori Morimoto 2026-06-10  1285  	*vendor = card_driver->pci_subsystem_vendor;
9666422c9fc116 Kuninori Morimoto 2026-06-10  1286  	*device = card_driver->pci_subsystem_device;
9666422c9fc116 Kuninori Morimoto 2026-06-10  1287  
9666422c9fc116 Kuninori Morimoto 2026-06-10  1288  	return 0;
9666422c9fc116 Kuninori Morimoto 2026-06-10  1289  }
9666422c9fc116 Kuninori Morimoto 2026-06-10  1290  EXPORT_SYMBOL_GPL(snd_soc_card_driver_get_pci_ssid);
9666422c9fc116 Kuninori Morimoto 2026-06-10  1291  
9666422c9fc116 Kuninori Morimoto 2026-06-10  1292  /* REMOVE ME */
789d6dc80311d8 Kuninori Morimoto 2026-03-26 @1293  int snd_soc_card_get_pci_ssid(struct snd_soc_card *card,
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1294  			      unsigned short *vendor,
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1295  			      unsigned short *device)
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1296  {
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1297  	if (!card->pci_subsystem_set)
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1298  		return -ENOENT;
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1299  
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1300  	*vendor = card->pci_subsystem_vendor;
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1301  	*device = card->pci_subsystem_device;
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1302  
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1303  	return 0;
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1304  }
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1305  EXPORT_SYMBOL_GPL(snd_soc_card_get_pci_ssid);
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1306  #endif /* CONFIG_PCI */
7928193d4258eb Kuninori Morimoto 2026-03-30  1307  
7928193d4258eb Kuninori Morimoto 2026-03-30  1308  struct snd_soc_dai *snd_soc_card_get_codec_dai(struct snd_soc_card *card,
7928193d4258eb Kuninori Morimoto 2026-03-30  1309  					       const char *dai_name)
7928193d4258eb Kuninori Morimoto 2026-03-30  1310  {
7928193d4258eb Kuninori Morimoto 2026-03-30  1311  	struct snd_soc_pcm_runtime *rtd;
7928193d4258eb Kuninori Morimoto 2026-03-30  1312  
7928193d4258eb Kuninori Morimoto 2026-03-30  1313  	for_each_card_rtds(card, rtd) {
4bbdf4f7c93787 Kuninori Morimoto 2026-06-11  1314  		const struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
4bbdf4f7c93787 Kuninori Morimoto 2026-06-11  1315  
4bbdf4f7c93787 Kuninori Morimoto 2026-06-11  1316  		if (!strcmp(snd_soc_dai_name(dai), dai_name))
7928193d4258eb Kuninori Morimoto 2026-03-30  1317  			return snd_soc_rtd_to_codec(rtd, 0);
7928193d4258eb Kuninori Morimoto 2026-03-30  1318  	}
7928193d4258eb Kuninori Morimoto 2026-03-30  1319  
7928193d4258eb Kuninori Morimoto 2026-03-30  1320  	return NULL;
7928193d4258eb Kuninori Morimoto 2026-03-30  1321  }
7928193d4258eb Kuninori Morimoto 2026-03-30  1322  EXPORT_SYMBOL_GPL(snd_soc_card_get_codec_dai);
e3f3321cabf718 Kuninori Morimoto 2026-04-07  1323  
e3f3321cabf718 Kuninori Morimoto 2026-04-07  1324  void soc_card_flush_all_delayed_work(struct snd_soc_card *card)
e3f3321cabf718 Kuninori Morimoto 2026-04-07  1325  {
e3f3321cabf718 Kuninori Morimoto 2026-04-07  1326  	struct snd_soc_pcm_runtime *rtd;
e3f3321cabf718 Kuninori Morimoto 2026-04-07  1327  
e3f3321cabf718 Kuninori Morimoto 2026-04-07  1328  	for_each_card_rtds(card, rtd)
e3f3321cabf718 Kuninori Morimoto 2026-04-07  1329  		flush_delayed_work(&rtd->delayed_work);
e3f3321cabf718 Kuninori Morimoto 2026-04-07  1330  }
07f0dd0c3aa4a2 Kuninori Morimoto 2026-05-27  1331  
bcca3afbe4030e Kuninori Morimoto 2026-06-03  1332  struct snd_soc_card *snd_soc_card_register3(struct device *dev, struct snd_soc_card_driver *driver, void *priv)
07f0dd0c3aa4a2 Kuninori Morimoto 2026-05-27  1333  {
bcca3afbe4030e Kuninori Morimoto 2026-06-03  1334  	struct snd_soc_card *card;
bcca3afbe4030e Kuninori Morimoto 2026-06-03  1335  	int ret;
bcca3afbe4030e Kuninori Morimoto 2026-06-03  1336  
bcca3afbe4030e Kuninori Morimoto 2026-06-03 @1337  	if (!card_driver->name)
bcca3afbe4030e Kuninori Morimoto 2026-06-03  1338  
bcca3afbe4030e Kuninori Morimoto 2026-06-03  1339  	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
bcca3afbe4030e Kuninori Morimoto 2026-06-03  1340  	if (!card)
bcca3afbe4030e Kuninori Morimoto 2026-06-03  1341  		return NULL;
bcca3afbe4030e Kuninori Morimoto 2026-06-03  1342  
bcca3afbe4030e Kuninori Morimoto 2026-06-03  1343  	card->dev	= dev;
bcca3afbe4030e Kuninori Morimoto 2026-06-03  1344  	card->devres_dev = dev;
bcca3afbe4030e Kuninori Morimoto 2026-06-03  1345  	card->priv	= priv;
bcca3afbe4030e Kuninori Morimoto 2026-06-03  1346  	card->driver	= driver;
bcca3afbe4030e Kuninori Morimoto 2026-06-03  1347  	card->instantiated = 0;
07f0dd0c3aa4a2 Kuninori Morimoto 2026-05-27  1348  
07f0dd0c3aa4a2 Kuninori Morimoto 2026-05-27  1349  	card->dapm = snd_soc_dapm_alloc(card->dev);
07f0dd0c3aa4a2 Kuninori Morimoto 2026-05-27  1350  	if (!card->dapm)
07f0dd0c3aa4a2 Kuninori Morimoto 2026-05-27 @1351  		return -ENOMEM;
07f0dd0c3aa4a2 Kuninori Morimoto 2026-05-27  1352  
07f0dd0c3aa4a2 Kuninori Morimoto 2026-05-27  1353  	dev_set_drvdata(card->dev, card);
07f0dd0c3aa4a2 Kuninori Morimoto 2026-05-27  1354  
07f0dd0c3aa4a2 Kuninori Morimoto 2026-05-27  1355  	INIT_LIST_HEAD(&card->widget_list_head);
07f0dd0c3aa4a2 Kuninori Morimoto 2026-05-27  1356  	INIT_LIST_HEAD(&card->path_list_head);
07f0dd0c3aa4a2 Kuninori Morimoto 2026-05-27  1357  	INIT_LIST_HEAD(&card->dapm_list_head);
07f0dd0c3aa4a2 Kuninori Morimoto 2026-05-27  1358  	INIT_LIST_HEAD(&card->dapm_dirty_list_head);
07f0dd0c3aa4a2 Kuninori Morimoto 2026-05-27  1359  	INIT_LIST_HEAD(&card->aux_list_head);
07f0dd0c3aa4a2 Kuninori Morimoto 2026-05-27  1360  	INIT_LIST_HEAD(&card->component_list_head);
07f0dd0c3aa4a2 Kuninori Morimoto 2026-05-27  1361  	INIT_LIST_HEAD(&card->unbind_list);
07f0dd0c3aa4a2 Kuninori Morimoto 2026-05-27  1362  	INIT_LIST_HEAD(&card->rtd_list_head);
07f0dd0c3aa4a2 Kuninori Morimoto 2026-05-27  1363  
07f0dd0c3aa4a2 Kuninori Morimoto 2026-05-27  1364  	mutex_init(&card->mutex);
07f0dd0c3aa4a2 Kuninori Morimoto 2026-05-27  1365  	mutex_init(&card->dapm_mutex);
07f0dd0c3aa4a2 Kuninori Morimoto 2026-05-27  1366  	mutex_init(&card->pcm_mutex);
07f0dd0c3aa4a2 Kuninori Morimoto 2026-05-27  1367  
07f0dd0c3aa4a2 Kuninori Morimoto 2026-05-27  1368  	guard(mutex)(&client_mutex);
07f0dd0c3aa4a2 Kuninori Morimoto 2026-05-27  1369  
bcca3afbe4030e Kuninori Morimoto 2026-06-03  1370  	ret = call_soc_bind_card(card);
4587ffa04798ff Kuninori Morimoto 2026-06-03  1371  	if (ret < 0)
4587ffa04798ff Kuninori Morimoto 2026-06-03  1372  		return NULL;
4587ffa04798ff Kuninori Morimoto 2026-06-03  1373  
4587ffa04798ff Kuninori Morimoto 2026-06-03  1374  	return card;
4587ffa04798ff Kuninori Morimoto 2026-06-03  1375  }
4587ffa04798ff Kuninori Morimoto 2026-06-03  1376  EXPORT_SYMBOL_GPL(snd_soc_card_register3);
4587ffa04798ff Kuninori Morimoto 2026-06-03  1377  

:::::: The code at line 1272 was first introduced by commit
:::::: 789d6dc80311d84d93dd24b965cdd0319108562c ASoC: soc-card: move snd_soc_card_{set/get}_pci_ssid() to soc-card.c

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
