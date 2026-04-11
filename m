Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662C7249EB;
	Sat, 11 Apr 2026 06:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775890335; cv=none; b=uLlWIPz93+yJkvTRzNd2hLUQH00HApO+cUnzhGDA9o5uuGfbMioO4e0VU+0Ndx288bHHqVB8dN9+8w0d2y9PC4YY1m7oxTd7wMwXel4mcD38zAzvwANERbhUbS0Bg/9WPekkaJvAXlmJAncX82AtKj55GwvAvMN9X96L1qSJYBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775890335; c=relaxed/simple;
	bh=+qWjHbugBv24zA7HKLWBMsllFGapYf8UHYj5Ywim0GE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AMbUYzVsENiaJULjHFnSdB03pJt690ph9te4QQFNWOd9k6IDWY+izZXYTHr//APmvEDYlLzJRrWWjvtYxAnT5pGJZqFG+IV/RqJZxaGcTMAd6yybeIr45hfEjBoYHJrNMhGbB9eQuHYzra57Mz+6u852yllCMoulVy9NgmgScuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PNOE9Wjb; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PNOE9Wjb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775890333; x=1807426333;
  h=date:from:to:cc:subject:message-id;
  bh=+qWjHbugBv24zA7HKLWBMsllFGapYf8UHYj5Ywim0GE=;
  b=PNOE9WjbsLI3RSz1IJE0Jpfv/oD8Rf1Jkxo/XmypHnrAqNv5GCCgiGBa
   5W7q6Yb5kbBiMr4uugrJiOcg7yJwvsRChMm0IxbONe7YlctXjc5p7PPwj
   w3FTiBs2/7/oQ1f9oXv+b4wj09wyBoACBhGo2VnOPGTHkMKjAIbLbAtrb
   OGP+i1hOtUsdiX3CTdzyydn9oHBY1b91SPYuRY0F7F+tACgtoGek/A/99
   zRpk/S/8JaktImr01I6DztvDADGVdM1nkoMNfI2r6bGkit0ssvNEw2Vc7
   P2rIKLUcGgDmMLoEh018zBxtKhsrbp5CvdiXAg8sk3c2a6gd1Ga0f9hTZ
   w==;
X-CSE-ConnectionGUID: cAsU2unHQUymKiTYKGZAdw==
X-CSE-MsgGUID: VEsdb5ilQ1GultoY3gUqeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="88290827"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="88290827"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 23:52:12 -0700
X-CSE-ConnectionGUID: NaY/1IapQw6D9ejxaswMWw==
X-CSE-MsgGUID: 9eVN5ktWSqGxpjhagUU3fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="233361002"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Apr 2026 23:52:11 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBSCO-000000000vp-1fUC;
	Sat, 11 Apr 2026 06:52:08 +0000
Date: Sat, 11 Apr 2026 14:52:07 +0800
From: kernel test robot <lkp@intel.com>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Alexei Starovoitov <ast@kernel.org>
Subject: [bpf-next:master 72/83] kernel/bpf/liveness.c:309:34:
 warning: variable 'cnt' set but not used
Message-ID: <202604111401.eqzyF2kx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   d6bae125f21f74201a3eab0996b2f27be3abc4bf
commit: 2c167d91775b0928eba1d2b9b5483ede63ca7b2e [72/83] bpf: change logging scheme for live stack analysis
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260411/202604111401.eqzyF2kx-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604111401.eqzyF2kx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604111401.eqzyF2kx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/liveness.c:309:34: warning: variable 'cnt' set but not used [-Wunused-but-set-variable]
     309 |         u32 i, frame, po_start, po_end, cnt;
         |                                         ^
   1 warning generated.


vim +/cnt +309 kernel/bpf/liveness.c

b3698c356ad92b Eduard Zingerman 2025-09-18  305  
6762e3a0bce5fc Eduard Zingerman 2026-04-10  306  /* Fixed-point computation of @live_before marks */
6762e3a0bce5fc Eduard Zingerman 2026-04-10  307  static void update_instance(struct bpf_verifier_env *env, struct func_instance *instance)
b3698c356ad92b Eduard Zingerman 2025-09-18  308  {
6762e3a0bce5fc Eduard Zingerman 2026-04-10 @309  	u32 i, frame, po_start, po_end, cnt;
b3698c356ad92b Eduard Zingerman 2025-09-18  310  	int *insn_postorder = env->cfg.insn_postorder;
b3698c356ad92b Eduard Zingerman 2025-09-18  311  	struct bpf_subprog_info *subprog;
b3698c356ad92b Eduard Zingerman 2025-09-18  312  	bool changed;
8d3219f64d98f4 Eduard Zingerman 2026-04-10  313  
6762e3a0bce5fc Eduard Zingerman 2026-04-10  314  	instance->must_write_initialized = true;
6762e3a0bce5fc Eduard Zingerman 2026-04-10  315  	subprog = &env->subprog_info[instance->subprog];
b3698c356ad92b Eduard Zingerman 2025-09-18  316  	po_start = subprog->postorder_start;
b3698c356ad92b Eduard Zingerman 2025-09-18  317  	po_end = (subprog + 1)->postorder_start;
b3698c356ad92b Eduard Zingerman 2025-09-18  318  	cnt = 0;
b3698c356ad92b Eduard Zingerman 2025-09-18  319  	/* repeat until fixed point is reached */
b3698c356ad92b Eduard Zingerman 2025-09-18  320  	do {
b3698c356ad92b Eduard Zingerman 2025-09-18  321  		cnt++;
b3698c356ad92b Eduard Zingerman 2025-09-18  322  		changed = false;
6762e3a0bce5fc Eduard Zingerman 2026-04-10  323  		for (frame = 0; frame <= instance->depth; frame++) {
b3698c356ad92b Eduard Zingerman 2025-09-18  324  			if (!instance->frames[frame])
b3698c356ad92b Eduard Zingerman 2025-09-18  325  				continue;
b3698c356ad92b Eduard Zingerman 2025-09-18  326  
b3698c356ad92b Eduard Zingerman 2025-09-18  327  			for (i = po_start; i < po_end; i++)
b3698c356ad92b Eduard Zingerman 2025-09-18  328  				changed |= update_insn(env, instance, frame, insn_postorder[i]);
b3698c356ad92b Eduard Zingerman 2025-09-18  329  		}
b3698c356ad92b Eduard Zingerman 2025-09-18  330  	} while (changed);
b3698c356ad92b Eduard Zingerman 2025-09-18  331  }
b3698c356ad92b Eduard Zingerman 2025-09-18  332  

:::::: The code at line 309 was first introduced by commit
:::::: 6762e3a0bce5fce94bca3c34ff13cde6a07b87f3 bpf: simplify liveness to use (callsite, depth) keyed func_instances

:::::: TO: Eduard Zingerman <eddyz87@gmail.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
