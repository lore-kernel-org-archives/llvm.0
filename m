Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4866FC9;
	Wed, 29 Mar 2023 19:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680118814; x=1711654814;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uniWf7eUP/yOorG+80eULgmWBombfuyWOO2+GBMZVdw=;
  b=cSxLZxsWPm+FbE0WQzcfhly4SEYj+zDwVp3JmgnRoqPcXKE3QifE7b5u
   MqcYDOJpiwgyyW8xJBUX2ti55RUpWSmS6UQFn70agQe5RGPzZXiF/RCrK
   kDCRKYHKPN/C23aw1dp++63n2VoAegV2uDh/3F7nQ7VBQ4dUAF5FyE3l+
   xA7SUcqjlb71UqrK2gLSdZf3Los7qUqYkPFT7j64fJQ0oHtYtI6hOeCDB
   uzUT4bQy0Mwm9Nv2icnY+IqPU5wsovbfSogwc2gPupEJny7XmvNJSEDBb
   gg5ItQnDihhhNarvF7gXfWA6FPaGP6WOjUAWjwpIar5TpR+uNsIfz31BA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="329469243"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="329469243"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 12:40:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="858627938"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="858627938"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 29 Mar 2023 12:40:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phbeU-000Jt1-0v;
	Wed, 29 Mar 2023 19:40:10 +0000
Date: Thu, 30 Mar 2023 03:39:22 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:acpi-header-cleanup 1/1]
 drivers/staging/iio/resolver/ad2s1210.c:706:21: warning: incompatible
 integer to pointer conversion initializing 'const struct of_device_id *'
 with an expression of type 'int'
Message-ID: <202303300312.DlVOybTm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git acpi-header-cleanup
head:   333a203a26446521eac7046c6fb7426997569bf8
commit: 333a203a26446521eac7046c6fb7426997569bf8 [1/1] ACPI: Replace irqdomain.h include with struct declarations
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20230330/202303300312.DlVOybTm-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=333a203a26446521eac7046c6fb7426997569bf8
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh acpi-header-cleanup
        git checkout 333a203a26446521eac7046c6fb7426997569bf8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/iio/adc/ drivers/staging/iio/resolver/ io_uring/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300312.DlVOybTm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/iio/resolver/ad2s1210.c:706:21: error: implicit declaration of function 'of_match_ptr' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   .of_match_table = of_match_ptr(ad2s1210_of_match),
                                     ^
>> drivers/staging/iio/resolver/ad2s1210.c:706:21: warning: incompatible integer to pointer conversion initializing 'const struct of_device_id *' with an expression of type 'int' [-Wint-conversion]
                   .of_match_table = of_match_ptr(ad2s1210_of_match),
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/iio/resolver/ad2s1210.c:706:21: error: initializer element is not a compile-time constant
                   .of_match_table = of_match_ptr(ad2s1210_of_match),
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


vim +706 drivers/staging/iio/resolver/ad2s1210.c

bf52f0591f85ea Jonathan Cameron   2011-10-05  702  
817e5c65c511d4 Graf Yang          2010-10-27  703  static struct spi_driver ad2s1210_driver = {
817e5c65c511d4 Graf Yang          2010-10-27  704  	.driver = {
817e5c65c511d4 Graf Yang          2010-10-27  705  		.name = DRV_NAME,
382c7fce7005b5 Nishad Kamdar      2018-10-31 @706  		.of_match_table = of_match_ptr(ad2s1210_of_match),
817e5c65c511d4 Graf Yang          2010-10-27  707  	},
817e5c65c511d4 Graf Yang          2010-10-27  708  	.probe = ad2s1210_probe,
bf52f0591f85ea Jonathan Cameron   2011-10-05  709  	.id_table = ad2s1210_id,
817e5c65c511d4 Graf Yang          2010-10-27  710  };
ae6ae6fec3f7d6 Lars-Peter Clausen 2011-11-16  711  module_spi_driver(ad2s1210_driver);
817e5c65c511d4 Graf Yang          2010-10-27  712  

:::::: The code at line 706 was first introduced by commit
:::::: 382c7fce7005b55f0583cf5905758d2b8def803a staging: iio: ad2s1210: Add device tree table.

:::::: TO: Nishad Kamdar <nishadkamdar@gmail.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
