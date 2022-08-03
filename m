Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CF44A26
	for <llvm@lists.linux.dev>; Wed,  3 Aug 2022 22:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659564814; x=1691100814;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FyZaaNXlO9avdoPUq+PWtAEvmWODROa4pFcuQDEArzM=;
  b=iZkQG2CgHlt7tSv7s/bAJlTx1lYsR262p7z4tNjKsGmI1hXbWsWcc/Du
   VPWN9aKGY3fWTHjtg716+QGLspiphZO+SnC7hkOadN4BIuMGFGqiaQ57X
   MN5Ghb1UztQ1T6sSNatvwlzm8wEma0o0+KOx5eCpLDhu9TdBmnEWOUOZo
   xf61KAEyQsxN37NsbUK5IfqNC5slI3f5xf4cAUEyFfzhSe5K5XmKGtHNz
   ge+jyvltT4Gv55WpBydZE2aarOjwOd4x7lPOVgayLFLLpsDML0bs4LJ9N
   44wjWA65N668jcK+xztavbCqiFHOu+WFP9n0SiuOx/M9P7rrPyfVbhSDB
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10428"; a="291006327"
X-IronPort-AV: E=Sophos;i="5.93,214,1654585200"; 
   d="scan'208";a="291006327"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2022 15:13:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,214,1654585200"; 
   d="scan'208";a="692403643"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Aug 2022 15:13:25 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oJMcH-000Hid-0U;
	Wed, 03 Aug 2022 22:13:25 +0000
Date: Thu, 4 Aug 2022 06:13:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [rmk-arm:zii 42/87] drivers/net/pcs/pcs-xpcs.c:178:9: error: call to
 undeclared function 'mdiodev_c45_read'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202208040637.Ng1pO69r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm zii
head:   315d00812d1f8ed8bbbce4e4fd8d32fc883900a0
commit: 8994c74ee066d099110807ffcee3f61ffd62d28b [42/87] net: pcs: xpcs: use mdiodev accessors
config: arm-randconfig-r014-20220803 (https://download.01.org/0day-ci/archive/20220804/202208040637.Ng1pO69r-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 495519e5f8232d144ed26e9c18dbcbac6a5f25eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add rmk-arm git://git.armlinux.org.uk/~rmk/linux-arm
        git fetch --no-tags rmk-arm zii
        git checkout 8994c74ee066d099110807ffcee3f61ffd62d28b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/net/pcs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/pcs/pcs-xpcs.c:178:9: error: call to undeclared function 'mdiodev_c45_read'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return mdiodev_c45_read(xpcs->mdiodev, dev, reg);
                  ^
   drivers/net/pcs/pcs-xpcs.c:178:9: note: did you mean 'mdiobus_c45_read'?
   include/linux/mdio.h:505:19: note: 'mdiobus_c45_read' declared here
   static inline int mdiobus_c45_read(struct mii_bus *bus, int prtad, int devad,
                     ^
>> drivers/net/pcs/pcs-xpcs.c:183:9: error: call to undeclared function 'mdiodev_c45_write'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return mdiodev_c45_write(xpcs->mdiodev, dev, reg, val);
                  ^
   drivers/net/pcs/pcs-xpcs.c:183:9: note: did you mean 'mdiobus_c45_write'?
   include/linux/mdio.h:511:19: note: 'mdiobus_c45_write' declared here
   static inline int mdiobus_c45_write(struct mii_bus *bus, int prtad, int devad,
                     ^
   2 errors generated.


vim +/mdiodev_c45_read +178 drivers/net/pcs/pcs-xpcs.c

   172	
   173	#define xpcs_linkmode_supported(compat, mode) \
   174		__xpcs_linkmode_supported(compat, ETHTOOL_LINK_MODE_ ## mode ## _BIT)
   175	
   176	int xpcs_read(struct dw_xpcs *xpcs, int dev, u32 reg)
   177	{
 > 178		return mdiodev_c45_read(xpcs->mdiodev, dev, reg);
   179	}
   180	
   181	int xpcs_write(struct dw_xpcs *xpcs, int dev, u32 reg, u16 val)
   182	{
 > 183		return mdiodev_c45_write(xpcs->mdiodev, dev, reg, val);
   184	}
   185	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
