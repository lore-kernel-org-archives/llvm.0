Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA7F1F5E6;
	Wed, 24 Apr 2024 04:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713931801; cv=none; b=UOoc15IY90YFwH2I2Xpln5+3f1XmHLR1Z+ofl33cQSUDrwyiLRGXLYSMA7wfsD2+klTDI9QXShF7CTqqAwaHEvw0fHn11uqh5ky/q6BZxyoAfAfcQnQSvUxMBYaPDXg7Suz8FSHOtahRsWnlN770YqWHUs3SkNCVPhVa33MFbx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713931801; c=relaxed/simple;
	bh=oyd/enotYtq58AEjmjGTsRumDDWbIaXPxVvzysfMTZw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kzA1TAa+zMB58c1Ii7w6v+2S650RnJQYtAWzGe+3jOAarUpdtopZXcg5yGX3gArXTHr7/rBgFmU15HnEP0cLjBgoYRqcaSlpY/2WTDU5yt3Q3zPPIgj/IspC5v/kBFXVlhp5GPG1FEF9LTWZnc81oUqeWa6aUn1ThVZ0F/07RkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f/Ow9sgX; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/Ow9sgX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713931799; x=1745467799;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oyd/enotYtq58AEjmjGTsRumDDWbIaXPxVvzysfMTZw=;
  b=f/Ow9sgXcshrlW/2CtReqJPUorhaIe3P+06Ei+xPeFrzGE2Ud7eUI6E7
   rv/f/diwvCCMAB+A1IGepf+u3w4JuPp9hJ56BYnAH2x0pwI54YDjK3LqJ
   LubgbQ6sWoRkXd/XiX6VZpidXhVtgJqp2Cu1DRZCDuUXWpD5l/uE2rdQY
   vqyRWeExsZ+OFWkgkTI5shC9fOvPBrHUB7Rdqwhb9jg/mVD6NLjT+6yHR
   SK8BJ4CjGvjKmGqz5/e6xr5ZHqo1TVWOreL/5g7FerhpAykmvFOhqPnVL
   FSZmLHiZxXPlwJgpnTRku4BA6zBsEY9zQAHpYz5FT8k6rbOkFcXZWkksR
   g==;
X-CSE-ConnectionGUID: GKVA5n9jT761IU/d4SFJ9Q==
X-CSE-MsgGUID: 75pa1SCIQySNXW2kjZg8jg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9662688"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="9662688"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 21:09:59 -0700
X-CSE-ConnectionGUID: ANrqot/tRsa+9KD0PF5Z3g==
X-CSE-MsgGUID: kj7gW2WGTRuoNoQl8Z4mQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="55540102"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Apr 2024 21:09:58 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzTxC-0000qW-1f;
	Wed, 24 Apr 2024 04:09:54 +0000
Date: Wed, 24 Apr 2024 12:09:23 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:arena_lock 4/6] kernel/bpf/verifier.c:19612:38: warning:
 unused variable 'new_prog'
Message-ID: <202404241142.tjyl6oGE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git arena_lock
head:   fb85e409be9065c7c625d38be4d436f83a68b016
commit: 8988284bf2a0e3930e83b40b8cf83714c186438f [4/6] bpf: Introduce bpf_lock.
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240424/202404241142.tjyl6oGE-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404241142.tjyl6oGE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404241142.tjyl6oGE-lkp@intel.com/

All warnings (new ones prefixed by >>):

          |                                        ~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~
   kernel/bpf/verifier.c:10534:42: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    10534 |                 regs[BPF_REG_0].type = PTR_TO_TCP_SOCK | ret_flag;
          |                                        ~~~~~~~~~~~~~~~ ^ ~~~~~~~~
   kernel/bpf/verifier.c:10538:37: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    10538 |                 regs[BPF_REG_0].type = PTR_TO_MEM | ret_flag;
          |                                        ~~~~~~~~~~ ^ ~~~~~~~~
   kernel/bpf/verifier.c:10560:38: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    10560 |                         regs[BPF_REG_0].type = PTR_TO_MEM | ret_flag;
          |                                                ~~~~~~~~~~ ^ ~~~~~~~~
   kernel/bpf/verifier.c:10564:42: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    10564 |                                 regs[BPF_REG_0].type = PTR_TO_BTF_ID | MEM_ALLOC | MEM_RCU;
          |                                                        ~~~~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:10572:42: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    10572 |                                 regs[BPF_REG_0].type = PTR_TO_BTF_ID | ret_flag;
          |                                                        ~~~~~~~~~~~~~ ^ ~~~~~~~~
   kernel/bpf/verifier.c:10586:40: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    10586 |                 regs[BPF_REG_0].type = PTR_TO_BTF_ID | ret_flag;
          |                                        ~~~~~~~~~~~~~ ^ ~~~~~~~~
   kernel/bpf/verifier.c:11330:21: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    11330 |         case PTR_TO_BTF_ID | MEM_ALLOC:
          |              ~~~~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:11785:36: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    11785 |                         if (reg->type == (PTR_TO_BTF_ID | MEM_ALLOC)) {
          |                                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:11790:43: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    11790 |                         } else if (reg->type == (PTR_TO_BTF_ID | MEM_ALLOC | MEM_PERCPU)) {
          |                                                  ~~~~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:11830:25: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    11830 |                                    (dynptr_arg_type & MEM_UNINIT)) {
          |                                     ~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/verifier.c:11850:26: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    11850 |                         if (!(dynptr_arg_type & MEM_UNINIT)) {
          |                               ~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/verifier.c:11877:36: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    11877 |                             reg->type != (PTR_TO_BTF_ID | MEM_ALLOC)) {
          |                                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:11881:36: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    11881 |                         if (reg->type == (PTR_TO_BTF_ID | MEM_ALLOC) && !reg->ref_obj_id) {
          |                                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:11891:36: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    11891 |                             reg->type != (PTR_TO_BTF_ID | MEM_ALLOC)) {
          |                                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:11895:36: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    11895 |                         if (reg->type == (PTR_TO_BTF_ID | MEM_ALLOC) && !reg->ref_obj_id) {
          |                                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:11904:36: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    11904 |                         if (reg->type != (PTR_TO_BTF_ID | MEM_ALLOC)) {
          |                                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:11927:37: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    11927 |                                 if (reg->type != (PTR_TO_BTF_ID | MEM_ALLOC)) {
          |                                                   ~~~~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:12172:19: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12172 |                                 if (reg->type & MEM_RCU) {
          |                                     ~~~~~~~~~ ^ ~~~~~~~
   include/linux/bpf_verifier.h:476:12: note: expanded from macro 'bpf_for_each_reg_in_vstate_mask'
     476 |                                 (void)(__expr);                          \
         |                                        ^~~~~~
   kernel/bpf/verifier.c:12172:19: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12172 |                                 if (reg->type & MEM_RCU) {
          |                                     ~~~~~~~~~ ^ ~~~~~~~
   include/linux/bpf_verifier.h:481:12: note: expanded from macro 'bpf_for_each_reg_in_vstate_mask'
     481 |                                 (void)(__expr);                          \
         |                                        ^~~~~~
   kernel/bpf/verifier.c:12336:42: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12336 |                                 regs[BPF_REG_0].type = PTR_TO_BTF_ID | MEM_ALLOC;
          |                                                        ~~~~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:12346:42: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12346 |                                 regs[BPF_REG_0].type = PTR_TO_BTF_ID | MEM_ALLOC;
          |                                                        ~~~~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:12365:42: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12365 |                                 regs[BPF_REG_0].type = PTR_TO_BTF_ID | PTR_TRUSTED;
          |                                                        ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   kernel/bpf/verifier.c:12377:42: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12377 |                                 regs[BPF_REG_0].type = PTR_TO_BTF_ID | PTR_UNTRUSTED;
          |                                                        ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
   kernel/bpf/verifier.c:12394:39: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12394 |                                 regs[BPF_REG_0].type = PTR_TO_MEM | type_flag;
          |                                                        ~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:12954:20: warning: bitwise operation between different enumeration types ('const enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12954 |         if (ptr_reg->type & PTR_MAYBE_NULL) {
          |             ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:17576:31: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    17576 |                         *prev_type = PTR_TO_BTF_ID | PTR_UNTRUSTED;
          |                                      ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
   kernel/bpf/verifier.c:18034:38: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    18034 |                 aux->btf_var.reg_type = PTR_TO_MEM | MEM_RDONLY;
          |                                         ~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/verifier.c:18053:41: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    18053 |                 aux->btf_var.reg_type = PTR_TO_BTF_ID | MEM_PERCPU;
          |                                         ~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/verifier.c:18070:38: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    18070 |                 aux->btf_var.reg_type = PTR_TO_MEM | MEM_RDONLY;
          |                                         ~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/verifier.c:19013:22: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    19013 |                 case PTR_TO_BTF_ID | PTR_UNTRUSTED:
          |                      ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
   kernel/bpf/verifier.c:19020:22: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    19020 |                 case PTR_TO_BTF_ID | MEM_ALLOC | PTR_UNTRUSTED:
          |                      ~~~~~~~~~~~~~ ^ ~~~~~~~~~
>> kernel/bpf/verifier.c:19612:38: warning: unused variable 'new_prog' [-Wunused-variable]
    19612 |         struct bpf_prog *prog = env->prog, *new_prog;
          |                                             ^~~~~~~~
>> kernel/bpf/verifier.c:19616:18: warning: unused variable 'insn_buf' [-Wunused-variable]
    19616 |         struct bpf_insn insn_buf[32];
          |                         ^~~~~~~~
>> kernel/bpf/verifier.c:19617:9: warning: unused variable 'cnt' [-Wunused-variable]
    19617 |         int i, cnt, delta = 0;
          |                ^~~
>> kernel/bpf/verifier.c:19617:14: warning: unused variable 'delta' [-Wunused-variable]
    19617 |         int i, cnt, delta = 0;
          |                     ^~~~~
   kernel/bpf/verifier.c:20720:51: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    20720 |                         } else if (arg->arg_type == (ARG_PTR_TO_DYNPTR | MEM_RDONLY)) {
          |                                                      ~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/verifier.c:20725:23: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    20725 |                                 if (arg->arg_type & PTR_MAYBE_NULL)
          |                                     ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:20732:23: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    20732 |                                 if (arg->arg_type & PTR_MAYBE_NULL)
          |                                     ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:20734:23: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    20734 |                                 if (arg->arg_type & PTR_UNTRUSTED)
          |                                     ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
   kernel/bpf/verifier.c:20736:23: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    20736 |                                 if (arg->arg_type & PTR_TRUSTED)
          |                                     ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   103 warnings generated.


vim +/new_prog +19612 kernel/bpf/verifier.c

 19609	
 19610	static int do_lock_fixups(struct bpf_verifier_env *env)
 19611	{
 19612		struct bpf_prog *prog = env->prog, *new_prog;
 19613		struct bpf_insn *insn = prog->insnsi;
 19614		const struct bpf_kfunc_desc *desc;
 19615		const int insn_cnt = prog->len;
 19616		struct bpf_insn insn_buf[32];
 19617		int i, cnt, delta = 0;
 19618	
 19619		for (i = 0; i < insn_cnt;) {
 19620			if (insn->code != (BPF_JMP | BPF_CALL))
 19621				goto next_insn;
 19622			if (insn->src_reg == BPF_PSEUDO_CALL)
 19623				goto next_insn;
 19624			if (insn->src_reg != BPF_PSEUDO_KFUNC_CALL)
 19625				goto next_insn;
 19626	
 19627			if (!insn->imm) {
 19628				verbose(env, "invalid kernel function call not eliminated in verifier pass\n");
 19629				return -EINVAL;
 19630			}
 19631	
 19632			desc = find_kfunc_desc(env->prog, insn->imm, insn->off);
 19633			if (!desc) {
 19634				verbose(env, "verifier internal error: kernel function descriptor not found for func_id %u\n",
 19635					insn->imm);
 19636				return -EFAULT;
 19637			}
 19638	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
