Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06281372
	for <llvm@lists.linux.dev>; Wed,  3 Aug 2022 01:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659488745; x=1691024745;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m2MupJwe/gULHtIjsCr/h/eqv3CTg1GXXXRhryy/IkU=;
  b=PyWf7IRuVwkq9vYWgp3nTw3Djusn5RhhsSYBlt2MjxT+t5BJV3aU5azx
   dXPkNEnDU3e6qAnCmfq7olr08nguY/GiN61KP1VyEfWNu++xWofQ0NtQS
   g0SM2WlgblfsrCxu2JVKEu2l2pMPvRSvDSLS86rxJ847re78ZE3EEERWs
   wWVe7WNgAJugFWfCO42Caho17dfbvoWJDHDLfKFdAquIbB7DmZ1tQYzFk
   ctkycCBsa2AXQR/a/nPXPjPDk/g7QGrSOKxHMvvSdNeudig71gPMv/Ob8
   35qnb/7Bl4YCtpgfXF/J90f1vtNR4znq8Xt/y/NHfJsTJ3+Vl5othyghX
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="276465781"
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; 
   d="scan'208";a="276465781"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2022 18:05:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; 
   d="scan'208";a="635493707"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 02 Aug 2022 18:05:41 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oJ2pQ-000GdX-2t;
	Wed, 03 Aug 2022 01:05:40 +0000
Date: Wed, 3 Aug 2022 09:05:34 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Sean Wang <sean.wang@mediatek.com>, Pavel Machek <pavel@ucw.cz>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v1 1/1] leds: mt6323: Get rid of custom
 led_init_default_state_get()
Message-ID: <202208030841.jfVsINQD-lkp@intel.com>
References: <20220802212537.7122-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220802212537.7122-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

I love your patch! Yet something to improve:

[auto build test ERROR on pavel-leds/for-next]
[also build test ERROR on linus/master v5.19 next-20220728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/leds-mt6323-Get-rid-of-custom-led_init_default_state_get/20220803-052811
base:   git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git for-next
config: x86_64-randconfig-a005-20220801 (https://download.01.org/0day-ci/archive/20220803/202208030841.jfVsINQD-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/30cc6458329b3d5a593e0d2173dc63d8dc6446f5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Shevchenko/leds-mt6323-Get-rid-of-custom-led_init_default_state_get/20220803-052811
        git checkout 30cc6458329b3d5a593e0d2173dc63d8dc6446f5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/leds/leds-mt6323.c:345:10: error: call to undeclared function 'led_init_default_state_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           state = led_init_default_state_get(of_fwnode_handle(np));
                   ^
   1 error generated.


vim +/led_init_default_state_get +345 drivers/leds/leds-mt6323.c

   337	
   338	static int mt6323_led_set_dt_default(struct led_classdev *cdev,
   339					     struct device_node *np)
   340	{
   341		struct mt6323_led *led = container_of(cdev, struct mt6323_led, cdev);
   342		enum led_default_state state;
   343		int ret = 0;
   344	
 > 345		state = led_init_default_state_get(of_fwnode_handle(np));
   346		switch (state) {
   347		case LEDS_DEFSTATE_ON:
   348			ret = mt6323_led_set_brightness(cdev, cdev->max_brightness);
   349			break;
   350		case LEDS_DEFSTATE_KEEP:
   351			ret = mt6323_get_led_hw_brightness(cdev);
   352			if (ret < 0)
   353				return ret;
   354			led->current_brightness = ret;
   355			ret = 0;
   356			break;
   357		default:
   358			ret = mt6323_led_set_brightness(cdev, LED_OFF);
   359		}
   360	
   361		return ret;
   362	}
   363	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
