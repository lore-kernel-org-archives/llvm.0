Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2A47EC
	for <llvm@lists.linux.dev>; Mon, 18 Apr 2022 10:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650277486; x=1681813486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aciEQzyL1MqhGQqKm7QoCGDt+R4s3XKB/DFtDwxqTgM=;
  b=k6uE6km60iaY2t/A5Qx1p9vOVyMcodV/wyG9Ldmt6yvSdG+e0ikrovvQ
   4JxUOX02vPiAOQLT8gwa0lssPjx6gTJmwTHh0nH4vFpQiVxeV6EpebHK6
   gHXmIt64hnIFXo8ozI9hw2SsDUY4WDwhyfmq1yEKnaD8heEE13mcpJb31
   hwIk6IAKIWRnjkz9ym+zCw95X0qAUAIVUw4XkHPRCiK9SSYnBERIi+HQ2
   xv2KjRbTW0CO/MO+lczkXpsqEmS2OrtAHzHyK2H4c+GSwLPdUIOjiphFs
   6G7/pWs9xaSip+u+PeFkVogZVGPumoklXLJ/ZrZquXwsla8i7iMCy7Kd9
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10320"; a="349942697"
X-IronPort-AV: E=Sophos;i="5.90,269,1643702400"; 
   d="scan'208";a="349942697"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2022 03:24:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,269,1643702400"; 
   d="scan'208";a="529465431"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 18 Apr 2022 03:24:21 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ngOYO-0004Xh-Nv;
	Mon, 18 Apr 2022 10:24:20 +0000
Date: Mon, 18 Apr 2022 18:23:36 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mauro Lima <mauro.lima@eclypsium.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: include/linux/mtd/cfi.h:62:2: warning: No CONFIG_MTD_CFI_Ix
 selected. No NOR chip support can work.
Message-ID: <202204181831.mZ5R0kZ8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b2d229d4ddb17db541098b83524d901257e93845
commit: e23e5a05d1fd9479586c40ffbcc056b3e34ef816 mtd: spi-nor: intel-spi: Convert to SPI MEM
date:   9 weeks ago
config: x86_64-randconfig-a014-20220418 (https://download.01.org/0day-ci/archive/20220418/202204181831.mZ5R0kZ8-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 429cbac0390654f90bba18a41799464adf31a5ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e23e5a05d1fd9479586c40ffbcc056b3e34ef816
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e23e5a05d1fd9479586c40ffbcc056b3e34ef816
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/spi/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/spi/spi-intel.c:13:
   In file included from include/linux/mtd/spi-nor.h:10:
>> include/linux/mtd/cfi.h:62:2: warning: No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work. [-W#warnings]
   #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.
    ^
   1 warning generated.


vim +62 include/linux/mtd/cfi.h

^1da177e4c3f41 Linus Torvalds  2005-04-16  60  
241651d04d672f David Woodhouse 2007-09-06  61  #ifndef cfi_interleave
241651d04d672f David Woodhouse 2007-09-06 @62  #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.
241651d04d672f David Woodhouse 2007-09-06  63  static inline int cfi_interleave(void *cfi)
241651d04d672f David Woodhouse 2007-09-06  64  {
241651d04d672f David Woodhouse 2007-09-06  65  	BUG();
241651d04d672f David Woodhouse 2007-09-06  66  	return 0;
241651d04d672f David Woodhouse 2007-09-06  67  }
241651d04d672f David Woodhouse 2007-09-06  68  #endif
241651d04d672f David Woodhouse 2007-09-06  69  

:::::: The code at line 62 was first introduced by commit
:::::: 241651d04d672fb685b2874707016cbbf95931e5 [MTD] Fix CFI build error when no map width or interleave supported

:::::: TO: David Woodhouse <dwmw2@infradead.org>
:::::: CC: David Woodhouse <dwmw2@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
