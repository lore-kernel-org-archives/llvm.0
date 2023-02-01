Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FC223A1;
	Wed,  1 Feb 2023 12:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675253067; x=1706789067;
  h=date:from:cc:subject:message-id:mime-version;
  bh=uALI7WQk+PSigv6I9FFfG3Ny0i0iqAM989+diYVJOec=;
  b=VDFVRPmyuWTPuQJFRoBNj2lfYV7SFr7tDoQHJvzA9BWSnphjUOub+2Iw
   X+V+uIWzplpt+JX9JEAhVcwWffCBo9LuTHYg9k6Aire/31OJl2EnGg8/b
   phxFwtj5Ci2VL2L/3EnvqbRlnIqmhe4QVy2WdKLInk+/r4Wve1B8TMtVM
   3SVvvsv0WF2L82f6speu8/qvD4bABjlnoD356H7M4QwgK5alVSqIZYRrs
   tf7zsUlRxhek6rW0EMMg9o1Ro9hybDatQn7x34cCWWxzFyEWCgnRi0xOO
   +tJ8Sl1fEw89onbWWg0fsRVeZN/cPHUMxuq2ptAZBerTt/8miIfEur/bO
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="326778286"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="326778286"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 04:04:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="788861456"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="788861456"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 01 Feb 2023 04:04:25 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNBqi-0005PS-1I;
	Wed, 01 Feb 2023 12:04:24 +0000
Date: Wed, 1 Feb 2023 20:03:36 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: error: unknown target CPU 'loongson2f'
Message-ID: <202302011940.YTFwM22E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Nathan Chancellor <nathan@kernel.org>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Hi Nathan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c0b67534c95c537f7a506a06b98e5e85d72e2b7d
commit: 13ceb48bc19c563e05f407e663aaa4105fdfd408 MIPS: Loongson2ef: Remove unnecessary {as,cc}-option calls
date:   1 year, 2 months ago
config: mips-lemote2f_defconfig (https://download.01.org/0day-ci/archive/20230201/202302011940.YTFwM22E-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips64el-linux-gnuabi64
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=13ceb48bc19c563e05f407e663aaa4105fdfd408
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 13ceb48bc19c563e05f407e663aaa4105fdfd408
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   clang-16: warning: argument unused during compilation: '-mno-branch-likely' [-Wunused-command-line-argument]
>> error: unknown target CPU 'loongson2f'
   note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5, mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2, mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   scripts/extract-cert.c:46:14: warning: 'ERR_get_error_line' is deprecated [-Wdeprecated-declarations]
           while ((e = ERR_get_error_line(&file, &line))) {
                       ^
   /usr/include/openssl/err.h:422:1: note: 'ERR_get_error_line' has been explicitly marked deprecated here
   OSSL_DEPRECATEDIN_3_0
   ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
   #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
                                                   ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
   #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
                                                      ^
   scripts/extract-cert.c:59:9: warning: 'ERR_get_error_line' is deprecated [-Wdeprecated-declarations]
           while (ERR_get_error_line(&file, &line)) {}
                  ^
   /usr/include/openssl/err.h:422:1: note: 'ERR_get_error_line' has been explicitly marked deprecated here
   OSSL_DEPRECATEDIN_3_0
   ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
   #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
                                                   ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
   #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
                                                      ^
   scripts/extract-cert.c:124:3: warning: 'ENGINE_load_builtin_engines' is deprecated [-Wdeprecated-declarations]
                   ENGINE_load_builtin_engines();
                   ^
   /usr/include/openssl/engine.h:358:1: note: 'ENGINE_load_builtin_engines' has been explicitly marked deprecated here
   OSSL_DEPRECATEDIN_3_0 void ENGINE_load_builtin_engines(void);
   ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
   #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
                                                   ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
   #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
                                                      ^
   scripts/extract-cert.c:126:7: warning: 'ENGINE_by_id' is deprecated [-Wdeprecated-declarations]
                   e = ENGINE_by_id("pkcs11");
                       ^
   /usr/include/openssl/engine.h:336:1: note: 'ENGINE_by_id' has been explicitly marked deprecated here
   OSSL_DEPRECATEDIN_3_0 ENGINE *ENGINE_by_id(const char *id);
   ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
   #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
                                                   ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
   #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
                                                      ^
   scripts/extract-cert.c:128:7: warning: 'ENGINE_init' is deprecated [-Wdeprecated-declarations]
                   if (ENGINE_init(e))
                       ^
   /usr/include/openssl/engine.h:620:1: note: 'ENGINE_init' has been explicitly marked deprecated here
   OSSL_DEPRECATEDIN_3_0 int ENGINE_init(ENGINE *e);
   ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
   #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
                                                   ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
   #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
                                                      ^
   scripts/extract-cert.c:133:9: warning: 'ENGINE_ctrl_cmd_string' is deprecated [-Wdeprecated-declarations]
                           ERR(!ENGINE_ctrl_cmd_string(e, "PIN", key_pass, 0), "Set PKCS#11 PIN");
                                ^
   /usr/include/openssl/engine.h:478:1: note: 'ENGINE_ctrl_cmd_string' has been explicitly marked deprecated here
   OSSL_DEPRECATEDIN_3_0
   ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
   #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
                                                   ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
   #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
                                                      ^
   scripts/extract-cert.c:134:3: warning: 'ENGINE_ctrl_cmd' is deprecated [-Wdeprecated-declarations]
                   ENGINE_ctrl_cmd(e, "LOAD_CERT_CTRL", 0, &parms, NULL, 1);
                   ^
   /usr/include/openssl/engine.h:450:1: note: 'ENGINE_ctrl_cmd' has been explicitly marked deprecated here
   OSSL_DEPRECATEDIN_3_0 int ENGINE_ctrl_cmd(ENGINE *e, const char *cmd_name,
   ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
   #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
                                                   ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
   #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
                                                      ^
   7 warnings generated.
>> error: unknown target CPU 'loongson2f'
   note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5, mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2, mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
   make[2]: *** [scripts/Makefile.build:121: kernel/bounds.s] Error 1
   make[2]: Target 'missing-syscalls' not remade because of errors.
   make[1]: *** [arch/mips/Makefile:415: archprepare] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
