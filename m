Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24687179;
	Wed, 19 Apr 2023 00:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681862915; x=1713398915;
  h=date:from:cc:subject:message-id:mime-version;
  bh=YhQx/HqWURJq1UhDwNh825kbYlH2Q/DKlqQHy+uHWOU=;
  b=RJs8eyestlN3voREjXpipXvQnOREe/HfwASzBPGR8VyCa2iYmwikjeHX
   F8jOOqC+wm4VfzzJVRGaf+3/gOMftW5+JAoIdvbMwzBFYx83eJhMIBFIJ
   gYFQ3P7enE6CMqru4s/c+76TXrIO5dSxUhrGMkms6mRdKunzx1HRm6xR5
   17Zif6AdRR5dlGZfQalAFcc8642H5UKI54IVvGVRamIYR/uUnuxjzV0q5
   bq9R4o4KmKMHqoOw4p0t9fsa0BuWcdaeAR72tGgh3W6OmDrbaOcIny0kx
   znagryVxJ3piPDbMBcx5R0mTVwdhKTxFdRMKxxiARz5XIChz5oIDx1pmf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="324933168"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="324933168"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 17:08:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="835073244"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="835073244"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 18 Apr 2023 17:08:18 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1povMw-000eFo-0W;
	Wed, 19 Apr 2023 00:08:18 +0000
Date: Wed, 19 Apr 2023 08:08:17 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [android-common:android12-trusty-5.10 1480/7898] ld.lld: error:
 cannot open
 /opt/cross/clang-437b7602e4/lib/clang/17/lib/linux/libclang_rt.builtins-x86_64.a:
 No such file or directory
Message-ID: <202304190833.IPmAkrxR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android12-trusty-5.10
head:   599ad660291e9e6b440d7b25af31d48125b25e88
commit: f14e5bfb39b776318133e00b8c066ce8a870e9ab [1480/7898] ANDROID: Makefile: add compiler-rt dependency explicitly
config: arm-randconfig-r035-20230417 (attached as .config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-trusty-5.10
        git checkout f14e5bfb39b776318133e00b8c066ce8a870e9ab
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm distclean

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304190833.IPmAkrxR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: cannot open /opt/cross/clang-437b7602e4/lib/clang/17/lib/linux/libclang_rt.builtins-x86_64.a: No such file or directory
>> ld.lld: error: cannot open /opt/cross/clang-437b7602e4/lib/clang/17/lib/linux/libclang_rt.builtins-x86_64.a: No such file or directory
>> clang: error: linker command failed with exit code 1 (use -v to see invocation)
   make[2]: *** [scripts/Makefile.host:95: scripts/basic/fixdep] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:540: scripts_basic] Error 2
   make[1]: Target 'oldconfig' not remade because of errors.
   make: *** [Makefile:185: __sub-make] Error 2
   make: Target 'oldconfig' not remade because of errors.
--
>> ld.lld: error: cannot open /opt/cross/clang-437b7602e4/lib/clang/17/lib/linux/libclang_rt.builtins-x86_64.a: No such file or directory
>> ld.lld: error: cannot open /opt/cross/clang-437b7602e4/lib/clang/17/lib/linux/libclang_rt.builtins-x86_64.a: No such file or directory
>> clang: error: linker command failed with exit code 1 (use -v to see invocation)
   make[2]: *** [scripts/Makefile.host:95: scripts/basic/fixdep] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:540: scripts_basic] Error 2
   make[1]: Target 'olddefconfig' not remade because of errors.
   make: *** [Makefile:185: __sub-make] Error 2
   make: Target 'olddefconfig' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
