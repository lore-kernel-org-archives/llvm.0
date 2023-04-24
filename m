Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B823214;
	Mon, 24 Apr 2023 17:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682356680; x=1713892680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FCTT+tmFlevcNK9TUII1l/pjQcM3q262T2uBgR1Aw28=;
  b=Rv/+lbSTiFzS9DDJEeU3HtEsjdChzI2knkkFKpGiGS9Uw5it0KN6Litx
   TKwH4AFM3VCIeB5MMwFGRWAKwk40MFEyhCwK1DrPxizKT4R1+mbP9zVAI
   r6wlMVvUglIw3/bYu0xN4dcvhwTqbileu1sctcjnfUT2oRNeFzyJAyNXp
   860YGp0bb9BgEdgO3bIplYUwe0j3HlWO6/CcORb9lsrUWLtsnenjeR35Q
   McVL3m9VxJcIn13/iFtH+Mie6EqY5AgA73/xxKT0fgX9PmBvKL1X9bPhs
   XRBbhyjgb+eGM2R2j9W4NU2/6x0FJTMF1D25XNy99I2duq09bwO6Pbr6y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="374458905"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="374458905"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 10:17:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="670574814"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="670574814"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 24 Apr 2023 10:17:57 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqzp7-000iZs-0N;
	Mon, 24 Apr 2023 17:17:57 +0000
Date: Tue, 25 Apr 2023 01:17:26 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/210-gpu 54/104] rust/helpers.c:317:9: error:
 implicit declaration of function 'of_node_is_root' is invalid in C99
Message-ID: <202304250119.VM2PDuTB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/210-gpu
head:   4f5acd5f030d581ab273e65726beff36608128ff
commit: b2a2b9affe450f8e83893153aa98195a05804feb [54/104] rust: kernel: platform: Add Device.set_dma_masks()
config: x86_64-randconfig-a001-20230424 (https://download.01.org/0day-ci/archive/20230425/202304250119.VM2PDuTB-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/b2a2b9affe450f8e83893153aa98195a05804feb
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/210-gpu
        git checkout b2a2b9affe450f8e83893153aa98195a05804feb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304250119.VM2PDuTB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> rust/helpers.c:317:9: error: implicit declaration of function 'of_node_is_root' is invalid in C99 [-Wimplicit-function-declaration]
>> rust/helpers.c:317:9: error: implicit declaration of function 'of_node_is_root' is invalid in C99 [-Wimplicit-function-declaration], err: true
   thread 'main' panicked at 'Unable to generate bindings: ()', /opt/cross/rustc-1.66.0-bindgen-0.56.0/cargo/registry/src/github.com-1ecc6299db9ec823/bindgen-0.56.0/src/main.rs:54:36
   note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
   make[2]: *** [rust/Makefile:317: rust/bindings/bindings_helpers_generated.rs] Error 1
   make[2]: *** Deleting file 'rust/bindings/bindings_helpers_generated.rs'
   make[2]: Target 'rust/' not remade because of errors.
   make[1]: *** [Makefile:1292: prepare] Error 2
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/of_node_is_root +317 rust/helpers.c

8d3466eeedc463 Asahi Lina 2023-02-16  314  
662203dc3516bf Asahi Lina 2022-10-22  315  bool rust_helper_of_node_is_root(const struct device_node *np)
662203dc3516bf Asahi Lina 2022-10-22  316  {
662203dc3516bf Asahi Lina 2022-10-22 @317  	return of_node_is_root(np);
662203dc3516bf Asahi Lina 2022-10-22  318  }
662203dc3516bf Asahi Lina 2022-10-22  319  EXPORT_SYMBOL_GPL(rust_helper_of_node_is_root);
662203dc3516bf Asahi Lina 2022-10-22  320  

:::::: The code at line 317 was first introduced by commit
:::::: 662203dc3516bfb8c6db8890df17b87c9e88553c rust: of: Add OF node abstraction

:::::: TO: Asahi Lina <lina@asahilina.net>
:::::: CC: Hector Martin <marcan@marcan.st>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
