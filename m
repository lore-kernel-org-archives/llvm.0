Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2E610E8;
	Sun, 28 May 2023 19:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685300896; x=1716836896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tUTKitJO4IY5CViS0fx1R6Ukg+LtFDsc2lxtY6qJ0pY=;
  b=U1L9JDobK/MBiCZp7IUrTaUubuDZtGLJRAIH8D0HE1mPw9XWRSS0Ypa8
   qY0WYhH7H+/XGxVdiP6tpH1oLd9RuGVcJdb1MZQhBmzZ+1oebYMtxSGYd
   LU5iXXaOMMUmfTgGqgQ49sKHape4t0mbRpcOpXO0rx/PcHhKNQcfefMSv
   q2kKCEcIsS7sGwJ74I+KQi0G/bYxqHjcU+Wo9j0eIZQud0xhG78cC6FWP
   ltPQXvfg6SSeDTnJQhTOvCpRHm2uMED3IcDOFSefbdEY1sk5SXdi3QNGV
   bsuykj2ntDIaYr7RaN4QxX01Ioxs4SXizKTL5AyHG15erJXghEj+LmAzd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="440906688"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="440906688"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2023 12:08:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="705816557"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="705816557"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 28 May 2023 12:08:14 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3LkT-000Kig-1k;
	Sun, 28 May 2023 19:08:13 +0000
Date: Mon, 29 May 2023 03:07:47 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:gpu/rust-wip 65/229] thread 'main' panicked at 'Unable
 to generate bindings: ()',
 /opt/cross/rustc-1.66.0-bindgen-0.56.0/cargo/registry/src/github.com-1ecc6299db9ec823/bindgen-0.56.0/src/main.rs:54:36
Message-ID: <202305290330.F58aYgvP-lkp@intel.com>
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

tree:   https://github.com/AsahiLinux/linux gpu/rust-wip
head:   98f5852ba1f7bc80f0f575fa9175ceb19aa5c8d5
commit: 8f5537727cf10e320bc6f82a059797cd9965d60a [65/229] *RFL import: kernel::io_mem
config: x86_64-randconfig-r022-20230528 (https://download.01.org/0day-ci/archive/20230529/202305290330.F58aYgvP-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/8f5537727cf10e320bc6f82a059797cd9965d60a
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux gpu/rust-wip
        git checkout 8f5537727cf10e320bc6f82a059797cd9965d60a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305290330.F58aYgvP-lkp@intel.com/

All errors (new ones prefixed by >>):

   rust/helpers.c:201:9: error: implicit declaration of function 'ioremap' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:201:9: warning: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
   rust/helpers.c:207:9: error: implicit declaration of function 'readb' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:213:9: error: implicit declaration of function 'readw' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:219:9: error: implicit declaration of function 'readl' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:226:9: error: implicit declaration of function 'readq' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:233:2: error: implicit declaration of function 'writeb' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:239:2: error: implicit declaration of function 'writew' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:245:2: error: implicit declaration of function 'writel' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:252:2: error: implicit declaration of function 'writeq' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:259:9: error: implicit declaration of function 'readb_relaxed' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:265:9: error: implicit declaration of function 'readw_relaxed' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:271:9: error: implicit declaration of function 'readl_relaxed' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:278:9: error: implicit declaration of function 'readq_relaxed' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:285:2: error: implicit declaration of function 'writeb_relaxed' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:291:2: error: implicit declaration of function 'writew_relaxed' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:297:2: error: implicit declaration of function 'writel_relaxed' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:304:2: error: implicit declaration of function 'writeq_relaxed' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:311:2: error: implicit declaration of function 'memcpy_fromio' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:201:9: error: implicit declaration of function 'ioremap' is invalid in C99 [-Wimplicit-function-declaration], err: true
   rust/helpers.c:201:9: warning: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion], err: false
   rust/helpers.c:207:9: error: implicit declaration of function 'readb' is invalid in C99 [-Wimplicit-function-declaration], err: true
   rust/helpers.c:213:9: error: implicit declaration of function 'readw' is invalid in C99 [-Wimplicit-function-declaration], err: true
   rust/helpers.c:219:9: error: implicit declaration of function 'readl' is invalid in C99 [-Wimplicit-function-declaration], err: true
   rust/helpers.c:226:9: error: implicit declaration of function 'readq' is invalid in C99 [-Wimplicit-function-declaration], err: true
   rust/helpers.c:233:2: error: implicit declaration of function 'writeb' is invalid in C99 [-Wimplicit-function-declaration], err: true
   rust/helpers.c:239:2: error: implicit declaration of function 'writew' is invalid in C99 [-Wimplicit-function-declaration], err: true
   rust/helpers.c:245:2: error: implicit declaration of function 'writel' is invalid in C99 [-Wimplicit-function-declaration], err: true
   rust/helpers.c:252:2: error: implicit declaration of function 'writeq' is invalid in C99 [-Wimplicit-function-declaration], err: true
   rust/helpers.c:259:9: error: implicit declaration of function 'readb_relaxed' is invalid in C99 [-Wimplicit-function-declaration], err: true
   rust/helpers.c:265:9: error: implicit declaration of function 'readw_relaxed' is invalid in C99 [-Wimplicit-function-declaration], err: true
   rust/helpers.c:271:9: error: implicit declaration of function 'readl_relaxed' is invalid in C99 [-Wimplicit-function-declaration], err: true
   rust/helpers.c:278:9: error: implicit declaration of function 'readq_relaxed' is invalid in C99 [-Wimplicit-function-declaration], err: true
   rust/helpers.c:285:2: error: implicit declaration of function 'writeb_relaxed' is invalid in C99 [-Wimplicit-function-declaration], err: true
   rust/helpers.c:291:2: error: implicit declaration of function 'writew_relaxed' is invalid in C99 [-Wimplicit-function-declaration], err: true
   rust/helpers.c:297:2: error: implicit declaration of function 'writel_relaxed' is invalid in C99 [-Wimplicit-function-declaration], err: true
   rust/helpers.c:304:2: error: implicit declaration of function 'writeq_relaxed' is invalid in C99 [-Wimplicit-function-declaration], err: true
   rust/helpers.c:311:2: error: implicit declaration of function 'memcpy_fromio' is invalid in C99 [-Wimplicit-function-declaration], err: true
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
   make[2]: *** [rust/Makefile:330: rust/bindings/bindings_helpers_generated.rs] Error 1
   make[2]: *** Deleting file 'rust/bindings/bindings_helpers_generated.rs'
   make[2]: Target 'rust/' not remade because of errors.
   make[1]: *** [Makefile:1292: prepare] Error 2
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
