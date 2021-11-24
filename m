Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9332C81
	for <llvm@lists.linux.dev>; Wed, 24 Nov 2021 20:30:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="222243715"
X-IronPort-AV: E=Sophos;i="5.87,261,1631602800"; 
   d="scan'208";a="222243715"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2021 12:30:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,261,1631602800"; 
   d="scan'208";a="497814522"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 24 Nov 2021 12:30:01 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mpyu0-0005I0-C2; Wed, 24 Nov 2021 20:30:00 +0000
Date: Thu, 25 Nov 2021 04:29:45 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v10 2/5] gpio: sim: new testing module
Message-ID: <202111250402.c73il0rL-lkp@intel.com>
References: <20211124114257.19878-3-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211124114257.19878-3-brgl@bgdev.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Bartosz,

I love your patch! Perhaps something to improve:

[auto build test WARNING on v5.16-rc2]
[cannot apply to shuah-kselftest/next linusw-gpio/for-next next-20211124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Bartosz-Golaszewski/gpio-sim-configfs-based-GPIO-simulator/20211124-194521
base:    136057256686de39cc3a07c2e39ef6bc43003ff6
config: i386-buildonly-randconfig-r001-20211124 (https://download.01.org/0day-ci/archive/20211125/202111250402.c73il0rL-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 67a1c45def8a75061203461ab0060c75c864df1c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/6e279d2416d71b602a9d97147e762c9ed38d484a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Bartosz-Golaszewski/gpio-sim-configfs-based-GPIO-simulator/20211124-194521
        git checkout 6e279d2416d71b602a9d97147e762c9ed38d484a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=i386 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-sim.c:1085:2: warning: variable 'repr' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
           default:
           ^~~~~~~
   drivers/gpio/gpio-sim.c:1090:31: note: uninitialized use occurs here
           return sprintf(page, "%s\n", repr);
                                        ^~~~
   drivers/gpio/gpio-sim.c:1068:12: note: initialize the variable 'repr' to silence this warning
           char *repr;
                     ^
                      = NULL
   1 warning generated.


vim +/repr +1085 drivers/gpio/gpio-sim.c

  1063	
  1064	static ssize_t gpio_sim_config_hog_direction_show(struct config_item *item,
  1065							  char *page)
  1066	{
  1067		struct gpio_sim_line_ctx *ctx = gpio_sim_hog_item_to_line_ctx(item);
  1068		char *repr;
  1069		int dir;
  1070	
  1071		mutex_lock(&ctx->parent->lock);
  1072		dir = ctx->hog_dir;
  1073		mutex_unlock(&ctx->parent->lock);
  1074	
  1075		switch (dir) {
  1076		case GPIOD_IN:
  1077			repr = "input";
  1078			break;
  1079		case GPIOD_OUT_HIGH:
  1080			repr = "output-high";
  1081			break;
  1082		case GPIOD_OUT_LOW:
  1083			repr = "output-low";
  1084			break;
> 1085		default:
  1086			WARN(1, "Unexpected hog direction value: %d", dir);
  1087			break;
  1088		}
  1089	
  1090		return sprintf(page, "%s\n", repr);
  1091	}
  1092	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
