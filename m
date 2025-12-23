Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5220E34F256;
	Tue, 23 Dec 2025 15:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766503779; cv=none; b=SqepZ/1rtocrkjj8bzWSDP+o4+UAS3p8V/mHwGOfrQE7VBD3MZTVT8ZWTjdf8TKwa5WXZh0H1Ykanjlhx+SejHF9/OeB1Lqw/VlfxRFGyha905/1g7sBe0/Kw9DMO3I922+peAVFtqV2uEfyi1lQc8uPIDvmiomPInJgvaf1UDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766503779; c=relaxed/simple;
	bh=xJZtxrW6EeJcPdDZ31Bn46hCkxFphXS2EBGt64QnAk0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZT08DoQstaA2qvhVeX8Ra5BzGsChagx1N0FTUfViqwfsei9+3IGmgtBVbbKFW+ItFvTIa7MyCDPN9TgVpl2BhQmW0zMMuch7P8qwiwBv3xi1L72kLWIqxa+Exg+jLjrKX/yHqSSbdn4K9FQr3GXpNNdB3dlL9YbjXgwwz1X7rqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nfERcHV5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nfERcHV5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766503778; x=1798039778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xJZtxrW6EeJcPdDZ31Bn46hCkxFphXS2EBGt64QnAk0=;
  b=nfERcHV5MYZr4Pzx1ukbaRY1sqRl2hpEpnSTnire+EgaCHaOy4EXhQ7f
   kRn/99hPXYxaiepcZlkmnnk1VD4dOazuS8Fe1VMNu4j+sfY8Rv+YfPncr
   aP80Erwaeeo8bz4rQn7p0KgVwd17JZKrr6GR7tuNa0lz0Dqr3RISlNZOl
   xgPylFNiYbHJortp3NTPW2GRi2Iqs5UIEk0KrqeCIoxlXfBKwF/HfpTsI
   0wjisEl27hU0tWxHFWnjFreEvLXatOnruOJNHwnhcnAXTSlehdZY2nhLK
   mx0gcOnmiR/6SkcjWvr2/DVD0f1dz5suaEUGJIoyUWWN47ewCJwLTIi2J
   w==;
X-CSE-ConnectionGUID: IEvK3Rs4SICEMtu2lyiXQw==
X-CSE-MsgGUID: kHT48b8ESDev9dpvGs7WSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="85767682"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="85767682"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 07:29:37 -0800
X-CSE-ConnectionGUID: hGuLXKQTQj6DGDXvAKcN+g==
X-CSE-MsgGUID: PG/BkT29SKO68/7tzp/AWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="199043670"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 23 Dec 2025 07:29:35 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY4KK-00000000245-2ECc;
	Tue, 23 Dec 2025 15:29:32 +0000
Date: Tue, 23 Dec 2025 23:25:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Uwe =?utf-8?Q?Kleine-K=C3=B6nig"?= <u.kleine-koenig@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Vinod Koul <vkoul@kernel.org>
Subject: [vkoul-soundwire:next 4/7]
 sound/soc/codecs/sdw-mockup.c:267:12: error: incompatible function pointer
 types initializing 'void (*)(struct sdw_slave *)' with an expression of type
 'int (struct sdw_slave *)'
Message-ID: <202512232309.QYeADDen-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git next
head:   c6f1e99ab03c5a94ed6389f5930e91f274b3ba67
commit: 478f3890709a092a97a0218f61af19ac9b725573 [4/7] soundwire: Make remove function return no value
config: arm64-randconfig-003-20251223 (https://download.01.org/0day-ci/archive/20251223/202512232309.QYeADDen-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512232309.QYeADDen-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512232309.QYeADDen-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/sdw-mockup.c:267:12: error: incompatible function pointer types initializing 'void (*)(struct sdw_slave *)' with an expression of type 'int (struct sdw_slave *)' [-Wincompatible-function-pointer-types]
     267 |         .remove = sdw_mockup_sdw_remove,
         |                   ^~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +267 sound/soc/codecs/sdw-mockup.c

81d3d3d0bf09e6 Pierre-Louis Bossart 2021-07-14  261  
81d3d3d0bf09e6 Pierre-Louis Bossart 2021-07-14  262  static struct sdw_driver sdw_mockup_sdw_driver = {
81d3d3d0bf09e6 Pierre-Louis Bossart 2021-07-14  263  	.driver = {
81d3d3d0bf09e6 Pierre-Louis Bossart 2021-07-14  264  		.name = "sdw-mockup",
81d3d3d0bf09e6 Pierre-Louis Bossart 2021-07-14  265  	},
81d3d3d0bf09e6 Pierre-Louis Bossart 2021-07-14  266  	.probe = sdw_mockup_sdw_probe,
81d3d3d0bf09e6 Pierre-Louis Bossart 2021-07-14 @267  	.remove = sdw_mockup_sdw_remove,
81d3d3d0bf09e6 Pierre-Louis Bossart 2021-07-14  268  	.ops = &sdw_mockup_slave_ops,
81d3d3d0bf09e6 Pierre-Louis Bossart 2021-07-14  269  	.id_table = sdw_mockup_id,
81d3d3d0bf09e6 Pierre-Louis Bossart 2021-07-14  270  };
81d3d3d0bf09e6 Pierre-Louis Bossart 2021-07-14  271  module_sdw_driver(sdw_mockup_sdw_driver);
81d3d3d0bf09e6 Pierre-Louis Bossart 2021-07-14  272  

:::::: The code at line 267 was first introduced by commit
:::::: 81d3d3d0bf09e606dbc1e3daad1c7cef3976fca2 ASoC: codecs: add SoundWire mockup device support

:::::: TO: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
