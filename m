Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895AF28FE;
	Sun,  9 Apr 2023 21:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681075307; x=1712611307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mneTxEsItf49WuZHJnzJOEcKmBrdQLASPlzic94ixcE=;
  b=R2PeEvxsw4asuzBx7RQHwo+H3hwn0y6Z8g6kBWLWRg24+4jhhCYxwz6k
   dc+GM7ykYjS/MoNU59F3VyHWpGvoCnuBcJr7CI3m4Abm1s+M4VvyGebbF
   jJz5eqfhMb3fzC9HVfDnmyW0Y2KZxV7o9bQQFCysQUN/b4W13l/oB+nqY
   nBbqSzvDibFHst4W+TiSChQ8rFdNjeDiC62m2s2hxIWJdROremDRz2Gei
   78dYaGYDBpoi9y+24aonjBa091qaWAFAEclhZ1oT5rTMfvkmJ5YPf06qM
   pGiMqQzrjYyHOVkIQ1NdY3K0GPxh4RDf2YM50yhCFCSzLxJH2+XfaOPyK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="408388605"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="408388605"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 14:21:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="862304548"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="862304548"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 09 Apr 2023 14:21:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plcTo-000Umb-30;
	Sun, 09 Apr 2023 21:21:44 +0000
Date: Mon, 10 Apr 2023 05:21:07 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/210-gpu 54/105] rust/helpers.c:317:9: error:
 implicit declaration of function 'of_node_is_root' is invalid in C99
Message-ID: <202304100508.DHKOOj5g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/210-gpu
head:   b77ed23d7d093f7ce5d31c84b70282467321abe8
commit: 5b8395000accfb8d1399550c47328dad23b1066b [54/105] rust: kernel: platform: Add Device.set_dma_masks()
config: x86_64-randconfig-r033-20230410 (https://download.01.org/0day-ci/archive/20230410/202304100508.DHKOOj5g-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/5b8395000accfb8d1399550c47328dad23b1066b
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/210-gpu
        git checkout 5b8395000accfb8d1399550c47328dad23b1066b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304100508.DHKOOj5g-lkp@intel.com/

All errors (new ones prefixed by >>):

>> rust/helpers.c:317:9: error: implicit declaration of function 'of_node_is_root' is invalid in C99 [-Wimplicit-function-declaration]
>> rust/helpers.c:317:9: error: implicit declaration of function 'of_node_is_root' is invalid in C99 [-Wimplicit-function-declaration], err: true
   thread 'main' panicked at 'Unable to generate bindings: ()', /opt/cross/rustc-1.66.0-bindgen-0.56.0/cargo/registry/src/github.com-1ecc6299db9ec823/bindgen-0.56.0/src/main.rs:54:36
   note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
   make[2]: *** [rust/Makefile:303: rust/bindings/bindings_helpers_generated.rs] Error 1
   make[2]: *** Deleting file 'rust/bindings/bindings_helpers_generated.rs'
   make[2]: Target 'rust/' not remade because of errors.
   make[1]: *** [Makefile:1292: prepare] Error 2
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/of_node_is_root +317 rust/helpers.c

88eac78b70c9d4 Asahi Lina 2023-02-16  314  
80be5b6eb36e96 Asahi Lina 2022-10-22  315  bool rust_helper_of_node_is_root(const struct device_node *np)
80be5b6eb36e96 Asahi Lina 2022-10-22  316  {
80be5b6eb36e96 Asahi Lina 2022-10-22 @317  	return of_node_is_root(np);
80be5b6eb36e96 Asahi Lina 2022-10-22  318  }
80be5b6eb36e96 Asahi Lina 2022-10-22  319  EXPORT_SYMBOL_GPL(rust_helper_of_node_is_root);
80be5b6eb36e96 Asahi Lina 2022-10-22  320  

:::::: The code at line 317 was first introduced by commit
:::::: 80be5b6eb36e962112cd4b2aae73ef6a640bf927 rust: of: Add OF node abstraction

:::::: TO: Asahi Lina <lina@asahilina.net>
:::::: CC: Hector Martin <marcan@marcan.st>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
