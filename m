Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB32653;
	Tue,  2 May 2023 04:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683003378; x=1714539378;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KzQo6+SAFvWvXPv2s0+6wnYFu/8wrKKay0uH9aFuEbg=;
  b=AwMLvStw9LipMR6EMxzlkmAhQm0rdFgo3mbkJT3fkCgd/mPdJ6oIGeQm
   TfqyJq/psG1oNRirJ2BMDRJ+aSAY73XWtN6by52aYujQtTBwdfns/X+0K
   mxruLTHGu3PdhRkAb0eR4Xr3Y1ne/5Q1H9Tl8Ft1gG4X1nKyURKFbAih1
   ee1IQ740ZDrUuIxuO0sHrX91PNuyjr/4fX0wbkXuuKotISJBQiN0J0kul
   G1GHpXQ/YDzaeys8OvxTe/qqaMFDiPdHiVEDx/DGkiVY8ZQ33xBbqjija
   Mgn/EU2zZwrM7lyw+dulvX1DLzLrJwuT3g8GaC4Eq6ZKpRs/c9WW9urRm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="376366469"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="376366469"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 21:56:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="942304472"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="942304472"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 01 May 2023 21:56:12 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pti3g-0000qO-07;
	Tue, 02 May 2023 04:56:12 +0000
Date: Tue, 2 May 2023 12:56:02 +0800
From: kernel test robot <lkp@intel.com>
To: "larry.lai" <larry.lai@yunjingtech.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC RESEND 1/3] mfd: Add support for UP board CPLD/FPGA
Message-ID: <202305021237.3KjZn3Ga-lkp@intel.com>
References: <20230425152135.30745-2-larry.lai@yunjingtech.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425152135.30745-2-larry.lai@yunjingtech.com>

Hi larry.lai,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 4fe89d07dcc2804c8b562f6c7896a45643d34b2f]

url:    https://github.com/intel-lab-lkp/linux/commits/larry-lai/mfd-Add-support-for-UP-board-CPLD-FPGA/20230425-232744
base:   4fe89d07dcc2804c8b562f6c7896a45643d34b2f
patch link:    https://lore.kernel.org/r/20230425152135.30745-2-larry.lai%40yunjingtech.com
patch subject: [RFC RESEND 1/3] mfd: Add support for UP board CPLD/FPGA
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20230502/202305021237.3KjZn3Ga-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/cb16ef420038f2bede2deb3878b529f0e6ea7729
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review larry-lai/mfd-Add-support-for-UP-board-CPLD-FPGA/20230425-232744
        git checkout cb16ef420038f2bede2deb3878b529f0e6ea7729
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/firmware/ drivers/hwmon/ drivers/mfd/ drivers/pinctrl/ drivers/staging/media/atomisp/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305021237.3KjZn3Ga-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/upboard-fpga.c:448:49: warning: data argument not used by format string [-Wformat-extra-args]
                   dev_err(fpga->dev, "Failed to add GPIO LEDs", ret);
                                      ~~~~~~~~~~~~~~~~~~~~~~~~~  ^
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                  ~~~     ^
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^
   drivers/mfd/upboard-fpga.c:486:20: error: assigning to 'struct regmap_config *' from 'const struct regmap_config *const' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           fpga->cpld_config = fpga_data->cpld_config;
                             ^ ~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +448 drivers/mfd/upboard-fpga.c

   383	
   384	/*
   385	 * MFD upboard-fpga is ACPI driver and can recognize the AANT ID from different
   386	 * kind of upboards. We get the LED GPIO initialized information from this
   387	 * then add led-upboard driver.
   388	 */
   389	int upboard_led_gpio_register(struct upboard_fpga *fpga)
   390	{
   391		struct gpio_led blue_led, yellow_led, green_led, red_led;
   392		struct gpio_desc *desc;
   393		static struct gpio_led upboard_gpio_leds[4];
   394		int leds = 0;
   395		static struct gpio_led_platform_data upboard_gpio_led_platform_data;
   396		static const struct mfd_cell upboard_gpio_led_cells[] = {
   397			MFD_CELL_BASIC("leds-gpio", NULL,
   398				       &upboard_gpio_led_platform_data,
   399				       sizeof(upboard_gpio_led_platform_data), 0)
   400		};
   401		int ret;
   402	
   403		desc = devm_gpiod_get(fpga->dev, "blue", GPIOD_OUT_LOW);
   404		if (!IS_ERR(desc)) {
   405			blue_led.name = "upboard:blue:";
   406			blue_led.gpio = desc_to_gpio(desc);
   407			blue_led.default_state = LEDS_GPIO_DEFSTATE_KEEP;
   408			upboard_gpio_leds[leds++] = blue_led;
   409			devm_gpiod_put(fpga->dev, desc);
   410		}
   411		desc = devm_gpiod_get(fpga->dev, "yellow", GPIOD_OUT_LOW);
   412		if (!IS_ERR(desc)) {
   413			yellow_led.name = "upboard:yellow:";
   414			yellow_led.gpio = desc_to_gpio(desc);
   415			yellow_led.default_state = LEDS_GPIO_DEFSTATE_KEEP;
   416			upboard_gpio_leds[leds++] = yellow_led;
   417			devm_gpiod_put(fpga->dev, desc);
   418		}
   419		desc = devm_gpiod_get(fpga->dev, "green", GPIOD_OUT_LOW);
   420		if (!IS_ERR(desc)) {
   421			green_led.name = "upboard:green:";
   422			green_led.gpio = desc_to_gpio(desc);
   423			green_led.default_state = LEDS_GPIO_DEFSTATE_KEEP;
   424			upboard_gpio_leds[leds++] = green_led;
   425			devm_gpiod_put(fpga->dev, desc);
   426		}
   427		desc = devm_gpiod_get(fpga->dev, "red", GPIOD_OUT_LOW);
   428		if (!IS_ERR(desc)) {
   429			red_led.name = "upboard:red:";
   430			red_led.gpio = desc_to_gpio(desc);
   431			red_led.default_state = LEDS_GPIO_DEFSTATE_KEEP;
   432			upboard_gpio_leds[leds++] = red_led;
   433			devm_gpiod_put(fpga->dev, desc);
   434		}
   435	
   436		/* no LEDs */
   437		if (leds == 0)
   438			return 0;
   439	
   440		upboard_gpio_led_platform_data.num_leds = leds;
   441		upboard_gpio_led_platform_data.leds = upboard_gpio_leds;
   442	
   443		ret = devm_mfd_add_devices(fpga->dev, PLATFORM_DEVID_AUTO,
   444					   upboard_gpio_led_cells,
   445					   ARRAY_SIZE(upboard_gpio_led_cells),
   446					   NULL, 0, NULL);
   447		if (ret) {
 > 448			dev_err(fpga->dev, "Failed to add GPIO LEDs", ret);
   449			return ret;
   450		}
   451	
   452		return 0;
   453	}
   454	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
