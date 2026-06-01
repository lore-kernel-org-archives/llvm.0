Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF1B359A81;
	Mon,  1 Jun 2026 19:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780343237; cv=none; b=famT4mFhVdScg1og0NZRUPMiBA6JmZij7UWJKK8qihJakcn659pCIM2q9sY+/h84iq5jPVHP8UP1ub8fPwqNewpyc848Tizs1tnilRPwol1v7w+xT+w+QIVHwzISKC6fpvWHKMlj+gfs0DF+31lMPqK8BY4dVkr7Ycqf/kkgqYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780343237; c=relaxed/simple;
	bh=RgQLVU0v4z9jXrZH+0a0VNNEzfsMOJgetTFzqQshON8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H1j3zEBbmoWcI76BaxPsWw1djzSHPckuR+ZVSm9vxwoMgegbCizB8fWSLtgHnWh6hCR07GMVctM0p6ulJUr75KicH02OgCrW6LiKTH1AG00OJxUy6i/AdqykU4GE++tclnlhcuPDIWVASt2kHzqkCjBMVw4Tu8eEQfQWMwCSqyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JUZpW8hT; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JUZpW8hT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780343236; x=1811879236;
  h=date:from:to:cc:subject:message-id;
  bh=RgQLVU0v4z9jXrZH+0a0VNNEzfsMOJgetTFzqQshON8=;
  b=JUZpW8hTUSx2JTSM+vtwfvzAqDtbbSe6IWUdj+XDhCxAH7agoLiOkq4T
   GDY7EPBH+HUPlxUFg0tRRlguag8htN/KKkNjrjtQuodAj06kJ4ngGmzA7
   eO9SiPDrPLkMIjxJpgvZwCM/MT7MlwRvVVZ9FTlNzmcVCxXyRwHAk3VIH
   ZZnZOBoCm1997KhPZF57drB12PSYISir2tauKUKpexfqMyggvneIRABki
   2kc9+fuAayoWn03X0ShO9XWvlAP3UPsYiJgY0Xr69L1ynPY60+RwqQsG0
   RjfdEbMVh71dtp5Xx4j3cd7kHrVJiUXOGeQlA128cFoHlgxJ2odYJa1jb
   g==;
X-CSE-ConnectionGUID: fpZEroKWQhWrO6dT5RYBIg==
X-CSE-MsgGUID: US2tbanfTWe9LmE++4q0fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81141039"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="81141039"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 12:47:15 -0700
X-CSE-ConnectionGUID: V+U+JAvgSoaqp51yEVjo1w==
X-CSE-MsgGUID: Et6cfNSQQPqs17fxTx4+hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="240676853"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 01 Jun 2026 12:47:14 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU8bP-00000000B1U-3ObA;
	Mon, 01 Jun 2026 19:47:11 +0000
Date: Tue, 02 Jun 2026 03:46:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/generic/audio-graph-card.c:559:3: error: cannot jump from this goto
 statement to its label
Message-ID: <202606020324.XOXU3UUE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: 8b2c2285d52a963fe976708999062dd19988df3a [290/290] ASoC: generic: use snd_soc_card_register()
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260602/202606020324.XOXU3UUE-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606020324.XOXU3UUE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606020324.XOXU3UUE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/generic/audio-graph-card.c:559:3: error: cannot jump from this goto statement to its label
     559 |                 goto end;
         |                 ^
   sound/soc/generic/audio-graph-card.c:562:20: note: jump bypasses initialization of variable with __attribute__((cleanup))
     562 |         struct link_info *li __free(kfree) = kzalloc_obj(*li);
         |                           ^
   1 error generated.
--
>> sound/soc/generic/audio-graph-card2.c:1322:3: error: cannot jump from this goto statement to its label
    1322 |                 goto end;
         |                 ^
   sound/soc/generic/audio-graph-card2.c:1325:20: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1325 |         struct link_info *li __free(kfree) = kzalloc_obj(*li);
         |                           ^
   1 error generated.


vim +559 sound/soc/generic/audio-graph-card.c

   550	
   551	int audio_graph_parse_of(struct simple_util_priv *priv)
   552	{
   553		struct snd_soc_card_driver *card_driver = simple_priv_to_card_driver(priv);
   554		struct device *dev = simple_priv_to_dev(priv);
   555		struct snd_soc_card *card;
   556		int ret = -EINVAL;
   557	
   558		if (!dev)
 > 559			goto end;
   560	
   561		ret = -ENOMEM;
   562		struct link_info *li __free(kfree) = kzalloc_obj(*li);
   563		if (!li)
   564			goto end;
   565	
   566		ret = graph_get_dais_count(priv, li);
   567		if (ret < 0)
   568			goto end;
   569	
   570		ret = -EINVAL;
   571		if (!li->link)
   572			goto end;
   573	
   574		ret = simple_util_init_priv(priv, li);
   575		if (ret < 0)
   576			goto end;
   577	
   578		priv->pa_gpio = devm_gpiod_get_optional(dev, "pa", GPIOD_OUT_LOW);
   579		if (IS_ERR(priv->pa_gpio)) {
   580			ret = PTR_ERR(priv->pa_gpio);
   581			dev_err(dev, "failed to get amplifier gpio: %d\n", ret);
   582			goto end;
   583		}
   584	
   585		ret = simple_util_parse_widgets(priv, NULL);
   586		if (ret < 0)
   587			goto end;
   588	
   589		ret = simple_util_parse_routing(priv, NULL);
   590		if (ret < 0)
   591			goto end;
   592	
   593		ret = simple_util_parse_card_name(priv, NULL);
   594		if (ret < 0)
   595			goto err;
   596	
   597		memset(li, 0, sizeof(*li));
   598		ret = graph_for_each_link(priv, li,
   599					  graph_dai_link_of,
   600					  graph_dai_link_of_dpcm);
   601		if (ret < 0)
   602			goto err;
   603	
   604		card = devm_snd_soc_card_alloc(dev, card_driver);
   605		if (!card)
   606			goto err;
   607	
   608		snd_soc_card_set_drvdata(card, priv);
   609	
   610		simple_util_debug_info(priv);
   611	
   612		ret = devm_snd_soc_card_register(card);
   613	err:
   614		if (ret < 0) {
   615			simple_util_clean_reference(priv);
   616			return dev_err_probe(dev, ret, "parse error\n");
   617		}
   618	end:
   619		return graph_ret(priv, ret);
   620	}
   621	EXPORT_SYMBOL_GPL(audio_graph_parse_of);
   622	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
