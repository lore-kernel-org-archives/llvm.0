Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4E33D3B3;
	Thu, 23 Apr 2026 04:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776919991; cv=none; b=DwcQ9OoVrC17ZW4rB9gvPB9c6K5Wet1Nx55ipb/F9AV6XSHKby/4P6I6ZuXyczUqcrJ2gOPr/vN58yAm6ySjttlH66OSRfPe2xm38xtwBCRMimCZdcnV6Tg4Hmw+8pX6LFDz6uLuxmzwTw/RyMiw1m3PY+bw5tm3T+l3AoBC59w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776919991; c=relaxed/simple;
	bh=wnPMqrjzMxaKRUJBIDcEdbJagLtJjw/bNHmQDO7EXEg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uO7PoEZzWytSgvURbHHj0OeEzpxTf1YbjdOdy0n4off9totPy75kx23ZSDKbELBF3gIRTgDMYIEnPTgd5aKlPltfnbsS7HBfdWeKRguQwg4L7KkVF3hE/S50nb+SyuNQ8QzN+P+vTuhySjMIUM+wj9MN7XFj2tRWMA0MRn6vQqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hd17JL2x; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hd17JL2x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776919988; x=1808455988;
  h=date:from:to:cc:subject:message-id;
  bh=wnPMqrjzMxaKRUJBIDcEdbJagLtJjw/bNHmQDO7EXEg=;
  b=hd17JL2xRFrlrUdRcQzTq9b0g7rJASBxU07Fn7aVqV6gHBMdJBslaIFT
   QbAtI3QTZJ0Q+agrfVDZerkJiVgKutSkncxkW+DgtJb+R334/VFqx/KXu
   mjeBwnkqWYwtsn/vjpan23CtEm34qU97EqZ4na+GppdowvYW+5PW265+s
   sR7LFAWX8SeOKDcngR4RnRGfdJhH6WHjUKG/82R97jJSE5OJUfCYAN9Av
   s1v2QFxtHPKvMjHqVuZ8a8ToJo1bZ9KiezQx1aMTN3K9p9+CuGrIkWnHb
   o9j/bUNLWn/cdsGq+krx3hFXBrKSUuH7zuVM+dtuyiQlX/N3J8voMjrMi
   A==;
X-CSE-ConnectionGUID: ioJC2IjnSSqMK3sNqQVMaA==
X-CSE-MsgGUID: eHKXT8DlRpqqqkzVrqctaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77045276"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="77045276"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 21:53:08 -0700
X-CSE-ConnectionGUID: vNLn79mFTz683a1qdUYuQA==
X-CSE-MsgGUID: r2msdUE7R3Ww7SdBPri67A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="237537166"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Apr 2026 21:53:06 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFm3j-000000001UP-2Mo6;
	Thu, 23 Apr 2026 04:53:03 +0000
Date: Thu, 23 Apr 2026 12:52:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-04-21 167/167]
 sound/soc/generic/simple-card.c:767:7: warning: variable 'card' is used
 uninitialized whenever 'if' condition is true
Message-ID: <202604231210.QpPbIUWe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-04-21
head:   e532cc3ce1a670087bbbf444b59515d5e52d0c39
commit: 3b1fd93395d526f33814f14d531afe5917e51687 [167/167] ASoC: generic: use snd_soc_card_register()
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260423/202604231210.QpPbIUWe-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260423/202604231210.QpPbIUWe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604231210.QpPbIUWe-lkp@intel.com/

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

3b1fd93395d526f Kuninori Morimoto   2026-04-20  711  
b4b7de99c6da461 Kuninori Morimoto   2023-09-11  712  static int simple_probe(struct platform_device *pdev)
f2390880ec0264a Kuninori Morimoto   2012-04-08  713  {
b4b7de99c6da461 Kuninori Morimoto   2023-09-11  714  	struct simple_util_priv *priv;
f89983ef61677af Kuninori Morimoto   2012-12-25  715  	struct device *dev = &pdev->dev;
dcee9bfe8904518 Kuninori Morimoto   2017-03-15  716  	struct device_node *np = dev->of_node;
5be509576cf634a Kuninori Morimoto   2017-03-15  717  	struct snd_soc_card *card;
3b1fd93395d526f Kuninori Morimoto   2026-04-20  718  	const char *card_name = NULL;
65a5056b21202ef Kuninori Morimoto   2019-03-20  719  	int ret;
f2390880ec0264a Kuninori Morimoto   2012-04-08  720  
0dd4fc3c2f663b9 Xiubo Li            2014-09-10  721  	/* Allocate the private data and the DAI link array */
b0133d9c4d7600f Kuninori Morimoto   2016-08-26  722  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
ca65b492c7a265b Jean-Francois Moine 2014-01-15  723  	if (!priv)
ca919fe4b972b94 Xiubo Li            2014-01-14  724  		return -ENOMEM;
ca919fe4b972b94 Xiubo Li            2014-01-14  725  
a0ef5b4b101424b Kuninori Morimoto   2025-02-05  726  	ret = -ENOMEM;
bf4afc53b77aeaa Linus Torvalds      2026-02-21  727  	struct link_info *li __free(kfree) = kzalloc_obj(*li);
ec1af6c64db94e4 Thierry Reding      2021-04-19  728  	if (!li)
a0ef5b4b101424b Kuninori Morimoto   2025-02-05  729  		goto end;
ec1af6c64db94e4 Thierry Reding      2021-04-19  730  
ec1af6c64db94e4 Thierry Reding      2021-04-19  731  	ret = simple_get_dais_count(priv, li);
0f687d826736a5b Thierry Reding      2021-04-16  732  	if (ret < 0)
a0ef5b4b101424b Kuninori Morimoto   2025-02-05  733  		goto end;
0f687d826736a5b Thierry Reding      2021-04-16  734  
a0ef5b4b101424b Kuninori Morimoto   2025-02-05  735  	ret = -EINVAL;
ec1af6c64db94e4 Thierry Reding      2021-04-19  736  	if (!li->link)
a0ef5b4b101424b Kuninori Morimoto   2025-02-05  737  		goto end;
da215354eb55c38 Kuninori Morimoto   2018-12-14  738  
b4b7de99c6da461 Kuninori Morimoto   2023-09-11  739  	ret = simple_util_init_priv(priv, li);
65a5056b21202ef Kuninori Morimoto   2019-03-20  740  	if (ret < 0)
a0ef5b4b101424b Kuninori Morimoto   2025-02-05  741  		goto end;
201a0eac7fe5e7a Jean-Francois Moine 2014-01-15  742  
201a0eac7fe5e7a Jean-Francois Moine 2014-01-15  743  	if (np && of_device_is_available(np)) {
ca919fe4b972b94 Xiubo Li            2014-01-14  744  
ec1af6c64db94e4 Thierry Reding      2021-04-19  745  		ret = simple_parse_of(priv, li);
fa558c2801fc173 Kuninori Morimoto   2013-11-20  746  		if (ret < 0) {
7a0299e13bc740c Kuninori Morimoto   2021-12-14  747  			dev_err_probe(dev, ret, "parse error\n");
e512e001dafa54e Jean-Francois Moine 2014-03-11  748  			goto err;
fa558c2801fc173 Kuninori Morimoto   2013-11-20  749  		}
6a91a17bd7b92b2 Jean-Francois Moine 2014-03-20  750  
fa558c2801fc173 Kuninori Morimoto   2013-11-20  751  	} else {
b4b7de99c6da461 Kuninori Morimoto   2023-09-11  752  		struct simple_util_info *cinfo;
f107294c6422e77 Kuninori Morimoto   2019-06-06  753  		struct snd_soc_dai_link_component *cpus;
710af9196ce614e Kuninori Morimoto   2018-08-31  754  		struct snd_soc_dai_link_component *codecs;
e58f41e41185c69 Kuninori Morimoto   2018-08-31  755  		struct snd_soc_dai_link_component *platform;
65a5056b21202ef Kuninori Morimoto   2019-03-20  756  		struct snd_soc_dai_link *dai_link = priv->dai_link;
65a5056b21202ef Kuninori Morimoto   2019-03-20  757  		struct simple_dai_props *dai_props = priv->dai_props;
65a5056b21202ef Kuninori Morimoto   2019-03-20  758  
41bae58df411f9a Kuninori Morimoto   2023-09-19  759  		ret = -EINVAL;
41bae58df411f9a Kuninori Morimoto   2023-09-19  760  
ca65b492c7a265b Jean-Francois Moine 2014-01-15  761  		cinfo = dev->platform_data;
ca65b492c7a265b Jean-Francois Moine 2014-01-15  762  		if (!cinfo) {
f89983ef61677af Kuninori Morimoto   2012-12-25  763  			dev_err(dev, "no info for asoc-simple-card\n");
41bae58df411f9a Kuninori Morimoto   2023-09-19  764  			goto err;
f2390880ec0264a Kuninori Morimoto   2012-04-08  765  		}
f2390880ec0264a Kuninori Morimoto   2012-04-08  766  
f2390880ec0264a Kuninori Morimoto   2012-04-08 @767  		if (!cinfo->name ||
fa558c2801fc173 Kuninori Morimoto   2013-11-20  768  		    !cinfo->codec_dai.name ||
7722f830a45f7fb Jean-Francois Moine 2014-01-15  769  		    !cinfo->codec ||
7722f830a45f7fb Jean-Francois Moine 2014-01-15  770  		    !cinfo->platform ||
7722f830a45f7fb Jean-Francois Moine 2014-01-15  771  		    !cinfo->cpu_dai.name) {
b4b7de99c6da461 Kuninori Morimoto   2023-09-11  772  			dev_err(dev, "insufficient simple_util_info settings\n");
41bae58df411f9a Kuninori Morimoto   2023-09-19  773  			goto err;
f2390880ec0264a Kuninori Morimoto   2012-04-08  774  		}
2bee991460a838e Jean-Francois Moine 2014-01-15  775  
f107294c6422e77 Kuninori Morimoto   2019-06-06  776  		cpus			= dai_link->cpus;
f107294c6422e77 Kuninori Morimoto   2019-06-06  777  		cpus->dai_name		= cinfo->cpu_dai.name;
f107294c6422e77 Kuninori Morimoto   2019-06-06  778  
710af9196ce614e Kuninori Morimoto   2018-08-31  779  		codecs			= dai_link->codecs;
710af9196ce614e Kuninori Morimoto   2018-08-31  780  		codecs->name		= cinfo->codec;
710af9196ce614e Kuninori Morimoto   2018-08-31  781  		codecs->dai_name	= cinfo->codec_dai.name;
710af9196ce614e Kuninori Morimoto   2018-08-31  782  
910fdcabedd2354 Kuninori Morimoto   2019-01-21  783  		platform		= dai_link->platforms;
e58f41e41185c69 Kuninori Morimoto   2018-08-31  784  		platform->name		= cinfo->platform;
e58f41e41185c69 Kuninori Morimoto   2018-08-31  785  
3b1fd93395d526f Kuninori Morimoto   2026-04-20  786  		card_name		= (cinfo->card) ? cinfo->card : cinfo->name;
5ca8ba4180a6f62 Jean-Francois Moine 2014-01-15  787  		dai_link->name		= cinfo->name;
5ca8ba4180a6f62 Jean-Francois Moine 2014-01-15  788  		dai_link->stream_name	= cinfo->name;
1efb53a220b78fd Lars-Peter Clausen  2015-03-24  789  		dai_link->dai_fmt	= cinfo->daifmt;
b4b7de99c6da461 Kuninori Morimoto   2023-09-11  790  		dai_link->init		= simple_util_dai_init;
65a5056b21202ef Kuninori Morimoto   2019-03-20  791  		memcpy(dai_props->cpu_dai, &cinfo->cpu_dai,
65a5056b21202ef Kuninori Morimoto   2019-03-20  792  					sizeof(*dai_props->cpu_dai));
65a5056b21202ef Kuninori Morimoto   2019-03-20  793  		memcpy(dai_props->codec_dai, &cinfo->codec_dai,
65a5056b21202ef Kuninori Morimoto   2019-03-20  794  					sizeof(*dai_props->codec_dai));
7722f830a45f7fb Jean-Francois Moine 2014-01-15  795  	}
f2390880ec0264a Kuninori Morimoto   2012-04-08  796  
3b1fd93395d526f Kuninori Morimoto   2026-04-20  797  	card = devm_snd_soc_card_alloc(dev, THIS_MODULE, &card_driver,
3b1fd93395d526f Kuninori Morimoto   2026-04-20  798  					     card_name, NULL, NULL);
3b1fd93395d526f Kuninori Morimoto   2026-04-20  799  	if (!card)
3b1fd93395d526f Kuninori Morimoto   2026-04-20  800  		goto err;
3b1fd93395d526f Kuninori Morimoto   2026-04-20  801  
3b1fd93395d526f Kuninori Morimoto   2026-04-20  802  	priv->snd_card = card;
3b1fd93395d526f Kuninori Morimoto   2026-04-20  803  
3b1fd93395d526f Kuninori Morimoto   2026-04-20  804  	snd_soc_card_attach_priv(card, priv);
f2390880ec0264a Kuninori Morimoto   2012-04-08  805  
b4b7de99c6da461 Kuninori Morimoto   2023-09-11  806  	simple_util_debug_info(priv);
0580dde59438686 Kuninori Morimoto   2019-03-20  807  
3b1fd93395d526f Kuninori Morimoto   2026-04-20  808  	ret = devm_snd_soc_card_register(card);
c6d112e442fed7b Kuninori Morimoto   2017-05-19  809  	if (ret < 0)
c6d112e442fed7b Kuninori Morimoto   2017-05-19  810  		goto err;
c6d112e442fed7b Kuninori Morimoto   2017-05-19  811  
c6d112e442fed7b Kuninori Morimoto   2017-05-19  812  	return 0;
e512e001dafa54e Jean-Francois Moine 2014-03-11  813  err:
b4b7de99c6da461 Kuninori Morimoto   2023-09-11  814  	simple_util_clean_reference(card);
a0ef5b4b101424b Kuninori Morimoto   2025-02-05  815  end:
a0ef5b4b101424b Kuninori Morimoto   2025-02-05  816  	return dev_err_probe(dev, ret, "parse error\n");
f2390880ec0264a Kuninori Morimoto   2012-04-08  817  }
f2390880ec0264a Kuninori Morimoto   2012-04-08  818  

:::::: The code at line 767 was first introduced by commit
:::::: f2390880ec0264a0ed26b32c23bc23435b4297da ASoC: add generic simple-card support

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
