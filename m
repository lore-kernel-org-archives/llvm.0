Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B2F6038
	for <llvm@lists.linux.dev>; Wed,  6 Jul 2022 01:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657070707; x=1688606707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NQ3DUtofJ/p0shVM9gS3293H+KKbkKWrl8tWVu4ELiU=;
  b=lhxTaWK+nAXMdu0PHSjy1j9oIDrUMlqgYMvNFbJkmYRktKgsjuh2oQNs
   CQFabqsSC9xj88oD4yHOXyyQKWCFCGKmRTM2N0aw4vw3wUumJU3tosy/X
   9beU6MY2B5v7EGiBVTLPKX2BKGjGqczW4KKND3shd4ZAwYBBYapUTnh95
   Lm5wHGGcdcR65k1uNQQmNj3734U0XqEdQOZGaD8iWIYxenum+HNJDSVLb
   DinIdYzSWLiVr3lS++i/bW7Uw+uRG0uROF9oMRJiMlAlSkiifIw2EXypk
   PDcErVfXnx3Eo8Amnz0LUejvWtvMTMxTYFmEPJIVBkNE8aBv2oW0Iall1
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="283635456"
X-IronPort-AV: E=Sophos;i="5.92,248,1650956400"; 
   d="scan'208";a="283635456"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2022 18:25:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,248,1650956400"; 
   d="scan'208";a="543182177"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 05 Jul 2022 18:25:05 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o8tmq-000Jmj-Ln;
	Wed, 06 Jul 2022 01:25:04 +0000
Date: Wed, 6 Jul 2022 09:24:12 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Mehta <piyush.mehta@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Manish Narani <manish.narani@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 405/1208] ld.lld: error:
 undefined symbol: dwc3_host_wakeup_capable
Message-ID: <202207060921.5wFboRuu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Piyush,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   50470cc53c4c22e09797a106e8fb06606383b904
commit: 9a7535b91e5a749ad7e26fade0820c4c847ff8e2 [405/1208] usb: xhci-plat: Add remote wakeup support for xilinx
config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/20220706/202207060921.5wFboRuu-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f7a80c3d08d4821e621fc88d6a2e435291f82dff)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/9a7535b91e5a749ad7e26fade0820c4c847ff8e2
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout 9a7535b91e5a749ad7e26fade0820c4c847ff8e2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: dwc3_host_wakeup_capable
   >>> referenced by xhci-plat.c:104 (drivers/usb/host/xhci-plat.c:104)
   >>>               usb/host/xhci-plat.o:(xhci_plat_probe) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
