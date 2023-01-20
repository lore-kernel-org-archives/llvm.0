Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681D5256E;
	Fri, 20 Jan 2023 14:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674223832; x=1705759832;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ylB8ldRavIGt2wStGcIhC5n8dYKDfFpDMg0krXDJIRc=;
  b=gikikcThoqGmb7Ny8ryvLrfMBoq8dVBb66OMKX/PasMkHW029euTy94Q
   TGxaVtCRb5JXqBqJszfIO6TsBslLYlLGRFqBGiWlp5nUjQOzslqAMPEgG
   UBmJBxoc9x2JhM+DncizWQtTuzbhsNhdK35yeCj10vy/ZrTxbbwwXpiVr
   taRQ5ZQLBIpUA4i+eC+pcpex5v9k1Cte1LRpbAUFa46UnGVoQtnEISUNO
   ho16xJ/CUWFrjZH020aUG6r8i9+Uf0Pl+V0iTTP+I6zhJwDRtzkiB5f1D
   IA01VU1pks2ahv5Na+5CdB2qMQgQNS9cbggO8ZNLVtmV2gNAo7FHwnI+P
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="327677956"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="327677956"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 06:10:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="638165402"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="638165402"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 20 Jan 2023 06:10:13 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIs5k-0002bm-2w;
	Fri, 20 Jan 2023 14:10:04 +0000
Date: Fri, 20 Jan 2023 22:09:55 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: clang-16: error: unknown argument: '-mr10k-cache-barrier=store'
Message-ID: <202301202253.C1QOcI3X-lkp@intel.com>
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
head:   d368967cb1039b5c4cccb62b5a4b9468c50cd143
commit: 048cc2378c2494519d940597629465b3ea44a96f MIPS: SGI-IP22: Remove unnecessary check of GCC option
date:   1 year, 1 month ago
config: mips-buildonly-randconfig-r001-20230119 (https://download.01.org/0day-ci/archive/20230120/202301202253.C1QOcI3X-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
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

All errors (new ones prefixed by >>):

>> clang-16: error: unknown argument: '-mr10k-cache-barrier=store'
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
   7 warnings generated.
>> clang-16: error: unknown argument: '-mr10k-cache-barrier=store'
   make[2]: *** [scripts/Makefile.build:121: kernel/bounds.s] Error 1
   make[2]: Target 'missing-syscalls' not remade because of errors.
   make[1]: *** [arch/mips/Makefile:415: archprepare] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
