Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0469B2F21
	for <llvm@lists.linux.dev>; Thu,  3 Feb 2022 06:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643871356; x=1675407356;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u+SH/XnbdsUBdSooNGnpCMCUgeYkFq3TVMuP/6v6s78=;
  b=ibHyM1u+VIfttmM0RUKRmDlZRDxuE8NDyL+0fgLMtbDrXBQU89t8MR2Q
   L2CWrHpnSHIukk+pnRJfrQlXvIqKuuPY9fZeCuxPDfRyfQE0/a6Urd4O0
   nJgyV3d+GIBBS9O5RhU3KGTgBIeDPpMWSEc89L0QXWbRD9nuXc7LhUrAR
   Os6Z++kpZ/6Eu+2EsK+TJJs89NPJ1/lB9JheyDgHHDoe4rnadl0Ff/hsF
   Yfx4mJ7v2vxBFxNMGqoT03rn5O/1ahZF9xu8dfI3c1wEHbFQ78+N652KU
   oI+lrGxrf7LEBRH+e3kT8szBubC7rhOoD6jBZhoz+RGWhtjx4l+ZOebiG
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="248039986"
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; 
   d="scan'208";a="248039986"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2022 22:55:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; 
   d="scan'208";a="538627460"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 02 Feb 2022 22:55:54 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nFW25-000Vm7-P4; Thu, 03 Feb 2022 06:55:53 +0000
Date: Thu, 3 Feb 2022 14:55:24 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v1 1/1] iio: frequency: adf4350: Make use of device
 properties
Message-ID: <202202031457.yUDGy1we-lkp@intel.com>
References: <20220202202936.56475-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220202202936.56475-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Andy,

I love your patch! Yet something to improve:

[auto build test ERROR on jic23-iio/togreg]
[also build test ERROR on v5.17-rc2 next-20220203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Andy-Shevchenko/iio-frequency-adf4350-Make-use-of-device-properties/20220203-042942
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
config: arm64-randconfig-r031-20220130 (https://download.01.org/0day-ci/archive/20220203/202202031457.yUDGy1we-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a73e4ce6a59b01f0e37037761c1e6889d539d233)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/45963437d849912f2763fe06c25f9e30c383b0f5
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Andy-Shevchenko/iio-frequency-adf4350-Make-use-of-device-properties/20220203-042942
        git checkout 45963437d849912f2763fe06c25f9e30c383b0f5
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/iio/frequency/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/iio/frequency/adf4350.c:413:6: error: implicit declaration of function 'deivice_property_read_bool' [-Werror,-Wimplicit-function-declaration]
           if (deivice_property_read_bool(dev, "adi,phase-detector-polarity-positive-enable"))
               ^
   drivers/iio/frequency/adf4350.c:413:6: note: did you mean 'device_property_read_bool'?
   include/linux/property.h:129:20: note: 'device_property_read_bool' declared here
   static inline bool device_property_read_bool(struct device *dev,
                      ^
   1 error generated.


vim +/deivice_property_read_bool +413 drivers/iio/frequency/adf4350.c

   384	
   385	static struct adf4350_platform_data *adf4350_parse_dt(struct device *dev)
   386	{
   387		struct adf4350_platform_data *pdata;
   388		unsigned int tmp;
   389	
   390		pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
   391		if (!pdata)
   392			return NULL;
   393	
   394		snprintf(pdata->name, sizeof(pdata->name), "%pfw", dev_fwnode(dev));
   395	
   396		tmp = 10000;
   397		device_property_read_u32(dev, "adi,channel-spacing", &tmp);
   398		pdata->channel_spacing = tmp;
   399	
   400		tmp = 0;
   401		device_property_read_u32(dev, "adi,power-up-frequency", &tmp);
   402		pdata->power_up_frequency = tmp;
   403	
   404		tmp = 0;
   405		device_property_read_u32(dev, "adi,reference-div-factor", &tmp);
   406		pdata->ref_div_factor = tmp;
   407	
   408		pdata->ref_doubler_en = device_property_read_bool(dev, "adi,reference-doubler-enable");
   409		pdata->ref_div2_en = device_property_read_bool(dev, "adi,reference-div2-enable");
   410	
   411		/* r2_user_settings */
   412		pdata->r2_user_settings = 0;
 > 413		if (deivice_property_read_bool(dev, "adi,phase-detector-polarity-positive-enable"))
   414			pdata->r2_user_settings |= ADF4350_REG2_PD_POLARITY_POS;
   415		if (device_property_read_bool(dev, "adi,lock-detect-precision-6ns-enable"))
   416			pdata->r2_user_settings |= ADF4350_REG2_LDP_6ns;
   417		if (device_property_read_bool(dev, "adi,lock-detect-function-integer-n-enable"))
   418			pdata->r2_user_settings |= ADF4350_REG2_LDF_INT_N;
   419	
   420		tmp = 2500;
   421		device_property_read_u32(dev, "adi,charge-pump-current", &tmp);
   422		pdata->r2_user_settings |= ADF4350_REG2_CHARGE_PUMP_CURR_uA(tmp);
   423	
   424		tmp = 0;
   425		device_property_read_u32(dev, "adi,muxout-select", &tmp);
   426		pdata->r2_user_settings |= ADF4350_REG2_MUXOUT(tmp);
   427	
   428		if (device_property_read_bool(dev, "adi,low-spur-mode-enable"))
   429			pdata->r2_user_settings |= ADF4350_REG2_NOISE_MODE(0x3);
   430	
   431		/* r3_user_settings */
   432	
   433		pdata->r3_user_settings = 0;
   434		if (device_property_read_bool(dev, "adi,cycle-slip-reduction-enable"))
   435			pdata->r3_user_settings |= ADF4350_REG3_12BIT_CSR_EN;
   436		if (device_property_read_bool(dev, "adi,charge-cancellation-enable"))
   437			pdata->r3_user_settings |= ADF4351_REG3_CHARGE_CANCELLATION_EN;
   438		if (device_property_read_bool(dev, "adi,anti-backlash-3ns-enable"))
   439			pdata->r3_user_settings |= ADF4351_REG3_ANTI_BACKLASH_3ns_EN;
   440		if (device_property_read_bool(dev, "adi,band-select-clock-mode-high-enable"))
   441			pdata->r3_user_settings |= ADF4351_REG3_BAND_SEL_CLOCK_MODE_HIGH;
   442	
   443		tmp = 0;
   444		device_property_read_u32(dev, "adi,12bit-clk-divider", &tmp);
   445		pdata->r3_user_settings |= ADF4350_REG3_12BIT_CLKDIV(tmp);
   446	
   447		tmp = 0;
   448		device_property_read_u32(dev, "adi,clk-divider-mode", &tmp);
   449		pdata->r3_user_settings |= ADF4350_REG3_12BIT_CLKDIV_MODE(tmp);
   450	
   451		/* r4_user_settings */
   452	
   453		pdata->r4_user_settings = 0;
   454		if (device_property_read_bool(dev, "adi,aux-output-enable"))
   455			pdata->r4_user_settings |= ADF4350_REG4_AUX_OUTPUT_EN;
   456		if (device_property_read_bool(dev, "adi,aux-output-fundamental-enable"))
   457			pdata->r4_user_settings |= ADF4350_REG4_AUX_OUTPUT_FUND;
   458		if (device_property_read_bool(dev, "adi,mute-till-lock-enable"))
   459			pdata->r4_user_settings |= ADF4350_REG4_MUTE_TILL_LOCK_EN;
   460	
   461		tmp = 0;
   462		device_property_read_u32(dev, "adi,output-power", &tmp);
   463		pdata->r4_user_settings |= ADF4350_REG4_OUTPUT_PWR(tmp);
   464	
   465		tmp = 0;
   466		device_property_read_u32(dev, "adi,aux-output-power", &tmp);
   467		pdata->r4_user_settings |= ADF4350_REG4_AUX_OUTPUT_PWR(tmp);
   468	
   469		return pdata;
   470	}
   471	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
