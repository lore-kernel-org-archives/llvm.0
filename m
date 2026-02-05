Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BDB38F95F;
	Thu,  5 Feb 2026 10:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770288204; cv=none; b=s8LxbFfvpyD5LlAImgDTYiP9ndcUbsQqZcSVd5ZCQ+hoQ9U9Ue1R++F8I2Hcrq6fOl859mIJh8Y0t/L8OP9xZZfUUSEwswaYJCNDvU9tJYci8IiHQJF53Y4OGxp/rn12ABqvuzwaFoEPx5+vsPJTuLQ8t+WhEFtu0oe1qgvgo4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770288204; c=relaxed/simple;
	bh=BE8F0GydfAG/noqHSNUEnAw/4ShuYxswS09rOIxyawE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Aa7D/uV12RsRN1CJmyXaOPA/vvL7qWuDGkbZZ84d8KtJ4+rhxMU/C5gngShIKBVrMxB3Surh9es0oTo/vLCRXCOyA8o66sYwNnWXQ1Msk34A+2ESFezpJlM/MU0aKFq69fFZIexOu0ndXthSCOTkhIM3L8VT+VE8qSZeuCHgkas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i+fIRBeL; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i+fIRBeL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770288204; x=1801824204;
  h=date:from:to:cc:subject:message-id;
  bh=BE8F0GydfAG/noqHSNUEnAw/4ShuYxswS09rOIxyawE=;
  b=i+fIRBeLbWnsGjLAdJdRmSML8VmeqG3Y3c+0N/zFuQ2bau14OEDMNfgm
   1NInWD1ybPW0hwrA3Yd8yPlxPXjqhIyPfVfDrVJ4IwRnur9RVhu550GpY
   VR+dPdAVhn6EVykLbPJLqeJ5Wsn9gWCRARu3j39JP+3z092szUaXUD5EZ
   +FlMefwSTQE3TQF2Dcw0unl2ILLnPeGIeKZw9tXMI3SqA3OpwAX9LAame
   urd32Lbl+RW+Bm7sV6fgAwN6vd51+RR2joU3q+3zCgQ0PHQTdGZNkUlu6
   +dtxxLp/FGXKA8F2Zn/Ut30nxPxlV75a/e+w+PMEXOsaR8bUL0Zc6aFeb
   g==;
X-CSE-ConnectionGUID: vEWvzozpSMyecO9/YxEqBg==
X-CSE-MsgGUID: Pe8JVmVaQ76w2f3ek3Db2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71547070"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="71547070"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 02:43:23 -0800
X-CSE-ConnectionGUID: Ob7nh1nTQP28WoluBu8o/g==
X-CSE-MsgGUID: usKHl4l2Q6aojH+ehL/6aQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 05 Feb 2026 02:43:22 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnwpU-00000000461-0AMS;
	Thu, 05 Feb 2026 10:43:20 +0000
Date: Thu, 05 Feb 2026 11:42:53 +0100
From: kernel test robot <lkp@intel.com>
To: Nikunj A Dadhania <nikunj@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: arch/x86/entry/entry_fred.c:213:4: warning: void function
 'fred_hwexc' should not return a value
Message-ID: <202602051128.AqkhZu86-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Nikunj-A-Dadhania/x86-fred-Fix-early-boot-failures-on-SEV-ES-SNP-guests/20260205-131359
head:   920b1b000ee3a4bf7dd6fde28bd4211cf29cb06b
commit: 920b1b000ee3a4bf7dd6fde28bd4211cf29cb06b x86/fred: Fix early boot failures on SEV-ES/SNP guests
date:   5 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260205/202602051128.AqkhZu86-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260205/202602051128.AqkhZu86-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602051128.AqkhZu86-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/entry/entry_fred.c:213:11: error: call to undeclared function 'user_exc_vmm_communication'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     213 |                         return user_exc_vmm_communication(regs, error_code);
         |                                ^
>> arch/x86/entry/entry_fred.c:213:4: warning: void function 'fred_hwexc' should not return a value [-Wreturn-mismatch]
     213 |                         return user_exc_vmm_communication(regs, error_code);
         |                         ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/entry/entry_fred.c:215:11: error: call to undeclared function 'kernel_exc_vmm_communication'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     215 |                         return kernel_exc_vmm_communication(regs, error_code);
         |                                ^
   arch/x86/entry/entry_fred.c:215:4: warning: void function 'fred_hwexc' should not return a value [-Wreturn-mismatch]
     215 |                         return kernel_exc_vmm_communication(regs, error_code);
         |                         ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings and 2 errors generated.


vim +/fred_hwexc +213 arch/x86/entry/entry_fred.c

   180	
   181	static noinstr void fred_hwexc(struct pt_regs *regs, unsigned long error_code)
   182	{
   183		/* Optimize for #PF. That's the only exception which matters performance wise */
   184		if (likely(regs->fred_ss.vector == X86_TRAP_PF))
   185			return exc_page_fault(regs, error_code);
   186	
   187		switch (regs->fred_ss.vector) {
   188		case X86_TRAP_DE: return exc_divide_error(regs);
   189		case X86_TRAP_DB: return fred_exc_debug(regs);
   190		case X86_TRAP_BR: return exc_bounds(regs);
   191		case X86_TRAP_UD: return exc_invalid_op(regs);
   192		case X86_TRAP_NM: return exc_device_not_available(regs);
   193		case X86_TRAP_DF: return exc_double_fault(regs, error_code);
   194		case X86_TRAP_TS: return exc_invalid_tss(regs, error_code);
   195		case X86_TRAP_NP: return exc_segment_not_present(regs, error_code);
   196		case X86_TRAP_SS: return exc_stack_segment(regs, error_code);
   197		case X86_TRAP_GP: return exc_general_protection(regs, error_code);
   198		case X86_TRAP_MF: return exc_coprocessor_error(regs);
   199		case X86_TRAP_AC: return exc_alignment_check(regs, error_code);
   200		case X86_TRAP_XF: return exc_simd_coprocessor_error(regs);
   201	
   202	#ifdef CONFIG_X86_MCE
   203		case X86_TRAP_MC: return fred_exc_machine_check(regs);
   204	#endif
   205	#ifdef CONFIG_INTEL_TDX_GUEST
   206		case X86_TRAP_VE: return exc_virtualization_exception(regs);
   207	#endif
   208	#ifdef CONFIG_X86_CET
   209		case X86_TRAP_CP: return exc_control_protection(regs, error_code);
   210	#endif
   211		case X86_TRAP_VC:
   212			if (user_mode(regs))
 > 213				return user_exc_vmm_communication(regs, error_code);
   214			else
   215				return kernel_exc_vmm_communication(regs, error_code);
   216		default: return fred_bad_type(regs, error_code);
   217		}
   218	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
