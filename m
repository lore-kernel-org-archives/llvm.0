Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEE1D514;
	Sat,  6 Jan 2024 18:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bT8v6AsJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704564850; x=1736100850;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z9NgWImdMQC977rHW0HpO7QlTi05Ctkv68Jgb8yGbKU=;
  b=bT8v6AsJ6UoyMekudsRV2TqiOok7lUbP36RhgeKt8Sxo7hTDBhIhjhyP
   N6UAKH2CzLfKDaxBlwZcGm4tuI7aOyQBOBbkjgsVsskcop2sAyJyYtqGW
   jCriVLowesugrtQ1sGM8pOFOLjSv/wxdOl7EIaZun+SoWsjTR5ICDBlwl
   wCdVOLXtu8KV8+FISdbz9XTrzdkT/+aqV5OHIvmIgtxO5daaj1klZLV6s
   m60mKNFD6cfZ92bQEFPLtsm7Q02jNCo5yNbQAm1ViSvBJjhAiaZy2N5nX
   JHlGGRbqh+dtiU8hqRVUFsTCFQZyFBAvR9RoCzHZWq8gfp3d0SAD0JwGa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="483852011"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="483852011"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2024 10:14:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="23132920"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 06 Jan 2024 10:14:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMBBI-0002qg-0I;
	Sat, 06 Jan 2024 18:14:00 +0000
Date: Sun, 7 Jan 2024 02:13:26 +0800
From: kernel test robot <lkp@intel.com>
To: James Ogletree <jogletre@opensource.cirrus.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	James Ogletree <jogletre@opensource.cirrus.com>,
	Fred Treven <fred.treven@cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jeff LaBundy <jeff@labundy.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Peng Fan <peng.fan@nxp.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Herve Codina <herve.codina@bootlin.com>,
	Shuming Fan <shumingf@realtek.com>,
	Shenghao Ding <13916275206@139.com>,
	Ryan Lee <ryans.lee@analog.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Maxim Kochetkov <fido_max@inbox.ru>
Subject: Re: [PATCH v5 5/5] ASoC: cs40l50: Support I2S streaming to CS40L50
Message-ID: <202401070223.b1ie3zqD-lkp@intel.com>
References: <20240104223643.876292-6-jogletre@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104223643.876292-6-jogletre@opensource.cirrus.com>

Hi James,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-mfd/for-mfd-next]
[also build test ERROR on dtor-input/next dtor-input/for-linus broonie-sound/for-next linus/master v6.7-rc8 next-20240105]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Ogletree/firmware-cs_dsp-Add-write-sequencer-interface/20240105-064201
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20240104223643.876292-6-jogletre%40opensource.cirrus.com
patch subject: [PATCH v5 5/5] ASoC: cs40l50: Support I2S streaming to CS40L50
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240107/202401070223.b1ie3zqD-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240107/202401070223.b1ie3zqD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401070223.b1ie3zqD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/cs40l50-codec.c:212:20: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     212 |                 codec->daifmt |= FIELD_PREP(CS40L50_ASP_FMT_MASK, CS40L50_ASP_FMT_I2S);
         |                                  ^
   1 error generated.


vim +/FIELD_PREP +212 sound/soc/codecs/cs40l50-codec.c

   186	
   187	static int cs40l50_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
   188	{
   189		struct cs40l50_codec *codec = snd_soc_component_get_drvdata(codec_dai->component);
   190	
   191		if ((fmt & SND_SOC_DAIFMT_MASTER_MASK) != SND_SOC_DAIFMT_CBS_CFS)
   192			return -EINVAL;
   193	
   194		switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
   195		case SND_SOC_DAIFMT_NB_NF:
   196			codec->daifmt = 0;
   197			break;
   198		case SND_SOC_DAIFMT_NB_IF:
   199			codec->daifmt = CS40L50_ASP_FSYNC_INV_MASK;
   200			break;
   201		case SND_SOC_DAIFMT_IB_NF:
   202			codec->daifmt = CS40L50_ASP_BCLK_INV_MASK;
   203			break;
   204		case SND_SOC_DAIFMT_IB_IF:
   205			codec->daifmt = CS40L50_ASP_FSYNC_INV_MASK | CS40L50_ASP_BCLK_INV_MASK;
   206			break;
   207		default:
   208			return -EINVAL;
   209		}
   210	
   211		if ((fmt & SND_SOC_DAIFMT_FORMAT_MASK) == SND_SOC_DAIFMT_I2S)
 > 212			codec->daifmt |= FIELD_PREP(CS40L50_ASP_FMT_MASK, CS40L50_ASP_FMT_I2S);
   213	
   214		return 0;
   215	}
   216	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
