Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7A33C35
	for <llvm@lists.linux.dev>; Mon,  5 Sep 2022 10:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662372434; x=1693908434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HPt3jPuMljFnT1HwUVeRYiZPN24kNujUVy3j7fR1Br8=;
  b=WRtRc3L9IrkeAo+Vgg8Ej1zs63yqF2crFknjS0mx5097/3C8jzIPw7Lg
   L6TDxQMSm+k0xNV0AUy72G+RxM5l8bDe/QQWTl0iSR76SOcpp49yc6VPg
   E0F6cu9n5Yj7gSw8DMJtF2TYXsV+23q6B7dYlCle5g2Fzsq9MrgewAV+l
   ZlPsJK0KV2KpUFuUpypXZq8hXdakJ01nRNln2MtbXG1Wz2hev/EYFzvXw
   wca0KEVZ3Iuj3VTvHyG7A9e8+pePZpOP7UfTSuqgy/SrFolkuFOAbi405
   zRt6d4ErHxsiSbFnBg9Mc3yNSJVLnnN1nqGPbsCwrIpPioJwv2DPr2v3S
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10460"; a="293939334"
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; 
   d="scan'208";a="293939334"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 03:07:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; 
   d="scan'208";a="682010011"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 05 Sep 2022 03:07:10 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oV90X-000425-10;
	Mon, 05 Sep 2022 10:07:09 +0000
Date: Mon, 5 Sep 2022 18:06:14 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:tiwai/sound/master 42/45]
 sound/pci/hda/patch_sigmatel.c:4450:24: warning: unused variable 'spec'
Message-ID: <202209051729.qu4hSOAb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block tiwai/sound/master
head:   a6c91e26b44722382fb45d782d25d9ed77bbb184
commit: 414d38ba871092aeac4ed097ac4ced89486646f7 [42/45] ALSA: hda/sigmatel: Keep power up while beep is enabled
config: x86_64-randconfig-a014-20220905 (https://download.01.org/0day-ci/archive/20220905/202209051729.qu4hSOAb-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/414d38ba871092aeac4ed097ac4ced89486646f7
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block tiwai/sound/master
        git checkout 414d38ba871092aeac4ed097ac4ced89486646f7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash sound/pci/hda/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/pci/hda/patch_sigmatel.c:4450:24: warning: unused variable 'spec' [-Wunused-variable]
           struct sigmatel_spec *spec = codec->spec;
                                 ^
   1 warning generated.


vim +/spec +4450 sound/pci/hda/patch_sigmatel.c

  4447	
  4448	static int stac_check_power_status(struct hda_codec *codec, hda_nid_t nid)
  4449	{
> 4450		struct sigmatel_spec *spec = codec->spec;
  4451		int ret = snd_hda_gen_check_power_status(codec, nid);
  4452	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
