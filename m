Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6651D8F73;
	Mon,  3 Jul 2023 11:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688383266; x=1719919266;
  h=date:from:cc:subject:message-id:mime-version;
  bh=jxtnnqRDvYHvbIWYsjGtw7p9POh3XYBbcogEd6yeS10=;
  b=XT/nQ0PSWZ2hL6Z4k6M1GC7E8S6nJ4WJv1JzMrWUkXjfo4j/Qf31qk3Y
   qIZ5RAR3Q+XP/1ppdBCbO49BoLn6JUXKCJyvTu6eJGpCPIMS9Ln2tL2sz
   sotWmBQZhTUVvMpP6xtHyLhuxyG1jt2WZJmbNGBC/kEacSSL1nAywMc1o
   gHSjRol8d9ObbGwtUOb6m7+5hM8/aLgtyzQBHZKhu68RuhngVZJWb0goL
   tz1lTWAB83SQZzRjxXNTvbvrdFLb+MyeEO1qQED2KsWF38JXeNdDKxzAi
   bkP1G56MzoXVBq/DUVMoGpMiEqaPqbL8RAkVxx+vYkfQ1NhXC5VbI+h/2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="360334870"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="360334870"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 04:21:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="753714026"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="753714026"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 03 Jul 2023 04:21:04 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGHc7-000HLg-05;
	Mon, 03 Jul 2023 11:21:03 +0000
Date: Mon, 3 Jul 2023 19:20:22 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: error: unknown target CPU 'loongson2f'
Message-ID: <202307031940.prkmP97f-lkp@intel.com>
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
head:   a901a3568fd26ca9c4a82d8bc5ed5b3ed844d451
commit: 13ceb48bc19c563e05f407e663aaa4105fdfd408 MIPS: Loongson2ef: Remove unnecessary {as,cc}-option calls
date:   1 year, 7 months ago
config: mips-lemote2f_defconfig (https://download.01.org/0day-ci/archive/20230703/202307031940.prkmP97f-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230703/202307031940.prkmP97f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307031940.prkmP97f-lkp@intel.com/

All errors (new ones prefixed by >>):

   clang: warning: argument unused during compilation: '-mno-branch-likely' [-Wunused-command-line-argument]
>> error: unknown target CPU 'loongson2f'
   note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5, mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2, mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   scripts/extract-cert.c:46:14: warning: 'ERR_get_error_line' is deprecated [-Wdeprecated-declarations]
      46 |         while ((e = ERR_get_error_line(&file, &line))) {
         |                     ^
   /usr/include/openssl/err.h:422:1: note: 'ERR_get_error_line' has been explicitly marked deprecated here
     422 | OSSL_DEPRECATEDIN_3_0
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/extract-cert.c:59:9: warning: 'ERR_get_error_line' is deprecated [-Wdeprecated-declarations]
      59 |         while (ERR_get_error_line(&file, &line)) {}
         |                ^
   /usr/include/openssl/err.h:422:1: note: 'ERR_get_error_line' has been explicitly marked deprecated here
     422 | OSSL_DEPRECATEDIN_3_0
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/extract-cert.c:124:3: warning: 'ENGINE_load_builtin_engines' is deprecated [-Wdeprecated-declarations]
     124 |                 ENGINE_load_builtin_engines();
         |                 ^
   /usr/include/openssl/engine.h:358:1: note: 'ENGINE_load_builtin_engines' has been explicitly marked deprecated here
     358 | OSSL_DEPRECATEDIN_3_0 void ENGINE_load_builtin_engines(void);
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/extract-cert.c:126:7: warning: 'ENGINE_by_id' is deprecated [-Wdeprecated-declarations]
     126 |                 e = ENGINE_by_id("pkcs11");
         |                     ^
   /usr/include/openssl/engine.h:336:1: note: 'ENGINE_by_id' has been explicitly marked deprecated here
     336 | OSSL_DEPRECATEDIN_3_0 ENGINE *ENGINE_by_id(const char *id);
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/extract-cert.c:128:7: warning: 'ENGINE_init' is deprecated [-Wdeprecated-declarations]
     128 |                 if (ENGINE_init(e))
         |                     ^
   /usr/include/openssl/engine.h:620:1: note: 'ENGINE_init' has been explicitly marked deprecated here
     620 | OSSL_DEPRECATEDIN_3_0 int ENGINE_init(ENGINE *e);
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/extract-cert.c:133:9: warning: 'ENGINE_ctrl_cmd_string' is deprecated [-Wdeprecated-declarations]
     133 |                         ERR(!ENGINE_ctrl_cmd_string(e, "PIN", key_pass, 0), "Set PKCS#11 PIN");
         |                              ^
   /usr/include/openssl/engine.h:478:1: note: 'ENGINE_ctrl_cmd_string' has been explicitly marked deprecated here
     478 | OSSL_DEPRECATEDIN_3_0
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/extract-cert.c:134:3: warning: 'ENGINE_ctrl_cmd' is deprecated [-Wdeprecated-declarations]
     134 |                 ENGINE_ctrl_cmd(e, "LOAD_CERT_CTRL", 0, &parms, NULL, 1);
         |                 ^
   /usr/include/openssl/engine.h:450:1: note: 'ENGINE_ctrl_cmd' has been explicitly marked deprecated here
     450 | OSSL_DEPRECATEDIN_3_0 int ENGINE_ctrl_cmd(ENGINE *e, const char *cmd_name,
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
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
https://github.com/intel/lkp-tests/wiki
