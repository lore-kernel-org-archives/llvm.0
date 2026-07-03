Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C713C331EA9;
	Fri,  3 Jul 2026 04:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783054651; cv=none; b=ilmvxyN1NCQyC0l/dj6F0UoVfs4tHCJzfM/3z3Mh07wTzAMEE+zzHk0e7nJbt+Uv8+O5XHM615NQ9j5IGSa/YIRez6oVcL25i1pp6ImlP/kCTQ6beH8ZnbeVuxOJIjIQknq6FAXvds7in2AbfD5lDUzDk5JNnZ4+jydCNFfdir8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783054651; c=relaxed/simple;
	bh=Ec9wQO2BFxp2QAZwCHh9VuHocWqE4fV/jlMBZiqnAz8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U0NFGIUXnnriXnsipkA6HurCzVhyW5E3+fUsxS8O4kzG2m8jvfn36IqEZM2sd48eq2TM3cxeKYuIeQm05JCXwGQImBw6rObX6Wrth/Y6x6/CZDMQFp8UAXatUotBRtJCGZEBM8Vw7gIdk39bFMyDqPzDG37QRzTy2sHGyJgEyMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VLmcigbu; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VLmcigbu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783054642; x=1814590642;
  h=date:from:to:cc:subject:message-id;
  bh=Ec9wQO2BFxp2QAZwCHh9VuHocWqE4fV/jlMBZiqnAz8=;
  b=VLmcigbuwXxaBHDBOpNcGsNp/cVIs+TMOPmgmM0uKSH0T2/wiW7kgPVd
   gwyg9j5YCoedLpEMZthUfAK+M7fD3QTY3QimWXw+eCzN7MvT0tFdqUjh8
   BHmthc+ZjVP4QquPSuS7VGzewz17fE1GZ8rxxJZ30m6/zrMIp1zlvVSE0
   OYy0gY+hRxHa7B+SLGjwndOUMFUB0LKF3pudHr9e2HCeWAPhS3LSka1w3
   rbgb3NdwvvZZ5Aa5jCSnvekFPAiJ/zIlFgks4eKxp0aP8Fn2hJysoa9Gl
   MJLqno2CGuSSQ5JPTejoKhtfkGUr47PX5OSyg34fp0j/sp4Xn0iu9H9uS
   g==;
X-CSE-ConnectionGUID: iIoSSyi+SfK7ohaeyKuAZA==
X-CSE-MsgGUID: +AF0m2RyQWa3UZYl3FZkZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="86349745"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86349745"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 21:57:10 -0700
X-CSE-ConnectionGUID: cw/91UfjSR2AXMJ8s76r6w==
X-CSE-MsgGUID: 1Bjg2KosRwizQ0no3Cx/iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253168967"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 02 Jul 2026 21:57:08 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfVxZ-00000000BgP-1xep;
	Fri, 03 Jul 2026 04:57:05 +0000
Date: Fri, 03 Jul 2026 12:56:31 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-07-01-3 160/302]
 sound/soc/generic/audio-graph-card.c:559:3: error: cannot jump from this goto
 statement to its label
Message-ID: <202607031209.0R9dj35T-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-07-01-3
head:   9f2eeab90c3fd87a2e2ea2b1be8d3e7848523d90
commit: 8b99b2ac38ff86cff7dab23af408b740468399c5 [160/302] ASoC: generic: use snd_soc_card_register()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260703/202607031209.0R9dj35T-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260703/202607031209.0R9dj35T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607031209.0R9dj35T-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/generic/audio-graph-card.c:559:3: error: cannot jump from this goto statement to its label
     559 |                 goto end;
         |                 ^
   sound/soc/generic/audio-graph-card.c:562:20: note: jump bypasses initialization of variable with __attribute__((cleanup))
     562 |         struct link_info *li __free(kfree) = kzalloc_obj(*li);
         |                           ^
   1 error generated.
--
>> sound/soc/generic/audio-graph-card2.c:1310:3: error: cannot jump from this goto statement to its label
    1310 |                 goto end;
         |                 ^
   sound/soc/generic/audio-graph-card2.c:1313:20: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1313 |         struct link_info *li __free(kfree) = kzalloc_obj(*li);
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
   604		simple_util_debug_info(priv);
   605	
   606		card = devm_snd_soc_card_register(dev, card_driver, priv);
   607		if (!card)
   608			ret = -EINVAL;
   609	err:
   610		if (ret < 0) {
   611			simple_util_clean_reference(priv);
   612			return dev_err_probe(dev, ret, "parse error\n");
   613		}
   614	end:
   615		return graph_ret(priv, ret);
   616	}
   617	EXPORT_SYMBOL_GPL(audio_graph_parse_of);
   618	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
