Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7CF373BF5;
	Tue, 17 Mar 2026 10:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773744960; cv=none; b=uk4b3UrWxYyFd2wAu/47K8d3PcZf1KjbN26nqApC6pj5Ffdy3L3KzaChX2Jhl8M3qwrJCqGz/Keylh368yCgi+acFA+cc45NL2BEeF76GDg9Ub+8t6T1plWWnBBlyXL8qHeTgAdFXSqELd1BN641tpHY8QtwXHmBr5KrB/iCYcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773744960; c=relaxed/simple;
	bh=EDvSeByYOLl2MUUcEfRd5YPOReBce8qffcQSiklMDt4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cY0aniFGJCgr3xE+8yw7hmgtp/q++y7Tzme0UfPR7kyAqN5H27Rq6X1g9Exa8NfoeM7ZmhUKhD5dA2CNpaMEecsa6c8PIQA9zi0XB30quHAtrKgQSneVTfsrRhL+xrx1u5ZabPPfWNI2dTmRDTVJ9JijbozvrDAgWD1nbbN1m7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lzmly6v6; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lzmly6v6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773744959; x=1805280959;
  h=date:from:to:cc:subject:message-id;
  bh=EDvSeByYOLl2MUUcEfRd5YPOReBce8qffcQSiklMDt4=;
  b=Lzmly6v6OYgKmt2Xtqhx9SLJRhDwlxig2ihceeDj1y5xlUNzYb3gJKqd
   Q48Ms2Qv3TMGgxsX92Npp52Tw2ksOkmCQWVpDtZR2i+E53Y6DeaSKKWHI
   KxKMicdcn7z7qrzQRRjMneG0J7HSfv6nhYkdgCt3WSAsnKtjm1REU1iz0
   F+8djuY/OcoIMI6zhP/pAcuEkFVV8j8Gso0oWkRBTZ36hKdaMvsEOCdGx
   i53bitFNbsVrQPTCsauh7E4p7tB+Eo9gGLa8gYfWv+kaV2dikmNDY8m0a
   Tge4f6sL8ynWxtKbRq4+X7ztJIaoy9XFRlkVfc5+hj1m9dk2qxSF/BHHT
   Q==;
X-CSE-ConnectionGUID: +5Yyk5FuRCOX1J+NCrosMA==
X-CSE-MsgGUID: zFQNVQNgQpuwzrNFS/uTEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="73791746"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="73791746"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 03:55:48 -0700
X-CSE-ConnectionGUID: dlsAN+1CTOOmPoe/KDuzQQ==
X-CSE-MsgGUID: zSMfYxDLR8mUQzZBuKZ7NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="222459728"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Mar 2026 03:55:46 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2S5P-000000000HD-3N14;
	Tue, 17 Mar 2026 10:55:43 +0000
Date: Tue, 17 Mar 2026 18:55:02 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:stacklive 12/22] kernel/bpf/liveness.c:2302:5:
 warning: stack frame size (1464) exceeds limit (1280) in
 'compute_subprog_arg_access'
Message-ID: <202603171840.EMoRjsHz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git stacklive
head:   f4d911f1115995504320e415e04768858065221b
commit: d9d806381e9caf5be8c404e90b7997fd39bacf63 [12/22] bpf: Add per-subprog arg tracking analysis
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260317/202603171840.EMoRjsHz-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603171840.EMoRjsHz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603171840.EMoRjsHz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/liveness.c:2302:5: warning: stack frame size (1464) exceeds limit (1280) in 'compute_subprog_arg_access' [-Wframe-larger-than]
    2302 | int compute_subprog_arg_access(struct bpf_verifier_env *env,
         |     ^
   1 warning generated.


vim +/compute_subprog_arg_access +2302 kernel/bpf/liveness.c

  2244	
  2245	/*
  2246	 * Backward pass: compute per-instruction argument read liveness.
  2247	 * arg_live[i][arg] = union of arg_use[j][arg] for all j reachable from i.
  2248	 * No def-kills: conservative (reads through written slots stay live).
  2249	 *
  2250	 * For nested calls (subprog0 -> subprog1 -> subprog2), this works
  2251	 * transitively: the forward pass folds inner callee reads into arg_use
  2252	 * at each BPF-to-BPF call instruction, so arg_live for subprog1 already
  2253	 * includes reads that subprog2 makes through subprog1's arguments.
  2254	 * clean_verifier_state() only needs to consult the immediate child's
  2255	 * arg_live to get correct liveness for any call depth.
  2256	 */
  2257	static int compute_arg_live(struct bpf_verifier_env *env,
  2258				    int subprog, int start, int len,
  2259				    struct subprog_arg_access *access,
  2260				    u64 (*arg_use)[NUM_AT_IDS][2])
  2261	{
  2262		int po_start = env->subprog_info[subprog].postorder_start;
  2263		int po_end = env->subprog_info[subprog + 1].postorder_start;
  2264		bool changed = true;
  2265	
  2266		access->subprog_len = len;
  2267		access->arg_live = kvzalloc_objs(*access->arg_live, len, GFP_KERNEL_ACCOUNT);
  2268		if (!access->arg_live)
  2269			return -ENOMEM;
  2270	
  2271		while (changed) {
  2272			changed = false;
  2273			for (int p = po_start; p < po_end; p++) {
  2274				int insn_idx = env->cfg.insn_postorder[p];
  2275				int li = insn_idx - start;
  2276				struct bpf_iarray *succ;
  2277				u64 new_live[NUM_AT_IDS][2] = {};
  2278				int a;
  2279	
  2280				succ = bpf_insn_successors(env, insn_idx);
  2281				for (int s = 0; s < succ->cnt; s++) {
  2282					int target = succ->items[s];
  2283	
  2284					if (target < start || target >= start + len)
  2285						continue;
  2286					for (a = 0; a < NUM_AT_IDS; a++)
  2287						spis_or(new_live[a], access->arg_live[target - start][a]);
  2288				}
  2289				for (a = 0; a < NUM_AT_IDS; a++)
  2290					spis_or(new_live[a], arg_use[li][a]);
  2291	
  2292				for (a = 0; a < NUM_AT_IDS; a++) {
  2293					if (!spis_equal(new_live[a], access->arg_live[li][a])) {
  2294						spis_copy(access->arg_live[li][a], new_live[a]);
  2295						changed = true;
  2296					}
  2297				}
  2298			}
  2299		}
  2300		return 0;
  2301	}
> 2302	int compute_subprog_arg_access(struct bpf_verifier_env *env,
  2303				       struct insn_live_regs *state)
  2304	{
  2305		struct bpf_insn *insns = env->prog->insnsi;
  2306		struct subprog_at_info *info;
  2307		int k, err = 0;
  2308	
  2309		env->subprog_arg_access = kvcalloc(env->subprog_cnt,
  2310						   sizeof(*env->subprog_arg_access),
  2311						   GFP_KERNEL_ACCOUNT);
  2312		if (!env->subprog_arg_access)
  2313			return -ENOMEM;
  2314	
  2315		info = kvcalloc(env->subprog_cnt, sizeof(*info), GFP_KERNEL_ACCOUNT);
  2316		if (!info)
  2317			return -ENOMEM;
  2318	
  2319		/*
  2320		 * Process subprogs in topological order (leaves first).
  2321		 * Each subprog gets: arg tracking, callee folding, arg liveness.
  2322		 * Subprog 0 needs stack tracking but not arg liveness.
  2323		 */
  2324		for (k = 0; k < env->subprog_cnt; k++) {
  2325			int i = env->subprog_topo_order[k];
  2326			struct subprog_arg_access *access;
  2327	
  2328			access = &env->subprog_arg_access[i];
  2329			err = compute_subprog_arg_tracking(env, insns, i,
  2330							   access, &info[i],
  2331							   state);
  2332			if (err)
  2333				goto err_free;
  2334	
  2335			if (i > 0) {
  2336				fold_callee_accesses_for_subprog(env, insns, i,
  2337								 access,
  2338								 &info[i]);
  2339			}
  2340	
  2341			if (i > 0) {
  2342				int start = env->subprog_info[i].start;
  2343	
  2344				err = compute_arg_live(env, i, start,
  2345						       info[i].len, access,
  2346						       info[i].arg_use);
  2347				if (err)
  2348					goto err_free;
  2349			}
  2350		}
  2351	
  2352	err_free:
  2353		for (k = 0; k < env->subprog_cnt; k++) {
  2354			kvfree(info[k].at_in);
  2355			kvfree(info[k].arg_use);
  2356		}
  2357		kvfree(info);
  2358		return err;
  2359	}
  2360	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
