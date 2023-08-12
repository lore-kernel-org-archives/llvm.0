Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D021CCAA;
	Sat, 12 Aug 2023 05:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691817845; x=1723353845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mZmRhDioRfC1rhTSx0ApCa9erv1Qakdde6/T35glksU=;
  b=ewtH7t0+3kJ53TQfaCHRZgGbwjDEHNE5Vz7Ws08fgtByWCkngzcNqF1X
   c4sv7dAjLIxxUPe1YbyM+g8cDwF78IfQ/BKM3c3qmVLVJVDnz/DJcTm2o
   5zqwKyd2e94lowjm6YuwZcn/ymgcK80c/ybp0aHijt6WjBe/FF5umg0yn
   sGJEq7w/QRJ3bNd2rNf6JtrPwzjX0vG5082Wljw5SoQpUH764W/83C2Oe
   bv1kCXzEN02B4OVFex/CGE46xa6QVM2drZZj1lnt8MTKNmavrRKxHVfyo
   UJsmDt18adJAiq3fspcwbTyf4+i5UgCBSh2NV5QaKwVxvech18sIUSfhH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="369275333"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="369275333"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 22:24:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="846994409"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="846994409"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 11 Aug 2023 22:24:03 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUh6Y-0008Ha-1r;
	Sat, 12 Aug 2023 05:24:02 +0000
Date: Sat, 12 Aug 2023 13:23:19 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:android13-5.10/ffa 9247/9999] kernel/module.c:4555:17:
 error: no member named 'exit' in 'struct module'
Message-ID: <202308121301.gfjTFW05-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nick,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git android13-5.10/ffa
head:   9e12ac4f9c69befe08119567c073adc938aafc4d
commit: e48efff5cb5fd63a687465347bdbb52ef98dad44 [9247/9999] ANDROID: arch/Kconfig: fix up LTO LLVM_IAS depdency
config: x86_64-randconfig-x011-20230811 (https://download.01.org/0day-ci/archive/20230812/202308121301.gfjTFW05-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121301.gfjTFW05-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308121301.gfjTFW05-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> kernel/module.c:4555:17: error: no member named 'exit' in 'struct module'
           if (exit) mod->exit = *exit;
                     ~~~  ^
   1 error generated.
--
>> kernel/cfi.c:319:6: warning: no previous prototype for function '__cfi_slowpath' [-Wmissing-prototypes]
   void cfi_slowpath_handler(uint64_t id, void *ptr, void *diag)
        ^
   kernel/cfi.c:25:30: note: expanded from macro 'cfi_slowpath_handler'
   #define cfi_slowpath_handler    __cfi_slowpath
                                   ^
   kernel/cfi.c:319:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void cfi_slowpath_handler(uint64_t id, void *ptr, void *diag)
   ^
   static 
>> kernel/cfi.c:343:6: warning: no previous prototype for function '__ubsan_handle_cfi_check_fail_abort' [-Wmissing-prototypes]
   void cfi_failure_handler(void *data, void *ptr, void *vtable)
        ^
   kernel/cfi.c:24:29: note: expanded from macro 'cfi_failure_handler'
   #define cfi_failure_handler     __ubsan_handle_cfi_check_fail_abort
                                   ^
   kernel/cfi.c:343:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void cfi_failure_handler(void *data, void *ptr, void *vtable)
   ^
   static 
>> kernel/cfi.c:349:6: warning: no previous prototype for function '__cfi_check_fail' [-Wmissing-prototypes]
   void __cfi_check_fail(void *data, void *ptr)
        ^
   kernel/cfi.c:349:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __cfi_check_fail(void *data, void *ptr)
   ^
   static 
   3 warnings generated.


vim +4555 kernel/module.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  4537  
2c351bb70ac5e5 Sami Tolvanen  2019-04-25  4538  static void cfi_init(struct module *mod)
2c351bb70ac5e5 Sami Tolvanen  2019-04-25  4539  {
2c351bb70ac5e5 Sami Tolvanen  2019-04-25  4540  #ifdef CONFIG_CFI_CLANG
2c351bb70ac5e5 Sami Tolvanen  2019-04-25  4541  	initcall_t *init;
2c351bb70ac5e5 Sami Tolvanen  2019-04-25  4542  	exitcall_t *exit;
2c351bb70ac5e5 Sami Tolvanen  2019-04-25  4543  
2c351bb70ac5e5 Sami Tolvanen  2019-04-25  4544  	rcu_read_lock_sched();
2c351bb70ac5e5 Sami Tolvanen  2019-04-25  4545  	mod->cfi_check = (cfi_check_fn)
2c351bb70ac5e5 Sami Tolvanen  2019-04-25  4546  		find_kallsyms_symbol_value(mod, "__cfi_check");
2c351bb70ac5e5 Sami Tolvanen  2019-04-25  4547  	init = (initcall_t *)
2c351bb70ac5e5 Sami Tolvanen  2019-04-25  4548  		find_kallsyms_symbol_value(mod, "__cfi_jt_init_module");
2c351bb70ac5e5 Sami Tolvanen  2019-04-25  4549  	exit = (exitcall_t *)
2c351bb70ac5e5 Sami Tolvanen  2019-04-25  4550  		find_kallsyms_symbol_value(mod, "__cfi_jt_cleanup_module");
2c351bb70ac5e5 Sami Tolvanen  2019-04-25  4551  	rcu_read_unlock_sched();
2c351bb70ac5e5 Sami Tolvanen  2019-04-25  4552  
2c351bb70ac5e5 Sami Tolvanen  2019-04-25  4553  	/* Fix init/exit functions to point to the CFI jump table */
2c351bb70ac5e5 Sami Tolvanen  2019-04-25  4554  	if (init) mod->init = *init;
2c351bb70ac5e5 Sami Tolvanen  2019-04-25 @4555  	if (exit) mod->exit = *exit;
2c351bb70ac5e5 Sami Tolvanen  2019-04-25  4556  
2c351bb70ac5e5 Sami Tolvanen  2019-04-25  4557  	cfi_module_add(mod, module_addr_min);
2c351bb70ac5e5 Sami Tolvanen  2019-04-25  4558  #endif
2c351bb70ac5e5 Sami Tolvanen  2019-04-25  4559  }
2c351bb70ac5e5 Sami Tolvanen  2019-04-25  4560  

:::::: The code at line 4555 was first introduced by commit
:::::: 2c351bb70ac5e5212f247a495199042a95b43e38 ANDROID: add support for Clang's Control Flow Integrity (CFI)

:::::: TO: Sami Tolvanen <samitolvanen@google.com>
:::::: CC: Alistair Delva <adelva@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
