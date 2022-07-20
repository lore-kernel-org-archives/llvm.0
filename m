Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E1E602F
	for <llvm@lists.linux.dev>; Wed, 20 Jul 2022 17:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658336877; x=1689872877;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fbYTNaPywGfInLJwSYP/fHJ5lyyPFAz/ww4498dKLrs=;
  b=m7Qgdp1se/Qzp0KyJfCL65cuEKB8BwfJFpRzchSujzQgjDBT23MiTZUb
   8WzrvvlCo70n3QoD5RKYIoQf5UgmitxduIjIqzoul/NRMDtv5vclwltSr
   IhGbKINob6pydM8a/nDq0cC/q3dVsGRj7BS18ix3roXLYB7EJp51pjgyP
   zzB3qmDjWRbcrmDT8CYnDBSa6BIoHv9+F7abo4cCBhMrHfQ5PE0OYEEKY
   oCjHfQhfsdhxQes8pqvmbqmjEtvNIBOVi4MXirRJ2evt4DhER07PyUhFa
   dDkIV74srfE5TgLCuDukj2sXnKBc2aNbi8e7FGcPQauFpGvgztMQ4rbBE
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="266610494"
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; 
   d="scan'208";a="266610494"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2022 10:07:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; 
   d="scan'208";a="625747433"
Received: from lkp-server01.sh.intel.com (HELO 7dfbdc7c7900) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 20 Jul 2022 10:07:55 -0700
Received: from kbuild by 7dfbdc7c7900 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oEDAw-0000jh-O9;
	Wed, 20 Jul 2022 17:07:54 +0000
Date: Thu, 21 Jul 2022 01:06:59 +0800
From: kernel test robot <lkp@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 2/4] ALSA: hda: Make snd_hda_codec_device_init() the only
 codec constructor
Message-ID: <202207210002.4Jtc7lBC-lkp@intel.com>
References: <20220720130622.146973-3-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220720130622.146973-3-cezary.rojewski@intel.com>

Hi Cezary,

I love your patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on tiwai-sound/for-next linus/master v5.19-rc7 next-20220720]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cezary-Rojewski/ALSA-hda-Unify-codec-construction/20220720-210158
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: i386-randconfig-a006-20220718 (https://download.01.org/0day-ci/archive/20220721/202207210002.4Jtc7lBC-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project dd5635541cd7bbd62cd59b6694dfb759b6e9a0d8)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1f9a732d481feda1eeedda7bd843f2de3e624199
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Cezary-Rojewski/ALSA-hda-Unify-codec-construction/20220720-210158
        git checkout 1f9a732d481feda1eeedda7bd843f2de3e624199
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash sound/soc/sof/intel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/sof/intel/hda-codec.c:170:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (type == HDA_DEV_LEGACY) {
               ^~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sof/intel/hda-codec.c:181:6: note: uninitialized use occurs here
           if (ret < 0) {
               ^~~
   sound/soc/sof/intel/hda-codec.c:170:2: note: remove the 'if' if its condition is always true
           if (type == HDA_DEV_LEGACY) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sof/intel/hda-codec.c:125:9: note: initialize the variable 'ret' to silence this warning
           int ret, retry = 0;
                  ^
                   = 0
   1 warning generated.


vim +170 sound/soc/sof/intel/hda-codec.c

89d73ccab20a68 Kai Vehmanen         2020-05-29  111  
5507b8103e2653 Pierre-Louis Bossart 2019-04-12  112  /* probe individual codec */
80acdd4f8ff763 Ranjani Sridharan    2019-12-04  113  static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
80acdd4f8ff763 Ranjani Sridharan    2019-12-04  114  			   bool hda_codec_use_common_hdmi)
5507b8103e2653 Pierre-Louis Bossart 2019-04-12  115  {
5507b8103e2653 Pierre-Louis Bossart 2019-04-12  116  #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
5507b8103e2653 Pierre-Louis Bossart 2019-04-12  117  	struct hdac_hda_priv *hda_priv;
163cd1059a85d2 Kai Vehmanen         2020-09-21  118  	int type = HDA_DEV_LEGACY;
5507b8103e2653 Pierre-Louis Bossart 2019-04-12  119  #endif
fd15f2f5e27214 Rander Wang          2019-07-22  120  	struct hda_bus *hbus = sof_to_hbus(sdev);
1f9a732d481fed Cezary Rojewski      2022-07-20  121  	struct hda_codec *codec;
5507b8103e2653 Pierre-Louis Bossart 2019-04-12  122  	u32 hda_cmd = (address << 28) | (AC_NODE_ROOT << 20) |
5507b8103e2653 Pierre-Louis Bossart 2019-04-12  123  		(AC_VERB_PARAMETERS << 8) | AC_PAR_VENDOR_ID;
5507b8103e2653 Pierre-Louis Bossart 2019-04-12  124  	u32 resp = -1;
046aede2f84767 Hui Wang             2021-11-30  125  	int ret, retry = 0;
5507b8103e2653 Pierre-Louis Bossart 2019-04-12  126  
046aede2f84767 Hui Wang             2021-11-30  127  	do {
5507b8103e2653 Pierre-Louis Bossart 2019-04-12  128  		mutex_lock(&hbus->core.cmd_mutex);
5507b8103e2653 Pierre-Louis Bossart 2019-04-12  129  		snd_hdac_bus_send_cmd(&hbus->core, hda_cmd);
5507b8103e2653 Pierre-Louis Bossart 2019-04-12  130  		snd_hdac_bus_get_response(&hbus->core, address, &resp);
5507b8103e2653 Pierre-Louis Bossart 2019-04-12  131  		mutex_unlock(&hbus->core.cmd_mutex);
046aede2f84767 Hui Wang             2021-11-30  132  	} while (resp == -1 && retry++ < CODEC_PROBE_RETRIES);
046aede2f84767 Hui Wang             2021-11-30  133  
5507b8103e2653 Pierre-Louis Bossart 2019-04-12  134  	if (resp == -1)
5507b8103e2653 Pierre-Louis Bossart 2019-04-12  135  		return -EIO;
5507b8103e2653 Pierre-Louis Bossart 2019-04-12  136  	dev_dbg(sdev->dev, "HDA codec #%d probed OK: response: %x\n",
5507b8103e2653 Pierre-Louis Bossart 2019-04-12  137  		address, resp);
5507b8103e2653 Pierre-Louis Bossart 2019-04-12  138  
5507b8103e2653 Pierre-Louis Bossart 2019-04-12  139  #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
ef9bec27485fef Ranjani Sridharan    2019-06-26  140  	hda_priv = devm_kzalloc(sdev->dev, sizeof(*hda_priv), GFP_KERNEL);
5507b8103e2653 Pierre-Louis Bossart 2019-04-12  141  	if (!hda_priv)
5507b8103e2653 Pierre-Louis Bossart 2019-04-12  142  		return -ENOMEM;
5507b8103e2653 Pierre-Louis Bossart 2019-04-12  143  
163cd1059a85d2 Kai Vehmanen         2020-09-21  144  	/* only probe ASoC codec drivers for HDAC-HDMI */
163cd1059a85d2 Kai Vehmanen         2020-09-21  145  	if (!hda_codec_use_common_hdmi && (resp & 0xFFFF0000) == IDISP_VID_INTEL)
163cd1059a85d2 Kai Vehmanen         2020-09-21  146  		type = HDA_DEV_ASOC;
163cd1059a85d2 Kai Vehmanen         2020-09-21  147  
1f9a732d481fed Cezary Rojewski      2022-07-20  148  	codec = snd_hdac_ext_bus_device_init(&hbus->core, address, type);
1f9a732d481fed Cezary Rojewski      2022-07-20  149  	if (IS_ERR(codec))
1f9a732d481fed Cezary Rojewski      2022-07-20  150  		return PTR_ERR(codec);
1f9a732d481fed Cezary Rojewski      2022-07-20  151  
1f9a732d481fed Cezary Rojewski      2022-07-20  152  	hda_priv->codec = codec;
1f9a732d481fed Cezary Rojewski      2022-07-20  153  	dev_set_drvdata(&codec->core.dev, hda_priv);
5507b8103e2653 Pierre-Louis Bossart 2019-04-12  154  
71cc8abb6ec705 Kai Vehmanen         2020-02-20  155  	if ((resp & 0xFFFF0000) == IDISP_VID_INTEL) {
1f9a732d481fed Cezary Rojewski      2022-07-20  156  		if (!hbus->core.audio_component) {
71cc8abb6ec705 Kai Vehmanen         2020-02-20  157  			dev_dbg(sdev->dev,
71cc8abb6ec705 Kai Vehmanen         2020-02-20  158  				"iDisp hw present but no driver\n");
9c25af250214e4 Kai Vehmanen         2021-01-13  159  			ret = -ENOENT;
9c25af250214e4 Kai Vehmanen         2021-01-13  160  			goto out;
71cc8abb6ec705 Kai Vehmanen         2020-02-20  161  		}
139c7febad1afa Kai Vehmanen         2019-10-29  162  		hda_priv->need_display_power = true;
71cc8abb6ec705 Kai Vehmanen         2020-02-20  163  	}
139c7febad1afa Kai Vehmanen         2019-10-29  164  
89d73ccab20a68 Kai Vehmanen         2020-05-29  165  	if (is_generic_config(hbus))
89d73ccab20a68 Kai Vehmanen         2020-05-29  166  		codec->probe_id = HDA_CODEC_ID_GENERIC;
89d73ccab20a68 Kai Vehmanen         2020-05-29  167  	else
89d73ccab20a68 Kai Vehmanen         2020-05-29  168  		codec->probe_id = 0;
89d73ccab20a68 Kai Vehmanen         2020-05-29  169  
163cd1059a85d2 Kai Vehmanen         2020-09-21 @170  	if (type == HDA_DEV_LEGACY) {
89d73ccab20a68 Kai Vehmanen         2020-05-29  171  		ret = hda_codec_load_module(codec);
2c63bea714780f Kai Vehmanen         2020-01-10  172  		/*
2c63bea714780f Kai Vehmanen         2020-01-10  173  		 * handle ret==0 (no driver bound) as an error, but pass
2c63bea714780f Kai Vehmanen         2020-01-10  174  		 * other return codes without modification
2c63bea714780f Kai Vehmanen         2020-01-10  175  		 */
2c63bea714780f Kai Vehmanen         2020-01-10  176  		if (ret == 0)
9c25af250214e4 Kai Vehmanen         2021-01-13  177  			ret = -ENOENT;
5507b8103e2653 Pierre-Louis Bossart 2019-04-12  178  	}
5507b8103e2653 Pierre-Louis Bossart 2019-04-12  179  
9c25af250214e4 Kai Vehmanen         2021-01-13  180  out:
9c25af250214e4 Kai Vehmanen         2021-01-13  181  	if (ret < 0) {
1f9a732d481fed Cezary Rojewski      2022-07-20  182  		snd_hdac_device_unregister(&codec->core);
1f9a732d481fed Cezary Rojewski      2022-07-20  183  		put_device(&codec->core.dev);
9c25af250214e4 Kai Vehmanen         2021-01-13  184  	}
5507b8103e2653 Pierre-Louis Bossart 2019-04-12  185  #else
1f9a732d481fed Cezary Rojewski      2022-07-20  186  	codec = snd_hdac_ext_bus_device_init(&hbus->core, address, HDA_DEV_ASOC);
1f9a732d481fed Cezary Rojewski      2022-07-20  187  	ret = PTR_ERR_OR_ZERO(codec);
9c25af250214e4 Kai Vehmanen         2021-01-13  188  #endif
5507b8103e2653 Pierre-Louis Bossart 2019-04-12  189  
5507b8103e2653 Pierre-Louis Bossart 2019-04-12  190  	return ret;
5507b8103e2653 Pierre-Louis Bossart 2019-04-12  191  }
5507b8103e2653 Pierre-Louis Bossart 2019-04-12  192  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
