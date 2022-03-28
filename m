Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2847C
	for <llvm@lists.linux.dev>; Mon, 28 Mar 2022 03:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648438533; x=1679974533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/nhVzZTndEO5UdvAZ0KJejGCISp47CW/T46juwN/xBA=;
  b=LRgDoNXqTk4vmPd/I06hGnNjcqcmz0hZZ/F4oTQFKZWrE1PiKt+7W02Y
   FLdZlSKFLXzHp6+eSaS96SXSkjw/fOHtiJkeOcC2X7se8kRWE3eIqsPpg
   7EdCqpPxRyAOZdcEmdvcirY8Kog/nXnAk6D7FdqUZp0/hohj/7tqVFjU1
   LIswu/rx9qMpPp2BOWR5gH8qxLI8GTTz30ZrN90f5E4XKQPzM01ajzRnb
   WI1867wSHdiwtK89I7rs5RzLsWxrfAH0tmECttnI0EB9qQTpjcDFbg8Ls
   yzCDfFeNnf8PyHaRSMhsPIdcoi9J2AtiUpdFG5vPJlbhCI4AOJiNxA8rD
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="258620276"
X-IronPort-AV: E=Sophos;i="5.90,216,1643702400"; 
   d="scan'208";a="258620276"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2022 20:35:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,216,1643702400"; 
   d="scan'208";a="718943574"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 27 Mar 2022 20:35:31 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nYgAE-0001gr-M8; Mon, 28 Mar 2022 03:35:30 +0000
Date: Mon, 28 Mar 2022 11:35:11 +0800
From: kernel test robot <lkp@intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: ld.lld: error: undefined symbol: vmf_insert_pfn_prot
Message-ID: <202203281125.Jp08egXu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Javier,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ae085d7f9365de7da27ab5c0d16b12d51ea7fca9
commit: a0f25a6bb319aa05e04dcf51707c97c2881b4f47 drm/hisilicon/hibmc: Allow to be built if COMPILE_TEST is enabled
date:   9 weeks ago
config: riscv-buildonly-randconfig-r006-20220328 (https://download.01.org/0day-ci/archive/20220328/202203281125.Jp08egXu-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a0f25a6bb319aa05e04dcf51707c97c2881b4f47
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a0f25a6bb319aa05e04dcf51707c97c2881b4f47
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: vmf_insert_pfn_prot
   >>> referenced by ttm_bo_vm.c
   >>>               gpu/drm/ttm/ttm_bo_vm.o:(ttm_bo_vm_fault_reserved) in archive drivers/built-in.a
   >>> referenced by ttm_bo_vm.c
   >>>               gpu/drm/ttm/ttm_bo_vm.o:(ttm_bo_vm_dummy_page) in archive drivers/built-in.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on HAS_IOMEM && DRM && MMU
   Selected by
   - DRM_TTM_HELPER && HAS_IOMEM && DRM
   - DRM_HISI_HIBMC && HAS_IOMEM && DRM && PCI && (ARM64 || COMPILE_TEST

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
