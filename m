Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D260237FF4D;
	Fri, 27 Mar 2026 21:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774646486; cv=none; b=uNA64GOoyOBUM0eMn2rY/yKHYeoEp+DxDaT5qHLQXgNW/y0oNLTLtRFRJMYc1988SF+P74SEJvLNMaXp+VDtkCnfqEyeklzl5//WOmdevx987qZ0MJ1qIjllct0OvdVmqxGpbXGj059tZHN5gtUgdLgPd0Anoo1u+yK6H3/HC1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774646486; c=relaxed/simple;
	bh=ikKvp8vuZvZhl+A28VqQRXv8ZOC9bVMoIk5cGTWv5oY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DxQQ4SA9RTWibZ6bV6jq5mLaE6wmoHyK1QyoHljOwtsPtYr1+v6aoDu68MsOaht+aVgPUYghyAjgVhsHi4wKglumil4PGAkN5uqhOHp16z+SBnxTbqxXotX+vaKANsed4oNW6DFcOcYJCjaQMDVdej8doq5C3rUIOBoS8oL1tNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WP1y/MbS; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WP1y/MbS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774646484; x=1806182484;
  h=date:from:to:cc:subject:message-id;
  bh=ikKvp8vuZvZhl+A28VqQRXv8ZOC9bVMoIk5cGTWv5oY=;
  b=WP1y/MbSO8uh0q00BzKr7tDVSaXO0nIb+XcmI/AVbdS84Lf1RM1tNDfg
   zwHb5Kf/SIRJ3GqEM/KeWHJz83F3ouwQdD7xASSkp20fPvr1DRcJKKt+o
   TqGpF26SXqdIp8dWh/lwXaBBio2fNf3X696XF90ffxLkrK8bna3RpGLDW
   q9aNwVZhf6gNLLrx0kyvdiUeEKN2oF6EMFTyIVp4Z7XcuamE3MXmoVZDt
   2//2aJLbxKdnul2I5p/EbKsBbRblmVQ89wbTU2wrSMBHALvawaCcdHzIZ
   trsytMGq1+D1A9knzD3jSk8NJHeqID8KhaCs0FmSrgQCv38giZU9/0KjU
   w==;
X-CSE-ConnectionGUID: KnmDkHF0ReK71m3jIrCdXw==
X-CSE-MsgGUID: EvoaQpGqSl+lPZErOmtX7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75619214"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="75619214"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 14:21:24 -0700
X-CSE-ConnectionGUID: DCq18VdZQj+cr+8O43vB1Q==
X-CSE-MsgGUID: Ohe0OIenRVmlszRCWs1xAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="255935284"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Mar 2026 14:21:22 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6EcJ-00000000AlH-1eEI;
	Fri, 27 Mar 2026 21:21:19 +0000
Date: Sat, 28 Mar 2026 05:20:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-03-27 61/106]
 sound/soc/soc-component.c:1684:39: error: no member named 'debugfs_prefix' in
 'struct snd_soc_component_driver'
Message-ID: <202603280557.PX2kWAPU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-03-27
head:   b547ff73a13ed8ce92e8e208ccd27884077b160b
commit: 96ac5eb1c466226a2d0e2f1d8f681a46cbc97bc5 [61/106] ASoC: soc-component: add snd_soc_component_alloc()
config: hexagon-randconfig-002-20260328 (https://download.01.org/0day-ci/archive/20260328/202603280557.PX2kWAPU-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603280557.PX2kWAPU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603280557.PX2kWAPU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/soc-component.c:1684:39: error: no member named 'debugfs_prefix' in 'struct snd_soc_component_driver'
    1684 |                 component->debugfs_prefix = driver->debugfs_prefix;
         |                                             ~~~~~~  ^
   1 error generated.


vim +1684 sound/soc/soc-component.c

  1643	
  1644	struct snd_soc_component *snd_soc_component_alloc(struct device *dev,
  1645							  const struct snd_soc_component_driver *driver,
  1646							  struct regmap *regmap,
  1647							  const char *name,
  1648							  const char *name_prefix,
  1649							  const char *debugfs_prefix)
  1650	{
  1651		struct snd_soc_component *component;
  1652		struct snd_soc_dapm_context *dapm;
  1653	
  1654		component = devm_kzalloc(dev, sizeof(*component), GFP_KERNEL);
  1655		if (!component)
  1656			return NULL;
  1657	
  1658		dapm = snd_soc_dapm_alloc(dev);
  1659		if (!dapm)
  1660			return NULL;
  1661	
  1662		if (!name)
  1663			name = soc_fmt_single_name(dev, NULL);
  1664	
  1665		if (!name)
  1666			return NULL;
  1667	
  1668		INIT_LIST_HEAD(&component->dai_list);
  1669		INIT_LIST_HEAD(&component->dobj_list);
  1670		INIT_LIST_HEAD(&component->card_list);
  1671		INIT_LIST_HEAD(&component->list);
  1672		INIT_LIST_HEAD(&component->card_aux_list);
  1673		mutex_init(&component->io_mutex);
  1674	
  1675		component->name		= name;
  1676		component->name_prefix	= name_prefix;
  1677		component->dapm		= dapm;
  1678		component->regmap	= regmap;
  1679		component->dev		= dev;
  1680		component->driver	= driver;
  1681	
  1682		component->debugfs_prefix = debugfs_prefix;
  1683		if (!component->debugfs_prefix)
> 1684			component->debugfs_prefix = driver->debugfs_prefix;
  1685	
  1686		return component;
  1687	}
  1688	EXPORT_SYMBOL_GPL(snd_soc_component_alloc);
  1689	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
