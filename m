Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB747E;
	Mon,  1 May 2023 00:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682900334; x=1714436334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ppNV2PA3lgC5VKiOwPEBNWlW3ZQhad+SELc1ttTEtAI=;
  b=oCa/5SB88EOxgEHxsCR1td2UN3/QnKijFb5KOfEqcS96Gh24/gPL5vOk
   /JRSMfBAyJW5qp7gO8yOu892CXxpogK70SSJK3U7cucUjCpWZ2N7bKGMG
   ZuthUWTUoGVFsgRhHEDctWpqYy40Kt9fWDV4CJ6WOT45JA45FkYIdMgw5
   J30Bm0RTvxOTlGGpQun9Ff57igXPpvezgZevS4QZj6/J2HQofpcbY4OlJ
   FNC/tTwbQPUViTVoC5Pxj3lJEO3voj+Zjw0zJuZmAqnHxigBoX0ZayHE8
   0/qZEbQG6deyb6MVAl3kvQitU9w66F593XZl93yRC4WjCGWfqRtOVuDxa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="346869585"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="346869585"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 17:18:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="695625545"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="695625545"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 30 Apr 2023 17:18:52 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptHFj-0000CB-0n;
	Mon, 01 May 2023 00:18:51 +0000
Date: Mon, 1 May 2023 08:18:04 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: [lunn:leds-offload-support-reduced-auto-netdev 3/38] ld.lld: error:
 undefined symbol: devm_led_classdev_register_ext
Message-ID: <202305010811.WynoRwfp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git leds-offload-support-reduced-auto-netdev
head:   95771ae239994ead436141b910fabce1e1376c11
commit: 1433aa0fef70d234110237e349a4eccd10fb3f3e [3/38] net: phy: Add a binding for PHY LEDs
config: powerpc-buildonly-randconfig-r004-20230501 (https://download.01.org/0day-ci/archive/20230501/202305010811.WynoRwfp-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b1465cd49efcbc114a75220b153f5a055ce7911f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/lunn/linux/commit/1433aa0fef70d234110237e349a4eccd10fb3f3e
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn leds-offload-support-reduced-auto-netdev
        git checkout 1433aa0fef70d234110237e349a4eccd10fb3f3e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305010811.WynoRwfp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_led_classdev_register_ext
   >>> referenced by phy_device.c:3003 (drivers/net/phy/phy_device.c:3003)
   >>>               drivers/net/phy/phy_device.o:(phy_probe) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: devm_led_classdev_unregister
   >>> referenced by phy_device.c:3045 (drivers/net/phy/phy_device.c:3045)
   >>>               drivers/net/phy/phy_device.o:(phy_remove) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
