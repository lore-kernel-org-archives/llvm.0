Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4F01FC8
	for <llvm@lists.linux.dev>; Sun,  3 Apr 2022 14:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648994862; x=1680530862;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Iaa0Rz+YG1vfFfesV6ptCzQLT+88xCYxNQQwWKE1i/0=;
  b=Ohej9s4S80tyguHisghrTVh/dGTkdZSoZjD9U933n5lt5XZPoPd1hZyt
   83lfHHaWQxlal9rW1dFcW98p+v/CAHuS1HiVcZUcGo0ZHtGWPhk6a6zkN
   kjjoiy0F2RzZA6Dtubl4G3TMgpUYJ7tkmNhwKKzimsMUm1br5Iiy8lWES
   oIj1/SyVCUzhIUTm57ZGOUGxNiWX7vePBsbtUJlVqYWierAM1xve2MQxp
   ZoaL5tT8Tp8NJIxEuubV7FYA7eZ7RmBitudtONZ2ZvQ0TFpbgyfZ6yiQz
   oqGnFCWoYA36MbaXVWfMCjPd5UINM3aqXaausq1FOrjMiqn4Mvtuzsm7v
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10305"; a="323562875"
X-IronPort-AV: E=Sophos;i="5.90,231,1643702400"; 
   d="scan'208";a="323562875"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2022 07:07:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,231,1643702400"; 
   d="scan'208";a="657149866"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 03 Apr 2022 07:07:31 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nb0t9-000113-7f;
	Sun, 03 Apr 2022 14:07:31 +0000
Date: Sun, 3 Apr 2022 22:06:45 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH] gpio: pcf857x: Make teardown callback return void
Message-ID: <202204032242.oF5ZiIfP-lkp@intel.com>
References: <20220401170549.340923-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220401170549.340923-1-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi "Uwe,

I love your patch! Yet something to improve:

[auto build test ERROR on e8b767f5e04097aaedcd6e06e2270f9fe5282696]

url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/gpio-pcf857x-Make-teardown-callback-return-void/20220402-010754
base:   e8b767f5e04097aaedcd6e06e2270f9fe5282696
config: arm-davinci_all_defconfig (https://download.01.org/0day-ci/archive/20220403/202204032242.oF5ZiIfP-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/a3a8679599814e10a75617073b06db14ef794a54
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Uwe-Kleine-K-nig/gpio-pcf857x-Make-teardown-callback-return-void/20220402-010754
        git checkout a3a8679599814e10a75617073b06db14ef794a54
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/arm/mach-davinci/board-dm644x-evm.c:499:1: error: non-void function does not return a value [-Werror,-Wreturn-type]
   }
   ^
>> arch/arm/mach-davinci/board-dm644x-evm.c:504:14: error: incompatible function pointer types initializing 'void (*)(struct i2c_client *, int, unsigned int, void *)' with an expression of type 'int (struct i2c_client *, int, unsigned int, void *)' [-Werror,-Wincompatible-function-pointer-types]
           .teardown       = evm_u35_teardown,
                             ^~~~~~~~~~~~~~~~
   2 errors generated.


vim +499 arch/arm/mach-davinci/board-dm644x-evm.c

7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07  488  
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07  489  static int
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07  490  evm_u35_teardown(struct i2c_client *client, int gpio, unsigned ngpio, void *c)
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07  491  {
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07  492  	gpio_free(gpio + 7);
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07  493  	gpio_free(gpio + 6);
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07  494  	gpio_free(gpio + 5);
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07  495  	gpio_free(gpio + 3);
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07  496  	gpio_free(gpio + 2);
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07  497  	gpio_free(gpio + 1);
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07  498  	gpio_free(gpio + 0);
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07 @499  }
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07  500  
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07  501  static struct pcf857x_platform_data pcf_data_u35 = {
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07  502  	.gpio_base	= PCF_Uxx_BASE(2),
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07  503  	.setup		= evm_u35_setup,
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07 @504  	.teardown	= evm_u35_teardown,
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07  505  };
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07  506  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
