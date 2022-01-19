Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE13A29CA
	for <llvm@lists.linux.dev>; Wed, 19 Jan 2022 19:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642619623; x=1674155623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a7kJT8WZQ6q10SnbggD7Ch7bg5HxbpRC2T1+XzhMwz4=;
  b=EQRz/+yfIP9DI/4gyWqaOgZbfTlRQQOjY4CMwyFMETM/P4ahYsOmakDw
   sMfc1s6xC1PTMAE0CpI0owA9yVp6rfCKwJy6qAetEMWnMpsWwEqwy1rKA
   Fne7ikjkZXI+B5P9LZcMoDgAW5PBmhj4RP8mupWWwvVswzrSgQvQxDESm
   cP2xFHVyFHO8goRsOZFJsa4r3z2rnoEH0N3zbE2OiuLI4JXTe8taB0/BA
   XkrFy2xnsVWd4eWcScZub1yt8qH6QD5x3shbpd3rmfXnhTzuW8bB/7Y9h
   yWk68sp2mZOV48Nqb8RVEuc+Aw+ugrCHRQ3ZZhGAc1zfciGF/7T9jVHiV
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="308500320"
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; 
   d="scan'208";a="308500320"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2022 10:39:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; 
   d="scan'208";a="518286091"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 19 Jan 2022 10:39:39 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nAFru-000Dh1-TV; Wed, 19 Jan 2022 18:39:38 +0000
Date: Thu, 20 Jan 2022 02:38:48 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [ardb:for-kernelci 10/36] ld.lld: error: undefined symbol:
 generic_handle_arch_irq
Message-ID: <202201200205.1qfWfUJ7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git for-kernelci
head:   d2dc6a5332403ee74fe236e13ee12eb472028523
commit: b101e912429f59169f78d933ba2b7e546b3af4c0 [10/36] ARM: remove old-style irq entry
config: arm-randconfig-r023-20220117 (https://download.01.org/0day-ci/archive/20220120/202201200205.1qfWfUJ7-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f7b7138a62648f4019c55e4671682af1f851f295)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=b101e912429f59169f78d933ba2b7e546b3af4c0
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb for-kernelci
        git checkout b101e912429f59169f78d933ba2b7e546b3af4c0
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: generic_handle_arch_irq
   >>> referenced by kernel/entry-armv.o:(__irq_svc) in archive arch/arm/built-in.a
   >>> referenced by kernel/entry-armv.o:(__irq_usr) in archive arch/arm/built-in.a

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
