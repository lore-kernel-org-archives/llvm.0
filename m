Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF71C3955F1;
	Sun, 24 May 2026 16:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779641838; cv=none; b=RUwf0Oxy6J7Xnv86MIoVQPo1YRQhnmhciAxc4lu6OjUa32FQfT/wfcUYnZH4i/A2agozaOuCbfQ6nKOypPRYgARvQ5rIQP9DUgP9lt0W6LiYMYLQpV/mix+QuxxX02wYOYJc+vVtQ4KtHDq7X8PaU0wQTkecoro9u0qxFTZCsV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779641838; c=relaxed/simple;
	bh=BFVcFPIOI0TTeXYKszX2MnLPKklaJihiq/yHYigODbY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rXqtKFkmKJScHpxhFY3o/NZK81ISim4XcY191eM72f63C64wpoKEKOP2D5o0JGPVo8WSVB2aEXkNYRmc7J9UQEhjrs349dj/bJhQ/Jcj8zqtk4Z2/Hrbwry8lw9qum+ZxvPi06U6DuvkS1jHHD88wDp++U2Q2J6vLOjHB/MRjeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WXvwhk66; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WXvwhk66"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779641836; x=1811177836;
  h=date:from:to:cc:subject:message-id;
  bh=BFVcFPIOI0TTeXYKszX2MnLPKklaJihiq/yHYigODbY=;
  b=WXvwhk66Zzskh/UExEiYYHDxLqD6WJlb4STHZ3bwBGlEiHaohm5PVQKg
   5tGCWX3+qyVwaprCOJ2LnqHTQZNRLet1jWSo7ib0rbxObqSfH3Go+qPpJ
   qOb2eM0aRtiqyRskjS8swwwL6O3Y0hBgCVgep03yFM8nOW4PT3cdgc4vb
   FZ3/MW/JFeVA6gFG4w0Ii853UaBCVtqNwJZhHArq7tcTPRLWMpEzChABl
   zFx+jtAVg1JjfvnW7th/q4z8bciTgZg1L/Mbi1K6fONBHqk4nWxrb83z3
   ww/6ZHDeqsOb4Y960r1XlRnVEjFBgSmemhCQqmLZrGrNnkMDFqdpWqx5h
   g==;
X-CSE-ConnectionGUID: oZ4tnCbbQMuONkmS3gPOnA==
X-CSE-MsgGUID: R5iOOL3dRKyf7S4KQHiNEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="84369081"
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="84369081"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 09:57:15 -0700
X-CSE-ConnectionGUID: 6Wcw1mZKQ3+5awidYITguQ==
X-CSE-MsgGUID: nq1E3z/NSj6SmcpUTeAKXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="235030956"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 May 2026 09:57:13 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRC8V-000000000St-1dB8;
	Sun, 24 May 2026 16:57:11 +0000
Date: Mon, 25 May 2026 00:56:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-05-22-2 254/254]
 sound/soc/samsung/arndale.c:172:6: warning: variable 'card' is used
 uninitialized whenever 'if' condition is true
Message-ID: <202605250031.QlSrm1WF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-05-22-2
head:   7f5e6579901e0a1f3ff8bb45002dc226961a56ce
commit: 227dc54b3fdcdcb5fb0b920bbb95afdde4ca183f [254/254] ASoC: samsung: arndale: use snd_soc_card_register()
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260525/202605250031.QlSrm1WF-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260525/202605250031.QlSrm1WF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605250031.QlSrm1WF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/samsung/arndale.c:172:6: warning: variable 'card' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     172 |         if (!dai_link->codecs->of_node) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/samsung/arndale.c:192:23: note: uninitialized use occurs here
     192 |         arndale_put_of_nodes(card);
         |                              ^~~~
   sound/soc/samsung/arndale.c:172:2: note: remove the 'if' if its condition is always false
     172 |         if (!dai_link->codecs->of_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     173 |                 dev_err(&pdev->dev,
         |                 ~~~~~~~~~~~~~~~~~~~
     174 |                         "Property 'samsung,audio-codec' missing or invalid\n");
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     175 |                 ret = -EINVAL;
         |                 ~~~~~~~~~~~~~~
     176 |                 goto err_put_of_nodes;
         |                 ~~~~~~~~~~~~~~~~~~~~~~
     177 |         }
         |         ~
   sound/soc/samsung/arndale.c:153:27: note: initialize the variable 'card' to silence this warning
     153 |         struct snd_soc_card *card;
         |                                  ^
         |                                   = NULL
   1 warning generated.


vim +172 sound/soc/samsung/arndale.c

fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  149  
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  150  static int arndale_audio_probe(struct platform_device *pdev)
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  151  {
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  152  	struct device_node *np = pdev->dev.of_node;
03081cc370b9d0 sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-02  153  	struct snd_soc_card *card;
227dc54b3fdcdc sound/soc/samsung/arndale.c        Kuninori Morimoto  2026-05-21  154  	struct snd_soc_card_platform *card_platform;
aaa68472ed1fa7 sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-02  155  	struct snd_soc_dai_link *dai_link;
aaa68472ed1fa7 sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-02  156  	int ret;
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  157  
227dc54b3fdcdc sound/soc/samsung/arndale.c        Kuninori Morimoto  2026-05-21  158  	card_platform = (struct snd_soc_card_platform *)of_device_get_match_data(&pdev->dev);
227dc54b3fdcdc sound/soc/samsung/arndale.c        Kuninori Morimoto  2026-05-21  159  	dai_link = card_platform->driver.dai_link;
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  160  
aaa68472ed1fa7 sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-02  161  	dai_link->cpus->of_node = of_parse_phandle(np, "samsung,audio-cpu", 0);
aaa68472ed1fa7 sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-02  162  	if (!dai_link->cpus->of_node) {
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  163  		dev_err(&pdev->dev,
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  164  			"Property 'samsung,audio-cpu' missing or invalid\n");
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  165  		return -EINVAL;
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  166  	}
aaa68472ed1fa7 sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-02  167  
aaa68472ed1fa7 sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-02  168  	if (!dai_link->platforms->name)
aaa68472ed1fa7 sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-02  169  		dai_link->platforms->of_node = dai_link->cpus->of_node;
aaa68472ed1fa7 sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-02  170  
aaa68472ed1fa7 sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-02  171  	dai_link->codecs->of_node = of_parse_phandle(np, "samsung,audio-codec", 0);
aaa68472ed1fa7 sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-02 @172  	if (!dai_link->codecs->of_node) {
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  173  		dev_err(&pdev->dev,
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  174  			"Property 'samsung,audio-codec' missing or invalid\n");
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  175  		ret = -EINVAL;
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  176  		goto err_put_of_nodes;
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  177  	}
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  178  
227dc54b3fdcdc sound/soc/samsung/arndale.c        Kuninori Morimoto  2026-05-21  179  	card = devm_snd_soc_card_alloc(&pdev->dev, card_platform);
227dc54b3fdcdc sound/soc/samsung/arndale.c        Kuninori Morimoto  2026-05-21  180  	if (!card)
227dc54b3fdcdc sound/soc/samsung/arndale.c        Kuninori Morimoto  2026-05-21  181  		return -ENOMEM;
227dc54b3fdcdc sound/soc/samsung/arndale.c        Kuninori Morimoto  2026-05-21  182  
227dc54b3fdcdc sound/soc/samsung/arndale.c        Kuninori Morimoto  2026-05-21  183  	ret = devm_snd_soc_card_register(card);
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  184  	if (ret) {
27c6eaebcf75e4 sound/soc/samsung/arndale.c        Kuninori Morimoto  2021-12-14  185  		dev_err_probe(&pdev->dev, ret,
227dc54b3fdcdc sound/soc/samsung/arndale.c        Kuninori Morimoto  2026-05-21  186  			      "snd_soc_card_register() failed\n");
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  187  		goto err_put_of_nodes;
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  188  	}
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  189  	return 0;
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  190  
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  191  err_put_of_nodes:
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  192  	arndale_put_of_nodes(card);
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  193  	return ret;
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  194  }
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  195  

:::::: The code at line 172 was first introduced by commit
:::::: aaa68472ed1fa763336335f1278d65fcddd0056e ASoC: samsung: arndale: Simplify DAI link initialization

:::::: TO: Sylwester Nawrocki <s.nawrocki@samsung.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
