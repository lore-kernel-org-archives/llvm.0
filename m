Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609A22C82
	for <llvm@lists.linux.dev>; Tue, 21 Dec 2021 03:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640058945; x=1671594945;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YbLRnUgyMlyi8+C76wF6gJqPdnVNyJwYAh2wh9jiwuA=;
  b=Ni3X/+E456WOo5ieL7DCm7pum+fyBhKkmiFPO7cb7Ulb3Ev2twe3aeUi
   BDUo/ssRO2MMeJlzZE51KKARJOT6oiq9eX/SLE8X62iaZzbqdn0ax7yhM
   yLaE3Hbli8SXeOl32YY9NJG53YViZI1i7dG2//gwavI+vuu4zg32INsVm
   B63aDs/CKEIbQC7x9UcGQoBiONPIAgFakGD1rXjLXCdSzfY03nN/j8LEU
   Rk0dBt7Ol8ztEQ1dRE0gfzL0GJp5ciP26u/XvaToAavZPLYcB8zjrPkwn
   fMy11JNDMTmLC6yqbEJH9eMblxDzUqWtCX7FP6ng3AyKLvyMbUbQmx0kZ
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="240274615"
X-IronPort-AV: E=Sophos;i="5.88,222,1635231600"; 
   d="scan'208";a="240274615"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 19:55:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,222,1635231600"; 
   d="scan'208";a="484286601"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 20 Dec 2021 19:55:43 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mzWFb-0008eZ-0h; Tue, 21 Dec 2021 03:55:43 +0000
Date: Tue, 21 Dec 2021 11:54:53 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 2/2] hwmon: (scmi) Filter out results wrongly
 interpreted as negatives
Message-ID: <202112211141.DiW591Y0-lkp@intel.com>
References: <20211220174155.40239-3-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211220174155.40239-3-cristian.marussi@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Cristian,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linux/master]
[also build test WARNING on groeck-staging/hwmon-next soc/for-next linus/master v5.16-rc6 next-20211220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Cristian-Marussi/Sensor-readings-fixes/20211221-014235
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 136057256686de39cc3a07c2e39ef6bc43003ff6
config: arm-randconfig-r031-20211220 (https://download.01.org/0day-ci/archive/20211221/202112211141.DiW591Y0-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 555eacf75f21cd1dfc6363d73ad187b730349543)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/6a3ccc22734d65dfe13f598a7469c4ca3094eeea
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Cristian-Marussi/Sensor-readings-fixes/20211221-014235
        git checkout 6a3ccc22734d65dfe13f598a7469c4ca3094eeea
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/hwmon/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/hwmon/scmi-hwmon.c:88:14: warning: shift count >= width of type [-Wshift-count-overflow]
           if (value & BIT(63)) {
                       ^~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^  ~~~~
   1 warning generated.


vim +88 drivers/hwmon/scmi-hwmon.c

    66	
    67	static int scmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
    68				   u32 attr, int channel, long *val)
    69	{
    70		int ret;
    71		u64 value;
    72		const struct scmi_sensor_info *sensor;
    73		struct scmi_sensors *scmi_sensors = dev_get_drvdata(dev);
    74	
    75		sensor = *(scmi_sensors->info[type] + channel);
    76		/*
    77		 * Can fail with EIO if the backing SCMI Sensor FW version tried to
    78		 * report a negative value.
    79		 */
    80		ret = sensor_ops->reading_get(scmi_sensors->ph, sensor->id, &value);
    81		if (ret)
    82			return ret;
    83	
    84		/*
    85		 * Cannot accept either valid positive values so big that would be
    86		 * interpreted as negative by HWMON signed long *val return value.
    87		 */
  > 88		if (value & BIT(63)) {
    89			dev_warn_once(dev,
    90				      "Reported unsigned value too big.\n");
    91			return -EIO;
    92		}
    93	
    94		ret = scmi_hwmon_scale(sensor, &value);
    95		if (!ret)
    96			*val = value;
    97	
    98		return ret;
    99	}
   100	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
