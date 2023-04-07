Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815AAAD22;
	Fri,  7 Apr 2023 18:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680893715; x=1712429715;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oW9BtZfzDJXUsYunQOx70IJ1P2QIFK+R4++nBopsldE=;
  b=H+xq4sfEx083ltJX4uC0ICLdix+He/C6TkOJ7yocl3v5xEqRgVg7wI8y
   oYJEvS1Dk5M/CHsGBGkSp4SQgqvcdNxTye1IzF+vmeh8PoBBYSNAiKrFQ
   vphdNhEhJUFZThcNqr/Nx/4+mQm52aZ+D5FO5iJ8vhlBhl5AAhCkODHXZ
   04nPtss/iLSaD7Ie45l2jIz5u/mRSA8B33qlfd+B021mSk6KUDrWMjfBs
   IrV2ppTIgo3zDhbn7TqVKZ9/dNEyw0DNMP22Zx0A40heShNKgOYz/h9Xw
   9v+w63PQwbF5/+wFv4QwulpEo12GXQoG2Fm/E+hlw+4jw2Erf8L8A/y4Z
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="341798882"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="341798882"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 11:55:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="690143084"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="690143084"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 Apr 2023 11:55:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkrEj-000Snk-1r;
	Fri, 07 Apr 2023 18:55:01 +0000
Date: Sat, 8 Apr 2023 02:54:08 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] w1: therm: constify pointers to hwmon_channel_info
Message-ID: <202304080221.hhAqNlpp-lkp@intel.com>
References: <20230407150121.79887-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407150121.79887-1-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/w1-therm-constify-pointers-to-hwmon_channel_info/20230407-230519
patch link:    https://lore.kernel.org/r/20230407150121.79887-1-krzysztof.kozlowski%40linaro.org
patch subject: [PATCH] w1: therm: constify pointers to hwmon_channel_info
config: x86_64-randconfig-a006-20230403 (https://download.01.org/0day-ci/archive/20230408/202304080221.hhAqNlpp-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9db1d901e409a44fc2b6d59cc07a76018a085aee
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Krzysztof-Kozlowski/w1-therm-constify-pointers-to-hwmon_channel_info/20230407-230519
        git checkout 9db1d901e409a44fc2b6d59cc07a76018a085aee
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080221.hhAqNlpp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/w1/slaves/w1_therm.c:469:10: error: initializing 'const struct hwmon_channel_info **' with an expression of type 'const struct hwmon_channel_info *const[2]' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           .info = w1_info,
                   ^~~~~~~
   1 error generated.


vim +469 drivers/w1/slaves/w1_therm.c

a97db8818c7e8b Jaghathiswari Rankappagounder Natarajan 2017-08-30  466  
a97db8818c7e8b Jaghathiswari Rankappagounder Natarajan 2017-08-30  467  static const struct hwmon_chip_info w1_chip_info = {
a97db8818c7e8b Jaghathiswari Rankappagounder Natarajan 2017-08-30  468  	.ops = &w1_hwmon_ops,
a97db8818c7e8b Jaghathiswari Rankappagounder Natarajan 2017-08-30 @469  	.info = w1_info,
a97db8818c7e8b Jaghathiswari Rankappagounder Natarajan 2017-08-30  470  };
a97db8818c7e8b Jaghathiswari Rankappagounder Natarajan 2017-08-30  471  #define W1_CHIPINFO	(&w1_chip_info)
a97db8818c7e8b Jaghathiswari Rankappagounder Natarajan 2017-08-30  472  #else
a97db8818c7e8b Jaghathiswari Rankappagounder Natarajan 2017-08-30  473  #define W1_CHIPINFO	NULL
a97db8818c7e8b Jaghathiswari Rankappagounder Natarajan 2017-08-30  474  #endif
a97db8818c7e8b Jaghathiswari Rankappagounder Natarajan 2017-08-30  475  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
