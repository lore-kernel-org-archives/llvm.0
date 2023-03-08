Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC0C370;
	Wed,  8 Mar 2023 04:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678251397; x=1709787397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mt9r4mtVXs3FUOhkpvy43R7t343dRdKv0w/N2nxD5so=;
  b=FUY6A7f/OHVIEraLF3h9Mj7RIKTTdj3LGWR4FOR8UelI2iz+eI1E8nUs
   C4EbyvlYgW7ny0EbbdgHwAjHhFftJPeGPDzbwrTwwKsIC17qYmQwPd8aD
   9oVm4G0bL5TfdKvXLuR3JAjs+ulRt4bgbgRgY5oRA0DkMssw7p3H8sx95
   Meuvi7kWuOd0YfLLwWXe8gDPk7LfVOxMlZ2DtzUIBy/F7nqtqt2+mfa1c
   pDwbRH+YOG1rnwRxBZ9OdqlYqfgCVffGPJlQwIV4+NdgETBLwa2Fvrnw/
   PUpvAgACZO2oSfQbtSxKGEEWYxwftnqAJKRvqyE45eLn0VRMSPQWzvsz+
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="336079515"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="336079515"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 20:56:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="745769610"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="745769610"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Mar 2023 20:56:36 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZlqt-0001tH-24;
	Wed, 08 Mar 2023 04:56:35 +0000
Date: Wed, 8 Mar 2023 12:56:08 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [miquelraynal:nvmem-layouts-and-of-cleanup 35/35]
 drivers/gpu/host1x/bus.c:349:26: error: incompatible pointer types passing
 'struct device *const *' to parameter of type 'const struct device *'
Message-ID: <202303081201.SfaJBlxe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/miquelraynal/linux-0day.git nvmem-layouts-and-of-cleanup
head:   d8752324726fdde6bb205a5aa95ae8ff7d84eff7
commit: d8752324726fdde6bb205a5aa95ae8ff7d84eff7 [35/35] gpu: host1x: Stop open-coding of_device_uevent()
config: arm-randconfig-r036-20230306 (https://download.01.org/0day-ci/archive/20230308/202303081201.SfaJBlxe-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/miquelraynal/linux-0day/commit/d8752324726fdde6bb205a5aa95ae8ff7d84eff7
        git remote add miquelraynal https://github.com/miquelraynal/linux-0day.git
        git fetch --no-tags miquelraynal nvmem-layouts-and-of-cleanup
        git checkout d8752324726fdde6bb205a5aa95ae8ff7d84eff7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/host1x/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303081201.SfaJBlxe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/host1x/bus.c:13:
   include/linux/of_device.h:59:1: error: non-void function does not return a value in all control paths [-Werror,-Wreturn-type]
   }
   ^
>> drivers/gpu/host1x/bus.c:349:26: error: incompatible pointer types passing 'struct device *const *' to parameter of type 'const struct device *' [-Werror,-Wincompatible-pointer-types]
           return of_device_uevent(&dev->parent, env);
                                   ^~~~~~~~~~~~
   include/linux/of_device.h:44:57: note: passing argument to parameter 'dev' here
   static inline int of_device_uevent(const struct device *dev,
                                                           ^
   2 errors generated.


vim +349 drivers/gpu/host1x/bus.c

   340	
   341	/*
   342	 * Note that this is really only needed for backwards compatibility
   343	 * with libdrm, which parses this information from sysfs and will
   344	 * fail if it can't find the OF_FULLNAME, specifically.
   345	 */
   346	static int host1x_device_uevent(const struct device *dev,
   347					struct kobj_uevent_env *env)
   348	{
 > 349		return of_device_uevent(&dev->parent, env);
   350	}
   351	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
