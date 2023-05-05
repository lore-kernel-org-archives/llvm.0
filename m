Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD39185F;
	Fri,  5 May 2023 08:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683276551; x=1714812551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lxs+KV773DobhD2r5JBWqLlyIfA6+rU12SjXWWIT6bY=;
  b=lJXg3xCRxXB+8HTCx3moWkl11AdZ5hBLWkfx6raGzKKEwGgLsApgesf+
   4sJxTlNueDVxX4LSMLr0V5B0jKQbdvLc1MXJYDyBwC7IEdn2lvgbZQwlH
   D6orb42MzZRd5XMoZOLz67xpNLWhq7i3/nIbvF+XwS77FUrShBSZMxI+w
   YJ0rLt9XquKaYB6jbS2efiSdkKGtHVp+Gh8WgPgIkPguiwKyES+cv0jT9
   Bz6TAUSNc2206gg5axpozi1IP5NkSWPr3ignzEMbCBtbL3b/qLKmADlLv
   +eAmM8oCYKnJgAsot8JEGN3ntcVcugLV6Lyr7yjtPHRnYQzSUcRg+M3WD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="338349385"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; 
   d="scan'208";a="338349385"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 01:49:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="762357503"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; 
   d="scan'208";a="762357503"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 05 May 2023 01:49:09 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pur7l-0000Qv-0f;
	Fri, 05 May 2023 08:49:09 +0000
Date: Fri, 5 May 2023 16:48:25 +0800
From: kernel test robot <lkp@intel.com>
To: Manisha Chinthapally <manisha.chinthapally@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mchinth:socwatch_linux_6_3 1/1] scripts/Makefile.clean:12:
 drivers/platform/x86/sepdk/Makefile: No such file or directory
Message-ID: <202305051636.55IpYo15-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Manisha,

First bad commit (maybe != root cause):

tree:   https://github.com/mchinth/linux socwatch_linux_6_3
head:   db51827dc3d8fd27fd6312b14811fa2e0c4abe87
commit: db51827dc3d8fd27fd6312b14811fa2e0c4abe87 [1/1] Platform/X86 Remove sepdk driver from this branch
config: hexagon-buildonly-randconfig-r005-20230430 (https://download.01.org/0day-ci/archive/20230505/202305051636.55IpYo15-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/mchinth/linux/commit/db51827dc3d8fd27fd6312b14811fa2e0c4abe87
        git remote add mchinth https://github.com/mchinth/linux
        git fetch --no-tags mchinth socwatch_linux_6_3
        git checkout db51827dc3d8fd27fd6312b14811fa2e0c4abe87
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon distclean

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305051636.55IpYo15-lkp@intel.com/

All errors (new ones prefixed by >>):

>> scripts/Makefile.clean:12: drivers/platform/x86/sepdk/Makefile: No such file or directory
>> make[6]: *** No rule to make target 'drivers/platform/x86/sepdk/Makefile'.
   make[6]: Failed to remake makefile 'drivers/platform/x86/sepdk/Makefile'.
   make[5]: *** [scripts/Makefile.clean:59: drivers/platform/x86/sepdk] Error 2
   make[5]: Target '__clean' not remade because of errors.
   make[4]: *** [scripts/Makefile.clean:59: drivers/platform/x86] Error 2
   make[4]: Target '__clean' not remade because of errors.
   make[3]: *** [scripts/Makefile.clean:59: drivers/platform] Error 2
   make[3]: Target '__clean' not remade because of errors.
   make[2]: *** [scripts/Makefile.clean:59: drivers] Error 2
   make[2]: Target '__clean' not remade because of errors.
   make[1]: *** [Makefile:2030: _clean_.] Error 2
   make[1]: Target 'distclean' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'distclean' not remade because of errors.


vim +12 scripts/Makefile.clean

^1da177e4c3f41 Linus Torvalds  2005-04-16   7  
4f1933620f5714 Paul Smith      2006-03-05   8  PHONY := __clean
^1da177e4c3f41 Linus Torvalds  2005-04-16   9  __clean:
^1da177e4c3f41 Linus Torvalds  2005-04-16  10  
3204a7fb98a3bc Masahiro Yamada 2021-02-28  11  include $(srctree)/scripts/Kbuild.include
a2430b25c31840 Masahiro Yamada 2022-11-19 @12  include $(kbuild-file)
^1da177e4c3f41 Linus Torvalds  2005-04-16  13  

:::::: The code at line 12 was first introduced by commit
:::::: a2430b25c31840a6dcbf95c65415d5fee2984dbc kbuild: add kbuild-file macro

:::::: TO: Masahiro Yamada <masahiroy@kernel.org>
:::::: CC: Masahiro Yamada <masahiroy@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
