Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8112C80
	for <llvm@lists.linux.dev>; Tue, 30 Nov 2021 03:41:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="299530678"
X-IronPort-AV: E=Sophos;i="5.87,275,1631602800"; 
   d="scan'208";a="299530678"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2021 19:41:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,275,1631602800"; 
   d="scan'208";a="499595521"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 29 Nov 2021 19:41:28 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mru1H-000ChI-J6; Tue, 30 Nov 2021 03:41:27 +0000
Date: Tue, 30 Nov 2021 11:40:43 +0800
From: kernel test robot <lkp@intel.com>
To: Hao Luo <haoluo@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH bpf-next v2 3/9] bpf: Replace RET_XXX_OR_NULL with
 RET_XXX | PTR_MAYBE_NULL
Message-ID: <202111301101.rEYY4B1t-lkp@intel.com>
References: <20211130012948.380602-4-haoluo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211130012948.380602-4-haoluo@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Hao,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Hao-Luo/Introduce-composable-bpf-types/20211130-093143
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
config: arm-buildonly-randconfig-r005-20211128 (https://download.01.org/0day-ci/archive/20211130/202111301101.rEYY4B1t-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 25eb7fa01d7ebbe67648ea03841cda55b4239ab2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/5af019e76ba5485e0b56b5b4607c9d2e30ca6138
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Hao-Luo/Introduce-composable-bpf-types/20211130-093143
        git checkout 5af019e76ba5485e0b56b5b4607c9d2e30ca6138
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/bpf/verifier.c:6598:5: warning: format specifies type 'int' but the argument has type 'unsigned long' [-Wformat]
                                   BPF_BASE_TYPE(ret_type), func_id_name(func_id),
                                   ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:326:26: note: expanded from macro 'BPF_BASE_TYPE'
   #define BPF_BASE_TYPE(x)        ((x) & BPF_BASE_TYPE_MASK)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:6609:4: warning: format specifies type 'int' but the argument has type 'unsigned long' [-Wformat]
                           BPF_BASE_TYPE(ret_type), func_id_name(func_id), func_id);
                           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:326:26: note: expanded from macro 'BPF_BASE_TYPE'
   #define BPF_BASE_TYPE(x)        ((x) & BPF_BASE_TYPE_MASK)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +6598 kernel/bpf/verifier.c

  6373	
  6374	static int check_helper_call(struct bpf_verifier_env *env, struct bpf_insn *insn,
  6375				     int *insn_idx_p)
  6376	{
  6377		const struct bpf_func_proto *fn = NULL;
  6378		enum bpf_return_type ret_type;
  6379		struct bpf_reg_state *regs;
  6380		struct bpf_call_arg_meta meta;
  6381		int insn_idx = *insn_idx_p;
  6382		bool changes_data;
  6383		int i, err, func_id;
  6384	
  6385		/* find function prototype */
  6386		func_id = insn->imm;
  6387		if (func_id < 0 || func_id >= __BPF_FUNC_MAX_ID) {
  6388			verbose(env, "invalid func %s#%d\n", func_id_name(func_id),
  6389				func_id);
  6390			return -EINVAL;
  6391		}
  6392	
  6393		if (env->ops->get_func_proto)
  6394			fn = env->ops->get_func_proto(func_id, env->prog);
  6395		if (!fn) {
  6396			verbose(env, "unknown func %s#%d\n", func_id_name(func_id),
  6397				func_id);
  6398			return -EINVAL;
  6399		}
  6400	
  6401		/* eBPF programs must be GPL compatible to use GPL-ed functions */
  6402		if (!env->prog->gpl_compatible && fn->gpl_only) {
  6403			verbose(env, "cannot call GPL-restricted function from non-GPL compatible program\n");
  6404			return -EINVAL;
  6405		}
  6406	
  6407		if (fn->allowed && !fn->allowed(env->prog)) {
  6408			verbose(env, "helper call is not allowed in probe\n");
  6409			return -EINVAL;
  6410		}
  6411	
  6412		/* With LD_ABS/IND some JITs save/restore skb from r1. */
  6413		changes_data = bpf_helper_changes_pkt_data(fn->func);
  6414		if (changes_data && fn->arg1_type != ARG_PTR_TO_CTX) {
  6415			verbose(env, "kernel subsystem misconfigured func %s#%d: r1 != ctx\n",
  6416				func_id_name(func_id), func_id);
  6417			return -EINVAL;
  6418		}
  6419	
  6420		memset(&meta, 0, sizeof(meta));
  6421		meta.pkt_access = fn->pkt_access;
  6422	
  6423		err = check_func_proto(fn, func_id);
  6424		if (err) {
  6425			verbose(env, "kernel subsystem misconfigured func %s#%d\n",
  6426				func_id_name(func_id), func_id);
  6427			return err;
  6428		}
  6429	
  6430		meta.func_id = func_id;
  6431		/* check args */
  6432		for (i = 0; i < MAX_BPF_FUNC_REG_ARGS; i++) {
  6433			err = check_func_arg(env, i, &meta, fn);
  6434			if (err)
  6435				return err;
  6436		}
  6437	
  6438		err = record_func_map(env, &meta, func_id, insn_idx);
  6439		if (err)
  6440			return err;
  6441	
  6442		err = record_func_key(env, &meta, func_id, insn_idx);
  6443		if (err)
  6444			return err;
  6445	
  6446		/* Mark slots with STACK_MISC in case of raw mode, stack offset
  6447		 * is inferred from register state.
  6448		 */
  6449		for (i = 0; i < meta.access_size; i++) {
  6450			err = check_mem_access(env, insn_idx, meta.regno, i, BPF_B,
  6451					       BPF_WRITE, -1, false);
  6452			if (err)
  6453				return err;
  6454		}
  6455	
  6456		if (func_id == BPF_FUNC_tail_call) {
  6457			err = check_reference_leak(env);
  6458			if (err) {
  6459				verbose(env, "tail_call would lead to reference leak\n");
  6460				return err;
  6461			}
  6462		} else if (is_release_function(func_id)) {
  6463			err = release_reference(env, meta.ref_obj_id);
  6464			if (err) {
  6465				verbose(env, "func %s#%d reference has not been acquired before\n",
  6466					func_id_name(func_id), func_id);
  6467				return err;
  6468			}
  6469		}
  6470	
  6471		regs = cur_regs(env);
  6472	
  6473		/* check that flags argument in get_local_storage(map, flags) is 0,
  6474		 * this is required because get_local_storage() can't return an error.
  6475		 */
  6476		if (func_id == BPF_FUNC_get_local_storage &&
  6477		    !register_is_null(&regs[BPF_REG_2])) {
  6478			verbose(env, "get_local_storage() doesn't support non-zero flags\n");
  6479			return -EINVAL;
  6480		}
  6481	
  6482		if (func_id == BPF_FUNC_for_each_map_elem) {
  6483			err = __check_func_call(env, insn, insn_idx_p, meta.subprogno,
  6484						set_map_elem_callback_state);
  6485			if (err < 0)
  6486				return -EINVAL;
  6487		}
  6488	
  6489		if (func_id == BPF_FUNC_timer_set_callback) {
  6490			err = __check_func_call(env, insn, insn_idx_p, meta.subprogno,
  6491						set_timer_callback_state);
  6492			if (err < 0)
  6493				return -EINVAL;
  6494		}
  6495	
  6496		if (func_id == BPF_FUNC_find_vma) {
  6497			err = __check_func_call(env, insn, insn_idx_p, meta.subprogno,
  6498						set_find_vma_callback_state);
  6499			if (err < 0)
  6500				return -EINVAL;
  6501		}
  6502	
  6503		if (func_id == BPF_FUNC_snprintf) {
  6504			err = check_bpf_snprintf_call(env, regs);
  6505			if (err < 0)
  6506				return err;
  6507		}
  6508	
  6509		/* reset caller saved regs */
  6510		for (i = 0; i < CALLER_SAVED_REGS; i++) {
  6511			mark_reg_not_init(env, regs, caller_saved[i]);
  6512			check_reg_arg(env, caller_saved[i], DST_OP_NO_MARK);
  6513		}
  6514	
  6515		/* helper call returns 64-bit value. */
  6516		regs[BPF_REG_0].subreg_def = DEF_NOT_SUBREG;
  6517	
  6518		/* update return register (already marked as written above) */
  6519		ret_type = fn->ret_type;
  6520		if (ret_type == RET_INTEGER) {
  6521			/* sets type to SCALAR_VALUE */
  6522			mark_reg_unknown(env, regs, BPF_REG_0);
  6523		} else if (ret_type == RET_VOID) {
  6524			regs[BPF_REG_0].type = NOT_INIT;
  6525		} else if (BPF_BASE_TYPE(ret_type) == RET_PTR_TO_MAP_VALUE) {
  6526			/* There is no offset yet applied, variable or fixed */
  6527			mark_reg_known_zero(env, regs, BPF_REG_0);
  6528			/* remember map_ptr, so that check_map_access()
  6529			 * can check 'value_size' boundary of memory access
  6530			 * to map element returned from bpf_map_lookup_elem()
  6531			 */
  6532			if (meta.map_ptr == NULL) {
  6533				verbose(env,
  6534					"kernel subsystem misconfigured verifier\n");
  6535				return -EINVAL;
  6536			}
  6537			regs[BPF_REG_0].map_ptr = meta.map_ptr;
  6538			regs[BPF_REG_0].map_uid = meta.map_uid;
  6539			if (ret_type_may_be_null(fn->ret_type)) {
  6540				regs[BPF_REG_0].type = PTR_TO_MAP_VALUE_OR_NULL;
  6541			} else {
  6542				regs[BPF_REG_0].type = PTR_TO_MAP_VALUE;
  6543				if (map_value_has_spin_lock(meta.map_ptr))
  6544					regs[BPF_REG_0].id = ++env->id_gen;
  6545			}
  6546		} else if (BPF_BASE_TYPE(ret_type) == RET_PTR_TO_SOCKET) {
  6547			mark_reg_known_zero(env, regs, BPF_REG_0);
  6548			regs[BPF_REG_0].type = PTR_TO_SOCKET_OR_NULL;
  6549		} else if (BPF_BASE_TYPE(ret_type) == RET_PTR_TO_SOCK_COMMON) {
  6550			mark_reg_known_zero(env, regs, BPF_REG_0);
  6551			regs[BPF_REG_0].type = PTR_TO_SOCK_COMMON_OR_NULL;
  6552		} else if (BPF_BASE_TYPE(ret_type) == RET_PTR_TO_TCP_SOCK) {
  6553			mark_reg_known_zero(env, regs, BPF_REG_0);
  6554			regs[BPF_REG_0].type = PTR_TO_TCP_SOCK_OR_NULL;
  6555		} else if (BPF_BASE_TYPE(ret_type) == RET_PTR_TO_ALLOC_MEM) {
  6556			mark_reg_known_zero(env, regs, BPF_REG_0);
  6557			regs[BPF_REG_0].type = PTR_TO_MEM_OR_NULL;
  6558			regs[BPF_REG_0].mem_size = meta.mem_size;
  6559		} else if (BPF_BASE_TYPE(ret_type) == RET_PTR_TO_MEM_OR_BTF_ID) {
  6560			const struct btf_type *t;
  6561	
  6562			mark_reg_known_zero(env, regs, BPF_REG_0);
  6563			t = btf_type_skip_modifiers(meta.ret_btf, meta.ret_btf_id, NULL);
  6564			if (!btf_type_is_struct(t)) {
  6565				u32 tsize;
  6566				const struct btf_type *ret;
  6567				const char *tname;
  6568	
  6569				/* resolve the type size of ksym. */
  6570				ret = btf_resolve_size(meta.ret_btf, t, &tsize);
  6571				if (IS_ERR(ret)) {
  6572					tname = btf_name_by_offset(meta.ret_btf, t->name_off);
  6573					verbose(env, "unable to resolve the size of type '%s': %ld\n",
  6574						tname, PTR_ERR(ret));
  6575					return -EINVAL;
  6576				}
  6577				regs[BPF_REG_0].type =
  6578					(ret_type & PTR_MAYBE_NULL) ?
  6579					PTR_TO_MEM_OR_NULL : PTR_TO_MEM;
  6580				regs[BPF_REG_0].mem_size = tsize;
  6581			} else {
  6582				regs[BPF_REG_0].type =
  6583					(ret_type & PTR_MAYBE_NULL) ?
  6584					PTR_TO_BTF_ID_OR_NULL : PTR_TO_BTF_ID;
  6585				regs[BPF_REG_0].btf = meta.ret_btf;
  6586				regs[BPF_REG_0].btf_id = meta.ret_btf_id;
  6587			}
  6588		} else if (BPF_BASE_TYPE(ret_type) == RET_PTR_TO_BTF_ID) {
  6589			int ret_btf_id;
  6590	
  6591			mark_reg_known_zero(env, regs, BPF_REG_0);
  6592			regs[BPF_REG_0].type = (ret_type & PTR_MAYBE_NULL) ?
  6593							     PTR_TO_BTF_ID_OR_NULL :
  6594							     PTR_TO_BTF_ID;
  6595			ret_btf_id = *fn->ret_btf_id;
  6596			if (ret_btf_id == 0) {
  6597				verbose(env, "invalid return type %d of func %s#%d\n",
> 6598					BPF_BASE_TYPE(ret_type), func_id_name(func_id),
  6599					func_id);
  6600				return -EINVAL;
  6601			}
  6602			/* current BPF helper definitions are only coming from
  6603			 * built-in code with type IDs from  vmlinux BTF
  6604			 */
  6605			regs[BPF_REG_0].btf = btf_vmlinux;
  6606			regs[BPF_REG_0].btf_id = ret_btf_id;
  6607		} else {
  6608			verbose(env, "unknown return type %d of func %s#%d\n",
  6609				BPF_BASE_TYPE(ret_type), func_id_name(func_id), func_id);
  6610			return -EINVAL;
  6611		}
  6612	
  6613		if (reg_type_may_be_null(regs[BPF_REG_0].type))
  6614			regs[BPF_REG_0].id = ++env->id_gen;
  6615	
  6616		if (is_ptr_cast_function(func_id)) {
  6617			/* For release_reference() */
  6618			regs[BPF_REG_0].ref_obj_id = meta.ref_obj_id;
  6619		} else if (is_acquire_function(func_id, meta.map_ptr)) {
  6620			int id = acquire_reference_state(env, insn_idx);
  6621	
  6622			if (id < 0)
  6623				return id;
  6624			/* For mark_ptr_or_null_reg() */
  6625			regs[BPF_REG_0].id = id;
  6626			/* For release_reference() */
  6627			regs[BPF_REG_0].ref_obj_id = id;
  6628		}
  6629	
  6630		do_refine_retval_range(regs, fn->ret_type, func_id, &meta);
  6631	
  6632		err = check_map_func_compatibility(env, meta.map_ptr, func_id);
  6633		if (err)
  6634			return err;
  6635	
  6636		if ((func_id == BPF_FUNC_get_stack ||
  6637		     func_id == BPF_FUNC_get_task_stack) &&
  6638		    !env->prog->has_callchain_buf) {
  6639			const char *err_str;
  6640	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
