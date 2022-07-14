Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA506002
	for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 17:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657818212; x=1689354212;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1JAaat9FIeIjJmVWOqPkj/iVg0PvYgmu6j0rcY8szxw=;
  b=g7M41R7lFtr/pkhad10vFIhA/c3f7HpJktuRZWfUMMthwzuq0qN3vkwh
   4Ex704DRESSFsw5hCJa8F239NZr7ULsxlaGEvA3KUMJO26nFGG/smOxje
   EixXa304L/rBTQBfTRn7qeocWgSgz/30jgbDRUIYIklAssScdwKiwrBci
   TYSweSClZ1W6NHKjV25GGEnS1gHSaVFEl5Uafh3JbjUchakP40yRuzGZ+
   JdndUSbORrE++OnaY9NB9v0Nce5ZQNw85YEhf3nkseUpn7VgK6J5T4neh
   ZQVDoxJv7zBxEFtOUQc3fv1Ug3p036kX5lhl5k8iL7EpcS4U3Q79vnQrP
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="265364795"
X-IronPort-AV: E=Sophos;i="5.92,271,1650956400"; 
   d="scan'208";a="265364795"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2022 10:03:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,271,1650956400"; 
   d="scan'208";a="571176556"
Received: from lkp-server01.sh.intel.com (HELO fd2c14d642b4) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 14 Jul 2022 10:03:29 -0700
Received: from kbuild by fd2c14d642b4 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oC2FM-0000ty-FD;
	Thu, 14 Jul 2022 17:03:28 +0000
Date: Fri, 15 Jul 2022 01:03:12 +0800
From: kernel test robot <lkp@intel.com>
To: Artem Savkov <asavkov@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH bpf-next 3/4] bpf: add bpf_panic() helper
Message-ID: <202207150009.BPNTmC1o-lkp@intel.com>
References: <20220711083220.2175036-4-asavkov@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220711083220.2175036-4-asavkov@redhat.com>

Hi Artem,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on bpf/master]
[also build test ERROR on net/master linus/master v5.19-rc6]
[cannot apply to bpf-next/master net-next/master next-20220714]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Artem-Savkov/bpf_panic-helper/20220711-163442
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
config: arm64-buildonly-randconfig-r006-20220714 (https://download.01.org/0day-ci/archive/20220715/202207150009.BPNTmC1o-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e61b9c556267086ef9b743a0b57df302eef831b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/8aba500c3f61dcf538c8458a34f90f81279269a2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Artem-Savkov/bpf_panic-helper/20220711-163442
        git checkout 8aba500c3f61dcf538c8458a34f90f81279269a2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/bpf/verifier.c:7266:3: error: expected expression
                   struct bpf_prog_aux *aux = env->prog->aux;
                   ^
>> kernel/bpf/verifier.c:7267:8: error: use of undeclared identifier 'aux'
                   if (!aux->destructive) {
                        ^
   2 errors generated.


vim +7266 kernel/bpf/verifier.c

  7102	
  7103	static int check_helper_call(struct bpf_verifier_env *env, struct bpf_insn *insn,
  7104				     int *insn_idx_p)
  7105	{
  7106		const struct bpf_func_proto *fn = NULL;
  7107		enum bpf_return_type ret_type;
  7108		enum bpf_type_flag ret_flag;
  7109		struct bpf_reg_state *regs;
  7110		struct bpf_call_arg_meta meta;
  7111		int insn_idx = *insn_idx_p;
  7112		bool changes_data;
  7113		int i, err, func_id;
  7114	
  7115		/* find function prototype */
  7116		func_id = insn->imm;
  7117		if (func_id < 0 || func_id >= __BPF_FUNC_MAX_ID) {
  7118			verbose(env, "invalid func %s#%d\n", func_id_name(func_id),
  7119				func_id);
  7120			return -EINVAL;
  7121		}
  7122	
  7123		if (env->ops->get_func_proto)
  7124			fn = env->ops->get_func_proto(func_id, env->prog);
  7125		if (!fn) {
  7126			verbose(env, "unknown func %s#%d\n", func_id_name(func_id),
  7127				func_id);
  7128			return -EINVAL;
  7129		}
  7130	
  7131		/* eBPF programs must be GPL compatible to use GPL-ed functions */
  7132		if (!env->prog->gpl_compatible && fn->gpl_only) {
  7133			verbose(env, "cannot call GPL-restricted function from non-GPL compatible program\n");
  7134			return -EINVAL;
  7135		}
  7136	
  7137		if (fn->allowed && !fn->allowed(env->prog)) {
  7138			verbose(env, "helper call is not allowed in probe\n");
  7139			return -EINVAL;
  7140		}
  7141	
  7142		/* With LD_ABS/IND some JITs save/restore skb from r1. */
  7143		changes_data = bpf_helper_changes_pkt_data(fn->func);
  7144		if (changes_data && fn->arg1_type != ARG_PTR_TO_CTX) {
  7145			verbose(env, "kernel subsystem misconfigured func %s#%d: r1 != ctx\n",
  7146				func_id_name(func_id), func_id);
  7147			return -EINVAL;
  7148		}
  7149	
  7150		memset(&meta, 0, sizeof(meta));
  7151		meta.pkt_access = fn->pkt_access;
  7152	
  7153		err = check_func_proto(fn, func_id, &meta);
  7154		if (err) {
  7155			verbose(env, "kernel subsystem misconfigured func %s#%d\n",
  7156				func_id_name(func_id), func_id);
  7157			return err;
  7158		}
  7159	
  7160		meta.func_id = func_id;
  7161		/* check args */
  7162		for (i = 0; i < MAX_BPF_FUNC_REG_ARGS; i++) {
  7163			err = check_func_arg(env, i, &meta, fn);
  7164			if (err)
  7165				return err;
  7166		}
  7167	
  7168		err = record_func_map(env, &meta, func_id, insn_idx);
  7169		if (err)
  7170			return err;
  7171	
  7172		err = record_func_key(env, &meta, func_id, insn_idx);
  7173		if (err)
  7174			return err;
  7175	
  7176		/* Mark slots with STACK_MISC in case of raw mode, stack offset
  7177		 * is inferred from register state.
  7178		 */
  7179		for (i = 0; i < meta.access_size; i++) {
  7180			err = check_mem_access(env, insn_idx, meta.regno, i, BPF_B,
  7181					       BPF_WRITE, -1, false);
  7182			if (err)
  7183				return err;
  7184		}
  7185	
  7186		regs = cur_regs(env);
  7187	
  7188		if (meta.uninit_dynptr_regno) {
  7189			/* we write BPF_DW bits (8 bytes) at a time */
  7190			for (i = 0; i < BPF_DYNPTR_SIZE; i += 8) {
  7191				err = check_mem_access(env, insn_idx, meta.uninit_dynptr_regno,
  7192						       i, BPF_DW, BPF_WRITE, -1, false);
  7193				if (err)
  7194					return err;
  7195			}
  7196	
  7197			err = mark_stack_slots_dynptr(env, &regs[meta.uninit_dynptr_regno],
  7198						      fn->arg_type[meta.uninit_dynptr_regno - BPF_REG_1],
  7199						      insn_idx);
  7200			if (err)
  7201				return err;
  7202		}
  7203	
  7204		if (meta.release_regno) {
  7205			err = -EINVAL;
  7206			if (arg_type_is_dynptr(fn->arg_type[meta.release_regno - BPF_REG_1]))
  7207				err = unmark_stack_slots_dynptr(env, &regs[meta.release_regno]);
  7208			else if (meta.ref_obj_id)
  7209				err = release_reference(env, meta.ref_obj_id);
  7210			/* meta.ref_obj_id can only be 0 if register that is meant to be
  7211			 * released is NULL, which must be > R0.
  7212			 */
  7213			else if (register_is_null(&regs[meta.release_regno]))
  7214				err = 0;
  7215			if (err) {
  7216				verbose(env, "func %s#%d reference has not been acquired before\n",
  7217					func_id_name(func_id), func_id);
  7218				return err;
  7219			}
  7220		}
  7221	
  7222		switch (func_id) {
  7223		case BPF_FUNC_tail_call:
  7224			err = check_reference_leak(env);
  7225			if (err) {
  7226				verbose(env, "tail_call would lead to reference leak\n");
  7227				return err;
  7228			}
  7229			break;
  7230		case BPF_FUNC_get_local_storage:
  7231			/* check that flags argument in get_local_storage(map, flags) is 0,
  7232			 * this is required because get_local_storage() can't return an error.
  7233			 */
  7234			if (!register_is_null(&regs[BPF_REG_2])) {
  7235				verbose(env, "get_local_storage() doesn't support non-zero flags\n");
  7236				return -EINVAL;
  7237			}
  7238			break;
  7239		case BPF_FUNC_for_each_map_elem:
  7240			err = __check_func_call(env, insn, insn_idx_p, meta.subprogno,
  7241						set_map_elem_callback_state);
  7242			break;
  7243		case BPF_FUNC_timer_set_callback:
  7244			err = __check_func_call(env, insn, insn_idx_p, meta.subprogno,
  7245						set_timer_callback_state);
  7246			break;
  7247		case BPF_FUNC_find_vma:
  7248			err = __check_func_call(env, insn, insn_idx_p, meta.subprogno,
  7249						set_find_vma_callback_state);
  7250			break;
  7251		case BPF_FUNC_snprintf:
  7252			err = check_bpf_snprintf_call(env, regs);
  7253			break;
  7254		case BPF_FUNC_loop:
  7255			err = __check_func_call(env, insn, insn_idx_p, meta.subprogno,
  7256						set_loop_callback_state);
  7257			break;
  7258		case BPF_FUNC_dynptr_from_mem:
  7259			if (regs[BPF_REG_1].type != PTR_TO_MAP_VALUE) {
  7260				verbose(env, "Unsupported reg type %s for bpf_dynptr_from_mem data\n",
  7261					reg_type_str(env, regs[BPF_REG_1].type));
  7262				return -EACCES;
  7263			}
  7264			break;
  7265		case BPF_FUNC_panic:
> 7266			struct bpf_prog_aux *aux = env->prog->aux;
> 7267			if (!aux->destructive) {
  7268				verbose(env, "bpf_panic() calls require BPF_F_DESTRUCTIVE flag\n");
  7269				return -EACCES;
  7270			}
  7271		}
  7272	
  7273		if (err)
  7274			return err;
  7275	
  7276		/* reset caller saved regs */
  7277		for (i = 0; i < CALLER_SAVED_REGS; i++) {
  7278			mark_reg_not_init(env, regs, caller_saved[i]);
  7279			check_reg_arg(env, caller_saved[i], DST_OP_NO_MARK);
  7280		}
  7281	
  7282		/* helper call returns 64-bit value. */
  7283		regs[BPF_REG_0].subreg_def = DEF_NOT_SUBREG;
  7284	
  7285		/* update return register (already marked as written above) */
  7286		ret_type = fn->ret_type;
  7287		ret_flag = type_flag(fn->ret_type);
  7288		if (ret_type == RET_INTEGER) {
  7289			/* sets type to SCALAR_VALUE */
  7290			mark_reg_unknown(env, regs, BPF_REG_0);
  7291		} else if (ret_type == RET_VOID) {
  7292			regs[BPF_REG_0].type = NOT_INIT;
  7293		} else if (base_type(ret_type) == RET_PTR_TO_MAP_VALUE) {
  7294			/* There is no offset yet applied, variable or fixed */
  7295			mark_reg_known_zero(env, regs, BPF_REG_0);
  7296			/* remember map_ptr, so that check_map_access()
  7297			 * can check 'value_size' boundary of memory access
  7298			 * to map element returned from bpf_map_lookup_elem()
  7299			 */
  7300			if (meta.map_ptr == NULL) {
  7301				verbose(env,
  7302					"kernel subsystem misconfigured verifier\n");
  7303				return -EINVAL;
  7304			}
  7305			regs[BPF_REG_0].map_ptr = meta.map_ptr;
  7306			regs[BPF_REG_0].map_uid = meta.map_uid;
  7307			regs[BPF_REG_0].type = PTR_TO_MAP_VALUE | ret_flag;
  7308			if (!type_may_be_null(ret_type) &&
  7309			    map_value_has_spin_lock(meta.map_ptr)) {
  7310				regs[BPF_REG_0].id = ++env->id_gen;
  7311			}
  7312		} else if (base_type(ret_type) == RET_PTR_TO_SOCKET) {
  7313			mark_reg_known_zero(env, regs, BPF_REG_0);
  7314			regs[BPF_REG_0].type = PTR_TO_SOCKET | ret_flag;
  7315		} else if (base_type(ret_type) == RET_PTR_TO_SOCK_COMMON) {
  7316			mark_reg_known_zero(env, regs, BPF_REG_0);
  7317			regs[BPF_REG_0].type = PTR_TO_SOCK_COMMON | ret_flag;
  7318		} else if (base_type(ret_type) == RET_PTR_TO_TCP_SOCK) {
  7319			mark_reg_known_zero(env, regs, BPF_REG_0);
  7320			regs[BPF_REG_0].type = PTR_TO_TCP_SOCK | ret_flag;
  7321		} else if (base_type(ret_type) == RET_PTR_TO_ALLOC_MEM) {
  7322			mark_reg_known_zero(env, regs, BPF_REG_0);
  7323			regs[BPF_REG_0].type = PTR_TO_MEM | ret_flag;
  7324			regs[BPF_REG_0].mem_size = meta.mem_size;
  7325		} else if (base_type(ret_type) == RET_PTR_TO_MEM_OR_BTF_ID) {
  7326			const struct btf_type *t;
  7327	
  7328			mark_reg_known_zero(env, regs, BPF_REG_0);
  7329			t = btf_type_skip_modifiers(meta.ret_btf, meta.ret_btf_id, NULL);
  7330			if (!btf_type_is_struct(t)) {
  7331				u32 tsize;
  7332				const struct btf_type *ret;
  7333				const char *tname;
  7334	
  7335				/* resolve the type size of ksym. */
  7336				ret = btf_resolve_size(meta.ret_btf, t, &tsize);
  7337				if (IS_ERR(ret)) {
  7338					tname = btf_name_by_offset(meta.ret_btf, t->name_off);
  7339					verbose(env, "unable to resolve the size of type '%s': %ld\n",
  7340						tname, PTR_ERR(ret));
  7341					return -EINVAL;
  7342				}
  7343				regs[BPF_REG_0].type = PTR_TO_MEM | ret_flag;
  7344				regs[BPF_REG_0].mem_size = tsize;
  7345			} else {
  7346				/* MEM_RDONLY may be carried from ret_flag, but it
  7347				 * doesn't apply on PTR_TO_BTF_ID. Fold it, otherwise
  7348				 * it will confuse the check of PTR_TO_BTF_ID in
  7349				 * check_mem_access().
  7350				 */
  7351				ret_flag &= ~MEM_RDONLY;
  7352	
  7353				regs[BPF_REG_0].type = PTR_TO_BTF_ID | ret_flag;
  7354				regs[BPF_REG_0].btf = meta.ret_btf;
  7355				regs[BPF_REG_0].btf_id = meta.ret_btf_id;
  7356			}
  7357		} else if (base_type(ret_type) == RET_PTR_TO_BTF_ID) {
  7358			struct btf *ret_btf;
  7359			int ret_btf_id;
  7360	
  7361			mark_reg_known_zero(env, regs, BPF_REG_0);
  7362			regs[BPF_REG_0].type = PTR_TO_BTF_ID | ret_flag;
  7363			if (func_id == BPF_FUNC_kptr_xchg) {
  7364				ret_btf = meta.kptr_off_desc->kptr.btf;
  7365				ret_btf_id = meta.kptr_off_desc->kptr.btf_id;
  7366			} else {
  7367				ret_btf = btf_vmlinux;
  7368				ret_btf_id = *fn->ret_btf_id;
  7369			}
  7370			if (ret_btf_id == 0) {
  7371				verbose(env, "invalid return type %u of func %s#%d\n",
  7372					base_type(ret_type), func_id_name(func_id),
  7373					func_id);
  7374				return -EINVAL;
  7375			}
  7376			regs[BPF_REG_0].btf = ret_btf;
  7377			regs[BPF_REG_0].btf_id = ret_btf_id;
  7378		} else {
  7379			verbose(env, "unknown return type %u of func %s#%d\n",
  7380				base_type(ret_type), func_id_name(func_id), func_id);
  7381			return -EINVAL;
  7382		}
  7383	
  7384		if (type_may_be_null(regs[BPF_REG_0].type))
  7385			regs[BPF_REG_0].id = ++env->id_gen;
  7386	
  7387		if (is_ptr_cast_function(func_id)) {
  7388			/* For release_reference() */
  7389			regs[BPF_REG_0].ref_obj_id = meta.ref_obj_id;
  7390		} else if (is_acquire_function(func_id, meta.map_ptr)) {
  7391			int id = acquire_reference_state(env, insn_idx);
  7392	
  7393			if (id < 0)
  7394				return id;
  7395			/* For mark_ptr_or_null_reg() */
  7396			regs[BPF_REG_0].id = id;
  7397			/* For release_reference() */
  7398			regs[BPF_REG_0].ref_obj_id = id;
  7399		} else if (func_id == BPF_FUNC_dynptr_data) {
  7400			int dynptr_id = 0, i;
  7401	
  7402			/* Find the id of the dynptr we're acquiring a reference to */
  7403			for (i = 0; i < MAX_BPF_FUNC_REG_ARGS; i++) {
  7404				if (arg_type_is_dynptr(fn->arg_type[i])) {
  7405					if (dynptr_id) {
  7406						verbose(env, "verifier internal error: multiple dynptr args in func\n");
  7407						return -EFAULT;
  7408					}
  7409					dynptr_id = stack_slot_get_id(env, &regs[BPF_REG_1 + i]);
  7410				}
  7411			}
  7412			/* For release_reference() */
  7413			regs[BPF_REG_0].ref_obj_id = dynptr_id;
  7414		}
  7415	
  7416		do_refine_retval_range(regs, fn->ret_type, func_id, &meta);
  7417	
  7418		err = check_map_func_compatibility(env, meta.map_ptr, func_id);
  7419		if (err)
  7420			return err;
  7421	
  7422		if ((func_id == BPF_FUNC_get_stack ||
  7423		     func_id == BPF_FUNC_get_task_stack) &&
  7424		    !env->prog->has_callchain_buf) {
  7425			const char *err_str;
  7426	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
