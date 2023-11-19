Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3EC11181;
	Sun, 19 Nov 2023 13:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j3GDpgkA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700399983; x=1731935983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5usLZOEWaDjRVlVCH9PlkoYwAiq0NIVUVkH06QBFMaI=;
  b=j3GDpgkAxPN7K3X1uFI2zGbqNiLj1CHx/SXGyitUJMb3hPKKFl+desV/
   5zYnD/Mue2M/7tujbCoFgiaRORxQdR9JtZdA8Qnm4iUN7udJmx2QeOl6A
   vDYR+V3gH/uVRptzc0Kkms++i30fo3Ue/bND66Eu7S3BtMda0qZoJEGVP
   1yKcl4pSXE0WlQWIeg8tF6l6QwNK3Iar3t3AADFV60Jk9L/ycvvB9Ncm5
   qXXDj3/OCVN4ddqztMnwprSx8dr1E2w1BNgn39jJap3BG7V34AXLg0bus
   GJOesKBOaLaiBMprFdPb/Ij7DqogUjVCApHj9xBJ5ACPg/NuNWTW0uqSH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="395422102"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="395422102"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 05:19:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="800905480"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="800905480"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 19 Nov 2023 05:19:40 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4hi6-00057b-0U;
	Sun, 19 Nov 2023 13:19:38 +0000
Date: Sun, 19 Nov 2023 21:18:39 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/070-audio 64/100]
 sound/soc/codecs/tas2764-quirks.h:148:2: warning: unannotated fall-through
 between switch labels
Message-ID: <202311192125.8UQ8mV0N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   1c71b1fa2c491cc29c94d29f1a450dba39f27557
commit: 90882951283f5b2cc53ec3cd08f9ba604c8c3528 [64/100] ASoC: tas2764: Add optional 'Apple quirks'
config: i386-randconfig-011-20231119 (https://download.01.org/0day-ci/archive/20231119/202311192125.8UQ8mV0N-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231119/202311192125.8UQ8mV0N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311192125.8UQ8mV0N-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/codecs/tas2764.c:56:
>> sound/soc/codecs/tas2764-quirks.h:148:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
           default:
           ^
   sound/soc/codecs/tas2764-quirks.h:148:2: note: insert '__attribute__((fallthrough));' to silence this warning
           default:
           ^
           __attribute__((fallthrough)); 
   sound/soc/codecs/tas2764-quirks.h:148:2: note: insert 'break;' to avoid fall-through
           default:
           ^
           break; 
   1 warning generated.


vim +148 sound/soc/codecs/tas2764-quirks.h

   115	
   116	static int tas2764_do_quirky_pwr_ctrl_change(struct tas2764_priv *tas2764,
   117						     unsigned int target)
   118	{
   119		unsigned int curr;
   120		int ret;
   121	
   122		curr = snd_soc_component_read_field(tas2764->component,
   123						       TAS2764_PWR_CTRL,
   124						       TAS2764_PWR_CTRL_MASK);
   125	
   126		if (target == curr)
   127			return 0;
   128	
   129	#define TRANSITION(new, old) ((new) << 8 | (old))
   130		switch (TRANSITION(target, curr)) {
   131		case TRANSITION(TAS2764_PWR_CTRL_SHUTDOWN, TAS2764_PWR_CTRL_MUTE):
   132		case TRANSITION(TAS2764_PWR_CTRL_SHUTDOWN, TAS2764_PWR_CTRL_ACTIVE):
   133			ret = regmap_multi_reg_write(tas2764->regmap, tas2764_pre_shutdown_seq,
   134						     ARRAY_SIZE(tas2764_pre_shutdown_seq));
   135			if (ret < 0)
   136				break;
   137	
   138			ret = snd_soc_component_update_bits(tas2764->component,
   139							    TAS2764_PWR_CTRL,
   140						    	    TAS2764_PWR_CTRL_MASK,
   141						    	    TAS2764_PWR_CTRL_SHUTDOWN);
   142			if (ret > 0)
   143				break;
   144	
   145			ret = regmap_multi_reg_write(tas2764->regmap, tas2764_post_shutdown_seq,
   146						     ARRAY_SIZE(tas2764_post_shutdown_seq));
   147	
 > 148		default:
   149			ret = snd_soc_component_update_bits(tas2764->component, TAS2764_PWR_CTRL,
   150						    	    TAS2764_PWR_CTRL_MASK, target);
   151		}
   152	#undef TRANSITION
   153	
   154		if (ret < 0)
   155			return ret;
   156		return 0;
   157	}
   158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
