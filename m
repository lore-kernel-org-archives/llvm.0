Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46703803;
	Sat, 15 Apr 2023 01:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681521920; x=1713057920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LQlwW5Iy/uYfcT0ifL2FNfH7/nWnOJ4yxUFCz4Bbu2c=;
  b=PlRRN6NxQLwvRvG8Z3uTDe1+Pa2c3rVCfyvec0TE76GaPabIIW77Qfpb
   bLe9xNrMYr2damK7Ilgs4xAvruvDuHUZTMZ10dJhXWUhhUJg3JDBhizae
   VxMi7nOErZu2ZmnkzTkuuFZP8SRgq0ecLke6rX5mjd0N3+dm5i+9xR9n1
   +VNTFPqYb/B20C97PeQ+3MeBO2z7rOUzB2yhzPaiHZF1MhQ5NKU10iR9N
   148AAcr5hl8lVoG+4fw3KKBKUtM1K890wDAvKsXWQm18wiQS8ixWeYMNE
   YQE+EoZ/MIgsqPNhNSAodBfedsMXoR5voSq/ROimZK/pTzm0Jzyg2N4aI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="372474016"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; 
   d="scan'208";a="372474016"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 18:25:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="754644724"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; 
   d="scan'208";a="754644724"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 14 Apr 2023 18:25:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnUez-000aEJ-2V;
	Sat, 15 Apr 2023 01:25:01 +0000
Date: Sat, 15 Apr 2023 09:24:36 +0800
From: kernel test robot <lkp@intel.com>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ben Zhang <benzh@chromium.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
	"Ap, Kamal" <kamal.ap@intel.corp-partner.google.com>
Subject: [jsarha:topic/chromeos-4.19-s0ix 6961/9999]
 sound/soc/sof/control.c:483:19: warning: parameter 'size' set but not used
Message-ID: <202304150944.miA8YMdx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/chromeos-4.19-s0ix
head:   430bdaa0a8c38697780f45a148964d71951df11f
commit: e51116ebd36c8c10c8290001915e7f546dc2d398 [6961/9999] UPSTREAM: ASoC: SOF: Add Build support for SOF core and Intel drivers
config: x86_64-randconfig-r036-20230410 (https://download.01.org/0day-ci/archive/20230415/202304150944.miA8YMdx-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jsarha/linux/commit/e51116ebd36c8c10c8290001915e7f546dc2d398
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/chromeos-4.19-s0ix
        git checkout e51116ebd36c8c10c8290001915e7f546dc2d398
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/hwtracing/intel_th/ drivers/mfd/ sound/soc/sof/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304150944.miA8YMdx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/sof/control.c:483:19: warning: parameter 'size' set but not used [-Wunused-but-set-parameter]
                             unsigned int size)
                                          ^
   1 warning generated.


vim +/size +483 sound/soc/sof/control.c

e824e72bd02d0c Liam Girdwood 2019-04-12  480  
e824e72bd02d0c Liam Girdwood 2019-04-12  481  int snd_sof_bytes_ext_get(struct snd_kcontrol *kcontrol,
e824e72bd02d0c Liam Girdwood 2019-04-12  482  			  unsigned int __user *binary_data,
e824e72bd02d0c Liam Girdwood 2019-04-12 @483  			  unsigned int size)

:::::: The code at line 483 was first introduced by commit
:::::: e824e72bd02d0c3c6296788a7c8530857a891602 UPSTREAM: ASoC: SOF: Add Sound Open Firmware KControl support

:::::: TO: Liam Girdwood <liam.r.girdwood@linux.intel.com>
:::::: CC: Ben Zhang <benzh@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
