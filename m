Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AD6158E
	for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 17:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644946983; x=1676482983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oj8OOXX1ckMDtALqPdHVZbRyMA1rseOv4Z7KiHNiDvY=;
  b=gmr7SGDEPDZNH9av/iHB80MGGhkumPKKLuuREGFSMa0+zDJ3a4W0CeRB
   xAuEAFu1gQO9xV6vMk/d3NYGNzwS67N8fGtW3nr6es+UFW0ZganBNdiS8
   P8fy59pQNvA8ysxcitx3WQRLl2OMLgc6qwk3sZeTgzM4A8qTMZF0viO1u
   3ofD5/JkLIEyGR6feHGj0N60s4xr2fcyGU/UOuq/46s81tyX/8uJbFv8p
   ADxs9neQDqxgY/PNXsDOKhtJU9U8ngkWOh2SMC1ujCYQ0VHCd4PVqjiWS
   Y8r6M8Phx3GHyu6EctwqOYQ4bGhUYwzpYRziUKl5LPhf7RnqJ9PgaiQ8H
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="233952638"
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="233952638"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 09:43:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="636028684"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 15 Feb 2022 09:43:01 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nK1qv-0009td-1e; Tue, 15 Feb 2022 17:43:01 +0000
Date: Wed, 16 Feb 2022 01:42:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Kim <ckkim@hardkernel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Dongjin Kim <tobetter@gmail.com>,
	Olliver Schinagl <oliver@schinagl.nl>
Subject: [tobetter:odroid-5.17.y 7/41] drivers/pwm/pwm-gpio.c:60:22: warning:
 no previous prototype for function 'gpio_pwm_timer'
Message-ID: <202202160144.hjSHJs2v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/tobetter/linux odroid-5.17.y
head:   992855288ffabfafb16c8ed7ce9a81fc64cfc89a
commit: 380f2027a31094e1f64a78ce0e424f02dea66bc7 [7/41] ODROID-COMMON: pwm: gpio: Add a generic gpio based PWM driver
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220216/202202160144.hjSHJs2v-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 37f422f4ac31c8b8041c6b62065263314282dab6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/tobetter/linux/commit/380f2027a31094e1f64a78ce0e424f02dea66bc7
        git remote add tobetter https://github.com/tobetter/linux
        git fetch --no-tags tobetter odroid-5.17.y
        git checkout 380f2027a31094e1f64a78ce0e424f02dea66bc7
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/pwm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/pwm/pwm-gpio.c:60:22: warning: no previous prototype for function 'gpio_pwm_timer' [-Wmissing-prototypes]
   enum hrtimer_restart gpio_pwm_timer(struct hrtimer *timer)
                        ^
   drivers/pwm/pwm-gpio.c:60:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   enum hrtimer_restart gpio_pwm_timer(struct hrtimer *timer)
   ^
   static 
   1 warning generated.


vim +/gpio_pwm_timer +60 drivers/pwm/pwm-gpio.c

    59	
  > 60	enum hrtimer_restart gpio_pwm_timer(struct hrtimer *timer)
    61	{
    62		struct gpio_pwm_data *gpio_data = container_of(timer,
    63							      struct gpio_pwm_data,
    64							      timer);
    65		if (!gpio_data->run) {
    66			gpio_pwm_off(gpio_data);
    67			gpio_data->pin_on = false;
    68			return HRTIMER_NORESTART;
    69		}
    70	
    71		if (!gpio_data->pin_on) {
    72			hrtimer_forward_now(&gpio_data->timer,
    73					    ns_to_ktime(gpio_data->on_time));
    74			gpio_pwm_on(gpio_data);
    75			gpio_data->pin_on = true;
    76		} else {
    77			hrtimer_forward_now(&gpio_data->timer,
    78					    ns_to_ktime(gpio_data->off_time));
    79			gpio_pwm_off(gpio_data);
    80			gpio_data->pin_on = false;
    81		}
    82	
    83		return HRTIMER_RESTART;
    84	}
    85	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
