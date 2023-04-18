Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9E815AC;
	Tue, 18 Apr 2023 23:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681860438; x=1713396438;
  h=date:from:cc:subject:message-id:mime-version;
  bh=DvsxAp11YpBSeVmhpFUzjhEf2sAt2LCuinYWHCU0psY=;
  b=Z8BLcygPZODEJbdOE7cyXlu5cFmWR1jkgJouWtdlYTOULS2caREEabCx
   /E26beKR94z+tWw8yeFKdhyRjhbeenmVcqVBfFgSg42UYwN/UHWDA483o
   3Dv1keyA33hKhAm82z4lOCCV3smpOCGjO1PMjMj4JdQjC0t0Udw9ftjpi
   9puz+2jrHIhr8ldwT0dzeTGo8lJNy8cpWexWl6Au7EJz/LMiFrFipWNMe
   SJCIp6BpEwiKmXKLhFY0ui1+5EJ32h6NdIC1PC0BZ5pB1w2LtduDYBVC7
   OvPv99I9n/2wQhBZbQn9j4dtLH1rYE0zk0DznAyo+bxZ3ITJepl6LVAPJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="410537497"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="410537497"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 16:27:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="835061630"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="835061630"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 18 Apr 2023 16:27:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poujE-000eCt-0N;
	Tue, 18 Apr 2023 23:27:16 +0000
Date: Wed, 19 Apr 2023 07:27:14 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [android-common:android12-trusty-5.10 1480/7898] ld.lld: error:
 cannot open
 /opt/cross/clang-f28c006a58/lib/clang/14.0.6/lib/linux/libclang_rt.builtins-x86_64.a:
 No such file or directory
Message-ID: <202304190742.kTQ0lFEx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: cros-kernel-buildreports@googlegroups.com

Hi Nick,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-trusty-5.10
head:   599ad660291e9e6b440d7b25af31d48125b25e88
commit: f14e5bfb39b776318133e00b8c066ce8a870e9ab [1480/7898] ANDROID: Makefile: add compiler-rt dependency explicitly
config: x86_64-randconfig-a013-20230417 (attached as .config)
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
| Link: https://lore.kernel.org/oe-kbuild-all/202304190742.kTQ0lFEx-lkp@intel.com/

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
