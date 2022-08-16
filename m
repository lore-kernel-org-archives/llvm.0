Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2585C1867
	for <llvm@lists.linux.dev>; Tue, 16 Aug 2022 03:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660621787; x=1692157787;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KAiP5iJJgb/6Yq3FQ4Ggw1JqWJUBeDH9aBpsqpWyr3s=;
  b=Qq8AIBmFPsXUqJLSXnWiOwgnCGGfW3NA7IFlZyqENzFZWqGF9mAu39aU
   nx6rGSPrYyWuwqm4ZOcjl26fLKitN2V4u1drWd6XUFh05kyv8MFdzBmO6
   kbI40+HTEL7MW0epAC5OLXzOe95DduOrbaebV0bEzYUKADrDq46Wibk0k
   Lql4gmSAiDINFQK8MbCxAuEpk83N9M5kwnSXD8GL15YN6PXtRtOPGVMx4
   jn/rPGuQx4PMBCqm46DIyL+cw+xBLmxoPBEBpPDn+3+JtHob5MluzSH+5
   QsaPHZlZbsCUO/wEe/xAl0xPe+mPt2lrUNgJKE4EBaE7RKQwbHlmrdrhh
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="356120434"
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; 
   d="scan'208";a="356120434"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2022 20:49:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; 
   d="scan'208";a="583137550"
Received: from lkp-server02.sh.intel.com (HELO 3d2a4d02a2a9) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 15 Aug 2022 20:49:45 -0700
Received: from kbuild by 3d2a4d02a2a9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oNnaK-0001QS-1l;
	Tue, 16 Aug 2022 03:49:44 +0000
Date: Tue, 16 Aug 2022 11:49:06 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/070-audio 9/16] sound/soc/apple/macaudio.c:627:15:
 error: too many arguments to function call, expected 4, have 6
Message-ID: <202208161128.ck05kP2v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   54b20e361303307d4ed9f2903ad7b1f41caf8bea
commit: ca97cfa4728cf208e9d53e17f5ff54cc08e804b3 [9/16] ASoC: apple: Add macaudio machine driver
config: arm64-randconfig-r015-20220815 (https://download.01.org/0day-ci/archive/20220816/202208161128.ck05kP2v-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project aed5e3bea138ce581d682158eb61c27b3cfdd6ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/AsahiLinux/linux/commit/ca97cfa4728cf208e9d53e17f5ff54cc08e804b3
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/070-audio
        git checkout ca97cfa4728cf208e9d53e17f5ff54cc08e804b3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash sound/soc/apple/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> sound/soc/apple/macaudio.c:627:15: error: too many arguments to function call, expected 4, have 6
                           &ma->jack, &ma->pin, 1);
                                      ^~~~~~~~~~~
   include/sound/soc-card.h:18:5: note: 'snd_soc_card_jack_new' declared here
   int snd_soc_card_jack_new(struct snd_soc_card *card, const char *id, int type,
       ^
   1 error generated.


vim +627 sound/soc/apple/macaudio.c

   614	
   615	static int macaudio_probe(struct snd_soc_card *card)
   616	{
   617		struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
   618		int ret;
   619	
   620		ma->pin.pin = "Headphones";
   621		ma->pin.mask = SND_JACK_HEADSET | SND_JACK_HEADPHONE;
   622		ret = snd_soc_card_jack_new(card, ma->pin.pin,
   623				SND_JACK_HEADSET |
   624				SND_JACK_HEADPHONE |
   625				SND_JACK_BTN_0 | SND_JACK_BTN_1 |
   626				SND_JACK_BTN_2 | SND_JACK_BTN_3,
 > 627				&ma->jack, &ma->pin, 1);
   628	
   629		if (ret < 0) {
   630			dev_err(card->dev, "jack creation failed: %d\n", ret);
   631			return ret;
   632		}
   633	
   634		snd_soc_jack_notifier_register(&ma->jack, &macaudio_jack_nb);
   635	
   636		return ret;
   637	}
   638	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
