Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8658F1AF0A6;
	Mon, 20 Jan 2025 10:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737369179; cv=none; b=kPHzTAdC7SE5GQTEVXVdQFyW0nPsBSe5CrbsFmcvAYi6RXCMnVWBmQ+GgRtg+/kP6ZFZSzHqocLgFxkJka/GhqKcA0iXrQsDz6DxfHiXj8gCvKHF8fjfHrZjswMyKYxl639ReBprYpjhrQ2iNi967U5mV2uSRA56aJH15h5LGPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737369179; c=relaxed/simple;
	bh=BPR7NqTjlDcfAh+vQigbrhmFZsGGe0GJqLfCmUlJxS4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZjUCU86e/k/p8Mnw9gzvYoA6jYObdrKQCeToUCkfpUatRH0djmj+myVjORo1FKqpoNs9Zj6k54+Gpa4sG4BivlO707D9AyiPAH3TompTCUYZNackQ7svnHFW+Y9oQVPKANYy6pGv399gR7xmHUq7nKkoHiMXqP8A/PiwVnpSxAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lq1JWDgS; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lq1JWDgS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737369177; x=1768905177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BPR7NqTjlDcfAh+vQigbrhmFZsGGe0GJqLfCmUlJxS4=;
  b=Lq1JWDgSMHwfDfxaAE6nCr4fvW0wawi7QD/F61l80ylgVr5N3ileVvFA
   HfDGhLwuRAkSjjRLjnczyCwGfrrxeLB/CfAMt0knvz2P4oNEPJb/vu3FG
   OPX0rDhE4GbprKO0KUskHZQUR4OluMaAPdn0vs4E/SisM0Q/5f/20e32D
   s6qXhg2IxNA8Ep5jBCVgvdnDLVT1uovdXNZ9L/wKYNaiPjijA3tMpOZG8
   BylsqTfULYbyMS79aJ/jpwHe+AXhlOY2hc9J75ZRsmh/BlwxqBpgms+6m
   5fnVsJo5vYZKeRBAJDLmBBQUpDwfql4QWS9cv0LKRZl+dEXrdnXfhKcOe
   Q==;
X-CSE-ConnectionGUID: w+wiTuYhQEmpHMrZXeoyTg==
X-CSE-MsgGUID: heu3SjMkSRWYtC2NAyVQEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="48242742"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="48242742"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 02:32:56 -0800
X-CSE-ConnectionGUID: ennjA4FqTSuQNjyWHBuoUQ==
X-CSE-MsgGUID: SQGVa427TZqKr9MEu3Cu6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="111434867"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Jan 2025 02:32:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZp5Q-000WSC-0S;
	Mon, 20 Jan 2025 10:32:52 +0000
Date: Mon, 20 Jan 2025 18:32:30 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [linux-next:master 9185/10024]
 drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:59:2: error: write to
 reserved register 'R7'
Message-ID: <202501201840.XmpHXpQ4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1573c8d4cb206a2d1454ff711e79f8df2353290b
commit: 82e703dd438b71432cc0ccbb90925d1e32dd014a [9185/10024] pmdomain: airoha: Add Airoha CPU PM Domain support
config: arm-randconfig-001-20250120 (https://download.01.org/0day-ci/archive/20250120/202501201840.XmpHXpQ4-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250120/202501201840.XmpHXpQ4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501201840.XmpHXpQ4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:59:2: error: write to reserved register 'R7'
      59 |         arm_smccc_1_1_invoke(AIROHA_SIP_AVS_HANDLE, AIROHA_AVS_OP_FREQ_DYN_ADJ,
         |         ^
   include/linux/arm-smccc.h:632:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     632 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:575:48: note: expanded from macro 'arm_smccc_1_1_smc'
     575 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                                 ^
   include/linux/arm-smccc.h:477:24: note: expanded from macro 'SMCCC_SMC_INST'
     477 | #define SMCCC_SMC_INST  __SMC(0)
         |                         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/arm/include/asm/opcodes.h:215:2: note: expanded from macro '__inst_arm_thumb32'
     215 |         __inst_thumb32(thumb_opcode)
         |         ^
   arch/arm/include/asm/opcodes.h:205:27: note: expanded from macro '__inst_thumb32'
     205 | #define __inst_thumb32(x) ___inst_thumb32(                              \
         |                           ^
   arch/arm/include/asm/opcodes.h:230:2: note: expanded from macro '___inst_thumb32'
     230 |         ".short " __stringify(first) ", " __stringify(second) "\n\t"
         |         ^
>> drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:59:2: error: write to reserved register 'R7'
   include/linux/arm-smccc.h:629:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     629 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:591:48: note: expanded from macro 'arm_smccc_1_1_hvc'
     591 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                                 ^
   include/linux/arm-smccc.h:478:24: note: expanded from macro 'SMCCC_HVC_INST'
     478 | #define SMCCC_HVC_INST  __HVC(0)
         |                         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/arm/include/asm/opcodes.h:215:2: note: expanded from macro '__inst_arm_thumb32'
     215 |         __inst_thumb32(thumb_opcode)
         |         ^
   arch/arm/include/asm/opcodes.h:205:27: note: expanded from macro '__inst_thumb32'
     205 | #define __inst_thumb32(x) ___inst_thumb32(                              \
         |                           ^
   arch/arm/include/asm/opcodes.h:230:2: note: expanded from macro '___inst_thumb32'
     230 |         ".short " __stringify(first) ", " __stringify(second) "\n\t"
         |         ^
>> drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:59:2: error: write to reserved register 'R7'
   include/linux/arm-smccc.h:635:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     635 |                         __fail_smccc_1_1(__VA_ARGS__);                  \
         |                         ^
   include/linux/arm-smccc.h:602:8: note: expanded from macro '__fail_smccc_1_1'
     602 |                 asm ("" :                                               \
         |                      ^
   drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:35:2: error: write to reserved register 'R7'
      35 |         arm_smccc_1_1_invoke(AIROHA_SIP_AVS_HANDLE, AIROHA_AVS_OP_GET_FREQ,
         |         ^
   include/linux/arm-smccc.h:632:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     632 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:575:48: note: expanded from macro 'arm_smccc_1_1_smc'
     575 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                                 ^
   include/linux/arm-smccc.h:477:24: note: expanded from macro 'SMCCC_SMC_INST'
     477 | #define SMCCC_SMC_INST  __SMC(0)
         |                         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/arm/include/asm/opcodes.h:215:2: note: expanded from macro '__inst_arm_thumb32'
     215 |         __inst_thumb32(thumb_opcode)
         |         ^
   arch/arm/include/asm/opcodes.h:205:27: note: expanded from macro '__inst_thumb32'
     205 | #define __inst_thumb32(x) ___inst_thumb32(                              \
         |                           ^
   arch/arm/include/asm/opcodes.h:230:2: note: expanded from macro '___inst_thumb32'
     230 |         ".short " __stringify(first) ", " __stringify(second) "\n\t"
         |         ^
   drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:35:2: error: write to reserved register 'R7'
   include/linux/arm-smccc.h:629:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     629 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:591:48: note: expanded from macro 'arm_smccc_1_1_hvc'
     591 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                                 ^
   include/linux/arm-smccc.h:478:24: note: expanded from macro 'SMCCC_HVC_INST'
     478 | #define SMCCC_HVC_INST  __HVC(0)
         |                         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/arm/include/asm/opcodes.h:215:2: note: expanded from macro '__inst_arm_thumb32'
     215 |         __inst_thumb32(thumb_opcode)
         |         ^
   arch/arm/include/asm/opcodes.h:205:27: note: expanded from macro '__inst_thumb32'
     205 | #define __inst_thumb32(x) ___inst_thumb32(                              \
         |                           ^
   arch/arm/include/asm/opcodes.h:230:2: note: expanded from macro '___inst_thumb32'
     230 |         ".short " __stringify(first) ", " __stringify(second) "\n\t"
         |         ^
   drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:35:2: error: write to reserved register 'R7'
   include/linux/arm-smccc.h:635:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     635 |                         __fail_smccc_1_1(__VA_ARGS__);                  \
         |                         ^
   include/linux/arm-smccc.h:602:8: note: expanded from macro '__fail_smccc_1_1'
     602 |                 asm ("" :                                               \
         |                      ^
   6 errors generated.


vim +/R7 +59 drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c

    53	
    54	static int airoha_cpu_pmdomain_set_performance_state(struct generic_pm_domain *domain,
    55							     unsigned int state)
    56	{
    57		struct arm_smccc_res res;
    58	
  > 59		arm_smccc_1_1_invoke(AIROHA_SIP_AVS_HANDLE, AIROHA_AVS_OP_FREQ_DYN_ADJ,
    60				     0, state, 0, 0, 0, 0, &res);
    61	
    62		/* SMC signal correct apply by unsetting BIT 0 */
    63		return res.a0 & BIT(0) ? -EINVAL : 0;
    64	}
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
