Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E482192B90;
	Thu, 12 Feb 2026 00:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770855539; cv=none; b=NrLdXsVkmqALGwjnAz2reoa/1X3P9Y4yFxDcnV+zVjj1iCNrBqxytksDjrr4l2VW5rD8A4HeUvLfM1Q3Ro7GPx9gYXPu8oR7PElnd3pjPKRQsMEm6zm+cEDDPe2dRZPSDMhV83yKRFDRaVSshMm/B8VqzW/pOz0m30BVa+aU2Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770855539; c=relaxed/simple;
	bh=KOQr7YIKBJ6FuGotcC4x2nQQzv30wTjYWd8kIIXENYE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X7H7vBsKasWlRoIsieCldNq8FIc+W2r7TNBoWHiJWeI+vOwVBS3JoGFXg0YJj2Dpv+GBmcxOBifFWvcwPRNGYfNgzR9MktYi7RtxyjdQvjvhT+3pPrPXWL/OhoCg2uqOhd3zjNIKi6zPMSLCL3SAyhWdpAx1JF6/9A+XC0Ftlgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XkAJvpW+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XkAJvpW+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770855538; x=1802391538;
  h=date:from:to:cc:subject:message-id;
  bh=KOQr7YIKBJ6FuGotcC4x2nQQzv30wTjYWd8kIIXENYE=;
  b=XkAJvpW+6Qe+MVLsV/07aYNioZCyZH+zzFYJnEN+1pa0ER+j6NEOyABT
   eqONr4EEV6ZULcSP34qFGABZdm5BtfEJDmFvUM6V6p/6U5uYjjfTmY2gr
   KwAku0v+UH793ynAisRYLgf+pGPYGSlLCxNNiogfzbVtiTu3NQOgjfLCv
   4Do+V6glMCSgS/AM0Sl3Ec+dWrdBx0aqe8EbAA3ckePivWbOLaVW73cF3
   5wB/+VxoI/81S1Jl5TsN4u0/yX/cJW1JFTSocTdUBivvmQL7Vzi1s4A9t
   R74/A9QSUYbClCIRQ9OWWLhidxex4rJV0D021LcrWjTf0BLuTyOBQS9C7
   A==;
X-CSE-ConnectionGUID: 5f+PZFU5QtehykdXzEmaFQ==
X-CSE-MsgGUID: OqFD0tMST86O6OVE7wwTvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="97476269"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="97476269"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 16:18:58 -0800
X-CSE-ConnectionGUID: 5KfOwVCqTwmvizTrHSr1pw==
X-CSE-MsgGUID: hfw+QFipT0KopWPlN19u5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="216561789"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Feb 2026 16:18:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqKQ1-00000000qV8-44Vp;
	Thu, 12 Feb 2026 00:18:53 +0000
Date: Thu, 12 Feb 2026 08:18:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_4 7/13]
 kernel/bpf/trampoline.c:527:14: error: call to undeclared function
 'is_tracing_multi'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202602120809.ddpbx5h9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_4
head:   a3f496c783e26237e1a9a5b1f5e6661d4e3c5f25
commit: cbb350ed40eb90b612d359931c72378a8dcc718b [7/13] bpf: Add bpf_trampoline_multi_attach/detach functions
config: i386-randconfig-002-20260212 (https://download.01.org/0day-ci/archive/20260212/202602120809.ddpbx5h9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602120809.ddpbx5h9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602120809.ddpbx5h9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/trampoline.c:527:14: error: call to undeclared function 'is_tracing_multi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     527 |                         *multi |= is_tracing_multi(node->link->prog->expected_attach_type);
         |                                   ^
   1 error generated.


vim +/is_tracing_multi +527 kernel/bpf/trampoline.c

   507	
   508	static struct bpf_tramp_nodes *
   509	bpf_trampoline_get_progs(const struct bpf_trampoline *tr, int *total, bool *ip_arg, bool *multi)
   510	{
   511		struct bpf_tramp_node *node, **nodes;
   512		struct bpf_tramp_nodes *tnodes;
   513		int kind;
   514	
   515		*total = 0;
   516		tnodes = kcalloc(BPF_TRAMP_MAX, sizeof(*tnodes), GFP_KERNEL);
   517		if (!tnodes)
   518			return ERR_PTR(-ENOMEM);
   519	
   520		for (kind = 0; kind < BPF_TRAMP_MAX; kind++) {
   521			tnodes[kind].nr_nodes = tr->progs_cnt[kind];
   522			*total += tr->progs_cnt[kind];
   523			nodes = tnodes[kind].nodes;
   524	
   525			hlist_for_each_entry(node, &tr->progs_hlist[kind], tramp_hlist) {
   526				*ip_arg |= node->link->prog->call_get_func_ip;
 > 527				*multi |= is_tracing_multi(node->link->prog->expected_attach_type);
   528				*nodes++ = node;
   529			}
   530		}
   531		return tnodes;
   532	}
   533	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
