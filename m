Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A76263C8C;
	Fri, 13 Feb 2026 23:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771024253; cv=none; b=PHNSOrPHTW2nNCa02qc33Rtj1JZJnxaJSiteRViw4VpkoeEM4G7PeQihs6lx2GnAs9aptP+GxOHfcwSqvaADheobD4nvWOH2ejKgZdq6gqhnqCHUdEUbLm4QA+JqHCsnkP//l9j3m9C4zZEbFuYNScmMyexTkf++e368EPSwZN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771024253; c=relaxed/simple;
	bh=SXmKxAouT4Cm2cJbQEH5Hd0mYke9hgCKsKTh0tnA0aE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XEh+63zVgPk/2BFWbl7jKHyz69aDDtBgMd1zc51CQZiZ8+WAwbl9mUO/iP1EZiiOBYtSFdoi68PGCseswB3/G8UAJOXMr2tkO7d3JRXxjAauY1YIRh0dR1qWg/jY8L7UK+4pTukAfiplWXojX3bLVdzIcOu0Am33Wx4sDVeW0Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RewahtKr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RewahtKr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771024252; x=1802560252;
  h=date:from:to:cc:subject:message-id;
  bh=SXmKxAouT4Cm2cJbQEH5Hd0mYke9hgCKsKTh0tnA0aE=;
  b=RewahtKrDKQ+mUtojdntviIe8k/pq4MsfS2RG+SaKWtmn/6gb4BQFfms
   3KRGckhenmlIuxSCI+tpTVArfNw46SKuUrpF0EV0K7QgjdUnkM9XHkew0
   VLSEyc0evuM51WM2dKNG4UzYAOJe18EG2PWP/aZQdChsRyslyMDQlXHJ9
   tKzRGgqqThWBov9yrk4ppy4Eal/2KuXNEjkbWhkGLoLrnHJWru2c4zWY8
   c2zDmzA/Mu7/e4Yf4Z+MRzGj8eQQDFLJKYaNf4ujaibXTHKx3gIygJa4S
   EP0rsGai7k5BSZgH1kjKfuOPTAULVjaOu6u+7saf9z1xjCxiLJ8aBte3l
   w==;
X-CSE-ConnectionGUID: D2XajgxfTT6tsWr9OcuJTg==
X-CSE-MsgGUID: rpBj/J7STs+bWcNU4sQCJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="59783156"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="59783156"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 15:10:52 -0800
X-CSE-ConnectionGUID: 7JLrVQi6QKyKamTP1GuNyw==
X-CSE-MsgGUID: 1eAI2FQVT/eoqGo+hShB7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="212444722"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Feb 2026 15:10:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr2JD-00000000vtQ-3roI;
	Fri, 13 Feb 2026 23:10:47 +0000
Date: Sat, 14 Feb 2026 07:09:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_5 5/15]
 arch/powerpc/net/bpf_jit_comp.c:525:20: error: no member named 'cookie' in
 'struct bpf_tramp_link'
Message-ID: <202602140713.CBTxR1GY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_5
head:   3bb11e809e06ec473ee881de417d36f0d164f3fe
commit: 9d5c97a3c65fa6f74af1b36dcfdce91e0c2ab81c [5/15] bpf: Add struct bpf_tramp_node object
config: powerpc64-randconfig-002-20260214 (https://download.01.org/0day-ci/archive/20260214/202602140713.CBTxR1GY-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140713.CBTxR1GY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140713.CBTxR1GY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/net/bpf_jit_comp.c:525:20: error: no member named 'cookie' in 'struct bpf_tramp_link'
     525 |                 PPC_LI64(_R3, l->cookie);
         |                               ~  ^
>> arch/powerpc/net/bpf_jit_comp.c:525:20: error: no member named 'cookie' in 'struct bpf_tramp_link'
     525 |                 PPC_LI64(_R3, l->cookie);
         |                               ~  ^
>> arch/powerpc/net/bpf_jit_comp.c:525:20: error: no member named 'cookie' in 'struct bpf_tramp_link'
     525 |                 PPC_LI64(_R3, l->cookie);
         |                               ~  ^
>> arch/powerpc/net/bpf_jit_comp.c:525:20: error: no member named 'cookie' in 'struct bpf_tramp_link'
     525 |                 PPC_LI64(_R3, l->cookie);
         |                               ~  ^
>> arch/powerpc/net/bpf_jit_comp.c:525:20: error: no member named 'cookie' in 'struct bpf_tramp_link'
     525 |                 PPC_LI64(_R3, l->cookie);
         |                               ~  ^
>> arch/powerpc/net/bpf_jit_comp.c:525:20: error: no member named 'cookie' in 'struct bpf_tramp_link'
     525 |                 PPC_LI64(_R3, l->cookie);
         |                               ~  ^
>> arch/powerpc/net/bpf_jit_comp.c:525:20: error: no member named 'cookie' in 'struct bpf_tramp_link'
     525 |                 PPC_LI64(_R3, l->cookie);
         |                               ~  ^
>> arch/powerpc/net/bpf_jit_comp.c:525:20: error: no member named 'cookie' in 'struct bpf_tramp_link'
     525 |                 PPC_LI64(_R3, l->cookie);
         |                               ~  ^
>> arch/powerpc/net/bpf_jit_comp.c:525:20: error: no member named 'cookie' in 'struct bpf_tramp_link'
     525 |                 PPC_LI64(_R3, l->cookie);
         |                               ~  ^
>> arch/powerpc/net/bpf_jit_comp.c:525:20: error: no member named 'cookie' in 'struct bpf_tramp_link'
     525 |                 PPC_LI64(_R3, l->cookie);
         |                               ~  ^
>> arch/powerpc/net/bpf_jit_comp.c:525:20: error: no member named 'cookie' in 'struct bpf_tramp_link'
     525 |                 PPC_LI64(_R3, l->cookie);
         |                               ~  ^
>> arch/powerpc/net/bpf_jit_comp.c:525:20: error: no member named 'cookie' in 'struct bpf_tramp_link'
     525 |                 PPC_LI64(_R3, l->cookie);
         |                               ~  ^
>> arch/powerpc/net/bpf_jit_comp.c:525:20: error: no member named 'cookie' in 'struct bpf_tramp_link'
     525 |                 PPC_LI64(_R3, l->cookie);
         |                               ~  ^
>> arch/powerpc/net/bpf_jit_comp.c:525:20: error: no member named 'cookie' in 'struct bpf_tramp_link'
     525 |                 PPC_LI64(_R3, l->cookie);
         |                               ~  ^
>> arch/powerpc/net/bpf_jit_comp.c:525:20: error: no member named 'cookie' in 'struct bpf_tramp_link'
     525 |                 PPC_LI64(_R3, l->cookie);
         |                               ~  ^
>> arch/powerpc/net/bpf_jit_comp.c:525:20: error: no member named 'cookie' in 'struct bpf_tramp_link'
     525 |                 PPC_LI64(_R3, l->cookie);
         |                               ~  ^
>> arch/powerpc/net/bpf_jit_comp.c:525:20: error: no member named 'cookie' in 'struct bpf_tramp_link'
     525 |                 PPC_LI64(_R3, l->cookie);
         |                               ~  ^
   arch/powerpc/net/bpf_jit_comp.c:529:20: error: no member named 'cookie' in 'struct bpf_tramp_link'
     529 |                 PPC_LI32(_R3, l->cookie >> 32);
         |                               ~  ^
   arch/powerpc/net/bpf_jit_comp.c:529:20: error: no member named 'cookie' in 'struct bpf_tramp_link'
     529 |                 PPC_LI32(_R3, l->cookie >> 32);
         |                               ~  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +525 arch/powerpc/net/bpf_jit_comp.c

d243b62b7bd3d5 Naveen N Rao 2024-10-30  513  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  514  static int invoke_bpf_prog(u32 *image, u32 *ro_image, struct codegen_context *ctx,
d243b62b7bd3d5 Naveen N Rao 2024-10-30  515  			   struct bpf_tramp_link *l, int regs_off, int retval_off,
d243b62b7bd3d5 Naveen N Rao 2024-10-30  516  			   int run_ctx_off, bool save_ret)
d243b62b7bd3d5 Naveen N Rao 2024-10-30  517  {
d243b62b7bd3d5 Naveen N Rao 2024-10-30  518  	struct bpf_prog *p = l->link.prog;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  519  	ppc_inst_t branch_insn;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  520  	u32 jmp_idx;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  521  	int ret = 0;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  522  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  523  	/* Save cookie */
d243b62b7bd3d5 Naveen N Rao 2024-10-30  524  	if (IS_ENABLED(CONFIG_PPC64)) {
d243b62b7bd3d5 Naveen N Rao 2024-10-30 @525  		PPC_LI64(_R3, l->cookie);
d243b62b7bd3d5 Naveen N Rao 2024-10-30  526  		EMIT(PPC_RAW_STD(_R3, _R1, run_ctx_off + offsetof(struct bpf_tramp_run_ctx,
d243b62b7bd3d5 Naveen N Rao 2024-10-30  527  				 bpf_cookie)));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  528  	} else {
d243b62b7bd3d5 Naveen N Rao 2024-10-30  529  		PPC_LI32(_R3, l->cookie >> 32);
d243b62b7bd3d5 Naveen N Rao 2024-10-30  530  		PPC_LI32(_R4, l->cookie);
d243b62b7bd3d5 Naveen N Rao 2024-10-30  531  		EMIT(PPC_RAW_STW(_R3, _R1,
d243b62b7bd3d5 Naveen N Rao 2024-10-30  532  				 run_ctx_off + offsetof(struct bpf_tramp_run_ctx, bpf_cookie)));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  533  		EMIT(PPC_RAW_STW(_R4, _R1,
d243b62b7bd3d5 Naveen N Rao 2024-10-30  534  				 run_ctx_off + offsetof(struct bpf_tramp_run_ctx, bpf_cookie) + 4));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  535  	}
d243b62b7bd3d5 Naveen N Rao 2024-10-30  536  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  537  	/* __bpf_prog_enter(p, &bpf_tramp_run_ctx) */
d243b62b7bd3d5 Naveen N Rao 2024-10-30  538  	PPC_LI_ADDR(_R3, p);
d243b62b7bd3d5 Naveen N Rao 2024-10-30  539  	EMIT(PPC_RAW_MR(_R25, _R3));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  540  	EMIT(PPC_RAW_ADDI(_R4, _R1, run_ctx_off));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  541  	ret = bpf_jit_emit_func_call_rel(image, ro_image, ctx,
d243b62b7bd3d5 Naveen N Rao 2024-10-30  542  					 (unsigned long)bpf_trampoline_enter(p));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  543  	if (ret)
d243b62b7bd3d5 Naveen N Rao 2024-10-30  544  		return ret;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  545  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  546  	/* Remember prog start time returned by __bpf_prog_enter */
d243b62b7bd3d5 Naveen N Rao 2024-10-30  547  	EMIT(PPC_RAW_MR(_R26, _R3));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  548  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  549  	/*
d243b62b7bd3d5 Naveen N Rao 2024-10-30  550  	 * if (__bpf_prog_enter(p) == 0)
d243b62b7bd3d5 Naveen N Rao 2024-10-30  551  	 *	goto skip_exec_of_prog;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  552  	 *
d243b62b7bd3d5 Naveen N Rao 2024-10-30  553  	 * Emit a nop to be later patched with conditional branch, once offset is known
d243b62b7bd3d5 Naveen N Rao 2024-10-30  554  	 */
d243b62b7bd3d5 Naveen N Rao 2024-10-30  555  	EMIT(PPC_RAW_CMPLI(_R3, 0));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  556  	jmp_idx = ctx->idx;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  557  	EMIT(PPC_RAW_NOP());
d243b62b7bd3d5 Naveen N Rao 2024-10-30  558  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  559  	/* p->bpf_func(ctx) */
d243b62b7bd3d5 Naveen N Rao 2024-10-30  560  	EMIT(PPC_RAW_ADDI(_R3, _R1, regs_off));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  561  	if (!p->jited)
d243b62b7bd3d5 Naveen N Rao 2024-10-30  562  		PPC_LI_ADDR(_R4, (unsigned long)p->insnsi);
59ba025948be2a Hari Bathini 2025-04-22  563  	/* Account for max possible instructions during dummy pass for size calculation */
59ba025948be2a Hari Bathini 2025-04-22  564  	if (image && !create_branch(&branch_insn, (u32 *)&ro_image[ctx->idx],
59ba025948be2a Hari Bathini 2025-04-22  565  				    (unsigned long)p->bpf_func,
d243b62b7bd3d5 Naveen N Rao 2024-10-30  566  				    BRANCH_SET_LINK)) {
d243b62b7bd3d5 Naveen N Rao 2024-10-30  567  		image[ctx->idx] = ppc_inst_val(branch_insn);
d243b62b7bd3d5 Naveen N Rao 2024-10-30  568  		ctx->idx++;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  569  	} else {
d243b62b7bd3d5 Naveen N Rao 2024-10-30  570  		EMIT(PPC_RAW_LL(_R12, _R25, offsetof(struct bpf_prog, bpf_func)));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  571  		EMIT(PPC_RAW_MTCTR(_R12));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  572  		EMIT(PPC_RAW_BCTRL());
d243b62b7bd3d5 Naveen N Rao 2024-10-30  573  	}
d243b62b7bd3d5 Naveen N Rao 2024-10-30  574  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  575  	if (save_ret)
d243b62b7bd3d5 Naveen N Rao 2024-10-30  576  		EMIT(PPC_RAW_STL(_R3, _R1, retval_off));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  577  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  578  	/* Fix up branch */
d243b62b7bd3d5 Naveen N Rao 2024-10-30  579  	if (image) {
d243b62b7bd3d5 Naveen N Rao 2024-10-30  580  		if (create_cond_branch(&branch_insn, &image[jmp_idx],
d243b62b7bd3d5 Naveen N Rao 2024-10-30  581  				       (unsigned long)&image[ctx->idx], COND_EQ << 16))
d243b62b7bd3d5 Naveen N Rao 2024-10-30  582  			return -EINVAL;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  583  		image[jmp_idx] = ppc_inst_val(branch_insn);
d243b62b7bd3d5 Naveen N Rao 2024-10-30  584  	}
d243b62b7bd3d5 Naveen N Rao 2024-10-30  585  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  586  	/* __bpf_prog_exit(p, start_time, &bpf_tramp_run_ctx) */
d243b62b7bd3d5 Naveen N Rao 2024-10-30  587  	EMIT(PPC_RAW_MR(_R3, _R25));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  588  	EMIT(PPC_RAW_MR(_R4, _R26));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  589  	EMIT(PPC_RAW_ADDI(_R5, _R1, run_ctx_off));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  590  	ret = bpf_jit_emit_func_call_rel(image, ro_image, ctx,
d243b62b7bd3d5 Naveen N Rao 2024-10-30  591  					 (unsigned long)bpf_trampoline_exit(p));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  592  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  593  	return ret;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  594  }
d243b62b7bd3d5 Naveen N Rao 2024-10-30  595  

:::::: The code at line 525 was first introduced by commit
:::::: d243b62b7bd3d5314382d3b54e4992226245e936 powerpc64/bpf: Add support for bpf trampolines

:::::: TO: Naveen N Rao <naveen@kernel.org>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
