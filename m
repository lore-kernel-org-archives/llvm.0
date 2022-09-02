Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEB17D61
	for <llvm@lists.linux.dev>; Fri,  2 Sep 2022 23:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662160951; x=1693696951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ti+hTeS5vwIkU0g320lQTsshMRB94G9yS+tAZK5+xTk=;
  b=RZh566pTCnHJhb7HQuf/zWpL+pPy7tlUY9GjSYjH2bsvBECWV5LHY9Jr
   UJWWXrM9Uawdw7bFMrBOa0kMURD5MipuHcuQ+MDk9o1ljB0MfSCUfuM78
   paOOTh7ZTDSqq9xG6l2wk/l5TECQLXowAFLiUzTXmTefOTgomrhNUyOTG
   T50t/av0rtszQKJPeckfubV1uGIhSjCW4iebY7tETIz/vQcYW4qH5kY/x
   84y9tPMnK2Ta+PWjuURbSsC1Jb2r40888fCneV7vSh23qQmrpj1R//sKS
   m7WoLqGd5Zao17P0JHzLQ9Ow1yV8TDMW546YJJTWQLR86+/ODXuvnLei8
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="283095219"
X-IronPort-AV: E=Sophos;i="5.93,285,1654585200"; 
   d="scan'208";a="283095219"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2022 16:22:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,285,1654585200"; 
   d="scan'208";a="564129744"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 02 Sep 2022 16:22:29 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oUFzY-0000jG-2r;
	Fri, 02 Sep 2022 23:22:28 +0000
Date: Sat, 3 Sep 2022 07:21:34 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marex@denx.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Subject: [linux-next:master 2262/4736]
 drivers/extcon/extcon-usbc-tusb320.c:19: warning: expecting prototype for
 drivers/extcon/extcon-tusb320.c(). Prototype was for TUSB320_REG8() instead
Message-ID: <202209030755.eB4SkwGE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
commit: 822a6200734c94ccbfc9ae7acc5da5505b991515 [2262/4736] extcon: usbc-tusb320: Add USB TYPE-C support
config: x86_64-randconfig-a003 (https://download.01.org/0day-ci/archive/20220903/202209030755.eB4SkwGE-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=822a6200734c94ccbfc9ae7acc5da5505b991515
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 822a6200734c94ccbfc9ae7acc5da5505b991515
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/extcon/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/extcon/extcon-usbc-tusb320.c:19: warning: expecting prototype for drivers/extcon/extcon-tusb320.c(). Prototype was for TUSB320_REG8() instead


vim +19 drivers/extcon/extcon-usbc-tusb320.c

    18	
  > 19	#define TUSB320_REG8				0x8
    20	#define TUSB320_REG8_CURRENT_MODE_ADVERTISE	GENMASK(7, 6)
    21	#define TUSB320_REG8_CURRENT_MODE_ADVERTISE_USB	0x0
    22	#define TUSB320_REG8_CURRENT_MODE_ADVERTISE_15A	0x1
    23	#define TUSB320_REG8_CURRENT_MODE_ADVERTISE_30A	0x2
    24	#define TUSB320_REG8_CURRENT_MODE_DETECT	GENMASK(5, 4)
    25	#define TUSB320_REG8_CURRENT_MODE_DETECT_DEF	0x0
    26	#define TUSB320_REG8_CURRENT_MODE_DETECT_MED	0x1
    27	#define TUSB320_REG8_CURRENT_MODE_DETECT_ACC	0x2
    28	#define TUSB320_REG8_CURRENT_MODE_DETECT_HI	0x3
    29	#define TUSB320_REG8_ACCESSORY_CONNECTED	GENMASK(3, 2)
    30	#define TUSB320_REG8_ACCESSORY_CONNECTED_NONE	0x0
    31	#define TUSB320_REG8_ACCESSORY_CONNECTED_AUDIO	0x4
    32	#define TUSB320_REG8_ACCESSORY_CONNECTED_ACC	0x5
    33	#define TUSB320_REG8_ACCESSORY_CONNECTED_DEBUG	0x6
    34	#define TUSB320_REG8_ACTIVE_CABLE_DETECTION	BIT(0)
    35	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
