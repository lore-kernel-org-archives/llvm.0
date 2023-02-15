Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6827B;
	Wed, 15 Feb 2023 16:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676478835; x=1708014835;
  h=date:from:cc:subject:message-id:mime-version;
  bh=lJq4zpdzqBTInC/73K2ZM5laCR0iSrG0NNEeeiKdvMg=;
  b=m1yf5WEppou9nJCHiMD8CJEef//sYgutGykZ6PbJLB1w4u4NsdBDFIJN
   hNFFGazhYgay5vBXLE7qgHHBLzETCWYAAAavY8hyIyvq9Ji5Iv5oKAjax
   8qwSztcS/RtqB6dyiF7YMHiGQ5gvO8BCCdLd64rVB67TrBLnyjfwcaARM
   NGvmKXTtnnEX9Mm1bS2zvgpjNEYbWMAFL4lQw80h4xWeI+5BDlLp37wWe
   HAMchbuWb1ALAUCsL0FSTjpkI6KlOegKHPXNUqAt6bQvqteR3jQmGxge3
   p27KNwYmNdsyZCibhBMSRhNk8c4eh2GeGxXbT5HByRLBcGc64yI0cCnNQ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="311837260"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; 
   d="scan'208";a="311837260"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 08:33:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="733362757"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; 
   d="scan'208";a="733362757"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 15 Feb 2023 08:33:53 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSKjA-0009YP-2p;
	Wed, 15 Feb 2023 16:33:52 +0000
Date: Thu, 16 Feb 2023 00:32:55 +0800
From: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/210-gpu 1/378] error[E0425]: cannot find value
 `my_usize` in this scope
Message-ID: <202302160022.2BuzQnXh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/210-gpu
head:   2ed50c917eececb8aa67fbba3b7d3c375ac7b532
commit: 398660b73e99a5c3965d24779c9242f087172d76 [1/378] Merge remote-tracking branch 'rfl/rust' into bases/210-gpu
config: x86_64-randconfig-a001-20230213 (https://download.01.org/0day-ci/archive/20230216/202302160022.2BuzQnXh-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/398660b73e99a5c3965d24779c9242f087172d76
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/210-gpu
        git checkout 398660b73e99a5c3965d24779c9242f087172d76
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302160022.2BuzQnXh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0050]: method `init` has 1 parameter but the declaration in trait `kernel::Module::init` has 2
   --> samples/rust/rust_print.rs:19:22
   |
   19 |     fn init(_module: &'static ThisModule) -> Result<Self> {
   |                      ^^^^^^^^^^^^^^^^^^^ expected 2 parameters, found 1
   |
   = note: `init` from trait: `fn(&'static kernel::str::CStr, &'static kernel::ThisModule) -> core::result::Result<Self, kernel::Error>`
--
>> error: proc macro panicked
   --> samples/rust/rust_module_parameters.rs:7:1
   |
   7  | / module! {
   8  | |     type: RustModuleParameters,
   9  | |     name: "rust_module_parameters",
   10 | |     author: "Rust for Linux Contributors",
   ...  |
   39 | |     },
   40 | | }
   | |_^
   |
   = help: message: Expected default param value
--
>> error[E0425]: cannot find value `__LOG_PREFIX` in the crate root
   --> samples/rust/rust_module_parameters.rs:46:9
   |
   46 |         pr_info!("Rust module parameters sample (init)n");
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ not found in the crate root
   |
   = note: this error originates in the macro `$crate::print_macro` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find value `my_usize` in this scope
   --> samples/rust/rust_module_parameters.rs:57:44
   |
   57 |             pr_info!("  my_usize:   {}n", my_usize.read(&lock));
   |                                            ^^^^^^^^ not found in this scope
--
>> error[E0425]: cannot find value `__LOG_PREFIX` in the crate root
   --> samples/rust/rust_module_parameters.rs:58:13
   |
   58 |             pr_info!("  my_array:   {:?}n", my_array.read());
   |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ not found in the crate root
   |
   = note: this error originates in the macro `$crate::print_macro` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find value `my_array` in this scope
   --> samples/rust/rust_module_parameters.rs:58:46
   |
   58 |             pr_info!("  my_array:   {:?}n", my_array.read());
   |                                              ^^^^^^^^ not found in this scope
--
>> error[E0425]: cannot find value `__LOG_PREFIX` in the crate root
   --> samples/rust/rust_module_parameters.rs:67:9
   |
   67 |         pr_info!("Rust module parameters sample (exit)n");
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ not found in the crate root
   |
   = note: this error originates in the macro `$crate::print_macro` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find value `__LOG_PREFIX` in the crate root
   --> samples/rust/rust_module_parameters.rs:50:13
   |
   50 |             pr_info!("Parameters:n");
   |             ^^^^^^^^^^^^^^^^^^^^^^^^^ not found in the crate root
   |
   = note: this error originates in the macro `$crate::print_macro` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find value `__LOG_PREFIX` in the crate root
   --> samples/rust/rust_module_parameters.rs:51:13
   |
   51 |             pr_info!("  my_bool:    {}n", my_bool.read());
   |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ not found in the crate root
   |
   = note: this error originates in the macro `$crate::print_macro` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find value `my_bool` in this scope
   --> samples/rust/rust_module_parameters.rs:51:44
   |
   51 |             pr_info!("  my_bool:    {}n", my_bool.read());
   |                                            ^^^^^^^ not found in this scope
--
>> error[E0425]: cannot find value `__LOG_PREFIX` in the crate root
   --> samples/rust/rust_module_parameters.rs:52:13
   |
   52 |             pr_info!("  my_i32:     {}n", my_i32.read(&lock));
   |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ not found in the crate root
   |
   = note: this error originates in the macro `$crate::print_macro` (in Nightly builds, run with -Z macro-backtrace for more info)
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
