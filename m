Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BDD63E
	for <llvm@lists.linux.dev>; Mon, 21 Mar 2022 17:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647884362; x=1679420362;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=93ScEXCpyveWIKDjm3CXxJUD3n+Kkxyy8pTNpHBuZjg=;
  b=WHziXx19dx4yyr0RWzvOdanq4REtHQ+qLqTOnR7qEHwRHoQ4+G7EI27k
   MQCWCLV0+FEDNHgZKhqx5/JT8v2Eb8LinDgP7Fdcroq/VS5c/ZbS968E8
   B03akUmZiB4my3xGay85fJbdUBHnq6VWCaSyyNBlWcs7KfWdT7UcwEeWY
   3nPwmT3ZHfADXiwDqeaJGQGOTyq+yBIEwn011DAknK3rzjoSgzTesNdxw
   qqKihPrd9o6KwBDJcEAOqp5nqYnnmBaZgXdC41vlsCL8uNzwZL1vctPvL
   iuHa0rsV2dTl2z5mOgsVuvfCAx/6q0Xo6RpT0IxBrCsn2hDI8dkmdOIgC
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="320815696"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; 
   d="scan'208";a="320815696"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2022 10:39:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; 
   d="scan'208";a="515015749"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 21 Mar 2022 10:39:15 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nWLzu-000I1T-Vq; Mon, 21 Mar 2022 17:39:15 +0000
Date: Tue, 22 Mar 2022 01:38:14 +0800
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
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Open Source Submission <patches@amperecomputing.com>,
	Phong Vo <phong@os.amperecomputing.com>,
	"Thang Q . Nguyen" <thang@os.amperecomputing.com>
Subject: Re: [PATCH v7 8/9] mfd: smpro-mfd: Adds Ampere's Altra SMpro MFD
 driver
Message-ID: <202203220139.67ewF74A-lkp@intel.com>
References: <20220321081355.6802-9-quan@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220321081355.6802-9-quan@os.amperecomputing.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Quan,

I love your patch! Perhaps something to improve:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on groeck-staging/hwmon-next lee-mfd/for-mfd-next v5.17 next-20220321]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Quan-Nguyen/Add-Ampere-s-Altra-SMPro-MFD-and-its-child-drivers/20220321-161811
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git 37fd83916da2e4cae03d350015c82a67b1b334c4
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220322/202203220139.67ewF74A-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 85e9b2687a13d1908aa86d1b89c5ce398a06cd39)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/20d62dfe69d4a3a0cb64bf97df0062d050d6a4d4
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Quan-Nguyen/Add-Ampere-s-Altra-SMPro-MFD-and-its-child-drivers/20220321-161811
        git checkout 20d62dfe69d4a3a0cb64bf97df0062d050d6a4d4
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/hwmon/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/hwmon/smpro-hwmon.c:378:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
           default:
           ^
   drivers/hwmon/smpro-hwmon.c:378:2: note: insert 'break;' to avoid fall-through
           default:
           ^
           break; 
   1 warning generated.


vim +378 drivers/hwmon/smpro-hwmon.c

91d3fe230bebb1c Quan Nguyen 2022-03-21  359  
91d3fe230bebb1c Quan Nguyen 2022-03-21  360  static umode_t smpro_is_visible(const void *data, enum hwmon_sensor_types type,
91d3fe230bebb1c Quan Nguyen 2022-03-21  361  				u32 attr, int channel)
91d3fe230bebb1c Quan Nguyen 2022-03-21  362  {
91d3fe230bebb1c Quan Nguyen 2022-03-21  363  	const struct smpro_hwmon *hwmon = data;
91d3fe230bebb1c Quan Nguyen 2022-03-21  364  	unsigned int value;
91d3fe230bebb1c Quan Nguyen 2022-03-21  365  	int ret;
91d3fe230bebb1c Quan Nguyen 2022-03-21  366  
91d3fe230bebb1c Quan Nguyen 2022-03-21  367  	switch (type) {
91d3fe230bebb1c Quan Nguyen 2022-03-21  368  	case hwmon_temp:
91d3fe230bebb1c Quan Nguyen 2022-03-21  369  		switch (attr) {
91d3fe230bebb1c Quan Nguyen 2022-03-21  370  		case hwmon_temp_input:
91d3fe230bebb1c Quan Nguyen 2022-03-21  371  		case hwmon_temp_label:
91d3fe230bebb1c Quan Nguyen 2022-03-21  372  		case hwmon_temp_crit:
91d3fe230bebb1c Quan Nguyen 2022-03-21  373  			ret = regmap_read(hwmon->regmap, temperature[channel].reg, &value);
91d3fe230bebb1c Quan Nguyen 2022-03-21  374  			if (ret || value == 0xFFFF)
91d3fe230bebb1c Quan Nguyen 2022-03-21  375  				return 0;
91d3fe230bebb1c Quan Nguyen 2022-03-21  376  		break;
91d3fe230bebb1c Quan Nguyen 2022-03-21  377  		}
91d3fe230bebb1c Quan Nguyen 2022-03-21 @378  	default:
91d3fe230bebb1c Quan Nguyen 2022-03-21  379  		break;
91d3fe230bebb1c Quan Nguyen 2022-03-21  380  	}
91d3fe230bebb1c Quan Nguyen 2022-03-21  381  
91d3fe230bebb1c Quan Nguyen 2022-03-21  382  	return 0444;
91d3fe230bebb1c Quan Nguyen 2022-03-21  383  }
91d3fe230bebb1c Quan Nguyen 2022-03-21  384  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
