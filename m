Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E27B2E820;
	Fri, 22 Dec 2023 19:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gQLr+kZW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703274072; x=1734810072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I8g1yXF40h8tKyhq4V3lfGGp+EsazSiuLYaJqMSpKX4=;
  b=gQLr+kZW53myUaIES8j8q103iLLBMBGjzJXP3RoUxhwK8zGKlS4OtfrB
   AFJA9Xl/uVZOciakOfjwTpjAo4R+MhnIKAWJyJPnbC/8mK1t+0vRxb+1t
   1bDBYlU+20ooMzPMNmtZzUoELUmuA60sUwfgD+54rY1xJpxlhlILFR+8O
   nfQD6+fmdJMtfTlcJux6T7bAO0PZU3TxskAHvNlfSmZ9hqvOmVSRLA0j4
   T9HxTognTaYcUQARdYpwdYIw1zZb9BR4TK/uAigRa6pUztwmmXjZjUzAn
   mwZ4aV/9Vc1BpPyvRzBuGaSNr8g9rAO80Pj8QpAvUbHl0mvqYtOw779j6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="395891731"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; 
   d="scan'208";a="395891731"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 11:41:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; 
   d="scan'208";a="19117416"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 Dec 2023 11:41:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGlNv-0009p5-0L;
	Fri, 22 Dec 2023 19:40:47 +0000
Date: Sat, 23 Dec 2023 03:37:57 +0800
From: kernel test robot <lkp@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Lee Jones <lee@kernel.org>
Subject: [lee-backlight:for-backlight-next 8/8]
 drivers/video/backlight/mp3309c.c:134:9: error: call to undeclared function
 'pwm_apply_might_sleep'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202312230335.JEXfYvyo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git for-backlight-next
head:   f7baa9ccef93ba1c36a8ecf58c2f4e86fb3181b9
commit: f7baa9ccef93ba1c36a8ecf58c2f4e86fb3181b9 [8/8] backlight: mp3309c: Rename  pwm_apply_state() to pwm_apply_might_sleep()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231223/202312230335.JEXfYvyo-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231223/202312230335.JEXfYvyo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312230335.JEXfYvyo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/backlight/mp3309c.c:134:9: error: call to undeclared function 'pwm_apply_might_sleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   ret = pwm_apply_might_sleep(chip->pwmd, &pwmstate);
                         ^
   drivers/video/backlight/mp3309c.c:134:9: note: did you mean 'regmap_might_sleep'?
   include/linux/regmap.h:1276:6: note: 'regmap_might_sleep' declared here
   bool regmap_might_sleep(struct regmap *map);
        ^
   drivers/video/backlight/mp3309c.c:396:9: error: call to undeclared function 'pwm_apply_might_sleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   ret = pwm_apply_might_sleep(chip->pwmd, &pwmstate);
                         ^
   2 errors generated.


vim +/pwm_apply_might_sleep +134 drivers/video/backlight/mp3309c.c

   116	
   117	static int mp3309c_bl_update_status(struct backlight_device *bl)
   118	{
   119		struct mp3309c_chip *chip = bl_get_data(bl);
   120		int brightness = backlight_get_brightness(bl);
   121		struct pwm_state pwmstate;
   122		unsigned int analog_val, bits_val;
   123		int i, ret;
   124	
   125		if (chip->pdata->dimming_mode == DIMMING_PWM) {
   126			/*
   127			 * PWM control mode
   128			 */
   129			pwm_get_state(chip->pwmd, &pwmstate);
   130			pwm_set_relative_duty_cycle(&pwmstate,
   131						    chip->pdata->levels[brightness],
   132						    chip->pdata->levels[chip->pdata->max_brightness]);
   133			pwmstate.enabled = true;
 > 134			ret = pwm_apply_might_sleep(chip->pwmd, &pwmstate);
   135			if (ret)
   136				return ret;
   137	
   138			switch (chip->pdata->status) {
   139			case FIRST_POWER_ON:
   140			case BACKLIGHT_OFF:
   141				/*
   142				 * After 20ms of low pwm signal level, the chip turns
   143				 * off automatically. In this case, before enabling the
   144				 * chip again, we must wait about 10ms for pwm signal to
   145				 * stabilize.
   146				 */
   147				if (brightness > 0) {
   148					msleep(10);
   149					mp3309c_enable_device(chip);
   150					chip->pdata->status = BACKLIGHT_ON;
   151				} else {
   152					chip->pdata->status = BACKLIGHT_OFF;
   153				}
   154				break;
   155			case BACKLIGHT_ON:
   156				if (brightness == 0)
   157					chip->pdata->status = BACKLIGHT_OFF;
   158				break;
   159			}
   160		} else {
   161			/*
   162			 * Analog (by I2C command) control mode
   163			 *
   164			 * The first time, before setting brightness, we must enable the
   165			 * device
   166			 */
   167			if (chip->pdata->status == FIRST_POWER_ON)
   168				mp3309c_enable_device(chip);
   169	
   170			/*
   171			 * Dimming mode I2C command (fixed dimming range 0..31)
   172			 *
   173			 * The 5 bits of the dimming analog value D4..D0 is allocated
   174			 * in the I2C register #0, in the following way:
   175			 *
   176			 *     +--+--+--+--+--+--+--+--+
   177			 *     |EN|D0|D1|D2|D3|D4|XX|XX|
   178			 *     +--+--+--+--+--+--+--+--+
   179			 */
   180			analog_val = brightness;
   181			bits_val = 0;
   182			for (i = 0; i <= 5; i++)
   183				bits_val += ((analog_val >> i) & 0x01) << (6 - i);
   184			ret = regmap_update_bits(chip->regmap, REG_I2C_0,
   185						 ANALOG_I2C_REG_MASK, bits_val);
   186			if (ret)
   187				return ret;
   188	
   189			if (brightness > 0)
   190				chip->pdata->status = BACKLIGHT_ON;
   191			else
   192				chip->pdata->status = BACKLIGHT_OFF;
   193		}
   194	
   195		return 0;
   196	}
   197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
