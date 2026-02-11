Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9675822126C;
	Wed, 11 Feb 2026 17:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770830029; cv=none; b=bP8f19KCshb4rZd6nAw9YXW/mRcu4mLj/Mta4CS4/khqx4v5mGgUhBSDSg2eLkGv3U4g6CtjRIuilmSju8tctFnbAlnkMaFflMH0JInmdJc7bJVGy7DzGoVaEE0dHu9APm+o31DwOFEsF/ADz98fjrK5yU7YLTGEqntHyc9oa3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770830029; c=relaxed/simple;
	bh=9i+8Q6pPSSIOlitikHzIi/lwC5mkNSnUwo6u44K1r8U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pXIbFFtHhyNqRyzuKUDxoOceC0TXQJKLeNMTEHo7eV2zMclg4XcDAu2Rr40d5MHD41b3CnZJfU5VyCiKpmrHhGN1ZGEmR4VjaIp+js3JMnWRnFoQNzvYnYFNiXeTFrK3768nCcqAU/U5CUgkg3xDyk+BpFSR8nhYm22BTAmR5Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eZLt9bHi; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZLt9bHi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770830027; x=1802366027;
  h=date:from:to:cc:subject:message-id;
  bh=9i+8Q6pPSSIOlitikHzIi/lwC5mkNSnUwo6u44K1r8U=;
  b=eZLt9bHiF4UGeAt8BQBX6XP0kEDI7mkpI80sBNrh8jZFhcSy8VqlLZzL
   oIxhisJ3RE/0Y8snzLSNnb4y8Ly/qYoAkKFiRWCFFQS99EVhc6JYs0gY1
   FDYXngvhdY/V4sjHHWS6xUAEE5HO8AUi9M/OYDuJLRlIRP7EMB/uSPfXb
   AuhBpCl2qWlczWyjK5rpvG1fWCmA7yFw9Wra76vUwBqSzNoFArJhSFyBk
   18NS66LqbpfWgcp/i3F/mbfrKAyta+48iavhKUcDL/RRIM44dLVsiLLHr
   BGX7gJH67413GaqpaP0xa325iUlUKK/mIBaRiwB5aX6aMofU0FLvY2dp4
   A==;
X-CSE-ConnectionGUID: Gm9u+jANRJqIhVRTk9vSSg==
X-CSE-MsgGUID: rjcYGcPWRleb64S4fuOuXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="72054931"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="72054931"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 09:13:42 -0800
X-CSE-ConnectionGUID: MgsZ2Q9jT1WzOyAKRPUuSQ==
X-CSE-MsgGUID: cYGndjutRi2lHyxkKODU7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="242054306"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Feb 2026 09:13:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqDmU-00000000qCM-2tjz;
	Wed, 11 Feb 2026 17:13:38 +0000
Date: Thu, 12 Feb 2026 01:13:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_3 5/14]
 kernel/bpf/syscall.c:3513:42: error: incompatible pointer types passing
 'struct bpf_tramp_node *' to parameter of type 'struct bpf_tramp_link *'
Message-ID: <202602120140.oLND8sHx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_3
head:   e88de144ad6e264c1df0286d6a975136d7a059c2
commit: 944b7cd2572a6af8fc0f19a1e29c93147e15cdcf [5/14] bpf: Add struct bpf_tramp_node object
config: hexagon-randconfig-002-20260211 (https://download.01.org/0day-ci/archive/20260212/202602120140.oLND8sHx-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602120140.oLND8sHx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602120140.oLND8sHx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bpf/syscall.c:5:
   include/linux/bpf.h:1543:51: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
    1543 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                   ^
   include/linux/bpf.h:1549:53: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
    1549 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                     ^
>> kernel/bpf/syscall.c:3513:42: error: incompatible pointer types passing 'struct bpf_tramp_node *' to parameter of type 'struct bpf_tramp_link *' [-Wincompatible-pointer-types]
    3513 |         WARN_ON_ONCE(bpf_trampoline_unlink_prog(&tr_link->link.node,
         |                                                 ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:218:41: note: expanded from macro 'WARN_ON_ONCE'
     218 | #define WARN_ON_ONCE(condition) WARN_ON(condition)
         |                                         ^~~~~~~~~
   include/asm-generic/bug.h:205:25: note: expanded from macro 'WARN_ON'
     205 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/bpf.h:1549:69: note: passing argument to parameter 'link' here
    1549 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                                     ^
   kernel/bpf/syscall.c:3745:33: error: incompatible pointer types passing 'struct bpf_tramp_node *' to parameter of type 'struct bpf_tramp_link *' [-Wincompatible-pointer-types]
    3745 |         err = bpf_trampoline_link_prog(&link->link.node, tr, tgt_prog);
         |                                        ^~~~~~~~~~~~~~~~
   include/linux/bpf.h:1543:67: note: passing argument to parameter 'link' here
    1543 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                                   ^
   2 warnings and 2 errors generated.


vim +3513 kernel/bpf/syscall.c

  3507	
  3508	static void bpf_tracing_link_release(struct bpf_link *link)
  3509	{
  3510		struct bpf_tracing_link *tr_link =
  3511			container_of(link, struct bpf_tracing_link, link.link);
  3512	
> 3513		WARN_ON_ONCE(bpf_trampoline_unlink_prog(&tr_link->link.node,
  3514							tr_link->trampoline,
  3515							tr_link->tgt_prog));
  3516	
  3517		bpf_trampoline_put(tr_link->trampoline);
  3518	
  3519		/* tgt_prog is NULL if target is a kernel function */
  3520		if (tr_link->tgt_prog)
  3521			bpf_prog_put(tr_link->tgt_prog);
  3522	}
  3523	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
