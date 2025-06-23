Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3379627AC5C;
	Mon, 23 Jun 2025 15:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750692160; cv=none; b=HLn3Za3sY2RcCNEkNvU7HVNfO2NwAP1dLw//jqN8QlvQGXgMd+It9Ka5RWvAPM9huxseAjTRaOKYyzg4ExQ5bSsu4N2EVl4ElI51HyxSFZs4edwpGnFCEgpZ6FAvGy3w/ayrXAjUyIxxuFdKudBzUFFOhjrxmzLLnIqzuodXZ3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750692160; c=relaxed/simple;
	bh=0Qdrffq5Kv0jPXvpGB7FCBhl3yhR5xocy0VnFn/Ykx4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RxvtVGGy88t6jKa42Pu9NntfPWaPtOG6UrgqqmH8+4VnEYo+tb+kC5kStDeEYPNX9toeTk0q3xReDiDSVaBCX2v5bo8lWr5nHhVtVgl6yvDJbosYhjucvhaF5dtG97dm+3b7Qb6KEUZsTwDds4KjNVJLsxmqjNbWML03x1EaqXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kXh6Qzss; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kXh6Qzss"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750692158; x=1782228158;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0Qdrffq5Kv0jPXvpGB7FCBhl3yhR5xocy0VnFn/Ykx4=;
  b=kXh6QzssoJmZrwoDI3uUj2mujWcKGXXnCNgUlveDdv0ssxuwDzGtViLn
   FlFccyB5WQdmW0EwEFSsijeaeuerUZMkiFz9wVh6QmOJSudVSbBIMyyzJ
   H8bZ1spElwULFp22Ntxa0M0KdRkj3o0QnTB+IbzTjair0XXh588nGey0V
   SQroFYQG7EKClcLi1pvjmjVo+318mOLtovl/wnqfZ3486v9SmoNHbbEpe
   GIUsy48mGAjcjUH9jXvkkKU/QVV7ZeEQANYT4FZSBkgpMzOLKI16+EVAx
   yS4EBNfW7eX9GDx7frlvnxercXV/3k3FDvB34ja3WBiEAWvkDOnwC1DkB
   A==;
X-CSE-ConnectionGUID: 1rIzuplSSE2ZdeLcKp5ENg==
X-CSE-MsgGUID: PAW0r2JHRDC2/P8jiilBIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52131405"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="52131405"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 08:22:36 -0700
X-CSE-ConnectionGUID: bBbpgULhQs2piQYZWD3pgw==
X-CSE-MsgGUID: gOOufbYKRgiZvfBmTMT0sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="151778366"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jun 2025 08:22:35 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTj0D-000P2Z-0S;
	Mon, 23 Jun 2025 15:22:33 +0000
Date: Mon, 23 Jun 2025 23:21:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_3 6/9]
 arch/arm64/kernel/asm-offsets.c:183:34: error: no member named 'direct_call'
 in 'ftrace_ops'
Message-ID: <202506232303.4eAIJceb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_3
head:   35d06af545c69978148f7e43479a888892de1ed1
commit: 56034d5b55657755091af21ad434b155a2e85e4b [6/9] Revert "ftrace: Store direct called addresses in their ops"
config: arm64-randconfig-003-20250621 (https://download.01.org/0day-ci/archive/20250623/202506232303.4eAIJceb-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250623/202506232303.4eAIJceb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506232303.4eAIJceb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/asm-offsets.c:183:34: error: no member named 'direct_call' in 'ftrace_ops'
     183 |   DEFINE(FTRACE_OPS_DIRECT_CALL,        offsetof(struct ftrace_ops, direct_call));
         |                                         ^                           ~~~~~~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                        ~~~~~~
   include/linux/kbuild.h:6:62: note: expanded from macro 'DEFINE'
       6 |         asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
         |                                                                     ^~~
   1 error generated.
   make[3]: *** [scripts/Makefile.build:98: arch/arm64/kernel/asm-offsets.s] Error 1 shuffle=793964048
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1279: prepare0] Error 2 shuffle=793964048
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=793964048
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=793964048
   make: Target 'prepare' not remade because of errors.


vim +183 arch/arm64/kernel/asm-offsets.c

0be7320a635c2e Catalin Marinas     2012-03-05   25  
0be7320a635c2e Catalin Marinas     2012-03-05   26  int main(void)
0be7320a635c2e Catalin Marinas     2012-03-05   27  {
001430c1910df6 Ard Biesheuvel      2021-09-14   28    DEFINE(TSK_TI_CPU,		offsetof(struct task_struct, thread_info.cpu));
c02433dd6de32f Mark Rutland        2016-11-03   29    DEFINE(TSK_TI_FLAGS,		offsetof(struct task_struct, thread_info.flags));
c02433dd6de32f Mark Rutland        2016-11-03   30    DEFINE(TSK_TI_PREEMPT,	offsetof(struct task_struct, thread_info.preempt_count));
4b65a5db362783 Catalin Marinas     2016-07-01   31  #ifdef CONFIG_ARM64_SW_TTBR0_PAN
4b65a5db362783 Catalin Marinas     2016-07-01   32    DEFINE(TSK_TI_TTBR0,		offsetof(struct task_struct, thread_info.ttbr0));
5287569a790d25 Sami Tolvanen       2020-04-27   33  #endif
5287569a790d25 Sami Tolvanen       2020-04-27   34  #ifdef CONFIG_SHADOW_CALL_STACK
5287569a790d25 Sami Tolvanen       2020-04-27   35    DEFINE(TSK_TI_SCS_BASE,	offsetof(struct task_struct, thread_info.scs_base));
51189c7a7ed1b4 Will Deacon         2020-05-15   36    DEFINE(TSK_TI_SCS_SP,		offsetof(struct task_struct, thread_info.scs_sp));
4b65a5db362783 Catalin Marinas     2016-07-01   37  #endif
c02433dd6de32f Mark Rutland        2016-11-03   38    DEFINE(TSK_STACK,		offsetof(struct task_struct, stack));
0a1213fa743277 Ard Biesheuvel      2018-12-12   39  #ifdef CONFIG_STACKPROTECTOR
0a1213fa743277 Ard Biesheuvel      2018-12-12   40    DEFINE(TSK_STACK_CANARY,	offsetof(struct task_struct, stack_canary));
0a1213fa743277 Ard Biesheuvel      2018-12-12   41  #endif
0be7320a635c2e Catalin Marinas     2012-03-05   42    BLANK();
0be7320a635c2e Catalin Marinas     2012-03-05   43    DEFINE(THREAD_CPU_CONTEXT,	offsetof(struct task_struct, thread.cpu_context));
201698626fbca1 Peter Collingbourne 2021-03-18   44    DEFINE(THREAD_SCTLR_USER,	offsetof(struct task_struct, thread.sctlr_user));
be129842566599 Kristina Martsenko  2020-03-13   45  #ifdef CONFIG_ARM64_PTR_AUTH
be129842566599 Kristina Martsenko  2020-03-13   46    DEFINE(THREAD_KEYS_USER,	offsetof(struct task_struct, thread.keys_user));
b27a9f4119afa4 Daniel Kiss         2021-06-13   47  #endif
b27a9f4119afa4 Daniel Kiss         2021-06-13   48  #ifdef CONFIG_ARM64_PTR_AUTH_KERNEL
33e45234987ea3 Kristina Martsenko  2020-03-13   49    DEFINE(THREAD_KEYS_KERNEL,	offsetof(struct task_struct, thread.keys_kernel));
bad1e1c663e0a7 Vincenzo Frascino   2020-12-22   50  #endif
bad1e1c663e0a7 Vincenzo Frascino   2020-12-22   51  #ifdef CONFIG_ARM64_MTE
638982a03fbcdc Peter Collingbourne 2021-07-27   52    DEFINE(THREAD_MTE_CTRL,	offsetof(struct task_struct, thread.mte_ctrl));
be129842566599 Kristina Martsenko  2020-03-13   53  #endif
0be7320a635c2e Catalin Marinas     2012-03-05   54    BLANK();
0be7320a635c2e Catalin Marinas     2012-03-05   55    DEFINE(S_X0,			offsetof(struct pt_regs, regs[0]));
0be7320a635c2e Catalin Marinas     2012-03-05   56    DEFINE(S_X2,			offsetof(struct pt_regs, regs[2]));
0be7320a635c2e Catalin Marinas     2012-03-05   57    DEFINE(S_X4,			offsetof(struct pt_regs, regs[4]));
0be7320a635c2e Catalin Marinas     2012-03-05   58    DEFINE(S_X6,			offsetof(struct pt_regs, regs[6]));
da6a91252ad98d William Cohen       2016-07-08   59    DEFINE(S_X8,			offsetof(struct pt_regs, regs[8]));
da6a91252ad98d William Cohen       2016-07-08   60    DEFINE(S_X10,			offsetof(struct pt_regs, regs[10]));
da6a91252ad98d William Cohen       2016-07-08   61    DEFINE(S_X12,			offsetof(struct pt_regs, regs[12]));
da6a91252ad98d William Cohen       2016-07-08   62    DEFINE(S_X14,			offsetof(struct pt_regs, regs[14]));
da6a91252ad98d William Cohen       2016-07-08   63    DEFINE(S_X16,			offsetof(struct pt_regs, regs[16]));
da6a91252ad98d William Cohen       2016-07-08   64    DEFINE(S_X18,			offsetof(struct pt_regs, regs[18]));
da6a91252ad98d William Cohen       2016-07-08   65    DEFINE(S_X20,			offsetof(struct pt_regs, regs[20]));
da6a91252ad98d William Cohen       2016-07-08   66    DEFINE(S_X22,			offsetof(struct pt_regs, regs[22]));
da6a91252ad98d William Cohen       2016-07-08   67    DEFINE(S_X24,			offsetof(struct pt_regs, regs[24]));
da6a91252ad98d William Cohen       2016-07-08   68    DEFINE(S_X26,			offsetof(struct pt_regs, regs[26]));
da6a91252ad98d William Cohen       2016-07-08   69    DEFINE(S_X28,			offsetof(struct pt_regs, regs[28]));
1f377e043b3b8e Mark Rutland        2019-10-18   70    DEFINE(S_FP,			offsetof(struct pt_regs, regs[29]));
0be7320a635c2e Catalin Marinas     2012-03-05   71    DEFINE(S_LR,			offsetof(struct pt_regs, regs[30]));
0be7320a635c2e Catalin Marinas     2012-03-05   72    DEFINE(S_SP,			offsetof(struct pt_regs, sp));
0be7320a635c2e Catalin Marinas     2012-03-05   73    DEFINE(S_PC,			offsetof(struct pt_regs, pc));
58a0484eaf5ec1 Kemeng Shi          2024-01-31   74    DEFINE(S_PSTATE,		offsetof(struct pt_regs, pstate));
0be7320a635c2e Catalin Marinas     2012-03-05   75    DEFINE(S_SYSCALLNO,		offsetof(struct pt_regs, syscallno));
3d2403fd10a1db Mark Rutland        2020-12-02   76    DEFINE(S_SDEI_TTBR1,		offsetof(struct pt_regs, sdei_ttbr1));
00d9597903d005 Mark Rutland        2024-10-17   77    DEFINE(S_PMR,			offsetof(struct pt_regs, pmr));
73267498013961 Ard Biesheuvel      2017-07-22   78    DEFINE(S_STACKFRAME,		offsetof(struct pt_regs, stackframe));
c2c6b27b5aa14f Mark Rutland        2024-10-17   79    DEFINE(S_STACKFRAME_TYPE,	offsetof(struct pt_regs, stackframe.type));
71e70184f1d131 Jianlin Lv          2021-01-12   80    DEFINE(PT_REGS_SIZE,		sizeof(struct pt_regs));
0be7320a635c2e Catalin Marinas     2012-03-05   81    BLANK();
26299b3f6ba26b Mark Rutland        2022-11-03   82  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
7888af4166d4ab Steven Rostedt      2024-10-08   83    DEFINE(FREGS_X0,		offsetof(struct __arch_ftrace_regs, regs[0]));
7888af4166d4ab Steven Rostedt      2024-10-08   84    DEFINE(FREGS_X2,		offsetof(struct __arch_ftrace_regs, regs[2]));
7888af4166d4ab Steven Rostedt      2024-10-08   85    DEFINE(FREGS_X4,		offsetof(struct __arch_ftrace_regs, regs[4]));
7888af4166d4ab Steven Rostedt      2024-10-08   86    DEFINE(FREGS_X6,		offsetof(struct __arch_ftrace_regs, regs[6]));
7888af4166d4ab Steven Rostedt      2024-10-08   87    DEFINE(FREGS_X8,		offsetof(struct __arch_ftrace_regs, regs[8]));
7888af4166d4ab Steven Rostedt      2024-10-08   88    DEFINE(FREGS_FP,		offsetof(struct __arch_ftrace_regs, fp));
7888af4166d4ab Steven Rostedt      2024-10-08   89    DEFINE(FREGS_LR,		offsetof(struct __arch_ftrace_regs, lr));
7888af4166d4ab Steven Rostedt      2024-10-08   90    DEFINE(FREGS_SP,		offsetof(struct __arch_ftrace_regs, sp));
7888af4166d4ab Steven Rostedt      2024-10-08   91    DEFINE(FREGS_PC,		offsetof(struct __arch_ftrace_regs, pc));
2aa6ac03516d07 Florent Revest      2023-04-05   92  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
7888af4166d4ab Steven Rostedt      2024-10-08   93    DEFINE(FREGS_DIRECT_TRAMP,	offsetof(struct __arch_ftrace_regs, direct_tramp));
2aa6ac03516d07 Florent Revest      2023-04-05   94  #endif
7888af4166d4ab Steven Rostedt      2024-10-08   95    DEFINE(FREGS_SIZE,		sizeof(struct __arch_ftrace_regs));
26299b3f6ba26b Mark Rutland        2022-11-03   96    BLANK();
26299b3f6ba26b Mark Rutland        2022-11-03   97  #endif
c02433dd6de32f Mark Rutland        2016-11-03   98    DEFINE(CPU_BOOT_TASK,		offsetof(struct secondary_data, task));
bb9052744f4b7a Suzuki K Poulose    2016-02-23   99    BLANK();
41fac42c25338f Marc Zyngier        2021-02-08  100    DEFINE(FTR_OVR_VAL_OFFSET,	offsetof(struct arm64_ftr_override, val));
41fac42c25338f Marc Zyngier        2021-02-08  101    DEFINE(FTR_OVR_MASK_OFFSET,	offsetof(struct arm64_ftr_override, mask));
41fac42c25338f Marc Zyngier        2021-02-08  102    BLANK();
d82755b2e781c8 Will Deacon         2020-05-05  103  #ifdef CONFIG_KVM
55c7401d92e163 Marc Zyngier        2012-12-10  104    DEFINE(VCPU_CONTEXT,		offsetof(struct kvm_vcpu, arch.ctxt));
0067df413bd9d7 James Morse         2018-01-15  105    DEFINE(VCPU_FAULT_DISR,	offsetof(struct kvm_vcpu, arch.fault.disr_el1));
384b40caa8afae Mark Rutland        2019-04-23  106    DEFINE(VCPU_HCR_EL2,		offsetof(struct kvm_vcpu, arch.hcr_el2));
e47c2055c68e06 Marc Zyngier        2019-06-28  107    DEFINE(CPU_USER_PT_REGS,	offsetof(struct kvm_cpu_context, regs));
a8f0655887cc86 Pierre-Clément Tosi 2024-06-10  108    DEFINE(CPU_ELR_EL2,		offsetof(struct kvm_cpu_context, sys_regs[ELR_EL2]));
e1f358b5046479 Steven Price        2021-06-21  109    DEFINE(CPU_RGSR_EL1,		offsetof(struct kvm_cpu_context, sys_regs[RGSR_EL1]));
e1f358b5046479 Steven Price        2021-06-21  110    DEFINE(CPU_GCR_EL1,		offsetof(struct kvm_cpu_context, sys_regs[GCR_EL1]));
384b40caa8afae Mark Rutland        2019-04-23  111    DEFINE(CPU_APIAKEYLO_EL1,	offsetof(struct kvm_cpu_context, sys_regs[APIAKEYLO_EL1]));
384b40caa8afae Mark Rutland        2019-04-23  112    DEFINE(CPU_APIBKEYLO_EL1,	offsetof(struct kvm_cpu_context, sys_regs[APIBKEYLO_EL1]));
384b40caa8afae Mark Rutland        2019-04-23  113    DEFINE(CPU_APDAKEYLO_EL1,	offsetof(struct kvm_cpu_context, sys_regs[APDAKEYLO_EL1]));
384b40caa8afae Mark Rutland        2019-04-23  114    DEFINE(CPU_APDBKEYLO_EL1,	offsetof(struct kvm_cpu_context, sys_regs[APDBKEYLO_EL1]));
384b40caa8afae Mark Rutland        2019-04-23  115    DEFINE(CPU_APGAKEYLO_EL1,	offsetof(struct kvm_cpu_context, sys_regs[APGAKEYLO_EL1]));
4464e210de9e80 Christoffer Dall    2017-10-08  116    DEFINE(HOST_CONTEXT_VCPU,	offsetof(struct kvm_cpu_context, __hyp_running_vcpu));
630a16854d2d28 Andrew Murray       2019-04-09  117    DEFINE(HOST_DATA_CONTEXT,	offsetof(struct kvm_host_data, host_ctxt));
d3e1086c64528e David Brazdil       2020-12-02  118    DEFINE(NVHE_INIT_MAIR_EL2,	offsetof(struct kvm_nvhe_init_params, mair_el2));
d3e1086c64528e David Brazdil       2020-12-02  119    DEFINE(NVHE_INIT_TCR_EL2,	offsetof(struct kvm_nvhe_init_params, tcr_el2));
63fec24351e827 David Brazdil       2020-12-02  120    DEFINE(NVHE_INIT_TPIDR_EL2,	offsetof(struct kvm_nvhe_init_params, tpidr_el2));
63fec24351e827 David Brazdil       2020-12-02  121    DEFINE(NVHE_INIT_STACK_HYP_VA,	offsetof(struct kvm_nvhe_init_params, stack_hyp_va));
63fec24351e827 David Brazdil       2020-12-02  122    DEFINE(NVHE_INIT_PGD_PA,	offsetof(struct kvm_nvhe_init_params, pgd_pa));
734864c177bca5 Quentin Perret      2021-03-19  123    DEFINE(NVHE_INIT_HCR_EL2,	offsetof(struct kvm_nvhe_init_params, hcr_el2));
734864c177bca5 Quentin Perret      2021-03-19  124    DEFINE(NVHE_INIT_VTTBR,	offsetof(struct kvm_nvhe_init_params, vttbr));
734864c177bca5 Quentin Perret      2021-03-19  125    DEFINE(NVHE_INIT_VTCR,	offsetof(struct kvm_nvhe_init_params, vtcr));
afa9b48f327c9e Marc Zyngier        2024-10-10  126    DEFINE(NVHE_INIT_TMP,		offsetof(struct kvm_nvhe_init_params, tmp));
95322526ef62b8 Lorenzo Pieralisi   2013-07-22  127  #endif
af3cfdbf56b917 Lorenzo Pieralisi   2015-01-26  128  #ifdef CONFIG_CPU_PM
95322526ef62b8 Lorenzo Pieralisi   2013-07-22  129    DEFINE(CPU_CTX_SP,		offsetof(struct cpu_suspend_ctx, sp));
95322526ef62b8 Lorenzo Pieralisi   2013-07-22  130    DEFINE(MPIDR_HASH_MASK,	offsetof(struct mpidr_hash, mask));
95322526ef62b8 Lorenzo Pieralisi   2013-07-22  131    DEFINE(MPIDR_HASH_SHIFTS,	offsetof(struct mpidr_hash, shift_aff));
adc9b2dfd00924 James Morse         2016-04-27  132    DEFINE(SLEEP_STACK_DATA_SYSTEM_REGS,	offsetof(struct sleep_stack_data, system_regs));
adc9b2dfd00924 James Morse         2016-04-27  133    DEFINE(SLEEP_STACK_DATA_CALLEE_REGS,	offsetof(struct sleep_stack_data, callee_saved_regs));
55c7401d92e163 Marc Zyngier        2012-12-10  134  #endif
14457459f9ca2f Jens Wiklander      2016-01-04  135    DEFINE(ARM_SMCCC_RES_X0_OFFS,		offsetof(struct arm_smccc_res, a0));
14457459f9ca2f Jens Wiklander      2016-01-04  136    DEFINE(ARM_SMCCC_RES_X2_OFFS,		offsetof(struct arm_smccc_res, a2));
680a0873e193ba Andy Gross          2017-02-01  137    DEFINE(ARM_SMCCC_QUIRK_ID_OFFS,	offsetof(struct arm_smccc_quirk, id));
680a0873e193ba Andy Gross          2017-02-01  138    DEFINE(ARM_SMCCC_QUIRK_STATE_OFFS,	offsetof(struct arm_smccc_quirk, state));
3fdc0cb59d97f8 Sudeep Holla        2021-05-18  139    DEFINE(ARM_SMCCC_1_2_REGS_X0_OFFS,	offsetof(struct arm_smccc_1_2_regs, a0));
3fdc0cb59d97f8 Sudeep Holla        2021-05-18  140    DEFINE(ARM_SMCCC_1_2_REGS_X2_OFFS,	offsetof(struct arm_smccc_1_2_regs, a2));
3fdc0cb59d97f8 Sudeep Holla        2021-05-18  141    DEFINE(ARM_SMCCC_1_2_REGS_X4_OFFS,	offsetof(struct arm_smccc_1_2_regs, a4));
3fdc0cb59d97f8 Sudeep Holla        2021-05-18  142    DEFINE(ARM_SMCCC_1_2_REGS_X6_OFFS,	offsetof(struct arm_smccc_1_2_regs, a6));
3fdc0cb59d97f8 Sudeep Holla        2021-05-18  143    DEFINE(ARM_SMCCC_1_2_REGS_X8_OFFS,	offsetof(struct arm_smccc_1_2_regs, a8));
3fdc0cb59d97f8 Sudeep Holla        2021-05-18  144    DEFINE(ARM_SMCCC_1_2_REGS_X10_OFFS,	offsetof(struct arm_smccc_1_2_regs, a10));
3fdc0cb59d97f8 Sudeep Holla        2021-05-18  145    DEFINE(ARM_SMCCC_1_2_REGS_X12_OFFS,	offsetof(struct arm_smccc_1_2_regs, a12));
3fdc0cb59d97f8 Sudeep Holla        2021-05-18  146    DEFINE(ARM_SMCCC_1_2_REGS_X14_OFFS,	offsetof(struct arm_smccc_1_2_regs, a14));
3fdc0cb59d97f8 Sudeep Holla        2021-05-18  147    DEFINE(ARM_SMCCC_1_2_REGS_X16_OFFS,	offsetof(struct arm_smccc_1_2_regs, a16));
82869ac57b5d3b James Morse         2016-04-27  148    BLANK();
82869ac57b5d3b James Morse         2016-04-27  149    DEFINE(HIBERN_PBE_ORIG,	offsetof(struct pbe, orig_address));
82869ac57b5d3b James Morse         2016-04-27  150    DEFINE(HIBERN_PBE_ADDR,	offsetof(struct pbe, address));
82869ac57b5d3b James Morse         2016-04-27  151    DEFINE(HIBERN_PBE_NEXT,	offsetof(struct pbe, next));
116c81f427ff6c Suzuki K Poulose    2016-09-09  152    DEFINE(ARM64_FTR_SYSVAL,	offsetof(struct arm64_ftr_reg, sys_val));
51a0048beb4496 Will Deacon         2017-11-14  153    BLANK();
51a0048beb4496 Will Deacon         2017-11-14  154  #ifdef CONFIG_UNMAP_KERNEL_AT_EL0
51a0048beb4496 Will Deacon         2017-11-14  155    DEFINE(TRAMP_VALIAS,		TRAMP_VALIAS);
f5df26961853d6 James Morse         2018-01-08  156  #endif
f5df26961853d6 James Morse         2018-01-08  157  #ifdef CONFIG_ARM_SDE_INTERFACE
f5df26961853d6 James Morse         2018-01-08  158    DEFINE(SDEI_EVENT_INTREGS,	offsetof(struct sdei_registered_event, interrupted_regs));
f5df26961853d6 James Morse         2018-01-08  159    DEFINE(SDEI_EVENT_PRIORITY,	offsetof(struct sdei_registered_event, priority));
be129842566599 Kristina Martsenko  2020-03-13  160  #endif
be129842566599 Kristina Martsenko  2020-03-13  161  #ifdef CONFIG_ARM64_PTR_AUTH
be129842566599 Kristina Martsenko  2020-03-13  162    DEFINE(PTRAUTH_USER_KEY_APIA,		offsetof(struct ptrauth_keys_user, apia));
d053e71ac8442d Daniel Kiss         2021-06-13  163  #ifdef CONFIG_ARM64_PTR_AUTH_KERNEL
33e45234987ea3 Kristina Martsenko  2020-03-13  164    DEFINE(PTRAUTH_KERNEL_KEY_APIA,	offsetof(struct ptrauth_keys_kernel, apia));
d053e71ac8442d Daniel Kiss         2021-06-13  165  #endif
be129842566599 Kristina Martsenko  2020-03-13  166    BLANK();
878fdbd7048643 Pasha Tatashin      2021-09-30  167  #endif
878fdbd7048643 Pasha Tatashin      2021-09-30  168  #ifdef CONFIG_KEXEC_CORE
878fdbd7048643 Pasha Tatashin      2021-09-30  169    DEFINE(KIMAGE_ARCH_DTB_MEM,		offsetof(struct kimage, arch.dtb_mem));
08eae0ef618f34 Pasha Tatashin      2021-09-30  170    DEFINE(KIMAGE_ARCH_EL2_VECTORS,	offsetof(struct kimage, arch.el2_vectors));
3744b5280e67f5 Pasha Tatashin      2021-09-30  171    DEFINE(KIMAGE_ARCH_ZERO_PAGE,		offsetof(struct kimage, arch.zero_page));
efc2d0f20a9dab Pasha Tatashin      2021-09-30  172    DEFINE(KIMAGE_ARCH_PHYS_OFFSET,	offsetof(struct kimage, arch.phys_offset));
3744b5280e67f5 Pasha Tatashin      2021-09-30  173    DEFINE(KIMAGE_ARCH_TTBR1,		offsetof(struct kimage, arch.ttbr1));
878fdbd7048643 Pasha Tatashin      2021-09-30  174    DEFINE(KIMAGE_HEAD,			offsetof(struct kimage, head));
878fdbd7048643 Pasha Tatashin      2021-09-30  175    DEFINE(KIMAGE_START,			offsetof(struct kimage, start));
878fdbd7048643 Pasha Tatashin      2021-09-30  176    BLANK();
baaf553d3bc330 Mark Rutland        2023-01-23  177  #endif
baaf553d3bc330 Mark Rutland        2023-01-23  178  #ifdef CONFIG_FUNCTION_TRACER
baaf553d3bc330 Mark Rutland        2023-01-23  179    DEFINE(FTRACE_OPS_FUNC,		offsetof(struct ftrace_ops, func));
3646970322464c Donglin Peng        2023-04-08  180  #endif
3646970322464c Donglin Peng        2023-04-08  181    BLANK();
2aa6ac03516d07 Florent Revest      2023-04-05  182  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
2aa6ac03516d07 Florent Revest      2023-04-05 @183    DEFINE(FTRACE_OPS_DIRECT_CALL,	offsetof(struct ftrace_ops, direct_call));

:::::: The code at line 183 was first introduced by commit
:::::: 2aa6ac03516d078cf0c35aaa273b5cd11ea9734c arm64: ftrace: Add direct call support

:::::: TO: Florent Revest <revest@chromium.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
