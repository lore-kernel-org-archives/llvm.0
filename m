Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8154D63B6;
	Sat,  6 Jan 2024 10:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ww0UhItR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704535409; x=1736071409;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tW+1nWAst3gxu6PlxCkq1/i3iPKKBb6kaPZqZ4zFvGA=;
  b=Ww0UhItRix1yC1SRJl1YiqMgTR9entE4YpTdSHwInfQBSRR6v3D5C9kc
   h3jkqCQf+V3mt4sMe4EnUuOIEz5T0ItKBJlMVRNzQ1u5DpGoUInSMkAUP
   zt8/rw6SogjpJuoMVE8XUv2LlPp/4O89yWuQELptDneIE8mhLhqAIP/dl
   knNnkvls+pHN/Q0QFa4EPnSRQrgqGfSbWE+SdVeVNVcU1TxsrKIuYnmC4
   ejQQDg/lUVRbbrFIkemKDUKoSaabrvCMHHyQC4Vhw7XnLKtKj/FHQfGpw
   QYHFfu9Iirgw5N66NqX9wguhVq8dCwQZSzzHTUcucg/MF2c/UW3QJ4qq4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="464048496"
X-IronPort-AV: E=Sophos;i="6.04,336,1695711600"; 
   d="scan'208";a="464048496"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2024 02:03:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,336,1695711600"; 
   d="scan'208";a="15462920"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 06 Jan 2024 02:03:21 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rM3WQ-0002JQ-1A;
	Sat, 06 Jan 2024 10:03:18 +0000
Date: Sat, 6 Jan 2024 18:02:49 +0800
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
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Peng Fan <peng.fan@nxp.com>, Jeff LaBundy <jeff@labundy.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Herve Codina <herve.codina@bootlin.com>,
	Shuming Fan <shumingf@realtek.com>,
	Shenghao Ding <13916275206@139.com>,
	Ryan Lee <ryans.lee@analog.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	"open list:CIRRUS LOGIC HAPTIC DRIVERS" <patches@opensource.cirrus.com>
Subject: Re: [PATCH v5 4/5] Input: cs40l50 - Add support for the CS40L50
 haptic driver
Message-ID: <202401061706.DudVTUYk-lkp@intel.com>
References: <20240104223643.876292-5-jogletre@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104223643.876292-5-jogletre@opensource.cirrus.com>

Hi James,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-mfd/for-mfd-next]
[also build test ERROR on dtor-input/next dtor-input/for-linus broonie-sound/for-next linus/master lee-mfd/for-mfd-fixes v6.7-rc8 next-20240105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Ogletree/firmware-cs_dsp-Add-write-sequencer-interface/20240105-064201
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20240104223643.876292-5-jogletre%40opensource.cirrus.com
patch subject: [PATCH v5 4/5] Input: cs40l50 - Add support for the CS40L50 haptic driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240106/202401061706.DudVTUYk-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240106/202401061706.DudVTUYk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401061706.DudVTUYk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/input/misc/cs40l50-vibra.c:130:14: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     130 |                 gpio_num = FIELD_GET(CS40L50_GPIO_NUM_MASK, button);
         |                            ^
   1 error generated.


vim +/FIELD_GET +130 drivers/input/misc/cs40l50-vibra.c

   123	
   124	static int vibra_effect_mapping_set(struct vibra_info *info, u16 button,
   125					    struct vibra_effect *effect)
   126	{
   127		u32 gpio_num, gpio_edge;
   128	
   129		if (button) {
 > 130			gpio_num = FIELD_GET(CS40L50_GPIO_NUM_MASK, button);
   131			gpio_edge = FIELD_GET(CS40L50_GPIO_EDGE_MASK, button);
   132			effect->gpio_mapping = info->dsp.gpio_base_reg +
   133					       (gpio_num * 8) - gpio_edge;
   134	
   135			return regmap_write(info->regmap, effect->gpio_mapping, button);
   136		}
   137	
   138		effect->gpio_mapping = CS40L50_GPIO_MAPPING_INVALID;
   139	
   140		return 0;
   141	}
   142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
