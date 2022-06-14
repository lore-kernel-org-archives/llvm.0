Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A8C7C
	for <llvm@lists.linux.dev>; Tue, 14 Jun 2022 04:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655180715; x=1686716715;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z8W1cl+aFZxPztNwC8yt6Ovj2MbTR4bKrYvg2FMbTK8=;
  b=ApvDToScloHoEZvzujZBe5uOn2ocPCqKfDrmgk+XpEX2FD3zcmiL7Gar
   AwVKOwzCQp1Pwj0HL/5/NaLJYTItynmttTq27e4Wm/KaQap0/bkK5nmkH
   YlxWthlhSdhXvPu45w7omknbBZoZLNPHWjC2QYMsil9crE+avib7IwyZq
   EUauEmdMncsmJD2gaSAY1f9EWN2i4c9Xr3zoP+oN3zydg5Sf6cHDw6Pn2
   KUd76Q/F5M1/ThkMqP4nh/0nRfDNGaVzMeoeR81hkckZbHs9TJr/Ia9bq
   JHu7AC3WQztAzpSNKNFxW2055NjzFdppBsQdff2tUQrz55vsfKn7YE2YV
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="258329509"
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="258329509"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2022 21:25:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="588199102"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 13 Jun 2022 21:25:13 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o0y77-000LTF-23;
	Tue, 14 Jun 2022 04:25:13 +0000
Date: Tue, 14 Jun 2022 12:24:53 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH V8 3/3] rtc: zynqmp: Add calibration set and get support
Message-ID: <202206141232.8nBAsby4-lkp@intel.com>
References: <20220613125836.523449-3-srinivas.neeli@xilinx.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220613125836.523449-3-srinivas.neeli@xilinx.com>

Hi Srinivas,

I love your patch! Perhaps something to improve:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on v5.19-rc2 next-20220610]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Neeli/dt-bindings-rtc-zynqmp-Add-clock-information/20220614-013701
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
config: arm-randconfig-r035-20220612 (https://download.01.org/0day-ci/archive/20220614/202206141232.8nBAsby4-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c97436f8b6e2718286e8496faf53a2c800e281cf)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/2781fd75583878d86f256113b19bb005dc83fb70
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Srinivas-Neeli/dt-bindings-rtc-zynqmp-Add-clock-information/20220614-013701
        git checkout 2781fd75583878d86f256113b19bb005dc83fb70
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/rtc/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-zynqmp.c:223:7: warning: variable 'fract_tick' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
                   if (fract_offset > (tick_mult / RTC_FR_MAX_TICKS)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-zynqmp.c:238:6: note: uninitialized use occurs here
           if (fract_tick)
               ^~~~~~~~~~
   drivers/rtc/rtc-zynqmp.c:223:3: note: remove the 'if' if its condition is always true
                   if (fract_offset > (tick_mult / RTC_FR_MAX_TICKS)) {
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-zynqmp.c:218:6: warning: variable 'fract_tick' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (fract_offset) {
               ^~~~~~~~~~~~
   drivers/rtc/rtc-zynqmp.c:238:6: note: uninitialized use occurs here
           if (fract_tick)
               ^~~~~~~~~~
   drivers/rtc/rtc-zynqmp.c:218:2: note: remove the 'if' if its condition is always true
           if (fract_offset) {
           ^~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-zynqmp.c:206:26: note: initialize the variable 'fract_tick' to silence this warning
           unsigned char fract_tick;
                                   ^
                                    = '\0'
   2 warnings generated.


vim +223 drivers/rtc/rtc-zynqmp.c

   200	
   201	static int xlnx_rtc_set_offset(struct device *dev, long offset)
   202	{
   203		struct xlnx_rtc_dev *xrtcdev = dev_get_drvdata(dev);
   204		unsigned long long rtc_ppb = RTC_PPB;
   205		unsigned int tick_mult = do_div(rtc_ppb, xrtcdev->freq);
   206		unsigned char fract_tick;
   207		unsigned int calibval;
   208		short int  max_tick;
   209		int fract_offset;
   210	
   211		if (offset < RTC_MIN_OFFSET || offset > RTC_MAX_OFFSET)
   212			return -ERANGE;
   213	
   214		/* Number ticks for given offset */
   215		max_tick = div_s64_rem(offset, tick_mult, &fract_offset);
   216	
   217		/* Number fractional ticks for given offset */
   218		if (fract_offset) {
   219			if (fract_offset < 0) {
   220				fract_offset = fract_offset + tick_mult;
   221				max_tick--;
   222			}
 > 223			if (fract_offset > (tick_mult / RTC_FR_MAX_TICKS)) {
   224				for (fract_tick = 1; fract_tick < 16; fract_tick++) {
   225					if (fract_offset <=
   226					    (fract_tick *
   227					     (tick_mult / RTC_FR_MAX_TICKS)))
   228						break;
   229				}
   230			}
   231		}
   232	
   233		/* Zynqmp RTC uses second and fractional tick
   234		 * counters for compensation
   235		 */
   236		calibval = max_tick + RTC_CALIB_DEF;
   237	
   238		if (fract_tick)
   239			calibval |= RTC_FR_EN;
   240	
   241		calibval |= (fract_tick << RTC_FR_DATSHIFT);
   242	
   243		writel(calibval, (xrtcdev->reg_base + RTC_CALIB_WR));
   244	
   245		return 0;
   246	}
   247	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
