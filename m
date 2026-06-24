Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2AC3DB30A;
	Wed, 24 Jun 2026 15:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782316735; cv=none; b=nneumNvJoSjcP55nM4GFhnqo10RBm2YW7vvfhrOugNsubkFLK+8wRH7/HcmN8IM+dp6J1zNnlHymbRtGdhFnQvuB/zMR11RMyzoiWTm2PJ7maN7ZREG3ppOaKaj+kRvnk7IOU6ENrcDu23nj1CFSohvuq8yYUysGzLTDPJLX5LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782316735; c=relaxed/simple;
	bh=zCE016P94eYVlGiOfH2JxMVTtg70JKE/XyDtX/VaqDs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rb+y+79fnCdzjpolzku0WRSepg8bnAjABqi7o8/QbRf2eX9JdMAQN/muAUQMv+EDmV8HD4klw0/yjTjdY7J7eYlHnreV0lTjfmN/FkTiF5yfUzxos4p5ntOznzjsFvF6vXlXNBDTsj1EXKMrSvdYykks1C6c0JGGbfkcCIrfo8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UMhA2KSt; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UMhA2KSt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782316734; x=1813852734;
  h=date:from:to:cc:subject:message-id;
  bh=zCE016P94eYVlGiOfH2JxMVTtg70JKE/XyDtX/VaqDs=;
  b=UMhA2KSt5ILoulNAIVmGz6w78zF1fprjFPF6LV2A6MaTteAX5P0YLXRM
   Aiku0ZwEApf88pgyKoJ+nFDZHm1/ZrQtre25U4sVCqZPSocuC3dJez171
   g2CXX1KAqDhY03dS/EVYxW7PScsz+Z7XKTYKJA1aXN1lopPT3gwCfOF4f
   YANvzW8zNYgFxzvIZoi6oGO9vBVZVDC8sEkYWq8L1aBrXhJQ/1cNDzfbo
   E7eKjK29a2G3qxNps9mwFYJQd2qpOM1Qyp/zUeuCHbe2uy3lKMm7suSkz
   Yu/v9pkZLHVzHCOexmLfAAfgoi/82Xignz5wc40I8ayeGsY0Yy5rtY2Pe
   A==;
X-CSE-ConnectionGUID: cNL2OEdbSl2t20bKLQqVlQ==
X-CSE-MsgGUID: DORTufsKRweXvN5PobV2Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="94479462"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="94479462"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 08:58:53 -0700
X-CSE-ConnectionGUID: mSRdpW/2T8ueDqwS5mkncQ==
X-CSE-MsgGUID: LfKV9xy1TzeTC6nDUchRrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="254858057"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 24 Jun 2026 08:58:53 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcQ01-000000003Sr-2277;
	Wed, 24 Jun 2026 15:58:49 +0000
Date: Wed, 24 Jun 2026 23:58:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-19 260/326]
 sound/soc/mediatek/mt6797/mt6797-mt6351.c:219:6: warning: variable 'ret' is
 used uninitialized whenever 'if' condition is false
Message-ID: <202606242358.Yfb71Aj5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-19
head:   885feafb1fe92b67450ae8ac4996368e3a6dd242
commit: ea64c228b8dadefdf4c174a71a6e57820da75c6c [260/326] ASoC: mediatek: mt6797-mt6351: use snd_soc_card_register()
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260624/202606242358.Yfb71Aj5-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project a9b492db3d50683e446cd1a5c9ffaf4e92cb77a7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606242358.Yfb71Aj5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606242358.Yfb71Aj5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/mediatek/mt6797/mt6797-mt6351.c:219:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     219 |         if (!card)
         |             ^~~~~
   sound/soc/mediatek/mt6797/mt6797-mt6351.c:222:6: note: uninitialized use occurs here
     222 |         if (ret)
         |             ^~~
   sound/soc/mediatek/mt6797/mt6797-mt6351.c:219:2: note: remove the 'if' if its condition is always true
     219 |         if (!card)
         |         ^~~~~~~~~~
     220 |                 ret = -ENOMEM;
   sound/soc/mediatek/mt6797/mt6797-mt6351.c:190:9: note: initialize the variable 'ret' to silence this warning
     190 |         int ret, i;
         |                ^
         |                 = 0
   1 warning generated.


vim +219 sound/soc/mediatek/mt6797/mt6797-mt6351.c

   183	
   184	static int mt6797_mt6351_dev_probe(struct platform_device *pdev)
   185	{
   186		struct snd_soc_card *card;
   187		struct snd_soc_card_driver *card_driver = &mt6797_mt6351_card_driver;
   188		struct device_node *platform_node, *codec_node;
   189		struct snd_soc_dai_link *dai_link;
   190		int ret, i;
   191	
   192		platform_node = of_parse_phandle(pdev->dev.of_node,
   193						 "mediatek,platform", 0);
   194		if (!platform_node) {
   195			dev_err(&pdev->dev, "Property 'platform' missing or invalid\n");
   196			return -EINVAL;
   197		}
   198		for_each_card_driver_prelinks(card_driver, i, dai_link) {
   199			if (dai_link->platforms->name)
   200				continue;
   201			dai_link->platforms->of_node = platform_node;
   202		}
   203	
   204		codec_node = of_parse_phandle(pdev->dev.of_node,
   205					      "mediatek,audio-codec", 0);
   206		if (!codec_node) {
   207			dev_err(&pdev->dev,
   208				"Property 'audio-codec' missing or invalid\n");
   209			ret = -EINVAL;
   210			goto put_platform_node;
   211		}
   212		for_each_card_driver_prelinks(card_driver, i, dai_link) {
   213			if (dai_link->codecs->name)
   214				continue;
   215			dai_link->codecs->of_node = codec_node;
   216		}
   217	
   218		card = devm_snd_soc_card_register(&pdev->dev, card_driver);
 > 219		if (!card)
   220			ret = -ENOMEM;
   221	
   222		if (ret)
   223			dev_err(&pdev->dev, "%s snd_soc_card_register() fail %d\n",
   224				__func__, ret);
   225	
   226		of_node_put(codec_node);
   227	put_platform_node:
   228		of_node_put(platform_node);
   229		return ret;
   230	}
   231	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
