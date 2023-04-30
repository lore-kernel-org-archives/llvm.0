Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7870A3C10;
	Sun, 30 Apr 2023 19:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682882925; x=1714418925;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xob6G6pbZl3EcK4wX9FN5KEODSJuqwoj+OIUbn1LP4o=;
  b=b6/S/iNaoJabiv+D+YABfCLVxaGZxI1ZpXMuuTDsgVV61f3WQPNpKpbO
   cu+GBsv996flRxQp5wre1jbUcJJa3huMrJUClCPOa6R+p7pfGm3gnckZl
   JEQqhiYflTMpWYVo6VnUCXiUkq95N+e5ES6wH5iPHFBEYY9+eYYS5J761
   vM5Uvi5BjROILYorAbzSytArs7pC7iJds/xlZ2oZATc69UN/ifZT2GCM2
   xyPFfpyZw4Y230Qf0gjqVdUKS6DShxrqo/XAYuDx+fBu14/FTyinOCBZ5
   eSVWM9uEaDiXgSg7OfYlOdK34rLKlVA86MqNemw5pMRtImKci2Hya26/c
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="332395189"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="332395189"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 12:28:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="765074840"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="765074840"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 30 Apr 2023 12:28:43 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptCiw-00006D-29;
	Sun, 30 Apr 2023 19:28:42 +0000
Date: Mon, 1 May 2023 03:28:01 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/210-gpu 35/104] thread 'main' panicked at 'Unable
 to generate bindings: ()',
 /opt/cross/rustc-1.62.0-bindgen-0.56.0/cargo/registry/src/github.com-1ecc6299db9ec823/bindgen-0.56.0/src/main.rs:54:36
Message-ID: <202305010311.56YqQfjd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Asahi,

First bad commit (maybe != root cause):

tree:   https://github.com/AsahiLinux/linux bits/210-gpu
head:   4f5acd5f030d581ab273e65726beff36608128ff
commit: c0fed284f0ea689745d750c942f9706861c356ce [35/104] *RFL import: kernel::sync::condvar
config: x86_64-randconfig-a012-20230501 (https://download.01.org/0day-ci/archive/20230501/202305010311.56YqQfjd-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/c0fed284f0ea689745d750c942f9706861c356ce
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/210-gpu
        git checkout c0fed284f0ea689745d750c942f9706861c356ce
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305010311.56YqQfjd-lkp@intel.com/

All errors (new ones prefixed by >>):

   rust/helpers.c:126:9: error: implicit declaration of function 'signal_pending' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:126:9: error: implicit declaration of function 'signal_pending' is invalid in C99 [-Wimplicit-function-declaration], err: true
>> thread 'main' panicked at 'Unable to generate bindings: ()', /opt/cross/rustc-1.62.0-bindgen-0.56.0/cargo/registry/src/github.com-1ecc6299db9ec823/bindgen-0.56.0/src/main.rs:54:36
   stack backtrace:
      0: rust_begin_unwind
                at /rustc/a8314ef7d0ec7b75c336af2c9857bfaf43002bfc/library/std/src/panicking.rs:584:5
      1: core::panicking::panic_fmt
                at /rustc/a8314ef7d0ec7b75c336af2c9857bfaf43002bfc/library/core/src/panicking.rs:142:14
      2: core::result::unwrap_failed
                at /rustc/a8314ef7d0ec7b75c336af2c9857bfaf43002bfc/library/core/src/result.rs:1785:5
      3: std::panicking::try
      4: bindgen::main
   note: Some details are omitted, run with `RUST_BACKTRACE=full` for a verbose backtrace.
   make[2]: *** [rust/Makefile:317: rust/bindings/bindings_helpers_generated.rs] Error 1
   make[2]: *** Deleting file 'rust/bindings/bindings_helpers_generated.rs'
   make[2]: Target 'rust/' not remade because of errors.
   make[1]: *** [Makefile:1292: prepare] Error 2
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
