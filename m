Received: from mgamail.intel.com (unknown [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F272D107AB;
	Fri, 28 Jul 2023 09:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690536270; x=1722072270;
  h=date:from:cc:subject:message-id:mime-version;
  bh=YMvNMmhYVVTrUGcqbuxkZyzrjdg+OX3XjMEY5971Hbc=;
  b=aqiyH4pOGqb1MUGchLZyeqWM1+AHFVrL+z2tYFZo+j0C3UrtEZxv4Q4s
   /udEUPzhM3FFhVOfAR87d90zH+ZOgv4VwLBz0X2Hz9INOYg7boh2sJ8IJ
   DhbaVVcLvxvF0HfSfhaMYt+F0QgrpSG/OxPW6ZR4mahkZ8B7e29Ls454x
   f0TVp6ivMH/q4lTY/VqYeYuhODfIgnEluuOEfk0da/582DlskhkW8r7v/
   YqzXznBQRAWElLrxWYil6xUuutWZSqDi/oAUDzuDkwXnbUYm/BhJwIj4T
   t3yF8ryEu5iyC4uPv9PIy4Q3WryIGOgnQvZfz7oJSShKPVXMaWOAAuIIa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="348152396"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="348152396"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 02:24:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="792867066"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="792867066"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 28 Jul 2023 02:24:23 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPJhu-00034D-2E;
	Fri, 28 Jul 2023 09:24:23 +0000
Date: Fri, 28 Jul 2023 17:22:28 +0800
From: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>
Subject: [arm-platforms:kvm-arm64/asahi-base-6.5 1/2]
 sound/soc/mediatek/mt8188/mt8188-mt6359.c:1014:20: error: incompatible
 function pointer types initializing 'int (*)(struct snd_soc_card *)' with an
 expression of type 'void (struct snd_soc_card *)'
Message-ID: <202307281757.FZ0J8Upa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/asahi-base-6.5
head:   e3df40097445878321c27aaeb4177dfe22ccc568
commit: 3181a21c5289c9b913dd3402a80704e4140d9d43 [1/2] Merge tag 'v6.5-rc1' into kvm-arm64/asahi-base-6.5
config: x86_64-buildonly-randconfig-r003-20230727 (https://download.01.org/0day-ci/archive/20230728/202307281757.FZ0J8Upa-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307281757.FZ0J8Upa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307281757.FZ0J8Upa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/mediatek/mt8188/mt8188-mt6359.c:1014:20: error: incompatible function pointer types initializing 'int (*)(struct snd_soc_card *)' with an expression of type 'void (struct snd_soc_card *)' [-Wincompatible-function-pointer-types]
           .fixup_controls = mt8188_fixup_controls,
                             ^~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +1014 sound/soc/mediatek/mt8188/mt8188-mt6359.c

9f08dcbddeb307 Trevor Wu 2023-05-26  1005  
96035d46d4b452 Trevor Wu 2023-01-16  1006  static struct snd_soc_card mt8188_mt6359_soc_card = {
96035d46d4b452 Trevor Wu 2023-01-16  1007  	.owner = THIS_MODULE,
96035d46d4b452 Trevor Wu 2023-01-16  1008  	.dai_link = mt8188_mt6359_dai_links,
96035d46d4b452 Trevor Wu 2023-01-16  1009  	.num_links = ARRAY_SIZE(mt8188_mt6359_dai_links),
96035d46d4b452 Trevor Wu 2023-01-16  1010  	.dapm_widgets = mt8188_mt6359_widgets,
96035d46d4b452 Trevor Wu 2023-01-16  1011  	.num_dapm_widgets = ARRAY_SIZE(mt8188_mt6359_widgets),
96035d46d4b452 Trevor Wu 2023-01-16  1012  	.controls = mt8188_mt6359_controls,
96035d46d4b452 Trevor Wu 2023-01-16  1013  	.num_controls = ARRAY_SIZE(mt8188_mt6359_controls),
9f08dcbddeb307 Trevor Wu 2023-05-26 @1014  	.fixup_controls = mt8188_fixup_controls,
96035d46d4b452 Trevor Wu 2023-01-16  1015  };
96035d46d4b452 Trevor Wu 2023-01-16  1016  

:::::: The code at line 1014 was first introduced by commit
:::::: 9f08dcbddeb307793bbfff036db213d2cdf03a50 ASoC: mediatek: mt8188-mt6359: support new board with nau88255

:::::: TO: Trevor Wu <trevor.wu@mediatek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
