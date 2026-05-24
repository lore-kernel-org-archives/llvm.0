Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CDA39D6FA;
	Sun, 24 May 2026 15:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779637514; cv=none; b=DfxmG5wM7qE9OQlCCvFQxydev5g4sqU+USuxsV/F0FSpND3/IDvTiiT1ZZfyk33wfDBODrIsvSqK6Mb16Fw6mIFka5V3/d1V8Au7IQrLcGWIB2B1sUjtXFeUXVdHqp3dXIiILFL/fkvV+t/ILypQms1UsgRWz9HVuTVwKA1ewlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779637514; c=relaxed/simple;
	bh=dHGXHMwIfliN1GiD+ZpFKL/2KogprR2jzD3fIn9l918=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MhizNxFzwtuloeLX2NfsLdSu6rb7gaOQcp3nLK+Z2msosWB6PLAAK7aXHzfajdo5domav+iBegeXwVUipIzavNlXNuUM4IHjL3u9N8WWhbax7Cyda63jym/n5fvjQ3Kj3u7pOVdAVYiO3ayM+++/ie8ltanFf3OTg10pi1jlbIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l/y6f39x; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/y6f39x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779637511; x=1811173511;
  h=date:from:to:cc:subject:message-id;
  bh=dHGXHMwIfliN1GiD+ZpFKL/2KogprR2jzD3fIn9l918=;
  b=l/y6f39xF5z2EjJreIMS7PjjXoNyJTAn6tGPIZxFc7HSw50/3DXOKHML
   f3PoyJ4kF1mxSp5KG7y3C0GCtqleLUL9EgwNa9fSCEmA79OEpVohTE9dy
   dtNv5FY11u+7DQLLiBD6rQm9+YGlKelf8Uian9jju+Dce28hCNvaFwh/j
   rR0jcdNKxOXhfm+ArvAWraU1kh68/5J4qojCYfCor4w1b5YXVZOtdryDO
   WUChQAxe0YJ0d2FhB5gPsAmbYonyNJ2esXu/aVLgqrX7n3QVtIbKlsGXL
   ILeHmX8EPfLGJWJ+SQ/n3SCmNuWQsSDgt91HHKXuklqaG3P81Ld+zY30C
   A==;
X-CSE-ConnectionGUID: ANcJXRDNR3CDXn+Q1hUBNQ==
X-CSE-MsgGUID: VwIwYDJSTymCBAMf99d9fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="91953373"
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="91953373"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 08:45:11 -0700
X-CSE-ConnectionGUID: 6ahZzWCKSo2W7rRV53jX5g==
X-CSE-MsgGUID: ZwPXnFsfTSSIAHi6eWCJmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="245422369"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 May 2026 08:45:09 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRB0k-000000000LR-1XTV;
	Sun, 24 May 2026 15:45:06 +0000
Date: Sun, 24 May 2026 23:45:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-05-22-2 254/254]
 sound/soc/generic/simple-card.c:767:7: warning: variable 'card' is used
 uninitialized whenever 'if' condition is true
Message-ID: <202605242344.gE9wmwtN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-05-22-2
head:   7f5e6579901e0a1f3ff8bb45002dc226961a56ce
commit: 7ef1ca7325d4d74d6a20d348a5a8e403992964ab [254/254] ASoC: generic: use snd_soc_card_register()
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260524/202605242344.gE9wmwtN-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605242344.gE9wmwtN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605242344.gE9wmwtN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/generic/simple-card.c:767:7: warning: variable 'card' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     767 |                 if (!cinfo->name ||
         |                     ^~~~~~~~~~~~~~~
     768 |                     !cinfo->codec_dai.name ||
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~
     769 |                     !cinfo->codec ||
         |                     ~~~~~~~~~~~~~~~~
     770 |                     !cinfo->platform ||
         |                     ~~~~~~~~~~~~~~~~~~~
     771 |                     !cinfo->cpu_dai.name) {
         |                     ~~~~~~~~~~~~~~~~~~~~
   sound/soc/generic/simple-card.c:814:30: note: uninitialized use occurs here
     814 |         simple_util_clean_reference(card);
         |                                     ^~~~
   sound/soc/generic/simple-card.c:767:3: note: remove the 'if' if its condition is always false
     767 |                 if (!cinfo->name ||
         |                 ^~~~~~~~~~~~~~~~~~~
     768 |                     !cinfo->codec_dai.name ||
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~
     769 |                     !cinfo->codec ||
         |                     ~~~~~~~~~~~~~~~~
     770 |                     !cinfo->platform ||
         |                     ~~~~~~~~~~~~~~~~~~~
     771 |                     !cinfo->cpu_dai.name) {
         |                     ~~~~~~~~~~~~~~~~~~~~~~~
     772 |                         dev_err(dev, "insufficient simple_util_info settings\n");
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     773 |                         goto err;
         |                         ~~~~~~~~~
     774 |                 }
         |                 ~
>> sound/soc/generic/simple-card.c:767:7: warning: variable 'card' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
     767 |                 if (!cinfo->name ||
         |                     ^~~~~~~~~~~~~~~
     768 |                     !cinfo->codec_dai.name ||
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~
     769 |                     !cinfo->codec ||
         |                     ~~~~~~~~~~~~~~~~
     770 |                     !cinfo->platform ||
         |                     ~~~~~~~~~~~~~~~~
   sound/soc/generic/simple-card.c:814:30: note: uninitialized use occurs here
     814 |         simple_util_clean_reference(card);
         |                                     ^~~~
   sound/soc/generic/simple-card.c:767:7: note: remove the '||' if its condition is always false
     767 |                 if (!cinfo->name ||
         |                     ^~~~~~~~~~~~~~~
     768 |                     !cinfo->codec_dai.name ||
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~
     769 |                     !cinfo->codec ||
         |                     ~~~~~~~~~~~~~~~~
     770 |                     !cinfo->platform ||
         |                     ~~~~~~~~~~~~~~~~~~~
>> sound/soc/generic/simple-card.c:767:7: warning: variable 'card' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
     767 |                 if (!cinfo->name ||
         |                     ^~~~~~~~~~~~~~~
     768 |                     !cinfo->codec_dai.name ||
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~
     769 |                     !cinfo->codec ||
         |                     ~~~~~~~~~~~~~
   sound/soc/generic/simple-card.c:814:30: note: uninitialized use occurs here
     814 |         simple_util_clean_reference(card);
         |                                     ^~~~
   sound/soc/generic/simple-card.c:767:7: note: remove the '||' if its condition is always false
     767 |                 if (!cinfo->name ||
         |                     ^~~~~~~~~~~~~~~
     768 |                     !cinfo->codec_dai.name ||
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~
     769 |                     !cinfo->codec ||
         |                     ~~~~~~~~~~~~~~~~
>> sound/soc/generic/simple-card.c:767:7: warning: variable 'card' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
     767 |                 if (!cinfo->name ||
         |                     ^~~~~~~~~~~~~~~
     768 |                     !cinfo->codec_dai.name ||
         |                     ~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/generic/simple-card.c:814:30: note: uninitialized use occurs here
     814 |         simple_util_clean_reference(card);
         |                                     ^~~~
   sound/soc/generic/simple-card.c:767:7: note: remove the '||' if its condition is always false
     767 |                 if (!cinfo->name ||
         |                     ^~~~~~~~~~~~~~~
     768 |                     !cinfo->codec_dai.name ||
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/generic/simple-card.c:767:7: warning: variable 'card' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
     767 |                 if (!cinfo->name ||
         |                     ^~~~~~~~~~~~
   sound/soc/generic/simple-card.c:814:30: note: uninitialized use occurs here
     814 |         simple_util_clean_reference(card);
         |                                     ^~~~
   sound/soc/generic/simple-card.c:767:7: note: remove the '||' if its condition is always false
     767 |                 if (!cinfo->name ||
         |                     ^~~~~~~~~~~~~~~
   sound/soc/generic/simple-card.c:762:7: warning: variable 'card' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     762 |                 if (!cinfo) {
         |                     ^~~~~~
   sound/soc/generic/simple-card.c:814:30: note: uninitialized use occurs here
     814 |         simple_util_clean_reference(card);
         |                                     ^~~~
   sound/soc/generic/simple-card.c:762:3: note: remove the 'if' if its condition is always false
     762 |                 if (!cinfo) {
         |                 ^~~~~~~~~~~~~
     763 |                         dev_err(dev, "no info for asoc-simple-card\n");
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     764 |                         goto err;
         |                         ~~~~~~~~~
     765 |                 }
         |                 ~
   sound/soc/generic/simple-card.c:746:7: warning: variable 'card' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     746 |                 if (ret < 0) {
         |                     ^~~~~~~
   sound/soc/generic/simple-card.c:814:30: note: uninitialized use occurs here
     814 |         simple_util_clean_reference(card);
         |                                     ^~~~
   sound/soc/generic/simple-card.c:746:3: note: remove the 'if' if its condition is always false
     746 |                 if (ret < 0) {
         |                 ^~~~~~~~~~~~~~
     747 |                         dev_err_probe(dev, ret, "parse error\n");
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     748 |                         goto err;
         |                         ~~~~~~~~~
     749 |                 }
         |                 ~
   sound/soc/generic/simple-card.c:717:27: note: initialize the variable 'card' to silence this warning
     717 |         struct snd_soc_card *card;
         |                                  ^
         |                                   = NULL
   7 warnings generated.
--
>> sound/soc/tegra/tegra_audio_graph_card.c:215:2: warning: variable 'card' is uninitialized when used here [-Wuninitialized]
     215 |         card->component_chaining = 1;
         |         ^~~~
   sound/soc/tegra/tegra_audio_graph_card.c:208:27: note: initialize the variable 'card' to silence this warning
     208 |         struct snd_soc_card *card;
         |                                  ^
         |                                   = NULL
   1 warning generated.


vim +767 sound/soc/generic/simple-card.c

7ef1ca7325d4d7 Kuninori Morimoto   2026-04-20  711  
b4b7de99c6da46 Kuninori Morimoto   2023-09-11  712  static int simple_probe(struct platform_device *pdev)
f2390880ec0264 Kuninori Morimoto   2012-04-08  713  {
b4b7de99c6da46 Kuninori Morimoto   2023-09-11  714  	struct simple_util_priv *priv;
f89983ef61677a Kuninori Morimoto   2012-12-25  715  	struct device *dev = &pdev->dev;
dcee9bfe890451 Kuninori Morimoto   2017-03-15  716  	struct device_node *np = dev->of_node;
5be509576cf634 Kuninori Morimoto   2017-03-15  717  	struct snd_soc_card *card;
7ef1ca7325d4d7 Kuninori Morimoto   2026-04-20  718  	const char *card_name = NULL;
65a5056b21202e Kuninori Morimoto   2019-03-20  719  	int ret;
f2390880ec0264 Kuninori Morimoto   2012-04-08  720  
0dd4fc3c2f663b Xiubo Li            2014-09-10  721  	/* Allocate the private data and the DAI link array */
b0133d9c4d7600 Kuninori Morimoto   2016-08-26  722  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
ca65b492c7a265 Jean-Francois Moine 2014-01-15  723  	if (!priv)
ca919fe4b972b9 Xiubo Li            2014-01-14  724  		return -ENOMEM;
ca919fe4b972b9 Xiubo Li            2014-01-14  725  
a0ef5b4b101424 Kuninori Morimoto   2025-02-05  726  	ret = -ENOMEM;
bf4afc53b77aea Linus Torvalds      2026-02-21  727  	struct link_info *li __free(kfree) = kzalloc_obj(*li);
ec1af6c64db94e Thierry Reding      2021-04-19  728  	if (!li)
a0ef5b4b101424 Kuninori Morimoto   2025-02-05  729  		goto end;
ec1af6c64db94e Thierry Reding      2021-04-19  730  
ec1af6c64db94e Thierry Reding      2021-04-19  731  	ret = simple_get_dais_count(priv, li);
0f687d826736a5 Thierry Reding      2021-04-16  732  	if (ret < 0)
a0ef5b4b101424 Kuninori Morimoto   2025-02-05  733  		goto end;
0f687d826736a5 Thierry Reding      2021-04-16  734  
a0ef5b4b101424 Kuninori Morimoto   2025-02-05  735  	ret = -EINVAL;
ec1af6c64db94e Thierry Reding      2021-04-19  736  	if (!li->link)
a0ef5b4b101424 Kuninori Morimoto   2025-02-05  737  		goto end;
da215354eb55c3 Kuninori Morimoto   2018-12-14  738  
b4b7de99c6da46 Kuninori Morimoto   2023-09-11  739  	ret = simple_util_init_priv(priv, li);
65a5056b21202e Kuninori Morimoto   2019-03-20  740  	if (ret < 0)
a0ef5b4b101424 Kuninori Morimoto   2025-02-05  741  		goto end;
201a0eac7fe5e7 Jean-Francois Moine 2014-01-15  742  
201a0eac7fe5e7 Jean-Francois Moine 2014-01-15  743  	if (np && of_device_is_available(np)) {
ca919fe4b972b9 Xiubo Li            2014-01-14  744  
ec1af6c64db94e Thierry Reding      2021-04-19  745  		ret = simple_parse_of(priv, li);
fa558c2801fc17 Kuninori Morimoto   2013-11-20  746  		if (ret < 0) {
7a0299e13bc740 Kuninori Morimoto   2021-12-14  747  			dev_err_probe(dev, ret, "parse error\n");
e512e001dafa54 Jean-Francois Moine 2014-03-11  748  			goto err;
fa558c2801fc17 Kuninori Morimoto   2013-11-20  749  		}
6a91a17bd7b92b Jean-Francois Moine 2014-03-20  750  
fa558c2801fc17 Kuninori Morimoto   2013-11-20  751  	} else {
b4b7de99c6da46 Kuninori Morimoto   2023-09-11  752  		struct simple_util_info *cinfo;
f107294c6422e7 Kuninori Morimoto   2019-06-06  753  		struct snd_soc_dai_link_component *cpus;
710af9196ce614 Kuninori Morimoto   2018-08-31  754  		struct snd_soc_dai_link_component *codecs;
e58f41e41185c6 Kuninori Morimoto   2018-08-31  755  		struct snd_soc_dai_link_component *platform;
65a5056b21202e Kuninori Morimoto   2019-03-20  756  		struct snd_soc_dai_link *dai_link = priv->dai_link;
65a5056b21202e Kuninori Morimoto   2019-03-20  757  		struct simple_dai_props *dai_props = priv->dai_props;
65a5056b21202e Kuninori Morimoto   2019-03-20  758  
41bae58df411f9 Kuninori Morimoto   2023-09-19  759  		ret = -EINVAL;
41bae58df411f9 Kuninori Morimoto   2023-09-19  760  
ca65b492c7a265 Jean-Francois Moine 2014-01-15  761  		cinfo = dev->platform_data;
ca65b492c7a265 Jean-Francois Moine 2014-01-15  762  		if (!cinfo) {
f89983ef61677a Kuninori Morimoto   2012-12-25  763  			dev_err(dev, "no info for asoc-simple-card\n");
41bae58df411f9 Kuninori Morimoto   2023-09-19  764  			goto err;
f2390880ec0264 Kuninori Morimoto   2012-04-08  765  		}
f2390880ec0264 Kuninori Morimoto   2012-04-08  766  
f2390880ec0264 Kuninori Morimoto   2012-04-08 @767  		if (!cinfo->name ||
fa558c2801fc17 Kuninori Morimoto   2013-11-20  768  		    !cinfo->codec_dai.name ||
7722f830a45f7f Jean-Francois Moine 2014-01-15  769  		    !cinfo->codec ||
7722f830a45f7f Jean-Francois Moine 2014-01-15  770  		    !cinfo->platform ||
7722f830a45f7f Jean-Francois Moine 2014-01-15  771  		    !cinfo->cpu_dai.name) {
b4b7de99c6da46 Kuninori Morimoto   2023-09-11  772  			dev_err(dev, "insufficient simple_util_info settings\n");
41bae58df411f9 Kuninori Morimoto   2023-09-19  773  			goto err;
f2390880ec0264 Kuninori Morimoto   2012-04-08  774  		}
2bee991460a838 Jean-Francois Moine 2014-01-15  775  
f107294c6422e7 Kuninori Morimoto   2019-06-06  776  		cpus			= dai_link->cpus;
f107294c6422e7 Kuninori Morimoto   2019-06-06  777  		cpus->dai_name		= cinfo->cpu_dai.name;
f107294c6422e7 Kuninori Morimoto   2019-06-06  778  
710af9196ce614 Kuninori Morimoto   2018-08-31  779  		codecs			= dai_link->codecs;
710af9196ce614 Kuninori Morimoto   2018-08-31  780  		codecs->name		= cinfo->codec;
710af9196ce614 Kuninori Morimoto   2018-08-31  781  		codecs->dai_name	= cinfo->codec_dai.name;
710af9196ce614 Kuninori Morimoto   2018-08-31  782  
910fdcabedd235 Kuninori Morimoto   2019-01-21  783  		platform		= dai_link->platforms;
e58f41e41185c6 Kuninori Morimoto   2018-08-31  784  		platform->name		= cinfo->platform;
e58f41e41185c6 Kuninori Morimoto   2018-08-31  785  
7ef1ca7325d4d7 Kuninori Morimoto   2026-04-20  786  		card_name		= (cinfo->card) ? cinfo->card : cinfo->name;
5ca8ba4180a6f6 Jean-Francois Moine 2014-01-15  787  		dai_link->name		= cinfo->name;
5ca8ba4180a6f6 Jean-Francois Moine 2014-01-15  788  		dai_link->stream_name	= cinfo->name;
1efb53a220b78f Lars-Peter Clausen  2015-03-24  789  		dai_link->dai_fmt	= cinfo->daifmt;
b4b7de99c6da46 Kuninori Morimoto   2023-09-11  790  		dai_link->init		= simple_util_dai_init;
65a5056b21202e Kuninori Morimoto   2019-03-20  791  		memcpy(dai_props->cpu_dai, &cinfo->cpu_dai,
65a5056b21202e Kuninori Morimoto   2019-03-20  792  					sizeof(*dai_props->cpu_dai));
65a5056b21202e Kuninori Morimoto   2019-03-20  793  		memcpy(dai_props->codec_dai, &cinfo->codec_dai,
65a5056b21202e Kuninori Morimoto   2019-03-20  794  					sizeof(*dai_props->codec_dai));
7722f830a45f7f Jean-Francois Moine 2014-01-15  795  	}
f2390880ec0264 Kuninori Morimoto   2012-04-08  796  
7ef1ca7325d4d7 Kuninori Morimoto   2026-04-20  797  	card = devm_snd_soc_card_alloc(dev, THIS_MODULE, &card_driver,
7ef1ca7325d4d7 Kuninori Morimoto   2026-04-20  798  				       card_name, NULL, NULL);
7ef1ca7325d4d7 Kuninori Morimoto   2026-04-20  799  	if (!card)
7ef1ca7325d4d7 Kuninori Morimoto   2026-04-20  800  		goto err;
7ef1ca7325d4d7 Kuninori Morimoto   2026-04-20  801  
7ef1ca7325d4d7 Kuninori Morimoto   2026-04-20  802  	priv->snd_card = card;
7ef1ca7325d4d7 Kuninori Morimoto   2026-04-20  803  
5be509576cf634 Kuninori Morimoto   2017-03-15  804  	snd_soc_card_set_drvdata(card, priv);
f2390880ec0264 Kuninori Morimoto   2012-04-08  805  
b4b7de99c6da46 Kuninori Morimoto   2023-09-11  806  	simple_util_debug_info(priv);
0580dde5943868 Kuninori Morimoto   2019-03-20  807  
7ef1ca7325d4d7 Kuninori Morimoto   2026-04-20  808  	ret = devm_snd_soc_card_register(card);
c6d112e442fed7 Kuninori Morimoto   2017-05-19  809  	if (ret < 0)
c6d112e442fed7 Kuninori Morimoto   2017-05-19  810  		goto err;
c6d112e442fed7 Kuninori Morimoto   2017-05-19  811  
c6d112e442fed7 Kuninori Morimoto   2017-05-19  812  	return 0;
e512e001dafa54 Jean-Francois Moine 2014-03-11  813  err:
b4b7de99c6da46 Kuninori Morimoto   2023-09-11  814  	simple_util_clean_reference(card);
a0ef5b4b101424 Kuninori Morimoto   2025-02-05  815  end:
a0ef5b4b101424 Kuninori Morimoto   2025-02-05  816  	return dev_err_probe(dev, ret, "parse error\n");
f2390880ec0264 Kuninori Morimoto   2012-04-08  817  }
f2390880ec0264 Kuninori Morimoto   2012-04-08  818  

:::::: The code at line 767 was first introduced by commit
:::::: f2390880ec0264a0ed26b32c23bc23435b4297da ASoC: add generic simple-card support

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
