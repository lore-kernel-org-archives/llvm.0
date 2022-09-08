Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34713610E
	for <llvm@lists.linux.dev>; Thu,  8 Sep 2022 21:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662671373; x=1694207373;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GG9iFC999jJiJW+I9TQ5u9rTvIxMVvGTTubzM/8yuMs=;
  b=HXryZo/07NAliri6QIcWT2xVqrx+5/+A2vmxFNSlTkQMIXt5qtdpmjFU
   b4mzL+YC07bgbHVk+xX5V1h4fYi1DphN7LGXYBP3DFqUwmDQwKSkKVb5v
   YNG/0K479ihyaNjI4wtR3Jqm++1UxxtD6wd9fflsn1CeUeRmQRKmWkgKW
   1KTnVCoPagTQmuRPe1hqpgXGGr+53q6OchKDorKZRpSSI+tj8lJ+A5l8V
   xhvotiCiqAigl9ePWNqo5G2Q1scckNCSh0EWG85feUHPAMl671HN5oYHU
   eQKg+mqAAfrXJZSeIu0TeCj9XDNaiXNRM2kBfZ9XoSnXx0EyCbtsh75EM
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="297325382"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="297325382"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2022 14:09:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="943519178"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 08 Sep 2022 14:09:30 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oWOmA-0000KD-02;
	Thu, 08 Sep 2022 21:09:30 +0000
Date: Fri, 9 Sep 2022 05:08:35 +0800
From: kernel test robot <lkp@intel.com>
To: Ibrahim Tilki <Ibrahim.Tilki@analog.com>, jdelvare@suse.com,
	linux@roeck-us.net
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nurettin Bolucu <Nurettin.Bolucu@analog.com>
Subject: Re: [PATCH RESEND v6 1/4] drivers: hwmon: Add max31760 fan speed
 controller driver
Message-ID: <202209090420.yiz6T9uI-lkp@intel.com>
References: <20220908082358.186268-2-Ibrahim.Tilki@analog.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908082358.186268-2-Ibrahim.Tilki@analog.com>

Hi Ibrahim,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.0-rc4 next-20220908]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ibrahim-Tilki/hwmon-Add-max31760-fan-speed-controller/20220908-162723
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20220909/202209090420.yiz6T9uI-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1546df49f5a6d09df78f569e4137ddb365a3e827)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a7a9956fb85372f1d08a355df3af7d64c927a987
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ibrahim-Tilki/hwmon-Add-max31760-fan-speed-controller/20220908-162723
        git checkout a7a9956fb85372f1d08a355df3af7d64c927a987
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/hwmon/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/hwmon/max31760.c:382:5: warning: no previous prototype for function 'max31760_read_string' [-Wmissing-prototypes]
   int max31760_read_string(struct device *dev, enum hwmon_sensor_types type,
       ^
   drivers/hwmon/max31760.c:382:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int max31760_read_string(struct device *dev, enum hwmon_sensor_types type,
   ^
   static 
   1 warning generated.


vim +/max31760_read_string +382 drivers/hwmon/max31760.c

   381	
 > 382	int max31760_read_string(struct device *dev, enum hwmon_sensor_types type,
   383				 u32 attr, int channel, const char **str)
   384	{
   385		switch (type) {
   386		case hwmon_temp:
   387			if (attr != hwmon_temp_label)
   388				return -EOPNOTSUPP;
   389	
   390			*str = channel ? "local" : "remote";
   391	
   392			return 0;
   393		default:
   394			return -EOPNOTSUPP;
   395		}
   396	}
   397	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
