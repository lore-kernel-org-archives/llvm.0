Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1B11844
	for <llvm@lists.linux.dev>; Sat, 16 Jul 2022 21:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658006260; x=1689542260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+TPKux9zaHoXV/wnrZNMzynkeESDiCI1rObRAM8KqBU=;
  b=SS+yspnsb8hZ8+h7O08HjcWZ15Gw29kXxzNj4DNZYLEWyZ/2bdb0p29T
   UY6rtS/hdFVoJm6SPAYRu+rZwAMugQhWKfgJLzVUaZS4HhIyqB13RVneL
   T9tYgZs7UElMJ7f/kGZdU2ps3WPc6Ln3afB15CA+n9e+xT1Y3tLuSvOla
   4FLp565UmMKQaDlwvfuejTBJyA7WOt+4yVyqR60pmegjEED/fv8eKtoWv
   jHLOjgg8lFJqUyX9fiKdpS/jpJLQEIUxkFh5qwmqUqRbO6ZhnxiWd83Sq
   t4uEEUWaP8N1e1YNmI0aOpZVxRrDSIkkRKluLsYtWIm3r7YyQml6USI06
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10410"; a="349970439"
X-IronPort-AV: E=Sophos;i="5.92,277,1650956400"; 
   d="scan'208";a="349970439"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2022 14:17:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,277,1650956400"; 
   d="scan'208";a="547045314"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 16 Jul 2022 14:17:37 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oCpAP-00029s-1d;
	Sat, 16 Jul 2022 21:17:37 +0000
Date: Sun, 17 Jul 2022 05:17:23 +0800
From: kernel test robot <lkp@intel.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Matthias Kaehlcke <mka@chromium.org>
Subject: [linux-next:master 1595/10906]
 drivers/platform/chrome/cros_kbd_led_backlight.c:183:42: warning: unused
 variable 'keyboard_led_drvdata_ec_pwm'
Message-ID: <202207170538.MR39dw8m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tzung-Bi,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6014cfa5bf32cf8c5c58b3cfd5ee0e1542c8a825
commit: 40f58143745eaabc68ef44b068642ca3b38d23a6 [1595/10906] platform/chrome: cros_kbd_led_backlight: support EC PWM backend
config: s390-randconfig-r023-20220717 (https://download.01.org/0day-ci/archive/20220717/202207170538.MR39dw8m-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 07022e6cf9b5b3baa642be53d0b3c3f1c403dbfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=40f58143745eaabc68ef44b068642ca3b38d23a6
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 40f58143745eaabc68ef44b068642ca3b38d23a6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/iio/light/ drivers/platform/chrome/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/platform/chrome/cros_kbd_led_backlight.c:183:42: warning: unused variable 'keyboard_led_drvdata_ec_pwm' [-Wunused-const-variable]
   static const struct keyboard_led_drvdata keyboard_led_drvdata_ec_pwm = {
                                            ^
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_DP_AUX_BUS
   Depends on HAS_IOMEM && DRM && OF
   Selected by
   - DRM_MSM && HAS_IOMEM && DRM && (ARCH_QCOM || SOC_IMX5 || COMPILE_TEST && COMMON_CLK && IOMMU_SUPPORT && (QCOM_OCMEM || QCOM_OCMEM && (QCOM_LLCC || QCOM_LLCC && (QCOM_COMMAND_DB || QCOM_COMMAND_DB


vim +/keyboard_led_drvdata_ec_pwm +183 drivers/platform/chrome/cros_kbd_led_backlight.c

   182	
 > 183	static const struct keyboard_led_drvdata keyboard_led_drvdata_ec_pwm = {
   184		.init = keyboard_led_init_ec_pwm,
   185		.brightness_set_blocking = keyboard_led_set_brightness_ec_pwm,
   186		.brightness_get = keyboard_led_get_brightness_ec_pwm,
   187		.max_brightness = KEYBOARD_BACKLIGHT_MAX,
   188	};
   189	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
