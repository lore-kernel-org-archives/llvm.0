Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E64D1FA4
	for <llvm@lists.linux.dev>; Sun,  5 Jun 2022 16:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654444850; x=1685980850;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p2rvYINhcy33Y4ywqrw+OJul21tsTbOIlv60AkIcyD8=;
  b=QIuMBFliMiClDS9Db9wCk5PNDjrVsZARJotZyBWL5TgsGHWpCa4mQl2m
   kklT6B3f4aQQv0KDCzed7FSQzkMGH/G+N9Oe6Cb2dBVCqrlNBFOedTGKE
   DAZsRnonZJRPFoY6uVSWt87MUIOuolfHfH81gWS3Tyoudf/R7r6NxFcv3
   rcfoYn14NJSJ2JNs729w7hpwezaSMVD4cjH0U8xzytDZWdUJx2x6+cenj
   TUQ5ohvd1hDOiVfz3rjqaxiMJODlIN9dCZEQp4erRCPxyTE+3Ap0Kzd0h
   8aZuMkupLRXwku/oNYX3i39v9CXMoxbt25FLzv2XG3leZyHUK6p8Ki6vB
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10369"; a="337269583"
X-IronPort-AV: E=Sophos;i="5.91,279,1647327600"; 
   d="scan'208";a="337269583"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2022 09:00:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,279,1647327600"; 
   d="scan'208";a="554064493"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 05 Jun 2022 09:00:48 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nxsgJ-000C21-BT;
	Sun, 05 Jun 2022 16:00:47 +0000
Date: Mon, 6 Jun 2022 00:00:11 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: wcd938x: Fix event generation for some controls
Message-ID: <202206052345.ErWjOII2-lkp@intel.com>
References: <20220603122526.3914942-1-broonie@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220603122526.3914942-1-broonie@kernel.org>

Hi Mark,

I love your patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on v5.18 next-20220603]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Brown/ASoC-wcd938x-Fix-event-generation-for-some-controls/20220605-162848
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/20220605/202206052345.ErWjOII2-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 416a5080d89066029f9889dc23f94de47c2fa895)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/77b0604d37f40ad0f56da53a9a38ad0de298fa52
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mark-Brown/ASoC-wcd938x-Fix-event-generation-for-some-controls/20220605-162848
        git checkout 77b0604d37f40ad0f56da53a9a38ad0de298fa52
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/wcd938x.c:2546:6: warning: unused variable 'change' [-Wunused-variable]
           int change;
               ^
   1 warning generated.


vim +/change +2546 sound/soc/codecs/wcd938x.c

  2540	
  2541	static int wcd938x_rx_hph_mode_put(struct snd_kcontrol *kcontrol,
  2542					   struct snd_ctl_elem_value *ucontrol)
  2543	{
  2544		struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
  2545		struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
> 2546		int change;
  2547	
  2548		if (wcd938x->hph_mode == ucontrol->value.enumerated.item[0])
  2549			return 0;
  2550	
  2551		wcd938x->hph_mode = ucontrol->value.enumerated.item[0];
  2552	
  2553		return 1;
  2554	}
  2555	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
