Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9E62CAA
	for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 17:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639503257; x=1671039257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mP3jyoD5+KogMfnKwg3vSG8O5BYFyxm5P3O0pJQUOTU=;
  b=IOs5YMWmTPQzp4+n75U1oOxh5wNVgtGvYfilJ50ddyfkbrpyX6TLlDtY
   uE35RCCkip99t8f/BGyyaG4uesSWRZK/i4JWJas+0F/2y1HXewMdEAMtc
   AxzcXNhHNdMvhVndQvdCl0JpAvANcD+Q7bTHpNcQGE1h/zoPrvEDUkJKh
   LpfdZotrPrx0ou1dbUKBC18Ur44BgHz/nEV04VgXK6mlaDro0XMLJ5gyP
   BuxBLMKaftqbTo5Ay7VKqZjlMZ4z7mw26DvbrnkRpAEBUQLtjtLsZ/2Bv
   lYZVB55oGk77jX3CTxrQ50/RvY6nbxb0+jitWOIrLEcY9i+ZjgcS6hO6C
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="302412351"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="302412351"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 09:34:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="463879453"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 14 Dec 2021 09:34:15 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mxBgs-0000ZE-Ee; Tue, 14 Dec 2021 17:34:14 +0000
Date: Wed, 15 Dec 2021 01:33:53 +0800
From: kernel test robot <lkp@intel.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Davor Joja <davor.joja@logicbricks.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.10 223/1981]
 drivers/media/i2c/adv7511-v4l2.c:2251:21: warning: no previous prototype for
 function 'adv7511_subdev'
Message-ID: <202112150131.smFBwCJv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Radhey,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.10
head:   87ec9a2d98a7a7dfc98b57348a0ec310fd170e4b
commit: c879ca1c486ba6c809ca48c82c0c8a289d97ce15 [223/1981] drivers: media: Customized adv7511 for Xylon LogiCVC (deprecated)
config: riscv-randconfig-r042-20211214 (https://download.01.org/0day-ci/archive/20211215/202112150131.smFBwCJv-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/Xilinx/linux-xlnx/commit/c879ca1c486ba6c809ca48c82c0c8a289d97ce15
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.10
        git checkout c879ca1c486ba6c809ca48c82c0c8a289d97ce15
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/input/misc/ drivers/media/i2c/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/media/i2c/adv7511-v4l2.c:427:2: error: void function 'adv7511_set_rgb_quantization_mode' should not return a value [-Wreturn-type]
           return 0;
           ^      ~
>> drivers/media/i2c/adv7511-v4l2.c:2251:21: warning: no previous prototype for function 'adv7511_subdev' [-Wmissing-prototypes]
   struct v4l2_subdev *adv7511_subdev(struct v4l2_subdev *sd)
                       ^
   drivers/media/i2c/adv7511-v4l2.c:2251:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct v4l2_subdev *adv7511_subdev(struct v4l2_subdev *sd)
   ^
   static 
   1 warning and 1 error generated.


vim +/adv7511_subdev +2251 drivers/media/i2c/adv7511-v4l2.c

  2250	
> 2251	struct v4l2_subdev *adv7511_subdev(struct v4l2_subdev *sd)
  2252	{
  2253		static struct v4l2_subdev *subdev;
  2254	
  2255		if (sd)
  2256			subdev = sd;
  2257	
  2258		return subdev;
  2259	}
  2260	EXPORT_SYMBOL(adv7511_subdev);
  2261	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
