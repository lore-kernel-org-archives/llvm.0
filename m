Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8B06FA2;
	Wed, 29 Mar 2023 19:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680118812; x=1711654812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=By82EynRVHlqti61n/b3EYQ78RH1OcO3TWFaSfWcOrU=;
  b=L8bfcJt45UJ8MbD1RmeQUdnGV33Gd7VlCY9wC/qgxls3uwWU+wuiqHBE
   mN6/B8xbf+VSHgUzT7URlJvAzZu95gmmdduaMjL73xQTpT458jZBQis9a
   o0oJwcE3tN+jtYI8+DFY8wWK4umDcwiKGx46kFCRiHJ9jJ2a/Gl0rYC1C
   3CBHKwUplDE6/IewQwH4h0JeajlVKGGqKPewV4saACY6Rimeqv7GzfCVZ
   187/c4iSJ+j57JZXE0GgBrBcxNfSUbNQELwOb6pP8CvVVOjsxo368hXeM
   9hqRCcSiZ7455IHG1OkFtYTS1CkOhms/lNFXhKIQUtvcUO/UWQVJNFsMr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="329469240"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="329469240"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 12:40:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="858627934"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="858627934"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 29 Mar 2023 12:40:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phbeU-000Jsq-0V;
	Wed, 29 Mar 2023 19:40:10 +0000
Date: Thu, 30 Mar 2023 03:39:20 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:acpi-header-cleanup 1/1] net/rfkill/rfkill-gpio.c:181:21:
 warning: incompatible integer to pointer conversion initializing 'const
 struct of_device_id *' with an expression of type 'int'
Message-ID: <202303300348.JQJwTuYF-lkp@intel.com>
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
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20230330/202303300348.JQJwTuYF-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash net/rfkill/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300348.JQJwTuYF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/rfkill/rfkill-gpio.c:181:21: error: implicit declaration of function 'of_match_ptr' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   .of_match_table = of_match_ptr(rfkill_of_match),
                                     ^
>> net/rfkill/rfkill-gpio.c:181:21: warning: incompatible integer to pointer conversion initializing 'const struct of_device_id *' with an expression of type 'int' [-Wint-conversion]
                   .of_match_table = of_match_ptr(rfkill_of_match),
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/rfkill/rfkill-gpio.c:181:21: error: initializer element is not a compile-time constant
                   .of_match_table = of_match_ptr(rfkill_of_match),
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


vim +181 net/rfkill/rfkill-gpio.c

d64c732dfc9edc Philipp Zabel   2023-01-02  174  
7176ba23f8b589 Rhyland Klein   2011-05-16  175  static struct platform_driver rfkill_gpio_driver = {
7176ba23f8b589 Rhyland Klein   2011-05-16  176  	.probe = rfkill_gpio_probe,
9e2b29d0d6ae05 Bill Pemberton  2012-12-03  177  	.remove = rfkill_gpio_remove,
7176ba23f8b589 Rhyland Klein   2011-05-16  178  	.driver = {
7176ba23f8b589 Rhyland Klein   2011-05-16  179  		.name = "rfkill_gpio",
ef91ffaa033001 Heikki Krogerus 2013-10-16  180  		.acpi_match_table = ACPI_PTR(rfkill_acpi_match),
d64c732dfc9edc Philipp Zabel   2023-01-02 @181  		.of_match_table = of_match_ptr(rfkill_of_match),
7176ba23f8b589 Rhyland Klein   2011-05-16  182  	},
7176ba23f8b589 Rhyland Klein   2011-05-16  183  };
7176ba23f8b589 Rhyland Klein   2011-05-16  184  

:::::: The code at line 181 was first introduced by commit
:::::: d64c732dfc9edcd57feb693c23162117737e426b net: rfkill: gpio: add DT support

:::::: TO: Philipp Zabel <p.zabel@pengutronix.de>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
