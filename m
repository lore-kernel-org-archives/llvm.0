Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA8DDDB8;
	Tue, 27 Feb 2024 02:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708999542; cv=none; b=sYgvH3+6zlH+zy/koUBzxu34R0PrkFKBpi9AfTW1qsqthUxlzKUcEhmDw93MxJUNxCnHDwqj1tffx+kvlPOXZM18YguoN+rtIe/tXI4AeEgRZ2EMwljWBcoYZySKyEq74slFUuue8FaW12Rgm9Ya6akw60gkbAEePtjzuuhfsxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708999542; c=relaxed/simple;
	bh=8K/Kfrk8lTUrhoUe58pMRtxBCH2bE9k35DioPCv3Byc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TQBlNsxv/Re41i98Lrjx2MWcg6dKu0Y05GBA3uEmXfCFVFHBCqNeLNPkRESEI1ZB26n9ogn87Ihc4WEmOAmVqFt4mdeYOnKnwnJC+WkFBlXUSMKjsDYuxmM577eC1ib1HHQnXSQbjq8iwgh7os8ap6zYdLwtfn5pdYMm5GxhqzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h8QnVyr7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h8QnVyr7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708999541; x=1740535541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8K/Kfrk8lTUrhoUe58pMRtxBCH2bE9k35DioPCv3Byc=;
  b=h8QnVyr7TM76VtpYCd+/tU6irrp9EwWTVWqkdzUQ9WsuhTatbv4Z9F9A
   BSYj0SJbTejFVqubnm2idZvWv971r8DkK847MPfAX+kR+AcPw5CrF+6F9
   3Qtcqkd2GyAgH4RSuTWHDkGDUWJEi/GpAENsxdo+7xf97P36EaeiFOrR5
   Dm8+mJerWBr0+MzVF/boT48Xb0k3yOrEfhJ8rzsZ9iMcSCNeQvmt0Fxdc
   lODT3alGxY+uSVO0JG7V0kbuYiP0vxXceeGVjX+iToSpEhp1YA5MV5a48
   aexyKOBBUWdw9F93gWF403qvORy1vBPg2Ns+Lkn1AHw/Mjj36nrfCk0fV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="14469864"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="14469864"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 18:05:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="6839244"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 26 Feb 2024 18:05:39 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1remqe-000ArD-0p;
	Tue, 27 Feb 2024 02:05:36 +0000
Date: Tue, 27 Feb 2024 10:04:48 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:arm64-sve-save-support-check 2/2]
 arch/arm64/kernel/fpsimd.c:454:6: error: implicit declaration of function
 'system_support_sve' is invalid in C99
Message-ID: <202402270957.KTiImNcE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git arm64-sve-save-support-check
head:   fff29a9e88fc03d6dd50a8a4b99780d3646a46fa
commit: fff29a9e88fc03d6dd50a8a4b99780d3646a46fa [2/2] arm64/fp: Only check if we need to save SVE registers on systems with SVE
config: arm64-randconfig-001-20240227 (https://download.01.org/0day-ci/archive/20240227/202402270957.KTiImNcE-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240227/202402270957.KTiImNcE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402270957.KTiImNcE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/fpsimd.c:454:6: error: implicit declaration of function 'system_support_sve' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (system_support_sve() &&
               ^
   arch/arm64/kernel/fpsimd.c:454:6: note: did you mean 'system_supports_sve'?
   arch/arm64/include/asm/cpufeature.h:746:29: note: 'system_supports_sve' declared here
   static __always_inline bool system_supports_sve(void)
                               ^
   1 error generated.


vim +/system_support_sve +454 arch/arm64/kernel/fpsimd.c

   423	
   424	/*
   425	 * Ensure FPSIMD/SVE storage in memory for the loaded context is up to
   426	 * date with respect to the CPU registers. Note carefully that the
   427	 * current context is the context last bound to the CPU stored in
   428	 * last, if KVM is involved this may be the guest VM context rather
   429	 * than the host thread for the VM pointed to by current. This means
   430	 * that we must always reference the state storage via last rather
   431	 * than via current, if we are saving KVM state then it will have
   432	 * ensured that the type of registers to save is set in last->to_save.
   433	 */
   434	static void fpsimd_save_user_state(void)
   435	{
   436		struct cpu_fp_state const *last =
   437			this_cpu_ptr(&fpsimd_last_state);
   438		/* set by fpsimd_bind_task_to_cpu() or fpsimd_bind_state_to_cpu() */
   439		bool save_sve_regs = false;
   440		bool save_ffr;
   441		unsigned int vl;
   442	
   443		WARN_ON(!system_supports_fpsimd());
   444		WARN_ON(preemptible());
   445	
   446		if (test_thread_flag(TIF_FOREIGN_FPSTATE))
   447			return;
   448	
   449		/*
   450		 * If a task is in a syscall the ABI allows us to only
   451		 * preserve the state shared with FPSIMD so don't bother
   452		 * saving the full SVE state in that case.
   453		 */
 > 454		if (system_support_sve() &&
   455		    ((last->to_save == FP_STATE_CURRENT && test_thread_flag(TIF_SVE) &&
   456		      !in_syscall(current_pt_regs())) ||
   457		     last->to_save == FP_STATE_SVE)) {
   458			save_sve_regs = true;
   459			save_ffr = true;
   460			vl = last->sve_vl;
   461		}
   462	
   463		if (system_supports_sme()) {
   464			u64 *svcr = last->svcr;
   465	
   466			*svcr = read_sysreg_s(SYS_SVCR);
   467	
   468			if (*svcr & SVCR_ZA_MASK)
   469				sme_save_state(last->sme_state,
   470					       system_supports_sme2());
   471	
   472			/* If we are in streaming mode override regular SVE. */
   473			if (*svcr & SVCR_SM_MASK) {
   474				save_sve_regs = true;
   475				save_ffr = system_supports_fa64();
   476				vl = last->sme_vl;
   477			}
   478		}
   479	
   480		if (IS_ENABLED(CONFIG_ARM64_SVE) && save_sve_regs) {
   481			/* Get the configured VL from RDVL, will account for SM */
   482			if (WARN_ON(sve_get_vl() != vl)) {
   483				/*
   484				 * Can't save the user regs, so current would
   485				 * re-enter user with corrupt state.
   486				 * There's no way to recover, so kill it:
   487				 */
   488				force_signal_inject(SIGKILL, SI_KERNEL, 0, 0);
   489				return;
   490			}
   491	
   492			sve_save_state((char *)last->sve_state +
   493						sve_ffr_offset(vl),
   494				       &last->st->fpsr, save_ffr);
   495			*last->fp_type = FP_STATE_SVE;
   496		} else {
   497			fpsimd_save_state(last->st);
   498			*last->fp_type = FP_STATE_FPSIMD;
   499		}
   500	}
   501	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
