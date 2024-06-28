Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF40B25569;
	Fri, 28 Jun 2024 03:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719545625; cv=none; b=cVRAT/TTnTCcFozsjSjnz48ySGE3t0AUKkvCXUHflKRGbUeSRCt2HR1f3QoRnJO3Dy48Tiih+/00JpAtDlgbYUSwtlfdoYOvZ55A0HzMxzgqBDt2FxzV5ue2U35VJCMUueBfGfojjDUkR8oUwyLsVlNhTZN+x1d6cKKY1dnP+AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719545625; c=relaxed/simple;
	bh=Yh9XNF1kuwAoeoGdI9ucQ2I3fS7pT1Go1q2P3ChIgJE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p+FI7I1+Qcrj3LRl5ck7IsGwRYMkTgVUsuGvizevHwWv4zBB7CIlxAKAItdr14OKOqWn6afquoiNgqZqSwAw3w14E88X6YIs1GRYnI4DWBhcpsMRfKLnB/jDUavVIH0zIENzz3az71sQtxvE+d7Rrsox3iQfAsHH5VATSCivaSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aCIBdYm5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aCIBdYm5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719545623; x=1751081623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yh9XNF1kuwAoeoGdI9ucQ2I3fS7pT1Go1q2P3ChIgJE=;
  b=aCIBdYm5nyUsshUcvGkWhmeV/bkcd2NEBaSobD59woWYR+o3t5Hn4eaX
   044sIXvDaOiEJ9kXYpVORithi3laQeTyyHcyNQHBowxTzeXh6/ib3qhPh
   GLXUEvLi4HdpiFGVZLiCDyO1eUsXeFGGDB/yN3xdxEJP3UK7G0BpgafYI
   tChhrIDby9MCfZWGbqJJO8XV06+scYKcSXn4fqfQP866CqAzjRB5+8xi+
   t457LXAKOtbt0COsz+ms7ic3dWxG3CkYYhePKh/qkVCpI0MhxF2dDj20o
   Rf+eiWc964D0bba1ZG2Wohzr3UvULLGVj4mdzB8BROezLvE9j6s/GK1CU
   w==;
X-CSE-ConnectionGUID: 5fV6GfLkTVSAcst/Wu5aeA==
X-CSE-MsgGUID: lTe8Y8N5Qqa3JuqhRCmWoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="28112951"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="28112951"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 20:33:42 -0700
X-CSE-ConnectionGUID: zighsVJUT3aetq9B0PKyuA==
X-CSE-MsgGUID: 5x5E7KgPRCe3/Stx6BLTpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="75798021"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jun 2024 20:33:41 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sN2Mk-000Glm-1G;
	Fri, 28 Jun 2024 03:33:38 +0000
Date: Fri, 28 Jun 2024 11:33:03 +0800
From: kernel test robot <lkp@intel.com>
To: Khanh Le <khanh.le.xr@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>
Subject: [morimoto:renesas-bsp/v6.1.95-2024-06-24-GrayHawk-sound 706/709]
 sound/soc/codecs/ak4619.c:824:17: error: use of undeclared identifier
 'REGCACHE_MAPLE'; did you mean 'REGCACHE_NONE'?
Message-ID: <202406281100.D8245BGl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-bsp/v6.1.95-2024-06-24-GrayHawk-sound
head:   a2ad04eb2a203f409e8218f127ade36084b87721
commit: 79d8f008f407299e889b60bca90e182ae4a0eded [706/709] ASoC: Add ak4619 codec support
config: arm-randconfig-004-20240628 (https://download.01.org/0day-ci/archive/20240628/202406281100.D8245BGl-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406281100.D8245BGl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406281100.D8245BGl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/codecs/ak4619.c:15:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:1775:
   include/linux/vmstat.h:516:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     516 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> sound/soc/codecs/ak4619.c:824:17: error: use of undeclared identifier 'REGCACHE_MAPLE'; did you mean 'REGCACHE_NONE'?
     824 |         .cache_type             = REGCACHE_MAPLE,
         |                                   ^~~~~~~~~~~~~~
         |                                   REGCACHE_NONE
   include/linux/regmap.h:42:2: note: 'REGCACHE_NONE' declared here
      42 |         REGCACHE_NONE,
         |         ^
   1 warning and 1 error generated.


vim +824 sound/soc/codecs/ak4619.c

   817	
   818	static const struct regmap_config ak4619_regmap_cfg = {
   819		.reg_bits		= 8,
   820		.val_bits		= 8,
   821		.max_register		= 0x14,
   822		.reg_defaults		= ak4619_reg_defaults,
   823		.num_reg_defaults	= ARRAY_SIZE(ak4619_reg_defaults),
 > 824		.cache_type		= REGCACHE_MAPLE,
   825	};
   826	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
