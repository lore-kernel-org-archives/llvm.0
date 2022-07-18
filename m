Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEAB7FC
	for <llvm@lists.linux.dev>; Mon, 18 Jul 2022 00:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658105647; x=1689641647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jc86ROYGHBo/fBsnjI6Oe/OdPIIjq6xXT+Lw7unJLG4=;
  b=Og2dyq69FNMXwKyvFyzqcZjyCaAH0WNILpvRGQlrXx7UDa1rLCDjvLhY
   cfdxF28dV3qJB3zEjqVHB8bfDWWIBHfh6QrDz5wXKEas6OJX/ZlhDV/yG
   9ceneUOVnI/g4EZPR5t3Hxrq3vGvweLZ4urHt9uKYsggaiQfeUpP/8GIr
   BG3oWTFex6oZG6QIv9hAf2Fzm1ef6/LcrF6sCeyXRp2eipVS6K7TkAWJa
   H5rZB7p5P2aTndaLplwEfFxXXnvyxTe1uVUVhTvUuHIctbLUDmfni9ZIT
   26PRHQOOtiI8B+kr7qzXGTPGoMJDLu1E5SugJ3IAtQxG2ksV3UT+RKzj3
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10411"; a="283670287"
X-IronPort-AV: E=Sophos;i="5.92,280,1650956400"; 
   d="scan'208";a="283670287"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2022 17:54:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,280,1650956400"; 
   d="scan'208";a="572196329"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 17 Jul 2022 17:54:04 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oDF1Q-0003qQ-6d;
	Mon, 18 Jul 2022 00:54:04 +0000
Date: Mon, 18 Jul 2022 08:53:23 +0800
From: kernel test robot <lkp@intel.com>
To: Brent Lu <brent.lu@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: sound/soc/intel/boards/sof_ssp_amp.c:97:6: warning: variable 'i' set
 but not used
Message-ID: <202207180841.Bkm8xoh8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Brent,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ff6992735ade75aae3e35d16b17da1008d753d28
commit: 2fe14ff61bd6d4fabe313435dd378b5a38eb6102 ASoC: Intel: sof_ssp_amp: rename driver and support cs35l41 amplifier
date:   5 months ago
config: i386-randconfig-a006-20220718 (https://download.01.org/0day-ci/archive/20220718/202207180841.Bkm8xoh8-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 45067f8fbf61284839c739807c2da2e2505661eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2fe14ff61bd6d4fabe313435dd378b5a38eb6102
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2fe14ff61bd6d4fabe313435dd378b5a38eb6102
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash sound/soc/intel/boards/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/intel/boards/sof_ssp_amp.c:97:6: warning: variable 'i' set but not used [-Wunused-but-set-variable]
           int i = 0;
               ^
   1 warning generated.


vim +/i +97 sound/soc/intel/boards/sof_ssp_amp.c

    89	
    90	static int sof_card_late_probe(struct snd_soc_card *card)
    91	{
    92		struct sof_card_private *ctx = snd_soc_card_get_drvdata(card);
    93		struct snd_soc_component *component = NULL;
    94		char jack_name[NAME_SIZE];
    95		struct sof_hdmi_pcm *pcm;
    96		int err;
  > 97		int i = 0;
    98	
    99		if (!(sof_ssp_amp_quirk & SOF_HDMI_PLAYBACK_PRESENT))
   100			return 0;
   101	
   102		/* HDMI is not supported by SOF on Baytrail/CherryTrail */
   103		if (!ctx->idisp_codec)
   104			return 0;
   105	
   106		if (list_empty(&ctx->hdmi_pcm_list))
   107			return -EINVAL;
   108	
   109		if (ctx->common_hdmi_codec_drv) {
   110			pcm = list_first_entry(&ctx->hdmi_pcm_list, struct sof_hdmi_pcm,
   111					       head);
   112			component = pcm->codec_dai->component;
   113			return hda_dsp_hdmi_build_controls(card, component);
   114		}
   115	
   116		list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
   117			component = pcm->codec_dai->component;
   118			snprintf(jack_name, sizeof(jack_name),
   119				 "HDMI/DP, pcm=%d Jack", pcm->device);
   120			err = snd_soc_card_jack_new(card, jack_name,
   121						    SND_JACK_AVOUT, &pcm->sof_hdmi,
   122						    NULL, 0);
   123	
   124			if (err)
   125				return err;
   126	
   127			err = hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
   128						  &pcm->sof_hdmi);
   129			if (err < 0)
   130				return err;
   131	
   132			i++;
   133		}
   134	
   135		return hdac_hdmi_jack_port_init(component, &card->dapm);
   136	}
   137	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
