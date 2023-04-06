Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDA8AD29;
	Thu,  6 Apr 2023 17:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680800409; x=1712336409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=atTVgm09N1ukOsRyHXqS3aW7LYmWPCIq23D5XQVn0zY=;
  b=QqJUdn3XH+zF4wZgf19AGwE1FL+1N5XZne9AACfvJkKvAjYsNfjZmbSl
   uZwxgTCtiZ8HjU+4Tlc7JYVDt2TET+HPYLEEjFQILuyOjni3hdPIztAp1
   xwjYznWllWhkv+6XFRzy8QOc/SYy2Jf/Ck+fz6h2mySY93ZwNJv1SppnL
   hBj/VFWGcANjjA1ZXtkfRDxSG5deE/mUma4BFzx/2BOEXaHLp91WVaC0L
   3f8xA6dnnLDWhNJ5Ayy6FHOTzD+YQDbY2hjZ+OaRQT+utBb/NuMt2bdPy
   Rz+U/pesYgB3ZGULzKdKi0yeIXA3UUNIYi1GRUOonvjgJ1CpvF70aRFOd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="370620319"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="370620319"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 10:00:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="719773114"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="719773114"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Apr 2023 10:00:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkSxr-000RXO-2F;
	Thu, 06 Apr 2023 16:59:59 +0000
Date: Fri, 7 Apr 2023 00:59:19 +0800
From: kernel test robot <lkp@intel.com>
To: Li Jun <jun.li@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sasha Levin <sashal@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>
Subject: [linux-stable-rc:queue/5.15 19/24] Error:
 arch/arm64/boot/dts/freescale/imx8mp.dtsi:893.12-13 syntax error
Message-ID: <202304070018.as72IMad-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Li,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.15
head:   10e14d35d2d3abd017c3f2a70a67cc3786f0b25f
commit: 9eeacd5ca1d281c137bed92c55330f8ca732a2fb [19/24] arm64: dts: imx8mp: correct usb clocks
config: arm64-randconfig-r032-20230403 (https://download.01.org/0day-ci/archive/20230407/202304070018.as72IMad-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=9eeacd5ca1d281c137bed92c55330f8ca732a2fb
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.15
        git checkout 9eeacd5ca1d281c137bed92c55330f8ca732a2fb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304070018.as72IMad-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/freescale/imx8mp.dtsi:893.12-13 syntax error
>> FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
