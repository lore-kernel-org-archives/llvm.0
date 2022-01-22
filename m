Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7BE2C82
	for <llvm@lists.linux.dev>; Sat, 22 Jan 2022 21:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642888387; x=1674424387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SNWEoAgFCx9s6kVPn4ZZXLiy0rbXBcZO3eNvmYmXlMY=;
  b=afiZjZnQjxmCEkhSDVGrJLWwIaVq+KvAgqEbJz6AkGrvVmN24bHnhF0p
   WjuBXlUHX0zfa7cUTKpI5G+hYqOedjQMHoLLSwPNYyvnbkWqCkpVEdkwq
   YNbbkj6VUSF0oLxy12fiASzdHI41eIRCMe8t4yzGqoF81oOuAjiGD1SYs
   HZmz1MiApmTa3M8gSxV1TJv8IdZp9TDQH3TmIvCspycQ1weMH7FWrh9Ni
   J2FHwccgd5cxCnTPUStW4CqS2zVOon6PqTOlhZhBvQFI3+alixYK4RohH
   Pi4BVWrGaonwLfDAChMqegaADLo5QQ46UtkYJQi2VBMEp6FL9AFqwKavd
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10235"; a="332205020"
X-IronPort-AV: E=Sophos;i="5.88,309,1635231600"; 
   d="scan'208";a="332205020"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2022 13:53:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,309,1635231600"; 
   d="scan'208";a="478622976"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Jan 2022 13:53:04 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nBOJk-000Gmi-9x; Sat, 22 Jan 2022 21:53:04 +0000
Date: Sun, 23 Jan 2022 05:52:03 +0800
From: kernel test robot <lkp@intel.com>
To: Valentin Schneider <valentin.schneider@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>
Subject: ld.lld: error: undefined symbol: cpus_booted_once_mask
Message-ID: <202201230454.RAEWzGlV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1c52283265a462a100ae63ddf58b4e5884acde86
commit: 835f442fdbce33a47a6bde356643fd7e3ef7ec1b irqchip/gic-v3-its: Limit memreserve cpuhp state lifetime
date:   5 weeks ago
config: arm-randconfig-r035-20220122 (https://download.01.org/0day-ci/archive/20220123/202201230454.RAEWzGlV-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30728816403d1fd73cc5082e9fb761262bce)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=835f442fdbce33a47a6bde356643fd7e3ef7ec1b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 835f442fdbce33a47a6bde356643fd7e3ef7ec1b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: cpus_booted_once_mask
   >>> referenced by irq-gic-v3-its.c
   >>>               irqchip/irq-gic-v3-its.o:(its_cpu_memreserve_lpi) in archive drivers/built-in.a

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
