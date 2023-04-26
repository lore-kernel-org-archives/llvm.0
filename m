Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775BF6FBC;
	Wed, 26 Apr 2023 20:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682540876; x=1714076876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z5z5YQ9qvxyGzH+5wwrKzXquh2OCClX098Hpepb+yLY=;
  b=JD+kfHVa4MmUfDY0F1NLlIA7YBqVF3M7ihtvJ0QHYGtvqpkJ9AkhSDr0
   wkB1GqsIg2DIs4saVBXqzyZYi4/zdIk5vk1bgw3vN5l3FlQBItx1icRHp
   5VwPmbqgec63+C8sXLkJKNH8Oy9340WDOqMcAkul16de/ukI5LvXorTh+
   Q/NvWEArWsQeAhKOLDD1OFJWc13wRuL+lwyi8+xAZUa9lH1pNZ+EwyV8g
   DuWh9XOmyBu3cBbCUOE4HtVRzOImA14OlOQ4lX+n0NkXNo8SVu/3cX/1J
   JsXp4Y1PgRJJ13qCMi2KZ5wkuXDCzCGYQI6Sbhfvx+9dKmsW5aje723Qn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="433519618"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; 
   d="scan'208";a="433519618"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 13:27:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="696761379"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; 
   d="scan'208";a="696761379"
Received: from lkp-server01.sh.intel.com (HELO 041f065c1b1b) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 26 Apr 2023 13:27:53 -0700
Received: from kbuild by 041f065c1b1b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prlk0-0000Va-0S;
	Wed, 26 Apr 2023 20:27:52 +0000
Date: Thu, 27 Apr 2023 04:27:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-dai-ops-2023-04-25-v2 57/58]
 sound/soc/codecs/hdmi-codec.c:902:3: error: field designator 'pcm_construct'
 does not refer to any field in type 'const struct snd_soc_dai_ops'
Message-ID: <202304270441.OLw0UD1d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-dai-ops-2023-04-25-v2
head:   95707df62ebc8850d4cc2a5fd9b2674d218e1c93
commit: b96243bc0ed82b30a0b31600ea3e4674fdc6439f [57/58] ASoC: codecs/hdmi-codec: merge DAI call back functions into ops
config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20230427/202304270441.OLw0UD1d-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/morimoto/linux/commit/b96243bc0ed82b30a0b31600ea3e4674fdc6439f
        git remote add morimoto https://github.com/morimoto/linux
        git fetch --no-tags morimoto sound-dai-ops-2023-04-25-v2
        git checkout b96243bc0ed82b30a0b31600ea3e4674fdc6439f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304270441.OLw0UD1d-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/hdmi-codec.c:902:3: error: field designator 'pcm_construct' does not refer to any field in type 'const struct snd_soc_dai_ops'
           .pcm_construct                  = hdmi_codec_pcm_new,
            ^
   sound/soc/codecs/hdmi-codec.c:913:3: error: field designator 'pcm_construct' does not refer to any field in type 'const struct snd_soc_dai_ops'
           .pcm_construct  = hdmi_codec_pcm_new,
            ^
   2 errors generated.


vim +902 sound/soc/codecs/hdmi-codec.c

   893	
   894	static const struct snd_soc_dai_ops hdmi_codec_i2s_dai_ops = {
   895		.probe				= hdmi_dai_probe,
   896		.startup			= hdmi_codec_startup,
   897		.shutdown			= hdmi_codec_shutdown,
   898		.hw_params			= hdmi_codec_hw_params,
   899		.prepare			= hdmi_codec_prepare,
   900		.set_fmt			= hdmi_codec_i2s_set_fmt,
   901		.mute_stream			= hdmi_codec_mute,
 > 902		.pcm_construct			= hdmi_codec_pcm_new,
   903		.auto_selectable_formats	= &hdmi_codec_formats,
   904		.num_auto_selectable_formats	= 1,
   905	};
   906	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
