Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794422983;
	b=rB0hhMvHefWo0KtdNVzoz/FROKXVWw30DZc7+gvdUP7PdovgBLUhgokbfXlSx0JB32f3
	 X2mmdLaq9CA8QPmclKN8eBxdRw150cKYcVggAsrOXnikGOr118GrvPZB8nsEVqEqOsbiS
	 7cz5oRQOBKymRQibv43GWzmlxpN3teh5FQxuIrfg67F+ECA4yE/ZK8d/dsl38pAO+oROf
	 9wUF8kiz13OyK590MDHSFI9gQ8B9i2zzmRUDHXWG879e4mktsIuD3JfsIU9PJDzr7VJk8
	 JCNt7dAG63mY6R3In3NgpRrJBme/CayRF4+9ysLlNYpFQM+MGp07N+RnKAfGCsrt56A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422983;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=TgCrwBKFq42a525hu7rEDiY5DjHtPJaOdzFQRX+vxOs=;
	b=Et1a8vtawd75sb3gvTOQ7yA3SFs2ErQ/H3iNaiZ6qZ/eVXbGG7RsaGjye4nF0U9/2AIa
	 enJ5MirhweFy4gZzFvlse4/ftlPmD4UUQHyjJ2wffGqKd1V7KfJnEC978unp5vDCHC2jg
	 Q3Ob/YAzMIfy7aN84ebz3mUm01al4pMBoMqWND3l8NukRAlxc9qxFej8KGMFLX47gzU8s
	 GfvbC3XMBnHuPBooidzJJokTlMGdGxgxFCbANzgQYi08x+IjhMGZByMYT8Sbrwz3ZiaMh
	 mSvDyBxRfB9d2K9r4GV7gjMDUaMiXMxkhlpp+tGIr/Db+yxA/ke/0HbOc86p0Gda28A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Hu/3eh2K";
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD65606A31C;
	Wed, 11 Nov 2026 18:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FD65606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Hu/3eh2K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794422983; x=1825958983;
  h=date:from:to:cc:subject:message-id;
  bh=8Fi263fTWMQL5JZY4nx1gjLOjQoSKf07Ted47iwdVhQ=;
  b=Hu/3eh2KeXNKkTXzHqQ95OoTOWs387uyjadt8loJrV1NctkCBu8z1B+x
   90kqpCJ9SJQDxGVX2QC1V4cL/2kyvQvwMDBg5/YSptMdL/okKTN4GSz3w
   dgnUrKxIlvc+esF7C7zBNc7P4POeI9CasZT5hKduM8ZPOgrunRc7/yrg3
   571mOVd3f6xteDl/xTefuWfXIJ4Vgw/zfkRQBzz5M1wXbEZ2WdeesWUql
   jfxa83qQ1CPQOSzAQFpINA4U8zho2eN7fD79GV3OfPRKoM4vtvbkH+cBp
   /DPmCzSmZ89hS6YIiYn3uIanEZkRERf25dvP6Vc1QS7zLgenNPlD3AvDA
   Q==;
X-CSE-ConnectionGUID: 75oPVf+ZT62uDUBG7nDxpg==
X-CSE-MsgGUID: LicbV5BIQHOw3Cp/eLkiQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3083446"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3083446"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 10:49:42 -0800
X-CSE-ConnectionGUID: 5I36G2dISbOVLtWWhtN2JQ==
X-CSE-MsgGUID: X+XfVlYcRBun4YnGIWx8KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8629678"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Nov 2026 10:49:39 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRDO5-00000000zVb-2c31;
	Wed, 11 Nov 2026 18:49:37 +0000
Date: Thu, 12 Nov 2026 02:49:14 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 3665/6082] kernel/bpf/scev.c:3391:5:
 warning: stack frame size (1088) exceeds limit (1024) in
 'bpf_compute_loop_iters'
Message-ID: <202611120249.0rbvGayD-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
commit: df9b13a441c9bc33e79f9dab0ff404b362fbc2a1 [3665/6082] bpf: Keep the first iteration of a counted loop apart
config: mips-eyeq6_defconfig (https://download.01.org/0day-ci/archive/20261112/202611120249.0rbvGayD-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project e73e336290028f26553b46c9fba844c13da38c9c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611120249.0rbvGayD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611120249.0rbvGayD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/scev.c:3391:5: warning: stack frame size (1088) exceeds limit (1024) in 'bpf_compute_loop_iters' [-Wframe-larger-than]
    3391 | int bpf_compute_loop_iters(struct bpf_verifier_env *env, struct bpf_verifier_state *st,
         |     ^
   1 warning generated.


vim +/bpf_compute_loop_iters +3391 kernel/bpf/scev.c

638524a5a88244 Alexei Starovoitov 2026-11-03  3390  
638524a5a88244 Alexei Starovoitov 2026-11-03 @3391  int bpf_compute_loop_iters(struct bpf_verifier_env *env, struct bpf_verifier_state *st,
638524a5a88244 Alexei Starovoitov 2026-11-03  3392  			   struct bpf_loop_iters *iters)
638524a5a88244 Alexei Starovoitov 2026-11-03  3393  {
638524a5a88244 Alexei Starovoitov 2026-11-03  3394  	struct bpf_func_state *cur_func = st->frame[st->curframe];
638524a5a88244 Alexei Starovoitov 2026-11-03  3395  	struct bpf_insn_aux_data *aux = env->insn_aux_data;
638524a5a88244 Alexei Starovoitov 2026-11-03  3396  	struct bpf_verifier_log *log = &env->log;
638524a5a88244 Alexei Starovoitov 2026-11-03  3397  	struct scev *scev = env->scev;
638524a5a88244 Alexei Starovoitov 2026-11-03  3398  	struct env *header_env;
638524a5a88244 Alexei Starovoitov 2026-11-03  3399  	struct linear_latch latch, first;
638524a5a88244 Alexei Starovoitov 2026-11-03  3400  	struct linear_coefs coefs;
638524a5a88244 Alexei Starovoitov 2026-11-03  3401  	struct bpf_loop_iters tmp;
638524a5a88244 Alexei Starovoitov 2026-11-03  3402  	struct bpf_loop *loop;
638524a5a88244 Alexei Starovoitov 2026-11-03  3403  	int insn_idx = st->insn_idx;
638524a5a88244 Alexei Starovoitov 2026-11-03  3404  	u64 until, false_until;
9b202a8c7722dd Alexei Starovoitov 2026-11-07  3405  	bool same = true, walk = false;
638524a5a88244 Alexei Starovoitov 2026-11-03  3406  	int err, i;
638524a5a88244 Alexei Starovoitov 2026-11-03  3407  	u32 r;
638524a5a88244 Alexei Starovoitov 2026-11-03  3408  
638524a5a88244 Alexei Starovoitov 2026-11-03  3409  	if (!env->allow_uninit_stack)
638524a5a88244 Alexei Starovoitov 2026-11-03  3410  		return 0;
638524a5a88244 Alexei Starovoitov 2026-11-03  3411  
638524a5a88244 Alexei Starovoitov 2026-11-03  3412  	/*
638524a5a88244 Alexei Starovoitov 2026-11-03  3413  	 * If insn_idx is a loop header for a reducible loop.
638524a5a88244 Alexei Starovoitov 2026-11-03  3414  	 * loop is NULL for secondary entries to irreducible loops.
638524a5a88244 Alexei Starovoitov 2026-11-03  3415  	 */
638524a5a88244 Alexei Starovoitov 2026-11-03  3416  	loop = aux[insn_idx].loop;
638524a5a88244 Alexei Starovoitov 2026-11-03  3417  	if (!loop || loop->irreducible || loop->backedges_overflow ||
638524a5a88244 Alexei Starovoitov 2026-11-03  3418  	    loop->nested_exits_overflow) {
638524a5a88244 Alexei Starovoitov 2026-11-03  3419  		if (log->level & BPF_LOG_LEVEL2)
638524a5a88244 Alexei Starovoitov 2026-11-03  3420  			bpf_log(log, "loop header at %d, unsupported loop:%s%s%s\n", insn_idx,
638524a5a88244 Alexei Starovoitov 2026-11-03  3421  				!loop || loop->irreducible ? " irreducible" : "",
638524a5a88244 Alexei Starovoitov 2026-11-03  3422  				loop && loop->backedges_overflow ? " too many backedges" : "",
638524a5a88244 Alexei Starovoitov 2026-11-03  3423  				loop && loop->nested_exits_overflow ?
638524a5a88244 Alexei Starovoitov 2026-11-03  3424  				" too many exits of a nested loop" : "");
638524a5a88244 Alexei Starovoitov 2026-11-03  3425  		return 0;
638524a5a88244 Alexei Starovoitov 2026-11-03  3426  	}
638524a5a88244 Alexei Starovoitov 2026-11-03  3427  
638524a5a88244 Alexei Starovoitov 2026-11-03  3428  	/*
638524a5a88244 Alexei Starovoitov 2026-11-03  3429  	 * A register that is linear at the header is 'first value + slope * k' in iteration k
638524a5a88244 Alexei Starovoitov 2026-11-03  3430  	 * whatever back edges were taken. So the jumps that dominate a back edge say in
638524a5a88244 Alexei Starovoitov 2026-11-03  3431  	 * which iterations it can be taken. The loop ends, at the latest, in an iteration
638524a5a88244 Alexei Starovoitov 2026-11-03  3432  	 * in which no back edge can be taken.
638524a5a88244 Alexei Starovoitov 2026-11-03  3433  	 */
638524a5a88244 Alexei Starovoitov 2026-11-03  3434  	for (i = 0; i < loop->backedges_cnt; i++) {
638524a5a88244 Alexei Starovoitov 2026-11-03  3435  		err = count_backedge(env, cur_func, insn_idx, &loop->backedges[i],
638524a5a88244 Alexei Starovoitov 2026-11-03  3436  				     i ? &tmp : iters, &latch, &until);
638524a5a88244 Alexei Starovoitov 2026-11-03  3437  		if (err <= 0)
638524a5a88244 Alexei Starovoitov 2026-11-03  3438  			return err;
638524a5a88244 Alexei Starovoitov 2026-11-03  3439  		if (!i) {
638524a5a88244 Alexei Starovoitov 2026-11-03  3440  			false_until = until;
638524a5a88244 Alexei Starovoitov 2026-11-03  3441  			first = latch;
638524a5a88244 Alexei Starovoitov 2026-11-03  3442  			continue;
638524a5a88244 Alexei Starovoitov 2026-11-03  3443  		}
638524a5a88244 Alexei Starovoitov 2026-11-03  3444  		same &= same_latch(&first, &latch);
638524a5a88244 Alexei Starovoitov 2026-11-03  3445  		false_until = min(false_until, until);
638524a5a88244 Alexei Starovoitov 2026-11-03  3446  		iters->max_header_count = max(iters->max_header_count, tmp.max_header_count);
638524a5a88244 Alexei Starovoitov 2026-11-03  3447  		iters->min_header_count = min(iters->min_header_count, tmp.min_header_count);
638524a5a88244 Alexei Starovoitov 2026-11-03  3448  		/* at the header the variable is what one of the latches lets through */
638524a5a88244 Alexei Starovoitov 2026-11-03  3449  		if (iters->iv_reg >= 0 && iters->iv_reg == tmp.iv_reg)
638524a5a88244 Alexei Starovoitov 2026-11-03  3450  			iters->iv_range = cnum64_union(iters->iv_range, tmp.iv_range);
638524a5a88244 Alexei Starovoitov 2026-11-03  3451  		else
638524a5a88244 Alexei Starovoitov 2026-11-03  3452  			iters->iv_reg = -1;
638524a5a88244 Alexei Starovoitov 2026-11-03  3453  	}
638524a5a88244 Alexei Starovoitov 2026-11-03  3454  	/*
638524a5a88244 Alexei Starovoitov 2026-11-03  3455  	 * When the latches that were kept are the same test, the first iteration in which it's
638524a5a88244 Alexei Starovoitov 2026-11-03  3456  	 * false is the last one. Otherwise take the largest count and make sure that the latches
638524a5a88244 Alexei Starovoitov 2026-11-03  3457  	 * which became false earlier are false still.
638524a5a88244 Alexei Starovoitov 2026-11-03  3458  	 */
638524a5a88244 Alexei Starovoitov 2026-11-03  3459  	if (!same && iters->max_header_count - 1 > false_until) {
638524a5a88244 Alexei Starovoitov 2026-11-03  3460  		if (log->level & BPF_LOG_LEVEL2)
638524a5a88244 Alexei Starovoitov 2026-11-03  3461  			bpf_log(log,
638524a5a88244 Alexei Starovoitov 2026-11-03  3462  				"loop header at %d, a latch may be true again in iteration %u\n",
638524a5a88244 Alexei Starovoitov 2026-11-03  3463  				insn_idx, iters->max_header_count - 1);
6ccf49f7932781 Eduard Zingerman   2026-10-09  3464  		return 0;
6ccf49f7932781 Eduard Zingerman   2026-10-09  3465  	}
6ccf49f7932781 Eduard Zingerman   2026-10-09  3466  
6ccf49f7932781 Eduard Zingerman   2026-10-09  3467  	if (iters->max_header_count == 0) {
6ccf49f7932781 Eduard Zingerman   2026-10-09  3468  		if (log->level & BPF_LOG_LEVEL2)
6ccf49f7932781 Eduard Zingerman   2026-10-09  3469  			bpf_log(log, "loop header at %d, 0 iterations count\n", insn_idx);
6ccf49f7932781 Eduard Zingerman   2026-10-09  3470  		return 0;
6ccf49f7932781 Eduard Zingerman   2026-10-09  3471  	}
6ccf49f7932781 Eduard Zingerman   2026-10-09  3472  
6ccf49f7932781 Eduard Zingerman   2026-10-09  3473  	if (iters->max_header_count == U32_MAX) {
6ccf49f7932781 Eduard Zingerman   2026-10-09  3474  		if (log->level & BPF_LOG_LEVEL2)
6ccf49f7932781 Eduard Zingerman   2026-10-09  3475  			bpf_log(log, "loop header at %d, inf iterations count\n", insn_idx);
6ccf49f7932781 Eduard Zingerman   2026-10-09  3476  		return 0;
6ccf49f7932781 Eduard Zingerman   2026-10-09  3477  	}
6ccf49f7932781 Eduard Zingerman   2026-10-09  3478  
6ccf49f7932781 Eduard Zingerman   2026-10-09  3479  	if (log->level & BPF_LOG_LEVEL2) {
6ccf49f7932781 Eduard Zingerman   2026-10-09  3480  		bpf_log(log, "loop header at %d, header_count is ", insn_idx);
6ccf49f7932781 Eduard Zingerman   2026-10-09  3481  		if (iters->min_header_count == iters->max_header_count)
6ccf49f7932781 Eduard Zingerman   2026-10-09  3482  			bpf_log(log, "%u ", iters->max_header_count);
6ccf49f7932781 Eduard Zingerman   2026-10-09  3483  		else
6ccf49f7932781 Eduard Zingerman   2026-10-09  3484  			bpf_log(log, "[%u..%u] ", iters->min_header_count, iters->max_header_count);
6ccf49f7932781 Eduard Zingerman   2026-10-09  3485  		bpf_log(log, "\n");
6ccf49f7932781 Eduard Zingerman   2026-10-09  3486  	}
6ccf49f7932781 Eduard Zingerman   2026-10-09  3487  
6ccf49f7932781 Eduard Zingerman   2026-10-09  3488  	err = bpf_live_stack_query_init(env, st);
6ccf49f7932781 Eduard Zingerman   2026-10-09  3489  	if (err)
6ccf49f7932781 Eduard Zingerman   2026-10-09  3490  		return err;
6ccf49f7932781 Eduard Zingerman   2026-10-09  3491  
9b202a8c7722dd Alexei Starovoitov 2026-11-07  3492  	bitmap_zero(iters->forget_regs, REGS_NUM);
df9b13a441c9bc Alexei Starovoitov 2026-11-07  3493  	bitmap_zero(iters->fresh_regs, REGS_NUM);
09c5008302ed29 Alexei Starovoitov 2026-11-03  3494  	bitmap_zero(iters->mask_regs, REGS_NUM);
9b202a8c7722dd Alexei Starovoitov 2026-11-07  3495  	iters->spill_base = false;
6ccf49f7932781 Eduard Zingerman   2026-10-09  3496  	header_env = find_header_env(scev, insn_idx);
6ccf49f7932781 Eduard Zingerman   2026-10-09  3497  	for (r = 0; r < REGS_NUM; r++) {
9b202a8c7722dd Alexei Starovoitov 2026-11-07  3498  		struct bpf_reg_state *reg = NULL;
6ccf49f7932781 Eduard Zingerman   2026-10-09  3499  		u32 ra, r_scev, r_expr;
088a5477a9bdb4 Eduard Zingerman   2026-10-09  3500  		bool spill_base = false;
6ccf49f7932781 Eduard Zingerman   2026-10-09  3501  
6ccf49f7932781 Eduard Zingerman   2026-10-09  3502  		if (!scev_reg_alive(env, st, r))
6ccf49f7932781 Eduard Zingerman   2026-10-09  3503  			continue;
e5872c5e13da91 Alexei Starovoitov 2026-11-03  3504  
e5872c5e13da91 Alexei Starovoitov 2026-11-03  3505  		r_scev = header_env->reg2scev[r];
e5872c5e13da91 Alexei Starovoitov 2026-11-03  3506  		if (spill32_counter(scev, cur_func, r_scev, r, &coefs)) {
e5872c5e13da91 Alexei Starovoitov 2026-11-03  3507  			/* There is no exact offset to lose if nothing is known about the number */
e5872c5e13da91 Alexei Starovoitov 2026-11-03  3508  			if (test_bit(r, loop->store_base_regs) &&
e5872c5e13da91 Alexei Starovoitov 2026-11-03  3509  			    is_known_partial_spill(cur_func, r)) {
e5872c5e13da91 Alexei Starovoitov 2026-11-03  3510  				spill_base = true;
e5872c5e13da91 Alexei Starovoitov 2026-11-03  3511  				goto cant_widen;
e5872c5e13da91 Alexei Starovoitov 2026-11-03  3512  			}
e5872c5e13da91 Alexei Starovoitov 2026-11-03  3513  			continue;
e5872c5e13da91 Alexei Starovoitov 2026-11-03  3514  		}
6ccf49f7932781 Eduard Zingerman   2026-10-09  3515  		/*
6ccf49f7932781 Eduard Zingerman   2026-10-09  3516  		 * A heuristic:
6ccf49f7932781 Eduard Zingerman   2026-10-09  3517  		 * Ignore SCEVs computed for unbound values and treat those as widened.
6ccf49f7932781 Eduard Zingerman   2026-10-09  3518  		 * This is poor man's modelling of e.g. bpf_probe_read_kernel() effect
6ccf49f7932781 Eduard Zingerman   2026-10-09  3519  		 * on stack, when called from a subprogram. Currently this would produce
6ccf49f7932781 Eduard Zingerman   2026-10-09  3520  		 * an unknown ('?') SCEV as a summary of a subprogram call effects.
6ccf49f7932781 Eduard Zingerman   2026-10-09  3521  		 * Ideally, this should be computed as an OPAQUE value.
6ccf49f7932781 Eduard Zingerman   2026-10-09  3522  		 * However, that would require tracking STACK_MISC writes in the
6ccf49f7932781 Eduard Zingerman   2026-10-09  3523  		 * liveness analysis. Not implemented yet.
6ccf49f7932781 Eduard Zingerman   2026-10-09  3524  		 */
37f84dfb1659d6 Alexei Starovoitov 2026-11-03  3525  		if (is_unbound_scev_reg(env, cur_func, r)) {
37f84dfb1659d6 Alexei Starovoitov 2026-11-03  3526  			/*
37f84dfb1659d6 Alexei Starovoitov 2026-11-03  3527  			 * Nothing widens the value that the state has for a partial spill. A
37f84dfb1659d6 Alexei Starovoitov 2026-11-03  3528  			 * value that is made from itself can be a new one in each iteration:
37f84dfb1659d6 Alexei Starovoitov 2026-11-03  3529  			 * treat it like a register that has no formula. It's in the half
37f84dfb1659d6 Alexei Starovoitov 2026-11-03  3530  			 * of the slot that is farther from fp.
37f84dfb1659d6 Alexei Starovoitov 2026-11-03  3531  			 */
37f84dfb1659d6 Alexei Starovoitov 2026-11-03  3532  			if (is_known_partial_spill(cur_func, r) &&
37f84dfb1659d6 Alexei Starovoitov 2026-11-03  3533  			    bpf_stack_slot_alive(env, st->curframe, (r - MAX_BPF_REG) * 2 + 1) &&
37f84dfb1659d6 Alexei Starovoitov 2026-11-03  3534  			    made_from_partial_spill(scev, cur_func, header_env,
37f84dfb1659d6 Alexei Starovoitov 2026-11-03  3535  						    header_env->reg2expr[r], r, 0))
37f84dfb1659d6 Alexei Starovoitov 2026-11-03  3536  				goto cant_widen;
6ccf49f7932781 Eduard Zingerman   2026-10-09  3537  			continue;
37f84dfb1659d6 Alexei Starovoitov 2026-11-03  3538  		}
6ccf49f7932781 Eduard Zingerman   2026-10-09  3539  
09c5008302ed29 Alexei Starovoitov 2026-11-03  3540  		if (is_const_scev_reg(env, insn_idx, r))
09c5008302ed29 Alexei Starovoitov 2026-11-03  3541  			continue;
09c5008302ed29 Alexei Starovoitov 2026-11-03  3542  
6ccf49f7932781 Eduard Zingerman   2026-10-09  3543  		reg = scev_reg_for_linear(cur_func, r);
09c5008302ed29 Alexei Starovoitov 2026-11-03  3544  		/*
9b202a8c7722dd Alexei Starovoitov 2026-11-07  3545  		 * The offset of a pointer to arena is not tracked, so there is nothing to lose.
9b202a8c7722dd Alexei Starovoitov 2026-11-07  3546  		 * If the loop makes something else of it the state that returns to the head
9b202a8c7722dd Alexei Starovoitov 2026-11-07  3547  		 * is not covered by the state at the head.
09c5008302ed29 Alexei Starovoitov 2026-11-03  3548  		 */
9b202a8c7722dd Alexei Starovoitov 2026-11-07  3549  		if (reg && reg->type == PTR_TO_ARENA) {
9b202a8c7722dd Alexei Starovoitov 2026-11-07  3550  			__set_bit(r, iters->forget_regs);
09c5008302ed29 Alexei Starovoitov 2026-11-03  3551  			continue;
9b202a8c7722dd Alexei Starovoitov 2026-11-07  3552  		}
6ccf49f7932781 Eduard Zingerman   2026-10-09  3553  		/* If SCEV for r is (linear <reg> <slope>) */
32e962577d2d8a Eduard Zingerman   2026-10-20  3554  		if (reg && is_simple_linear(scev, r_scev, &coefs) && is_widenable_reg_type(reg)) {
c463b378eae7fa Eduard Zingerman   2026-10-26  3555  			/* 32-bit ALU operations on pointers convert them to scalars */
c463b378eae7fa Eduard Zingerman   2026-10-26  3556  			if (coefs.zext32 && reg->type != SCALAR_VALUE)
c463b378eae7fa Eduard Zingerman   2026-10-26  3557  				goto cant_widen;
088a5477a9bdb4 Eduard Zingerman   2026-10-09  3558  			/* Spills at varying offsets lose precision */
088a5477a9bdb4 Eduard Zingerman   2026-10-09  3559  			if (test_bit(r, loop->store_base_regs)) {
088a5477a9bdb4 Eduard Zingerman   2026-10-09  3560  				spill_base = true;
088a5477a9bdb4 Eduard Zingerman   2026-10-09  3561  				goto cant_widen;
088a5477a9bdb4 Eduard Zingerman   2026-10-09  3562  			}
6ccf49f7932781 Eduard Zingerman   2026-10-09  3563  			continue;
6ccf49f7932781 Eduard Zingerman   2026-10-09  3564  		}
6ccf49f7932781 Eduard Zingerman   2026-10-09  3565  
6ccf49f7932781 Eduard Zingerman   2026-10-09  3566  		/* rA = rA, loop does not change this reg */
6ccf49f7932781 Eduard Zingerman   2026-10-09  3567  		if (is_reg(scev, r_scev, &ra) && r == ra)
6ccf49f7932781 Eduard Zingerman   2026-10-09  3568  			continue;
6ccf49f7932781 Eduard Zingerman   2026-10-09  3569  
6ccf49f7932781 Eduard Zingerman   2026-10-09  3570  		/* (any 1 (any 2 (any 3 4))) */
6ccf49f7932781 Eduard Zingerman   2026-10-09  3571  		if (is_widenable_any(env, cur_func, header_env, r, r_scev)) {
088a5477a9bdb4 Eduard Zingerman   2026-10-09  3572  			if (test_bit(r, loop->store_base_regs)) {
088a5477a9bdb4 Eduard Zingerman   2026-10-09  3573  				spill_base = true;
088a5477a9bdb4 Eduard Zingerman   2026-10-09  3574  				goto cant_widen;
088a5477a9bdb4 Eduard Zingerman   2026-10-09  3575  			}
6ccf49f7932781 Eduard Zingerman   2026-10-09  3576  			continue;
6ccf49f7932781 Eduard Zingerman   2026-10-09  3577  		}
09c5008302ed29 Alexei Starovoitov 2026-11-03  3578  
09c5008302ed29 Alexei Starovoitov 2026-11-03  3579  		/*
09c5008302ed29 Alexei Starovoitov 2026-11-03  3580  		 * [0, max] that loses bits is in [0, max], a bit that is 0 stays 0: what enters
09c5008302ed29 Alexei Starovoitov 2026-11-03  3581  		 * the loop stands for all iterations as it is. 64 or [64, 127] does not: it
09c5008302ed29 Alexei Starovoitov 2026-11-03  3582  		 * can become 0.
09c5008302ed29 Alexei Starovoitov 2026-11-03  3583  		 */
09c5008302ed29 Alexei Starovoitov 2026-11-03  3584  		if (reg && reg->type == SCALAR_VALUE && !test_bit(r, loop->store_base_regs) &&
09c5008302ed29 Alexei Starovoitov 2026-11-03  3585  		    reg_is_zero_to_max(reg) &&
09c5008302ed29 Alexei Starovoitov 2026-11-03  3586  		    expr_loses_bits_only(scev, header_env->reg2expr[r], r, 0)) {
09c5008302ed29 Alexei Starovoitov 2026-11-03  3587  			__set_bit(r, iters->mask_regs);
09c5008302ed29 Alexei Starovoitov 2026-11-03  3588  			continue;
09c5008302ed29 Alexei Starovoitov 2026-11-03  3589  		}
088a5477a9bdb4 Eduard Zingerman   2026-10-09  3590  cant_widen:
6ccf49f7932781 Eduard Zingerman   2026-10-09  3591  		if (log->level & BPF_LOG_LEVEL2) {
6ccf49f7932781 Eduard Zingerman   2026-10-09  3592  			r_expr = header_env->reg2expr[r];
6ccf49f7932781 Eduard Zingerman   2026-10-09  3593  			bpf_log(log, "loop header at %d, can't widen ", insn_idx);
6ccf49f7932781 Eduard Zingerman   2026-10-09  3594  			log_reg(env, r);
6ccf49f7932781 Eduard Zingerman   2026-10-09  3595  			bpf_log(log, ", expr is ");
6ccf49f7932781 Eduard Zingerman   2026-10-09  3596  			log_expr(env, r_expr);
088a5477a9bdb4 Eduard Zingerman   2026-10-09  3597  			if (spill_base)
088a5477a9bdb4 Eduard Zingerman   2026-10-09  3598  				bpf_log(log, ", requires exact stack-offset tracking");
6ccf49f7932781 Eduard Zingerman   2026-10-09  3599  			bpf_log(log, "\n");
6ccf49f7932781 Eduard Zingerman   2026-10-09  3600  		}
9b202a8c7722dd Alexei Starovoitov 2026-11-07  3601  		/* the count stands, it is this one that is not known in the loop */
9b202a8c7722dd Alexei Starovoitov 2026-11-07  3602  		if (spill_base) {
9b202a8c7722dd Alexei Starovoitov 2026-11-07  3603  			iters->spill_base = true;
9b202a8c7722dd Alexei Starovoitov 2026-11-07  3604  			walk = true;
9b202a8c7722dd Alexei Starovoitov 2026-11-07  3605  			continue;
9b202a8c7722dd Alexei Starovoitov 2026-11-07  3606  		}
df9b13a441c9bc Alexei Starovoitov 2026-11-07  3607  		/*
df9b13a441c9bc Alexei Starovoitov 2026-11-07  3608  		 * What is loaded from memory in every iteration is the same kind of thing in all
df9b13a441c9bc Alexei Starovoitov 2026-11-07  3609  		 * of them. One iteration tells what. There is nothing more to find out when
df9b13a441c9bc Alexei Starovoitov 2026-11-07  3610  		 * iterations are looked at one by one.
df9b13a441c9bc Alexei Starovoitov 2026-11-07  3611  		 */
df9b13a441c9bc Alexei Starovoitov 2026-11-07  3612  		if (expr_is_fresh(env, header_env->reg2expr[r])) {
df9b13a441c9bc Alexei Starovoitov 2026-11-07  3613  			__set_bit(r, iters->fresh_regs);
df9b13a441c9bc Alexei Starovoitov 2026-11-07  3614  			continue;
df9b13a441c9bc Alexei Starovoitov 2026-11-07  3615  		}
9b202a8c7722dd Alexei Starovoitov 2026-11-07  3616  		__set_bit(r, iters->forget_regs);
df9b13a441c9bc Alexei Starovoitov 2026-11-07  3617  		/*
df9b13a441c9bc Alexei Starovoitov 2026-11-07  3618  		 *	for (i = 0; i < 40; i++) { if (i) sum += prev; prev = (x ^ i) * 3; }
df9b13a441c9bc Alexei Starovoitov 2026-11-07  3619  		 * It's not set in the first iteration only. That counts if the loop is not walked:
df9b13a441c9bc Alexei Starovoitov 2026-11-07  3620  		 * nothing looks at prev, or there are too many iterations.
df9b13a441c9bc Alexei Starovoitov 2026-11-07  3621  		 */
df9b13a441c9bc Alexei Starovoitov 2026-11-07  3622  		if (reg && reg->type == NOT_INIT)
df9b13a441c9bc Alexei Starovoitov 2026-11-07  3623  			__set_bit(r, iters->fresh_regs);
9b202a8c7722dd Alexei Starovoitov 2026-11-07  3624  		/*
9b202a8c7722dd Alexei Starovoitov 2026-11-07  3625  		 * Only a walk through the iterations tells what it is in each of them. That is not
9b202a8c7722dd Alexei Starovoitov 2026-11-07  3626  		 * worth it for a number that nothing looks at: a sum, a hash, what a call leaves in
9b202a8c7722dd Alexei Starovoitov 2026-11-07  3627  		 * r1 - r5. What comes back to the head is joined with what entered then. A pointer,
9b202a8c7722dd Alexei Starovoitov 2026-11-07  3628  		 * or a slot that holds something else than a register, has no such join.
9b202a8c7722dd Alexei Starovoitov 2026-11-07  3629  		 */
9b202a8c7722dd Alexei Starovoitov 2026-11-07  3630  		if (!reg || (reg->type != SCALAR_VALUE && reg->type != NOT_INIT) ||
9b202a8c7722dd Alexei Starovoitov 2026-11-07  3631  		    bpf_flow_is_needed(env, insn_idx, r)) {
9b202a8c7722dd Alexei Starovoitov 2026-11-07  3632  			walk = true;
9b202a8c7722dd Alexei Starovoitov 2026-11-07  3633  			continue;
9b202a8c7722dd Alexei Starovoitov 2026-11-07  3634  		}
9b202a8c7722dd Alexei Starovoitov 2026-11-07  3635  		if (log->level & BPF_LOG_LEVEL2)
9b202a8c7722dd Alexei Starovoitov 2026-11-07  3636  			bpf_log(log, "loop header at %d, nothing looks at it\n", insn_idx);
6ccf49f7932781 Eduard Zingerman   2026-10-09  3637  	}
6ccf49f7932781 Eduard Zingerman   2026-10-09  3638  
9b202a8c7722dd Alexei Starovoitov 2026-11-07  3639  	/* 2: the count is known, what some of the live registers are is not and it matters */
9b202a8c7722dd Alexei Starovoitov 2026-11-07  3640  	return walk ? 2 : 1;
6ccf49f7932781 Eduard Zingerman   2026-10-09  3641  }
6ccf49f7932781 Eduard Zingerman   2026-10-09  3642  

:::::: The code at line 3391 was first introduced by commit
:::::: 638524a5a8824480874c3e431493c6f205b407f8 bpf: Count a loop with several back edges

:::::: TO: Alexei Starovoitov <ast@kernel.org>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
