Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B62D7E4;
	Tue,  6 Jun 2023 23:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686095785; x=1717631785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9OqldgdIkgdRTqJSbNsRPITOfaCceomQtQLMvx2Tt4w=;
  b=Ed8bwa2dKDOKkm3uUryZZXmu93WGT1t8jyHesh6DqaOICp+4SiDKxFlJ
   p/7Z3te8DpAkNZ4iQxD+f+qNl5jmszywufKgr3wVkpaejAWgfeSFiOcO6
   PyCiiuXHPV4/Q0Hmbsvxk1Yyt/GGfj68uYYOjAWCGYRSDcYHSc0aLTAlA
   tYSRDkbL64e27/v2Bc4jI55o3RXjJrOGBUjgBNV3mn/BypEh1OHM2bItB
   GJX+FkM+jMdTF8nrOvcwcphs6d7Kbq45q8vjjrEc1d0Yq7Rcg37BXIoiL
   hpnJlqSCuVGfyaMIKCkHhyvVaYRwJ4dMTkiJajgDn/hLgWNksQ/jeVFg/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="341481877"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; 
   d="scan'208";a="341481877"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 16:56:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="703386456"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; 
   d="scan'208";a="703386456"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 06 Jun 2023 16:56:22 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6gXF-0005tj-2I;
	Tue, 06 Jun 2023 23:56:21 +0000
Date: Wed, 7 Jun 2023 07:55:35 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/210-gpu 65/225] thread 'main' panicked at 'Unable
 to generate bindings: ()',
 /opt/cross/rustc-1.66.0-bindgen-0.56.0/cargo/registry/src/github.com-1ecc6299db9ec823/bindgen-0.56.0/src/main.rs:54:36
Message-ID: <202306070701.lv96SuAz-lkp@intel.com>
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
head:   088cf4cc64f4e0eec3c9b99e36c9f5e9a86b1173
commit: 61f15e866529148c87d259db6a3360536f681d60 [65/225] *RFL import: kernel::io_mem
config: x86_64-randconfig-a011-20230606 (https://download.01.org/0day-ci/archive/20230607/202306070701.lv96SuAz-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/61f15e866529148c87d259db6a3360536f681d60
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/210-gpu
        git checkout 61f15e866529148c87d259db6a3360536f681d60
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306070701.lv96SuAz-lkp@intel.com/

All errors (new ones prefixed by >>):

   rust/helpers.c:201:9: error: call to undeclared function 'ioremap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:201:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
   rust/helpers.c:207:9: error: call to undeclared function 'readb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:213:9: error: call to undeclared function 'readw'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:219:9: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:226:9: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:233:2: error: call to undeclared function 'writeb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:239:2: error: call to undeclared function 'writew'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:245:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:252:2: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:259:9: error: call to undeclared function 'readb_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:265:9: error: call to undeclared function 'readw_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:271:9: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:278:9: error: call to undeclared function 'readq_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:285:2: error: call to undeclared function 'writeb_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:291:2: error: call to undeclared function 'writew_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:297:2: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:304:2: error: call to undeclared function 'writeq_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:311:2: error: call to undeclared function 'memcpy_fromio'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:201:9: error: call to undeclared function 'ioremap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:201:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion], err: true
   rust/helpers.c:207:9: error: call to undeclared function 'readb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:213:9: error: call to undeclared function 'readw'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:219:9: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:226:9: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:233:2: error: call to undeclared function 'writeb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:239:2: error: call to undeclared function 'writew'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:245:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:252:2: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:259:9: error: call to undeclared function 'readb_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:265:9: error: call to undeclared function 'readw_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:271:9: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:278:9: error: call to undeclared function 'readq_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:285:2: error: call to undeclared function 'writeb_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:291:2: error: call to undeclared function 'writew_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:297:2: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:304:2: error: call to undeclared function 'writeq_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:311:2: error: call to undeclared function 'memcpy_fromio'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
>> thread 'main' panicked at 'Unable to generate bindings: ()', /opt/cross/rustc-1.66.0-bindgen-0.56.0/cargo/registry/src/github.com-1ecc6299db9ec823/bindgen-0.56.0/src/main.rs:54:36
   stack backtrace:
      0: rust_begin_unwind
                at /rustc/69f9c33d71c871fc16ac445211281c6e7a340943/library/std/src/panicking.rs:575:5
      1: core::panicking::panic_fmt
                at /rustc/69f9c33d71c871fc16ac445211281c6e7a340943/library/core/src/panicking.rs:65:14
      2: core::result::unwrap_failed
                at /rustc/69f9c33d71c871fc16ac445211281c6e7a340943/library/core/src/result.rs:1791:5
      3: bindgen::main
   note: Some details are omitted, run with `RUST_BACKTRACE=full` for a verbose backtrace.
   make[2]: *** [rust/Makefile:330: rust/bindings/bindings_helpers_generated.rs] Error 1 shuffle=1321394342
   make[2]: *** Deleting file 'rust/bindings/bindings_helpers_generated.rs'
   make[2]: Target 'rust/' not remade because of errors.
   make[1]: *** [Makefile:1292: prepare] Error 2 shuffle=1321394342
   make: *** [Makefile:226: __sub-make] Error 2 shuffle=1321394342
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
