Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9025E15B998;
	Thu,  9 Jul 2026 01:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783559466; cv=none; b=TIUR/7lU3/lP1J+DKmPTdAYJF1Wv8ExoSaogSuyk6i1m16yuEHn69EFXksGurCrBn9Iy1gH2dDWmBn/Yms9Qc9YtOafAKmnU9DIdWn7Kz/+SY2sxlJ34p21381Pnr+ZklWDvvWZKc/MAOWA7V861wd2g16Q4SG7yZdcVJXjFf68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783559466; c=relaxed/simple;
	bh=dcxNGeK42hOmsT/8DaVFXHjDsKVBQkSNZ6QjQ6vPb4o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ramG8iSeTLJkq6H6UeuFawcR0kqMl5DD0ZoCAqEOpmVSF/1Mvt4UQqM8m6Ta2OBLS+5ApYQQwL9J3P0FCOqkPP3E/987dSHBfGnYPDee2lh3nHEa1fva0HvmylBZeQnYW0lFIMqd4R3Tza9PWJbcRVsJz0Ub2gknZhxV6erTDGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kJeXmLXZ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kJeXmLXZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783559463; x=1815095463;
  h=date:from:to:cc:subject:message-id;
  bh=dcxNGeK42hOmsT/8DaVFXHjDsKVBQkSNZ6QjQ6vPb4o=;
  b=kJeXmLXZ91xOG6rAfc3UM0b9JBY0cnGAXLnK3RbepnL2fTxarN6sqbqc
   RLOUrUAeTL4DYkc+udTVQ6ntBQBlm0F48pdoGRagQqaDwfeqy4qVxKuCy
   jdX/v7xGSgDXeeRLKnH0lzkenO5FM1a5gc9YjIC7B4uNrxCTE65MZZLt3
   b/YPi1NnynHUt+ONjVYDXmU7g5HN+OBkYggX/HlwVGtn6mQdpWfBSe/7f
   lhDSYwlv5O6GBnZUHMBba/O5GbEYABIGmYtPA0UrvrwLAFD2i7YF5lUYN
   8EFWDQDgTMH347E6qIvblME9UlxxjQQFD2NUDH70kY3AwoYKyzhfHVYlo
   A==;
X-CSE-ConnectionGUID: 5qg4ISZDQuCgqt5I4iu34g==
X-CSE-MsgGUID: zI/AtTguSR2KF/zOiDpEzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84253977"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84253977"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:11:02 -0700
X-CSE-ConnectionGUID: qT04HW/uTsCmtSyPdyjwRQ==
X-CSE-MsgGUID: lQ+YPy4JTHqiuN92D25xxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="258737118"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 08 Jul 2026 18:11:01 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whdI3-000000002rd-1685;
	Thu, 09 Jul 2026 01:10:59 +0000
Date: Thu, 09 Jul 2026 03:10:03 +0200
From: kernel test robot <lkp@intel.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [vbabka:objext_split 10/14]
 kernel/bpf/../../mm/slab.h:702:47: error: no member named '_ctref' in 'struct
 slabobj_ext'
Message-ID: <202607090246.FbXygihm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Vlastimil,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git objext_split
head:   8bd682e28958694beba958e2a3af94c6e1789819
commit: 510dc45196b1495bba6f15a6f3348ace5c983136 [10/14] mm/slab: abstract slabobj_ext.ref access
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260709/202607090246.FbXygihm-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607090246.FbXygihm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607090246.FbXygihm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bpf/kmem_cache_iter.c:9:
>> kernel/bpf/../../mm/slab.h:702:47: error: no member named '_ctref' in 'struct slabobj_ext'
     702 |         return &slab_obj_ext(slab, obj_exts, index)->_ctref;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ^
   1 error generated.


vim +702 kernel/bpf/../../mm/slab.h

   694	
   695	static inline union codetag_ref *slab_obj_ext_codetag_ref(struct slab *slab,
   696						unsigned long obj_exts, const void *obj)
   697	{
   698		unsigned int index;
   699	
   700		index = obj_to_index(slab->slab_cache, slab, obj);
   701	
 > 702		return &slab_obj_ext(slab, obj_exts, index)->_ctref;
   703	}
   704	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
