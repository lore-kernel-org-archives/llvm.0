Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F291C10;
	Fri,  9 Jun 2023 03:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686282794; x=1717818794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z/HA2IaVXoYA7XQBy3icVQ2tBFAJcArfj5moZ0vUQzA=;
  b=jW03Bsnr7IstBBcZVhUPNOOexmQAxZNT4ELLfQ+HPwnUuuqbi/FKgWqM
   VrdeHXEqoPt6f9egsMl/MHrCExHugGXNXz1VoRdpMeuxthuAShB/3YQ6m
   3cUARtbF0TUdwJizUSouHY+iEaeODExNHwGwaqz1vXhynryIWx89gD800
   jZVIakX42VbUGHNmOE1iEl58qI3sRpTd1rcttbFDwIJtCI7DJV8cpmr02
   5aYmR2QCwxXlm0UoI2g5g9VZFpmZANt30I3zZkBaKzluoEoA4RaGT7J7L
   cZ0FZw66gudiYmzca5+jZV696YjcN2imJ0Aa2PC6TsuiYWhOmte4T+y5W
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="337862639"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="337862639"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 20:53:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="822899810"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="822899810"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 08 Jun 2023 20:53:12 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7TBX-0008b2-1g;
	Fri, 09 Jun 2023 03:53:11 +0000
Date: Fri, 9 Jun 2023 11:53:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-futex 26/26] ld.lld: error: undefined symbol:
 io_futex_cancel
Message-ID: <202306091140.OBlhjwDK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-futex
head:   f5301ffdaa8000783b6ef63ea885349a48493bc1
commit: f5301ffdaa8000783b6ef63ea885349a48493bc1 [26/26] io_uring/futex: add support for cancelation
config: riscv-buildonly-randconfig-r004-20230608 (https://download.01.org/0day-ci/archive/20230609/202306091140.OBlhjwDK-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?id=f5301ffdaa8000783b6ef63ea885349a48493bc1
        git remote add axboe-block https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git
        git fetch --no-tags axboe-block io_uring-futex
        git checkout f5301ffdaa8000783b6ef63ea885349a48493bc1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306091140.OBlhjwDK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: io_futex_cancel
   >>> referenced by cancel.c
   >>>               io_uring/cancel.o:(__io_async_cancel) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
