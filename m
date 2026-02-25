Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5923A30F53C;
	Wed, 25 Feb 2026 20:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772051583; cv=none; b=J/R2A89NXWguxtjcvm916E2AZq3c7lSl/2fCLaeeB+Zyh79P/t1YQHGxaEgHx9GNO/RXx26XRHC6LToFe9l3/gV0KC9/LIsJNnIbcyqNJkDObrTiUjC5SalTVck+p1jUwHIHN0S4gEqkT2B1+4SjW9c7usWpiLGs9w13o/ormis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772051583; c=relaxed/simple;
	bh=q9DIhV173vyLQ2tED4wyeerpNuoURfguwSyUGXTaH5U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o+hqrYdfPJ467ekO4iAT8lPcqd0u1PQwaW2PUK5PkCRhFkNwfIL8KH8NRuHtYbdR3hwovrxRzzcBF/mrf0zo53pREhyVk3c/s31KmNxrevn49hBOOMVl6XwHUhc3FRdaDTEhMzmyXSiomsoWiphbSzETTeu5Hu8pL6KfDeCt9Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O5h1q1QM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O5h1q1QM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772051581; x=1803587581;
  h=date:from:to:cc:subject:message-id;
  bh=q9DIhV173vyLQ2tED4wyeerpNuoURfguwSyUGXTaH5U=;
  b=O5h1q1QMckP/eAdhPwP7EBEoK8nQUr0nu4rpG6Fc1NSTgiMefvY4O+8Y
   MwqEcznGH7GsRy4ahAq/wqauC0lt2kGnRFx3GL0Y+FDUxHFdkOxrjF2N6
   g2GpBsu5EawU9rJuDX0qFo3t6hZ/HcCqzqBfu8YobXJ6ZI+zl+q+eSAdo
   4SvCQMBFeyoJx5qDaAzQmVclIUOT8D4IYbmoBEvIa9izYmHOYamxUYeGP
   PJlDcFpIp2meXtLN/gMFmAPqmr8aq2DoXhnowK4kORtuJFm0XVuQfxj2J
   t/v/6DbvXNWROsm8HlYIff6TnTKHshviwe5fxfyGXKLT43RhGV4SmG9UT
   Q==;
X-CSE-ConnectionGUID: srr+G2uARxSlSrsdvVsC/g==
X-CSE-MsgGUID: zB5icwo7SzqV7Fzkj8uYrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73209044"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="73209044"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 12:32:59 -0800
X-CSE-ConnectionGUID: e8IcetN5TvO6vgktoDU0Uw==
X-CSE-MsgGUID: eQvmx1zKSCmhcG5R19k/Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="220969764"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 25 Feb 2026 12:32:57 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvLZ1-000000007G6-0Pyv;
	Wed, 25 Feb 2026 20:32:55 +0000
Date: Thu, 26 Feb 2026 04:23:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_5 8/23]
 kernel/bpf/verifier.c:25097:9: error: call to undeclared function
 'is_tracing_multi'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202602260442.t3svuZR4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_5
head:   2e9ff5967a4f3cb4d96c1fd04944036d9961099d
commit: dbc1a93485c8b7908944dcfaaee011b175341b02 [8/23] bpf: Add multi tracing attach types
config: s390-randconfig-001-20260226 (https://download.01.org/0day-ci/archive/20260226/202602260442.t3svuZR4-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602260442.t3svuZR4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602260442.t3svuZR4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bpf/verifier.c:7:
   In file included from include/linux/bpf-cgroup.h:5:
   include/linux/bpf.h:1543:51: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
    1543 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                   ^
   include/linux/bpf.h:1549:53: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
    1549 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                     ^
>> kernel/bpf/verifier.c:25097:9: error: call to undeclared function 'is_tracing_multi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    25097 |                                 if (is_tracing_multi(prog->expected_attach_type) &&
          |                                     ^
   kernel/bpf/verifier.c:25285:13: error: call to undeclared function 'is_tracing_multi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    25285 |         } else if (is_tracing_multi(prog->expected_attach_type)) {
          |                    ^
   2 warnings and 2 errors generated.
--
   In file included from kernel/bpf/syscall.c:5:
   include/linux/bpf.h:1543:51: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
    1543 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                   ^
   include/linux/bpf.h:1549:53: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
    1549 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                     ^
>> kernel/bpf/syscall.c:2967:15: error: call to undeclared function 'is_tracing_multi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2967 |         multi_func = is_tracing_multi(attr->expected_attach_type);
         |                      ^
   kernel/bpf/syscall.c:3537:42: error: incompatible pointer types passing 'struct bpf_tramp_node *' to parameter of type 'struct bpf_tramp_link *' [-Wincompatible-pointer-types]
    3537 |         WARN_ON_ONCE(bpf_trampoline_unlink_prog(&tr_link->link.node,
         |                                                 ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:120:25: note: expanded from macro 'WARN_ON_ONCE'
     120 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/bpf.h:1549:69: note: passing argument to parameter 'link' here
    1549 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                                     ^
   kernel/bpf/syscall.c:3760:33: error: incompatible pointer types passing 'struct bpf_tramp_node *' to parameter of type 'struct bpf_tramp_link *' [-Wincompatible-pointer-types]
    3760 |         err = bpf_trampoline_link_prog(&link->link.node, tr, tgt_prog);
         |                                        ^~~~~~~~~~~~~~~~
   include/linux/bpf.h:1543:67: note: passing argument to parameter 'link' here
    1543 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                                   ^
   2 warnings and 3 errors generated.


vim +/is_tracing_multi +25097 kernel/bpf/verifier.c

 24810	
 24811	int bpf_check_attach_target(struct bpf_verifier_log *log,
 24812				    const struct bpf_prog *prog,
 24813				    const struct bpf_prog *tgt_prog,
 24814				    u32 btf_id,
 24815				    struct bpf_attach_target_info *tgt_info)
 24816	{
 24817		bool prog_extension = prog->type == BPF_PROG_TYPE_EXT;
 24818		bool prog_tracing = prog->type == BPF_PROG_TYPE_TRACING;
 24819		char trace_symbol[KSYM_SYMBOL_LEN];
 24820		const char prefix[] = "btf_trace_";
 24821		struct bpf_raw_event_map *btp;
 24822		int ret = 0, subprog = -1, i;
 24823		const struct btf_type *t;
 24824		bool conservative = true;
 24825		const char *tname, *fname;
 24826		struct btf *btf;
 24827		long addr = 0;
 24828		struct module *mod = NULL;
 24829	
 24830		if (!btf_id) {
 24831			bpf_log(log, "Tracing programs must provide btf_id\n");
 24832			return -EINVAL;
 24833		}
 24834		btf = tgt_prog ? tgt_prog->aux->btf : prog->aux->attach_btf;
 24835		if (!btf) {
 24836			bpf_log(log,
 24837				"FENTRY/FEXIT program can only be attached to another program annotated with BTF\n");
 24838			return -EINVAL;
 24839		}
 24840		t = btf_type_by_id(btf, btf_id);
 24841		if (!t) {
 24842			bpf_log(log, "attach_btf_id %u is invalid\n", btf_id);
 24843			return -EINVAL;
 24844		}
 24845		tname = btf_name_by_offset(btf, t->name_off);
 24846		if (!tname) {
 24847			bpf_log(log, "attach_btf_id %u doesn't have a name\n", btf_id);
 24848			return -EINVAL;
 24849		}
 24850		if (tgt_prog) {
 24851			struct bpf_prog_aux *aux = tgt_prog->aux;
 24852			bool tgt_changes_pkt_data;
 24853			bool tgt_might_sleep;
 24854	
 24855			if (bpf_prog_is_dev_bound(prog->aux) &&
 24856			    !bpf_prog_dev_bound_match(prog, tgt_prog)) {
 24857				bpf_log(log, "Target program bound device mismatch");
 24858				return -EINVAL;
 24859			}
 24860	
 24861			for (i = 0; i < aux->func_info_cnt; i++)
 24862				if (aux->func_info[i].type_id == btf_id) {
 24863					subprog = i;
 24864					break;
 24865				}
 24866			if (subprog == -1) {
 24867				bpf_log(log, "Subprog %s doesn't exist\n", tname);
 24868				return -EINVAL;
 24869			}
 24870			if (aux->func && aux->func[subprog]->aux->exception_cb) {
 24871				bpf_log(log,
 24872					"%s programs cannot attach to exception callback\n",
 24873					prog_extension ? "Extension" : "FENTRY/FEXIT");
 24874				return -EINVAL;
 24875			}
 24876			conservative = aux->func_info_aux[subprog].unreliable;
 24877			if (prog_extension) {
 24878				if (conservative) {
 24879					bpf_log(log,
 24880						"Cannot replace static functions\n");
 24881					return -EINVAL;
 24882				}
 24883				if (!prog->jit_requested) {
 24884					bpf_log(log,
 24885						"Extension programs should be JITed\n");
 24886					return -EINVAL;
 24887				}
 24888				tgt_changes_pkt_data = aux->func
 24889						       ? aux->func[subprog]->aux->changes_pkt_data
 24890						       : aux->changes_pkt_data;
 24891				if (prog->aux->changes_pkt_data && !tgt_changes_pkt_data) {
 24892					bpf_log(log,
 24893						"Extension program changes packet data, while original does not\n");
 24894					return -EINVAL;
 24895				}
 24896	
 24897				tgt_might_sleep = aux->func
 24898						  ? aux->func[subprog]->aux->might_sleep
 24899						  : aux->might_sleep;
 24900				if (prog->aux->might_sleep && !tgt_might_sleep) {
 24901					bpf_log(log,
 24902						"Extension program may sleep, while original does not\n");
 24903					return -EINVAL;
 24904				}
 24905			}
 24906			if (!tgt_prog->jited) {
 24907				bpf_log(log, "Can attach to only JITed progs\n");
 24908				return -EINVAL;
 24909			}
 24910			if (prog_tracing) {
 24911				if (aux->attach_tracing_prog) {
 24912					/*
 24913					 * Target program is an fentry/fexit which is already attached
 24914					 * to another tracing program. More levels of nesting
 24915					 * attachment are not allowed.
 24916					 */
 24917					bpf_log(log, "Cannot nest tracing program attach more than once\n");
 24918					return -EINVAL;
 24919				}
 24920			} else if (tgt_prog->type == prog->type) {
 24921				/*
 24922				 * To avoid potential call chain cycles, prevent attaching of a
 24923				 * program extension to another extension. It's ok to attach
 24924				 * fentry/fexit to extension program.
 24925				 */
 24926				bpf_log(log, "Cannot recursively attach\n");
 24927				return -EINVAL;
 24928			}
 24929			if (tgt_prog->type == BPF_PROG_TYPE_TRACING &&
 24930			    prog_extension &&
 24931			    (tgt_prog->expected_attach_type == BPF_TRACE_FENTRY ||
 24932			     tgt_prog->expected_attach_type == BPF_TRACE_FEXIT ||
 24933			     tgt_prog->expected_attach_type == BPF_TRACE_FSESSION)) {
 24934				/* Program extensions can extend all program types
 24935				 * except fentry/fexit. The reason is the following.
 24936				 * The fentry/fexit programs are used for performance
 24937				 * analysis, stats and can be attached to any program
 24938				 * type. When extension program is replacing XDP function
 24939				 * it is necessary to allow performance analysis of all
 24940				 * functions. Both original XDP program and its program
 24941				 * extension. Hence attaching fentry/fexit to
 24942				 * BPF_PROG_TYPE_EXT is allowed. If extending of
 24943				 * fentry/fexit was allowed it would be possible to create
 24944				 * long call chain fentry->extension->fentry->extension
 24945				 * beyond reasonable stack size. Hence extending fentry
 24946				 * is not allowed.
 24947				 */
 24948				bpf_log(log, "Cannot extend fentry/fexit/fsession\n");
 24949				return -EINVAL;
 24950			}
 24951		} else {
 24952			if (prog_extension) {
 24953				bpf_log(log, "Cannot replace kernel functions\n");
 24954				return -EINVAL;
 24955			}
 24956		}
 24957	
 24958		switch (prog->expected_attach_type) {
 24959		case BPF_TRACE_RAW_TP:
 24960			if (tgt_prog) {
 24961				bpf_log(log,
 24962					"Only FENTRY/FEXIT progs are attachable to another BPF prog\n");
 24963				return -EINVAL;
 24964			}
 24965			if (!btf_type_is_typedef(t)) {
 24966				bpf_log(log, "attach_btf_id %u is not a typedef\n",
 24967					btf_id);
 24968				return -EINVAL;
 24969			}
 24970			if (strncmp(prefix, tname, sizeof(prefix) - 1)) {
 24971				bpf_log(log, "attach_btf_id %u points to wrong type name %s\n",
 24972					btf_id, tname);
 24973				return -EINVAL;
 24974			}
 24975			tname += sizeof(prefix) - 1;
 24976	
 24977			/* The func_proto of "btf_trace_##tname" is generated from typedef without argument
 24978			 * names. Thus using bpf_raw_event_map to get argument names.
 24979			 */
 24980			btp = bpf_get_raw_tracepoint(tname);
 24981			if (!btp)
 24982				return -EINVAL;
 24983			fname = kallsyms_lookup((unsigned long)btp->bpf_func, NULL, NULL, NULL,
 24984						trace_symbol);
 24985			bpf_put_raw_tracepoint(btp);
 24986	
 24987			if (fname)
 24988				ret = btf_find_by_name_kind(btf, fname, BTF_KIND_FUNC);
 24989	
 24990			if (!fname || ret < 0) {
 24991				bpf_log(log, "Cannot find btf of tracepoint template, fall back to %s%s.\n",
 24992					prefix, tname);
 24993				t = btf_type_by_id(btf, t->type);
 24994				if (!btf_type_is_ptr(t))
 24995					/* should never happen in valid vmlinux build */
 24996					return -EINVAL;
 24997			} else {
 24998				t = btf_type_by_id(btf, ret);
 24999				if (!btf_type_is_func(t))
 25000					/* should never happen in valid vmlinux build */
 25001					return -EINVAL;
 25002			}
 25003	
 25004			t = btf_type_by_id(btf, t->type);
 25005			if (!btf_type_is_func_proto(t))
 25006				/* should never happen in valid vmlinux build */
 25007				return -EINVAL;
 25008	
 25009			break;
 25010		case BPF_TRACE_ITER:
 25011			if (!btf_type_is_func(t)) {
 25012				bpf_log(log, "attach_btf_id %u is not a function\n",
 25013					btf_id);
 25014				return -EINVAL;
 25015			}
 25016			t = btf_type_by_id(btf, t->type);
 25017			if (!btf_type_is_func_proto(t))
 25018				return -EINVAL;
 25019			ret = btf_distill_func_proto(log, btf, t, tname, &tgt_info->fmodel);
 25020			if (ret)
 25021				return ret;
 25022			break;
 25023		default:
 25024			if (!prog_extension)
 25025				return -EINVAL;
 25026			fallthrough;
 25027		case BPF_MODIFY_RETURN:
 25028		case BPF_LSM_MAC:
 25029		case BPF_LSM_CGROUP:
 25030		case BPF_TRACE_FENTRY:
 25031		case BPF_TRACE_FEXIT:
 25032		case BPF_TRACE_FSESSION:
 25033		case BPF_TRACE_FENTRY_MULTI:
 25034		case BPF_TRACE_FEXIT_MULTI:
 25035			if (prog->expected_attach_type == BPF_TRACE_FSESSION &&
 25036			    !bpf_jit_supports_fsession()) {
 25037				bpf_log(log, "JIT does not support fsession\n");
 25038				return -EOPNOTSUPP;
 25039			}
 25040			if (!btf_type_is_func(t)) {
 25041				bpf_log(log, "attach_btf_id %u is not a function\n",
 25042					btf_id);
 25043				return -EINVAL;
 25044			}
 25045			if (prog_extension &&
 25046			    btf_check_type_match(log, prog, btf, t))
 25047				return -EINVAL;
 25048			t = btf_type_by_id(btf, t->type);
 25049			if (!btf_type_is_func_proto(t))
 25050				return -EINVAL;
 25051	
 25052			if ((prog->aux->saved_dst_prog_type || prog->aux->saved_dst_attach_type) &&
 25053			    (!tgt_prog || prog->aux->saved_dst_prog_type != tgt_prog->type ||
 25054			     prog->aux->saved_dst_attach_type != tgt_prog->expected_attach_type))
 25055				return -EINVAL;
 25056	
 25057			if (tgt_prog && conservative)
 25058				t = NULL;
 25059	
 25060			ret = btf_distill_func_proto(log, btf, t, tname, &tgt_info->fmodel);
 25061			if (ret < 0)
 25062				return ret;
 25063	
 25064			if (tgt_prog) {
 25065				if (subprog == 0)
 25066					addr = (long) tgt_prog->bpf_func;
 25067				else
 25068					addr = (long) tgt_prog->aux->func[subprog]->bpf_func;
 25069			} else {
 25070				if (btf_is_module(btf)) {
 25071					mod = btf_try_get_module(btf);
 25072					if (mod)
 25073						addr = find_kallsyms_symbol_value(mod, tname);
 25074					else
 25075						addr = 0;
 25076				} else {
 25077					addr = kallsyms_lookup_name(tname);
 25078				}
 25079				if (!addr) {
 25080					module_put(mod);
 25081					bpf_log(log,
 25082						"The address of function %s cannot be found\n",
 25083						tname);
 25084					return -ENOENT;
 25085				}
 25086			}
 25087	
 25088			if (prog->sleepable) {
 25089				ret = -EINVAL;
 25090				switch (prog->type) {
 25091				case BPF_PROG_TYPE_TRACING:
 25092	
 25093					/* fentry.multi/fexit.multi sleepable progs will pass initial
 25094					 * verifier check, the actual attachment is checked in later
 25095					 * pass with specific function btf_id.
 25096					 */
 25097					if (is_tracing_multi(prog->expected_attach_type) &&
 25098					    bpf_multi_func_btf_id[0] == btf_id)
 25099						ret = 0;
 25100					/* fentry/fexit/fmod_ret progs can be sleepable if they are
 25101					 * attached to ALLOW_ERROR_INJECTION and are not in denylist.
 25102					 */
 25103					else if (!check_non_sleepable_error_inject(btf_id) &&
 25104					    within_error_injection_list(addr))
 25105						ret = 0;
 25106					/* fentry/fexit/fmod_ret progs can also be sleepable if they are
 25107					 * in the fmodret id set with the KF_SLEEPABLE flag.
 25108					 */
 25109					else {
 25110						u32 *flags = btf_kfunc_is_modify_return(btf, btf_id,
 25111											prog);
 25112	
 25113						if (flags && (*flags & KF_SLEEPABLE))
 25114							ret = 0;
 25115					}
 25116					break;
 25117				case BPF_PROG_TYPE_LSM:
 25118					/* LSM progs check that they are attached to bpf_lsm_*() funcs.
 25119					 * Only some of them are sleepable.
 25120					 */
 25121					if (bpf_lsm_is_sleepable_hook(btf_id))
 25122						ret = 0;
 25123					break;
 25124				default:
 25125					break;
 25126				}
 25127				if (ret) {
 25128					module_put(mod);
 25129					bpf_log(log, "%s is not sleepable\n", tname);
 25130					return ret;
 25131				}
 25132			} else if (prog->expected_attach_type == BPF_MODIFY_RETURN) {
 25133				if (tgt_prog) {
 25134					module_put(mod);
 25135					bpf_log(log, "can't modify return codes of BPF programs\n");
 25136					return -EINVAL;
 25137				}
 25138				ret = -EINVAL;
 25139				if (btf_kfunc_is_modify_return(btf, btf_id, prog) ||
 25140				    !check_attach_modify_return(addr, tname))
 25141					ret = 0;
 25142				if (ret) {
 25143					module_put(mod);
 25144					bpf_log(log, "%s() is not modifiable\n", tname);
 25145					return ret;
 25146				}
 25147			}
 25148	
 25149			break;
 25150		}
 25151		tgt_info->tgt_addr = addr;
 25152		tgt_info->tgt_name = tname;
 25153		tgt_info->tgt_type = t;
 25154		tgt_info->tgt_mod = mod;
 25155		return 0;
 25156	}
 25157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
