Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3ACE4C84
	for <llvm@lists.linux.dev>; Fri, 17 Jun 2022 21:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655502178; x=1687038178;
  h=date:from:cc:subject:message-id:mime-version;
  bh=VYWYf1XhYgEzESIV+/R+cQnLngVgNEVrTPClG/0PsAU=;
  b=AV/DLW4gvUbN5Q+pQr3h4i3go/0oYfO7Yo8Dp8OOeh++Ovgb1ZxT5pcP
   3jKsL0quSmlweM5mlpFjCfreFACn2YXxc31RaM7ajA+34edicYotuKbjC
   IM8SL7oa79nrT1QUEF29aLBCg3Xx1bYwsFF4tuxheV+RiK1WuwvZ5HYac
   q+7sZg2DoehYNcKg1KzF0+0eNGYQD9oCGhxiHVmcv5s9Ukj0RQuqIV28+
   9pPOwTcpKruiOLWFM6TgfYqTVHeTmyvSwTu+yEWSAFxuYeCfJRTcyomI7
   JXrAwOeZnQqKk1m8qRjf0Dd26j4CeowXCEtsP1ssJLXaYcmmk98Qx0G+o
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="260022642"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="260022642"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2022 14:42:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="688477884"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 17 Jun 2022 14:42:57 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o2Jk0-000Pmw-8q;
	Fri, 17 Jun 2022 21:42:56 +0000
Date: Sat, 18 Jun 2022 05:42:10 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: clang-15: error: unknown argument: '-mr10k-cache-barrier=store'
Message-ID: <202206180522.hKvNt25Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Tiezhu Yang <yangtiezhu@loongson.cn>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Masahiro Yamada <masahiroy@kernel.org>

Hi Tiezhu,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4b35035bcf80ddb47c0112c4fbd84a63a2836a18
commit: 048cc2378c2494519d940597629465b3ea44a96f MIPS: SGI-IP22: Remove unnecessary check of GCC option
date:   6 months ago
config: mips-randconfig-r014-20220617 (https://download.01.org/0day-ci/archive/20220618/202206180522.hKvNt25Z-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d764aa7fc6b9cc3fbe960019018f5f9e941eb0a6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips64-linux-gnuabi64
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=048cc2378c2494519d940597629465b3ea44a96f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 048cc2378c2494519d940597629465b3ea44a96f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips prepare

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> clang-15: error: unknown argument: '-mr10k-cache-barrier=store'
>> clang-15: error: unknown argument: '-mr10k-cache-barrier=store'
   make[2]: *** [scripts/Makefile.build:121: kernel/bounds.s] Error 1
   make[2]: Target 'missing-syscalls' not remade because of errors.
   make[1]: *** [arch/mips/Makefile:415: archprepare] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
