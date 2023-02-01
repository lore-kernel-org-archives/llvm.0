Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BF523DA;
	Wed,  1 Feb 2023 12:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675253668; x=1706789668;
  h=date:from:cc:subject:message-id:mime-version;
  bh=PhO8HoketapjZHuVYZZgWpkb07hhVmPmoqxGzEaHtFs=;
  b=T9TRcs4UwHeGbXGVOkjlVazi0N+FerFGxsAVANdiHzC75TsKpwVPMgaL
   016x/p4dLZwckW+1mvH7lqqEUAR3alXTehMwldoFWRWfQroxj/9RVMAYv
   XX46+scpnzbma8Ln2NCSJEhJii3NT6/lTPsLLj5QxSekVl6QkpsRYVbdX
   xf1ikHalMqzQ3xOAUx2MHuPEIz77n1ha2djm1in04wxCYYu7LGtNZhGa+
   w28vcGpxl5PhncVWZvfhrux8KfphmrZV/H2N6xwbnmbf2Fhjy17g0ltFA
   IwtyzAhU3cu9tz6OoOJ0eDOuWZEoFg7bwzCf50KHVbgNgZMsQbFqEeqWe
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="392699586"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="392699586"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 04:14:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="733540535"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="733540535"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 Feb 2023 04:14:25 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNC0O-0005Pm-2s;
	Wed, 01 Feb 2023 12:14:24 +0000
Date: Wed, 1 Feb 2023 20:14:06 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: error: unknown target CPU 'r4300'
Message-ID: <202302012018.woyx8cqR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Lauri Kasanen <cand@gmx.com>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Hi Lauri,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c0b67534c95c537f7a506a06b98e5e85d72e2b7d
commit: baec970aa5ba11099ad7a91773350c91fb2113f0 mips: Add N64 machine type
date:   2 years ago
config: mips-randconfig-r002-20230201 (https://download.01.org/0day-ci/archive/20230201/202302012018.woyx8cqR-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips64-linux-gnuabi64
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=baec970aa5ba11099ad7a91773350c91fb2113f0
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout baec970aa5ba11099ad7a91773350c91fb2113f0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> error: unknown target CPU 'r4300'
   note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5, mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2, mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
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
   7 warnings generated.
>> error: unknown target CPU 'r4300'
   note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5, mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2, mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
   make[2]: *** [scripts/Makefile.build:117: scripts/mod/devicetable-offsets.s] Error 1
>> error: unknown target CPU 'r4300'
   note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5, mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2, mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
   make[2]: *** [scripts/Makefile.build:279: scripts/mod/empty.o] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1205: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:185: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
