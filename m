Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B59C21CF7;
	Wed, 10 May 2023 22:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683757310; x=1715293310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bc6Pee1ijgCXCbkYkvsg3gDTH8C0gRkRzAMMPlcyXB4=;
  b=fvAkiA+Taq+DdQZ1L2hZ9ee1sPfxd6UCdeL4A3t7LA20Gsh5IT63rfg7
   7K+JWNlM08/vK1v1g3XUj2eyMC0Cq7QpwNao+7/O/hSyyuBEAooImvaQX
   nxTxevtmhmpLETWA7an6JwQeTanU683M+TIm4w0Cbg1cYOtkfszjkK4d7
   OG435ytM/6iamnA1lKJTj5IuAPJqyWlS2zV7lRhRwiIPJzHSe9gN1A/sh
   dpqoXT57w+WaHwQfayR6Omv8+/242dx5P2PBskhW2PSxWGaZcGCYYsv9g
   JqUWged48/k8nGNhRy6X+wqffpyUrsxnttMKutwifN030ujCcNbW2kUwx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="339593173"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="339593173"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 15:21:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="732313721"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="732313721"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 10 May 2023 15:21:48 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwsBv-0003cG-1l;
	Wed, 10 May 2023 22:21:47 +0000
Date: Thu, 11 May 2023 06:21:02 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Arnd Bergmann <arnd@kernel.org>
Subject: [niks:has_ioport_v4 36/41] ld.lld: error: undefined symbol:
 uhci_check_and_reset_hc
Message-ID: <202305110616.Legw0MPh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git has_ioport_v4
head:   b873f53aa1a6487f4a450747bd5ee38afad6dfe4
commit: 216a01adc35d677e5b2db113a4df427faae01e75 [36/41] usb: pci-quirks: handle HAS_IOPORT dependencies
config: riscv-randconfig-r042-20230509 (https://download.01.org/0day-ci/archive/20230511/202305110616.Legw0MPh-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git/commit/?id=216a01adc35d677e5b2db113a4df427faae01e75
        git remote add niks https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git
        git fetch --no-tags niks has_ioport_v4
        git checkout 216a01adc35d677e5b2db113a4df427faae01e75
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305110616.Legw0MPh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: uhci_check_and_reset_hc
   >>> referenced by pci-quirks.c
   >>>               drivers/usb/host/pci-quirks.o:(quirk_usb_early_handoff) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
