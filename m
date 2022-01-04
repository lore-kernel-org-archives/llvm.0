Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3C1173
	for <llvm@lists.linux.dev>; Tue,  4 Jan 2022 20:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641326953; x=1672862953;
  h=date:from:cc:subject:message-id:mime-version;
  bh=0RmzCvcSmx3sxtJCOfYhpjfNBLHQqVqrQgy9H2lVhOQ=;
  b=Hqws2Ftk8cxwZDESiw70xWG1phKdzYvv63GH69sgvr0d17kSFK5EM4Vp
   WqIDpQzspTWl80I7cvTgsiRtcGHU4lRLHzruQKtxGmeR+E3SYlEYX7M4W
   eE8tZzN+gl5pvxPuK2+y9gE90rgp+SHEYEfaanHN0Fk+mKWfOvMaSkKbN
   8wa7zVpj9QpvRAQeIl9WLU5YccjsyaAUs7yvTKVDtrSDW3TwxYc4bK1sr
   JOYB2UHKCjoRv6kVYXcWcfH1Rnla+I87RWkVAioQtSqJG0L7UN5d9fYhZ
   AvaXrnv6ntYpvvpGy3BLqh0dmXYfesdek5/V6q/8fud6oM4GAAA7nIf4o
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="266562097"
X-IronPort-AV: E=Sophos;i="5.88,262,1635231600"; 
   d="scan'208";a="266562097"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2022 12:09:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,262,1635231600"; 
   d="scan'208";a="472186657"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 Jan 2022 12:09:11 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n4q7K-000FpK-Pt; Tue, 04 Jan 2022 20:09:10 +0000
Date: Wed, 5 Jan 2022 04:09:04 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: kernel/module.c:4478:14: warning: variable 'exit' set but not used
Message-ID: <202201050451.suerRBnx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: linux-kernel@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Jessica Yu <jeyu@kernel.org>
CC: Sami Tolvanen <samitolvanen@google.com>
CC: Miroslav Benes <mbenes@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c9e6606c7fe92b50a02ce51dda82586ebdf99b48
commit: 0d67e332e6df72f43eaa21228daa3a79e23093f3 module: fix clang CFI with MODULE_UNLOAD=n
date:   3 months ago
config: arm64-randconfig-r022-20220101 (https://download.01.org/0day-ci/archive/20220105/202201050451.suerRBnx-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7cd109b92c72855937273a6c8ab19016fbe27d33)
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

All error/warnings (new ones prefixed by >>):

>> ld.lld: error: ./arch/arm64/kernel/vmlinux.lds:25: symbol not found: PMD_SIZE
>> ld.lld: error: ./arch/arm64/kernel/vmlinux.lds:25: symbol not found: PMD_SIZE
>> ld.lld: error: ./arch/arm64/kernel/vmlinux.lds:25: symbol not found: PMD_SIZE
>> ld.lld: error: ./arch/arm64/kernel/vmlinux.lds:25: symbol not found: PMD_SIZE
>> ld.lld: error: ./arch/arm64/kernel/vmlinux.lds:25: symbol not found: PMD_SIZE
>> ld.lld: error: ./arch/arm64/kernel/vmlinux.lds:25: symbol not found: PMD_SIZE
>> ld.lld: error: ./arch/arm64/kernel/vmlinux.lds:25: symbol not found: PMD_SIZE
>> ld.lld: error: ./arch/arm64/kernel/vmlinux.lds:25: symbol not found: PMD_SIZE
>> ld.lld: error: ./arch/arm64/kernel/vmlinux.lds:25: symbol not found: PMD_SIZE
>> ld.lld: error: ./arch/arm64/kernel/vmlinux.lds:25: symbol not found: PMD_SIZE
--
>> kernel/module.c:4478:14: warning: variable 'exit' set but not used [-Wunused-but-set-variable]
           exitcall_t *exit;
                       ^
   1 warning generated.


vim +/exit +4478 kernel/module.c

^1da177e4c3f415 Linus Torvalds 2005-04-16  4473  
cf68fffb66d60d9 Sami Tolvanen  2021-04-08  4474  static void cfi_init(struct module *mod)
cf68fffb66d60d9 Sami Tolvanen  2021-04-08  4475  {
cf68fffb66d60d9 Sami Tolvanen  2021-04-08  4476  #ifdef CONFIG_CFI_CLANG
cf68fffb66d60d9 Sami Tolvanen  2021-04-08  4477  	initcall_t *init;
cf68fffb66d60d9 Sami Tolvanen  2021-04-08 @4478  	exitcall_t *exit;
cf68fffb66d60d9 Sami Tolvanen  2021-04-08  4479  
cf68fffb66d60d9 Sami Tolvanen  2021-04-08  4480  	rcu_read_lock_sched();
cf68fffb66d60d9 Sami Tolvanen  2021-04-08  4481  	mod->cfi_check = (cfi_check_fn)
cf68fffb66d60d9 Sami Tolvanen  2021-04-08  4482  		find_kallsyms_symbol_value(mod, "__cfi_check");
cf68fffb66d60d9 Sami Tolvanen  2021-04-08  4483  	init = (initcall_t *)
cf68fffb66d60d9 Sami Tolvanen  2021-04-08  4484  		find_kallsyms_symbol_value(mod, "__cfi_jt_init_module");
cf68fffb66d60d9 Sami Tolvanen  2021-04-08  4485  	exit = (exitcall_t *)
cf68fffb66d60d9 Sami Tolvanen  2021-04-08  4486  		find_kallsyms_symbol_value(mod, "__cfi_jt_cleanup_module");
cf68fffb66d60d9 Sami Tolvanen  2021-04-08  4487  	rcu_read_unlock_sched();
cf68fffb66d60d9 Sami Tolvanen  2021-04-08  4488  
cf68fffb66d60d9 Sami Tolvanen  2021-04-08  4489  	/* Fix init/exit functions to point to the CFI jump table */
cf68fffb66d60d9 Sami Tolvanen  2021-04-08  4490  	if (init)
cf68fffb66d60d9 Sami Tolvanen  2021-04-08  4491  		mod->init = *init;
0d67e332e6df72f Arnd Bergmann  2021-09-27  4492  #ifdef CONFIG_MODULE_UNLOAD
cf68fffb66d60d9 Sami Tolvanen  2021-04-08  4493  	if (exit)
cf68fffb66d60d9 Sami Tolvanen  2021-04-08  4494  		mod->exit = *exit;
0d67e332e6df72f Arnd Bergmann  2021-09-27  4495  #endif
cf68fffb66d60d9 Sami Tolvanen  2021-04-08  4496  
cf68fffb66d60d9 Sami Tolvanen  2021-04-08  4497  	cfi_module_add(mod, module_addr_min);
cf68fffb66d60d9 Sami Tolvanen  2021-04-08  4498  #endif
cf68fffb66d60d9 Sami Tolvanen  2021-04-08  4499  }
cf68fffb66d60d9 Sami Tolvanen  2021-04-08  4500  

:::::: The code at line 4478 was first introduced by commit
:::::: cf68fffb66d60d96209446bfc4a15291dc5a5d41 add support for Clang CFI

:::::: TO: Sami Tolvanen <samitolvanen@google.com>
:::::: CC: Kees Cook <keescook@chromium.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
