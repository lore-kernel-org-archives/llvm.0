Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CD32CA5;
	Tue, 14 Feb 2023 21:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676409085; x=1707945085;
  h=date:from:cc:subject:message-id:mime-version;
  bh=r4AM7ckaP70B8St8WQfZ9U/bBFFDLDkR4pdoP1oUdyE=;
  b=N6EC3vypNURNqChW+jCNBFB5mjmgHhWbvQhOuMt6ZbYnOqk9KojXk5W3
   3/icLewYLDgeftDdCV1TruNGgETxfO7YxuVnKXauR8kmw0OOvl5MfWYuv
   /qXOIsxhb66SRN6IJ/dyogBtkmUoktDIOkC0aPhijEXowJHtfDG1LvYYp
   wY05IxaQu9pDBpj3Ft4e72XVRRrRXfliWUtOM/t6CjHGYglWqHyb2fPTm
   WYIzt4Dlt4D8UsCb92lZgu/ZzKW2ZNX4dV21CvGVjlpiPvCPfzApzfUSM
   ZYhc4j27f1OOacWW3V2rw97eP6btRdCgDCTwCWIjoP6cCRoQEgFhh8+nv
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="331268089"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; 
   d="scan'208";a="331268089"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 13:11:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="701771865"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; 
   d="scan'208";a="701771865"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 14 Feb 2023 13:11:22 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pS2a9-0008n7-2z;
	Tue, 14 Feb 2023 21:11:21 +0000
Date: Wed, 15 Feb 2023 05:10:55 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [android-common:android12-trusty-5.10 1480/7892] ld.lld: error:
 cannot open
 /opt/cross/clang-f28c006a58/lib/clang/14.0.6/lib/linux/libclang_rt.builtins-x86_64.a:
 No such file or directory
Message-ID: <202302150556.yaucMdAE-lkp@intel.com>
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
head:   e88b0fcae6db893ef5f2a45ad70499e02ee01a4e
commit: f14e5bfb39b776318133e00b8c066ce8a870e9ab [1480/7892] ANDROID: Makefile: add compiler-rt dependency explicitly
config: x86_64-buildonly-randconfig-r006-20230213 (attached as .config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-trusty-5.10
        git checkout f14e5bfb39b776318133e00b8c066ce8a870e9ab
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 distclean

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302150556.yaucMdAE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: cannot open /opt/cross/clang-f28c006a58/lib/clang/14.0.6/lib/linux/libclang_rt.builtins-x86_64.a: No such file or directory
>> ld.lld: error: cannot open /opt/cross/clang-f28c006a58/lib/clang/14.0.6/lib/linux/libclang_rt.builtins-x86_64.a: No such file or directory
>> clang-14: error: linker command failed with exit code 1 (use -v to see invocation)
   make[2]: *** [scripts/Makefile.host:95: scripts/basic/fixdep] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:540: scripts_basic] Error 2
   make[1]: Target 'oldconfig' not remade because of errors.
   make: *** [Makefile:185: __sub-make] Error 2
   make: Target 'oldconfig' not remade because of errors.
--
>> ld.lld: error: cannot open /opt/cross/clang-f28c006a58/lib/clang/14.0.6/lib/linux/libclang_rt.builtins-x86_64.a: No such file or directory
>> ld.lld: error: cannot open /opt/cross/clang-f28c006a58/lib/clang/14.0.6/lib/linux/libclang_rt.builtins-x86_64.a: No such file or directory
>> clang-14: error: linker command failed with exit code 1 (use -v to see invocation)
   make[2]: *** [scripts/Makefile.host:95: scripts/basic/fixdep] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:540: scripts_basic] Error 2
   make[1]: Target 'olddefconfig' not remade because of errors.
   make: *** [Makefile:185: __sub-make] Error 2
   make: Target 'olddefconfig' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
