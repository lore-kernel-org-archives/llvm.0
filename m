Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302237F;
	Mon,  3 Apr 2023 00:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680481537; x=1712017537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cSH7zWKEBUez1I6S/QFLViMh/alL9PLm+wjyY8/YudA=;
  b=d8H+LRLU82THGIkUrjMh/fcSACxm+7lnCGXWCAHNRn0hcp2Y2QQj9eVX
   coHK1ST2UrCVXOLdsiqQ6VOlPu6y9vozZKKOarkFgKt3D+hoMDkpKRb5v
   lGfiqh/ch9WIwEjcPMiHNkyosfemefvAtanjiMaHJWx39UIiIpxvKGRGi
   k0ZuMPekodQIX4SrNbsJbib323F36f7gO8qXmgObxK1Of75cqx5RHlV51
   mpgsH6ZlUBph3wRe1pJLl+JcxtQgeFsDhC9+7laPvc3U2PZZXmO+x0LIZ
   mR+Ify5xD2Bc3XhFhmOQNHp+3iWjO+ZzEQFxnBGLmK2iyROUilqJLQCai
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="325779903"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; 
   d="scan'208";a="325779903"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2023 17:25:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="716103175"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; 
   d="scan'208";a="716103175"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 02 Apr 2023 17:25:35 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pj80s-000Np7-1U;
	Mon, 03 Apr 2023 00:25:34 +0000
Date: Mon, 3 Apr 2023 08:24:42 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [matthias-bgg:v6.3-next/dts64 42/51] Error:
 arch/arm64/boot/dts/mediatek/mt6795.dtsi:636.21-22 syntax error
Message-ID: <202304030850.euI0NXDE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git v6.3-next/dts64
head:   966e221240f3c1d11a314630e9cc3c0609174210
commit: a7c7f1fe2fde4d4f6593bc24a0adbfc8f8375287 [42/51] arm64: dts: mediatek: mt6795: Add MMSYS node for multimedia clocks
config: arm64-randconfig-r012-20230402 (https://download.01.org/0day-ci/archive/20230403/202304030850.euI0NXDE-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?id=a7c7f1fe2fde4d4f6593bc24a0adbfc8f8375287
        git remote add matthias-bgg https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git
        git fetch --no-tags matthias-bgg v6.3-next/dts64
        git checkout a7c7f1fe2fde4d4f6593bc24a0adbfc8f8375287
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304030850.euI0NXDE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/mediatek/mt6795.dtsi:636.21-22 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
