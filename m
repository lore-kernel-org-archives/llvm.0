Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A773FB1B;
	Mon, 23 Jun 2025 21:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750715831; cv=none; b=QcnDKRwT1d7UVA3fBnYzxY0TQsehBo/i6dWSIM3ZDRYK9nkV1ugdH2/x90R1lpPPU32PVOo2OewbLBFtj+Y/nDsznqqFueeprYe75rDMwNIrrY9f/T/UCvYs+3nDIOw8FTnqCBnPi0vwAA/z0P+iEHaMnDzo27uVZT2SdYVpUlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750715831; c=relaxed/simple;
	bh=xSIy10WNvt0xaE9pcyKduGH9LuU137ovyNFfdnmjAPg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bhNWG3dDIa+NWuiqxE9J1pcFqLiGywbNk9S1hl19o+EirKMVb1jeOthDtFQ8VbLafKkqkyVboxPZPIE12yi9pDyvIkuu5QmWzATu8pKK1XGSSj12ToUmlPRcFl5dD0mzlnEXIrSfIG4iqGwnXcpJs+E88JA3Cbl7sAxVO/Fq5hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TLIDAe6c; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TLIDAe6c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750715829; x=1782251829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xSIy10WNvt0xaE9pcyKduGH9LuU137ovyNFfdnmjAPg=;
  b=TLIDAe6cCDBD9xI5o3uBemDJ9TO4Q0m1swT3e2NMqte5lZkAbvpRAXqV
   T0D3mYKN01micSVxt1N3XQHPzQOlGIxyTFz6Cx4FdAaG2F+5FwfKVPMMa
   6y1ve/4r53vachBQ71YHYuPLH7eXo6J0clCea1u9Y+9zX1n+Q5EdtnT/L
   wzeFL33w1kVnb8FDZQ4IYzMPJuYtwEz9veKxBFCPcxdn412r3iX77LHMf
   kyIzPyfJwKanY+2K3H7Wp1ev5XLmhXR29Vzy9HBlgXWVKkX8S0RlGEHvT
   3kVXQlkWqKxKYj5vAzvAaXDUDWKfhn7CmO0vPnrsmisFdfcP5eieKIFyu
   g==;
X-CSE-ConnectionGUID: wfHizcgkRuG7D1B+osTDAA==
X-CSE-MsgGUID: i3O7kpfbRPqcqdbBgfjJ2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="78354469"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="78354469"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 14:57:08 -0700
X-CSE-ConnectionGUID: OtMEGX1BR6a0j5SvkIzz8A==
X-CSE-MsgGUID: RXUiKPQSRzG4I1M2q3bQCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="152236651"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Jun 2025 14:57:07 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTpA0-000QZq-2U;
	Mon, 23 Jun 2025 21:57:04 +0000
Date: Tue, 24 Jun 2025 05:57:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_1 12/22] kernel/bpf/syscall.c:2856:15:
 error: call to undeclared function 'is_tracing_multi'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202506240546.GkuGPJfA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_1
head:   28441de17b08aa419e3a354e2940268a9078d418
commit: 7c4cf82890644572aba3bd2c00e98cdda2add1e4 [12/22] bpf: Add multi tracing attach types
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20250624/202506240546.GkuGPJfA-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506240546.GkuGPJfA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506240546.GkuGPJfA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bpf/syscall.c:4:
   include/linux/bpf.h:1468:51: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
    1468 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                   ^
   include/linux/bpf.h:1474:53: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
    1474 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                     ^
>> kernel/bpf/syscall.c:2856:15: error: call to undeclared function 'is_tracing_multi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2856 |         multi_func = is_tracing_multi(attr->expected_attach_type);
         |                      ^
   kernel/bpf/syscall.c:3398:42: error: incompatible pointer types passing 'struct bpf_tramp_node *' to parameter of type 'struct bpf_tramp_link *' [-Werror,-Wincompatible-pointer-types]
    3398 |         WARN_ON_ONCE(bpf_trampoline_unlink_prog(&tr_link->node,
         |                                                 ^~~~~~~~~~~~~~
   include/asm-generic/bug.h:111:25: note: expanded from macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   include/linux/bpf.h:1474:69: note: passing argument to parameter 'link' here
    1474 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                                     ^
   kernel/bpf/syscall.c:3433:20: error: no member named 'cookie' in 'struct bpf_link'
    3433 |                    tr_link->link.cookie);
         |                    ~~~~~~~~~~~~~ ^
   kernel/bpf/syscall.c:3442:39: error: no member named 'cookie' in 'struct bpf_link'
    3442 |         info->tracing.cookie = tr_link->link.cookie;
         |                                ~~~~~~~~~~~~~ ^
   kernel/bpf/syscall.c:3619:33: error: incompatible pointer types passing 'struct bpf_tramp_node *' to parameter of type 'struct bpf_tramp_link *' [-Werror,-Wincompatible-pointer-types]
    3619 |         err = bpf_trampoline_link_prog(&link->node, tr, tgt_prog);
         |                                        ^~~~~~~~~~~
   include/linux/bpf.h:1468:67: note: passing argument to parameter 'link' here
    1468 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                                   ^
   2 warnings and 5 errors generated.
--
   In file included from kernel/bpf/verifier.c:7:
   In file included from include/linux/bpf-cgroup.h:5:
   include/linux/bpf.h:1468:51: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
    1468 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                   ^
   include/linux/bpf.h:1474:53: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
    1474 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                     ^
>> kernel/bpf/verifier.c:23636:13: error: call to undeclared function 'is_tracing_multi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    23636 |         } else if (is_tracing_multi(prog->expected_attach_type))
          |                    ^
   2 warnings and 1 error generated.


vim +/is_tracing_multi +2856 kernel/bpf/syscall.c

  2779	
  2780	static int bpf_prog_load(union bpf_attr *attr, bpfptr_t uattr, u32 uattr_size)
  2781	{
  2782		enum bpf_prog_type type = attr->prog_type;
  2783		struct bpf_prog *prog, *dst_prog = NULL;
  2784		struct btf *attach_btf = NULL;
  2785		struct bpf_token *token = NULL;
  2786		bool bpf_cap;
  2787		int err;
  2788		char license[128];
  2789		bool multi_func;
  2790	
  2791		if (CHECK_ATTR(BPF_PROG_LOAD))
  2792			return -EINVAL;
  2793	
  2794		if (attr->prog_flags & ~(BPF_F_STRICT_ALIGNMENT |
  2795					 BPF_F_ANY_ALIGNMENT |
  2796					 BPF_F_TEST_STATE_FREQ |
  2797					 BPF_F_SLEEPABLE |
  2798					 BPF_F_TEST_RND_HI32 |
  2799					 BPF_F_XDP_HAS_FRAGS |
  2800					 BPF_F_XDP_DEV_BOUND_ONLY |
  2801					 BPF_F_TEST_REG_INVARIANTS |
  2802					 BPF_F_TOKEN_FD))
  2803			return -EINVAL;
  2804	
  2805		bpf_prog_load_fixup_attach_type(attr);
  2806	
  2807		if (attr->prog_flags & BPF_F_TOKEN_FD) {
  2808			token = bpf_token_get_from_fd(attr->prog_token_fd);
  2809			if (IS_ERR(token))
  2810				return PTR_ERR(token);
  2811			/* if current token doesn't grant prog loading permissions,
  2812			 * then we can't use this token, so ignore it and rely on
  2813			 * system-wide capabilities checks
  2814			 */
  2815			if (!bpf_token_allow_cmd(token, BPF_PROG_LOAD) ||
  2816			    !bpf_token_allow_prog_type(token, attr->prog_type,
  2817						       attr->expected_attach_type)) {
  2818				bpf_token_put(token);
  2819				token = NULL;
  2820			}
  2821		}
  2822	
  2823		bpf_cap = bpf_token_capable(token, CAP_BPF);
  2824		err = -EPERM;
  2825	
  2826		if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS) &&
  2827		    (attr->prog_flags & BPF_F_ANY_ALIGNMENT) &&
  2828		    !bpf_cap)
  2829			goto put_token;
  2830	
  2831		/* Intent here is for unprivileged_bpf_disabled to block BPF program
  2832		 * creation for unprivileged users; other actions depend
  2833		 * on fd availability and access to bpffs, so are dependent on
  2834		 * object creation success. Even with unprivileged BPF disabled,
  2835		 * capability checks are still carried out for these
  2836		 * and other operations.
  2837		 */
  2838		if (sysctl_unprivileged_bpf_disabled && !bpf_cap)
  2839			goto put_token;
  2840	
  2841		if (attr->insn_cnt == 0 ||
  2842		    attr->insn_cnt > (bpf_cap ? BPF_COMPLEXITY_LIMIT_INSNS : BPF_MAXINSNS)) {
  2843			err = -E2BIG;
  2844			goto put_token;
  2845		}
  2846		if (type != BPF_PROG_TYPE_SOCKET_FILTER &&
  2847		    type != BPF_PROG_TYPE_CGROUP_SKB &&
  2848		    !bpf_cap)
  2849			goto put_token;
  2850	
  2851		if (is_net_admin_prog_type(type) && !bpf_token_capable(token, CAP_NET_ADMIN))
  2852			goto put_token;
  2853		if (is_perfmon_prog_type(type) && !bpf_token_capable(token, CAP_PERFMON))
  2854			goto put_token;
  2855	
> 2856		multi_func = is_tracing_multi(attr->expected_attach_type);
  2857	
  2858		/* attach_prog_fd/attach_btf_obj_fd can specify fd of either bpf_prog
  2859		 * or btf, we need to check which one it is
  2860		 */
  2861		if (attr->attach_prog_fd) {
  2862			dst_prog = bpf_prog_get(attr->attach_prog_fd);
  2863			if (IS_ERR(dst_prog)) {
  2864				dst_prog = NULL;
  2865				attach_btf = btf_get_by_fd(attr->attach_btf_obj_fd);
  2866				if (IS_ERR(attach_btf)) {
  2867					err = -EINVAL;
  2868					goto put_token;
  2869				}
  2870				if (!btf_is_kernel(attach_btf)) {
  2871					/* attaching through specifying bpf_prog's BTF
  2872					 * objects directly might be supported eventually
  2873					 */
  2874					btf_put(attach_btf);
  2875					err = -ENOTSUPP;
  2876					goto put_token;
  2877				}
  2878			}
  2879		} else if (attr->attach_btf_id || multi_func) {
  2880			/* fall back to vmlinux BTF, if BTF type ID is specified */
  2881			attach_btf = bpf_get_btf_vmlinux();
  2882			if (IS_ERR(attach_btf)) {
  2883				err = PTR_ERR(attach_btf);
  2884				goto put_token;
  2885			}
  2886			if (!attach_btf) {
  2887				err = -EINVAL;
  2888				goto put_token;
  2889			}
  2890			btf_get(attach_btf);
  2891		}
  2892	
  2893		if (bpf_prog_load_check_attach(type, attr->expected_attach_type,
  2894					       attach_btf, attr->attach_btf_id,
  2895					       dst_prog, multi_func)) {
  2896			if (dst_prog)
  2897				bpf_prog_put(dst_prog);
  2898			if (attach_btf)
  2899				btf_put(attach_btf);
  2900			err = -EINVAL;
  2901			goto put_token;
  2902		}
  2903	
  2904		/* plain bpf_prog allocation */
  2905		prog = bpf_prog_alloc(bpf_prog_size(attr->insn_cnt), GFP_USER);
  2906		if (!prog) {
  2907			if (dst_prog)
  2908				bpf_prog_put(dst_prog);
  2909			if (attach_btf)
  2910				btf_put(attach_btf);
  2911			err = -EINVAL;
  2912			goto put_token;
  2913		}
  2914	
  2915		prog->expected_attach_type = attr->expected_attach_type;
  2916		prog->sleepable = !!(attr->prog_flags & BPF_F_SLEEPABLE);
  2917		prog->aux->attach_btf = attach_btf;
  2918		prog->aux->attach_btf_id = multi_func ? bpf_multi_func_btf_id[0] : attr->attach_btf_id;
  2919		prog->aux->dst_prog = dst_prog;
  2920		prog->aux->dev_bound = !!attr->prog_ifindex;
  2921		prog->aux->xdp_has_frags = attr->prog_flags & BPF_F_XDP_HAS_FRAGS;
  2922	
  2923		/* move token into prog->aux, reuse taken refcnt */
  2924		prog->aux->token = token;
  2925		token = NULL;
  2926	
  2927		prog->aux->user = get_current_user();
  2928		prog->len = attr->insn_cnt;
  2929	
  2930		err = -EFAULT;
  2931		if (copy_from_bpfptr(prog->insns,
  2932				     make_bpfptr(attr->insns, uattr.is_kernel),
  2933				     bpf_prog_insn_size(prog)) != 0)
  2934			goto free_prog;
  2935		/* copy eBPF program license from user space */
  2936		if (strncpy_from_bpfptr(license,
  2937					make_bpfptr(attr->license, uattr.is_kernel),
  2938					sizeof(license) - 1) < 0)
  2939			goto free_prog;
  2940		license[sizeof(license) - 1] = 0;
  2941	
  2942		/* eBPF programs must be GPL compatible to use GPL-ed functions */
  2943		prog->gpl_compatible = license_is_gpl_compatible(license) ? 1 : 0;
  2944	
  2945		prog->orig_prog = NULL;
  2946		prog->jited = 0;
  2947	
  2948		atomic64_set(&prog->aux->refcnt, 1);
  2949	
  2950		if (bpf_prog_is_dev_bound(prog->aux)) {
  2951			err = bpf_prog_dev_bound_init(prog, attr);
  2952			if (err)
  2953				goto free_prog;
  2954		}
  2955	
  2956		if (type == BPF_PROG_TYPE_EXT && dst_prog &&
  2957		    bpf_prog_is_dev_bound(dst_prog->aux)) {
  2958			err = bpf_prog_dev_bound_inherit(prog, dst_prog);
  2959			if (err)
  2960				goto free_prog;
  2961		}
  2962	
  2963		/*
  2964		 * Bookkeeping for managing the program attachment chain.
  2965		 *
  2966		 * It might be tempting to set attach_tracing_prog flag at the attachment
  2967		 * time, but this will not prevent from loading bunch of tracing prog
  2968		 * first, then attach them one to another.
  2969		 *
  2970		 * The flag attach_tracing_prog is set for the whole program lifecycle, and
  2971		 * doesn't have to be cleared in bpf_tracing_link_release, since tracing
  2972		 * programs cannot change attachment target.
  2973		 */
  2974		if (type == BPF_PROG_TYPE_TRACING && dst_prog &&
  2975		    dst_prog->type == BPF_PROG_TYPE_TRACING) {
  2976			prog->aux->attach_tracing_prog = true;
  2977		}
  2978	
  2979		/* find program type: socket_filter vs tracing_filter */
  2980		err = find_prog_type(type, prog);
  2981		if (err < 0)
  2982			goto free_prog;
  2983	
  2984		prog->aux->load_time = ktime_get_boottime_ns();
  2985		err = bpf_obj_name_cpy(prog->aux->name, attr->prog_name,
  2986				       sizeof(attr->prog_name));
  2987		if (err < 0)
  2988			goto free_prog;
  2989	
  2990		err = security_bpf_prog_load(prog, attr, token, uattr.is_kernel);
  2991		if (err)
  2992			goto free_prog_sec;
  2993	
  2994		/* run eBPF verifier */
  2995		err = bpf_check(&prog, attr, uattr, uattr_size);
  2996		if (err < 0)
  2997			goto free_used_maps;
  2998	
  2999		prog = bpf_prog_select_runtime(prog, &err);
  3000		if (err < 0)
  3001			goto free_used_maps;
  3002	
  3003		err = bpf_prog_alloc_id(prog);
  3004		if (err)
  3005			goto free_used_maps;
  3006	
  3007		/* Upon success of bpf_prog_alloc_id(), the BPF prog is
  3008		 * effectively publicly exposed. However, retrieving via
  3009		 * bpf_prog_get_fd_by_id() will take another reference,
  3010		 * therefore it cannot be gone underneath us.
  3011		 *
  3012		 * Only for the time /after/ successful bpf_prog_new_fd()
  3013		 * and before returning to userspace, we might just hold
  3014		 * one reference and any parallel close on that fd could
  3015		 * rip everything out. Hence, below notifications must
  3016		 * happen before bpf_prog_new_fd().
  3017		 *
  3018		 * Also, any failure handling from this point onwards must
  3019		 * be using bpf_prog_put() given the program is exposed.
  3020		 */
  3021		bpf_prog_kallsyms_add(prog);
  3022		perf_event_bpf_event(prog, PERF_BPF_EVENT_PROG_LOAD, 0);
  3023		bpf_audit_prog(prog, BPF_AUDIT_LOAD);
  3024	
  3025		err = bpf_prog_new_fd(prog);
  3026		if (err < 0)
  3027			bpf_prog_put(prog);
  3028		return err;
  3029	
  3030	free_used_maps:
  3031		/* In case we have subprogs, we need to wait for a grace
  3032		 * period before we can tear down JIT memory since symbols
  3033		 * are already exposed under kallsyms.
  3034		 */
  3035		__bpf_prog_put_noref(prog, prog->aux->real_func_cnt);
  3036		return err;
  3037	
  3038	free_prog_sec:
  3039		security_bpf_prog_free(prog);
  3040	free_prog:
  3041		free_uid(prog->aux->user);
  3042		if (prog->aux->attach_btf)
  3043			btf_put(prog->aux->attach_btf);
  3044		bpf_prog_free(prog);
  3045	put_token:
  3046		bpf_token_put(token);
  3047		return err;
  3048	}
  3049	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
