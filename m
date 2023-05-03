Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23843BA2B;
	Wed,  3 May 2023 08:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683102607; x=1714638607;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5vVhdAGvX08FAYtCHmyekXa4m8V+FYhfBeX/G8j/1Vs=;
  b=lSWxSru14D0/4SrSHy8q6kCdrJ/0SL/gjngyKUlwMRYvgb6Dg0TQwWGC
   9jdJwvCdn6+w/Wr7Nq6uibgvfMOJch2CgYchnD18tiA1E9io0sa8jkWnJ
   D3roCFvjTWBmm91m6prj4GUBqH9iy8xyf4H54/po8DKTC6HBggptUWyEn
   WylEmyQUaMarrLuIeC7Qeu25jJFbirA63z8HhhDJpWCUxQc0LfJdtr4Yt
   YD8BF8j0ZNCbtLYEy0x7gdNPFerMXT/e/72aXx+H0Q0y1simT7KHHHGBf
   pZvn3NvvQkIaVkg97qucvNLNmyHsn2H+YC7CzZ25IDpjyHzcFmV26lbon
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="328961976"
X-IronPort-AV: E=Sophos;i="5.99,246,1677571200"; 
   d="scan'208";a="328961976"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 01:30:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="840613160"
X-IronPort-AV: E=Sophos;i="5.99,246,1677571200"; 
   d="scan'208";a="840613160"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 03 May 2023 01:30:04 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pu7sB-0001iV-0R;
	Wed, 03 May 2023 08:30:03 +0000
Date: Wed, 3 May 2023 16:29:57 +0800
From: kernel test robot <lkp@intel.com>
To: Naresh Solanki <naresh.solanki@9elements.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Naresh Solanki <Naresh.Solanki@9elements.com>,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (max597x) Add Maxim Max597x
Message-ID: <202305031640.SL6o9vFH-lkp@intel.com>
References: <20230426090356.745979-1-Naresh.Solanki@9elements.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230426090356.745979-1-Naresh.Solanki@9elements.com>

Hi Naresh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b4c288cfd2f84c44994330c408e14645d45dee5b]

url:    https://github.com/intel-lab-lkp/linux/commits/Naresh-Solanki/hwmon-max597x-Add-Maxim-Max597x/20230426-170556
base:   b4c288cfd2f84c44994330c408e14645d45dee5b
patch link:    https://lore.kernel.org/r/20230426090356.745979-1-Naresh.Solanki%409elements.com
patch subject: [PATCH] hwmon: (max597x) Add Maxim Max597x
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20230503/202305031640.SL6o9vFH-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3d6f729d86a79adf0603717c79bc389a5dcc4444
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Naresh-Solanki/hwmon-max597x-Add-Maxim-Max597x/20230426-170556
        git checkout 3d6f729d86a79adf0603717c79bc389a5dcc4444
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/hwmon/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305031640.SL6o9vFH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/max597x.c:47:10: warning: 9 enumeration values not handled in switch: 'hwmon_chip', 'hwmon_temp', 'hwmon_power'... [-Wswitch]
           switch (type) {
                   ^~~~
   1 warning generated.


vim +47 drivers/hwmon/max597x.c

    40	
    41	static int max597x_read(struct device *dev, enum hwmon_sensor_types type,
    42				u32 attr, int channel, long *val)
    43	{
    44		struct max597x_hwmon *ddata = dev_get_drvdata(dev);
    45		int ret;
    46	
  > 47		switch (type) {
    48		case hwmon_curr:
    49			switch (attr) {
    50			case hwmon_curr_input:
    51				ret = max597x_read_reg(ddata, MAX5970_REG_CURRENT_H(channel),
    52						       ddata->irng[channel], val);
    53				if (ret < 0)
    54					return ret;
    55	
    56				return 0;
    57			default:
    58				return -EOPNOTSUPP;
    59			}
    60	
    61		case hwmon_in:
    62			switch (attr) {
    63			case hwmon_in_input:
    64				ret = max597x_read_reg(ddata, MAX5970_REG_VOLTAGE_H(channel),
    65						       ddata->mon_rng[channel], val);
    66				if (ret < 0)
    67					return ret;
    68				return 0;
    69			default:
    70				return -EOPNOTSUPP;
    71			}
    72		}
    73		return -EOPNOTSUPP;
    74	}
    75	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
