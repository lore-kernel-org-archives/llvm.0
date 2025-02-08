Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A71DDC1;
	Sat,  8 Feb 2025 01:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738977343; cv=none; b=VCAbHa7qhT5B+2GdLptevuQYrIAjxm8v+FjFNJDd8yJOlgguwOyc5HGeHiBPlBi9JWrOJ9rkRRSdsCElNAohsp1xpQP6tjW3r0QIw71rpAj6ct6t0jGNA8Vaa6QxRsRLKAjmuU3yn02VfRrsdml1YxuMERihjjinmTlykQ/qVFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738977343; c=relaxed/simple;
	bh=ZzbCngDiS4HH+GTtGTmyk7NcY5EF+xBYG0rU5hbY08k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QY8WS49DGHJQK+/rnmjxclTV1dcIJywJ1De6ckyKNmmq6Q2hLCZbivzRUt7y0Yeh6LEjayNuG8shcTVFIBOVwdaIAiuxPZp7a8ypN5eqUuVHRUMZakRGvojvVUpIvn0cUrsFAQtjR9/aOseRaMzGLfRtjSFMm/FK22vCecD8jMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oCp/f648; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oCp/f648"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738977341; x=1770513341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZzbCngDiS4HH+GTtGTmyk7NcY5EF+xBYG0rU5hbY08k=;
  b=oCp/f648dSCxj8EVW2z+uyW74XeRyHYAoXnjNvlKBFUj9IDOe8ZKOBjT
   JF7GP0UvQvF/l++/j+vxkFVl3hQ692CrxMPiP4asna8vsWOa5kbqQJ2e9
   m2YlYU3B9hmKoIHaBvYRjB6GkjJ/u01Y9p+01xYeqWsmwFZN3LxdnWE5V
   mbM2AyDT2t0es94VOZ6pRTQwWqILtOoJ3HvDWueyLMhQK2hLLvtLRoCoG
   /fgn5QwY6fRgVPFVShNNpK1qgeD/sEXzsgAx/P9vxiXNubn23AkRgUBvo
   ciNE1FTm9blk7q13bZUsr8NwJjk86Mu9DdfskiMJ4N2O4cF/J+qZ2xvRS
   w==;
X-CSE-ConnectionGUID: /vwytOFVQaKmhoE5H7XA2A==
X-CSE-MsgGUID: Ns8cRk1QSk25De8BqMgvug==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="38830154"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="38830154"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 17:15:40 -0800
X-CSE-ConnectionGUID: rgofqlFeRjmfGANYwyAk5g==
X-CSE-MsgGUID: hpPhOs+4QNOq33o13yWsHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116885389"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Feb 2025 17:15:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgZRY-000zLF-1h;
	Sat, 08 Feb 2025 01:15:36 +0000
Date: Sat, 8 Feb 2025 09:14:56 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/kvm/fpsimd-fixes 11/11] arch/arm64/kvm/fpsimd.c:141:16:
 warning: variable 'old_vl' set but not used
Message-ID: <202502080941.kKctv9BR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/kvm/fpsimd-fixes
head:   874ec7cd4fdbab02ffc8297b012721f9c74f7954
commit: 874ec7cd4fdbab02ffc8297b012721f9c74f7954 [11/11] HACK: Check the host's VL isn't artifically constrained
config: arm64-randconfig-004-20250208 (https://download.01.org/0day-ci/archive/20250208/202502080941.kKctv9BR-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502080941.kKctv9BR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502080941.kKctv9BR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/fpsimd.c:141:16: warning: variable 'old_vl' set but not used [-Wunused-but-set-variable]
                   unsigned int old_vl, new_vl, max_vl;
                                ^
   1 warning generated.


vim +/old_vl +141 arch/arm64/kvm/fpsimd.c

    88	
    89	/*
    90	 * Called just after exiting the guest. If the guest FPSIMD state
    91	 * was loaded, update the host's context tracking data mark the CPU
    92	 * FPSIMD regs as dirty and belonging to vcpu so that they will be
    93	 * written back if the kernel clobbers them due to kernel-mode NEON
    94	 * before re-entry into the guest.
    95	 */
    96	void kvm_arch_vcpu_ctxsync_fp(struct kvm_vcpu *vcpu)
    97	{
    98		struct cpu_fp_state fp_state;
    99	
   100		WARN_ON_ONCE(!irqs_disabled());
   101	
   102		if (guest_owns_fp_regs()) {
   103			if (system_supports_sve()) {
   104				unsigned int active_vl = sve_get_vl();
   105				unsigned int guest_max_vl = vcpu->arch.sve_max_vl;
   106	
   107				WARN_ONCE(active_vl != guest_max_vl,
   108					  "Active VL (%u) is not guest max VL (%u)\n",
   109					  active_vl, guest_max_vl);
   110			}
   111	
   112			/*
   113			 * Currently we do not support SME guests so SVCR is
   114			 * always 0 and we just need a variable to point to.
   115			 */
   116			fp_state.st = &vcpu->arch.ctxt.fp_regs;
   117			fp_state.sve_state = vcpu->arch.sve_state;
   118			fp_state.sve_vl = vcpu->arch.sve_max_vl;
   119			fp_state.sme_state = NULL;
   120			fp_state.svcr = &__vcpu_sys_reg(vcpu, SVCR);
   121			fp_state.fpmr = &__vcpu_sys_reg(vcpu, FPMR);
   122			fp_state.fp_type = &vcpu->arch.fp_type;
   123	
   124			if (vcpu_has_sve(vcpu))
   125				fp_state.to_save = FP_STATE_SVE;
   126			else
   127				fp_state.to_save = FP_STATE_FPSIMD;
   128	
   129			fpsimd_bind_state_to_cpu(&fp_state);
   130	
   131			clear_thread_flag(TIF_FOREIGN_FPSTATE);
   132		}
   133	
   134		/*
   135		 * HACK: test that the hsot can use its maximum VL, regardless of the
   136		 * guest configuration.
   137		 *
   138		 * This relies on NOT being in streaming mode.
   139		 */
   140		if (system_supports_sve()) {
 > 141			unsigned int old_vl, new_vl, max_vl;
   142	
   143			old_vl = sve_get_vl();
   144	
   145			max_vl = sve_max_vl();
   146			sve_cond_update_zcr_vq(sve_vq_from_vl(max_vl) - 1, SYS_ZCR_EL1);
   147			new_vl = sve_get_vl();
   148	
   149			WARN_ONCE(new_vl != max_vl, "Unable to set max VL (%u), got %u\n",
   150				  max_vl, new_vl);
   151	
   152			sve_cond_update_zcr_vq(sve_vq_from_vl(old_vl) - 1, SYS_ZCR_EL1);
   153		}
   154	}
   155	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
