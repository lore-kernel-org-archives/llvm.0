Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0FD15CA;
	Thu, 23 Feb 2023 03:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677123345; x=1708659345;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=10YtKQXj1+fHAY7OExPgdWNecrvakuoIE8fv1ypQw7E=;
  b=YlsWaDOoAmhKUs0tmU6huQrryBmqExwLJPaMozNOKLWYCC857elZVUis
   JAuaayIbkKetJvp4XQHtWO6D80D7bgQuDyafmtwpOAuJydgbnB5jO4nmd
   MB87Q2yR5ESHw+fnRdb8K0S41aFV3gCb3o1fAYx1FnKnhelqfMtXho+gS
   3qdr3lOntvFi5JCHU8ucJZW14sSfm340Dg9y65Jn5uVR+BdcJjggTrOC3
   GULYc8a2kFq9DiZ5HScigwBekn0kEvNKPtBicPU+eEf8Xb10suICjlFWD
   ra53uI5IMDBr7JTGWg2Jnb87Igyiqai3KxkfoK2jl+vIxwvxXOtKLces3
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="316834276"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="316834276"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 19:35:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="781717794"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="781717794"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 22 Feb 2023 19:35:43 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pV2OU-0000xX-31;
	Thu, 23 Feb 2023 03:35:42 +0000
Date: Thu, 23 Feb 2023 11:35:08 +0800
From: kernel test robot <lkp@intel.com>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/6] iio: test: test gain-time-scale helpers
Message-ID: <202302231137.HIdqv0Cu-lkp@intel.com>
References: <5e1fdcd95544d40432adbb4ecd380da97a7d93ea.1677080089.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e1fdcd95544d40432adbb4ecd380da97a7d93ea.1677080089.git.mazziesaccount@gmail.com>

Hi Matti,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on 5dc4c995db9eb45f6373a956eb1f69460e69e6d4]

url:    https://github.com/intel-lab-lkp/linux/commits/Matti-Vaittinen/dt-bindings-iio-light-Support-ROHM-BU27034/20230223-001713
base:   5dc4c995db9eb45f6373a956eb1f69460e69e6d4
patch link:    https://lore.kernel.org/r/5e1fdcd95544d40432adbb4ecd380da97a7d93ea.1677080089.git.mazziesaccount%40gmail.com
patch subject: [RFC PATCH 3/6] iio: test: test gain-time-scale helpers
config: mips-randconfig-r002-20230222 (https://download.01.org/0day-ci/archive/20230223/202302231137.HIdqv0Cu-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/f4645e8e5df1385d6ed12c4a6cc3dd44c28eabe3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Matti-Vaittinen/dt-bindings-iio-light-Support-ROHM-BU27034/20230223-001713
        git checkout f4645e8e5df1385d6ed12c4a6cc3dd44c28eabe3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/iio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302231137.HIdqv0Cu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iio/light/gain-time-scale-helper.c:12:
>> drivers/iio/light/gain-time-scale-helper.h:7:9: warning: '__GAIN_TIME_SCALE_HELPER__' is used as a header guard here, followed by #define of a different macro [-Wheader-guard]
   #ifndef __GAIN_TIME_SCALE_HELPER__
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/gain-time-scale-helper.h:8:9: note: '___GAIN_TIME_SCALE_HELPER__' is defined here; did you mean '__GAIN_TIME_SCALE_HELPER__'?
   #define ___GAIN_TIME_SCALE_HELPER__
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
           __GAIN_TIME_SCALE_HELPER__
   1 warning generated.
--
   In file included from drivers/iio/test/iio-test-gts.c:8:
>> drivers/iio/test/../light/gain-time-scale-helper.h:7:9: warning: '__GAIN_TIME_SCALE_HELPER__' is used as a header guard here, followed by #define of a different macro [-Wheader-guard]
   #ifndef __GAIN_TIME_SCALE_HELPER__
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/test/../light/gain-time-scale-helper.h:8:9: note: '___GAIN_TIME_SCALE_HELPER__' is defined here; did you mean '__GAIN_TIME_SCALE_HELPER__'?
   #define ___GAIN_TIME_SCALE_HELPER__
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
           __GAIN_TIME_SCALE_HELPER__
   1 warning generated.


vim +/__GAIN_TIME_SCALE_HELPER__ +7 drivers/iio/light/gain-time-scale-helper.h

356f494f7ee614 Matti Vaittinen 2023-02-22 @7  #ifndef __GAIN_TIME_SCALE_HELPER__
356f494f7ee614 Matti Vaittinen 2023-02-22  8  #define ___GAIN_TIME_SCALE_HELPER__
356f494f7ee614 Matti Vaittinen 2023-02-22  9  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
