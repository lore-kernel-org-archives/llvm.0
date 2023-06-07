Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A201F7C;
	Wed,  7 Jun 2023 04:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686111337; x=1717647337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=garjfXVeBIIcHjcpTZfeesHKXnSjie09m8ZItfRzURQ=;
  b=Gi0wCso+oM2qe27uolu6YKgz8AMarj3XNMHzvZzoaRjZdpR83nIWAsOW
   F23JlR07uc0Pd74rrGN9ufC/eCJ1T57cdJC8/+bzVBcGNYcx1wfReigES
   sLnbGT3RW1XSCQIi5YWb6F+8UU0gWtT74jJIFX526JwcuitcxyOpfyUvx
   gJmF/of9TfKr8321Uv+i/BOJJO0OuQAVPKl0O3rUZo+jNrv5ZY3qVWoWU
   NSrfN2GEOYhZwxzETEoIYNrzNrWNhkSFyX6k2P5Kjwv9nc5TvBpP++xia
   C1eMCaqEO8jjjK0HCLCeBiYJ45XdjIPyDM4gfcGBTn6Qrr3NWes3A1h+Y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="359341117"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; 
   d="scan'208";a="359341117"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 21:15:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="703451536"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; 
   d="scan'208";a="703451536"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 06 Jun 2023 21:15:35 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6ka6-00066x-1l;
	Wed, 07 Jun 2023 04:15:34 +0000
Date: Wed, 7 Jun 2023 12:15:23 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/210-gpu 72/225] rust/helpers.c:343:9: error: call
 to undeclared function 'of_node_is_root'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202306071230.0M2LGWmm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/210-gpu
head:   088cf4cc64f4e0eec3c9b99e36c9f5e9a86b1173
commit: 7b559ecc00e0abd52b48f62571279c029614d483 [72/225] rust: kernel: platform: Add Device.set_dma_masks()
config: x86_64-randconfig-a011-20230606 (https://download.01.org/0day-ci/archive/20230607/202306071230.0M2LGWmm-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/7b559ecc00e0abd52b48f62571279c029614d483
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/210-gpu
        git checkout 7b559ecc00e0abd52b48f62571279c029614d483
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306071230.0M2LGWmm-lkp@intel.com/

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
   make[2]: *** [rust/Makefile:330: rust/bindings/bindings_helpers_generated.rs] Error 1 shuffle=1321394342
   make[2]: *** Deleting file 'rust/bindings/bindings_helpers_generated.rs'
   make[2]: Target 'rust/' not remade because of errors.
   make[1]: *** [Makefile:1292: prepare] Error 2 shuffle=1321394342
   make: *** [Makefile:226: __sub-make] Error 2 shuffle=1321394342
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
