Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4F73D65
	for <llvm@lists.linux.dev>; Thu,  2 Jun 2022 20:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654200049; x=1685736049;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LhfFstmU8umuCBkObaNVgZTt4U6is+wjbx1RU6J1Iwg=;
  b=QXu3zbZklhriBfmIbygrHfayExWkbulaDZSjjIY3b8s6L0w5hKOuZQzE
   oZphwjWJEOPKfimDhQgR6Vu5stPss7gvVrsgU2BZZKBX4WcxgBhYvxgzU
   l8jYUJ4k7DIwjz0vscIkPcdSb4lxksXB4E6J2nFpZDpyJWPU2PUJ3vCD0
   dT9DZtgmCbAZGJvM6S/ElMBvSRqtyYDkQT3E+DZrjDqLUcQOM64b+un6C
   2hSe07jSgbt4Vcr0P9J/YIM4+ehH0iBiyT60/DwLm2VK2Bp6ud3zeqU7Q
   /uo3JxtawL79Mb/fgerjgVbTmYbbaoD333qH7Lfn669j28FFv5vGmK/yn
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10366"; a="274869153"
X-IronPort-AV: E=Sophos;i="5.91,272,1647327600"; 
   d="scan'208";a="274869153"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2022 13:00:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,272,1647327600"; 
   d="scan'208";a="668144480"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Jun 2022 13:00:46 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nwqzu-0005PB-54;
	Thu, 02 Jun 2022 20:00:46 +0000
Date: Fri, 3 Jun 2022 04:00:16 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 15/20] ASoC: tlv320aic23: Use modern ASoC DAI format
 terminology
Message-ID: <202206030307.ZnUCVGoC-lkp@intel.com>
References: <20220602135316.3554400-16-broonie@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220602135316.3554400-16-broonie@kernel.org>

Hi Mark,

I love your patch! Yet something to improve:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on v5.18 next-20220602]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Brown/ASoC-DAI-clocking-terminology-modernisation/20220602-220124
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20220603/202206030307.ZnUCVGoC-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b364c76683f8ef241025a9556300778c07b590c2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3ef04fe7b323f8132d917a0f3b54ff93e003db5c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mark-Brown/ASoC-DAI-clocking-terminology-modernisation/20220602-220124
        git checkout 3ef04fe7b323f8132d917a0f3b54ff93e003db5c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> sound/soc/codecs/tlv320aic23.c:432:16: error: use of undeclared identifier 'SND_SOC_DAIFMT_CLOCk_PROVIDER_MASK'
           switch (fmt & SND_SOC_DAIFMT_CLOCk_PROVIDER_MASK) {
                         ^
   1 error generated.


vim +/SND_SOC_DAIFMT_CLOCk_PROVIDER_MASK +432 sound/soc/codecs/tlv320aic23.c

   423	
   424	static int tlv320aic23_set_dai_fmt(struct snd_soc_dai *codec_dai,
   425					   unsigned int fmt)
   426	{
   427		struct snd_soc_component *component = codec_dai->component;
   428		u16 iface_reg;
   429	
   430		iface_reg = snd_soc_component_read(component, TLV320AIC23_DIGT_FMT) & (~0x03);
   431	
 > 432		switch (fmt & SND_SOC_DAIFMT_CLOCk_PROVIDER_MASK) {
   433		case SND_SOC_DAIFMT_CBP_CFP:
   434			iface_reg |= TLV320AIC23_MS_MASTER;
   435			break;
   436		case SND_SOC_DAIFMT_CBC_CFC:
   437			iface_reg &= ~TLV320AIC23_MS_MASTER;
   438			break;
   439		default:
   440			return -EINVAL;
   441	
   442		}
   443	
   444		/* interface format */
   445		switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
   446		case SND_SOC_DAIFMT_I2S:
   447			iface_reg |= TLV320AIC23_FOR_I2S;
   448			break;
   449		case SND_SOC_DAIFMT_DSP_A:
   450			iface_reg |= TLV320AIC23_LRP_ON;
   451			fallthrough;
   452		case SND_SOC_DAIFMT_DSP_B:
   453			iface_reg |= TLV320AIC23_FOR_DSP;
   454			break;
   455		case SND_SOC_DAIFMT_RIGHT_J:
   456			break;
   457		case SND_SOC_DAIFMT_LEFT_J:
   458			iface_reg |= TLV320AIC23_FOR_LJUST;
   459			break;
   460		default:
   461			return -EINVAL;
   462	
   463		}
   464	
   465		snd_soc_component_write(component, TLV320AIC23_DIGT_FMT, iface_reg);
   466	
   467		return 0;
   468	}
   469	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
