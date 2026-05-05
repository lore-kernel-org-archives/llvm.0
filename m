Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81924378D93;
	Tue,  5 May 2026 15:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777995304; cv=none; b=bEqOTJimii+DAREAw7RtmJks/xDIEUVSLGMZ0S3ksXWBRz8H5wU0Dcve4RkZkjAI4sil5mi9cWfANEIjGzIGdPe59LBpqrP6c+rdGmcnTQeLMOnO89+HymN5MdUwnyOCmmBy1no3n41d6D8dddvx4ACJHnQxBmvbcY5hSmrB9hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777995304; c=relaxed/simple;
	bh=SzaNcTtwHDYVtqcjRwA7PUwpOFY/LAUfF3pZdN8MuNA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nG+JKqfEA6Tc+VlJmjPHJ2ykkQBZHrtB9hfpZj7Id4tGFdguNN7bPLJ51vndkrRV/FCoUiH9HvCMwJjVJlsWKCgBiyz5uetER4sWNz1lw9TR25vss/LJdzEnhSVTtI762wxHe5xy5xHYLjTezmuLR8TCN6f3ZCWAC+LJp/+Ji+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k6IUyXE0; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k6IUyXE0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777995302; x=1809531302;
  h=date:from:to:cc:subject:message-id;
  bh=SzaNcTtwHDYVtqcjRwA7PUwpOFY/LAUfF3pZdN8MuNA=;
  b=k6IUyXE0a897HQdesy1r7/zYmGTyptECSMFbPXX0nFV6mc+XX5tvSjeG
   seITlcxlysrYESNkoGIWnmLL58y3wkpe8UfHbOHeotX+jQ0ICN4lSGKTh
   aRm03OjX2UKEMZo//6BtiIkoZ3udDlNFwoeRe7qg1a7sWoR24bQnABa6q
   g8Ytp/5XYMEGLDu94YX/sCmtD8+udiMs/yVM9sX0E5Y19pDTehzATdVKX
   YrXR3SZ0dv4hnVWomlZAGC44var1kQVjrYM0UCWND4Cexb7pK+TosGpQq
   kExb6n3KioY2dMakN5xNjjo+Lzy1c9gLFJMCfQh0uhE3hYAInBWt7jpuj
   Q==;
X-CSE-ConnectionGUID: +x9WgZciTSiSRdrIyoRNUw==
X-CSE-MsgGUID: ky0kpYaMTbew8+HPewGbSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="66396733"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="66396733"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 08:35:02 -0700
X-CSE-ConnectionGUID: rHaLhoCuSSS8t72LvXQf6g==
X-CSE-MsgGUID: k/7qmv3VSXqSEZsyx24Bzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="237619246"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 05 May 2026 08:35:00 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKHnW-000000006G9-2APv;
	Tue, 05 May 2026 15:34:58 +0000
Date: Tue, 05 May 2026 17:34:30 +0200
From: kernel test robot <lkp@intel.com>
To: Amery Hung <ameryhung@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: kernel/bpf/verifier.c:9023:2: warning: variable '___stack'
 set but not used
Message-ID: <202605051722.33fzvj5H-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Amery-Hung/bpf-Unify-dynptr-handling-in-the-verifier/20260423-084016
head:   2f05b55c2abbebede16518131d4da9dd842759e5
commit: 8d8a026071789397b6558db6fb659dc968dd5042 bpf: Refactor object relationship tracking and fix dynptr UAF bug
date:   13 days ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260505/202605051722.33fzvj5H-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605051722.33fzvj5H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605051722.33fzvj5H-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/verifier.c:9023:2: warning: variable '___stack' set but not used [-Wunused-but-set-variable]
    9023 |         bpf_for_each_reg_in_vstate(env->cur_state, state, reg, ({
         |         ^
   include/linux/bpf_verifier.h:542:28: note: expanded from macro 'bpf_for_each_reg_in_vstate'
     542 |                 struct bpf_stack_state * ___stack;                              \
         |                                          ^
   kernel/bpf/verifier.c:9148:2: warning: variable '___stack' set but not used [-Wunused-but-set-variable]
    9148 |         bpf_for_each_reg_in_vstate(env->cur_state, unused, reg, ({
         |         ^
   include/linux/bpf_verifier.h:542:28: note: expanded from macro 'bpf_for_each_reg_in_vstate'
     542 |                 struct bpf_stack_state * ___stack;                              \
         |                                          ^
   kernel/bpf/verifier.c:10286:5: warning: variable '___stack' set but not used [-Wunused-but-set-variable]
    10286 |                                 bpf_for_each_reg_in_vstate(env->cur_state, state, reg, ({
          |                                 ^
   include/linux/bpf_verifier.h:542:28: note: expanded from macro 'bpf_for_each_reg_in_vstate'
     542 |                 struct bpf_stack_state * ___stack;                              \
         |                                          ^
   kernel/bpf/verifier.c:11497:3: warning: variable '___stack' set but not used [-Wunused-but-set-variable]
    11497 |                 bpf_for_each_reg_in_vstate(env->cur_state, unused, reg, ({
          |                 ^
   include/linux/bpf_verifier.h:542:28: note: expanded from macro 'bpf_for_each_reg_in_vstate'
     542 |                 struct bpf_stack_state * ___stack;                              \
         |                                          ^
   kernel/bpf/verifier.c:12946:27: warning: variable 'stack' set but not used [-Wunused-but-set-variable]
    12946 |                 struct bpf_stack_state *stack;
          |                                         ^
   kernel/bpf/verifier.c:15324:2: warning: variable '___stack' set but not used [-Wunused-but-set-variable]
    15324 |         bpf_for_each_reg_in_vstate(vstate, state, reg, ({
          |         ^
   include/linux/bpf_verifier.h:542:28: note: expanded from macro 'bpf_for_each_reg_in_vstate'
     542 |                 struct bpf_stack_state * ___stack;                              \
         |                                          ^
   kernel/bpf/verifier.c:15902:2: warning: variable '___stack' set but not used [-Wunused-but-set-variable]
    15902 |         bpf_for_each_reg_in_vstate(vstate, state, reg, ({
          |         ^
   include/linux/bpf_verifier.h:542:28: note: expanded from macro 'bpf_for_each_reg_in_vstate'
     542 |                 struct bpf_stack_state * ___stack;                              \
         |                                          ^
   kernel/bpf/verifier.c:17135:2: warning: variable '___stack' set but not used [-Wunused-but-set-variable]
    17135 |         bpf_for_each_reg_in_vstate(st, func, reg, ({
          |         ^
   include/linux/bpf_verifier.h:542:28: note: expanded from macro 'bpf_for_each_reg_in_vstate'
     542 |                 struct bpf_stack_state * ___stack;                              \
         |                                          ^
   kernel/bpf/verifier.c:17143:2: warning: variable '___stack' set but not used [-Wunused-but-set-variable]
    17143 |         bpf_for_each_reg_in_vstate(st, func, reg, ({
          |         ^
   include/linux/bpf_verifier.h:542:28: note: expanded from macro 'bpf_for_each_reg_in_vstate'
     542 |                 struct bpf_stack_state * ___stack;                              \
         |                                          ^
   9 warnings generated.


vim +/___stack +9023 kernel/bpf/verifier.c

435faee1aae9c1 Daniel Borkmann         2016-04-13  9011  
de8f3a83b0a0fd Daniel Borkmann         2017-09-25  9012  /* Packet data might have moved, any old PTR_TO_PACKET[_META,_END]
de8f3a83b0a0fd Daniel Borkmann         2017-09-25  9013   * are now invalid, so turn them into unknown SCALAR_VALUE.
66e3a13e7c2c44 Joanne Koong            2023-03-01  9014   *
66e3a13e7c2c44 Joanne Koong            2023-03-01  9015   * This also applies to dynptr slices belonging to skb and xdp dynptrs,
66e3a13e7c2c44 Joanne Koong            2023-03-01  9016   * since these slices point to packet data.
f1174f77b50c94 Edward Cree             2017-08-07  9017   */
b239da34203f49 Kumar Kartikeya Dwivedi 2022-09-04  9018  static void clear_all_pkt_pointers(struct bpf_verifier_env *env)
969bf05eb3cedd Alexei Starovoitov      2016-05-05  9019  {
b239da34203f49 Kumar Kartikeya Dwivedi 2022-09-04  9020  	struct bpf_func_state *state;
b239da34203f49 Kumar Kartikeya Dwivedi 2022-09-04  9021  	struct bpf_reg_state *reg;
969bf05eb3cedd Alexei Starovoitov      2016-05-05  9022  
b239da34203f49 Kumar Kartikeya Dwivedi 2022-09-04 @9023  	bpf_for_each_reg_in_vstate(env->cur_state, state, reg, ({
66e3a13e7c2c44 Joanne Koong            2023-03-01  9024  		if (reg_is_pkt_pointer_any(reg) || reg_is_dynptr_slice_pkt(reg))
dbd8d22863e83e Kumar Kartikeya Dwivedi 2023-02-21  9025  			mark_reg_invalid(env, reg);
b239da34203f49 Kumar Kartikeya Dwivedi 2022-09-04  9026  	}));
f4d7e40a5b7157 Alexei Starovoitov      2017-12-14  9027  }
f4d7e40a5b7157 Alexei Starovoitov      2017-12-14  9028  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
