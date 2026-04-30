Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBE136D9EC;
	Thu, 30 Apr 2026 06:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777529461; cv=none; b=Tb8FhCBzIU2esxHeMVcBxtuzmo3Kn8ABbp07inK1P2L31dFJT6pXD5w5w56dY1qEdTEG+GTrMKwzA9aCpgNDGOWZCFp/lageXe6Xt6wxUyD45baBdlF5TJiTPzZ36W+8tWwcVn6g72eZMp7PCgxju+eS+ZTTG5qKFSXQrQVv3/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777529461; c=relaxed/simple;
	bh=oWa8nANo/peKAap4g9yB0f1fumudA8QEBuOkf9kC5is=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YiNVtqk+stoZgYVsvy5duxyNf4gyNHKs5xdj4ZZcwZPHr1OuG3OU4B1JqybBDSH+rhdrFXz0fMhFfiJRg4YHD+lUsm4UKcC/HIrkL5bHcQHBul8KpTstKmLQBri+fN0r45T8fFDo9zuZ/sdF01B68JK676TtoKcxzIEfMBSUrqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UzjMV8lL; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UzjMV8lL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777529458; x=1809065458;
  h=date:from:to:cc:subject:message-id;
  bh=oWa8nANo/peKAap4g9yB0f1fumudA8QEBuOkf9kC5is=;
  b=UzjMV8lLOt8aGnlrSD9nqpcFURjsCo6RlyDlpEVOisRxRwJPFOEaqxp3
   sV8I0KDzJgvjTe+EJ+HJhzFW8BkKxahJ+z/ruic86hXrIzKWNMalquANk
   1e1yqIO7VXNlMSNO8+XUvsFuUPZ/n2xX7LrqoGdwfYv+SEVpHiVbT1Qgo
   27q3ktVoRdxNq1PcotIZBdjDi7GpTODIVWjS/vRK/Mnfrs40uFbiBL0lY
   WTKH48nJ8yY++zcCsZ3eOsXHaCiFCyFZjNXN88I+eTm5C5LwvmCXGs5Ka
   +b3RaBYlhezijF85XwIPK1asJUA0+GAGfmKek67JYcN/9hi0IMF2WA0f7
   Q==;
X-CSE-ConnectionGUID: 7JJAOGu1RA+ESD30fLbG0w==
X-CSE-MsgGUID: oMmhblC+R8G696b4zQYX+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89564623"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="89564623"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 23:10:49 -0700
X-CSE-ConnectionGUID: JVbkbidqR4ClcDKRnCuc1Q==
X-CSE-MsgGUID: c/e1E8PVSTGY8IQary2+ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="227986589"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Apr 2026 23:10:48 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIKbl-00000000C1Q-3eHS;
	Thu, 30 Apr 2026 06:10:45 +0000
Date: Thu, 30 Apr 2026 14:09:59 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:rust-bpf 11/14] kernel/bpf/verifier.c:6406:4:
 warning: label at end of compound statement is a C23 extension
Message-ID: <202604301421.aKta0WBk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git rust-bpf
head:   1623628cc9588b205a0e913c5e62d267ef0f6d70
commit: a0384236cb3e082d9b29da494e71db6275aef526 [11/14] bpf: Recognize func pointers in vtables
config: um-randconfig-001-20260430 (https://download.01.org/0day-ci/archive/20260430/202604301421.aKta0WBk-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301421.aKta0WBk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301421.aKta0WBk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/verifier.c:6406:4: warning: label at end of compound statement is a C23 extension [-Wc23-extensions]
    6406 |                         } else if (map->map_type == BPF_MAP_TYPE_INSN_ARRAY) {
         |                         ^
   1 warning generated.


vim +6406 kernel/bpf/verifier.c

43cd9d9520e662 Anton Protopopov        2026-04-06  6312  
17a5267067f3c3 Alexei Starovoitov      2014-09-26  6313  /* check whether memory at (regno + off) is accessible for t = (read | write)
17a5267067f3c3 Alexei Starovoitov      2014-09-26  6314   * if t==write, value_regno is a register which value is stored into memory
17a5267067f3c3 Alexei Starovoitov      2014-09-26  6315   * if t==read, value_regno is a register which will receive the value from memory
17a5267067f3c3 Alexei Starovoitov      2014-09-26  6316   * if t==write && value_regno==-1, some unknown value is stored into memory
17a5267067f3c3 Alexei Starovoitov      2014-09-26  6317   * if t==read && value_regno==-1, don't care what we read from memory
17a5267067f3c3 Alexei Starovoitov      2014-09-26  6318   */
ca36960211eb22 Daniel Borkmann         2018-02-23  6319  static int check_mem_access(struct bpf_verifier_env *env, int insn_idx, u32 regno,
ca36960211eb22 Daniel Borkmann         2018-02-23  6320  			    int off, int bpf_size, enum bpf_access_type t,
1f9a1ea821ff25 Yonghong Song           2023-07-27  6321  			    int value_regno, bool strict_alignment_once, bool is_ldsx)
17a5267067f3c3 Alexei Starovoitov      2014-09-26  6322  {
638f5b90d46016 Alexei Starovoitov      2017-10-31  6323  	struct bpf_reg_state *regs = cur_regs(env);
638f5b90d46016 Alexei Starovoitov      2017-10-31  6324  	struct bpf_reg_state *reg = regs + regno;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  6325  	int size, err = 0;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  6326  
17a5267067f3c3 Alexei Starovoitov      2014-09-26  6327  	size = bpf_size_to_bytes(bpf_size);
17a5267067f3c3 Alexei Starovoitov      2014-09-26  6328  	if (size < 0)
17a5267067f3c3 Alexei Starovoitov      2014-09-26  6329  		return size;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  6330  
e3ea26add687ec Anton Protopopov        2025-11-28  6331  	err = check_ptr_alignment(env, reg, off, size, strict_alignment_once);
969bf05eb3cedd Alexei Starovoitov      2016-05-05  6332  	if (err)
969bf05eb3cedd Alexei Starovoitov      2016-05-05  6333  		return err;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  6334  
69c087ba6225b5 Yonghong Song           2021-02-26  6335  	if (reg->type == PTR_TO_MAP_KEY) {
69c087ba6225b5 Yonghong Song           2021-02-26  6336  		if (t == BPF_WRITE) {
69c087ba6225b5 Yonghong Song           2021-02-26  6337  			verbose(env, "write to change key R%d not allowed\n", regno);
69c087ba6225b5 Yonghong Song           2021-02-26  6338  			return -EACCES;
69c087ba6225b5 Yonghong Song           2021-02-26  6339  		}
69c087ba6225b5 Yonghong Song           2021-02-26  6340  
69c087ba6225b5 Yonghong Song           2021-02-26  6341  		err = check_mem_region_access(env, regno, off, size,
69c087ba6225b5 Yonghong Song           2021-02-26  6342  					      reg->map_ptr->key_size, false);
69c087ba6225b5 Yonghong Song           2021-02-26  6343  		if (err)
69c087ba6225b5 Yonghong Song           2021-02-26  6344  			return err;
69c087ba6225b5 Yonghong Song           2021-02-26  6345  		if (value_regno >= 0)
69c087ba6225b5 Yonghong Song           2021-02-26  6346  			mark_reg_unknown(env, regs, value_regno);
69c087ba6225b5 Yonghong Song           2021-02-26  6347  	} else if (reg->type == PTR_TO_MAP_VALUE) {
aa3496accc412b Kumar Kartikeya Dwivedi 2022-11-04  6348  		struct btf_field *kptr_field = NULL;
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6349  
1be7f75d1668d6 Alexei Starovoitov      2015-10-07  6350  		if (t == BPF_WRITE && value_regno >= 0 &&
1be7f75d1668d6 Alexei Starovoitov      2015-10-07  6351  		    is_pointer_value(env, value_regno)) {
61bd5218eef349 Jakub Kicinski          2017-10-09  6352  			verbose(env, "R%d leaks addr into map\n", value_regno);
1be7f75d1668d6 Alexei Starovoitov      2015-10-07  6353  			return -EACCES;
1be7f75d1668d6 Alexei Starovoitov      2015-10-07  6354  		}
591fe9888d7809 Daniel Borkmann         2019-04-09  6355  		err = check_map_access_type(env, regno, off, size, t);
591fe9888d7809 Daniel Borkmann         2019-04-09  6356  		if (err)
591fe9888d7809 Daniel Borkmann         2019-04-09  6357  			return err;
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6358  		err = check_map_access(env, regno, off, size, false, ACCESS_DIRECT);
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6359  		if (err)
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6360  			return err;
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6361  		if (tnum_is_const(reg->var_off))
aa3496accc412b Kumar Kartikeya Dwivedi 2022-11-04  6362  			kptr_field = btf_record_find(reg->map_ptr->record,
99dde42e37497b Kui-Feng Lee            2024-10-23  6363  						     off + reg->var_off.value, BPF_KPTR | BPF_UPTR);
aa3496accc412b Kumar Kartikeya Dwivedi 2022-11-04  6364  		if (kptr_field) {
aa3496accc412b Kumar Kartikeya Dwivedi 2022-11-04  6365  			err = check_map_kptr_access(env, regno, value_regno, insn_idx, kptr_field);
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6366  		} else if (t == BPF_READ && value_regno >= 0) {
a23740ec43ba02 Andrii Nakryiko         2019-10-09  6367  			struct bpf_map *map = reg->map_ptr;
a23740ec43ba02 Andrii Nakryiko         2019-10-09  6368  
7feff23cdf2ecd Anton Protopopov        2025-11-28  6369  			/*
7feff23cdf2ecd Anton Protopopov        2025-11-28  6370  			 * If map is read-only, track its contents as scalars,
7feff23cdf2ecd Anton Protopopov        2025-11-28  6371  			 * unless it is an insn array (see the special case below)
7feff23cdf2ecd Anton Protopopov        2025-11-28  6372  			 */
a23740ec43ba02 Andrii Nakryiko         2019-10-09  6373  			if (tnum_is_const(reg->var_off) &&
a23740ec43ba02 Andrii Nakryiko         2019-10-09  6374  			    bpf_map_is_rdonly(map) &&
7feff23cdf2ecd Anton Protopopov        2025-11-28  6375  			    map->ops->map_direct_value_addr &&
7feff23cdf2ecd Anton Protopopov        2025-11-28  6376  			    map->map_type != BPF_MAP_TYPE_INSN_ARRAY) {
a23740ec43ba02 Andrii Nakryiko         2019-10-09  6377  				int map_off = off + reg->var_off.value;
a23740ec43ba02 Andrii Nakryiko         2019-10-09  6378  				u64 val = 0;
a23740ec43ba02 Andrii Nakryiko         2019-10-09  6379  
a23740ec43ba02 Andrii Nakryiko         2019-10-09  6380  				err = bpf_map_direct_read(map, map_off, size,
1f9a1ea821ff25 Yonghong Song           2023-07-27  6381  							  &val, is_ldsx);
a23740ec43ba02 Andrii Nakryiko         2019-10-09  6382  				if (err)
a23740ec43ba02 Andrii Nakryiko         2019-10-09  6383  					return err;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  6384  
a0384236cb3e08 Alexei Starovoitov      2026-04-17  6385  				/* Check if the constant value is a known
a0384236cb3e08 Alexei Starovoitov      2026-04-17  6386  				 * subprog insn address (e.g. a vtable function
a0384236cb3e08 Alexei Starovoitov      2026-04-17  6387  				 * pointer in .data.rel.ro). If so, produce
a0384236cb3e08 Alexei Starovoitov      2026-04-17  6388  				 * PTR_TO_FUNC so callx can use it.
a0384236cb3e08 Alexei Starovoitov      2026-04-17  6389  				 */
a0384236cb3e08 Alexei Starovoitov      2026-04-17  6390  				if (size == 8 && val > 0) {
a0384236cb3e08 Alexei Starovoitov      2026-04-17  6391  					u32 insn_off = val / sizeof(struct bpf_insn);
a0384236cb3e08 Alexei Starovoitov      2026-04-17  6392  					int k;
a0384236cb3e08 Alexei Starovoitov      2026-04-17  6393  
a0384236cb3e08 Alexei Starovoitov      2026-04-17  6394  					for (k = 0; k < env->subprog_cnt; k++) {
a0384236cb3e08 Alexei Starovoitov      2026-04-17  6395  						if (env->subprog_info[k].start == insn_off) {
a0384236cb3e08 Alexei Starovoitov      2026-04-17  6396  							mark_reg_unknown(env, regs, value_regno);
a0384236cb3e08 Alexei Starovoitov      2026-04-17  6397  							regs[value_regno].type = PTR_TO_FUNC;
a0384236cb3e08 Alexei Starovoitov      2026-04-17  6398  							regs[value_regno].subprogno = k;
a0384236cb3e08 Alexei Starovoitov      2026-04-17  6399  							goto done_map_read;
a0384236cb3e08 Alexei Starovoitov      2026-04-17  6400  						}
a0384236cb3e08 Alexei Starovoitov      2026-04-17  6401  					}
a0384236cb3e08 Alexei Starovoitov      2026-04-17  6402  				}
a23740ec43ba02 Andrii Nakryiko         2019-10-09  6403  				regs[value_regno].type = SCALAR_VALUE;
a23740ec43ba02 Andrii Nakryiko         2019-10-09  6404  				__mark_reg_known(&regs[value_regno], val);
a0384236cb3e08 Alexei Starovoitov      2026-04-17  6405  done_map_read:
493d9e0d608339 Anton Protopopov        2025-11-05 @6406  			} else if (map->map_type == BPF_MAP_TYPE_INSN_ARRAY) {
493d9e0d608339 Anton Protopopov        2025-11-05  6407  				if (bpf_size != BPF_DW) {
493d9e0d608339 Anton Protopopov        2025-11-05  6408  					verbose(env, "Invalid read of %d bytes from insn_array\n",
493d9e0d608339 Anton Protopopov        2025-11-05  6409  						     size);
493d9e0d608339 Anton Protopopov        2025-11-05  6410  					return -EACCES;
493d9e0d608339 Anton Protopopov        2025-11-05  6411  				}
493d9e0d608339 Anton Protopopov        2025-11-05  6412  				copy_register_state(&regs[value_regno], reg);
43cd9d9520e662 Anton Protopopov        2026-04-06  6413  				add_scalar_to_reg(&regs[value_regno], off);
493d9e0d608339 Anton Protopopov        2025-11-05  6414  				regs[value_regno].type = PTR_TO_INSN;
a23740ec43ba02 Andrii Nakryiko         2019-10-09  6415  			} else {
a23740ec43ba02 Andrii Nakryiko         2019-10-09  6416  				mark_reg_unknown(env, regs, value_regno);
a23740ec43ba02 Andrii Nakryiko         2019-10-09  6417  			}
a23740ec43ba02 Andrii Nakryiko         2019-10-09  6418  		}
34d3a78c681e8e Hao Luo                 2021-12-16  6419  	} else if (base_type(reg->type) == PTR_TO_MEM) {
34d3a78c681e8e Hao Luo                 2021-12-16  6420  		bool rdonly_mem = type_is_rdonly_mem(reg->type);
f2362a57aefff5 Eduard Zingerman        2025-06-25  6421  		bool rdonly_untrusted = rdonly_mem && (reg->type & PTR_UNTRUSTED);
34d3a78c681e8e Hao Luo                 2021-12-16  6422  
34d3a78c681e8e Hao Luo                 2021-12-16  6423  		if (type_may_be_null(reg->type)) {
34d3a78c681e8e Hao Luo                 2021-12-16  6424  			verbose(env, "R%d invalid mem access '%s'\n", regno,
34d3a78c681e8e Hao Luo                 2021-12-16  6425  				reg_type_str(env, reg->type));
34d3a78c681e8e Hao Luo                 2021-12-16  6426  			return -EACCES;
34d3a78c681e8e Hao Luo                 2021-12-16  6427  		}
34d3a78c681e8e Hao Luo                 2021-12-16  6428  
34d3a78c681e8e Hao Luo                 2021-12-16  6429  		if (t == BPF_WRITE && rdonly_mem) {
34d3a78c681e8e Hao Luo                 2021-12-16  6430  			verbose(env, "R%d cannot write into %s\n",
34d3a78c681e8e Hao Luo                 2021-12-16  6431  				regno, reg_type_str(env, reg->type));
34d3a78c681e8e Hao Luo                 2021-12-16  6432  			return -EACCES;
34d3a78c681e8e Hao Luo                 2021-12-16  6433  		}
34d3a78c681e8e Hao Luo                 2021-12-16  6434  
457f44363a8894 Andrii Nakryiko         2020-05-29  6435  		if (t == BPF_WRITE && value_regno >= 0 &&
457f44363a8894 Andrii Nakryiko         2020-05-29  6436  		    is_pointer_value(env, value_regno)) {
457f44363a8894 Andrii Nakryiko         2020-05-29  6437  			verbose(env, "R%d leaks addr into mem\n", value_regno);
457f44363a8894 Andrii Nakryiko         2020-05-29  6438  			return -EACCES;
457f44363a8894 Andrii Nakryiko         2020-05-29  6439  		}
34d3a78c681e8e Hao Luo                 2021-12-16  6440  
f2362a57aefff5 Eduard Zingerman        2025-06-25  6441  		/*
f2362a57aefff5 Eduard Zingerman        2025-06-25  6442  		 * Accesses to untrusted PTR_TO_MEM are done through probe
f2362a57aefff5 Eduard Zingerman        2025-06-25  6443  		 * instructions, hence no need to check bounds in that case.
f2362a57aefff5 Eduard Zingerman        2025-06-25  6444  		 */
f2362a57aefff5 Eduard Zingerman        2025-06-25  6445  		if (!rdonly_untrusted)
457f44363a8894 Andrii Nakryiko         2020-05-29  6446  			err = check_mem_region_access(env, regno, off, size,
457f44363a8894 Andrii Nakryiko         2020-05-29  6447  						      reg->mem_size, false);
34d3a78c681e8e Hao Luo                 2021-12-16  6448  		if (!err && value_regno >= 0 && (t == BPF_READ || rdonly_mem))
457f44363a8894 Andrii Nakryiko         2020-05-29  6449  			mark_reg_unknown(env, regs, value_regno);
1a0dc1ac1d2928 Alexei Starovoitov      2016-05-05  6450  	} else if (reg->type == PTR_TO_CTX) {
201b62ccc83153 Amery Hung              2025-02-21  6451  		struct bpf_insn_access_aux info = {
201b62ccc83153 Amery Hung              2025-02-21  6452  			.reg_type = SCALAR_VALUE,
201b62ccc83153 Amery Hung              2025-02-21  6453  			.is_ldsx = is_ldsx,
201b62ccc83153 Amery Hung              2025-02-21  6454  			.log = &env->log,
201b62ccc83153 Amery Hung              2025-02-21  6455  		};
ae5ef001aa981e Kumar Kartikeya Dwivedi 2026-04-06  6456  		struct bpf_retval_range range;
19de99f70b87fc Alexei Starovoitov      2016-06-15  6457  
1be7f75d1668d6 Alexei Starovoitov      2015-10-07  6458  		if (t == BPF_WRITE && value_regno >= 0 &&
1be7f75d1668d6 Alexei Starovoitov      2015-10-07  6459  		    is_pointer_value(env, value_regno)) {
61bd5218eef349 Jakub Kicinski          2017-10-09  6460  			verbose(env, "R%d leaks addr into ctx\n", value_regno);
1be7f75d1668d6 Alexei Starovoitov      2015-10-07  6461  			return -EACCES;
1be7f75d1668d6 Alexei Starovoitov      2015-10-07  6462  		}
f1174f77b50c94 Edward Cree             2017-08-07  6463  
ae5ef001aa981e Kumar Kartikeya Dwivedi 2026-04-06  6464  		err = check_ctx_access(env, insn_idx, regno, off, size, t, &info);
969bf05eb3cedd Alexei Starovoitov      2016-05-05  6465  		if (!err && t == BPF_READ && value_regno >= 0) {
f1174f77b50c94 Edward Cree             2017-08-07  6466  			/* ctx access returns either a scalar, or a
de8f3a83b0a0fd Daniel Borkmann         2017-09-25  6467  			 * PTR_TO_PACKET[_META,_END]. In the latter
de8f3a83b0a0fd Daniel Borkmann         2017-09-25  6468  			 * case, we know the offset is zero.
f1174f77b50c94 Edward Cree             2017-08-07  6469  			 */
201b62ccc83153 Amery Hung              2025-02-21  6470  			if (info.reg_type == SCALAR_VALUE) {
201b62ccc83153 Amery Hung              2025-02-21  6471  				if (info.is_retval && get_func_retval_range(env->prog, &range)) {
5d99e198be2790 Xu Kuohai               2024-07-19  6472  					err = __mark_reg_s32_range(env, regs, value_regno,
5d99e198be2790 Xu Kuohai               2024-07-19  6473  								   range.minval, range.maxval);
5d99e198be2790 Xu Kuohai               2024-07-19  6474  					if (err)
5d99e198be2790 Xu Kuohai               2024-07-19  6475  						return err;
5d99e198be2790 Xu Kuohai               2024-07-19  6476  				} else {
638f5b90d46016 Alexei Starovoitov      2017-10-31  6477  					mark_reg_unknown(env, regs, value_regno);
5d99e198be2790 Xu Kuohai               2024-07-19  6478  				}
46f8bc92758c62 Martin KaFai Lau        2019-02-09  6479  			} else {
638f5b90d46016 Alexei Starovoitov      2017-10-31  6480  				mark_reg_known_zero(env, regs,
61bd5218eef349 Jakub Kicinski          2017-10-09  6481  						    value_regno);
201b62ccc83153 Amery Hung              2025-02-21  6482  				if (type_may_be_null(info.reg_type))
46f8bc92758c62 Martin KaFai Lau        2019-02-09  6483  					regs[value_regno].id = ++env->id_gen;
5327ed3d44b754 Jiong Wang              2019-05-24  6484  				/* A load of ctx field could have different
5327ed3d44b754 Jiong Wang              2019-05-24  6485  				 * actual load size with the one encoded in the
5327ed3d44b754 Jiong Wang              2019-05-24  6486  				 * insn. When the dst is PTR, it is for sure not
5327ed3d44b754 Jiong Wang              2019-05-24  6487  				 * a sub-register.
5327ed3d44b754 Jiong Wang              2019-05-24  6488  				 */
5327ed3d44b754 Jiong Wang              2019-05-24  6489  				regs[value_regno].subreg_def = DEF_NOT_SUBREG;
201b62ccc83153 Amery Hung              2025-02-21  6490  				if (base_type(info.reg_type) == PTR_TO_BTF_ID) {
201b62ccc83153 Amery Hung              2025-02-21  6491  					regs[value_regno].btf = info.btf;
201b62ccc83153 Amery Hung              2025-02-21  6492  					regs[value_regno].btf_id = info.btf_id;
201b62ccc83153 Amery Hung              2025-02-21  6493  					regs[value_regno].ref_obj_id = info.ref_obj_id;
46f8bc92758c62 Martin KaFai Lau        2019-02-09  6494  				}
22dc4a0f5ed11b Andrii Nakryiko         2020-12-03  6495  			}
201b62ccc83153 Amery Hung              2025-02-21  6496  			regs[value_regno].type = info.reg_type;
969bf05eb3cedd Alexei Starovoitov      2016-05-05  6497  		}
17a5267067f3c3 Alexei Starovoitov      2014-09-26  6498  
f1174f77b50c94 Edward Cree             2017-08-07  6499  	} else if (reg->type == PTR_TO_STACK) {
01f810ace9ed37 Andrei Matei            2021-02-06  6500  		/* Basic bounds checks. */
37cce22dbd51a3 Daniel Xu               2025-01-14  6501  		err = check_stack_access_within_bounds(env, regno, off, size, t);
e4298d25830a86 Daniel Borkmann         2019-01-03  6502  		if (err)
e4298d25830a86 Daniel Borkmann         2019-01-03  6503  			return err;
8726679a0fa317 Alexei Starovoitov      2017-05-30  6504  
01f810ace9ed37 Andrei Matei            2021-02-06  6505  		if (t == BPF_READ)
01f810ace9ed37 Andrei Matei            2021-02-06  6506  			err = check_stack_read(env, regno, off, size,
61bd5218eef349 Jakub Kicinski          2017-10-09  6507  					       value_regno);
01f810ace9ed37 Andrei Matei            2021-02-06  6508  		else
01f810ace9ed37 Andrei Matei            2021-02-06  6509  			err = check_stack_write(env, regno, off, size,
01f810ace9ed37 Andrei Matei            2021-02-06  6510  						value_regno, insn_idx);
de8f3a83b0a0fd Daniel Borkmann         2017-09-25  6511  	} else if (reg_is_pkt_pointer(reg)) {
3a0af8fd61f909 Thomas Graf             2016-11-30  6512  		if (t == BPF_WRITE && !may_access_direct_pkt_data(env, NULL, t)) {
61bd5218eef349 Jakub Kicinski          2017-10-09  6513  			verbose(env, "cannot write into packet\n");
969bf05eb3cedd Alexei Starovoitov      2016-05-05  6514  			return -EACCES;
969bf05eb3cedd Alexei Starovoitov      2016-05-05  6515  		}
4acf6c0b84c912 Brenden Blanco          2016-07-19  6516  		if (t == BPF_WRITE && value_regno >= 0 &&
4acf6c0b84c912 Brenden Blanco          2016-07-19  6517  		    is_pointer_value(env, value_regno)) {
61bd5218eef349 Jakub Kicinski          2017-10-09  6518  			verbose(env, "R%d leaks addr into packet\n",
61bd5218eef349 Jakub Kicinski          2017-10-09  6519  				value_regno);
4acf6c0b84c912 Brenden Blanco          2016-07-19  6520  			return -EACCES;
4acf6c0b84c912 Brenden Blanco          2016-07-19  6521  		}
9fd29c08e52023 Yonghong Song           2017-11-12  6522  		err = check_packet_access(env, regno, off, size, false);
969bf05eb3cedd Alexei Starovoitov      2016-05-05  6523  		if (!err && t == BPF_READ && value_regno >= 0)
638f5b90d46016 Alexei Starovoitov      2017-10-31  6524  			mark_reg_unknown(env, regs, value_regno);
d58e468b1112dc Petar Penkov            2018-09-14  6525  	} else if (reg->type == PTR_TO_FLOW_KEYS) {
d58e468b1112dc Petar Penkov            2018-09-14  6526  		if (t == BPF_WRITE && value_regno >= 0 &&
d58e468b1112dc Petar Penkov            2018-09-14  6527  		    is_pointer_value(env, value_regno)) {
d58e468b1112dc Petar Penkov            2018-09-14  6528  			verbose(env, "R%d leaks addr into flow keys\n",
d58e468b1112dc Petar Penkov            2018-09-14  6529  				value_regno);
d58e468b1112dc Petar Penkov            2018-09-14  6530  			return -EACCES;
d58e468b1112dc Petar Penkov            2018-09-14  6531  		}
d58e468b1112dc Petar Penkov            2018-09-14  6532  
d58e468b1112dc Petar Penkov            2018-09-14  6533  		err = check_flow_keys_access(env, off, size);
d58e468b1112dc Petar Penkov            2018-09-14  6534  		if (!err && t == BPF_READ && value_regno >= 0)
d58e468b1112dc Petar Penkov            2018-09-14  6535  			mark_reg_unknown(env, regs, value_regno);
46f8bc92758c62 Martin KaFai Lau        2019-02-09  6536  	} else if (type_is_sk_pointer(reg->type)) {
c64b7983288e63 Joe Stringer            2018-10-02  6537  		if (t == BPF_WRITE) {
46f8bc92758c62 Martin KaFai Lau        2019-02-09  6538  			verbose(env, "R%d cannot write into %s\n",
c25b2ae136039f Hao Luo                 2021-12-16  6539  				regno, reg_type_str(env, reg->type));
c64b7983288e63 Joe Stringer            2018-10-02  6540  			return -EACCES;
c64b7983288e63 Joe Stringer            2018-10-02  6541  		}
5f4566498dee5e Martin KaFai Lau        2019-02-08  6542  		err = check_sock_access(env, insn_idx, regno, off, size, t);
c64b7983288e63 Joe Stringer            2018-10-02  6543  		if (!err && value_regno >= 0)
c64b7983288e63 Joe Stringer            2018-10-02  6544  			mark_reg_unknown(env, regs, value_regno);
9df1c28bb75217 Matt Mullins            2019-04-26  6545  	} else if (reg->type == PTR_TO_TP_BUFFER) {
9df1c28bb75217 Matt Mullins            2019-04-26  6546  		err = check_tp_buffer_access(env, reg, regno, off, size);
9df1c28bb75217 Matt Mullins            2019-04-26  6547  		if (!err && t == BPF_READ && value_regno >= 0)
9df1c28bb75217 Matt Mullins            2019-04-26  6548  			mark_reg_unknown(env, regs, value_regno);
bff61f6faedb36 Hao Luo                 2022-03-04  6549  	} else if (base_type(reg->type) == PTR_TO_BTF_ID &&
c00d738e1673ab Kumar Kartikeya Dwivedi 2024-12-13  6550  		   !type_may_be_null(reg->type)) {
9e15db66136a14 Alexei Starovoitov      2019-10-15  6551  		err = check_ptr_to_btf_access(env, regs, regno, off, size, t,
9e15db66136a14 Alexei Starovoitov      2019-10-15  6552  					      value_regno);
41c48f3a982317 Andrey Ignatov          2020-06-19  6553  	} else if (reg->type == CONST_PTR_TO_MAP) {
41c48f3a982317 Andrey Ignatov          2020-06-19  6554  		err = check_ptr_to_map_access(env, regs, regno, off, size, t,
41c48f3a982317 Andrey Ignatov          2020-06-19  6555  					      value_regno);
b0db1accbc7395 Qi Tang                 2026-04-02  6556  	} else if (base_type(reg->type) == PTR_TO_BUF &&
b0db1accbc7395 Qi Tang                 2026-04-02  6557  		   !type_may_be_null(reg->type)) {
20b2aff4bc15bd Hao Luo                 2021-12-16  6558  		bool rdonly_mem = type_is_rdonly_mem(reg->type);
20b2aff4bc15bd Hao Luo                 2021-12-16  6559  		u32 *max_access;
20b2aff4bc15bd Hao Luo                 2021-12-16  6560  
20b2aff4bc15bd Hao Luo                 2021-12-16  6561  		if (rdonly_mem) {
afbf21dce668ef Yonghong Song           2020-07-23  6562  			if (t == BPF_WRITE) {
afbf21dce668ef Yonghong Song           2020-07-23  6563  				verbose(env, "R%d cannot write into %s\n",
c25b2ae136039f Hao Luo                 2021-12-16  6564  					regno, reg_type_str(env, reg->type));
afbf21dce668ef Yonghong Song           2020-07-23  6565  				return -EACCES;
afbf21dce668ef Yonghong Song           2020-07-23  6566  			}
20b2aff4bc15bd Hao Luo                 2021-12-16  6567  			max_access = &env->prog->aux->max_rdonly_access;
20b2aff4bc15bd Hao Luo                 2021-12-16  6568  		} else {
20b2aff4bc15bd Hao Luo                 2021-12-16  6569  			max_access = &env->prog->aux->max_rdwr_access;
20b2aff4bc15bd Hao Luo                 2021-12-16  6570  		}
20b2aff4bc15bd Hao Luo                 2021-12-16  6571  
f6dfbe31e8fa5c Colin Ian King          2020-07-27  6572  		err = check_buffer_access(env, reg, regno, off, size, false,
44e9a741cad824 Shung-Hsi Yu            2022-03-07  6573  					  max_access);
20b2aff4bc15bd Hao Luo                 2021-12-16  6574  
20b2aff4bc15bd Hao Luo                 2021-12-16  6575  		if (!err && value_regno >= 0 && (rdonly_mem || t == BPF_READ))
afbf21dce668ef Yonghong Song           2020-07-23  6576  			mark_reg_unknown(env, regs, value_regno);
6082b6c328b548 Alexei Starovoitov      2024-03-07  6577  	} else if (reg->type == PTR_TO_ARENA) {
6082b6c328b548 Alexei Starovoitov      2024-03-07  6578  		if (t == BPF_READ && value_regno >= 0)
6082b6c328b548 Alexei Starovoitov      2024-03-07  6579  			mark_reg_unknown(env, regs, value_regno);
17a5267067f3c3 Alexei Starovoitov      2014-09-26  6580  	} else {
61bd5218eef349 Jakub Kicinski          2017-10-09  6581  		verbose(env, "R%d invalid mem access '%s'\n", regno,
c25b2ae136039f Hao Luo                 2021-12-16  6582  			reg_type_str(env, reg->type));
17a5267067f3c3 Alexei Starovoitov      2014-09-26  6583  		return -EACCES;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  6584  	}
969bf05eb3cedd Alexei Starovoitov      2016-05-05  6585  
f1174f77b50c94 Edward Cree             2017-08-07  6586  	if (!err && size < BPF_REG_SIZE && value_regno >= 0 && t == BPF_READ &&
638f5b90d46016 Alexei Starovoitov      2017-10-31  6587  	    regs[value_regno].type == SCALAR_VALUE) {
1f9a1ea821ff25 Yonghong Song           2023-07-27  6588  		if (!is_ldsx)
f1174f77b50c94 Edward Cree             2017-08-07  6589  			/* b/h/w load zero-extends, mark upper bits as known 0 */
0c17d1d2c61936 Jann Horn               2017-12-18  6590  			coerce_reg_to_size(&regs[value_regno], size);
1f9a1ea821ff25 Yonghong Song           2023-07-27  6591  		else
1f9a1ea821ff25 Yonghong Song           2023-07-27  6592  			coerce_reg_to_size_sx(&regs[value_regno], size);
969bf05eb3cedd Alexei Starovoitov      2016-05-05  6593  	}
17a5267067f3c3 Alexei Starovoitov      2014-09-26  6594  	return err;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  6595  }
17a5267067f3c3 Alexei Starovoitov      2014-09-26  6596  

:::::: The code at line 6406 was first introduced by commit
:::::: 493d9e0d608339a32f568504d5fd411a261bb0af bpf, x86: add support for indirect jumps

:::::: TO: Anton Protopopov <a.s.protopopov@gmail.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
