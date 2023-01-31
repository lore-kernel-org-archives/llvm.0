Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A2B81E;
	Tue, 31 Jan 2023 10:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675159373; x=1706695373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cmLDM0OZG9AQqMVzB6ZhvqA3cSwYJO0/W4AeZT29MTs=;
  b=TReNIGuOOreFKj6tO7+y1KQYt0PyKy/OLEA/QLAltwjCwa3uQqEgigTF
   p/MKrwC6XdTJy0DNOpTiTS+tq8513Fj5VmDsq9Uh8qMzJF6nW+9npFHss
   vFKEsxfgv6dVUYpmQYT328fEwy6HXAHDpUQKK+v/NI1GNPg5jcbV7qYNq
   ByGum6uZ1RVfB8Da/EdORjKhSX++Rr91kNSeHD8s+I0qY7a9+Xla4M0qD
   YgrWGpYu44NXem8T90DiVbJ0mBpa6Uf2E4KyCYgo0V8VbEKE14l1orvkm
   H+8m1ZMF6pL1pfgkFrJddGalMvpu5zJdCfyKDwypy3kCUKTqpCVQaB+/9
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="325496879"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="325496879"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 02:02:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="838332932"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="838332932"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 31 Jan 2023 02:02:49 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMnTT-0004M0-27;
	Tue, 31 Jan 2023 10:02:47 +0000
Date: Tue, 31 Jan 2023 18:01:56 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marex@denx.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [linux-stable-rc:linux-5.15.y 9007/9999]
 drivers/extcon/extcon-usbc-tusb320.c:19: warning: expecting prototype for
 drivers/extcon/extcon-tusb320.c(). Prototype was for TUSB320_REG8() instead
Message-ID: <202301311753.ncxChquO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
head:   5605d15db0225e49efaa8f83e03f78a8bee3bb5d
commit: ac067e75c4c2a80c617326ad5c4a8754b16f5079 [9007/9999] extcon: usbc-tusb320: Add USB TYPE-C support
config: i386-randconfig-a013-20230130 (https://download.01.org/0day-ci/archive/20230131/202301311753.ncxChquO-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=ac067e75c4c2a80c617326ad5c4a8754b16f5079
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-5.15.y
        git checkout ac067e75c4c2a80c617326ad5c4a8754b16f5079
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/extcon/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
https://github.com/intel/lkp-tests
