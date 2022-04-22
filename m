Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA9F7A
	for <llvm@lists.linux.dev>; Fri, 22 Apr 2022 21:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650662424; x=1682198424;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8oZmbcJgaLEluY4MIs8edkXFbtUVeZ9n1fl2FQ+iUbA=;
  b=joqrbPIsQ43IDa7ue27QFf3FIVaMURRu/6jQLLniOBj/+I5ndkNnp17k
   3zDRTFdcccmbl7V24NB4ucjWwn9cXQhJhkfZB2pzlbCsqf1H0bglAdCr7
   vpdxz3280J8UNTTphJR7Ndr5Vja+TW5ByPgQxq8Mlh3wMjf+nkrkdUPoJ
   MJmgPbqdk/suwzY77CLs/iJgivbjlxbx2cSMkjvD+ry3GwK+5lBHQniFn
   vWrGLucq56w3HbKhVvGSog2hHbovFTGwKGWt4oxFqV5ilOh1I++/Xv2rR
   YlB4NyAbCFTg1Hky+SomknkPEMSTOKxNi3kNzAFXAVBQm4BQ71pfu3Ltp
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="252120042"
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; 
   d="scan'208";a="252120042"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2022 14:20:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; 
   d="scan'208";a="659211292"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 22 Apr 2022 14:20:14 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ni0hJ-000Aag-Ri;
	Fri, 22 Apr 2022 21:20:13 +0000
Date: Sat, 23 Apr 2022 05:19:22 +0800
From: kernel test robot <lkp@intel.com>
To: Quan Nguyen <quan@os.amperecomputing.com>,
	Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Derek Kiernan <derek.kiernan@xilinx.com>,
	Dragan Cvetic <dragan.cvetic@xilinx.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thu Nguyen <thu@os.amperecomputing.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Open Source Submission <patches@amperecomputing.com>,
	Phong Vo <phong@os.amperecomputing.com>,
	"Thang Q . Nguyen" <thang@os.amperecomputing.com>
Subject: Re: [PATCH v8 8/9] mfd: smpro-mfd: Adds Ampere's Altra SMpro MFD
 driver
Message-ID: <202204230554.4528TqPu-lkp@intel.com>
References: <20220422024653.2199489-9-quan@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422024653.2199489-9-quan@os.amperecomputing.com>

Hi Quan,

I love your patch! Perhaps something to improve:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on groeck-staging/hwmon-next lee-mfd/for-mfd-next v5.18-rc3 next-20220422]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Quan-Nguyen/Add-Ampere-s-Altra-SMPro-MFD-and-its-child-drivers/20220422-105732
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git c50c29a806113614098efd8da9fd7b48d605ba45
config: arm-randconfig-r004-20220422 (https://download.01.org/0day-ci/archive/20220423/202204230554.4528TqPu-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5bd87350a5ae429baf8f373cb226a57b62f87280)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/09ec873f0dd4611cb2df0150923d8906b9c5b2d1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Quan-Nguyen/Add-Ampere-s-Altra-SMPro-MFD-and-its-child-drivers/20220422-105732
        git checkout 09ec873f0dd4611cb2df0150923d8906b9c5b2d1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash arch/arm/mach-at91/ drivers/hwmon/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/hwmon/smpro-hwmon.c:376:3: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
                   default:
                   ^
   drivers/hwmon/smpro-hwmon.c:376:3: note: insert 'break;' to avoid fall-through
                   default:
                   ^
                   break; 
   1 warning generated.


vim +376 drivers/hwmon/smpro-hwmon.c

e1354080fc83378 Quan Nguyen 2022-04-22  359  
e1354080fc83378 Quan Nguyen 2022-04-22  360  static umode_t smpro_is_visible(const void *data, enum hwmon_sensor_types type,
e1354080fc83378 Quan Nguyen 2022-04-22  361  				u32 attr, int channel)
e1354080fc83378 Quan Nguyen 2022-04-22  362  {
e1354080fc83378 Quan Nguyen 2022-04-22  363  	const struct smpro_hwmon *hwmon = data;
e1354080fc83378 Quan Nguyen 2022-04-22  364  	unsigned int value;
e1354080fc83378 Quan Nguyen 2022-04-22  365  	int ret;
e1354080fc83378 Quan Nguyen 2022-04-22  366  
e1354080fc83378 Quan Nguyen 2022-04-22  367  	switch (type) {
e1354080fc83378 Quan Nguyen 2022-04-22  368  	case hwmon_temp:
e1354080fc83378 Quan Nguyen 2022-04-22  369  		switch (attr) {
e1354080fc83378 Quan Nguyen 2022-04-22  370  		case hwmon_temp_input:
e1354080fc83378 Quan Nguyen 2022-04-22  371  		case hwmon_temp_label:
e1354080fc83378 Quan Nguyen 2022-04-22  372  		case hwmon_temp_crit:
e1354080fc83378 Quan Nguyen 2022-04-22  373  			ret = regmap_read(hwmon->regmap, temperature[channel].reg, &value);
e1354080fc83378 Quan Nguyen 2022-04-22  374  			if (ret || value == 0xFFFF)
e1354080fc83378 Quan Nguyen 2022-04-22  375  				return 0;
e1354080fc83378 Quan Nguyen 2022-04-22 @376  		default:
e1354080fc83378 Quan Nguyen 2022-04-22  377  			break;
e1354080fc83378 Quan Nguyen 2022-04-22  378  		}
e1354080fc83378 Quan Nguyen 2022-04-22  379  		break;
e1354080fc83378 Quan Nguyen 2022-04-22  380  	default:
e1354080fc83378 Quan Nguyen 2022-04-22  381  		break;
e1354080fc83378 Quan Nguyen 2022-04-22  382  	}
e1354080fc83378 Quan Nguyen 2022-04-22  383  
e1354080fc83378 Quan Nguyen 2022-04-22  384  	return 0444;
e1354080fc83378 Quan Nguyen 2022-04-22  385  }
e1354080fc83378 Quan Nguyen 2022-04-22  386  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
