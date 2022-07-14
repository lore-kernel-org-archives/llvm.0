Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADDB2F44
	for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 10:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657794130; x=1689330130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SjixICY63dlkEDqfR3BHJ38BHvY7nzfEqXWF2S723SY=;
  b=BQOTlW+TyZ/Hz5ttVtqTp2uikha65y8xL3gLP5s3RbchLFcLUDro5ux3
   gfJJDzmB+7u92qGj02Jyaep8bkU0uirOM3DNYy5woD22/VPmLM8SzhWeR
   fbwS6/n8bzH96KHrCb0owSjSZTCpMhHs/wkhfLeqEz1ZK1i9YruhQDPyi
   4rrA1qxeOdXETFa4wCjiKScLDRNkkKTHm000fnqsFvb77X/cV84xiQ8QJ
   tQS3mkzC2NaRonBWUCYa/ui+ZA9Y7dtExrrdfyMkg9+9kDz0bSNtsfNrz
   9MxuRcGYEeF6wA1Oh/7g+VWw6GTe1kZ6ghlaZxXagWKq42wze0klZPAou
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="286216691"
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; 
   d="scan'208";a="286216691"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2022 03:22:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; 
   d="scan'208";a="663731719"
Received: from lkp-server01.sh.intel.com (HELO fd2c14d642b4) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 14 Jul 2022 03:22:08 -0700
Received: from kbuild by fd2c14d642b4 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oBvyy-0000Rh-8Q;
	Thu, 14 Jul 2022 10:22:08 +0000
Date: Thu, 14 Jul 2022 18:21:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [morimoto:sound-2022-07-04-v1 15/23]
 sound/soc/mediatek/mt8195/mt8195-mt6359.c:1341:18: error: no member named
 'stream_active' in 'struct snd_soc_dai'
Message-ID: <202207141829.xL3HSLc4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-2022-07-04-v1
head:   e9efd77b37adcddf8f910f34dd0df06be9d896cb
commit: 2aa8bfec7e0ff4ab531a688f8fd43150ad78ae23 [15/23] ASoC: count activity via TX/RX base instead of Playback/Capture.
config: arm-randconfig-r026-20220714 (https://download.01.org/0day-ci/archive/20220714/202207141829.xL3HSLc4-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e61b9c556267086ef9b743a0b57df302eef831b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/morimoto/linux/commit/2aa8bfec7e0ff4ab531a688f8fd43150ad78ae23
        git remote add morimoto https://github.com/morimoto/linux
        git fetch --no-tags morimoto sound-2022-07-04-v1
        git checkout 2aa8bfec7e0ff4ab531a688f8fd43150ad78ae23
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash sound/soc/codecs/ sound/soc/mediatek/mt8195/ sound/soc/meson/ sound/soc/qcom/ sound/soc/stm/ sound/soc/sunxi/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> sound/soc/mediatek/mt8195/mt8195-mt6359.c:1341:18: error: no member named 'stream_active' in 'struct snd_soc_dai'
                                   if (cpu_dai->stream_active[conn->stream_dir] > 0) {
                                       ~~~~~~~  ^
   1 error generated.


vim +1341 sound/soc/mediatek/mt8195/mt8195-mt6359.c

40d605df0a7bf77 sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2021-08-19  1319  
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1320  /* fixup the BE DAI link to match any values from topology */
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1321  static int mt8195_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1322  				 struct snd_pcm_hw_params *params)
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1323  {
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1324  	struct snd_soc_card *card = rtd->card;
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1325  	struct snd_soc_dai_link *sof_dai_link = NULL;
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1326  	struct snd_soc_pcm_runtime *runtime;
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1327  	struct snd_soc_dai *cpu_dai;
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1328  	int i, j, ret = 0;
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1329  
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1330  	for (i = 0; i < ARRAY_SIZE(g_sof_conn_streams); i++) {
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1331  		const struct sof_conn_stream *conn = &g_sof_conn_streams[i];
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1332  
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1333  		if (strcmp(rtd->dai_link->name, conn->normal_link))
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1334  			continue;
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1335  
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1336  		for_each_card_rtds(card, runtime) {
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1337  			if (strcmp(runtime->dai_link->name, conn->sof_link))
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1338  				continue;
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1339  
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1340  			for_each_rtd_cpu_dais(runtime, j, cpu_dai) {
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24 @1341  				if (cpu_dai->stream_active[conn->stream_dir] > 0) {
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1342  					sof_dai_link = runtime->dai_link;
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1343  					break;
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1344  				}
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1345  			}
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1346  			break;
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1347  		}
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1348  
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1349  		if (sof_dai_link && sof_dai_link->be_hw_params_fixup)
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1350  			ret = sof_dai_link->be_hw_params_fixup(runtime, params);
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1351  
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1352  		break;
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1353  	}
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1354  
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1355  	if (!strcmp(rtd->dai_link->name, "ETDM2_IN_BE") ||
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1356  	    !strcmp(rtd->dai_link->name, "ETDM1_OUT_BE")) {
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1357  		mt8195_etdm_hw_params_fixup(runtime, params);
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1358  	}
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1359  
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1360  	return ret;
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1361  }
4dbc714fe07641e sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c Trevor Wu 2022-03-24  1362  

:::::: The code at line 1341 was first introduced by commit
:::::: 4dbc714fe07641e7a07731f82152448ef09f3002 ASoC: mediatek: mt8195: revise mt8195-mt6359-rt1019-rt5682.c

:::::: TO: Trevor Wu <trevor.wu@mediatek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
