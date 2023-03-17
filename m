Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B4A65D;
	Fri, 17 Mar 2023 07:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679037062; x=1710573062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ax7HNzndHE2rlJ+sT7jeL1eM5kLjvl0PmdiUETdEbXU=;
  b=JMNHedt/SOgqs2suVBPrGJleV7mQZ1E4Axo5l/g2Xj1BFNS+vzUeeqcF
   Uy42aIQBvxiTQv8qStPn4xu1csAGCHgn6rHDFqu81hhr6avXI56RkEmZX
   1bAoAVTgWtjuTmap5/n2XuQaTNyD7I082v+B/JTPTYr0U3N6cmtO8dbP7
   Yt9a6UHbxbrWdZ2FgTrNDBMIGstcIALRPQfpgeHjIYhxjKynd1B9zcC/4
   0Js1anuTzvsTLAcqsKn0KDnpMISz7qRQ7OWFQBRUSi36jpVRDTQNPZuU6
   jjiTRvoveHgr1pxo9oPbUY88USlTh+jgs8kKW/0djsmFAsHYPvzUHKeiC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="318596053"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="318596053"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 00:11:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="926041225"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="926041225"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 17 Mar 2023 00:11:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pd4Et-0009AU-2G;
	Fri, 17 Mar 2023 07:10:59 +0000
Date: Fri, 17 Mar 2023 15:10:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-component-2023-03-17-v1 17/34]
 sound/soc/soc-core.c:256:5: warning: no previous prototype for function
 'snd_soc_dlc_dai_is_match'
Message-ID: <202303171556.OY1s436v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-component-2023-03-17-v1
head:   b40d3c70e8d1e46cf71248ae30775ed21d9f3db1
commit: 62c17190f6dc8e6afb1505577fcf1f9fe7ec3e26 [17/34] ASoC: soc-dai.c: add DAI get/match functions
config: x86_64-randconfig-a012-20230313 (https://download.01.org/0day-ci/archive/20230317/202303171556.OY1s436v-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/morimoto/linux/commit/62c17190f6dc8e6afb1505577fcf1f9fe7ec3e26
        git remote add morimoto https://github.com/morimoto/linux
        git fetch --no-tags morimoto sound-component-2023-03-17-v1
        git checkout 62c17190f6dc8e6afb1505577fcf1f9fe7ec3e26
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash sound/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303171556.OY1s436v-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/soc-core.c:256:5: warning: no previous prototype for function 'snd_soc_dlc_dai_is_match' [-Wmissing-prototypes]
   int snd_soc_dlc_dai_is_match(const struct snd_soc_dai_link_component *dlc, struct snd_soc_dai *dai)
       ^
   sound/soc/soc-core.c:256:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int snd_soc_dlc_dai_is_match(const struct snd_soc_dai_link_component *dlc, struct snd_soc_dai *dai)
   ^
   static 
   1 warning generated.


vim +/snd_soc_dlc_dai_is_match +256 sound/soc/soc-core.c

   255	
 > 256	int snd_soc_dlc_dai_is_match(const struct snd_soc_dai_link_component *dlc, struct snd_soc_dai *dai)
   257	{
   258		if (dlc->dai_name) {
   259			/* see snd_soc_dai_name_get() */
   260			if (dai->driver->name)
   261				return strcmp(dlc->dai_name, dai->driver->name) == 0;
   262	
   263			if (dai->name)
   264				return strcmp(dlc->dai_name, dai->name) == 0;
   265	
   266			if (dai->component->name)
   267				return strcmp(dlc->dai_name, dai->component->name) == 0;
   268		}
   269	
   270		return 0;
   271	}
   272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
