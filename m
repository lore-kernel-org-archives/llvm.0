Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C25984D13;
	Thu, 10 Apr 2025 04:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744259634; cv=none; b=biRfKWr1/EDlh31M5Hgii/itHJ+Nyzt2NyqmcfWcIVIEYQPwYHzgHsTSLsIp+WWIhUCbfoP6LhhENb3460Yr4Tr1lzEgsuvACd5PB3CfWCf3i6VrPkUlc9KJnwsihCro5cOsl/QS/mvIzUcQWJ2AJtDgZLqHwrY7af7pqnU3xZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744259634; c=relaxed/simple;
	bh=Sx8uCa1l2IMAE1BgXyaWeinwvV+yo1/edizkgVG/1qY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZYnWSEHgrgqF0xPHCGGoG1/ZeC/0k19Z8lUcbH76UBNKSFDhli0oYdLWQCPTjwv9fvOU+xJV+7lLmISe+nJasIRB7m67Sk0cSKJmcmxyiDdjhKBnhsqflZNrNFcCUCps+cx5LVcjk4185DOCpx1W1Auw8R6qb4WPQsrcMq+ctWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ViKmamD9; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ViKmamD9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744259631; x=1775795631;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Sx8uCa1l2IMAE1BgXyaWeinwvV+yo1/edizkgVG/1qY=;
  b=ViKmamD9djYLGGaExRYhbLAsMb674SEtxloj3KrfMw8S8WYPRfRTfdxK
   nhi7GXBnI0K9flqabv52OvIinpM2AnV2cnxJzkRR4Gf2izzWofUSGbG84
   ZzgvOyDMCQLfu/J9//fdYGCl96UZI4GdEL5hac8MXTRBJ6WBsaV0VAeMr
   OKTvNxbXQFaTwHe/DMi2Jb7TXz/eRDKIPexE2/2j4Si20VCYxP6xnRfoY
   Xmu0zbNldhZS+DFvyd6vbhQsoT4eokNQ8GOoHOCkBY+S+Y7KGvmbNRWLS
   /hCTdNZiaI4CL2Yu7o8KA7lKDOra1Ua9uUlBH1c7IVCk4QTjZ9HJE+Y0A
   Q==;
X-CSE-ConnectionGUID: uJtfqJR/TcmL2KmQcFiOvw==
X-CSE-MsgGUID: AgCBzCpuTs2o/D20G509xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="33367486"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="33367486"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 21:33:50 -0700
X-CSE-ConnectionGUID: c335qsD7RyiwoWkWcyebFQ==
X-CSE-MsgGUID: +YhE1yjyQhiSC2ww4EM+/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="132918437"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Apr 2025 21:33:49 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2jbn-0009bb-0d;
	Thu, 10 Apr 2025 04:33:47 +0000
Date: Thu, 10 Apr 2025 12:33:05 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next 04/13] bpf: Move bpf_check_attach_target() to core
Message-ID: <202504101257.91EeLn3W-lkp@intel.com>
References: <9448dae93bf91b62fb6e097cf783d0277fdeb542.1744169424.git.dxu@dxuuu.xyz>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9448dae93bf91b62fb6e097cf783d0277fdeb542.1744169424.git.dxu@dxuuu.xyz>

Hi Daniel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Xu/bpf-Move-bpf_prog_ctx_arg_info_init-body-into-header/20250409-114116
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/9448dae93bf91b62fb6e097cf783d0277fdeb542.1744169424.git.dxu%40dxuuu.xyz
patch subject: [RFC bpf-next 04/13] bpf: Move bpf_check_attach_target() to core
config: arm-randconfig-002-20250410 (https://download.01.org/0day-ci/archive/20250410/202504101257.91EeLn3W-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250410/202504101257.91EeLn3W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504101257.91EeLn3W-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/core.c:320:9: error: call to undeclared function 'btf_distill_func_proto'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     320 |                 ret = btf_distill_func_proto(log, btf, t, tname, &tgt_info->fmodel);
         |                       ^
>> kernel/bpf/core.c:339:7: error: call to undeclared function 'btf_check_type_match'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     339 |                     btf_check_type_match(log, prog, btf, t))
         |                     ^
>> kernel/bpf/core.c:396:19: error: call to undeclared function 'btf_kfunc_is_modify_return'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     396 |                                         u32 *flags = btf_kfunc_is_modify_return(btf, btf_id,
         |                                                      ^
>> kernel/bpf/core.c:396:11: error: incompatible integer to pointer conversion initializing 'u32 *' (aka 'unsigned int *') with an expression of type 'int' [-Wint-conversion]
     396 |                                         u32 *flags = btf_kfunc_is_modify_return(btf, btf_id,
         |                                              ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     397 |                                                                                 prog);
         |                                                                                 ~~~~~
   kernel/bpf/core.c:425:8: error: call to undeclared function 'btf_kfunc_is_modify_return'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     425 |                         if (btf_kfunc_is_modify_return(btf, btf_id, prog) ||
         |                             ^
   5 errors generated.


vim +/btf_distill_func_proto +320 kernel/bpf/core.c

   111	
   112	
   113	int bpf_check_attach_target(struct bpf_verifier_log *log,
   114				    const struct bpf_prog *prog,
   115				    const struct bpf_prog *tgt_prog,
   116				    u32 btf_id,
   117				    struct bpf_attach_target_info *tgt_info)
   118	{
   119		bool prog_extension = prog->type == BPF_PROG_TYPE_EXT;
   120		bool prog_tracing = prog->type == BPF_PROG_TYPE_TRACING;
   121		char trace_symbol[KSYM_SYMBOL_LEN];
   122		const char prefix[] = "btf_trace_";
   123		struct bpf_raw_event_map *btp;
   124		int ret = 0, subprog = -1, i;
   125		const struct btf_type *t;
   126		bool conservative = true;
   127		const char *tname, *fname;
   128		struct btf *btf;
   129		long addr = 0;
   130		struct module *mod = NULL;
   131	
   132		if (!btf_id) {
   133			bpf_log(log, "Tracing programs must provide btf_id\n");
   134			return -EINVAL;
   135		}
   136		btf = tgt_prog ? tgt_prog->aux->btf : prog->aux->attach_btf;
   137		if (!btf) {
   138			bpf_log(log,
   139				"FENTRY/FEXIT program can only be attached to another program annotated with BTF\n");
   140			return -EINVAL;
   141		}
   142		t = btf_type_by_id(btf, btf_id);
   143		if (!t) {
   144			bpf_log(log, "attach_btf_id %u is invalid\n", btf_id);
   145			return -EINVAL;
   146		}
   147		tname = btf_name_by_offset(btf, t->name_off);
   148		if (!tname) {
   149			bpf_log(log, "attach_btf_id %u doesn't have a name\n", btf_id);
   150			return -EINVAL;
   151		}
   152		if (tgt_prog) {
   153			struct bpf_prog_aux *aux = tgt_prog->aux;
   154			bool tgt_changes_pkt_data;
   155			bool tgt_might_sleep;
   156	
   157			if (bpf_prog_is_dev_bound(prog->aux) &&
   158			    !bpf_prog_dev_bound_match(prog, tgt_prog)) {
   159				bpf_log(log, "Target program bound device mismatch");
   160				return -EINVAL;
   161			}
   162	
   163			for (i = 0; i < aux->func_info_cnt; i++)
   164				if (aux->func_info[i].type_id == btf_id) {
   165					subprog = i;
   166					break;
   167				}
   168			if (subprog == -1) {
   169				bpf_log(log, "Subprog %s doesn't exist\n", tname);
   170				return -EINVAL;
   171			}
   172			if (aux->func && aux->func[subprog]->aux->exception_cb) {
   173				bpf_log(log,
   174					"%s programs cannot attach to exception callback\n",
   175					prog_extension ? "Extension" : "FENTRY/FEXIT");
   176				return -EINVAL;
   177			}
   178			conservative = aux->func_info_aux[subprog].unreliable;
   179			if (prog_extension) {
   180				if (conservative) {
   181					bpf_log(log,
   182						"Cannot replace static functions\n");
   183					return -EINVAL;
   184				}
   185				if (!prog->jit_requested) {
   186					bpf_log(log,
   187						"Extension programs should be JITed\n");
   188					return -EINVAL;
   189				}
   190				tgt_changes_pkt_data = aux->func
   191						       ? aux->func[subprog]->aux->changes_pkt_data
   192						       : aux->changes_pkt_data;
   193				if (prog->aux->changes_pkt_data && !tgt_changes_pkt_data) {
   194					bpf_log(log,
   195						"Extension program changes packet data, while original does not\n");
   196					return -EINVAL;
   197				}
   198	
   199				tgt_might_sleep = aux->func
   200						  ? aux->func[subprog]->aux->might_sleep
   201						  : aux->might_sleep;
   202				if (prog->aux->might_sleep && !tgt_might_sleep) {
   203					bpf_log(log,
   204						"Extension program may sleep, while original does not\n");
   205					return -EINVAL;
   206				}
   207			}
   208			if (!tgt_prog->jited) {
   209				bpf_log(log, "Can attach to only JITed progs\n");
   210				return -EINVAL;
   211			}
   212			if (prog_tracing) {
   213				if (aux->attach_tracing_prog) {
   214					/*
   215					 * Target program is an fentry/fexit which is already attached
   216					 * to another tracing program. More levels of nesting
   217					 * attachment are not allowed.
   218					 */
   219					bpf_log(log, "Cannot nest tracing program attach more than once\n");
   220					return -EINVAL;
   221				}
   222			} else if (tgt_prog->type == prog->type) {
   223				/*
   224				 * To avoid potential call chain cycles, prevent attaching of a
   225				 * program extension to another extension. It's ok to attach
   226				 * fentry/fexit to extension program.
   227				 */
   228				bpf_log(log, "Cannot recursively attach\n");
   229				return -EINVAL;
   230			}
   231			if (tgt_prog->type == BPF_PROG_TYPE_TRACING &&
   232			    prog_extension &&
   233			    (tgt_prog->expected_attach_type == BPF_TRACE_FENTRY ||
   234			     tgt_prog->expected_attach_type == BPF_TRACE_FEXIT)) {
   235				/* Program extensions can extend all program types
   236				 * except fentry/fexit. The reason is the following.
   237				 * The fentry/fexit programs are used for performance
   238				 * analysis, stats and can be attached to any program
   239				 * type. When extension program is replacing XDP function
   240				 * it is necessary to allow performance analysis of all
   241				 * functions. Both original XDP program and its program
   242				 * extension. Hence attaching fentry/fexit to
   243				 * BPF_PROG_TYPE_EXT is allowed. If extending of
   244				 * fentry/fexit was allowed it would be possible to create
   245				 * long call chain fentry->extension->fentry->extension
   246				 * beyond reasonable stack size. Hence extending fentry
   247				 * is not allowed.
   248				 */
   249				bpf_log(log, "Cannot extend fentry/fexit\n");
   250				return -EINVAL;
   251			}
   252		} else {
   253			if (prog_extension) {
   254				bpf_log(log, "Cannot replace kernel functions\n");
   255				return -EINVAL;
   256			}
   257		}
   258	
   259		switch (prog->expected_attach_type) {
   260		case BPF_TRACE_RAW_TP:
   261			if (tgt_prog) {
   262				bpf_log(log,
   263					"Only FENTRY/FEXIT progs are attachable to another BPF prog\n");
   264				return -EINVAL;
   265			}
   266			if (!btf_type_is_typedef(t)) {
   267				bpf_log(log, "attach_btf_id %u is not a typedef\n",
   268					btf_id);
   269				return -EINVAL;
   270			}
   271			if (strncmp(prefix, tname, sizeof(prefix) - 1)) {
   272				bpf_log(log, "attach_btf_id %u points to wrong type name %s\n",
   273					btf_id, tname);
   274				return -EINVAL;
   275			}
   276			tname += sizeof(prefix) - 1;
   277	
   278			/* The func_proto of "btf_trace_##tname" is generated from typedef without argument
   279			 * names. Thus using bpf_raw_event_map to get argument names.
   280			 */
   281			btp = bpf_get_raw_tracepoint(tname);
   282			if (!btp)
   283				return -EINVAL;
   284			fname = kallsyms_lookup((unsigned long)btp->bpf_func, NULL, NULL, NULL,
   285						trace_symbol);
   286			bpf_put_raw_tracepoint(btp);
   287	
   288			if (fname)
   289				ret = btf_find_by_name_kind(btf, fname, BTF_KIND_FUNC);
   290	
   291			if (!fname || ret < 0) {
   292				bpf_log(log, "Cannot find btf of tracepoint template, fall back to %s%s.\n",
   293					prefix, tname);
   294				t = btf_type_by_id(btf, t->type);
   295				if (!btf_type_is_ptr(t))
   296					/* should never happen in valid vmlinux build */
   297					return -EINVAL;
   298			} else {
   299				t = btf_type_by_id(btf, ret);
   300				if (!btf_type_is_func(t))
   301					/* should never happen in valid vmlinux build */
   302					return -EINVAL;
   303			}
   304	
   305			t = btf_type_by_id(btf, t->type);
   306			if (!btf_type_is_func_proto(t))
   307				/* should never happen in valid vmlinux build */
   308				return -EINVAL;
   309	
   310			break;
   311		case BPF_TRACE_ITER:
   312			if (!btf_type_is_func(t)) {
   313				bpf_log(log, "attach_btf_id %u is not a function\n",
   314					btf_id);
   315				return -EINVAL;
   316			}
   317			t = btf_type_by_id(btf, t->type);
   318			if (!btf_type_is_func_proto(t))
   319				return -EINVAL;
 > 320			ret = btf_distill_func_proto(log, btf, t, tname, &tgt_info->fmodel);
   321			if (ret)
   322				return ret;
   323			break;
   324		default:
   325			if (!prog_extension)
   326				return -EINVAL;
   327			fallthrough;
   328		case BPF_MODIFY_RETURN:
   329		case BPF_LSM_MAC:
   330		case BPF_LSM_CGROUP:
   331		case BPF_TRACE_FENTRY:
   332		case BPF_TRACE_FEXIT:
   333			if (!btf_type_is_func(t)) {
   334				bpf_log(log, "attach_btf_id %u is not a function\n",
   335					btf_id);
   336				return -EINVAL;
   337			}
   338			if (prog_extension &&
 > 339			    btf_check_type_match(log, prog, btf, t))
   340				return -EINVAL;
   341			t = btf_type_by_id(btf, t->type);
   342			if (!btf_type_is_func_proto(t))
   343				return -EINVAL;
   344	
   345			if ((prog->aux->saved_dst_prog_type || prog->aux->saved_dst_attach_type) &&
   346			    (!tgt_prog || prog->aux->saved_dst_prog_type != tgt_prog->type ||
   347			     prog->aux->saved_dst_attach_type != tgt_prog->expected_attach_type))
   348				return -EINVAL;
   349	
   350			if (tgt_prog && conservative)
   351				t = NULL;
   352	
   353			ret = btf_distill_func_proto(log, btf, t, tname, &tgt_info->fmodel);
   354			if (ret < 0)
   355				return ret;
   356	
   357			if (tgt_prog) {
   358				if (subprog == 0)
   359					addr = (long) tgt_prog->bpf_func;
   360				else
   361					addr = (long) tgt_prog->aux->func[subprog]->bpf_func;
   362			} else {
   363				if (btf_is_module(btf)) {
   364					mod = btf_try_get_module(btf);
   365					if (mod)
   366						addr = find_kallsyms_symbol_value(mod, tname);
   367					else
   368						addr = 0;
   369				} else {
   370					addr = kallsyms_lookup_name(tname);
   371				}
   372				if (!addr) {
   373					module_put(mod);
   374					bpf_log(log,
   375						"The address of function %s cannot be found\n",
   376						tname);
   377					return -ENOENT;
   378				}
   379			}
   380	
   381			if (prog->sleepable) {
   382				ret = -EINVAL;
   383				switch (prog->type) {
   384				case BPF_PROG_TYPE_TRACING:
   385	
   386					/* fentry/fexit/fmod_ret progs can be sleepable if they are
   387					 * attached to ALLOW_ERROR_INJECTION and are not in denylist.
   388					 */
   389					if (!check_non_sleepable_error_inject(btf_id) &&
   390					    within_error_injection_list(addr))
   391						ret = 0;
   392					/* fentry/fexit/fmod_ret progs can also be sleepable if they are
   393					 * in the fmodret id set with the KF_SLEEPABLE flag.
   394					 */
   395					else {
 > 396						u32 *flags = btf_kfunc_is_modify_return(btf, btf_id,
   397											prog);
   398	
   399						if (flags && (*flags & KF_SLEEPABLE))
   400							ret = 0;
   401					}
   402					break;
   403				case BPF_PROG_TYPE_LSM:
   404					/* LSM progs check that they are attached to bpf_lsm_*() funcs.
   405					 * Only some of them are sleepable.
   406					 */
   407					if (bpf_lsm_is_sleepable_hook(btf_id))
   408						ret = 0;
   409					break;
   410				default:
   411					break;
   412				}
   413				if (ret) {
   414					module_put(mod);
   415					bpf_log(log, "%s is not sleepable\n", tname);
   416					return ret;
   417				}
   418			} else if (prog->expected_attach_type == BPF_MODIFY_RETURN) {
   419				if (tgt_prog) {
   420					module_put(mod);
   421					bpf_log(log, "can't modify return codes of BPF programs\n");
   422					return -EINVAL;
   423				}
   424				ret = -EINVAL;
   425				if (btf_kfunc_is_modify_return(btf, btf_id, prog) ||
   426				    !check_attach_modify_return(addr, tname))
   427					ret = 0;
   428				if (ret) {
   429					module_put(mod);
   430					bpf_log(log, "%s() is not modifiable\n", tname);
   431					return ret;
   432				}
   433			}
   434	
   435			break;
   436		}
   437		tgt_info->tgt_addr = addr;
   438		tgt_info->tgt_name = tname;
   439		tgt_info->tgt_type = t;
   440		tgt_info->tgt_mod = mod;
   441		return 0;
   442	}
   443	EXPORT_SYMBOL_GPL(bpf_check_attach_target);
   444	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
