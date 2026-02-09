Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD0027C866;
	Mon,  9 Feb 2026 20:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770669543; cv=none; b=tKyUKg3ZWtJC4kyUeTBsV8RcJ+xCyeUMwcqkhpFfKA1hCg0xN43ZAl0MVZuxfxYYAcvAw4K4DKMflO3o5nmskxeOFfyyBupWBzvr/Bb39uTTna4zBSEVzRBP65P/SQ5JsLrPM+pi8bkaSt1TwnKMXbVNUmD1QFfMPgwGgjrJcZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770669543; c=relaxed/simple;
	bh=qHLjsDaga3CYKeVDQtzArGl5Ae11uJp5SyZ+P5aBl80=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o0pn51fZCtAdfZEwx29D5yOx6hMemUBy5L47KGw6JLNcQL1vfvgshnnUNeRjnnvSebMmSUuBNolvA4xyGT/wHOLwjIrKp7YVFZ/bihqIldbO86w0rcaZvbxABHDp/h4j8yFVx9LMzg7ueWAipHGZJzZSMHAlFAMyRn0qYepZadE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eDQQvNrV; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eDQQvNrV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770669542; x=1802205542;
  h=date:from:to:cc:subject:message-id;
  bh=qHLjsDaga3CYKeVDQtzArGl5Ae11uJp5SyZ+P5aBl80=;
  b=eDQQvNrVoYl5PudNjf/e0kC6qNyYyHouYOTnSjVhPotBKtJMoCHw2Pk2
   sDIy0Ckk0fCm7fpLp+GS1v9La0tgqYMMXufAzQfFpq5zjAURAJdhsAilU
   Zc5fkDV9bIKTUn9JR0NfuQ0fk4CSchbJcgjj29ovuSzcq3LOHkbhmq7y/
   aIraNdC4Kh1QKljFj3yRH1+Ug/rgB/nAvVjCtMk5lCU+3WRUyVGPyBGNf
   kkuijxZSnVKIRKN8nXwmaQdEynvMgZPPZf/jnoKccis6JYvYL9bLb0g5g
   zRJzJXRJU0UQkFOLVXK4iTsklB53AG7IP2cJ7w3UFPHpYhB2TaSrSqaNU
   g==;
X-CSE-ConnectionGUID: 4oQAwJzDRPCPqrLxpWhRdQ==
X-CSE-MsgGUID: CozRPoATSO6U52nmhi4G1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71690344"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="71690344"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 12:39:02 -0800
X-CSE-ConnectionGUID: NgNha05zS++In+f8k2m6ZQ==
X-CSE-MsgGUID: mJxTyoREQPWmPbCLIA410w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="211706695"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Feb 2026 12:38:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpY23-00000000oJg-1bxl;
	Mon, 09 Feb 2026 20:38:55 +0000
Date: Tue, 10 Feb 2026 04:38:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_1 4/12]
 arch/powerpc/net/bpf_jit_comp.c:567:17: warning: declaration of 'struct
 bpf_tramp_links' will not be visible outside of this function
Message-ID: <202602100410.G51dMk14-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_1
head:   95bf1a3ff57efabf9b7c50b8a0d3583a6714f5d8
commit: 839b12f2dd3dd0be0a7321691ec25efca4132668 [4/12] bpf: Add struct bpf_tramp_node object
config: powerpc-randconfig-001-20260210 (https://download.01.org/0day-ci/archive/20260210/202602100410.G51dMk14-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100410.G51dMk14-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100410.G51dMk14-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/powerpc/net/bpf_jit_comp.c:499:20: error: no member named 'cookie' in 'struct bpf_tramp_link'
     499 |                 PPC_LI32(_R3, l->cookie >> 32);
         |                               ~  ^
   arch/powerpc/net/bpf_jit_comp.c:499:20: error: no member named 'cookie' in 'struct bpf_tramp_link'
     499 |                 PPC_LI32(_R3, l->cookie >> 32);
         |                               ~  ^
   arch/powerpc/net/bpf_jit_comp.c:499:20: error: no member named 'cookie' in 'struct bpf_tramp_link'
     499 |                 PPC_LI32(_R3, l->cookie >> 32);
         |                               ~  ^
   arch/powerpc/net/bpf_jit_comp.c:499:20: error: no member named 'cookie' in 'struct bpf_tramp_link'
     499 |                 PPC_LI32(_R3, l->cookie >> 32);
         |                               ~  ^
   arch/powerpc/net/bpf_jit_comp.c:499:20: error: no member named 'cookie' in 'struct bpf_tramp_link'
     499 |                 PPC_LI32(_R3, l->cookie >> 32);
         |                               ~  ^
   arch/powerpc/net/bpf_jit_comp.c:499:20: error: no member named 'cookie' in 'struct bpf_tramp_link'
     499 |                 PPC_LI32(_R3, l->cookie >> 32);
         |                               ~  ^
   arch/powerpc/net/bpf_jit_comp.c:500:20: error: no member named 'cookie' in 'struct bpf_tramp_link'
     500 |                 PPC_LI32(_R4, l->cookie);
         |                               ~  ^
   arch/powerpc/net/bpf_jit_comp.c:500:20: error: no member named 'cookie' in 'struct bpf_tramp_link'
     500 |                 PPC_LI32(_R4, l->cookie);
         |                               ~  ^
   arch/powerpc/net/bpf_jit_comp.c:500:20: error: no member named 'cookie' in 'struct bpf_tramp_link'
     500 |                 PPC_LI32(_R4, l->cookie);
         |                               ~  ^
   arch/powerpc/net/bpf_jit_comp.c:500:20: error: no member named 'cookie' in 'struct bpf_tramp_link'
     500 |                 PPC_LI32(_R4, l->cookie);
         |                               ~  ^
   arch/powerpc/net/bpf_jit_comp.c:500:20: error: no member named 'cookie' in 'struct bpf_tramp_link'
     500 |                 PPC_LI32(_R4, l->cookie);
         |                               ~  ^
   arch/powerpc/net/bpf_jit_comp.c:500:20: error: no member named 'cookie' in 'struct bpf_tramp_link'
     500 |                 PPC_LI32(_R4, l->cookie);
         |                               ~  ^
>> arch/powerpc/net/bpf_jit_comp.c:567:17: warning: declaration of 'struct bpf_tramp_links' will not be visible outside of this function [-Wvisibility]
     567 |                               struct bpf_tramp_links *tl, int regs_off, int retval_off,
         |                                      ^
   arch/powerpc/net/bpf_jit_comp.c:578:20: error: incomplete definition of type 'struct bpf_tramp_links'
     578 |         for (i = 0; i < tl->nr_links; i++) {
         |                         ~~^
   arch/powerpc/net/bpf_jit_comp.c:567:17: note: forward declaration of 'struct bpf_tramp_links'
     567 |                               struct bpf_tramp_links *tl, int regs_off, int retval_off,
         |                                      ^
   arch/powerpc/net/bpf_jit_comp.c:579:47: error: incomplete definition of type 'struct bpf_tramp_links'
     579 |                 if (invoke_bpf_prog(image, ro_image, ctx, tl->links[i], regs_off, retval_off,
         |                                                           ~~^
   arch/powerpc/net/bpf_jit_comp.c:567:17: note: forward declaration of 'struct bpf_tramp_links'
     567 |                               struct bpf_tramp_links *tl, int regs_off, int retval_off,
         |                                      ^
   arch/powerpc/net/bpf_jit_comp.c:678:14: warning: declaration of 'struct bpf_tramp_links' will not be visible outside of this function [-Wvisibility]
     678 |                                          struct bpf_tramp_links *tlinks,
         |                                                 ^
   arch/powerpc/net/bpf_jit_comp.c:683:44: error: subscript of pointer to incomplete type 'struct bpf_tramp_links'
     683 |         struct bpf_tramp_links *fmod_ret = &tlinks[BPF_TRAMP_MODIFY_RETURN];
         |                                             ~~~~~~^
   arch/powerpc/net/bpf_jit_comp.c:678:14: note: forward declaration of 'struct bpf_tramp_links'
     678 |                                          struct bpf_tramp_links *tlinks,
         |                                                 ^
   arch/powerpc/net/bpf_jit_comp.c:684:42: error: subscript of pointer to incomplete type 'struct bpf_tramp_links'
     684 |         struct bpf_tramp_links *fentry = &tlinks[BPF_TRAMP_FENTRY];
         |                                           ~~~~~~^
   arch/powerpc/net/bpf_jit_comp.c:678:14: note: forward declaration of 'struct bpf_tramp_links'
     678 |                                          struct bpf_tramp_links *tlinks,
         |                                                 ^
   arch/powerpc/net/bpf_jit_comp.c:685:41: error: subscript of pointer to incomplete type 'struct bpf_tramp_links'
     685 |         struct bpf_tramp_links *fexit = &tlinks[BPF_TRAMP_FEXIT];
         |                                          ~~~~~~^
   arch/powerpc/net/bpf_jit_comp.c:678:14: note: forward declaration of 'struct bpf_tramp_links'
     678 |                                          struct bpf_tramp_links *tlinks,
         |                                                 ^
   arch/powerpc/net/bpf_jit_comp.c:870:24: error: incomplete definition of type 'struct bpf_tramp_links'
     870 |         for (i = 0; i < fentry->nr_links; i++)
         |                         ~~~~~~^
   arch/powerpc/net/bpf_jit_comp.c:678:14: note: forward declaration of 'struct bpf_tramp_links'
     678 |                                          struct bpf_tramp_links *tlinks,
         |                                                 ^
   arch/powerpc/net/bpf_jit_comp.c:871:51: error: incomplete definition of type 'struct bpf_tramp_links'
     871 |                 if (invoke_bpf_prog(image, ro_image, ctx, fentry->links[i], regs_off, retval_off,
         |                                                           ~~~~~~^
   arch/powerpc/net/bpf_jit_comp.c:678:14: note: forward declaration of 'struct bpf_tramp_links'
     678 |                                          struct bpf_tramp_links *tlinks,
         |                                                 ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   2 warnings and 20 errors generated.


vim +567 arch/powerpc/net/bpf_jit_comp.c

d243b62b7bd3d5 Naveen N Rao 2024-10-30  483  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  484  static int invoke_bpf_prog(u32 *image, u32 *ro_image, struct codegen_context *ctx,
d243b62b7bd3d5 Naveen N Rao 2024-10-30  485  			   struct bpf_tramp_link *l, int regs_off, int retval_off,
d243b62b7bd3d5 Naveen N Rao 2024-10-30  486  			   int run_ctx_off, bool save_ret)
d243b62b7bd3d5 Naveen N Rao 2024-10-30  487  {
d243b62b7bd3d5 Naveen N Rao 2024-10-30  488  	struct bpf_prog *p = l->link.prog;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  489  	ppc_inst_t branch_insn;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  490  	u32 jmp_idx;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  491  	int ret = 0;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  492  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  493  	/* Save cookie */
d243b62b7bd3d5 Naveen N Rao 2024-10-30  494  	if (IS_ENABLED(CONFIG_PPC64)) {
d243b62b7bd3d5 Naveen N Rao 2024-10-30  495  		PPC_LI64(_R3, l->cookie);
d243b62b7bd3d5 Naveen N Rao 2024-10-30  496  		EMIT(PPC_RAW_STD(_R3, _R1, run_ctx_off + offsetof(struct bpf_tramp_run_ctx,
d243b62b7bd3d5 Naveen N Rao 2024-10-30  497  				 bpf_cookie)));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  498  	} else {
d243b62b7bd3d5 Naveen N Rao 2024-10-30  499  		PPC_LI32(_R3, l->cookie >> 32);
d243b62b7bd3d5 Naveen N Rao 2024-10-30 @500  		PPC_LI32(_R4, l->cookie);
d243b62b7bd3d5 Naveen N Rao 2024-10-30  501  		EMIT(PPC_RAW_STW(_R3, _R1,
d243b62b7bd3d5 Naveen N Rao 2024-10-30  502  				 run_ctx_off + offsetof(struct bpf_tramp_run_ctx, bpf_cookie)));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  503  		EMIT(PPC_RAW_STW(_R4, _R1,
d243b62b7bd3d5 Naveen N Rao 2024-10-30  504  				 run_ctx_off + offsetof(struct bpf_tramp_run_ctx, bpf_cookie) + 4));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  505  	}
d243b62b7bd3d5 Naveen N Rao 2024-10-30  506  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  507  	/* __bpf_prog_enter(p, &bpf_tramp_run_ctx) */
d243b62b7bd3d5 Naveen N Rao 2024-10-30  508  	PPC_LI_ADDR(_R3, p);
d243b62b7bd3d5 Naveen N Rao 2024-10-30  509  	EMIT(PPC_RAW_MR(_R25, _R3));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  510  	EMIT(PPC_RAW_ADDI(_R4, _R1, run_ctx_off));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  511  	ret = bpf_jit_emit_func_call_rel(image, ro_image, ctx,
d243b62b7bd3d5 Naveen N Rao 2024-10-30  512  					 (unsigned long)bpf_trampoline_enter(p));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  513  	if (ret)
d243b62b7bd3d5 Naveen N Rao 2024-10-30  514  		return ret;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  515  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  516  	/* Remember prog start time returned by __bpf_prog_enter */
d243b62b7bd3d5 Naveen N Rao 2024-10-30  517  	EMIT(PPC_RAW_MR(_R26, _R3));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  518  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  519  	/*
d243b62b7bd3d5 Naveen N Rao 2024-10-30  520  	 * if (__bpf_prog_enter(p) == 0)
d243b62b7bd3d5 Naveen N Rao 2024-10-30  521  	 *	goto skip_exec_of_prog;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  522  	 *
d243b62b7bd3d5 Naveen N Rao 2024-10-30  523  	 * Emit a nop to be later patched with conditional branch, once offset is known
d243b62b7bd3d5 Naveen N Rao 2024-10-30  524  	 */
d243b62b7bd3d5 Naveen N Rao 2024-10-30  525  	EMIT(PPC_RAW_CMPLI(_R3, 0));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  526  	jmp_idx = ctx->idx;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  527  	EMIT(PPC_RAW_NOP());
d243b62b7bd3d5 Naveen N Rao 2024-10-30  528  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  529  	/* p->bpf_func(ctx) */
d243b62b7bd3d5 Naveen N Rao 2024-10-30  530  	EMIT(PPC_RAW_ADDI(_R3, _R1, regs_off));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  531  	if (!p->jited)
d243b62b7bd3d5 Naveen N Rao 2024-10-30  532  		PPC_LI_ADDR(_R4, (unsigned long)p->insnsi);
59ba025948be2a Hari Bathini 2025-04-22  533  	/* Account for max possible instructions during dummy pass for size calculation */
59ba025948be2a Hari Bathini 2025-04-22  534  	if (image && !create_branch(&branch_insn, (u32 *)&ro_image[ctx->idx],
59ba025948be2a Hari Bathini 2025-04-22  535  				    (unsigned long)p->bpf_func,
d243b62b7bd3d5 Naveen N Rao 2024-10-30  536  				    BRANCH_SET_LINK)) {
d243b62b7bd3d5 Naveen N Rao 2024-10-30  537  		image[ctx->idx] = ppc_inst_val(branch_insn);
d243b62b7bd3d5 Naveen N Rao 2024-10-30  538  		ctx->idx++;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  539  	} else {
d243b62b7bd3d5 Naveen N Rao 2024-10-30  540  		EMIT(PPC_RAW_LL(_R12, _R25, offsetof(struct bpf_prog, bpf_func)));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  541  		EMIT(PPC_RAW_MTCTR(_R12));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  542  		EMIT(PPC_RAW_BCTRL());
d243b62b7bd3d5 Naveen N Rao 2024-10-30  543  	}
d243b62b7bd3d5 Naveen N Rao 2024-10-30  544  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  545  	if (save_ret)
d243b62b7bd3d5 Naveen N Rao 2024-10-30  546  		EMIT(PPC_RAW_STL(_R3, _R1, retval_off));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  547  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  548  	/* Fix up branch */
d243b62b7bd3d5 Naveen N Rao 2024-10-30  549  	if (image) {
d243b62b7bd3d5 Naveen N Rao 2024-10-30  550  		if (create_cond_branch(&branch_insn, &image[jmp_idx],
d243b62b7bd3d5 Naveen N Rao 2024-10-30  551  				       (unsigned long)&image[ctx->idx], COND_EQ << 16))
d243b62b7bd3d5 Naveen N Rao 2024-10-30  552  			return -EINVAL;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  553  		image[jmp_idx] = ppc_inst_val(branch_insn);
d243b62b7bd3d5 Naveen N Rao 2024-10-30  554  	}
d243b62b7bd3d5 Naveen N Rao 2024-10-30  555  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  556  	/* __bpf_prog_exit(p, start_time, &bpf_tramp_run_ctx) */
d243b62b7bd3d5 Naveen N Rao 2024-10-30  557  	EMIT(PPC_RAW_MR(_R3, _R25));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  558  	EMIT(PPC_RAW_MR(_R4, _R26));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  559  	EMIT(PPC_RAW_ADDI(_R5, _R1, run_ctx_off));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  560  	ret = bpf_jit_emit_func_call_rel(image, ro_image, ctx,
d243b62b7bd3d5 Naveen N Rao 2024-10-30  561  					 (unsigned long)bpf_trampoline_exit(p));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  562  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  563  	return ret;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  564  }
d243b62b7bd3d5 Naveen N Rao 2024-10-30  565  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  566  static int invoke_bpf_mod_ret(u32 *image, u32 *ro_image, struct codegen_context *ctx,
d243b62b7bd3d5 Naveen N Rao 2024-10-30 @567  			      struct bpf_tramp_links *tl, int regs_off, int retval_off,
d243b62b7bd3d5 Naveen N Rao 2024-10-30  568  			      int run_ctx_off, u32 *branches)
d243b62b7bd3d5 Naveen N Rao 2024-10-30  569  {
d243b62b7bd3d5 Naveen N Rao 2024-10-30  570  	int i;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  571  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  572  	/*
d243b62b7bd3d5 Naveen N Rao 2024-10-30  573  	 * The first fmod_ret program will receive a garbage return value.
d243b62b7bd3d5 Naveen N Rao 2024-10-30  574  	 * Set this to 0 to avoid confusing the program.
d243b62b7bd3d5 Naveen N Rao 2024-10-30  575  	 */
d243b62b7bd3d5 Naveen N Rao 2024-10-30  576  	EMIT(PPC_RAW_LI(_R3, 0));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  577  	EMIT(PPC_RAW_STL(_R3, _R1, retval_off));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  578  	for (i = 0; i < tl->nr_links; i++) {
d243b62b7bd3d5 Naveen N Rao 2024-10-30  579  		if (invoke_bpf_prog(image, ro_image, ctx, tl->links[i], regs_off, retval_off,
d243b62b7bd3d5 Naveen N Rao 2024-10-30  580  				    run_ctx_off, true))
d243b62b7bd3d5 Naveen N Rao 2024-10-30  581  			return -EINVAL;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  582  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  583  		/*
d243b62b7bd3d5 Naveen N Rao 2024-10-30  584  		 * mod_ret prog stored return value after prog ctx. Emit:
d243b62b7bd3d5 Naveen N Rao 2024-10-30  585  		 * if (*(u64 *)(ret_val) !=  0)
d243b62b7bd3d5 Naveen N Rao 2024-10-30  586  		 *	goto do_fexit;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  587  		 */
d243b62b7bd3d5 Naveen N Rao 2024-10-30  588  		EMIT(PPC_RAW_LL(_R3, _R1, retval_off));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  589  		EMIT(PPC_RAW_CMPLI(_R3, 0));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  590  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  591  		/*
d243b62b7bd3d5 Naveen N Rao 2024-10-30  592  		 * Save the location of the branch and generate a nop, which is
d243b62b7bd3d5 Naveen N Rao 2024-10-30  593  		 * replaced with a conditional jump once do_fexit (i.e. the
d243b62b7bd3d5 Naveen N Rao 2024-10-30  594  		 * start of the fexit invocation) is finalized.
d243b62b7bd3d5 Naveen N Rao 2024-10-30  595  		 */
d243b62b7bd3d5 Naveen N Rao 2024-10-30  596  		branches[i] = ctx->idx;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  597  		EMIT(PPC_RAW_NOP());
d243b62b7bd3d5 Naveen N Rao 2024-10-30  598  	}
d243b62b7bd3d5 Naveen N Rao 2024-10-30  599  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  600  	return 0;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  601  }
d243b62b7bd3d5 Naveen N Rao 2024-10-30  602  

:::::: The code at line 567 was first introduced by commit
:::::: d243b62b7bd3d5314382d3b54e4992226245e936 powerpc64/bpf: Add support for bpf trampolines

:::::: TO: Naveen N Rao <naveen@kernel.org>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
