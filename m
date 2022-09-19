Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DE4A31
	for <llvm@lists.linux.dev>; Mon, 19 Sep 2022 23:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663628533; x=1695164533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dvh+UlkvdpiQSHIW3A7r2/w/NsB0w/2Oqtpskxfm1Fs=;
  b=ivhNn2SjGCCvKXtoPzZrjqYRHLT5bTSM98+CdfzoDJZbrX10+5CBKs6n
   b5L9ys9Ra0NMzOhSIJiR0Qst0j140/9ChOE39AgS5Z9AdpGZySEEvGrgB
   clJdM7eUn2aaJXOROxhSShoJLkZjXMjVbwgClC5ckb4LkI8zZrkB4S4RI
   hndqNsCN3ExSsny5IbBha2FNoOy6owOz+uoZS08FbFv1l4UIVryBdHuTJ
   Wp27kzP2jxcVanrLzrBKGTvtJnmCoOSXMyjtUNrM4jX7TzovCcuaz/hED
   32sNOzJjl6Ziu0/jsVF69AyDr7z5VDfErv7egfpWWYzF7SCEPvRfHOw61
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="279924778"
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; 
   d="scan'208";a="279924778"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2022 16:02:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; 
   d="scan'208";a="596277115"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 19 Sep 2022 16:02:10 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oaPmE-0002Hd-0t;
	Mon, 19 Sep 2022 23:02:10 +0000
Date: Tue, 20 Sep 2022 07:01:21 +0800
From: kernel test robot <lkp@intel.com>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 6202/7934] sound/soc/intel/skylake/skl.c:735:23:
 error: use of undeclared identifier 'skl'
Message-ID: <202209200627.BuXVSUNo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4c9ca5b1597e3222177ba2a94658f78fa5ef4f58
commit: 515626a33a194c4caaf2879dbf9e00e882582af0 [6202/7934] ASoC: Intel: fix unused-variable warning in probe_codec
config: x86_64-randconfig-a006-20220919 (https://download.01.org/0day-ci/archive/20220920/202209200627.BuXVSUNo-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=515626a33a194c4caaf2879dbf9e00e882582af0
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 515626a33a194c4caaf2879dbf9e00e882582af0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

Note: the linux-next/master HEAD 4c9ca5b1597e3222177ba2a94658f78fa5ef4f58 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> sound/soc/intel/skylake/skl.c:735:23: error: use of undeclared identifier 'skl'
           hdev = devm_kzalloc(&skl->pci->dev, sizeof(*hdev), GFP_KERNEL);
                                ^
   sound/soc/intel/skylake/skl.c:953:42: warning: shift count >= width of type [-Wshift-count-overflow]
           if (dma_set_mask_and_coherent(bus->dev, DMA_BIT_MASK(64)))
                                                   ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   1 warning and 1 error generated.


vim +/skl +735 sound/soc/intel/skylake/skl.c

8c4e7c2ee8096b Pierre-Louis Bossart 2018-11-18  691  
d8c2dab8381d58 Jeeja KP             2015-07-09  692  /*
d8c2dab8381d58 Jeeja KP             2015-07-09  693   * Probe the given codec address
d8c2dab8381d58 Jeeja KP             2015-07-09  694   */
76f56fae1cf904 Rakesh Ughreja       2018-06-01  695  static int probe_codec(struct hdac_bus *bus, int addr)
d8c2dab8381d58 Jeeja KP             2015-07-09  696  {
d8c2dab8381d58 Jeeja KP             2015-07-09  697  	unsigned int cmd = (addr << 28) | (AC_NODE_ROOT << 20) |
d8c2dab8381d58 Jeeja KP             2015-07-09  698  		(AC_VERB_PARAMETERS << 8) | AC_PAR_VENDOR_ID;
e6a33532affd14 Dan Carpenter        2017-04-20  699  	unsigned int res = -1;
8c4e7c2ee8096b Pierre-Louis Bossart 2018-11-18  700  #if IS_ENABLED(CONFIG_SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC)
515626a33a194c Gaosheng Cui         2022-08-22  701  	struct skl_dev *skl = bus_to_skl(bus);
6bae5ea9498926 Rakesh Ughreja       2018-08-22  702  	struct hdac_hda_priv *hda_codec;
6bae5ea9498926 Rakesh Ughreja       2018-08-22  703  	int err;
8c4e7c2ee8096b Pierre-Louis Bossart 2018-11-18  704  #endif
8c4e7c2ee8096b Pierre-Louis Bossart 2018-11-18  705  	struct hdac_device *hdev;
d8c2dab8381d58 Jeeja KP             2015-07-09  706  
d8c2dab8381d58 Jeeja KP             2015-07-09  707  	mutex_lock(&bus->cmd_mutex);
d8c2dab8381d58 Jeeja KP             2015-07-09  708  	snd_hdac_bus_send_cmd(bus, cmd);
d8c2dab8381d58 Jeeja KP             2015-07-09  709  	snd_hdac_bus_get_response(bus, addr, &res);
d8c2dab8381d58 Jeeja KP             2015-07-09  710  	mutex_unlock(&bus->cmd_mutex);
d8c2dab8381d58 Jeeja KP             2015-07-09  711  	if (res == -1)
d8c2dab8381d58 Jeeja KP             2015-07-09  712  		return -EIO;
00deadb5d86a3c Rakesh Ughreja       2018-08-22  713  	dev_dbg(bus->dev, "codec #%d probed OK: %x\n", addr, res);
d8c2dab8381d58 Jeeja KP             2015-07-09  714  
8c4e7c2ee8096b Pierre-Louis Bossart 2018-11-18  715  #if IS_ENABLED(CONFIG_SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC)
6bae5ea9498926 Rakesh Ughreja       2018-08-22  716  	hda_codec = devm_kzalloc(&skl->pci->dev, sizeof(*hda_codec),
6bae5ea9498926 Rakesh Ughreja       2018-08-22  717  				 GFP_KERNEL);
6bae5ea9498926 Rakesh Ughreja       2018-08-22  718  	if (!hda_codec)
6298542fa33b6b Rakesh Ughreja       2018-06-01  719  		return -ENOMEM;
6298542fa33b6b Rakesh Ughreja       2018-06-01  720  
6bae5ea9498926 Rakesh Ughreja       2018-08-22  721  	hda_codec->codec.bus = skl_to_hbus(skl);
6bae5ea9498926 Rakesh Ughreja       2018-08-22  722  	hdev = &hda_codec->codec.core;
6bae5ea9498926 Rakesh Ughreja       2018-08-22  723  
163cd1059a85d2 Kai Vehmanen         2020-09-21  724  	err = snd_hdac_ext_bus_device_init(bus, addr, hdev, HDA_DEV_ASOC);
6bae5ea9498926 Rakesh Ughreja       2018-08-22  725  	if (err < 0)
6bae5ea9498926 Rakesh Ughreja       2018-08-22  726  		return err;
6bae5ea9498926 Rakesh Ughreja       2018-08-22  727  
6bae5ea9498926 Rakesh Ughreja       2018-08-22  728  	/* use legacy bus only for HDA codecs, idisp uses ext bus */
6bae5ea9498926 Rakesh Ughreja       2018-08-22  729  	if ((res & 0xFFFF0000) != IDISP_INTEL_VENDOR_ID) {
6bae5ea9498926 Rakesh Ughreja       2018-08-22  730  		hdev->type = HDA_DEV_LEGACY;
6bae5ea9498926 Rakesh Ughreja       2018-08-22  731  		load_codec_module(&hda_codec->codec);
6bae5ea9498926 Rakesh Ughreja       2018-08-22  732  	}
6bae5ea9498926 Rakesh Ughreja       2018-08-22  733  	return 0;
8c4e7c2ee8096b Pierre-Louis Bossart 2018-11-18  734  #else
8c4e7c2ee8096b Pierre-Louis Bossart 2018-11-18 @735  	hdev = devm_kzalloc(&skl->pci->dev, sizeof(*hdev), GFP_KERNEL);
8c4e7c2ee8096b Pierre-Louis Bossart 2018-11-18  736  	if (!hdev)
8c4e7c2ee8096b Pierre-Louis Bossart 2018-11-18  737  		return -ENOMEM;
8c4e7c2ee8096b Pierre-Louis Bossart 2018-11-18  738  
163cd1059a85d2 Kai Vehmanen         2020-09-21  739  	return snd_hdac_ext_bus_device_init(bus, addr, hdev, HDA_DEV_ASOC);
8c4e7c2ee8096b Pierre-Louis Bossart 2018-11-18  740  #endif /* CONFIG_SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC */
d8c2dab8381d58 Jeeja KP             2015-07-09  741  }
d8c2dab8381d58 Jeeja KP             2015-07-09  742  

:::::: The code at line 735 was first introduced by commit
:::::: 8c4e7c2ee8096b5ca8214418f287b3878d578cc0 ASoC: Intel: Skylake: fix Kconfigs, make HDaudio codec optional

:::::: TO: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
