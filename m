Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA937610C;
	Thu, 14 Dec 2023 05:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MtTGdNek"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702530594; x=1734066594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iOH6CBIuDKzjzM38vVVl+svnXcyMqfAk8k3l1GVWXI8=;
  b=MtTGdNekgby2hA2uOHJO9K2VbAwgQLznCi+IjRKcq4h96OpGLuh+qV23
   E/Y558F/EpX8b0Q3AA24yefy7D7RrKX0Jf5nCi+WzmGa1ixNJKZaymsYg
   uC3a7Dc7Otxm+wPRQEuxtkrcDwpLhv0b6gJs6zoaCAaANbl2EombyalLp
   zIt45PWWUqaAV87m9eKWGjwmqJUEpO5R5PdRu9+b/jxjglUT9vzmG6zVM
   61AEOcIhrmetRpjN2S/vUBgg+0Y3dy0ogbcYzev6KrC1lLAbgyfE6k0iA
   QLVDTvERjU3GsaNik4JjsXyJUYMI3xQvxvmDym0ZqZNXFf1T4F92jrCMX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="393939748"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="393939748"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 21:09:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="808445410"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="808445410"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 13 Dec 2023 21:09:51 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDdyn-000La7-01;
	Thu, 14 Dec 2023 05:09:49 +0000
Date: Thu, 14 Dec 2023 13:09:31 +0800
From: kernel test robot <lkp@intel.com>
To: Nhat Pham <nphamcs@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 153/301] mm/list_lru.c:110:1: error: unused
 function 'list_lru_from_kmem'
Message-ID: <202312141318.q8b5yrAq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   3ecae30dda241440417499d69ae90dfad517a932
commit: 0a97c01cd20bb96359d8c9dedad92a061ed34e0b [153/301] list_lru: allow explicit memcg and NUMA node selection
config: x86_64-sof-customedconfig-compile-test-defconfig (https://download.01.org/0day-ci/archive/20231214/202312141318.q8b5yrAq-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312141318.q8b5yrAq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312141318.q8b5yrAq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/list_lru.c:110:1: error: unused function 'list_lru_from_kmem' [-Werror,-Wunused-function]
   list_lru_from_kmem(struct list_lru *lru, int nid, void *ptr,
   ^
   1 error generated.


vim +/list_lru_from_kmem +110 mm/list_lru.c

60d3fd32a7a9da Vladimir Davydov 2015-02-12  108  
60d3fd32a7a9da Vladimir Davydov 2015-02-12  109  static inline struct list_lru_one *
6a6b7b77cc0fdc Muchun Song      2022-03-22 @110  list_lru_from_kmem(struct list_lru *lru, int nid, void *ptr,
44bd4a4759d5a7 Kirill Tkhai     2018-08-17  111  		   struct mem_cgroup **memcg_ptr)
60d3fd32a7a9da Vladimir Davydov 2015-02-12  112  {
44bd4a4759d5a7 Kirill Tkhai     2018-08-17  113  	if (memcg_ptr)
44bd4a4759d5a7 Kirill Tkhai     2018-08-17  114  		*memcg_ptr = NULL;
6a6b7b77cc0fdc Muchun Song      2022-03-22  115  	return &lru->node[nid].lru;
60d3fd32a7a9da Vladimir Davydov 2015-02-12  116  }
84c07d11aa619c Kirill Tkhai     2018-08-17  117  #endif /* CONFIG_MEMCG_KMEM */
60d3fd32a7a9da Vladimir Davydov 2015-02-12  118  

:::::: The code at line 110 was first introduced by commit
:::::: 6a6b7b77cc0fdc13f50c66c219c8c05500a8dfce mm: list_lru: transpose the array of per-node per-memcg lru lists

:::::: TO: Muchun Song <songmuchun@bytedance.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
