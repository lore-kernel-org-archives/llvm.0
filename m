Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAE129CA
	for <llvm@lists.linux.dev>; Mon, 13 Dec 2021 19:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639425477; x=1670961477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X16UMJKF95xzeL6Z5hGLHMG5bE2vvHJLHy/radFG42Y=;
  b=SFdNGiPccZeVsfcq+uTlyZtYxc32jjTTG4v3cNDu3ScEkJmHBU/NrHv8
   zLAcSoFlC8Re2tm2V+pSVweRnAYxXzJo78t0HNl5PaTfZ9YY4m/alC7Km
   qdfLVYZrH3482LtSrF7ON8I/ZPmFqrfcLTJ+4AyOMD7ozyIHllTB9I9dy
   YlNwJt1/oCYsQ8eydkHgkNezZB72Cx36lMktRmmA91+3efj+GFLdJZl5c
   EGWuy6ExJ2ZKOb5CE0D7g/gt8gYNEmomXijP1pIGUtQFBB3q1KYYdNsSQ
   jrsQL2ikd1jaWAa8lb6O3z1hNMMay+EWA02Oh5qpCrrLvnNVWQjbCyJEn
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="238628996"
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; 
   d="scan'208";a="238628996"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 11:57:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; 
   d="scan'208";a="613956228"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 13 Dec 2021 11:57:55 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mwrSM-00071G-FE; Mon, 13 Dec 2021 19:57:54 +0000
Date: Tue, 14 Dec 2021 03:57:39 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [chenxing:msc313_mainlining 47/76]
 drivers/pinctrl/mstar/pinctrl-msc313.c:1339:4: warning: unannotated
 fall-through between switch labels
Message-ID: <202112140343.VO0Mdyih-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://github.com/linux-chenxing/linux.git msc313_mainlining
head:   3b75af2a2f0d6aea3abc4cf56690ae7a6fd2dac6
commit: 0d8434e20c2d30bac37d042462ba57649e33a786 [47/76] pinctrl header names
config: arm-randconfig-r012-20211213 (https://download.01.org/0day-ci/archive/20211214/202112140343.VO0Mdyih-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/linux-chenxing/linux/commit/0d8434e20c2d30bac37d042462ba57649e33a786
        git remote add chenxing git://github.com/linux-chenxing/linux.git
        git fetch --no-tags chenxing msc313_mainlining
        git checkout 0d8434e20c2d30bac37d042462ba57649e33a786
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/pinctrl/mstar/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/mstar/pinctrl-msc313.c:1339:4: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
                           default:
                           ^
   drivers/pinctrl/mstar/pinctrl-msc313.c:1339:4: note: insert 'break;' to avoid fall-through
                           default:
                           ^
                           break; 
>> drivers/pinctrl/mstar/pinctrl-msc313.c:201:27: warning: unused variable 'sd_drivestrengths' [-Wunused-const-variable]
   static const unsigned int sd_drivestrengths[] = {4, 8};
                             ^
>> drivers/pinctrl/mstar/pinctrl-msc313.c:215:27: warning: unused variable 'spi0_drivestrengths' [-Wunused-const-variable]
   static const unsigned int spi0_drivestrengths[] = {4, 8, 12, 16};
                             ^
>> drivers/pinctrl/mstar/pinctrl-msc313.c:225:27: warning: unused variable 'i2c_drivestrengths' [-Wunused-const-variable]
   static const unsigned int i2c_drivestrengths[] = {4, 8};
                             ^
>> drivers/pinctrl/mstar/pinctrl-msc313.c:233:27: warning: unused variable 'sr_drivestrengths' [-Wunused-const-variable]
   static const unsigned int sr_drivestrengths[] = {4, 8};
                             ^
   5 warnings generated.


vim +1339 drivers/pinctrl/mstar/pinctrl-msc313.c

4e180cab5755b5 Daniel Palmer 2020-12-07  1318  
4e180cab5755b5 Daniel Palmer 2020-12-07  1319  static int mstar_set_config(struct msc313_pinctrl *pinctrl, int pin, unsigned long config)
4e180cab5755b5 Daniel Palmer 2020-12-07  1320  {
4e180cab5755b5 Daniel Palmer 2020-12-07  1321  	enum pin_config_param param = pinconf_to_config_param(config);
4e180cab5755b5 Daniel Palmer 2020-12-07  1322  	u32 arg = pinconf_to_config_argument(config);
4e180cab5755b5 Daniel Palmer 2020-12-07  1323  	int i;
4e180cab5755b5 Daniel Palmer 2020-12-07  1324  	unsigned int mask;
4e180cab5755b5 Daniel Palmer 2020-12-07  1325  	const struct msc313_pinctrl_pinconf *confpin;
4e180cab5755b5 Daniel Palmer 2020-12-07  1326  
4e180cab5755b5 Daniel Palmer 2020-12-07  1327  	dev_dbg(pinctrl->dev, "setting %d:%u on pin %d\n", (int)config, (unsigned int)arg, pin);
4e180cab5755b5 Daniel Palmer 2020-12-07  1328  	for (i = 0; i < pinctrl->info->npinconfs; i++) {
4e180cab5755b5 Daniel Palmer 2020-12-07  1329  		if (pinctrl->info->pinconfs[i].pin == pin) {
4e180cab5755b5 Daniel Palmer 2020-12-07  1330  			confpin = &pinctrl->info->pinconfs[i];
4e180cab5755b5 Daniel Palmer 2020-12-07  1331  			switch (param) {
4e180cab5755b5 Daniel Palmer 2020-12-07  1332  			case PIN_CONFIG_BIAS_PULL_UP:
4e180cab5755b5 Daniel Palmer 2020-12-07  1333  				if (confpin->pull_en_reg != -1) {
4e180cab5755b5 Daniel Palmer 2020-12-07  1334  					dev_dbg(pinctrl->dev, "setting pull up %d on pin %d\n", (int) arg, pin);
4e180cab5755b5 Daniel Palmer 2020-12-07  1335  					mask = 1 << confpin->pull_en_bit;
4e180cab5755b5 Daniel Palmer 2020-12-07  1336  					regmap_update_bits(pinctrl->regmap, confpin->pull_en_reg, mask, arg ? mask : 0);
4e180cab5755b5 Daniel Palmer 2020-12-07  1337  				} else
4e180cab5755b5 Daniel Palmer 2020-12-07  1338  					dev_info(pinctrl->dev, "pullup reg/bit isn't known for pin %d\n", pin);
4e180cab5755b5 Daniel Palmer 2020-12-07 @1339  			default:
4e180cab5755b5 Daniel Palmer 2020-12-07  1340  				break;
4e180cab5755b5 Daniel Palmer 2020-12-07  1341  			}
4e180cab5755b5 Daniel Palmer 2020-12-07  1342  			return 0;
4e180cab5755b5 Daniel Palmer 2020-12-07  1343  		}
4e180cab5755b5 Daniel Palmer 2020-12-07  1344  	}
4e180cab5755b5 Daniel Palmer 2020-12-07  1345  	return 0;
4e180cab5755b5 Daniel Palmer 2020-12-07  1346  }
4e180cab5755b5 Daniel Palmer 2020-12-07  1347  

:::::: The code at line 1339 was first introduced by commit
:::::: 4e180cab5755b5116ca4fb151ce6068ff5442e70 pinctrl: mstar: msc313 pinctrl driver

:::::: TO: Daniel Palmer <daniel@0x0f.com>
:::::: CC: Daniel Palmer <daniel@0x0f.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
