Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8A338C
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 05:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652505984; x=1684041984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pCyiA479me4Ac+J+089MTQ9F9zzD4AJtHwtP6Jm9Tbw=;
  b=XiHkY9fWcxWC5QIjB3KRSwhmAKAtj/LayGhwJ/UIVWWWeROBiBxrxkKf
   vpTyBAVbZiF7n0jkNEaoV2ME1Yy8TcKDbHWNwo8Ei/SpG2WEAtsuhJUMX
   9ZxVKjc/cDrcpufZ76CAn/fAbpz0NLqgMWHfCM8ZXUdtRet7Dt0EQDwQz
   ZmgFmuhUokioWnU5VY+hb6phWIhY8tDdUJfqsAbEiw4dlA0Z3rIGKvzp2
   Wep9uz+rm9cTUMEV6TTTmdhbWbT0aMIYPcHkKdy/oA/ndHl0sxQmvl8Cb
   qUSShXgqwRs8HSAg3LwOXVXHKdfSL8SEugx8qaQmwi7fsBmTxpTv4/VPp
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10346"; a="250377288"
X-IronPort-AV: E=Sophos;i="5.91,225,1647327600"; 
   d="scan'208";a="250377288"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 22:26:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,225,1647327600"; 
   d="scan'208";a="521689387"
Received: from lkp-server01.sh.intel.com (HELO d1462bc4b09b) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 May 2022 22:26:20 -0700
Received: from kbuild by d1462bc4b09b with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1npkIF-0000FV-Lf;
	Sat, 14 May 2022 05:26:19 +0000
Date: Sat, 14 May 2022 13:25:59 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Mehta <piyush.mehta@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Manish Narani <manish.narani@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS_2022.1_update 405/1093] ld.lld:
 error: undefined symbol: dwc3_host_wakeup_capable
Message-ID: <202205141356.apKkLGBu-lkp@intel.com>
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

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS_2022.1_update
head:   5ead03b6e64b5072737c653bb20ebcd88704e3d1
commit: 9a7535b91e5a749ad7e26fade0820c4c847ff8e2 [405/1093] usb: xhci-plat: Add remote wakeup support for xilinx
config: arm64-randconfig-r031-20220512 (https://download.01.org/0day-ci/archive/20220514/202205141356.apKkLGBu-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 38189438b69ca27b4c6ce707c52dbd217583d046)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/Xilinx/linux-xlnx/commit/9a7535b91e5a749ad7e26fade0820c4c847ff8e2
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS_2022.1_update
        git checkout 9a7535b91e5a749ad7e26fade0820c4c847ff8e2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: dwc3_host_wakeup_capable
   >>> referenced by xhci-plat.c
   >>> usb/host/xhci-plat.o:(xhci_plat_probe) in archive drivers/built-in.a
   >>> referenced by xhci-plat.c
   >>> usb/host/xhci-plat.o:(xhci_plat_probe) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
