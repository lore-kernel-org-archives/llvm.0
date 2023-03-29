Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66817B;
	Wed, 29 Mar 2023 12:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680091480; x=1711627480;
  h=date:from:cc:subject:message-id:mime-version;
  bh=FOpiUgg+gtmsGup/yumIEZMzKn+RhYA2r7msXMyPcTg=;
  b=F6TIAldmU4TdJwNyczYCVAVBvzekIwttqQBp9rYMDd+UUXHfjVTwqAR9
   DkOjPlUOvsUOPkP5+RBwEb1/NHrGM6Zq2R6+iM0nZ3KtZeq+cLiK6sOAI
   HeYHRkOeB1USIEzb2Pw9aVYVzkH8WbkwMAEO0DEnpOyiub2nx5kh9NAb3
   ETXcnKG5NQC2fmq20Vd9OAH0mBTt+NeXZam1euZeBRfEwok401Dfx9JC1
   pYeCO6janX5S6bpYpA169mdredKE9wzI6JtrQOkRwLMusTrrY//Q3n6m3
   fciwENU5TAqiwgcPgOwuzVCRsLfLrvdgbtRZXOdHEXGI34GD2YUlnTZ0d
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="339581784"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="339581784"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 05:03:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="686805275"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="686805275"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 29 Mar 2023 05:03:49 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phUWq-000JVM-1T;
	Wed, 29 Mar 2023 12:03:48 +0000
Date: Wed, 29 Mar 2023 20:03:15 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: clang: error: unknown argument: '-mr10k-cache-barrier=store'
Message-ID: <202303291937.QUZxNGAa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Tiezhu Yang <yangtiezhu@loongson.cn>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Masahiro Yamada <masahiroy@kernel.org>

Hi Tiezhu,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fcd476ea6a888ef6e6627f4c21a2ea8cca3e9312
commit: 048cc2378c2494519d940597629465b3ea44a96f MIPS: SGI-IP22: Remove unnecessary check of GCC option
date:   1 year, 3 months ago
config: mips-buildonly-randconfig-r006-20230329 (https://download.01.org/0day-ci/archive/20230329/202303291937.QUZxNGAa-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips64-linux-gnuabi64
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=048cc2378c2494519d940597629465b3ea44a96f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 048cc2378c2494519d940597629465b3ea44a96f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303291937.QUZxNGAa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> clang: error: unknown argument: '-mr10k-cache-barrier=store'
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   scripts/sign-file.c:89:14: warning: 'ERR_get_error_line' is deprecated [-Wdeprecated-declarations]
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
   scripts/sign-file.c:102:9: warning: 'ERR_get_error_line' is deprecated [-Wdeprecated-declarations]
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
   scripts/sign-file.c:142:3: warning: 'ENGINE_load_builtin_engines' is deprecated [-Wdeprecated-declarations]
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
   scripts/sign-file.c:144:7: warning: 'ENGINE_by_id' is deprecated [-Wdeprecated-declarations]
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
   scripts/sign-file.c:146:7: warning: 'ENGINE_init' is deprecated [-Wdeprecated-declarations]
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
   scripts/sign-file.c:151:9: warning: 'ENGINE_ctrl_cmd_string' is deprecated [-Wdeprecated-declarations]
                           ERR(!ENGINE_ctrl_cmd_string(e, "PIN", key_pass, 0),
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
   scripts/sign-file.c:153:17: warning: 'ENGINE_load_private_key' is deprecated [-Wdeprecated-declarations]
                   private_key = ENGINE_load_private_key(e, private_key_name,
                                 ^
   /usr/include/openssl/engine.h:637:1: note: 'ENGINE_load_private_key' has been explicitly marked deprecated here
   OSSL_DEPRECATEDIN_3_0
   ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
   #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
                                                   ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
   #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
                                                      ^
   7 warnings generated.
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
>> clang: error: unknown argument: '-mr10k-cache-barrier=store'
>> clang: error: unknown argument: '-mr10k-cache-barrier=store'
   make[2]: *** [scripts/Makefile.build:121: scripts/mod/devicetable-offsets.s] Error 1
   make[2]: *** [scripts/Makefile.build:287: scripts/mod/empty.o] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1196: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
