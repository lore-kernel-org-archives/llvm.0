Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843E9173
	for <llvm@lists.linux.dev>; Mon, 10 Jan 2022 20:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641847334; x=1673383334;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qq8+xTxkAallxSxzP5vY3sYFE2BFyXg7LAfIs70NdBE=;
  b=bqpd5RAyQmguO6DqyOyQQCL7hFYF2Za2BYN8xbYOof43uHHZY03HV2i0
   POyiirM+kRldDuEGI9ZIuhQCPLv3iSr4EBx97JPt9v6kvHM/yk4UGz72o
   ctCitFBRvGisnFI3RA1hEPLxTKL0hJPn4QF0iKPmYeIxH8/JezKKbACHL
   r1LHMBO1aIhSQW0lqyoiBnaOiuTIwPEkvt21IMphAUudGqb8WLjoo2bP8
   uVETP/cHc6tgUqdXLeMvxUrgB9SkxXSsyoy9NIOiyxJGGkDkoeyR+Sifi
   pJPo9/JAeDRUG72aBcd9aDf+hbfvkwGj4fyE/b1fzUiTXqlLaNcQ8AyRx
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="304055999"
X-IronPort-AV: E=Sophos;i="5.88,278,1635231600"; 
   d="scan'208";a="304055999"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2022 12:42:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,278,1635231600"; 
   d="scan'208";a="622798009"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 10 Jan 2022 12:42:12 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n71UZ-0003wX-Js; Mon, 10 Jan 2022 20:42:11 +0000
Date: Tue, 11 Jan 2022 04:41:37 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v1 4/5] iio: adc: qcom-vadc-common: Re-use generic struct
 u32_fract
Message-ID: <202201110438.mfVkleOt-lkp@intel.com>
References: <20220110181711.65054-4-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220110181711.65054-4-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Andy,

I love your patch! Yet something to improve:

[auto build test ERROR on jic23-iio/togreg]
[also build test ERROR on linux/master linus/master v5.16 next-20220110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Andy-Shevchenko/math-h-Introduce-data-types-for-fractional-numbers/20220111-021818
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
config: arm64-buildonly-randconfig-r002-20220111 (https://download.01.org/0day-ci/archive/20220111/202201110438.mfVkleOt-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5c46c1c23abb4a01f7f40bfcb8851cb893739e14)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/2d0db3a1312ad1511ae417c82b4ba9616b11a6b5
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Andy-Shevchenko/math-h-Introduce-data-types-for-fractional-numbers/20220111-021818
        git checkout 2d0db3a1312ad1511ae417c82b4ba9616b11a6b5
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/iio/adc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/iio/adc/qcom-vadc-common.c:293:4: error: field designator 'num' does not refer to any field in type 'const struct u32_fract'
           {.num =  1, .den =  1},
             ^
>> drivers/iio/adc/qcom-vadc-common.c:293:15: error: field designator 'den' does not refer to any field in type 'const struct u32_fract'
           {.num =  1, .den =  1},
                        ^
   drivers/iio/adc/qcom-vadc-common.c:294:4: error: field designator 'num' does not refer to any field in type 'const struct u32_fract'
           {.num =  1, .den =  3},
             ^
   drivers/iio/adc/qcom-vadc-common.c:294:15: error: field designator 'den' does not refer to any field in type 'const struct u32_fract'
           {.num =  1, .den =  3},
                        ^
   drivers/iio/adc/qcom-vadc-common.c:295:4: error: field designator 'num' does not refer to any field in type 'const struct u32_fract'
           {.num =  1, .den =  4},
             ^
   drivers/iio/adc/qcom-vadc-common.c:295:15: error: field designator 'den' does not refer to any field in type 'const struct u32_fract'
           {.num =  1, .den =  4},
                        ^
   drivers/iio/adc/qcom-vadc-common.c:296:4: error: field designator 'num' does not refer to any field in type 'const struct u32_fract'
           {.num =  1, .den =  6},
             ^
   drivers/iio/adc/qcom-vadc-common.c:296:15: error: field designator 'den' does not refer to any field in type 'const struct u32_fract'
           {.num =  1, .den =  6},
                        ^
   drivers/iio/adc/qcom-vadc-common.c:297:4: error: field designator 'num' does not refer to any field in type 'const struct u32_fract'
           {.num =  1, .den = 20},
             ^
   drivers/iio/adc/qcom-vadc-common.c:297:15: error: field designator 'den' does not refer to any field in type 'const struct u32_fract'
           {.num =  1, .den = 20},
                        ^
   drivers/iio/adc/qcom-vadc-common.c:298:4: error: field designator 'num' does not refer to any field in type 'const struct u32_fract'
           {.num =  1, .den =  8},
             ^
   drivers/iio/adc/qcom-vadc-common.c:298:15: error: field designator 'den' does not refer to any field in type 'const struct u32_fract'
           {.num =  1, .den =  8},
                        ^
   drivers/iio/adc/qcom-vadc-common.c:299:4: error: field designator 'num' does not refer to any field in type 'const struct u32_fract'
           {.num = 10, .den = 81},
             ^
   drivers/iio/adc/qcom-vadc-common.c:299:15: error: field designator 'den' does not refer to any field in type 'const struct u32_fract'
           {.num = 10, .den = 81},
                        ^
   drivers/iio/adc/qcom-vadc-common.c:300:4: error: field designator 'num' does not refer to any field in type 'const struct u32_fract'
           {.num =  1, .den = 10},
             ^
   drivers/iio/adc/qcom-vadc-common.c:300:15: error: field designator 'den' does not refer to any field in type 'const struct u32_fract'
           {.num =  1, .den = 10},
                        ^
   drivers/iio/adc/qcom-vadc-common.c:301:4: error: field designator 'num' does not refer to any field in type 'const struct u32_fract'
           {.num =  1, .den = 16}
             ^
   drivers/iio/adc/qcom-vadc-common.c:301:15: error: field designator 'den' does not refer to any field in type 'const struct u32_fract'
           {.num =  1, .den = 16}
                        ^
>> drivers/iio/adc/qcom-vadc-common.c:417:32: error: no member named 'den' in 'struct u32_fract'
           voltage = voltage * prescale->den;
                               ~~~~~~~~  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
>> drivers/iio/adc/qcom-spmi-vadc.c:126:4: error: field designator 'num' does not refer to any field in type 'const struct u32_fract'
           {.num =  1, .den =  1},
             ^
>> drivers/iio/adc/qcom-spmi-vadc.c:126:15: error: field designator 'den' does not refer to any field in type 'const struct u32_fract'
           {.num =  1, .den =  1},
                        ^
   drivers/iio/adc/qcom-spmi-vadc.c:127:4: error: field designator 'num' does not refer to any field in type 'const struct u32_fract'
           {.num =  1, .den =  3},
             ^
   drivers/iio/adc/qcom-spmi-vadc.c:127:15: error: field designator 'den' does not refer to any field in type 'const struct u32_fract'
           {.num =  1, .den =  3},
                        ^
   drivers/iio/adc/qcom-spmi-vadc.c:128:4: error: field designator 'num' does not refer to any field in type 'const struct u32_fract'
           {.num =  1, .den =  4},
             ^
   drivers/iio/adc/qcom-spmi-vadc.c:128:15: error: field designator 'den' does not refer to any field in type 'const struct u32_fract'
           {.num =  1, .den =  4},
                        ^
   drivers/iio/adc/qcom-spmi-vadc.c:129:4: error: field designator 'num' does not refer to any field in type 'const struct u32_fract'
           {.num =  1, .den =  6},
             ^
   drivers/iio/adc/qcom-spmi-vadc.c:129:15: error: field designator 'den' does not refer to any field in type 'const struct u32_fract'
           {.num =  1, .den =  6},
                        ^
   drivers/iio/adc/qcom-spmi-vadc.c:130:4: error: field designator 'num' does not refer to any field in type 'const struct u32_fract'
           {.num =  1, .den = 20},
             ^
   drivers/iio/adc/qcom-spmi-vadc.c:130:15: error: field designator 'den' does not refer to any field in type 'const struct u32_fract'
           {.num =  1, .den = 20},
                        ^
   drivers/iio/adc/qcom-spmi-vadc.c:131:4: error: field designator 'num' does not refer to any field in type 'const struct u32_fract'
           {.num =  1, .den =  8},
             ^
   drivers/iio/adc/qcom-spmi-vadc.c:131:15: error: field designator 'den' does not refer to any field in type 'const struct u32_fract'
           {.num =  1, .den =  8},
                        ^
   drivers/iio/adc/qcom-spmi-vadc.c:132:4: error: field designator 'num' does not refer to any field in type 'const struct u32_fract'
           {.num = 10, .den = 81},
             ^
   drivers/iio/adc/qcom-spmi-vadc.c:132:15: error: field designator 'den' does not refer to any field in type 'const struct u32_fract'
           {.num = 10, .den = 81},
                        ^
   drivers/iio/adc/qcom-spmi-vadc.c:133:4: error: field designator 'num' does not refer to any field in type 'const struct u32_fract'
           {.num =  1, .den = 10}
             ^
   drivers/iio/adc/qcom-spmi-vadc.c:133:15: error: field designator 'den' does not refer to any field in type 'const struct u32_fract'
           {.num =  1, .den = 10}
                        ^
>> drivers/iio/adc/qcom-spmi-vadc.c:411:22: error: invalid application of 'sizeof' to an incomplete type 'const struct u32_fract[]'
           for (pre = 0; pre < ARRAY_SIZE(vadc_prescale_ratios); pre++)
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:46:32: note: expanded from macro 'ARRAY_SIZE'
   #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                  ^~~~~
>> drivers/iio/adc/qcom-spmi-vadc.c:412:33: error: no member named 'num' in 'struct u32_fract'
                   if (vadc_prescale_ratios[pre].num == num &&
                       ~~~~~~~~~~~~~~~~~~~~~~~~~ ^
>> drivers/iio/adc/qcom-spmi-vadc.c:413:33: error: no member named 'den' in 'struct u32_fract'
                       vadc_prescale_ratios[pre].den == den)
                       ~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +293 drivers/iio/adc/qcom-vadc-common.c

082111e559055d Jishnu Prakash       2020-05-28  291  
2d0db3a1312ad1 Andy Shevchenko      2022-01-10  292  static const struct u32_fract adc5_prescale_ratios[] = {
c7ba98fc404305 Dmitry Baryshkov     2020-12-04 @293  	{.num =  1, .den =  1},
c7ba98fc404305 Dmitry Baryshkov     2020-12-04  294  	{.num =  1, .den =  3},
c7ba98fc404305 Dmitry Baryshkov     2020-12-04  295  	{.num =  1, .den =  4},
c7ba98fc404305 Dmitry Baryshkov     2020-12-04  296  	{.num =  1, .den =  6},
c7ba98fc404305 Dmitry Baryshkov     2020-12-04  297  	{.num =  1, .den = 20},
c7ba98fc404305 Dmitry Baryshkov     2020-12-04  298  	{.num =  1, .den =  8},
c7ba98fc404305 Dmitry Baryshkov     2020-12-04  299  	{.num = 10, .den = 81},
c7ba98fc404305 Dmitry Baryshkov     2020-12-04  300  	{.num =  1, .den = 10},
c7ba98fc404305 Dmitry Baryshkov     2020-12-04  301  	{.num =  1, .den = 16}
c7ba98fc404305 Dmitry Baryshkov     2020-12-04  302  };
c7ba98fc404305 Dmitry Baryshkov     2020-12-04  303  
e13d757279bbc5 Siddartha Mohanadoss 2018-08-02  304  static int qcom_vadc_scale_hw_calib_volt(
2d0db3a1312ad1 Andy Shevchenko      2022-01-10  305  				const struct u32_fract *prescale,
e13d757279bbc5 Siddartha Mohanadoss 2018-08-02  306  				const struct adc5_data *data,
e13d757279bbc5 Siddartha Mohanadoss 2018-08-02  307  				u16 adc_code, int *result_uv);
e13d757279bbc5 Siddartha Mohanadoss 2018-08-02  308  static int qcom_vadc_scale_hw_calib_therm(
2d0db3a1312ad1 Andy Shevchenko      2022-01-10  309  				const struct u32_fract *prescale,
e13d757279bbc5 Siddartha Mohanadoss 2018-08-02  310  				const struct adc5_data *data,
e13d757279bbc5 Siddartha Mohanadoss 2018-08-02  311  				u16 adc_code, int *result_mdec);
082111e559055d Jishnu Prakash       2020-05-28  312  static int qcom_vadc7_scale_hw_calib_therm(
2d0db3a1312ad1 Andy Shevchenko      2022-01-10  313  				const struct u32_fract *prescale,
082111e559055d Jishnu Prakash       2020-05-28  314  				const struct adc5_data *data,
082111e559055d Jishnu Prakash       2020-05-28  315  				u16 adc_code, int *result_mdec);
e13d757279bbc5 Siddartha Mohanadoss 2018-08-02  316  static int qcom_vadc_scale_hw_smb_temp(
2d0db3a1312ad1 Andy Shevchenko      2022-01-10  317  				const struct u32_fract *prescale,
e13d757279bbc5 Siddartha Mohanadoss 2018-08-02  318  				const struct adc5_data *data,
e13d757279bbc5 Siddartha Mohanadoss 2018-08-02  319  				u16 adc_code, int *result_mdec);
e13d757279bbc5 Siddartha Mohanadoss 2018-08-02  320  static int qcom_vadc_scale_hw_chg5_temp(
2d0db3a1312ad1 Andy Shevchenko      2022-01-10  321  				const struct u32_fract *prescale,
e13d757279bbc5 Siddartha Mohanadoss 2018-08-02  322  				const struct adc5_data *data,
e13d757279bbc5 Siddartha Mohanadoss 2018-08-02  323  				u16 adc_code, int *result_mdec);
e13d757279bbc5 Siddartha Mohanadoss 2018-08-02  324  static int qcom_vadc_scale_hw_calib_die_temp(
2d0db3a1312ad1 Andy Shevchenko      2022-01-10  325  				const struct u32_fract *prescale,
e13d757279bbc5 Siddartha Mohanadoss 2018-08-02  326  				const struct adc5_data *data,
e13d757279bbc5 Siddartha Mohanadoss 2018-08-02  327  				u16 adc_code, int *result_mdec);
082111e559055d Jishnu Prakash       2020-05-28  328  static int qcom_vadc7_scale_hw_calib_die_temp(
2d0db3a1312ad1 Andy Shevchenko      2022-01-10  329  				const struct u32_fract *prescale,
082111e559055d Jishnu Prakash       2020-05-28  330  				const struct adc5_data *data,
082111e559055d Jishnu Prakash       2020-05-28  331  				u16 adc_code, int *result_mdec);
e13d757279bbc5 Siddartha Mohanadoss 2018-08-02  332  
e13d757279bbc5 Siddartha Mohanadoss 2018-08-02  333  static struct qcom_adc5_scale_type scale_adc5_fn[] = {
e13d757279bbc5 Siddartha Mohanadoss 2018-08-02  334  	[SCALE_HW_CALIB_DEFAULT] = {qcom_vadc_scale_hw_calib_volt},
e13d757279bbc5 Siddartha Mohanadoss 2018-08-02  335  	[SCALE_HW_CALIB_THERM_100K_PULLUP] = {qcom_vadc_scale_hw_calib_therm},
e13d757279bbc5 Siddartha Mohanadoss 2018-08-02  336  	[SCALE_HW_CALIB_XOTHERM] = {qcom_vadc_scale_hw_calib_therm},
082111e559055d Jishnu Prakash       2020-05-28  337  	[SCALE_HW_CALIB_THERM_100K_PU_PM7] = {
082111e559055d Jishnu Prakash       2020-05-28  338  					qcom_vadc7_scale_hw_calib_therm},
e13d757279bbc5 Siddartha Mohanadoss 2018-08-02  339  	[SCALE_HW_CALIB_PMIC_THERM] = {qcom_vadc_scale_hw_calib_die_temp},
082111e559055d Jishnu Prakash       2020-05-28  340  	[SCALE_HW_CALIB_PMIC_THERM_PM7] = {
082111e559055d Jishnu Prakash       2020-05-28  341  					qcom_vadc7_scale_hw_calib_die_temp},
e13d757279bbc5 Siddartha Mohanadoss 2018-08-02  342  	[SCALE_HW_CALIB_PM5_CHG_TEMP] = {qcom_vadc_scale_hw_chg5_temp},
e13d757279bbc5 Siddartha Mohanadoss 2018-08-02  343  	[SCALE_HW_CALIB_PM5_SMB_TEMP] = {qcom_vadc_scale_hw_smb_temp},
e13d757279bbc5 Siddartha Mohanadoss 2018-08-02  344  };
e13d757279bbc5 Siddartha Mohanadoss 2018-08-02  345  
e932d4f041a487 Linus Walleij        2017-04-04  346  static int qcom_vadc_map_voltage_temp(const struct vadc_map_pt *pts,
e13d757279bbc5 Siddartha Mohanadoss 2018-08-02  347  				      u32 tablesize, s32 input, int *output)
e932d4f041a487 Linus Walleij        2017-04-04  348  {
e932d4f041a487 Linus Walleij        2017-04-04  349  	u32 i = 0;
e932d4f041a487 Linus Walleij        2017-04-04  350  
e932d4f041a487 Linus Walleij        2017-04-04  351  	if (!pts)
e932d4f041a487 Linus Walleij        2017-04-04  352  		return -EINVAL;
e932d4f041a487 Linus Walleij        2017-04-04  353  
48d2e2ff85ddf7 Dmitry Baryshkov     2020-12-04  354  	while (i < tablesize && pts[i].x > input)
e932d4f041a487 Linus Walleij        2017-04-04  355  		i++;
e932d4f041a487 Linus Walleij        2017-04-04  356  
e932d4f041a487 Linus Walleij        2017-04-04  357  	if (i == 0) {
e932d4f041a487 Linus Walleij        2017-04-04  358  		*output = pts[0].y;
e932d4f041a487 Linus Walleij        2017-04-04  359  	} else if (i == tablesize) {
e932d4f041a487 Linus Walleij        2017-04-04  360  		*output = pts[tablesize - 1].y;
e932d4f041a487 Linus Walleij        2017-04-04  361  	} else {
e932d4f041a487 Linus Walleij        2017-04-04  362  		/* interpolate linearly */
e2621acd6d9af5 Dmitry Baryshkov     2020-12-04  363  		*output = fixp_linear_interpolate(pts[i - 1].x, pts[i - 1].y,
e2621acd6d9af5 Dmitry Baryshkov     2020-12-04  364  						  pts[i].x, pts[i].y,
e2621acd6d9af5 Dmitry Baryshkov     2020-12-04  365  						  input);
e932d4f041a487 Linus Walleij        2017-04-04  366  	}
e932d4f041a487 Linus Walleij        2017-04-04  367  
e932d4f041a487 Linus Walleij        2017-04-04  368  	return 0;
e932d4f041a487 Linus Walleij        2017-04-04  369  }
e932d4f041a487 Linus Walleij        2017-04-04  370  
ca66dca5eda6bd Dmitry Baryshkov     2021-02-05  371  static s32 qcom_vadc_map_temp_voltage(const struct vadc_map_pt *pts,
ca66dca5eda6bd Dmitry Baryshkov     2021-02-05  372  				      u32 tablesize, int input)
ca66dca5eda6bd Dmitry Baryshkov     2021-02-05  373  {
ca66dca5eda6bd Dmitry Baryshkov     2021-02-05  374  	u32 i = 0;
ca66dca5eda6bd Dmitry Baryshkov     2021-02-05  375  
ca66dca5eda6bd Dmitry Baryshkov     2021-02-05  376  	/*
ca66dca5eda6bd Dmitry Baryshkov     2021-02-05  377  	 * Table must be sorted, find the interval of 'y' which contains value
ca66dca5eda6bd Dmitry Baryshkov     2021-02-05  378  	 * 'input' and map it to proper 'x' value
ca66dca5eda6bd Dmitry Baryshkov     2021-02-05  379  	 */
ca66dca5eda6bd Dmitry Baryshkov     2021-02-05  380  	while (i < tablesize && pts[i].y < input)
ca66dca5eda6bd Dmitry Baryshkov     2021-02-05  381  		i++;
ca66dca5eda6bd Dmitry Baryshkov     2021-02-05  382  
ca66dca5eda6bd Dmitry Baryshkov     2021-02-05  383  	if (i == 0)
ca66dca5eda6bd Dmitry Baryshkov     2021-02-05  384  		return pts[0].x;
ca66dca5eda6bd Dmitry Baryshkov     2021-02-05  385  	if (i == tablesize)
ca66dca5eda6bd Dmitry Baryshkov     2021-02-05  386  		return pts[tablesize - 1].x;
ca66dca5eda6bd Dmitry Baryshkov     2021-02-05  387  
ca66dca5eda6bd Dmitry Baryshkov     2021-02-05  388  	/* interpolate linearly */
ca66dca5eda6bd Dmitry Baryshkov     2021-02-05  389  	return fixp_linear_interpolate(pts[i - 1].y, pts[i - 1].x,
ca66dca5eda6bd Dmitry Baryshkov     2021-02-05  390  			pts[i].y, pts[i].x, input);
ca66dca5eda6bd Dmitry Baryshkov     2021-02-05  391  }
ca66dca5eda6bd Dmitry Baryshkov     2021-02-05  392  
e932d4f041a487 Linus Walleij        2017-04-04  393  static void qcom_vadc_scale_calib(const struct vadc_linear_graph *calib_graph,
e932d4f041a487 Linus Walleij        2017-04-04  394  				  u16 adc_code,
e932d4f041a487 Linus Walleij        2017-04-04  395  				  bool absolute,
e932d4f041a487 Linus Walleij        2017-04-04  396  				  s64 *scale_voltage)
e932d4f041a487 Linus Walleij        2017-04-04  397  {
e932d4f041a487 Linus Walleij        2017-04-04  398  	*scale_voltage = (adc_code - calib_graph->gnd);
e932d4f041a487 Linus Walleij        2017-04-04  399  	*scale_voltage *= calib_graph->dx;
e932d4f041a487 Linus Walleij        2017-04-04  400  	*scale_voltage = div64_s64(*scale_voltage, calib_graph->dy);
e932d4f041a487 Linus Walleij        2017-04-04  401  	if (absolute)
e932d4f041a487 Linus Walleij        2017-04-04  402  		*scale_voltage += calib_graph->dx;
e932d4f041a487 Linus Walleij        2017-04-04  403  
e932d4f041a487 Linus Walleij        2017-04-04  404  	if (*scale_voltage < 0)
e932d4f041a487 Linus Walleij        2017-04-04  405  		*scale_voltage = 0;
e932d4f041a487 Linus Walleij        2017-04-04  406  }
e932d4f041a487 Linus Walleij        2017-04-04  407  
e932d4f041a487 Linus Walleij        2017-04-04  408  static int qcom_vadc_scale_volt(const struct vadc_linear_graph *calib_graph,
2d0db3a1312ad1 Andy Shevchenko      2022-01-10  409  				const struct u32_fract *prescale,
e932d4f041a487 Linus Walleij        2017-04-04  410  				bool absolute, u16 adc_code,
e932d4f041a487 Linus Walleij        2017-04-04  411  				int *result_uv)
e932d4f041a487 Linus Walleij        2017-04-04  412  {
e932d4f041a487 Linus Walleij        2017-04-04  413  	s64 voltage = 0, result = 0;
e932d4f041a487 Linus Walleij        2017-04-04  414  
e932d4f041a487 Linus Walleij        2017-04-04  415  	qcom_vadc_scale_calib(calib_graph, adc_code, absolute, &voltage);
e932d4f041a487 Linus Walleij        2017-04-04  416  
e932d4f041a487 Linus Walleij        2017-04-04 @417  	voltage = voltage * prescale->den;
e932d4f041a487 Linus Walleij        2017-04-04  418  	result = div64_s64(voltage, prescale->num);
e932d4f041a487 Linus Walleij        2017-04-04  419  	*result_uv = result;
e932d4f041a487 Linus Walleij        2017-04-04  420  
e932d4f041a487 Linus Walleij        2017-04-04  421  	return 0;
e932d4f041a487 Linus Walleij        2017-04-04  422  }
e932d4f041a487 Linus Walleij        2017-04-04  423  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
