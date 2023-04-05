Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBD27C;
	Wed,  5 Apr 2023 01:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680659455; x=1712195455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IVcBW9mGqArKF/7DvSC+vvctnfJ4DkQoJDm5ZvryKmw=;
  b=W5U/0xg1cnYfYQ1FDYdDZD6dWmuIUluZsBVWE1Xiq9Pz2qA5Kg+ShH/T
   wXczyE2GcVC3apX4fqN7gTcGdlWxXVg+uwk1dqD9VExuXCAheBKuG27nB
   58MJZQ0Dp0TT/k5AaFwc7eqvbVn9yC8syDgsrFpqdWcNqzz5YDwB0x/5g
   hZmL4fTNBsZHql2GUaBarSU9+3twM7brcHs1j0cEhB6SIHKdtlLkiQcZ4
   1HKXXRFC5APov4tP9hPEOC6T4QCfgyNF/lAICsKr2muT96T7pmotHJ/g9
   cQx9bFk3uBhd+1FNDyEKVAhkbLVXUaX6pUT4tKv4LemhfGmLm70A2+zLm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="370170302"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="370170302"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 18:50:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="797722382"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="797722382"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 04 Apr 2023 18:50:53 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjsIW-000QC2-2G;
	Wed, 05 Apr 2023 01:50:52 +0000
Date: Wed, 5 Apr 2023 09:50:15 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [matthias-bgg:v6.3-next/dts64 42/51] FATAL ERROR: Unable to parse
 input tree
Message-ID: <202304050950.ZPhOX1QS-lkp@intel.com>
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
config: arm64-randconfig-r032-20230403 (https://download.01.org/0day-ci/archive/20230405/202304050950.ZPhOX1QS-lkp@intel.com/config)
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
| Link: https://lore.kernel.org/oe-kbuild-all/202304050950.ZPhOX1QS-lkp@intel.com/

All errors (new ones prefixed by >>):

   Error: arch/arm64/boot/dts/mediatek/mt6795.dtsi:636.21-22 syntax error
>> FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
