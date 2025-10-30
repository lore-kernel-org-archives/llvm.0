Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB0622B5AC;
	Thu, 30 Oct 2025 13:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761832588; cv=none; b=JekUwkA3nSCrk6yhxcAemu3tyH/Dg/Vu1nl+NSXxeeqdqyWQjmOi32r09MMS6K5fF4d2ukRPTWxxgqz2tPe1A7olnlBT9OiOlw/KmFuvs52QUzkP0+3ZbhwpzwoeYU00COCZEs5wB+BBfJ36eogNMfMWcdsgRMY2D0KHnNGcGSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761832588; c=relaxed/simple;
	bh=ZWIocqUuYVbdmm1418VkNGRE+HZ1y313RcUeu0pY3pE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNR/NciqDQ68i2HInsyCDbVHCbzzxOenftsHC8sMv12S3y1cQ81r7Jx62mzL2rHCc2EMf9+Em9aX88embGjuMiDuetqtvDi4iWWO5qn8Nzs9Q9963GifQ/vTef0cFyw/Ez4PEPsGU3XiNEfwgXCExX0DVX4DrzrE7UiQGGBboOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ffEJOktI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ffEJOktI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761832587; x=1793368587;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZWIocqUuYVbdmm1418VkNGRE+HZ1y313RcUeu0pY3pE=;
  b=ffEJOktI8s9rhE537N83s8uH0WhyDdiI1Mj3RKOeo9i7L02C9tvZmhrk
   /yKmPifMHB9tQaeKBe8vZsRkBRmuE0MihS1E2S8sP2iZnq5zcUkVSHz/r
   UkVWTr67yZgI5YHz+6LMteN6Xw4CC/v/FfS52Cu5qbQwTK6fwLwsrI3On
   fBMEspwT2/kvLENEAdjTz8IckHzh8vzqe4WSxapE5IEeid1XxhstewgZP
   x/Ai0pK1WPuQ1o0a3EYo6vN6A2y1xc9H34JUANXCxjJh7NaXx0M7DgSWc
   ODIJQGheOdLLy18mRFowqBQtx0FdPG+1ZWO0VvHLPVfRm1+il+2+lIzlp
   g==;
X-CSE-ConnectionGUID: OULyV76lTJmsqOR9oA9G2Q==
X-CSE-MsgGUID: 08071V5ZReCgr2Q+CwBnhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="81392088"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="81392088"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 06:56:27 -0700
X-CSE-ConnectionGUID: OC+PlDhbQJKnTEnZeULtmw==
X-CSE-MsgGUID: 4GdiRvbPTbiI/lGAmVPtUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="216810808"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 30 Oct 2025 06:56:23 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vET7s-000M4E-12;
	Thu, 30 Oct 2025 13:55:50 +0000
Date: Thu, 30 Oct 2025 21:54:58 +0800
From: kernel test robot <lkp@intel.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>, bpf@vger.kernel.org,
	andrii@kernel.org, ast@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dwarves@vger.kernel.org, alan.maguire@oracle.com, acme@kernel.org,
	eddyz87@gmail.com, tj@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH bpf-next v1 3/8] bpf: Support for kfuncs with
 KF_MAGIC_ARGS
Message-ID: <202510302139.fAmMKkDb-lkp@intel.com>
References: <20251029190113.3323406-4-ihor.solodrai@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029190113.3323406-4-ihor.solodrai@linux.dev>

Hi Ihor,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Ihor-Solodrai/bpf-Add-BTF_ID_LIST_END-and-BTF_ID_LIST_SIZE-macros/20251030-030608
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20251029190113.3323406-4-ihor.solodrai%40linux.dev
patch subject: [PATCH bpf-next v1 3/8] bpf: Support for kfuncs with KF_MAGIC_ARGS
config: s390-randconfig-001-20251030 (https://download.01.org/0day-ci/archive/20251030/202510302139.fAmMKkDb-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510302139.fAmMKkDb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510302139.fAmMKkDb-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/verifier.c:3273:1: error: invalid storage class specifier in function declarator
    3273 | static s32 magic_kfunc_by_impl(s32 impl_func_id)
         | ^
   kernel/bpf/verifier.c:3273:12: error: parameter named 'magic_kfunc_by_impl' is missing
    3273 | static s32 magic_kfunc_by_impl(s32 impl_func_id)
         |            ^
   kernel/bpf/verifier.c:3273:49: error: expected ';' at end of declaration
    3273 | static s32 magic_kfunc_by_impl(s32 impl_func_id)
         |                                                 ^
         |                                                 ;
   kernel/bpf/verifier.c:3271:17: error: parameter 'magic_kfuncs' was not declared, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
    3271 | BTF_ID_LIST_END(magic_kfuncs)
         |                 ^
    3272 | 
    3273 | static s32 magic_kfunc_by_impl(s32 impl_func_id)
    3274 | {
   kernel/bpf/verifier.c:3271:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
    3271 | BTF_ID_LIST_END(magic_kfuncs)
         | ^
         | int
   kernel/bpf/verifier.c:3277:18: error: call to undeclared function 'BTF_ID_LIST_SIZE'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3277 |         for (i = 1; i < BTF_ID_LIST_SIZE(magic_kfuncs); i += 2) {
         |                         ^
   kernel/bpf/verifier.c:3277:18: note: did you mean 'BTF_ID_LIST_END'?
   kernel/bpf/verifier.c:3271:1: note: 'BTF_ID_LIST_END' declared here
    3271 | BTF_ID_LIST_END(magic_kfuncs)
         | ^
    3272 | 
    3273 | static s32 magic_kfunc_by_impl(s32 impl_func_id)
    3274 | {
    3275 |         int i;
    3276 | 
    3277 |         for (i = 1; i < BTF_ID_LIST_SIZE(magic_kfuncs); i += 2) {
         |                         ~~~~~~~~~~~~~~~~
         |                         BTF_ID_LIST_END
   kernel/bpf/verifier.c:3278:19: error: subscripted value is not an array, pointer, or vector
    3278 |                 if (magic_kfuncs[i] == impl_func_id)
         |                     ~~~~~~~~~~~~^~
   kernel/bpf/verifier.c:3278:26: error: use of undeclared identifier 'impl_func_id'
    3278 |                 if (magic_kfuncs[i] == impl_func_id)
         |                                        ^
   kernel/bpf/verifier.c:3279:23: error: subscripted value is not an array, pointer, or vector
    3279 |                         return magic_kfuncs[i - 1];
         |                                ~~~~~~~~~~~~^~~~~~
   kernel/bpf/verifier.c:3271:1: warning: no previous prototype for function 'BTF_ID_LIST_END' [-Wmissing-prototypes]
    3271 | BTF_ID_LIST_END(magic_kfuncs)
         | ^
   kernel/bpf/verifier.c:3271:16: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3271 | BTF_ID_LIST_END(magic_kfuncs)
         |                ^
         |                static 
>> kernel/bpf/verifier.c:3271:1: error: a function definition without a prototype is deprecated in all versions of C and is not supported in C2x [-Werror,-Wdeprecated-non-prototype]
    3271 | BTF_ID_LIST_END(magic_kfuncs)
         | ^
   kernel/bpf/verifier.c:3288:18: error: call to undeclared function 'BTF_ID_LIST_SIZE'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3288 |         for (i = 0; i < BTF_ID_LIST_SIZE(magic_kfuncs); i += 2) {
         |                         ^
>> kernel/bpf/verifier.c:3409:17: error: call to undeclared function 'magic_kfunc_by_impl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3409 |                 tmp_func_id = magic_kfunc_by_impl(func_id);
         |                               ^
   kernel/bpf/verifier.c:13726:17: error: call to undeclared function 'magic_kfunc_by_impl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    13726 |                 tmp_func_id = magic_kfunc_by_impl(func_id);
          |                               ^
   1 warning and 13 errors generated.


vim +3271 kernel/bpf/verifier.c

  3265	
  3266	/*
  3267	 * magic_kfuncs is used as a list of (foo, foo_impl) pairs
  3268	 */
  3269	BTF_ID_LIST(magic_kfuncs)
  3270	BTF_ID_UNUSED
> 3271	BTF_ID_LIST_END(magic_kfuncs)
  3272	
  3273	static s32 magic_kfunc_by_impl(s32 impl_func_id)
  3274	{
  3275		int i;
  3276	
  3277		for (i = 1; i < BTF_ID_LIST_SIZE(magic_kfuncs); i += 2) {
  3278			if (magic_kfuncs[i] == impl_func_id)
  3279				return magic_kfuncs[i - 1];
  3280		}
  3281		return -ENOENT;
  3282	}
  3283	
  3284	static s32 impl_by_magic_kfunc(s32 func_id)
  3285	{
  3286		int i;
  3287	
  3288		for (i = 0; i < BTF_ID_LIST_SIZE(magic_kfuncs); i += 2) {
  3289			if (magic_kfuncs[i] == func_id)
  3290				return magic_kfuncs[i + 1];
  3291		}
  3292		return -ENOENT;
  3293	}
  3294	
  3295	static const struct btf_type *find_magic_kfunc_proto(struct btf *desc_btf, s32 func_id)
  3296	{
  3297		const struct btf_type *impl_func, *func_proto;
  3298		u32 impl_func_id;
  3299	
  3300		impl_func_id = impl_by_magic_kfunc(func_id);
  3301		if (impl_func_id < 0)
  3302			return NULL;
  3303	
  3304		impl_func = btf_type_by_id(desc_btf, impl_func_id);
  3305		if (!impl_func || !btf_type_is_func(impl_func))
  3306			return NULL;
  3307	
  3308		func_proto = btf_type_by_id(desc_btf, impl_func->type);
  3309		if (!func_proto || !btf_type_is_func_proto(func_proto))
  3310			return NULL;
  3311	
  3312		return func_proto;
  3313	}
  3314	
  3315	static int add_kfunc_call(struct bpf_verifier_env *env, u32 func_id, s16 offset)
  3316	{
  3317		const struct btf_type *func, *func_proto, *tmp_func;
  3318		struct bpf_kfunc_btf_tab *btf_tab;
  3319		const char *func_name, *tmp_name;
  3320		struct btf_func_model func_model;
  3321		struct bpf_kfunc_desc_tab *tab;
  3322		struct bpf_prog_aux *prog_aux;
  3323		struct bpf_kfunc_desc *desc;
  3324		struct btf *desc_btf;
  3325		unsigned long addr;
  3326		u32 *kfunc_flags;
  3327		s32 tmp_func_id;
  3328		int err;
  3329	
  3330		prog_aux = env->prog->aux;
  3331		tab = prog_aux->kfunc_tab;
  3332		btf_tab = prog_aux->kfunc_btf_tab;
  3333		if (!tab) {
  3334			if (!btf_vmlinux) {
  3335				verbose(env, "calling kernel function is not supported without CONFIG_DEBUG_INFO_BTF\n");
  3336				return -ENOTSUPP;
  3337			}
  3338	
  3339			if (!env->prog->jit_requested) {
  3340				verbose(env, "JIT is required for calling kernel function\n");
  3341				return -ENOTSUPP;
  3342			}
  3343	
  3344			if (!bpf_jit_supports_kfunc_call()) {
  3345				verbose(env, "JIT does not support calling kernel function\n");
  3346				return -ENOTSUPP;
  3347			}
  3348	
  3349			if (!env->prog->gpl_compatible) {
  3350				verbose(env, "cannot call kernel function from non-GPL compatible program\n");
  3351				return -EINVAL;
  3352			}
  3353	
  3354			tab = kzalloc(sizeof(*tab), GFP_KERNEL_ACCOUNT);
  3355			if (!tab)
  3356				return -ENOMEM;
  3357			prog_aux->kfunc_tab = tab;
  3358		}
  3359	
  3360		/* func_id == 0 is always invalid, but instead of returning an error, be
  3361		 * conservative and wait until the code elimination pass before returning
  3362		 * error, so that invalid calls that get pruned out can be in BPF programs
  3363		 * loaded from userspace.  It is also required that offset be untouched
  3364		 * for such calls.
  3365		 */
  3366		if (!func_id && !offset)
  3367			return 0;
  3368	
  3369		if (!btf_tab && offset) {
  3370			btf_tab = kzalloc(sizeof(*btf_tab), GFP_KERNEL_ACCOUNT);
  3371			if (!btf_tab)
  3372				return -ENOMEM;
  3373			prog_aux->kfunc_btf_tab = btf_tab;
  3374		}
  3375	
  3376		desc_btf = find_kfunc_desc_btf(env, offset);
  3377		if (IS_ERR(desc_btf)) {
  3378			verbose(env, "failed to find BTF for kernel function\n");
  3379			return PTR_ERR(desc_btf);
  3380		}
  3381	
  3382		if (find_kfunc_desc(env->prog, func_id, offset))
  3383			return 0;
  3384	
  3385		if (tab->nr_descs == MAX_KFUNC_DESCS) {
  3386			verbose(env, "too many different kernel function calls\n");
  3387			return -E2BIG;
  3388		}
  3389	
  3390		func = btf_type_by_id(desc_btf, func_id);
  3391		if (!func || !btf_type_is_func(func)) {
  3392			verbose(env, "kernel btf_id %u is not a function\n",
  3393				func_id);
  3394			return -EINVAL;
  3395		}
  3396		func_proto = btf_type_by_id(desc_btf, func->type);
  3397		if (!func_proto || !btf_type_is_func_proto(func_proto)) {
  3398			verbose(env, "kernel function btf_id %u does not have a valid func_proto\n",
  3399				func_id);
  3400			return -EINVAL;
  3401		}
  3402	
  3403		kfunc_flags = btf_kfunc_flags(desc_btf, func_id, env->prog);
  3404		func_name = btf_name_by_offset(desc_btf, func->name_off);
  3405		addr = kallsyms_lookup_name(func_name);
  3406	
  3407		/* This may be an _impl kfunc with KF_MAGIC_ARGS counterpart */
  3408		if (unlikely(!addr && !kfunc_flags)) {
> 3409			tmp_func_id = magic_kfunc_by_impl(func_id);
  3410			if (tmp_func_id < 0)
  3411				return -EACCES;
  3412			tmp_func = btf_type_by_id(desc_btf, tmp_func_id);
  3413			if (!tmp_func || !btf_type_is_func(tmp_func))
  3414				return -EACCES;
  3415			tmp_name = btf_name_by_offset(desc_btf, tmp_func->name_off);
  3416			addr = kallsyms_lookup_name(tmp_name);
  3417		}
  3418	
  3419		/*
  3420		 * Note that kfunc_flags may be NULL at this point, which means that we couldn't find
  3421		 * func_id in any relevant kfunc_id_set. This most likely indicates an invalid kfunc call.
  3422		 * However we don't want to fail the verification here, because invalid calls may be
  3423		 * eliminated as dead code later.
  3424		 */
  3425		if (unlikely(kfunc_flags && KF_MAGIC_ARGS & *kfunc_flags)) {
  3426			func_proto = find_magic_kfunc_proto(desc_btf, func_id);
  3427			if (!func_proto) {
  3428				verbose(env, "cannot find _impl proto for kernel function %s\n",
  3429				func_name);
  3430				return -EINVAL;
  3431			}
  3432		}
  3433	
  3434		if (!addr) {
  3435			verbose(env, "cannot find address for kernel function %s\n",
  3436				func_name);
  3437			return -EINVAL;
  3438		}
  3439	
  3440		if (bpf_dev_bound_kfunc_id(func_id)) {
  3441			err = bpf_dev_bound_kfunc_check(&env->log, prog_aux);
  3442			if (err)
  3443				return err;
  3444		}
  3445	
  3446		err = btf_distill_func_proto(&env->log, desc_btf,
  3447					     func_proto, func_name,
  3448					     &func_model);
  3449		if (err)
  3450			return err;
  3451	
  3452		desc = &tab->descs[tab->nr_descs++];
  3453		desc->func_id = func_id;
  3454		desc->offset = offset;
  3455		desc->addr = addr;
  3456		desc->func_model = func_model;
  3457		sort(tab->descs, tab->nr_descs, sizeof(tab->descs[0]),
  3458		     kfunc_desc_cmp_by_id_off, NULL);
  3459		return 0;
  3460	}
  3461	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
