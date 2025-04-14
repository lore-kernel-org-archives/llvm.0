Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF19C17D2;
	Mon, 14 Apr 2025 02:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744598998; cv=none; b=coDh2wIv/8fCdtkIE18x785SXyg4OC9B3TE6BGwiXHqYCeEEgiReXs6/M75RAE3HXNDPc412S2RyZOCJ3DVUG/bjrdOOwU0LcLMc9VbCnX/S7wjSQ06z5dFF+eeoH/yI3B+0lP8QD5ThAVpyNWaDows6qIUy52MJFNNvQBS065A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744598998; c=relaxed/simple;
	bh=2TN0qQO7ilw7q/GyZKHwuBH/71LJKFhv6isC2S1BLuc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hmu5RpJVpELfY8mcHK4BNAXb7l3xra61jYYveCfEgjqV+/aDP/hiwnZp91d6lNXYAPf/WoH51lyEYsWDXiykIjCUXfw5wrlpUn9CzCvzz+Rk452j0Edo7aiXgcKamQ88LM3J+6IE1HkzXBY6ljO2EUb+L1UGGadwSOfURBTDGy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fa9V/zeA; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fa9V/zeA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744598997; x=1776134997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2TN0qQO7ilw7q/GyZKHwuBH/71LJKFhv6isC2S1BLuc=;
  b=Fa9V/zeAWLDCDbVx9TRkA9ndcFFbxxwWaqDESTGfqIRgXlGkbPiDHvr0
   lvNPtpflyA798SOp+YEA5PDD81UO9V2Nt0JTgM1x7NdsMOJBeXxyeyJJa
   53EVHgoRkuwp7RZEllJjBuZ0EdFYsqAqNMJEpHv+UFcgiHfgHmoPsuBFc
   4+MISygu1oYA0LfAUDHmX25VSSbj2AQpk5GveUWqH+rSNpqVLHcQI1MVE
   1RKm15bFoHaPUCGSsjmExyys8WxMYW6pdrUN+HBkg+kMfU9rIuUgQ4QTq
   n1AnYx/XGPNrqc7E2ezXhRAVRE9Y9ME1KBe8xCtuDy11mcmIpy82fzAUt
   A==;
X-CSE-ConnectionGUID: fKpIh0AXQqKsDhGZpAGObg==
X-CSE-MsgGUID: G/grHJT6TCq1jJVpN/v4sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="48756693"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="48756693"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 19:49:56 -0700
X-CSE-ConnectionGUID: Jq3w8S/mShKDNzQtTy9dvg==
X-CSE-MsgGUID: CFOmwRI/TWi+mXmnH2n/sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="152873136"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Apr 2025 19:49:55 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u49tR-000DI2-02;
	Mon, 14 Apr 2025 02:49:53 +0000
Date: Mon, 14 Apr 2025 10:49:34 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [broonie-misc:for-kernelci 16/44] arch/arm64/kernel/fpsimd.c:404:11:
 error: too many arguments provided to function-like macro invocation
Message-ID: <202504141025.NzX0OKOY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git for-kernelci
head:   b172cafa2943fcb2f66d49d5c683fc9b372fc508
commit: 254bf24ea25aa2c3df7845788f493610cdb037e9 [16/44] arm64/fpsimd: Update FA64 and ZT0 enables when loading SME state
config: arm64-randconfig-001-20250414 (https://download.01.org/0day-ci/archive/20250414/202504141025.NzX0OKOY-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250414/202504141025.NzX0OKOY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504141025.NzX0OKOY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/fpsimd.c:404:11: error: too many arguments provided to function-like macro invocation
     404 |                                              system_supports_sme2(),
         |                                              ^
   arch/arm64/include/asm/fpsimd.h:440:9: note: macro 'sme_cond_update_smcr' defined here
     440 | #define sme_cond_update_smcr(val, reg) do { } while (0)
         |         ^
>> arch/arm64/kernel/fpsimd.c:402:4: error: use of undeclared identifier 'sme_cond_update_smcr'
     402 |                         sme_cond_update_smcr(sve_vq_from_vl(sme_vl) - 1,
         |                         ^
   arch/arm64/kernel/fpsimd.c:1416:10: error: too many arguments provided to function-like macro invocation
    1416 |                                      system_supports_sme2(),
         |                                      ^
   arch/arm64/include/asm/fpsimd.h:440:9: note: macro 'sme_cond_update_smcr' defined here
     440 | #define sme_cond_update_smcr(val, reg) do { } while (0)
         |         ^
   arch/arm64/kernel/fpsimd.c:1414:3: error: use of undeclared identifier 'sme_cond_update_smcr'
    1414 |                 sme_cond_update_smcr(vq_minus_one,
         |                 ^
   4 errors generated.


vim +404 arch/arm64/kernel/fpsimd.c

   271	
   272	/*
   273	 * TIF_SME controls whether a task can use SME without trapping while
   274	 * in userspace, when TIF_SME is set then we must have storage
   275	 * allocated in sve_state and sme_state to store the contents of both ZA
   276	 * and the SVE registers for both streaming and non-streaming modes.
   277	 *
   278	 * If both SVCR.ZA and SVCR.SM are disabled then at any point we
   279	 * may disable TIF_SME and reenable traps.
   280	 */
   281	
   282	
   283	/*
   284	 * TIF_SVE controls whether a task can use SVE without trapping while
   285	 * in userspace, and also (together with TIF_SME) the way a task's
   286	 * FPSIMD/SVE state is stored in thread_struct.
   287	 *
   288	 * The kernel uses this flag to track whether a user task is actively
   289	 * using SVE, and therefore whether full SVE register state needs to
   290	 * be tracked.  If not, the cheaper FPSIMD context handling code can
   291	 * be used instead of the more costly SVE equivalents.
   292	 *
   293	 *  * TIF_SVE or SVCR.SM set:
   294	 *
   295	 *    The task can execute SVE instructions while in userspace without
   296	 *    trapping to the kernel.
   297	 *
   298	 *    During any syscall, the kernel may optionally clear TIF_SVE and
   299	 *    discard the vector state except for the FPSIMD subset.
   300	 *
   301	 *  * TIF_SVE clear:
   302	 *
   303	 *    An attempt by the user task to execute an SVE instruction causes
   304	 *    do_sve_acc() to be called, which does some preparation and then
   305	 *    sets TIF_SVE.
   306	 *
   307	 * During any syscall, the kernel may optionally clear TIF_SVE and
   308	 * discard the vector state except for the FPSIMD subset.
   309	 *
   310	 * The data will be stored in one of two formats:
   311	 *
   312	 *  * FPSIMD only - FP_STATE_FPSIMD:
   313	 *
   314	 *    When the FPSIMD only state stored task->thread.fp_type is set to
   315	 *    FP_STATE_FPSIMD, the FPSIMD registers V0-V31 are encoded in
   316	 *    task->thread.uw.fpsimd_state; bits [max : 128] for each of Z0-Z31 are
   317	 *    logically zero but not stored anywhere; P0-P15 and FFR are not
   318	 *    stored and have unspecified values from userspace's point of
   319	 *    view.  For hygiene purposes, the kernel zeroes them on next use,
   320	 *    but userspace is discouraged from relying on this.
   321	 *
   322	 *    task->thread.sve_state does not need to be non-NULL, valid or any
   323	 *    particular size: it must not be dereferenced and any data stored
   324	 *    there should be considered stale and not referenced.
   325	 *
   326	 *  * SVE state - FP_STATE_SVE:
   327	 *
   328	 *    When the full SVE state is stored task->thread.fp_type is set to
   329	 *    FP_STATE_SVE and Z0-Z31 (incorporating Vn in bits[127:0] or the
   330	 *    corresponding Zn), P0-P15 and FFR are encoded in in
   331	 *    task->thread.sve_state, formatted appropriately for vector
   332	 *    length task->thread.sve_vl or, if SVCR.SM is set,
   333	 *    task->thread.sme_vl. The storage for the vector registers in
   334	 *    task->thread.uw.fpsimd_state should be ignored.
   335	 *
   336	 *    task->thread.sve_state must point to a valid buffer at least
   337	 *    sve_state_size(task) bytes in size. The data stored in
   338	 *    task->thread.uw.fpsimd_state.vregs should be considered stale
   339	 *    and not referenced.
   340	 *
   341	 *  * FPSR and FPCR are always stored in task->thread.uw.fpsimd_state
   342	 *    irrespective of whether TIF_SVE is clear or set, since these are
   343	 *    not vector length dependent.
   344	 */
   345	
   346	/*
   347	 * Update current's FPSIMD/SVE registers from thread_struct.
   348	 *
   349	 * This function should be called only when the FPSIMD/SVE state in
   350	 * thread_struct is known to be up to date, when preparing to enter
   351	 * userspace.
   352	 */
   353	static void task_fpsimd_load(void)
   354	{
   355		bool restore_sve_regs = false;
   356		bool restore_ffr;
   357	
   358		WARN_ON(!system_supports_fpsimd());
   359		WARN_ON(preemptible());
   360		WARN_ON(test_thread_flag(TIF_KERNEL_FPSTATE));
   361	
   362		if (system_supports_sve() || system_supports_sme()) {
   363			switch (current->thread.fp_type) {
   364			case FP_STATE_FPSIMD:
   365				/* Stop tracking SVE for this task until next use. */
   366				clear_thread_flag(TIF_SVE);
   367				break;
   368			case FP_STATE_SVE:
   369				if (!thread_sm_enabled(&current->thread))
   370					WARN_ON_ONCE(!test_and_set_thread_flag(TIF_SVE));
   371	
   372				if (test_thread_flag(TIF_SVE))
   373					sve_set_vq(sve_vq_from_vl(task_get_sve_vl(current)) - 1);
   374	
   375				restore_sve_regs = true;
   376				restore_ffr = true;
   377				break;
   378			default:
   379				/*
   380				 * This indicates either a bug in
   381				 * fpsimd_save_user_state() or memory corruption, we
   382				 * should always record an explicit format
   383				 * when we save. We always at least have the
   384				 * memory allocated for FPSIMD registers so
   385				 * try that and hope for the best.
   386				 */
   387				WARN_ON_ONCE(1);
   388				clear_thread_flag(TIF_SVE);
   389				break;
   390			}
   391		}
   392	
   393		/* Restore SME, override SVE register configuration if needed */
   394		if (system_supports_sme()) {
   395			unsigned long sme_vl = task_get_sme_vl(current);
   396	
   397			/*
   398			 * Ensure VL is set up for restoring data.  KVM might
   399			 * disable subfeatures so we reset them each time.
   400			 */
   401			if (test_thread_flag(TIF_SME))
 > 402				sme_cond_update_smcr(sve_vq_from_vl(sme_vl) - 1,
   403						     system_supports_fa64(),
 > 404						     system_supports_sme2(),
   405						     SYS_SMCR_EL1);
   406	
   407			write_sysreg_s(current->thread.svcr, SYS_SVCR);
   408	
   409			if (thread_za_enabled(&current->thread))
   410				sme_load_state(current->thread.sme_state,
   411					       system_supports_sme2());
   412	
   413			if (thread_sm_enabled(&current->thread))
   414				restore_ffr = system_supports_fa64();
   415		}
   416	
   417		if (system_supports_fpmr())
   418			write_sysreg_s(current->thread.uw.fpmr, SYS_FPMR);
   419	
   420		if (restore_sve_regs) {
   421			WARN_ON_ONCE(current->thread.fp_type != FP_STATE_SVE);
   422			sve_load_state(sve_pffr(&current->thread),
   423				       &current->thread.uw.fpsimd_state.fpsr,
   424				       restore_ffr);
   425		} else {
   426			WARN_ON_ONCE(current->thread.fp_type != FP_STATE_FPSIMD);
   427			fpsimd_load_state(&current->thread.uw.fpsimd_state);
   428		}
   429	}
   430	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
