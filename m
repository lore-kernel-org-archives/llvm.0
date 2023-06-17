Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1420763A9;
	Sat, 17 Jun 2023 17:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687024188; x=1718560188;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sbycxg57uoGB86uUiI23QYwIYDGOD0hlv4m4PQ9S9hU=;
  b=HjZLSTyoAE8/mDz/upo/LfhHohJx5lj0nB5iYwG+4Y3qDhioUOcXDt3D
   NC8pRfqHGR6N4HVxK4ZAu+PGpAXtO07SQEIbaHHzx+vH4AxNDK9IoopDd
   sl6dS16rMk4R8dGE4EQ7p+kjth3LGt9hx+pDLAMX2Ft8bupRzbzjFuc2X
   uvVqWSdGOY/M9yUadSFDu1LfUi6XKRv12xdVYRbmcmIhzf9toNSsUBBP4
   rYQjcV6wGZfo0urYxU5IAhjxI6nT1BNu7zc/b1UdgybIl9nqQPARGmq/P
   +MJ2TcPRgqOmihEbcfIHIIotYot2yNBKPPi2zF2X7o67uwDePGa9ZTiTT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="339027921"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="339027921"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 10:49:47 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="746822637"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="746822637"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 17 Jun 2023 10:49:45 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAa3U-0002zY-2S;
	Sat, 17 Jun 2023 17:49:44 +0000
Date: Sun, 18 Jun 2023 01:49:26 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/210-gpu 72/227] rust/helpers.c:343:9: error: call
 to undeclared function 'of_node_is_root'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202306180141.AQuU46su-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Asahi,

FYI, the error/warning still remains.

tree:   https://github.com/AsahiLinux/linux bits/210-gpu
head:   496a1b061691f01602aa63d2a8027cf3020d4bb8
commit: 7b559ecc00e0abd52b48f62571279c029614d483 [72/227] rust: kernel: platform: Add Device.set_dma_masks()
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230618/202306180141.AQuU46su-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306180141.AQuU46su-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306180141.AQuU46su-lkp@intel.com/

All errors (new ones prefixed by >>):

>> rust/helpers.c:343:9: error: call to undeclared function 'of_node_is_root'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>> rust/helpers.c:343:9: error: call to undeclared function 'of_node_is_root'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   thread 'main' panicked at 'Unable to generate bindings: ()', /opt/cross/rustc-1.66.0-bindgen-0.56.0/cargo/registry/src/github.com-1ecc6299db9ec823/bindgen-0.56.0/src/main.rs:54:36
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


vim +/of_node_is_root +343 rust/helpers.c

37c9e20324e18d Asahi Lina 2023-02-16  340  
9e496b356ee8e2 Asahi Lina 2022-10-22  341  bool rust_helper_of_node_is_root(const struct device_node *np)
9e496b356ee8e2 Asahi Lina 2022-10-22  342  {
9e496b356ee8e2 Asahi Lina 2022-10-22 @343  	return of_node_is_root(np);
9e496b356ee8e2 Asahi Lina 2022-10-22  344  }
9e496b356ee8e2 Asahi Lina 2022-10-22  345  EXPORT_SYMBOL_GPL(rust_helper_of_node_is_root);
9e496b356ee8e2 Asahi Lina 2022-10-22  346  

:::::: The code at line 343 was first introduced by commit
:::::: 9e496b356ee8e25f9bee9258491aa6ae3a4f1ddf rust: of: Add OF node abstraction

:::::: TO: Asahi Lina <lina@asahilina.net>
:::::: CC: Hector Martin <marcan@marcan.st>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
