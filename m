Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860643FCB39;
	Fri, 10 Jul 2026 09:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677529; cv=none; b=PRMlT/ohiM0xXRKr2i/QwQYPulwGPbfO5nJ+XKOp0alt2yMrIs1nrSCK3ioOFq2h5LrZ94crUKsTQ4GMkT8xf720++Z5p3qTOtx32Lk7DEgD+ZVwBh5ZqWOqXyVirgEVTVmY2sNQEBflZP8jMLOyzp+Wpcm3dc+lczrqxYrIXLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677529; c=relaxed/simple;
	bh=ww8K+vWeaM40J/urnWMABDZIZnFRMBofV1SUa75tEfE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GHQ5XaC60W2AJGiooAOtpAt/bbLU++LqthzZd2Jr2B1Gf/g9xHKbUQYk1BX84N44MGnPdp7Y+LJg/i+1nLxHwzmqCGEOwJiSXIHeSyIWIdAiDIVjaZsEn+HQ+Cxi2eNRecIF1jUN3PArrCQI5Aq6yXRyowT4f6HLntY2PaHPiOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PCtZrAAL; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PCtZrAAL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783677527; x=1815213527;
  h=date:from:to:cc:subject:message-id;
  bh=ww8K+vWeaM40J/urnWMABDZIZnFRMBofV1SUa75tEfE=;
  b=PCtZrAAL2fwbL7bncQ/gGCdx4hCgUb+TSnzZPbS2zJ4E2D08kBflrz83
   hVf37Xp9MEVY9pKRwar27IR7g7+TOTrvRPd3FqY8aDCvj5oF7rIrusK/f
   G9ukeRtRpw0iR7qQkVqImc908K4d7c5gpVfHPlxyjeBH/jjbv03Wonlvk
   WgUpbCxST4DsaSYcZJwlJGsm8ejqSJfajhWE05p3c4iqzQmOpoh1myIXO
   kcKsoCqnkw9quWRFX9Cxpm/17azC9ZIWf9AxHHXxhg7ytDrpFzabNr2yN
   xTKn8jgIUMU5xXmV0LOcgzkMLqoXKY9kh5ZJUtGDXQmue0s79KNep0kg/
   w==;
X-CSE-ConnectionGUID: 2Bj0YamxRO6KCY2iaXnzSA==
X-CSE-MsgGUID: UK7fjcgQRG2mIwW6wyn9Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101923808"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="101923808"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 02:58:47 -0700
X-CSE-ConnectionGUID: XG67tJCgSAeCDIF1LjOeiQ==
X-CSE-MsgGUID: wvC/c5DrSpidA5/KeHZnPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250841246"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 10 Jul 2026 02:58:45 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wi80G-00000000IoD-0lTR;
	Fri, 10 Jul 2026 09:58:40 +0000
Date: Fri, 10 Jul 2026 17:57:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [vbabka:objext_split 13/19] mm/slub.c:2098:1: error:
 expected identifier or '('
Message-ID: <202607101753.3XTkPSvA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Vlastimil,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git objext_split
head:   c4923e2e532497a14255f7a0ff21e2a0c2b79445
commit: 9028e3e3942a1f9fcdfe06b498814fae5e3171b0 [13/19] mm/slab: abstract slabobj_ext.ref access
config: i386-randconfig-015-20260710 (https://download.01.org/0day-ci/archive/20260710/202607101753.3XTkPSvA-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260710/202607101753.3XTkPSvA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607101753.3XTkPSvA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/slub.c:2098:1: error: expected identifier or '('
    2098 | {
         | ^
   1 error generated.


vim +2098 mm/slub.c

0bedcc66d2a43a Vlastimil Babka        2023-10-03  2095  
9028e3e3942a1f Vlastimil Babka (SUSE  2026-07-08  2096) static inline void handle_failed_objexts_alloc(struct slab *slab,
9028e3e3942a1f Vlastimil Babka (SUSE  2026-07-08  2097) 		unsigned long obj_exts, struct slabobj_ext *vec);
0bedcc66d2a43a Vlastimil Babka        2023-10-03 @2098  {
9028e3e3942a1f Vlastimil Babka (SUSE  2026-07-08  2099) 	vec = slab_obj_ext_shift_codetag_ref(slab, vec);
9028e3e3942a1f Vlastimil Babka (SUSE  2026-07-08  2100) 
0bedcc66d2a43a Vlastimil Babka        2023-10-03  2101  	/*
09c46563ff6d5f Suren Baghdasaryan     2024-03-21  2102  	 * If vector previously failed to allocate then we have live
09c46563ff6d5f Suren Baghdasaryan     2024-03-21  2103  	 * objects with no tag reference. Mark all references in this
09c46563ff6d5f Suren Baghdasaryan     2024-03-21  2104  	 * vector as empty to avoid warnings later on.
0bedcc66d2a43a Vlastimil Babka        2023-10-03  2105  	 */
7612833192d56a Alexei Starovoitov     2025-09-08  2106  	if (obj_exts == OBJEXTS_ALLOC_FAIL) {
09c46563ff6d5f Suren Baghdasaryan     2024-03-21  2107  		unsigned int i;
09c46563ff6d5f Suren Baghdasaryan     2024-03-21  2108  
9028e3e3942a1f Vlastimil Babka (SUSE  2026-07-08  2109) 		for (i = 0; i < slab->objects; i++)
9028e3e3942a1f Vlastimil Babka (SUSE  2026-07-08  2110) 			set_codetag_empty(&vec[i]._ctref);
0bedcc66d2a43a Vlastimil Babka        2023-10-03  2111  	}
09c46563ff6d5f Suren Baghdasaryan     2024-03-21  2112  }
09c46563ff6d5f Suren Baghdasaryan     2024-03-21  2113  

:::::: The code at line 2098 was first introduced by commit
:::::: 0bedcc66d2a43a50ab660273842f4737a293dd8a mm/slab: move memcg related functions from slab.h to slub.c

:::::: TO: Vlastimil Babka <vbabka@suse.cz>
:::::: CC: Vlastimil Babka <vbabka@suse.cz>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
