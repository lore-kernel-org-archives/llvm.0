Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A01B3FB7E9;
	Wed,  8 Jul 2026 21:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783547978; cv=none; b=dtvTQOHLq5MZM0SadGA1SqDKfP8XNT86p7c8ZrHtGP5W+qGcnzTkisQ19mx9GwBZncvWAKRF7KfmnsxamqPxs1hwDBDbJ4UBSbMH+Htc5G0o1Xl0nPAN4k/xYxzT0wuBSkrfyYnDmPYIcGnJIREEr3CffcblETip7k1h96I0Y0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783547978; c=relaxed/simple;
	bh=W+57LXS4riDEbNg5KCl62OXorn3j1qzPxvDKnBcwzQk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T/EYeVEWlpsIhGS92qj3Ora65v1fjLnzruk6jGl5o0dq5RVUXBPMf5XioOvazbhHQQdysWFUdnmR18cA40WE1LOEAc1QmFFC2CW5wXjweJn9wcI7sGWjgGmabPg4xG/yh4thkoDxhh8/55BlK3LBdZLN7no8jiuMrBWWdbm4xYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jvdVBKeY; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jvdVBKeY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783547977; x=1815083977;
  h=date:from:to:cc:subject:message-id;
  bh=W+57LXS4riDEbNg5KCl62OXorn3j1qzPxvDKnBcwzQk=;
  b=jvdVBKeYJlKuyj4j37AePu51i2+pcMaSyfyNZzW+bfB3rw5B1VsWSLgW
   4sJ+Z062RU1dsQwZpxQnv/5NRTt2CpNcJJiPalE1vNpY/fZ8pmn9lci1o
   TNbw49KOY92nF163n9M88zeoc+m1cS/WCtDRtmAZa3mLp9Zd47oA6lrhY
   AH2mpT6ZolAPreok+hyAXrSrHMGA/XCQuV/mlkGzbFY2QFBFXMJ1SEXOK
   mQnbJjngrm+TIqLpopFHVls54Ayje3/fuVvNciFXAOo2ijmnx0ENOZv9u
   /5X9G0JTAZx2IJkSi61ncKiD2LCaBOiqH0m/SWiA40AKrE2D2KmNsOnm/
   A==;
X-CSE-ConnectionGUID: dY4Qmi0VQ1WZB/WfUC/Q6g==
X-CSE-MsgGUID: 0aERfO2DRDOzBBZPQmDB7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="107018517"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="107018517"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 14:59:36 -0700
X-CSE-ConnectionGUID: lcO+TWuJQ82QYGwl1EoM+w==
X-CSE-MsgGUID: Cq/kZYYxTSOsrvtNi80Jqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="252657393"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 08 Jul 2026 14:59:35 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whaIm-000000002nl-2AKv;
	Wed, 08 Jul 2026 21:59:32 +0000
Date: Wed, 08 Jul 2026 23:58:41 +0200
From: kernel test robot <lkp@intel.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [vbabka:objext_split 10/14] mm/slab.h:702:47: error: no
 member named '_ctref' in 'struct slabobj_ext'
Message-ID: <202607082351.xSIajZFs-lkp@intel.com>
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
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260708/202607082351.xSIajZFs-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607082351.xSIajZFs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607082351.xSIajZFs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/mempool.c:21:
>> mm/slab.h:702:47: error: no member named '_ctref' in 'struct slabobj_ext'
     702 |         return &slab_obj_ext(slab, obj_exts, index)->_ctref;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ^
   1 error generated.


vim +702 mm/slab.h

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
