Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075A910E9
	for <llvm@lists.linux.dev>; Mon, 11 Apr 2022 03:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649647589; x=1681183589;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DMUWWomzeQ4h8nFibG2O3HHnv4IWTKcDm7dS1/oMGto=;
  b=mAVNbCAUX/kZn9d1A0iyUVlnahmAZaiFIKOpt5XXkl4dL/c7qlxf/Qho
   aucBgRgw+8iLFFxZRofBTmsOY56m+YeX6lRrTL5LTuUqy6Qu+fH3bNqsA
   sOWvfTfJF/8SlBK5/SlPOMQ29X5NisJVYgzXVaTfMuZZJIE3h7J2LMseo
   UrVgJXkrVIMZysNpOXKSKnJX2HLBFelQ0WshU24RtYLAplcMT/2/z5EUb
   U+GOi6uCAqlAe19MtIbbsFbBPdQI0Kjh03s2aN6Xvl6tOKPISgvVAJG9v
   HhpTLhhBTexzc/e698STe40woy/YrJ9WnH/6fAmVFhunJNl5t54G28pJI
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="262203320"
X-IronPort-AV: E=Sophos;i="5.90,250,1643702400"; 
   d="scan'208";a="262203320"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2022 20:26:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,250,1643702400"; 
   d="scan'208";a="643921812"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Apr 2022 20:26:27 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ndkh8-0001Mv-Av;
	Mon, 11 Apr 2022 03:26:26 +0000
Date: Mon, 11 Apr 2022 11:25:46 +0800
From: kernel test robot <lkp@intel.com>
To: Zhu Ning <zhuning0077@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH] ASoC: codecs: add support for ES8326
Message-ID: <202204111107.muWhYsI4-lkp@intel.com>
References: <20220405131220.1149-1-zhuning0077@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405131220.1149-1-zhuning0077@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Zhu,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on tiwai-sound/for-next v5.18-rc2 next-20220408]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhu-Ning/ASoC-codecs-add-support-for-ES8326/20220408-155312
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: mips-randconfig-r006-20220410 (https://download.01.org/0day-ci/archive/20220411/202204111107.muWhYsI4-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c6e83f560f06cdfe8aa47b248d8bdc58f947274b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/a03666fc9b47aca9c81a796145c3d31fa718a49e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zhu-Ning/ASoC-codecs-add-support-for-ES8326/20220408-155312
        git checkout a03666fc9b47aca9c81a796145c3d31fa718a49e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/es8326.c:719:35: warning: unused variable 'es8326_i2c_id' [-Wunused-const-variable]
   static const struct i2c_device_id es8326_i2c_id[] = {
                                     ^
   1 warning generated.


vim +/es8326_i2c_id +719 sound/soc/codecs/es8326.c

   717	
   718	#ifdef CONFIG_OF
 > 719	static const struct i2c_device_id es8326_i2c_id[] = {
   720		{"es8326", 0 },
   721		{}
   722	};
   723	MODULE_DEVICE_TABLE(i2c, es8326_i2c_id);
   724	#endif
   725	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
