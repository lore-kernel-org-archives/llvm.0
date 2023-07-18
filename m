Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DBC19C;
	Tue, 18 Jul 2023 00:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689639483; x=1721175483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ktqirxn6rc74+fO3biCfQ7w0Np88xUdfhOhjPE6bcvo=;
  b=no16W+wuZJ8s+FErFHWDKHWel3bGOna5ech4ybDmghRcf62Wv3SRIMqn
   lwzBuukv47lfOaEoFrWaM5rkHLd2FotEsJbwT6FdANYxgMucn+/1CCv4d
   9U0K2+lThlf0ENBYOXfOfUVCZ0qh2n11rm2yjM80NvYpo4ET2b/D7Fmge
   e5uA73QbXt9anQq28EpbGqtRzHd88ZtnRW6l+8rIdJQVLZKMxf7uwGf91
   bl1gyaDYXtU1Mx3FDVPeTSVYEIm8zVDdkC/Wyd3eUgy4/tQDHR+I8bTxJ
   eKkjhb1um9Jb1mUMpi19uLBScishBdSsNvcGi4M4RpcOp2a3qbg/ysiy2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="363534981"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="363534981"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 17:17:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="726734067"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="726734067"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 17 Jul 2023 17:17:13 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLYOu-000A0q-2t;
	Tue, 18 Jul 2023 00:17:12 +0000
Date: Tue, 18 Jul 2023 08:17:08 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-nonmm-unstable 35/36]
 arch/arm64/kernel/paravirt.c:102:2: error: use of undeclared identifier
 '___res'
Message-ID: <202307180822.ixtEtD76-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   643039cbab79355ceb1ce9a91e2a7483a44bec05
commit: fceebffabbb6a664115469aac95d243048b09d22 [35/36] arm64: smccc: replace custom COUNT_ARGS() & CONCATENATE() implementations
config: arm64-randconfig-r036-20230717 (https://download.01.org/0day-ci/archive/20230718/202307180822.ixtEtD76-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307180822.ixtEtD76-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307180822.ixtEtD76-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/paravirt.c:102:2: error: use of undeclared identifier '__declare_arg_2'
     102 |         arm_smccc_1_1_invoke(ARM_SMCCC_HV_PV_TIME_ST, &res);
         |         ^
   include/linux/arm-smccc.h:563:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:526:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:485:3: note: expanded from macro '__arm_smccc_1_1'
     485 |                 CONCATENATE(__declare_arg_, COUNT_ARGS(__VA_ARGS__));   \
         |                 ^
   include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^
   include/linux/args.h:25:24: note: expanded from macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   <scratch space>:146:1: note: expanded from here
     146 | __declare_arg_2
         | ^
>> arch/arm64/kernel/paravirt.c:102:2: error: use of undeclared identifier 'arg0'
   include/linux/arm-smccc.h:563:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:526:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:489:11: note: expanded from macro '__arm_smccc_1_1'
     489 |                              : CONCATENATE(__constraint_read_,          \
         |                                ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/arm-smccc.h:419:29: note: expanded from macro '__constraint_read_2'
     419 | #define __constraint_read_2     __constraint_read_1, "r" (arg2)
         |                                 ^
   include/linux/arm-smccc.h:418:29: note: expanded from macro '__constraint_read_1'
     418 | #define __constraint_read_1     __constraint_read_0, "r" (arg1)
         |                                 ^
   include/linux/arm-smccc.h:417:34: note: expanded from macro '__constraint_read_0'
     417 | #define __constraint_read_0     "r" (arg0)
         |                                      ^
>> arch/arm64/kernel/paravirt.c:102:2: error: use of undeclared identifier '___res'
   include/linux/arm-smccc.h:563:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:526:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:492:7: note: expanded from macro '__arm_smccc_1_1'
     492 |                 if (___res)                                             \
         |                     ^
>> arch/arm64/kernel/paravirt.c:102:2: error: use of undeclared identifier '___res'
   include/linux/arm-smccc.h:563:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:526:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:493:23: note: expanded from macro '__arm_smccc_1_1'
     493 |                         *___res = (typeof(*___res)){r0, r1, r2, r3};    \
         |                                            ^
>> arch/arm64/kernel/paravirt.c:102:2: error: use of undeclared identifier '___res'
   include/linux/arm-smccc.h:563:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:526:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:493:5: note: expanded from macro '__arm_smccc_1_1'
     493 |                         *___res = (typeof(*___res)){r0, r1, r2, r3};    \
         |                          ^
>> arch/arm64/kernel/paravirt.c:102:2: error: use of undeclared identifier '__declare_arg_2'
   include/linux/arm-smccc.h:566:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     566 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:510:32: note: expanded from macro 'arm_smccc_1_1_smc'
     510 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:485:3: note: expanded from macro '__arm_smccc_1_1'
     485 |                 CONCATENATE(__declare_arg_, COUNT_ARGS(__VA_ARGS__));   \
         |                 ^
   include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^
   include/linux/args.h:25:24: note: expanded from macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   <scratch space>:154:1: note: expanded from here
     154 | __declare_arg_2
         | ^
>> arch/arm64/kernel/paravirt.c:102:2: error: use of undeclared identifier 'arg0'
   include/linux/arm-smccc.h:566:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     566 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:510:32: note: expanded from macro 'arm_smccc_1_1_smc'
     510 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:489:11: note: expanded from macro '__arm_smccc_1_1'
     489 |                              : CONCATENATE(__constraint_read_,          \
         |                                ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/arm-smccc.h:419:29: note: expanded from macro '__constraint_read_2'
     419 | #define __constraint_read_2     __constraint_read_1, "r" (arg2)
         |                                 ^
   include/linux/arm-smccc.h:418:29: note: expanded from macro '__constraint_read_1'
     418 | #define __constraint_read_1     __constraint_read_0, "r" (arg1)
         |                                 ^
   include/linux/arm-smccc.h:417:34: note: expanded from macro '__constraint_read_0'
     417 | #define __constraint_read_0     "r" (arg0)
         |                                      ^
>> arch/arm64/kernel/paravirt.c:102:2: error: use of undeclared identifier '___res'
   include/linux/arm-smccc.h:566:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     566 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:510:32: note: expanded from macro 'arm_smccc_1_1_smc'
     510 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:492:7: note: expanded from macro '__arm_smccc_1_1'
     492 |                 if (___res)                                             \
         |                     ^
>> arch/arm64/kernel/paravirt.c:102:2: error: use of undeclared identifier '___res'
   include/linux/arm-smccc.h:566:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     566 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:510:32: note: expanded from macro 'arm_smccc_1_1_smc'
     510 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:493:23: note: expanded from macro '__arm_smccc_1_1'
     493 |                         *___res = (typeof(*___res)){r0, r1, r2, r3};    \
         |                                            ^
>> arch/arm64/kernel/paravirt.c:102:2: error: use of undeclared identifier '___res'
   include/linux/arm-smccc.h:566:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     566 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:510:32: note: expanded from macro 'arm_smccc_1_1_smc'
     510 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:493:5: note: expanded from macro '__arm_smccc_1_1'
     493 |                         *___res = (typeof(*___res)){r0, r1, r2, r3};    \
         |                          ^
>> arch/arm64/kernel/paravirt.c:102:2: error: use of undeclared identifier '__declare_arg_2'
   include/linux/arm-smccc.h:569:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     569 |                         __fail_smccc_1_1(__VA_ARGS__);                  \
         |                         ^
   include/linux/arm-smccc.h:535:3: note: expanded from macro '__fail_smccc_1_1'
     535 |                 CONCATENATE(__declare_arg_, COUNT_ARGS(__VA_ARGS__));   \
         |                 ^
   include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^
   include/linux/args.h:25:24: note: expanded from macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   <scratch space>:162:1: note: expanded from here
     162 | __declare_arg_2
         | ^
>> arch/arm64/kernel/paravirt.c:102:2: error: use of undeclared identifier 'arg0'
   include/linux/arm-smccc.h:569:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     569 |                         __fail_smccc_1_1(__VA_ARGS__);                  \
         |                         ^
   include/linux/arm-smccc.h:537:10: note: expanded from macro '__fail_smccc_1_1'
     537 |                      : CONCATENATE(__constraint_read_,                  \
         |                        ^
   include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/arm-smccc.h:419:29: note: expanded from macro '__constraint_read_2'
     419 | #define __constraint_read_2     __constraint_read_1, "r" (arg2)
         |                                 ^
   include/linux/arm-smccc.h:418:29: note: expanded from macro '__constraint_read_1'
     418 | #define __constraint_read_1     __constraint_read_0, "r" (arg1)
         |                                 ^
   include/linux/arm-smccc.h:417:34: note: expanded from macro '__constraint_read_0'
     417 | #define __constraint_read_0     "r" (arg0)
         |                                      ^
>> arch/arm64/kernel/paravirt.c:102:2: error: use of undeclared identifier '___res'
   include/linux/arm-smccc.h:569:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     569 |                         __fail_smccc_1_1(__VA_ARGS__);                  \
         |                         ^
   include/linux/arm-smccc.h:540:7: note: expanded from macro '__fail_smccc_1_1'
     540 |                 if (___res)                                             \
         |                     ^
>> arch/arm64/kernel/paravirt.c:102:2: error: use of undeclared identifier '___res'
   include/linux/arm-smccc.h:569:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     569 |                         __fail_smccc_1_1(__VA_ARGS__);                  \
         |                         ^
   include/linux/arm-smccc.h:541:4: note: expanded from macro '__fail_smccc_1_1'
     541 |                         ___res->a0 = SMCCC_RET_NOT_SUPPORTED;           \
         |                         ^
>> arch/arm64/kernel/paravirt.c:144:2: error: use of undeclared identifier '__declare_arg_3'
     144 |         arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
         |         ^
   include/linux/arm-smccc.h:563:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:526:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:485:3: note: expanded from macro '__arm_smccc_1_1'
     485 |                 CONCATENATE(__declare_arg_, COUNT_ARGS(__VA_ARGS__));   \
         |                 ^
   include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^
   include/linux/args.h:25:24: note: expanded from macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   <scratch space>:178:1: note: expanded from here
     178 | __declare_arg_3
         | ^
   arch/arm64/kernel/paravirt.c:144:2: error: use of undeclared identifier 'arg0'
   include/linux/arm-smccc.h:563:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:526:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:489:11: note: expanded from macro '__arm_smccc_1_1'
     489 |                              : CONCATENATE(__constraint_read_,          \
         |                                ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/arm-smccc.h:419:29: note: expanded from macro '__constraint_read_2'
     419 | #define __constraint_read_2     __constraint_read_1, "r" (arg2)
         |                                 ^
   include/linux/arm-smccc.h:418:29: note: expanded from macro '__constraint_read_1'
     418 | #define __constraint_read_1     __constraint_read_0, "r" (arg1)
         |                                 ^
   include/linux/arm-smccc.h:417:34: note: expanded from macro '__constraint_read_0'
     417 | #define __constraint_read_0     "r" (arg0)
         |                                      ^
   arch/arm64/kernel/paravirt.c:144:2: error: use of undeclared identifier '___res'
   include/linux/arm-smccc.h:563:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:526:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:492:7: note: expanded from macro '__arm_smccc_1_1'
     492 |                 if (___res)                                             \
         |                     ^
   arch/arm64/kernel/paravirt.c:144:2: error: use of undeclared identifier '___res'
   include/linux/arm-smccc.h:563:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:526:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:493:23: note: expanded from macro '__arm_smccc_1_1'
     493 |                         *___res = (typeof(*___res)){r0, r1, r2, r3};    \
         |                                            ^
   arch/arm64/kernel/paravirt.c:144:2: error: use of undeclared identifier '___res'
   include/linux/arm-smccc.h:563:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:526:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:493:5: note: expanded from macro '__arm_smccc_1_1'
     493 |                         *___res = (typeof(*___res)){r0, r1, r2, r3};    \
         |                          ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
>> arch/arm64/kernel/proton-pack.c:186:2: error: use of undeclared identifier '__declare_arg_3'
     186 |         arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
         |         ^
   include/linux/arm-smccc.h:563:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:526:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:485:3: note: expanded from macro '__arm_smccc_1_1'
     485 |                 CONCATENATE(__declare_arg_, COUNT_ARGS(__VA_ARGS__));   \
         |                 ^
   include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^
   include/linux/args.h:25:24: note: expanded from macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   <scratch space>:164:1: note: expanded from here
     164 | __declare_arg_3
         | ^
>> arch/arm64/kernel/proton-pack.c:186:2: error: use of undeclared identifier 'arg0'
   include/linux/arm-smccc.h:563:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:526:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:489:11: note: expanded from macro '__arm_smccc_1_1'
     489 |                              : CONCATENATE(__constraint_read_,          \
         |                                ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/arm-smccc.h:419:29: note: expanded from macro '__constraint_read_2'
     419 | #define __constraint_read_2     __constraint_read_1, "r" (arg2)
         |                                 ^
   include/linux/arm-smccc.h:418:29: note: expanded from macro '__constraint_read_1'
     418 | #define __constraint_read_1     __constraint_read_0, "r" (arg1)
         |                                 ^
   include/linux/arm-smccc.h:417:34: note: expanded from macro '__constraint_read_0'
     417 | #define __constraint_read_0     "r" (arg0)
         |                                      ^
>> arch/arm64/kernel/proton-pack.c:186:2: error: use of undeclared identifier '___res'
   include/linux/arm-smccc.h:563:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:526:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:492:7: note: expanded from macro '__arm_smccc_1_1'
     492 |                 if (___res)                                             \
         |                     ^
>> arch/arm64/kernel/proton-pack.c:186:2: error: use of undeclared identifier '___res'
   include/linux/arm-smccc.h:563:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:526:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:493:23: note: expanded from macro '__arm_smccc_1_1'
     493 |                         *___res = (typeof(*___res)){r0, r1, r2, r3};    \
         |                                            ^
>> arch/arm64/kernel/proton-pack.c:186:2: error: use of undeclared identifier '___res'
   include/linux/arm-smccc.h:563:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:526:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:493:5: note: expanded from macro '__arm_smccc_1_1'
     493 |                         *___res = (typeof(*___res)){r0, r1, r2, r3};    \
         |                          ^
>> arch/arm64/kernel/proton-pack.c:186:2: error: use of undeclared identifier '__declare_arg_3'
   include/linux/arm-smccc.h:566:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     566 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:510:32: note: expanded from macro 'arm_smccc_1_1_smc'
     510 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:485:3: note: expanded from macro '__arm_smccc_1_1'
     485 |                 CONCATENATE(__declare_arg_, COUNT_ARGS(__VA_ARGS__));   \
         |                 ^
   include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^
   include/linux/args.h:25:24: note: expanded from macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   <scratch space>:172:1: note: expanded from here
     172 | __declare_arg_3
         | ^
>> arch/arm64/kernel/proton-pack.c:186:2: error: use of undeclared identifier 'arg0'
   include/linux/arm-smccc.h:566:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     566 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:510:32: note: expanded from macro 'arm_smccc_1_1_smc'
     510 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:489:11: note: expanded from macro '__arm_smccc_1_1'
     489 |                              : CONCATENATE(__constraint_read_,          \
         |                                ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/arm-smccc.h:419:29: note: expanded from macro '__constraint_read_2'
     419 | #define __constraint_read_2     __constraint_read_1, "r" (arg2)
         |                                 ^
   include/linux/arm-smccc.h:418:29: note: expanded from macro '__constraint_read_1'
     418 | #define __constraint_read_1     __constraint_read_0, "r" (arg1)
         |                                 ^
   include/linux/arm-smccc.h:417:34: note: expanded from macro '__constraint_read_0'
     417 | #define __constraint_read_0     "r" (arg0)
         |                                      ^
>> arch/arm64/kernel/proton-pack.c:186:2: error: use of undeclared identifier '___res'
   include/linux/arm-smccc.h:566:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     566 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:510:32: note: expanded from macro 'arm_smccc_1_1_smc'
     510 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:492:7: note: expanded from macro '__arm_smccc_1_1'
     492 |                 if (___res)                                             \
         |                     ^
>> arch/arm64/kernel/proton-pack.c:186:2: error: use of undeclared identifier '___res'
   include/linux/arm-smccc.h:566:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     566 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:510:32: note: expanded from macro 'arm_smccc_1_1_smc'
     510 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:493:23: note: expanded from macro '__arm_smccc_1_1'
     493 |                         *___res = (typeof(*___res)){r0, r1, r2, r3};    \
         |                                            ^
>> arch/arm64/kernel/proton-pack.c:186:2: error: use of undeclared identifier '___res'
   include/linux/arm-smccc.h:566:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     566 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:510:32: note: expanded from macro 'arm_smccc_1_1_smc'
     510 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:493:5: note: expanded from macro '__arm_smccc_1_1'
     493 |                         *___res = (typeof(*___res)){r0, r1, r2, r3};    \
         |                          ^
>> arch/arm64/kernel/proton-pack.c:186:2: error: use of undeclared identifier '__declare_arg_3'
   include/linux/arm-smccc.h:569:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     569 |                         __fail_smccc_1_1(__VA_ARGS__);                  \
         |                         ^
   include/linux/arm-smccc.h:535:3: note: expanded from macro '__fail_smccc_1_1'
     535 |                 CONCATENATE(__declare_arg_, COUNT_ARGS(__VA_ARGS__));   \
         |                 ^
   include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^
   include/linux/args.h:25:24: note: expanded from macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   <scratch space>:180:1: note: expanded from here
     180 | __declare_arg_3
         | ^
>> arch/arm64/kernel/proton-pack.c:186:2: error: use of undeclared identifier 'arg0'
   include/linux/arm-smccc.h:569:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     569 |                         __fail_smccc_1_1(__VA_ARGS__);                  \
         |                         ^
   include/linux/arm-smccc.h:537:10: note: expanded from macro '__fail_smccc_1_1'
     537 |                      : CONCATENATE(__constraint_read_,                  \
         |                        ^
   include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/arm-smccc.h:419:29: note: expanded from macro '__constraint_read_2'
     419 | #define __constraint_read_2     __constraint_read_1, "r" (arg2)
         |                                 ^
   include/linux/arm-smccc.h:418:29: note: expanded from macro '__constraint_read_1'
     418 | #define __constraint_read_1     __constraint_read_0, "r" (arg1)
         |                                 ^
   include/linux/arm-smccc.h:417:34: note: expanded from macro '__constraint_read_0'
     417 | #define __constraint_read_0     "r" (arg0)
         |                                      ^
>> arch/arm64/kernel/proton-pack.c:186:2: error: use of undeclared identifier '___res'
   include/linux/arm-smccc.h:569:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     569 |                         __fail_smccc_1_1(__VA_ARGS__);                  \
         |                         ^
   include/linux/arm-smccc.h:540:7: note: expanded from macro '__fail_smccc_1_1'
     540 |                 if (___res)                                             \
         |                     ^
>> arch/arm64/kernel/proton-pack.c:186:2: error: use of undeclared identifier '___res'
   include/linux/arm-smccc.h:569:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     569 |                         __fail_smccc_1_1(__VA_ARGS__);                  \
         |                         ^
   include/linux/arm-smccc.h:541:4: note: expanded from macro '__fail_smccc_1_1'
     541 |                         ___res->a0 = SMCCC_RET_NOT_SUPPORTED;           \
         |                         ^
>> arch/arm64/kernel/proton-pack.c:239:2: error: use of undeclared identifier '__declare_arg_2'
     239 |         arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_1, NULL);
         |         ^
   include/linux/arm-smccc.h:510:32: note: expanded from macro 'arm_smccc_1_1_smc'
     510 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:485:3: note: expanded from macro '__arm_smccc_1_1'
     485 |                 CONCATENATE(__declare_arg_, COUNT_ARGS(__VA_ARGS__));   \
         |                 ^
   include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^
   include/linux/args.h:25:24: note: expanded from macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   <scratch space>:194:1: note: expanded from here
     194 | __declare_arg_2
         | ^
   arch/arm64/kernel/proton-pack.c:239:2: error: use of undeclared identifier 'arg0'
   include/linux/arm-smccc.h:510:32: note: expanded from macro 'arm_smccc_1_1_smc'
     510 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:489:11: note: expanded from macro '__arm_smccc_1_1'
     489 |                              : CONCATENATE(__constraint_read_,          \
         |                                ^
   include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/arm-smccc.h:419:29: note: expanded from macro '__constraint_read_2'
     419 | #define __constraint_read_2     __constraint_read_1, "r" (arg2)
         |                                 ^
   include/linux/arm-smccc.h:418:29: note: expanded from macro '__constraint_read_1'
     418 | #define __constraint_read_1     __constraint_read_0, "r" (arg1)
         |                                 ^
   include/linux/arm-smccc.h:417:34: note: expanded from macro '__constraint_read_0'
     417 | #define __constraint_read_0     "r" (arg0)
         |                                      ^
   arch/arm64/kernel/proton-pack.c:239:2: error: use of undeclared identifier '___res'
   include/linux/arm-smccc.h:510:32: note: expanded from macro 'arm_smccc_1_1_smc'
     510 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:492:7: note: expanded from macro '__arm_smccc_1_1'
     492 |                 if (___res)                                             \
         |                     ^
   arch/arm64/kernel/proton-pack.c:239:2: error: use of undeclared identifier '___res'
   include/linux/arm-smccc.h:510:32: note: expanded from macro 'arm_smccc_1_1_smc'
     510 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:493:23: note: expanded from macro '__arm_smccc_1_1'
     493 |                         *___res = (typeof(*___res)){r0, r1, r2, r3};    \
         |                                            ^
   arch/arm64/kernel/proton-pack.c:239:2: error: use of undeclared identifier '___res'
   include/linux/arm-smccc.h:510:32: note: expanded from macro 'arm_smccc_1_1_smc'
     510 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:493:5: note: expanded from macro '__arm_smccc_1_1'
     493 |                         *___res = (typeof(*___res)){r0, r1, r2, r3};    \
         |                          ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
..


vim +/___res +102 arch/arm64/kernel/paravirt.c

e0685fa228fdaf Steven Price            2019-10-21   93  
75df529bec9110 Andrew Jones            2020-09-16   94  static int stolen_time_cpu_online(unsigned int cpu)
e0685fa228fdaf Steven Price            2019-10-21   95  {
19bef63f951e47 Prakruthi Deepak Heragu 2022-05-13   96  	struct pvclock_vcpu_stolen_time *kaddr = NULL;
e0685fa228fdaf Steven Price            2019-10-21   97  	struct pv_time_stolen_time_region *reg;
e0685fa228fdaf Steven Price            2019-10-21   98  	struct arm_smccc_res res;
e0685fa228fdaf Steven Price            2019-10-21   99  
e0685fa228fdaf Steven Price            2019-10-21  100  	reg = this_cpu_ptr(&stolen_time_region);
e0685fa228fdaf Steven Price            2019-10-21  101  
e0685fa228fdaf Steven Price            2019-10-21 @102  	arm_smccc_1_1_invoke(ARM_SMCCC_HV_PV_TIME_ST, &res);
e0685fa228fdaf Steven Price            2019-10-21  103  
e0685fa228fdaf Steven Price            2019-10-21  104  	if (res.a0 == SMCCC_RET_NOT_SUPPORTED)
e0685fa228fdaf Steven Price            2019-10-21  105  		return -EINVAL;
e0685fa228fdaf Steven Price            2019-10-21  106  
19bef63f951e47 Prakruthi Deepak Heragu 2022-05-13  107  	kaddr = memremap(res.a0,
e0685fa228fdaf Steven Price            2019-10-21  108  			      sizeof(struct pvclock_vcpu_stolen_time),
e0685fa228fdaf Steven Price            2019-10-21  109  			      MEMREMAP_WB);
e0685fa228fdaf Steven Price            2019-10-21  110  
19bef63f951e47 Prakruthi Deepak Heragu 2022-05-13  111  	rcu_assign_pointer(reg->kaddr, kaddr);
19bef63f951e47 Prakruthi Deepak Heragu 2022-05-13  112  
e0685fa228fdaf Steven Price            2019-10-21  113  	if (!reg->kaddr) {
e0685fa228fdaf Steven Price            2019-10-21  114  		pr_warn("Failed to map stolen time data structure\n");
e0685fa228fdaf Steven Price            2019-10-21  115  		return -ENOMEM;
e0685fa228fdaf Steven Price            2019-10-21  116  	}
e0685fa228fdaf Steven Price            2019-10-21  117  
19bef63f951e47 Prakruthi Deepak Heragu 2022-05-13  118  	if (le32_to_cpu(kaddr->revision) != 0 ||
19bef63f951e47 Prakruthi Deepak Heragu 2022-05-13  119  	    le32_to_cpu(kaddr->attributes) != 0) {
e0685fa228fdaf Steven Price            2019-10-21  120  		pr_warn_once("Unexpected revision or attributes in stolen time data\n");
e0685fa228fdaf Steven Price            2019-10-21  121  		return -ENXIO;
e0685fa228fdaf Steven Price            2019-10-21  122  	}
e0685fa228fdaf Steven Price            2019-10-21  123  
e0685fa228fdaf Steven Price            2019-10-21  124  	return 0;
e0685fa228fdaf Steven Price            2019-10-21  125  }
e0685fa228fdaf Steven Price            2019-10-21  126  
75df529bec9110 Andrew Jones            2020-09-16  127  static int __init pv_time_init_stolen_time(void)
e0685fa228fdaf Steven Price            2019-10-21  128  {
e0685fa228fdaf Steven Price            2019-10-21  129  	int ret;
e0685fa228fdaf Steven Price            2019-10-21  130  
75df529bec9110 Andrew Jones            2020-09-16  131  	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
75df529bec9110 Andrew Jones            2020-09-16  132  				"hypervisor/arm/pvtime:online",
75df529bec9110 Andrew Jones            2020-09-16  133  				stolen_time_cpu_online,
75df529bec9110 Andrew Jones            2020-09-16  134  				stolen_time_cpu_down_prepare);
e0685fa228fdaf Steven Price            2019-10-21  135  	if (ret < 0)
e0685fa228fdaf Steven Price            2019-10-21  136  		return ret;
e0685fa228fdaf Steven Price            2019-10-21  137  	return 0;
e0685fa228fdaf Steven Price            2019-10-21  138  }
e0685fa228fdaf Steven Price            2019-10-21  139  
75df529bec9110 Andrew Jones            2020-09-16  140  static bool __init has_pv_steal_clock(void)
e0685fa228fdaf Steven Price            2019-10-21  141  {
e0685fa228fdaf Steven Price            2019-10-21  142  	struct arm_smccc_res res;
e0685fa228fdaf Steven Price            2019-10-21  143  
e0685fa228fdaf Steven Price            2019-10-21 @144  	arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
e0685fa228fdaf Steven Price            2019-10-21  145  			     ARM_SMCCC_HV_PV_TIME_FEATURES, &res);
e0685fa228fdaf Steven Price            2019-10-21  146  
e0685fa228fdaf Steven Price            2019-10-21  147  	if (res.a0 != SMCCC_RET_SUCCESS)
e0685fa228fdaf Steven Price            2019-10-21  148  		return false;
e0685fa228fdaf Steven Price            2019-10-21  149  
e0685fa228fdaf Steven Price            2019-10-21  150  	arm_smccc_1_1_invoke(ARM_SMCCC_HV_PV_TIME_FEATURES,
e0685fa228fdaf Steven Price            2019-10-21  151  			     ARM_SMCCC_HV_PV_TIME_ST, &res);
e0685fa228fdaf Steven Price            2019-10-21  152  
e0685fa228fdaf Steven Price            2019-10-21  153  	return (res.a0 == SMCCC_RET_SUCCESS);
e0685fa228fdaf Steven Price            2019-10-21  154  }
e0685fa228fdaf Steven Price            2019-10-21  155  

:::::: The code at line 102 was first introduced by commit
:::::: e0685fa228fdaf386f82ac0d64b2d6f3e0ddd588 arm64: Retrieve stolen time as paravirtualized guest

:::::: TO: Steven Price <steven.price@arm.com>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
