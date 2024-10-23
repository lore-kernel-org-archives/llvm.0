Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2843C1CA84;
	Wed, 23 Oct 2024 10:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729679870; cv=none; b=APN9iP1NrOU7AmHkzsLy8kIC/PpuDXqj2a4zoyNl791qDvJor4/CRv/j7xSa4+gKXwnqPeYJUCPw+MLBwBM4tWGhNFVe7oAZ+J8jPmkPxcN817jkVFJfxIPk5DcHJRwl4RFrT6px0qn7EmCcKBVz6XBHtkkC6s2MzWsvrLLLQoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729679870; c=relaxed/simple;
	bh=4BkNc2JluRHNLoa9P2lawkEStelmXkiW1U88oLtBVZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H5fjuu3iuM7nOBrkUTGZ+1p2ceQnVh42Hj5SbyrvVB4oiXyrtalf8rkMTzmtccMls430Gs1tkt+nvvRgPsYiTPj52fWjxdbT1cEu+sDeNI9vt+688clgCa6NjJBfryeMHqC3jBPkL3eR0+3XKf9AvospB2jJ1rsRb8HCxPzwCYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XvK4m9By; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XvK4m9By"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729679868; x=1761215868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4BkNc2JluRHNLoa9P2lawkEStelmXkiW1U88oLtBVZs=;
  b=XvK4m9ByCuKdi2qLZSkvJy72GR+ivdcZMeaZnvmpphWhAHAuMqrqCyoO
   wvd6EfQCd7dwD9KvSSmH0KdrKKLt3ZGYYWCwfPcgbjD6wex+Zb2LZjqUg
   0MwXCoH06EyufNPa9TIbVWAs1vXqqQFf7fVyMCLJbhDSYqxlV/uQhMVcA
   Z5hzWoNvuWuAWrVKz2srHSnEW1z3/hxxiqTWQ76i0PDlc1zHpycESvP9K
   2k3GqJUeErhJOL24d6SSe4bJI+lfnKBAYdjtt80mOTaaYRIJMypCW9qWp
   1hLBsrb0ZtXdxsMJNWQMfLsfQtgUGZOfg3Am2EZLzs2309BX1sRO/d1gA
   w==;
X-CSE-ConnectionGUID: ad8lxLkXRXiq18LXSuukRw==
X-CSE-MsgGUID: p/9Vv9qfQpGJCAs7pbUiPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="16880375"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="16880375"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 03:37:47 -0700
X-CSE-ConnectionGUID: pHWdkvHzTDmGdyGO1zEUpA==
X-CSE-MsgGUID: 6MyWyW0bSFqVWxH7U/NzVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="80980866"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Oct 2024 03:37:46 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3YkJ-000Uo6-2U;
	Wed, 23 Oct 2024 10:37:43 +0000
Date: Wed, 23 Oct 2024 18:37:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:trampoline_multi_10 15/21] kernel/bpf/syscall.c:2730:15:
 error: call to undeclared function 'is_tracing_multi'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202410231801.q8UUlFqC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git trampoline_multi_10
head:   48132820c5a21b82d1a4507a86a67b3742fb110e
commit: abfd721f4056e51a9f907901409966d6e9788ecb [15/21] bpf: Add multi tracing attach types
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241023/202410231801.q8UUlFqC-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410231801.q8UUlFqC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410231801.q8UUlFqC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bpf/syscall.c:4:
   include/linux/bpf.h:1387:51: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
    1387 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                   ^
   include/linux/bpf.h:1393:53: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
    1393 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                     ^
>> kernel/bpf/syscall.c:2730:15: error: call to undeclared function 'is_tracing_multi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2730 |         multi_func = is_tracing_multi(attr->expected_attach_type);
         |                      ^
   kernel/bpf/syscall.c:3239:42: error: incompatible pointer types passing 'struct bpf_tramp_node *' to parameter of type 'struct bpf_tramp_link *' [-Werror,-Wincompatible-pointer-types]
    3239 |         WARN_ON_ONCE(bpf_trampoline_unlink_prog(&tr_link->node,
         |                                                 ^~~~~~~~~~~~~~
   include/asm-generic/bug.h:111:25: note: expanded from macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   include/linux/bpf.h:1393:69: note: passing argument to parameter 'link' here
    1393 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                                     ^
   kernel/bpf/syscall.c:3457:33: error: incompatible pointer types passing 'struct bpf_tramp_node *' to parameter of type 'struct bpf_tramp_link *' [-Werror,-Wincompatible-pointer-types]
    3457 |         err = bpf_trampoline_link_prog(&link->node, tr, tgt_prog);
         |                                        ^~~~~~~~~~~
   include/linux/bpf.h:1387:67: note: passing argument to parameter 'link' here
    1387 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                                   ^
   2 warnings and 3 errors generated.
--
   In file included from kernel/bpf/verifier.c:7:
   In file included from include/linux/bpf-cgroup.h:5:
   include/linux/bpf.h:1387:51: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
    1387 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                   ^
   include/linux/bpf.h:1393:53: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
    1393 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                     ^
>> kernel/bpf/verifier.c:22271:13: error: call to undeclared function 'is_tracing_multi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    22271 |         } else if (is_tracing_multi(prog->expected_attach_type))
          |                    ^
   2 warnings and 1 error generated.


vim +/is_tracing_multi +2730 kernel/bpf/syscall.c

  2653	
  2654	static int bpf_prog_load(union bpf_attr *attr, bpfptr_t uattr, u32 uattr_size)
  2655	{
  2656		enum bpf_prog_type type = attr->prog_type;
  2657		struct bpf_prog *prog, *dst_prog = NULL;
  2658		struct btf *attach_btf = NULL;
  2659		struct bpf_token *token = NULL;
  2660		bool bpf_cap;
  2661		int err;
  2662		char license[128];
  2663		bool multi_func;
  2664	
  2665		if (CHECK_ATTR(BPF_PROG_LOAD))
  2666			return -EINVAL;
  2667	
  2668		if (attr->prog_flags & ~(BPF_F_STRICT_ALIGNMENT |
  2669					 BPF_F_ANY_ALIGNMENT |
  2670					 BPF_F_TEST_STATE_FREQ |
  2671					 BPF_F_SLEEPABLE |
  2672					 BPF_F_TEST_RND_HI32 |
  2673					 BPF_F_XDP_HAS_FRAGS |
  2674					 BPF_F_XDP_DEV_BOUND_ONLY |
  2675					 BPF_F_TEST_REG_INVARIANTS |
  2676					 BPF_F_TOKEN_FD))
  2677			return -EINVAL;
  2678	
  2679		bpf_prog_load_fixup_attach_type(attr);
  2680	
  2681		if (attr->prog_flags & BPF_F_TOKEN_FD) {
  2682			token = bpf_token_get_from_fd(attr->prog_token_fd);
  2683			if (IS_ERR(token))
  2684				return PTR_ERR(token);
  2685			/* if current token doesn't grant prog loading permissions,
  2686			 * then we can't use this token, so ignore it and rely on
  2687			 * system-wide capabilities checks
  2688			 */
  2689			if (!bpf_token_allow_cmd(token, BPF_PROG_LOAD) ||
  2690			    !bpf_token_allow_prog_type(token, attr->prog_type,
  2691						       attr->expected_attach_type)) {
  2692				bpf_token_put(token);
  2693				token = NULL;
  2694			}
  2695		}
  2696	
  2697		bpf_cap = bpf_token_capable(token, CAP_BPF);
  2698		err = -EPERM;
  2699	
  2700		if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS) &&
  2701		    (attr->prog_flags & BPF_F_ANY_ALIGNMENT) &&
  2702		    !bpf_cap)
  2703			goto put_token;
  2704	
  2705		/* Intent here is for unprivileged_bpf_disabled to block BPF program
  2706		 * creation for unprivileged users; other actions depend
  2707		 * on fd availability and access to bpffs, so are dependent on
  2708		 * object creation success. Even with unprivileged BPF disabled,
  2709		 * capability checks are still carried out for these
  2710		 * and other operations.
  2711		 */
  2712		if (sysctl_unprivileged_bpf_disabled && !bpf_cap)
  2713			goto put_token;
  2714	
  2715		if (attr->insn_cnt == 0 ||
  2716		    attr->insn_cnt > (bpf_cap ? BPF_COMPLEXITY_LIMIT_INSNS : BPF_MAXINSNS)) {
  2717			err = -E2BIG;
  2718			goto put_token;
  2719		}
  2720		if (type != BPF_PROG_TYPE_SOCKET_FILTER &&
  2721		    type != BPF_PROG_TYPE_CGROUP_SKB &&
  2722		    !bpf_cap)
  2723			goto put_token;
  2724	
  2725		if (is_net_admin_prog_type(type) && !bpf_token_capable(token, CAP_NET_ADMIN))
  2726			goto put_token;
  2727		if (is_perfmon_prog_type(type) && !bpf_token_capable(token, CAP_PERFMON))
  2728			goto put_token;
  2729	
> 2730		multi_func = is_tracing_multi(attr->expected_attach_type);
  2731	
  2732		/* attach_prog_fd/attach_btf_obj_fd can specify fd of either bpf_prog
  2733		 * or btf, we need to check which one it is
  2734		 */
  2735		if (attr->attach_prog_fd) {
  2736			dst_prog = bpf_prog_get(attr->attach_prog_fd);
  2737			if (IS_ERR(dst_prog)) {
  2738				dst_prog = NULL;
  2739				attach_btf = btf_get_by_fd(attr->attach_btf_obj_fd);
  2740				if (IS_ERR(attach_btf)) {
  2741					err = -EINVAL;
  2742					goto put_token;
  2743				}
  2744				if (!btf_is_kernel(attach_btf)) {
  2745					/* attaching through specifying bpf_prog's BTF
  2746					 * objects directly might be supported eventually
  2747					 */
  2748					btf_put(attach_btf);
  2749					err = -ENOTSUPP;
  2750					goto put_token;
  2751				}
  2752			}
  2753		} else if (attr->attach_btf_id || multi_func) {
  2754			/* fall back to vmlinux BTF, if BTF type ID is specified */
  2755			attach_btf = bpf_get_btf_vmlinux();
  2756			if (IS_ERR(attach_btf)) {
  2757				err = PTR_ERR(attach_btf);
  2758				goto put_token;
  2759			}
  2760			if (!attach_btf) {
  2761				err = -EINVAL;
  2762				goto put_token;
  2763			}
  2764			btf_get(attach_btf);
  2765		}
  2766	
  2767		if (bpf_prog_load_check_attach(type, attr->expected_attach_type,
  2768					       attach_btf, attr->attach_btf_id,
  2769					       dst_prog, multi_func)) {
  2770			if (dst_prog)
  2771				bpf_prog_put(dst_prog);
  2772			if (attach_btf)
  2773				btf_put(attach_btf);
  2774			err = -EINVAL;
  2775			goto put_token;
  2776		}
  2777	
  2778		/* plain bpf_prog allocation */
  2779		prog = bpf_prog_alloc(bpf_prog_size(attr->insn_cnt), GFP_USER);
  2780		if (!prog) {
  2781			if (dst_prog)
  2782				bpf_prog_put(dst_prog);
  2783			if (attach_btf)
  2784				btf_put(attach_btf);
  2785			err = -EINVAL;
  2786			goto put_token;
  2787		}
  2788	
  2789		prog->expected_attach_type = attr->expected_attach_type;
  2790		prog->sleepable = !!(attr->prog_flags & BPF_F_SLEEPABLE);
  2791		prog->aux->attach_btf = attach_btf;
  2792		prog->aux->attach_btf_id = multi_func ? bpf_multi_func_btf_id[0] : attr->attach_btf_id;
  2793		prog->aux->dst_prog = dst_prog;
  2794		prog->aux->dev_bound = !!attr->prog_ifindex;
  2795		prog->aux->xdp_has_frags = attr->prog_flags & BPF_F_XDP_HAS_FRAGS;
  2796	
  2797		/* move token into prog->aux, reuse taken refcnt */
  2798		prog->aux->token = token;
  2799		token = NULL;
  2800	
  2801		prog->aux->user = get_current_user();
  2802		prog->len = attr->insn_cnt;
  2803	
  2804		err = -EFAULT;
  2805		if (copy_from_bpfptr(prog->insns,
  2806				     make_bpfptr(attr->insns, uattr.is_kernel),
  2807				     bpf_prog_insn_size(prog)) != 0)
  2808			goto free_prog;
  2809		/* copy eBPF program license from user space */
  2810		if (strncpy_from_bpfptr(license,
  2811					make_bpfptr(attr->license, uattr.is_kernel),
  2812					sizeof(license) - 1) < 0)
  2813			goto free_prog;
  2814		license[sizeof(license) - 1] = 0;
  2815	
  2816		/* eBPF programs must be GPL compatible to use GPL-ed functions */
  2817		prog->gpl_compatible = license_is_gpl_compatible(license) ? 1 : 0;
  2818	
  2819		prog->orig_prog = NULL;
  2820		prog->jited = 0;
  2821	
  2822		atomic64_set(&prog->aux->refcnt, 1);
  2823	
  2824		if (bpf_prog_is_dev_bound(prog->aux)) {
  2825			err = bpf_prog_dev_bound_init(prog, attr);
  2826			if (err)
  2827				goto free_prog;
  2828		}
  2829	
  2830		if (type == BPF_PROG_TYPE_EXT && dst_prog &&
  2831		    bpf_prog_is_dev_bound(dst_prog->aux)) {
  2832			err = bpf_prog_dev_bound_inherit(prog, dst_prog);
  2833			if (err)
  2834				goto free_prog;
  2835		}
  2836	
  2837		/*
  2838		 * Bookkeeping for managing the program attachment chain.
  2839		 *
  2840		 * It might be tempting to set attach_tracing_prog flag at the attachment
  2841		 * time, but this will not prevent from loading bunch of tracing prog
  2842		 * first, then attach them one to another.
  2843		 *
  2844		 * The flag attach_tracing_prog is set for the whole program lifecycle, and
  2845		 * doesn't have to be cleared in bpf_tracing_link_release, since tracing
  2846		 * programs cannot change attachment target.
  2847		 */
  2848		if (type == BPF_PROG_TYPE_TRACING && dst_prog &&
  2849		    dst_prog->type == BPF_PROG_TYPE_TRACING) {
  2850			prog->aux->attach_tracing_prog = true;
  2851		}
  2852	
  2853		/* find program type: socket_filter vs tracing_filter */
  2854		err = find_prog_type(type, prog);
  2855		if (err < 0)
  2856			goto free_prog;
  2857	
  2858		prog->aux->load_time = ktime_get_boottime_ns();
  2859		err = bpf_obj_name_cpy(prog->aux->name, attr->prog_name,
  2860				       sizeof(attr->prog_name));
  2861		if (err < 0)
  2862			goto free_prog;
  2863	
  2864		err = security_bpf_prog_load(prog, attr, token);
  2865		if (err)
  2866			goto free_prog_sec;
  2867	
  2868		/* run eBPF verifier */
  2869		err = bpf_check(&prog, attr, uattr, uattr_size);
  2870		if (err < 0)
  2871			goto free_used_maps;
  2872	
  2873		prog = bpf_prog_select_runtime(prog, &err);
  2874		if (err < 0)
  2875			goto free_used_maps;
  2876	
  2877		err = bpf_prog_alloc_id(prog);
  2878		if (err)
  2879			goto free_used_maps;
  2880	
  2881		/* Upon success of bpf_prog_alloc_id(), the BPF prog is
  2882		 * effectively publicly exposed. However, retrieving via
  2883		 * bpf_prog_get_fd_by_id() will take another reference,
  2884		 * therefore it cannot be gone underneath us.
  2885		 *
  2886		 * Only for the time /after/ successful bpf_prog_new_fd()
  2887		 * and before returning to userspace, we might just hold
  2888		 * one reference and any parallel close on that fd could
  2889		 * rip everything out. Hence, below notifications must
  2890		 * happen before bpf_prog_new_fd().
  2891		 *
  2892		 * Also, any failure handling from this point onwards must
  2893		 * be using bpf_prog_put() given the program is exposed.
  2894		 */
  2895		bpf_prog_kallsyms_add(prog);
  2896		perf_event_bpf_event(prog, PERF_BPF_EVENT_PROG_LOAD, 0);
  2897		bpf_audit_prog(prog, BPF_AUDIT_LOAD);
  2898	
  2899		err = bpf_prog_new_fd(prog);
  2900		if (err < 0)
  2901			bpf_prog_put(prog);
  2902		return err;
  2903	
  2904	free_used_maps:
  2905		/* In case we have subprogs, we need to wait for a grace
  2906		 * period before we can tear down JIT memory since symbols
  2907		 * are already exposed under kallsyms.
  2908		 */
  2909		__bpf_prog_put_noref(prog, prog->aux->real_func_cnt);
  2910		return err;
  2911	
  2912	free_prog_sec:
  2913		security_bpf_prog_free(prog);
  2914	free_prog:
  2915		free_uid(prog->aux->user);
  2916		if (prog->aux->attach_btf)
  2917			btf_put(prog->aux->attach_btf);
  2918		bpf_prog_free(prog);
  2919	put_token:
  2920		bpf_token_put(token);
  2921		return err;
  2922	}
  2923	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
