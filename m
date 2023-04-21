Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA32191;
	Fri, 21 Apr 2023 04:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682051654; x=1713587654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HcG2OaQaMXxW7kOzW0omM87pnvqjWJ8bghxZYMQSVrk=;
  b=cG6iC6qc3oenVmhVOAVIOys/HMTLb36ayjHGLRHWfqCFNEgEIQJG8++Q
   EmMCbpW3/2cG3sGv2zMzmQrsn3qlgPy03K7Rf8e4pnTdEPByr9JjTv0Br
   QgNqYjElSKI4JaYVteHAxXhNZ4ZzC7A1Jlrph8WiMLQ/A68RUs3uhIhwn
   2fRd5NDFminbgEFnWQpK4k+2XvjiRyFvR+9lHSxy7GoGzRTQSJXqarzZq
   6Xv+rNGIMYz1vjA/12hHGkFEOuQSaBa/XyPBsrmdgINzVFx9f8x2uWYz9
   S+TobHRyjq+VkbZeCZlG6B0kVGejPUqX1E3XbYIceUqeArMM5CCv4/G20
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="325514897"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="325514897"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 21:34:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="669598926"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="669598926"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 20 Apr 2023 21:34:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppiTC-000gJw-2d;
	Fri, 21 Apr 2023 04:34:02 +0000
Date: Fri, 21 Apr 2023 12:33:41 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, jdelvare@suse.com,
	linux@roeck-us.net, manio@skyboo.net
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v2 2/2] hwmon: (adt7475) Convert to use device_property
 APIs
Message-ID: <202304211232.U03a7306-lkp@intel.com>
References: <20230418233656.869055-3-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418233656.869055-3-chris.packham@alliedtelesis.co.nz>

Hi Chris,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linus/master v6.3-rc7]
[cannot apply to next-20230420]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Packham/hwmon-adt7475-Use-device_property-APIs-when-configuring-polarity/20230419-074117
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20230418233656.869055-3-chris.packham%40alliedtelesis.co.nz
patch subject: [PATCH v2 2/2] hwmon: (adt7475) Convert to use device_property APIs
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20230421/202304211232.U03a7306-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/59836340c66130951595e2adebf284eca3063ccd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Chris-Packham/hwmon-adt7475-Use-device_property-APIs-when-configuring-polarity/20230419-074117
        git checkout 59836340c66130951595e2adebf284eca3063ccd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/hwmon/ drivers/net/ethernet/intel/ice/ kernel/rcu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304211232.U03a7306-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwmon/adt7475.c:1471:36: error: passing 'const struct device *' to parameter of type 'struct device *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           ret = device_property_read_string(&client->dev, propname, &function);
                                             ^~~~~~~~~~~~
   include/linux/property.h:54:48: note: passing argument to parameter 'dev' here
   int device_property_read_string(struct device *dev, const char *propname,
                                                  ^
   drivers/hwmon/adt7475.c:1497:36: error: passing 'const struct device *' to parameter of type 'struct device *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           ret = device_property_read_string(&client->dev, propname, &function);
                                             ^~~~~~~~~~~~
   include/linux/property.h:54:48: note: passing argument to parameter 'dev' here
   int device_property_read_string(struct device *dev, const char *propname,
                                                  ^
   drivers/hwmon/adt7475.c:1559:37: error: passing 'const struct device *' to parameter of type 'struct device *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           int ret = device_property_read_u32(&client->dev, property,
                                              ^~~~~~~~~~~~
   include/linux/property.h:164:59: note: passing argument to parameter 'dev' here
   static inline int device_property_read_u32(struct device *dev,
                                                             ^
   3 errors generated.


vim +1471 drivers/hwmon/adt7475.c

  1464	
  1465	static int load_config3(const struct i2c_client *client, const char *propname)
  1466	{
  1467		const char *function;
  1468		u8 config3;
  1469		int ret;
  1470	
> 1471		ret = device_property_read_string(&client->dev, propname, &function);
  1472		if (!ret) {
  1473			ret = adt7475_read(REG_CONFIG3);
  1474			if (ret < 0)
  1475				return ret;
  1476	
  1477			config3 = ret & ~CONFIG3_SMBALERT;
  1478			if (!strcmp("pwm2", function))
  1479				;
  1480			else if (!strcmp("smbalert#", function))
  1481				config3 |= CONFIG3_SMBALERT;
  1482			else
  1483				return -EINVAL;
  1484	
  1485			return i2c_smbus_write_byte_data(client, REG_CONFIG3, config3);
  1486		}
  1487	
  1488		return 0;
  1489	}
  1490	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
