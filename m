Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4480C34545;
	Tue, 15 Jul 2025 21:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752614810; cv=none; b=OIs79ibefyoqBm9kA3nL5fqh+UUGS4awteLyIOcxQXjPF4qk1SWuO7ZY1Xyl5/o/70Fkv4h8UDAodAxcmsiL9Tp2/Bq9icMQxElSFkgdSQ+QRxT2LjKpXrDm0aKhXlU8xkSLMa1SyB28hM11vAd1loQDNCX90elkOLjvwBscFc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752614810; c=relaxed/simple;
	bh=OlznMYLmAQxxfhEiYWeclpiT0gG26yk458dH7fTrgf0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q1wKf7h3VzPyREBXYAMdusPZDvgeg3fII+j7/gDb0gF2YsbsmLtQRXMjfO/sYlnVwREZKRYCBYBx82MXdOcVhZWUO2w5TXf8K2IxSE3/4wMSLH/9xHj75FYk2kn43K0DikPlTCqRAjXwwNPT2RPQQcPQibUgJ0PkTfXrnULAy6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IgmOSSz0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IgmOSSz0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752614809; x=1784150809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OlznMYLmAQxxfhEiYWeclpiT0gG26yk458dH7fTrgf0=;
  b=IgmOSSz0WIS6xgwqNpCGp6AJtD2Q2FX5Gj3xKumCBETHo37CxO43Ndnt
   EyCld+GtSG1VZR20tZLq4rYN0Z66KL8WZjKfPtdcYeKARUga7supW52RS
   Ksd8NMzqcwqKV3SQ8iW36NihmfRdmAlL0cy00RDp0jGB6IkaIxGDqiexb
   gnTL/rFSDPM++5Aj2oQpBIHeKAf8TfQ8KYF54YgzTxQ878CCZcA/lkOg0
   aIOXdPhTkuGMUHuGGxlZ029LuFqz3+2Wt7wxBGhc7byCqpIspHMRCbFve
   JwKJ+KDAD7cQV8u/pigsNv0HzX07ByljtTA7XxVJkqg4FnPxXoDa6y414
   Q==;
X-CSE-ConnectionGUID: X7Qiq2uzTW+f2EtL8IRkDA==
X-CSE-MsgGUID: 6rcYG6yATDWXAHWmgPxP1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="58503573"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; 
   d="scan'208";a="58503573"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 14:26:48 -0700
X-CSE-ConnectionGUID: 8dKEjpy+TxGHE6dBg1uxyg==
X-CSE-MsgGUID: L340yswlTS+NzQgQpGLfMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; 
   d="scan'208";a="157877270"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Jul 2025 14:26:45 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubnAe-000BZ9-1m;
	Tue, 15 Jul 2025 21:26:40 +0000
Date: Wed, 16 Jul 2025 05:26:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi 13/22]
 arch/s390/net/bpf_jit_comp.c:2503:33: error: no member named 'cookie' in
 'struct bpf_tramp_link'
Message-ID: <202507160508.QXd3JPbZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi
head:   d0503d4013c49a3fde856947dfffe6c80c178eb1
commit: d6d4068c9dbaa7c77d3fc2d3e0d8ae03a9eac775 [13/22] bpf: Add struct bpf_tramp_node object
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250716/202507160508.QXd3JPbZ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507160508.QXd3JPbZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507160508.QXd3JPbZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/s390/net/bpf_jit_comp.c:2503:33: error: no member named 'cookie' in 'struct bpf_tramp_link'
    2503 |         load_imm64(jit, REG_W0, tlink->cookie);
         |                                 ~~~~~  ^
   arch/s390/net/bpf_jit_comp.c:2591:14: warning: declaration of 'struct bpf_tramp_links' will not be visible outside of this function [-Wvisibility]
    2591 |                                          struct bpf_tramp_links *tlinks,
         |                                                 ^
   arch/s390/net/bpf_jit_comp.c:2594:44: error: subscript of pointer to incomplete type 'struct bpf_tramp_links'
    2594 |         struct bpf_tramp_links *fmod_ret = &tlinks[BPF_TRAMP_MODIFY_RETURN];
         |                                             ~~~~~~^
   arch/s390/net/bpf_jit_comp.c:2591:14: note: forward declaration of 'struct bpf_tramp_links'
    2591 |                                          struct bpf_tramp_links *tlinks,
         |                                                 ^
   arch/s390/net/bpf_jit_comp.c:2595:42: error: subscript of pointer to incomplete type 'struct bpf_tramp_links'
    2595 |         struct bpf_tramp_links *fentry = &tlinks[BPF_TRAMP_FENTRY];
         |                                           ~~~~~~^
   arch/s390/net/bpf_jit_comp.c:2591:14: note: forward declaration of 'struct bpf_tramp_links'
    2591 |                                          struct bpf_tramp_links *tlinks,
         |                                                 ^
   arch/s390/net/bpf_jit_comp.c:2596:41: error: subscript of pointer to incomplete type 'struct bpf_tramp_links'
    2596 |         struct bpf_tramp_links *fexit = &tlinks[BPF_TRAMP_FEXIT];
         |                                          ~~~~~~^
   arch/s390/net/bpf_jit_comp.c:2591:14: note: forward declaration of 'struct bpf_tramp_links'
    2591 |                                          struct bpf_tramp_links *tlinks,
         |                                                 ^
   arch/s390/net/bpf_jit_comp.c:2760:24: error: incomplete definition of type 'struct bpf_tramp_links'
    2760 |         for (i = 0; i < fentry->nr_links; i++)
         |                         ~~~~~~^
   arch/s390/net/bpf_jit_comp.c:2591:14: note: forward declaration of 'struct bpf_tramp_links'
    2591 |                                          struct bpf_tramp_links *tlinks,
         |                                                 ^
   arch/s390/net/bpf_jit_comp.c:2761:38: error: incomplete definition of type 'struct bpf_tramp_links'
    2761 |                 if (invoke_bpf_prog(tjit, m, fentry->links[i],
         |                                              ~~~~~~^
   arch/s390/net/bpf_jit_comp.c:2591:14: note: forward declaration of 'struct bpf_tramp_links'
    2591 |                                          struct bpf_tramp_links *tlinks,
         |                                                 ^
   arch/s390/net/bpf_jit_comp.c:2765:14: error: incomplete definition of type 'struct bpf_tramp_links'
    2765 |         if (fmod_ret->nr_links) {
         |             ~~~~~~~~^
   arch/s390/net/bpf_jit_comp.c:2591:14: note: forward declaration of 'struct bpf_tramp_links'
    2591 |                                          struct bpf_tramp_links *tlinks,
         |                                                 ^
   arch/s390/net/bpf_jit_comp.c:2774:27: error: incomplete definition of type 'struct bpf_tramp_links'
    2774 |                 for (i = 0; i < fmod_ret->nr_links; i++) {
         |                                 ~~~~~~~~^
   arch/s390/net/bpf_jit_comp.c:2591:14: note: forward declaration of 'struct bpf_tramp_links'
    2591 |                                          struct bpf_tramp_links *tlinks,
         |                                                 ^
   arch/s390/net/bpf_jit_comp.c:2775:41: error: incomplete definition of type 'struct bpf_tramp_links'
    2775 |                         if (invoke_bpf_prog(tjit, m, fmod_ret->links[i], true))
         |                                                      ~~~~~~~~^
   arch/s390/net/bpf_jit_comp.c:2591:14: note: forward declaration of 'struct bpf_tramp_links'
    2591 |                                          struct bpf_tramp_links *tlinks,
         |                                                 ^
   arch/s390/net/bpf_jit_comp.c:2830:23: error: incomplete definition of type 'struct bpf_tramp_links'
    2830 |         for (i = 0; i < fexit->nr_links; i++)
         |                         ~~~~~^
   arch/s390/net/bpf_jit_comp.c:2591:14: note: forward declaration of 'struct bpf_tramp_links'
    2591 |                                          struct bpf_tramp_links *tlinks,
         |                                                 ^
   arch/s390/net/bpf_jit_comp.c:2831:37: error: incomplete definition of type 'struct bpf_tramp_links'
    2831 |                 if (invoke_bpf_prog(tjit, m, fexit->links[i], false))
         |                                              ~~~~~^
   arch/s390/net/bpf_jit_comp.c:2591:14: note: forward declaration of 'struct bpf_tramp_links'
    2591 |                                          struct bpf_tramp_links *tlinks,
         |                                                 ^
   arch/s390/net/bpf_jit_comp.c:2881:16: warning: declaration of 'struct bpf_tramp_links' will not be visible outside of this function [-Wvisibility]
    2881 |                              struct bpf_tramp_links *tlinks, void *orig_call)
         |                                     ^
   arch/s390/net/bpf_jit_comp.c:2880:5: error: conflicting types for 'arch_bpf_trampoline_size'
    2880 | int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
         |     ^
   include/linux/bpf.h:1209:5: note: previous declaration is here
    1209 | int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
         |     ^
   arch/s390/net/bpf_jit_comp.c:2890:10: error: incompatible pointer types passing 'struct bpf_tramp_links *' to parameter of type 'struct bpf_tramp_links *' [-Werror,-Wincompatible-pointer-types]
    2890 |                                             tlinks, orig_call);
         |                                             ^~~~~~
   arch/s390/net/bpf_jit_comp.c:2591:31: note: passing argument to parameter 'tlinks' here
    2591 |                                          struct bpf_tramp_links *tlinks,
         |                                                                  ^
   arch/s390/net/bpf_jit_comp.c:2897:23: warning: declaration of 'struct bpf_tramp_links' will not be visible outside of this function [-Wvisibility]
    2897 |                                 u32 flags, struct bpf_tramp_links *tlinks,
         |                                                   ^
   arch/s390/net/bpf_jit_comp.c:2895:5: error: conflicting types for 'arch_prepare_bpf_trampoline'
    2895 | int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *image,
         |     ^
   include/linux/bpf.h:1202:5: note: previous declaration is here
    1202 | int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *image, void *image_end,
         |     ^
   arch/s390/net/bpf_jit_comp.c:2906:10: error: incompatible pointer types passing 'struct bpf_tramp_links *' to parameter of type 'struct bpf_tramp_links *' [-Werror,-Wincompatible-pointer-types]
    2906 |                                             tlinks, func_addr);
         |                                             ^~~~~~
   arch/s390/net/bpf_jit_comp.c:2591:31: note: passing argument to parameter 'tlinks' here
    2591 |                                          struct bpf_tramp_links *tlinks,
         |                                                                  ^
   arch/s390/net/bpf_jit_comp.c:2920:10: error: incompatible pointer types passing 'struct bpf_tramp_links *' to parameter of type 'struct bpf_tramp_links *' [-Werror,-Wincompatible-pointer-types]
    2920 |                                             tlinks, func_addr);
         |                                             ^~~~~~
   arch/s390/net/bpf_jit_comp.c:2591:31: note: passing argument to parameter 'tlinks' here
    2591 |                                          struct bpf_tramp_links *tlinks,


vim +2503 arch/s390/net/bpf_jit_comp.c

528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2487  
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2488  static int invoke_bpf_prog(struct bpf_tramp_jit *tjit,
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2489  			   const struct btf_func_model *m,
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2490  			   struct bpf_tramp_link *tlink, bool save_ret)
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2491  {
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2492  	struct bpf_jit *jit = &tjit->common;
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2493  	int cookie_off = tjit->run_ctx_off +
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2494  			 offsetof(struct bpf_tramp_run_ctx, bpf_cookie);
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2495  	struct bpf_prog *p = tlink->link.prog;
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2496  	int patch;
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2497  
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2498  	/*
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2499  	 * run_ctx.cookie = tlink->cookie;
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2500  	 */
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2501  
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2502  	/* %r0 = tlink->cookie */
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29 @2503  	load_imm64(jit, REG_W0, tlink->cookie);
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2504  	/* stg %r0,cookie_off(%r15) */
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2505  	EMIT6_DISP_LH(0xe3000000, 0x0024, REG_W0, REG_0, REG_15, cookie_off);
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2506  
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2507  	/*
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2508  	 * if ((start = __bpf_prog_enter(p, &run_ctx)) == 0)
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2509  	 *         goto skip;
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2510  	 */
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2511  
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2512  	/* %r1 = __bpf_prog_enter */
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2513  	load_imm64(jit, REG_1, (u64)bpf_trampoline_enter(p));
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2514  	/* %r2 = p */
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2515  	load_imm64(jit, REG_2, (u64)p);
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2516  	/* la %r3,run_ctx_off(%r15) */
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2517  	EMIT4_DISP(0x41000000, REG_3, REG_15, tjit->run_ctx_off);
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2518  	/* %r1() */
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2519  	call_r1(jit);
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2520  	/* ltgr %r7,%r2 */
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2521  	EMIT4(0xb9020000, REG_7, REG_2);
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2522  	/* brcl 8,skip */
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2523  	patch = jit->prg;
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2524  	EMIT6_PCREL_RILC(0xc0040000, 8, 0);
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2525  
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2526  	/*
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2527  	 * retval = bpf_func(args, p->insnsi);
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2528  	 */
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2529  
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2530  	/* %r1 = p->bpf_func */
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2531  	load_imm64(jit, REG_1, (u64)p->bpf_func);
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2532  	/* la %r2,bpf_args_off(%r15) */
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2533  	EMIT4_DISP(0x41000000, REG_2, REG_15, tjit->bpf_args_off);
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2534  	/* %r3 = p->insnsi */
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2535  	if (!p->jited)
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2536  		load_imm64(jit, REG_3, (u64)p->insnsi);
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2537  	/* %r1() */
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2538  	call_r1(jit);
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2539  	/* stg %r2,retval_off(%r15) */
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2540  	if (save_ret) {
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2541  		if (sign_extend(jit, REG_2, m->ret_size, m->ret_flags))
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2542  			return -1;
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2543  		EMIT6_DISP_LH(0xe3000000, 0x0024, REG_2, REG_0, REG_15,
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2544  			      tjit->retval_off);
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2545  	}
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2546  
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2547  	/* skip: */
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2548  	if (jit->prg_buf)
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2549  		*(u32 *)&jit->prg_buf[patch + 2] = (jit->prg - patch) >> 1;
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2550  
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2551  	/*
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2552  	 * __bpf_prog_exit(p, start, &run_ctx);
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2553  	 */
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2554  
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2555  	/* %r1 = __bpf_prog_exit */
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2556  	load_imm64(jit, REG_1, (u64)bpf_trampoline_exit(p));
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2557  	/* %r2 = p */
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2558  	load_imm64(jit, REG_2, (u64)p);
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2559  	/* lgr %r3,%r7 */
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2560  	EMIT4(0xb9040000, REG_3, REG_7);
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2561  	/* la %r4,run_ctx_off(%r15) */
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2562  	EMIT4_DISP(0x41000000, REG_4, REG_15, tjit->run_ctx_off);
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2563  	/* %r1() */
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2564  	call_r1(jit);
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2565  
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2566  	return 0;
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2567  }
528eb2cb87bc135 Ilya Leoshkevich 2023-01-29  2568  

:::::: The code at line 2503 was first introduced by commit
:::::: 528eb2cb87bc1353235a6384696b4849bde8b0ba s390/bpf: Implement arch_prepare_bpf_trampoline()

:::::: TO: Ilya Leoshkevich <iii@linux.ibm.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
