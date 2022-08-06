Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD52F1103
	for <llvm@lists.linux.dev>; Sat,  6 Aug 2022 16:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659804245; x=1691340245;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jXbt3yEp1PdNwvWnNUWK/iDHpKohU1vrRqIucTRmWws=;
  b=gt6gvS/PvNVRedsJ7pAcb55C8XArzl3wks4SOvo2BxuNcpeQi25v70i0
   KcKjOH9PNC3J97INJaVmtyJffB+WhEwNSTREJkU0pz95m80B+ewKdeKPP
   m5pS54sAcaAe+BgxAgYrGbYdut1svojDBtAu7n8MgkF5ItGQ0R7hbc2mp
   0l33tF1Wbmksr8d2xcdz1zNHkzQBvE3LL0YWAXAxNRDWUvCIgrnWAER8L
   wbZu4N+y+6VOGSXvFHDSq576DZPVQf7IBJsz+u+uDRUIkoI6MzMT98oIm
   4AtfeemeUQVNGoDAP9PY0krsmBNgevshqIDwf6+vINeCXy+PehIUYTURN
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10431"; a="316278277"
X-IronPort-AV: E=Sophos;i="5.93,217,1654585200"; 
   d="scan'208";a="316278277"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2022 09:44:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,217,1654585200"; 
   d="scan'208";a="746173900"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 06 Aug 2022 09:44:03 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oKMuB-000KX3-0L;
	Sat, 06 Aug 2022 16:44:03 +0000
Date: Sun, 7 Aug 2022 00:43:11 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v1 1/1] leds: bcm6358: Get rid of custom
 led_init_default_state_get()
Message-ID: <202208070030.kV6Z7e9R-lkp@intel.com>
References: <20220802212542.7153-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220802212542.7153-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

I love your patch! Yet something to improve:

[auto build test ERROR on pavel-leds/for-next]
[also build test ERROR on linus/master v5.19 next-20220805]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/leds-bcm6358-Get-rid-of-custom-led_init_default_state_get/20220803-053220
base:   git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git for-next
config: arm-buildonly-randconfig-r004-20220801 (https://download.01.org/0day-ci/archive/20220807/202208070030.kV6Z7e9R-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/ad3083d8ac0e2beb10b75a7d87085911b4f6139a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Shevchenko/leds-bcm6358-Get-rid-of-custom-led_init_default_state_get/20220803-053220
        git checkout ad3083d8ac0e2beb10b75a7d87085911b4f6139a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/leds/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/leds/leds-bcm6358.c:116:10: error: call to undeclared function 'led_init_default_state_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           state = led_init_default_state_get(init_data.fwnode);
                   ^
   1 error generated.


vim +/led_init_default_state_get +116 drivers/leds/leds-bcm6358.c

    93	
    94	static int bcm6358_led(struct device *dev, struct device_node *nc, u32 reg,
    95			       void __iomem *mem, spinlock_t *lock)
    96	{
    97		struct led_init_data init_data = {};
    98		struct bcm6358_led *led;
    99		enum led_default_state state;
   100		unsigned long val;
   101		int rc;
   102	
   103		led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
   104		if (!led)
   105			return -ENOMEM;
   106	
   107		led->pin = reg;
   108		led->mem = mem;
   109		led->lock = lock;
   110	
   111		if (of_property_read_bool(nc, "active-low"))
   112			led->active_low = true;
   113	
   114		init_data.fwnode = of_fwnode_handle(nc);
   115	
 > 116		state = led_init_default_state_get(init_data.fwnode);
   117		switch (state) {
   118		case LEDS_DEFSTATE_ON:
   119			led->cdev.brightness = LED_FULL;
   120			break;
   121		case LEDS_DEFSTATE_KEEP:
   122			val = bcm6358_led_read(led->mem + BCM6358_REG_MODE);
   123			val &= BIT(led->pin);
   124			if ((led->active_low && !val) || (!led->active_low && val))
   125				led->cdev.brightness = LED_FULL;
   126			else
   127				led->cdev.brightness = LED_OFF;
   128			break;
   129		default:
   130			led->cdev.brightness = LED_OFF;
   131		}
   132	
   133		bcm6358_led_set(&led->cdev, led->cdev.brightness);
   134	
   135		led->cdev.brightness_set = bcm6358_led_set;
   136	
   137		rc = devm_led_classdev_register_ext(dev, &led->cdev, &init_data);
   138		if (rc < 0)
   139			return rc;
   140	
   141		dev_dbg(dev, "registered LED %s\n", led->cdev.name);
   142	
   143		return 0;
   144	}
   145	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
