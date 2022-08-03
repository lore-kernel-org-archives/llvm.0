Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627D763D
	for <llvm@lists.linux.dev>; Wed,  3 Aug 2022 12:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659529331; x=1691065331;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5vBF8Ok5lBg7xULP4o1v53TnQYulqo1ZFvofkSMmRTc=;
  b=d65iVlS9RGeCF57afsdPPPuGfjDfPg25oClA0x4eIcd7mS2O31hRnG6a
   9rgMgEe3LOR8shuP7803f9Wbo+LfQZKQkCU429nKtbmx69Bj42Ru5Qbgw
   UBor7l0/jG2J0YaCUMGicXPDg5N3G4a6cSjvF6KC2lynyy9uExIhh6IMw
   h7FH3xMJnLur1TJnfzWexQEFgGNAjKmyPRbCGYvaX8crHOUPTdmeHD/tl
   WC9zFdfFMprUw9muArrVXy0JJ7YalaXZJOThRjUv4AmBJs4HMYKqz1WzD
   ljUYx8JnfAsmV5hvwhcUEn4tFekjUhfVsS3BKxw1Xq+7B9oEtszVBK63L
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="272705533"
X-IronPort-AV: E=Sophos;i="5.93,214,1654585200"; 
   d="scan'208";a="272705533"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2022 05:22:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,214,1654585200"; 
   d="scan'208";a="553301867"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 03 Aug 2022 05:22:05 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oJDO1-000HFb-0I;
	Wed, 03 Aug 2022 12:22:05 +0000
Date: Wed, 3 Aug 2022 20:21:42 +0800
From: kernel test robot <lkp@intel.com>
To: Eddie James <eajames@linux.ibm.com>, joel@jms.id.au
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, linux@roeck-us.net,
	jdelvare@suse.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	devicetree@vger.kernel.org, Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH 3/3] hwmon: (occ) Check for device property for setting
 OCC active during probe
Message-ID: <202208032055.PEvfcqsc-lkp@intel.com>
References: <20220802194656.240564-4-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220802194656.240564-4-eajames@linux.ibm.com>

Hi Eddie,

I love your patch! Yet something to improve:

[auto build test ERROR on next-20220728]
[also build test ERROR on v5.19]
[cannot apply to groeck-staging/hwmon-next linus/master v5.19 v5.19-rc8 v5.19-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eddie-James/occ-Restore-default-behavior-of-polling-OCC-during-init/20220803-034854
base:    7c5e07b73ff3011c9b82d4a3286a3362b951ad2b
config: arm-randconfig-r021-20220803 (https://download.01.org/0day-ci/archive/20220803/202208032055.PEvfcqsc-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 495519e5f8232d144ed26e9c18dbcbac6a5f25eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/31dc5bad51ddf22f4e097c0c5862d14341708188
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Eddie-James/occ-Restore-default-behavior-of-polling-OCC-during-init/20220803-034854
        git checkout 31dc5bad51ddf22f4e097c0c5862d14341708188
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/hwmon/occ/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/hwmon/occ/p9_sbe.c:188:25: error: use of undeclared identifier 'p8_i2c_occ_of_match'; did you mean 'p9_sbe_occ_of_match'?
   MODULE_DEVICE_TABLE(of, p8_i2c_occ_of_match);
                           ^~~~~~~~~~~~~~~~~~~
                           p9_sbe_occ_of_match
   include/linux/module.h:244:15: note: expanded from macro 'MODULE_DEVICE_TABLE'
   extern typeof(name) __mod_##type##__##name##_device_table               \
                 ^
   drivers/hwmon/occ/p9_sbe.c:183:34: note: 'p9_sbe_occ_of_match' declared here
   static const struct of_device_id p9_sbe_occ_of_match[] = {
                                    ^
   1 error generated.


vim +188 drivers/hwmon/occ/p9_sbe.c

   182	
   183	static const struct of_device_id p9_sbe_occ_of_match[] = {
   184		{ .compatible = "ibm,p9-occ-hwmon" },
   185		{ .compatible = "ibm,p10-occ-hwmon" },
   186		{}
   187	};
 > 188	MODULE_DEVICE_TABLE(of, p8_i2c_occ_of_match);
   189	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
