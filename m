Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AC07B
	for <llvm@lists.linux.dev>; Sun, 19 Jun 2022 19:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655668331; x=1687204331;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qjr2ma7r9yq9tz6BBeyN5Cyg9t64fiyqobqhFb3V53s=;
  b=C54C5+EPGBly1r59T9uYEzBEbYmu3OIpn/6LRvZWSDgtDGGamMEZrRZN
   kq/ptY/XtSbuZZCTo6EX9ltRejQXODUcKnaIiI1jk7Dd/rQ8xB88UGteX
   yHTBLQPsJm09ZWKXiDleiw0X1FCJIdVhFv5QTm0iCA21v12NCXj2xatRP
   KInXfT6AZX/PFb1nexz0aPMT52ggg+I3POSx4V5yWQ3/mTNx6ykxAFakp
   2EdNsjZkQCP30rTvrNd2Sq/fvyrKLG/0+IrcEkFB7Cn7jGsp8yIquL5gy
   /w3nEojVG1WekH4QVFrww4AOyUL42aEx9MArhkGYoCwOQnLjX2pBjDFGq
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="268475580"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="268475580"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2022 12:52:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="689135851"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 19 Jun 2022 12:52:09 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o30xt-000RVz-2i;
	Sun, 19 Jun 2022 19:52:09 +0000
Date: Mon, 20 Jun 2022 03:52:01 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <mail@conchuod.ie>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC 4/6] reset: add polarfire soc reset support
Message-ID: <202206200343.mg3VsC0H-lkp@intel.com>
References: <20220619164935.1492823-5-mail@conchuod.ie>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220619164935.1492823-5-mail@conchuod.ie>

Hi Conor,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3]

url:    https://github.com/intel-lab-lkp/linux/commits/Conor-Dooley/PolarFire-SoC-Reset-controller/20220620-005055
base:   b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
config: riscv-randconfig-r026-20220620 (https://download.01.org/0day-ci/archive/20220620/202206200343.mg3VsC0H-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/760155ed7d4eb45e0d8cfbbf8c471b4b1548bc1e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Conor-Dooley/PolarFire-SoC-Reset-controller/20220620-005055
        git checkout 760155ed7d4eb45e0d8cfbbf8c471b4b1548bc1e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/reset/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/reset/reset-mpfs.c:33:8: error: call to undeclared function 'mpfs_reset_read'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           reg = mpfs_reset_read(rcdev->dev);
                 ^
>> drivers/reset/reset-mpfs.c:35:2: error: call to undeclared function 'mpfs_reset_write'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           mpfs_reset_write(rcdev->dev, reg);
           ^
   drivers/reset/reset-mpfs.c:39:3: warning: format specifies type 'unsigned int' but the argument has type 'unsigned long' [-Wformat]
                   id);
                   ^~
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                        ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:167:19: note: expanded from macro 'dynamic_dev_dbg'
                              dev, fmt, ##__VA_ARGS__)
                                   ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:152:56: note: expanded from macro '_dynamic_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
                                                                 ^~~~~~~~~~~
   include/linux/dynamic_debug.h:134:15: note: expanded from macro '__dynamic_func_call'
                   func(&id, ##__VA_ARGS__);               \
                               ^~~~~~~~~~~
   drivers/reset/reset-mpfs.c:47:8: error: call to undeclared function 'mpfs_reset_read'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           reg = mpfs_reset_read(rcdev->dev);
                 ^
   drivers/reset/reset-mpfs.c:49:2: error: call to undeclared function 'mpfs_reset_write'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           mpfs_reset_write(rcdev->dev, val);
           ^
   drivers/reset/reset-mpfs.c:53:3: warning: format specifies type 'unsigned int' but the argument has type 'unsigned long' [-Wformat]
                   id);
                   ^~
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                        ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:167:19: note: expanded from macro 'dynamic_dev_dbg'
                              dev, fmt, ##__VA_ARGS__)
                                   ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:152:56: note: expanded from macro '_dynamic_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
                                                                 ^~~~~~~~~~~
   include/linux/dynamic_debug.h:134:15: note: expanded from macro '__dynamic_func_call'
                   func(&id, ##__VA_ARGS__);               \
                               ^~~~~~~~~~~
   drivers/reset/reset-mpfs.c:60:12: error: call to undeclared function 'mpfs_reset_read'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           u32 reg = mpfs_reset_read(rcdev->dev);
                     ^
   drivers/reset/reset-mpfs.c:69:3: warning: format specifies type 'unsigned int' but the argument has type 'unsigned long' [-Wformat]
                   id);
                   ^~
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                        ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:167:19: note: expanded from macro 'dynamic_dev_dbg'
                              dev, fmt, ##__VA_ARGS__)
                                   ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:152:56: note: expanded from macro '_dynamic_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
                                                                 ^~~~~~~~~~~
   include/linux/dynamic_debug.h:134:15: note: expanded from macro '__dynamic_func_call'
                   func(&id, ##__VA_ARGS__);               \
                               ^~~~~~~~~~~
   3 warnings and 5 errors generated.


vim +/mpfs_reset_read +33 drivers/reset/reset-mpfs.c

    24	
    25	/*
    26	 * Peripheral clock resets
    27	 */
    28	
    29	static int mpfs_assert(struct reset_controller_dev *rcdev, unsigned long id)
    30	{
    31		u32 reg;
    32	
  > 33		reg = mpfs_reset_read(rcdev->dev);
    34		reg |= (1u << id);
  > 35		mpfs_reset_write(rcdev->dev, reg);
    36	
    37		dev_dbg(rcdev->dev,
    38			"Asserting reset for device with REG_SUBBLK_RESET_CR index: %u\n",
    39			id);
    40		return 0;
    41	}
    42	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
