Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05181E633C;
	Sat, 11 Apr 2026 11:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775907382; cv=none; b=KNYqqG08WZWP0PhBcQ0G7PhqT75C5cBnBu8FZVt57D50M9N4AI/hagWEi5b6PNvRw7tqC4EctTFLrY1sO6Z7rLurTfepTJQ9IsNEzBpViziD8gAY/QbavpbiXUSiEfIUbDPksK7vqZibYU9ShFIyl+EzsEG38/nZD/2v25Ru/NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775907382; c=relaxed/simple;
	bh=7EtJCLl7XcI6dONC8SfZD6PSH2A/bEHVIbqYYv9+C1Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZsWBTC2kDBxJPdBsaJ5OB3vPKpAX3YPHjTptkY5I6FXIwyrooAa1Cyg4ABrJ62uqST9By3QiQaG18TexjhkG2o8eeQO0xQWMBr4TaxrDCaIcT4WLsJBc0LvUxeZveSEOQ3WrbMfCj7sA3jLlnFF/PvnRLwDSSTK0Mp4/A2E2ktw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PxiDP1HI; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PxiDP1HI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775907381; x=1807443381;
  h=date:from:to:cc:subject:message-id;
  bh=7EtJCLl7XcI6dONC8SfZD6PSH2A/bEHVIbqYYv9+C1Y=;
  b=PxiDP1HIR4vEVwBEJoAq3p9UOz+LKZdVQEQWSy9DV0VQNWUDpeoJvgwd
   WYSfMSdNU2pu4ETBRbpBnqPdDxOHPRlI2O7OYGLgRndaIwc+IPjXmn8L4
   6FRMoWpnjEC08zCKDqf91Xls4E5SivMapvrj4VIgONIuXAB2nDuCmlXrq
   JVZrZ4dJ8zqRw3om9P+8NHn7jluvGuxGWnEwO3fpvahWEHyPjl3Fdsss6
   s5NOFahx9JLBSGFHeBwC/esG82AnXqacezEJiHyFbJOnRKORM7ZTY8qB1
   PVKCuvgjcxVjbqBNbWeK+ScAnkkmf1v/L0QteGirTdNPB7dOOYS++jhoz
   g==;
X-CSE-ConnectionGUID: mOciJhoIQo2SDQnV4J7EEQ==
X-CSE-MsgGUID: 68vCE72sTF+gex+P8OKGTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76626051"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="76626051"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 04:36:20 -0700
X-CSE-ConnectionGUID: 2dzaLPxZR0CmqYAad4KcYQ==
X-CSE-MsgGUID: A8Bed5hTQmiAzSROkQYSPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="234262013"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 11 Apr 2026 04:36:19 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBWdM-00000000B4H-3Hd7;
	Sat, 11 Apr 2026 11:36:16 +0000
Date: Sat, 11 Apr 2026 13:35:35 +0200
From: kernel test robot <lkp@intel.com>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: kernel/bpf/liveness.c:371:34: warning: variable 'cnt' set
 but not used
Message-ID: <202604111314.SCpV3BPU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Eduard-Zingerman/bpf-share-several-utility-functions-as-internal-API/20260411-114028
head:   ad9095e5b6b2e04ae837fa578308a4f7f48fb24e
commit: dc02669dbcd7fae4c4ec1cbcf98f86002d462772 bpf: change logging scheme for live stack analysis
date:   8 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260411/202604111314.SCpV3BPU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604111314.SCpV3BPU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604111314.SCpV3BPU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/liveness.c:371:34: warning: variable 'cnt' set but not used [-Wunused-but-set-variable]
     371 |         u32 i, frame, po_start, po_end, cnt;
         |                                         ^
   1 warning generated.


vim +/cnt +371 kernel/bpf/liveness.c

b3698c356ad92b Eduard Zingerman 2025-09-18  367  
5c742328a727cd Eduard Zingerman 2026-04-10  368  /* Fixed-point computation of @live_before marks */
5c742328a727cd Eduard Zingerman 2026-04-10  369  static void update_instance(struct bpf_verifier_env *env, struct func_instance *instance)
b3698c356ad92b Eduard Zingerman 2025-09-18  370  {
5c742328a727cd Eduard Zingerman 2026-04-10 @371  	u32 i, frame, po_start, po_end, cnt;
b3698c356ad92b Eduard Zingerman 2025-09-18  372  	int *insn_postorder = env->cfg.insn_postorder;
b3698c356ad92b Eduard Zingerman 2025-09-18  373  	struct bpf_subprog_info *subprog;
b3698c356ad92b Eduard Zingerman 2025-09-18  374  	bool changed;
b3698c356ad92b Eduard Zingerman 2025-09-18  375  
5c742328a727cd Eduard Zingerman 2026-04-10  376  	instance->must_write_initialized = true;
5c742328a727cd Eduard Zingerman 2026-04-10  377  	subprog = &env->subprog_info[instance->subprog];
b3698c356ad92b Eduard Zingerman 2025-09-18  378  	po_start = subprog->postorder_start;
b3698c356ad92b Eduard Zingerman 2025-09-18  379  	po_end = (subprog + 1)->postorder_start;
b3698c356ad92b Eduard Zingerman 2025-09-18  380  	cnt = 0;
b3698c356ad92b Eduard Zingerman 2025-09-18  381  	/* repeat until fixed point is reached */
b3698c356ad92b Eduard Zingerman 2025-09-18  382  	do {
b3698c356ad92b Eduard Zingerman 2025-09-18  383  		cnt++;
b3698c356ad92b Eduard Zingerman 2025-09-18  384  		changed = false;
5c742328a727cd Eduard Zingerman 2026-04-10  385  		for (frame = 0; frame <= instance->depth; frame++) {
b3698c356ad92b Eduard Zingerman 2025-09-18  386  			if (!instance->frames[frame])
b3698c356ad92b Eduard Zingerman 2025-09-18  387  				continue;
b3698c356ad92b Eduard Zingerman 2025-09-18  388  
b3698c356ad92b Eduard Zingerman 2025-09-18  389  			for (i = po_start; i < po_end; i++)
b3698c356ad92b Eduard Zingerman 2025-09-18  390  				changed |= update_insn(env, instance, frame, insn_postorder[i]);
b3698c356ad92b Eduard Zingerman 2025-09-18  391  		}
b3698c356ad92b Eduard Zingerman 2025-09-18  392  	} while (changed);
b3698c356ad92b Eduard Zingerman 2025-09-18  393  }
b3698c356ad92b Eduard Zingerman 2025-09-18  394  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
