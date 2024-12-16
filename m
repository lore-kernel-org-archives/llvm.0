Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D226E1FFC46;
	Mon, 16 Dec 2024 09:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734340669; cv=none; b=aAn37DJ9H0l3r/4WdE3D6GsSrGnSI6tIyFwo0fttwJzrUOFdirSNs/tS6TP+dGXFucFpSvqjIPMxeRDVZD7xuUBy3UJKtPBk+1GdNW9E7aGRRy1F9C/2jG6QSXIbyhmdq6J87f8AGofbnAKaTszmlPFXtM30gd1NYxPcDEYq1D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734340669; c=relaxed/simple;
	bh=AhyzT8efruDcgUSCW/RNvC3gNO85VVXCZw/Q10NYLvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aM+TJhA4JeTZKuozxmtlk+zJuTB7BINAhOG2hQylxrFxqq7fL8zio+3GOW41DEsbjD99Is4NFnGL/enaq+gosQMeJoOjU1GaPJJXaJtdCzWHP4SMV7dFaao/zmmw3cx6BDZOZ3DdXf3DW3Mm1rJsDoXpM4bYm5UFq9Zm9NcmoHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gOdIyGEK; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gOdIyGEK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734340666; x=1765876666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AhyzT8efruDcgUSCW/RNvC3gNO85VVXCZw/Q10NYLvI=;
  b=gOdIyGEKT2Q2160YXLWcTrkjV4VTyoIHmx92CVeVZ7/63of4ZJdafWKB
   sM+TSwp34s9x9Rpprg16PFAsHOQ7MMn6Ibl80/ihXU2GxQUlJzTjanxJT
   aM0kwLT/h353vGm6q6uGCh7vIMbLSKOaT1nkfLStMTC9PCFOsEEOb5Kx+
   Qj9SS3Ypiwr8yNNr4sTMauNjcR2llWsaUL4FuG+5HreLV9ATFa+e/LDS7
   9WRIqLf7yf2Ow6X5ylIyR2WiY2IlZXqpkRg0WRC7clDbWLzMWuPyMVR/4
   Rj4yqgOC+dnVpg7POTNMMCDPi4LZ/Lph7iqNjlvp7JZB1hEUgToBGKR4B
   g==;
X-CSE-ConnectionGUID: KGaMknmARsa1IrxLozth7A==
X-CSE-MsgGUID: 4XgT5egsQFymzl71AOXi3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38643466"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="38643466"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 01:17:45 -0800
X-CSE-ConnectionGUID: DvzTEbZfQJ+wkAKEGhPH3w==
X-CSE-MsgGUID: OWgWZwAnQoiKCiceJrWMcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="102233850"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Dec 2024 01:17:46 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tN7EV-000E7k-2T;
	Mon, 16 Dec 2024 09:17:43 +0000
Date: Mon, 16 Dec 2024 17:17:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-new-daifmt-20241216 13/44]
 sound/soc/sunxi/sun8i-codec-analog.c:400:11: error: use of undeclared
 identifier 'dev'
Message-ID: <202412161711.uvRC6NsS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-new-daifmt-20241216
head:   3593000c508ad86b18f89bca8b4e6ae589ac9529
commit: 48f91ba23b46ee9c33a5459a4e9aea728461ee7d [13/44] ASoC: error message cleanup (snd_soc_dapm_new_controls())
config: arm-randconfig-003-20241216 (https://download.01.org/0day-ci/archive/20241216/202412161711.uvRC6NsS-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 2dc22615fd46ab2566d0f26d5ba234ab12dc4bf8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241216/202412161711.uvRC6NsS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412161711.uvRC6NsS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/sunxi/sun8i-codec-analog.c:16:
   In file included from include/sound/soc.h:26:
   In file included from include/sound/ac97_codec.h:17:
   In file included from include/sound/pcm.h:15:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> sound/soc/sunxi/sun8i-codec-analog.c:400:11: error: use of undeclared identifier 'dev'
     400 |                 dev_err(dev, "Failed to add Headphone controls: %d\n", ret);
         |                         ^
   sound/soc/sunxi/sun8i-codec-analog.c:412:11: error: use of undeclared identifier 'dev'
     412 |                 dev_err(dev, "Failed to add Headphone DAPM routes: %d\n", ret);
         |                         ^
   sound/soc/sunxi/sun8i-codec-analog.c:481:11: error: use of undeclared identifier 'dev'
     481 |                 dev_err(dev, "Failed to add Line In controls: %d\n", ret);
         |                         ^
   sound/soc/sunxi/sun8i-codec-analog.c:493:11: error: use of undeclared identifier 'dev'
     493 |                 dev_err(dev, "Failed to add Line In DAPM routes: %d\n", ret);
         |                         ^
   sound/soc/sunxi/sun8i-codec-analog.c:559:11: error: use of undeclared identifier 'dev'
     559 |                 dev_err(dev, "Failed to add Line Out controls: %d\n", ret);
         |                         ^
   sound/soc/sunxi/sun8i-codec-analog.c:571:11: error: use of undeclared identifier 'dev'
     571 |                 dev_err(dev, "Failed to add Line Out DAPM routes: %d\n", ret);
         |                         ^
   sound/soc/sunxi/sun8i-codec-analog.c:621:11: error: use of undeclared identifier 'dev'
     621 |                 dev_err(dev, "Failed to add MIC2 controls: %d\n", ret);
         |                         ^
   sound/soc/sunxi/sun8i-codec-analog.c:633:11: error: use of undeclared identifier 'dev'
     633 |                 dev_err(dev, "Failed to add MIC2 DAPM routes: %d\n", ret);
         |                         ^
   sound/soc/sunxi/sun8i-codec-analog.c:694:11: error: use of undeclared identifier 'dev'
     694 |                 dev_err(dev, "Failed to add Mixer DAPM routes: %d\n", ret);
         |                         ^
   1 warning and 9 errors generated.


vim +/dev +400 sound/soc/sunxi/sun8i-codec-analog.c

ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  390  
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  391  static int sun8i_codec_add_headphone(struct snd_soc_component *cmpnt)
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  392  {
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  393  	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(cmpnt);
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  394  	int ret;
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  395  
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  396  	ret = snd_soc_add_component_controls(cmpnt,
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  397  					     sun8i_codec_headphone_controls,
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  398  					     ARRAY_SIZE(sun8i_codec_headphone_controls));
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  399  	if (ret) {
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12 @400  		dev_err(dev, "Failed to add Headphone controls: %d\n", ret);
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  401  		return ret;
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  402  	}
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  403  
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  404  	ret = snd_soc_dapm_new_controls(dapm, sun8i_codec_headphone_widgets,
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  405  					ARRAY_SIZE(sun8i_codec_headphone_widgets));
48f91ba23b46ee9 Kuninori Morimoto 2024-09-10  406  	if (ret)
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  407  		return ret;
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  408  
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  409  	ret = snd_soc_dapm_add_routes(dapm, sun8i_codec_headphone_routes,
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  410  				      ARRAY_SIZE(sun8i_codec_headphone_routes));
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  411  	if (ret) {
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  412  		dev_err(dev, "Failed to add Headphone DAPM routes: %d\n", ret);
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  413  		return ret;
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  414  	}
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  415  
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  416  	return 0;
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  417  }
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  418  

:::::: The code at line 400 was first introduced by commit
:::::: ba2ff3027b5ab4a96b9d2832822311c3ccbf3011 ASoC: sunxi: Add support for A23/A33/H3 codec's analog path controls

:::::: TO: Chen-Yu Tsai <wens@csie.org>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
