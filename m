Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2D0423798;
	Tue,  7 Jul 2026 21:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783460224; cv=none; b=gbrF8YvLvHlAjc3E3/1GwtRwNVnmdAIRu43fHpGq0wsDe1/ijSv8mcH80EYdRw1BKlblsFqGQ2ZF2JIwvznsvvpIZUsC6S5g06no6Uqihczldzz7HK/N3OavAsR7kHPDZAfljVwLwGQVvt7pYLVvCbm88xaHk7rZcd0ZYNPFg+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783460224; c=relaxed/simple;
	bh=2F/S+1hBprqCLM49OR+NNg8mhJtN1KDcYGVD8Yj65So=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I2ugVGyQsbVKLIkLzZ53lD1q4S808tJbLcStiKumsNbCuA0V3fXhmY+abdo9/WXAw2/2L7LySm5UTdBMj8YUSGWbOVAPRma9c04mtJ9SMiiKat5u08WxTOOpatYpRVmIovCWBsxxhMrJt3WF3X1QMGhRH5jeF0I819Q3uDufMbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OkZ8N5mg; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OkZ8N5mg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783460223; x=1814996223;
  h=date:from:to:cc:subject:message-id;
  bh=2F/S+1hBprqCLM49OR+NNg8mhJtN1KDcYGVD8Yj65So=;
  b=OkZ8N5mgMyh4wTRz9wA6dmiBW1ygODONo4z+wHgC5QFZAcho5w57IuJ2
   xHS5JWXY+4FARKhbJqvPRwuASdVO+LX+7ttgNcaOJUAw5g+7rVOXpqkvi
   jUkx4TetnXQDGyrtULkHiyqY7OWdKZVXBj9dGYLG3gUBTHpkCB4qGoBg/
   qGP9ckMnJ0RDSTFR3IVbBggKLDQ1lonco22vkSk5z85IzC3K2gxlU02JH
   VprvKMuDigpUbgfOiwSoc65YjAaIAEMztfhAOd7DFdNQPm5pmShXtZVID
   jAvxnvFAlxW0OnPN89IgIleHaZ1+5pvjVlkb9RFw1NR1tNja9TxyEPvJ0
   w==;
X-CSE-ConnectionGUID: RBsSQlvKS/+GDF9XK0D2wg==
X-CSE-MsgGUID: ibOiRQn3S86Gpedap/bBiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="83895514"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="83895514"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 14:37:02 -0700
X-CSE-ConnectionGUID: TIb1FG2MSvGmTwV2pFMGxA==
X-CSE-MsgGUID: vPX8fwY0TCiTHUC6pGwdhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="250124118"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 07 Jul 2026 14:36:59 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whDTI-00000000Fhb-12LO;
	Tue, 07 Jul 2026 21:36:53 +0000
Date: Wed, 08 Jul 2026 05:36:30 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:kvm-arm64-sme 4/30]
 arch/arm64/kernel/fpsimd.c:518:5: warning: format specifies type 'unsigned
 long long' but the argument has type 'int'
Message-ID: <202607080542.LD9Mh3ue-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git kvm-arm64-sme
head:   489202b3db0a02f59477f8ec63009dc3d998341f
commit: b77633efe7c6ef49465e89432b3fd7d1541d3b3a [4/30] arm64/fpsimd: Decide to save ZT0 and streaming mode FFR at bind time
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260708/202607080542.LD9Mh3ue-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607080542.LD9Mh3ue-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607080542.LD9Mh3ue-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/fpsimd.c:518:5: warning: format specifies type 'unsigned long long' but the argument has type 'int' [-Wformat]
     517 |                         pr_crit("%llu %llu\n",
         |                                  ~~~~
         |                                  %d
     518 |                                 sve_get_vl() != sve_vl_from_vq(vq));
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:544:34: note: expanded from macro 'pr_crit'
     544 |         printk(KERN_CRIT pr_fmt(fmt), ##__VA_ARGS__)
         |                                 ~~~     ^~~~~~~~~~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
>> arch/arm64/kernel/fpsimd.c:517:21: warning: more '%' conversions than data arguments [-Wformat-insufficient-args]
     517 |                         pr_crit("%llu %llu\n",
         |                                       ~~~^
   include/linux/printk.h:544:26: note: expanded from macro 'pr_crit'
     544 |         printk(KERN_CRIT pr_fmt(fmt), ##__VA_ARGS__)
         |                                 ^~~
   include/linux/printk.h:401:21: note: expanded from macro 'pr_fmt'
     401 | #define pr_fmt(fmt) fmt
         |                     ^~~
   include/linux/printk.h:511:53: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ^~~
   include/linux/printk.h:483:11: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   2 warnings generated.


vim +518 arch/arm64/kernel/fpsimd.c

   452	
   453	/*
   454	 * Ensure FPSIMD/SVE storage in memory for the loaded context is up to
   455	 * date with respect to the CPU registers. Note carefully that the
   456	 * current context is the context last bound to the CPU stored in
   457	 * last, if KVM is involved this may be the guest VM context rather
   458	 * than the host thread for the VM pointed to by current. This means
   459	 * that we must always reference the state storage via last rather
   460	 * than via current, if we are saving KVM state then it will have
   461	 * ensured that the type of registers to save is set in last->to_save.
   462	 */
   463	static void fpsimd_save_user_state(void)
   464	{
   465		struct cpu_fp_state const *last =
   466			this_cpu_ptr(&fpsimd_last_state);
   467		/* set by fpsimd_bind_task_to_cpu() or fpsimd_bind_state_to_cpu() */
   468		bool save_sve_regs = false;
   469		bool save_ffr;
   470		unsigned int vq;
   471	
   472		WARN_ON(!system_supports_fpsimd());
   473		WARN_ON(preemptible());
   474	
   475		if (test_thread_flag(TIF_FOREIGN_FPSTATE))
   476			return;
   477	
   478		if (system_supports_fpmr())
   479			*(last->fpmr) = read_sysreg_s(SYS_FPMR);
   480	
   481		/*
   482		 * Save SVE state if it is live.
   483		 *
   484		 * The syscall ABI discards live SVE state at syscall entry. When
   485		 * entering a syscall, fpsimd_syscall_enter() sets to_save to
   486		 * FP_STATE_FPSIMD to allow the SVE state to be lazily discarded until
   487		 * either new SVE state is loaded+bound or fpsimd_syscall_exit() is
   488		 * called prior to a return to userspace.
   489		 */
   490		if ((last->to_save == FP_STATE_CURRENT && test_thread_flag(TIF_SVE)) ||
   491		    last->to_save == FP_STATE_SVE) {
   492			save_sve_regs = true;
   493			save_ffr = true;
   494			vq = SYS_FIELD_GET(ZCR_ELx, LEN, last->zcr) + 1;
   495		}
   496	
   497		if (system_supports_sme()) {
   498			u64 *svcr = last->svcr;
   499	
   500			*svcr = read_sysreg_s(SYS_SVCR);
   501	
   502			if (*svcr & SVCR_ZA_MASK)
   503				sme_save_state(last->sme_state,
   504					       last->smcr & SMCR_ELx_EZT0);
   505	
   506			/* If we are in streaming mode override regular SVE. */
   507			if (*svcr & SVCR_SM_MASK) {
   508				save_sve_regs = true;
   509				save_ffr = last->smcr & SMCR_ELx_FA64;
   510				vq = SYS_FIELD_GET(SMCR_ELx, LEN, last->smcr) + 1;
   511			}
   512		}
   513	
   514		if (IS_ENABLED(CONFIG_ARM64_SVE) && save_sve_regs) {
   515			/* Get the configured VL from RDVL, will account for SM */
   516			if (WARN_ON(sve_get_vl() != sve_vl_from_vq(vq))) {
 > 517				pr_crit("%llu %llu\n",
 > 518					sve_get_vl() != sve_vl_from_vq(vq));
   519				/*
   520				 * Can't save the user regs, so current would
   521				 * re-enter user with corrupt state.
   522				 * There's no way to recover, so kill it:
   523				 */
   524				force_signal_inject(SIGKILL, SI_KERNEL, 0, 0);
   525				return;
   526			}
   527	
   528			sve_save_state(last->sve_state, save_ffr);
   529			fpsimd_save_common(last->st);
   530			*last->fp_type = FP_STATE_SVE;
   531		} else {
   532			fpsimd_save_state(last->st);
   533			*last->fp_type = FP_STATE_FPSIMD;
   534		}
   535	}
   536	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
