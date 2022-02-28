Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA22E3FF5
	for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 06:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646028598; x=1677564598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G2g/jnsNGMKF/+NzBtMT6NPS25ljpuIp5ejqkYzLzTQ=;
  b=juZlL0wzUnWK+d7/yPuMvXX9HybrFHTslkkS9gYQJWDsbdFlD7FCJBrC
   BQk8LP6KkhuAlq0BhhFJ1Nz+O9Ke65e0xYjiQJvKeQNn1w+a1o1aQUUqj
   zdsgjigPJzg2wJEGawC6qKIYmspuWOkeJ9dcttv6JEwqRePUMmjfTqP2O
   LxNBoWFIlnbHBu+S6Rv0843tZCRK8P4CR4aFhw/5upYq6dwLtTOsKyfQm
   ODMRdJ0y6N4vgPfBiLy7EgLgvvfiP4aQAq0FUIN7Y6/SguFqAb6Czce2S
   iImIiVTKU1mYVrhzuhdlzS0ExhqrTO7fx6/VXfGCtvtloUAy2bAOtO4Pe
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="316028906"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; 
   d="scan'208";a="316028906"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2022 22:09:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; 
   d="scan'208";a="801618925"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 27 Feb 2022 22:09:55 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nOZEI-00075o-B4; Mon, 28 Feb 2022 06:09:54 +0000
Date: Mon, 28 Feb 2022 14:09:42 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Jessica Yu <jeyu@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miroslav Benes <mbenes@suse.cz>
Subject: kernel/module.c:4478:14: warning: variable 'exit' set but not used
Message-ID: <202202281419.BQ8frGhi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Arnd,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7e57714cd0ad2d5bb90e50b5096a0e671dec1ef3
commit: 0d67e332e6df72f43eaa21228daa3a79e23093f3 module: fix clang CFI with MODULE_UNLOAD=n
date:   5 months ago
config: arm64-buildonly-randconfig-r001-20220228 (https://download.01.org/0day-ci/archive/20220228/202202281419.BQ8frGhi-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0d67e332e6df72f43eaa21228daa3a79e23093f3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 0d67e332e6df72f43eaa21228daa3a79e23093f3
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/module.c:4478:14: warning: variable 'exit' set but not used [-Wunused-but-set-variable]
           exitcall_t *exit;
                       ^
   kernel/module.c:1103:20: warning: unused function 'print_unload_info' [-Wunused-function]
   static inline void print_unload_info(struct seq_file *m, struct module *mod)
                      ^
   2 warnings generated.


vim +/exit +4478 kernel/module.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  4473  
cf68fffb66d60d Sami Tolvanen  2021-04-08  4474  static void cfi_init(struct module *mod)
cf68fffb66d60d Sami Tolvanen  2021-04-08  4475  {
cf68fffb66d60d Sami Tolvanen  2021-04-08  4476  #ifdef CONFIG_CFI_CLANG
cf68fffb66d60d Sami Tolvanen  2021-04-08  4477  	initcall_t *init;
cf68fffb66d60d Sami Tolvanen  2021-04-08 @4478  	exitcall_t *exit;
cf68fffb66d60d Sami Tolvanen  2021-04-08  4479  
cf68fffb66d60d Sami Tolvanen  2021-04-08  4480  	rcu_read_lock_sched();
cf68fffb66d60d Sami Tolvanen  2021-04-08  4481  	mod->cfi_check = (cfi_check_fn)
cf68fffb66d60d Sami Tolvanen  2021-04-08  4482  		find_kallsyms_symbol_value(mod, "__cfi_check");
cf68fffb66d60d Sami Tolvanen  2021-04-08  4483  	init = (initcall_t *)
cf68fffb66d60d Sami Tolvanen  2021-04-08  4484  		find_kallsyms_symbol_value(mod, "__cfi_jt_init_module");
cf68fffb66d60d Sami Tolvanen  2021-04-08  4485  	exit = (exitcall_t *)
cf68fffb66d60d Sami Tolvanen  2021-04-08  4486  		find_kallsyms_symbol_value(mod, "__cfi_jt_cleanup_module");
cf68fffb66d60d Sami Tolvanen  2021-04-08  4487  	rcu_read_unlock_sched();
cf68fffb66d60d Sami Tolvanen  2021-04-08  4488  
cf68fffb66d60d Sami Tolvanen  2021-04-08  4489  	/* Fix init/exit functions to point to the CFI jump table */
cf68fffb66d60d Sami Tolvanen  2021-04-08  4490  	if (init)
cf68fffb66d60d Sami Tolvanen  2021-04-08  4491  		mod->init = *init;
0d67e332e6df72 Arnd Bergmann  2021-09-27  4492  #ifdef CONFIG_MODULE_UNLOAD
cf68fffb66d60d Sami Tolvanen  2021-04-08  4493  	if (exit)
cf68fffb66d60d Sami Tolvanen  2021-04-08  4494  		mod->exit = *exit;
0d67e332e6df72 Arnd Bergmann  2021-09-27  4495  #endif
cf68fffb66d60d Sami Tolvanen  2021-04-08  4496  
cf68fffb66d60d Sami Tolvanen  2021-04-08  4497  	cfi_module_add(mod, module_addr_min);
cf68fffb66d60d Sami Tolvanen  2021-04-08  4498  #endif
cf68fffb66d60d Sami Tolvanen  2021-04-08  4499  }
cf68fffb66d60d Sami Tolvanen  2021-04-08  4500  

:::::: The code at line 4478 was first introduced by commit
:::::: cf68fffb66d60d96209446bfc4a15291dc5a5d41 add support for Clang CFI

:::::: TO: Sami Tolvanen <samitolvanen@google.com>
:::::: CC: Kees Cook <keescook@chromium.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
