Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D047B
	for <llvm@lists.linux.dev>; Sun, 19 Jun 2022 18:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655664190; x=1687200190;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4hcsQ2ZL5Eo4paoX1c7IcXxlXro8fECeAEHwGZ2undM=;
  b=USefUf3y+UcAb4+KrY5HONtj6TbfNJQNhNmBrzRJaBDTLyWUbQyA0KUS
   ZeEv+cY2bqZkA9o15mus/zYo08XMzZsyYsFlfIIR6lO9ljFq0dybyzEjM
   3wOMPE2ycWRU5fEUccI2JtHOZT4u+hdj3xWtwgJIPt2BCbnhfIlOV9uT3
   kjU8K+T8O/1gsAxUwvVT2y5Z2VJsAfOuxsuT7rpcXQkZx4Rh5xffr9zVV
   ZAqKsfo1FgfN4EOj2fttr+QoEbf0xCzhdnTKQBVhFvOu7bpEDRFlMP9rc
   xBSZ15eDCYg94QuCPpUqksv68r6OuUdEa05k/fifCAGj/4+NfLvkL/DQV
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="262789808"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="262789808"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2022 11:43:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="676220131"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Jun 2022 11:43:08 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o2zt5-000RU0-QY;
	Sun, 19 Jun 2022 18:43:07 +0000
Date: Mon, 20 Jun 2022 02:42:34 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <mail@conchuod.ie>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC 4/6] reset: add polarfire soc reset support
Message-ID: <202206200240.8WfceWnu-lkp@intel.com>
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
[auto build test WARNING on b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3]

url:    https://github.com/intel-lab-lkp/linux/commits/Conor-Dooley/PolarFire-SoC-Reset-controller/20220620-005055
base:   b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
config: riscv-randconfig-r031-20220619 (https://download.01.org/0day-ci/archive/20220620/202206200240.8WfceWnu-lkp@intel.com/config)
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

All warnings (new ones prefixed by >>):

>> drivers/reset/reset-mpfs.c:39:3: warning: format specifies type 'unsigned int' but the argument has type 'unsigned long' [-Wformat]
                   id);
                   ^~
   include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
                   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
                                                       ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
                   _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
                                           ~~~    ^~~~~~~~~~~
   drivers/reset/reset-mpfs.c:53:3: warning: format specifies type 'unsigned int' but the argument has type 'unsigned long' [-Wformat]
                   id);
                   ^~
   include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
                   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
                                                       ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
                   _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
                                           ~~~    ^~~~~~~~~~~
   drivers/reset/reset-mpfs.c:69:3: warning: format specifies type 'unsigned int' but the argument has type 'unsigned long' [-Wformat]
                   id);
                   ^~
   include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
                   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
                                                       ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
                   _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
                                           ~~~    ^~~~~~~~~~~
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   3 warnings and 20 errors generated.


vim +39 drivers/reset/reset-mpfs.c

    24	
    25	/*
    26	 * Peripheral clock resets
    27	 */
    28	
    29	static int mpfs_assert(struct reset_controller_dev *rcdev, unsigned long id)
    30	{
    31		u32 reg;
    32	
    33		reg = mpfs_reset_read(rcdev->dev);
    34		reg |= (1u << id);
    35		mpfs_reset_write(rcdev->dev, reg);
    36	
    37		dev_dbg(rcdev->dev,
    38			"Asserting reset for device with REG_SUBBLK_RESET_CR index: %u\n",
  > 39			id);
    40		return 0;
    41	}
    42	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
