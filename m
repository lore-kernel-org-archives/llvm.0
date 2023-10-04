Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1A311720;
	Wed,  4 Oct 2023 11:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696417803; x=1727953803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lxjb5CmhFqoDj7WOHqPuW1nIvM+2t7fBcK2UxyN8viw=;
  b=gDJZc5iqDBWyXR2LWLnZgdoSR38wLiPjbs8LDIHYDbRMrYviN17/escO
   VmNtL9ffguUtponV0EQZj4YIi9v7shNxxiDq/Phm4UFvFeXxzLgvZL85u
   FCL6GSdq/+bzxQjbLcY+AKiyqE1hTZa8LsqjGTL+4Fnr/C/YN7GYjMUTg
   nbu2bt1qswVt12pwF5lG/Ky1N/eopBhRRZeVqQUm6/NQRJ5gmr7vTdHZ8
   aHhphVCBSlijPgxFSEjn0vpOMXfjMfdJ4bhl9P/tDhwyjRJBBF5/M8TwW
   YWwEhWzsSHdN/h2/XA/7XDdIpbRCtaN6YpzRQTu/OROgGFH5g1BYGJiS6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="385957045"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="385957045"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 04:10:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="867299197"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="867299197"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 04 Oct 2023 04:09:59 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnzlN-000Hh4-1N;
	Wed, 04 Oct 2023 11:09:57 +0000
Date: Wed, 4 Oct 2023 19:08:58 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org
Subject: [vbabka:slab-remove-slab-v1r0 19/22] mm/memcontrol.c:2888:5:
 warning: no previous prototype for function 'memcg_alloc_slab_cgroups'
Message-ID: <202310041934.vgOzHUvw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slab-remove-slab-v1r0
head:   7a5cf1bc55d1877eb85656dd530301fd55599feb
commit: 69d9aaa43fff253c195b3f53537855bcfa14939a [19/22] mm/slab: move memcg related functions from slab.h to slub.c
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231004/202310041934.vgOzHUvw-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231004/202310041934.vgOzHUvw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310041934.vgOzHUvw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcontrol.c:2888:5: warning: no previous prototype for function 'memcg_alloc_slab_cgroups' [-Wmissing-prototypes]
   int memcg_alloc_slab_cgroups(struct slab *slab, struct kmem_cache *s,
       ^
   mm/memcontrol.c:2888:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int memcg_alloc_slab_cgroups(struct slab *slab, struct kmem_cache *s,
   ^
   static 
>> mm/memcontrol.c:3163:6: warning: no previous prototype for function 'mod_objcg_state' [-Wmissing-prototypes]
   void mod_objcg_state(struct obj_cgroup *objcg, struct pglist_data *pgdat,
        ^
   mm/memcontrol.c:3163:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mod_objcg_state(struct obj_cgroup *objcg, struct pglist_data *pgdat,
   ^
   static 
   2 warnings generated.


vim +/memcg_alloc_slab_cgroups +2888 mm/memcontrol.c

a7ebf564de325e Waiman Long     2021-12-10  2887  
4b5f8d9a895ada Vlastimil Babka 2021-11-02 @2888  int memcg_alloc_slab_cgroups(struct slab *slab, struct kmem_cache *s,
4b5f8d9a895ada Vlastimil Babka 2021-11-02  2889  				 gfp_t gfp, bool new_slab)
10befea91b61c4 Roman Gushchin  2020-08-06  2890  {
4b5f8d9a895ada Vlastimil Babka 2021-11-02  2891  	unsigned int objects = objs_per_slab(s, slab);
2e9bd483159939 Roman Gushchin  2021-02-24  2892  	unsigned long memcg_data;
10befea91b61c4 Roman Gushchin  2020-08-06  2893  	void *vec;
10befea91b61c4 Roman Gushchin  2020-08-06  2894  
41eb5df1cbc9b3 Waiman Long     2021-06-28  2895  	gfp &= ~OBJCGS_CLEAR_MASK;
10befea91b61c4 Roman Gushchin  2020-08-06  2896  	vec = kcalloc_node(objects, sizeof(struct obj_cgroup *), gfp,
4b5f8d9a895ada Vlastimil Babka 2021-11-02  2897  			   slab_nid(slab));
10befea91b61c4 Roman Gushchin  2020-08-06  2898  	if (!vec)
10befea91b61c4 Roman Gushchin  2020-08-06  2899  		return -ENOMEM;
10befea91b61c4 Roman Gushchin  2020-08-06  2900  
2e9bd483159939 Roman Gushchin  2021-02-24  2901  	memcg_data = (unsigned long) vec | MEMCG_DATA_OBJCGS;
4b5f8d9a895ada Vlastimil Babka 2021-11-02  2902  	if (new_slab) {
2e9bd483159939 Roman Gushchin  2021-02-24  2903  		/*
4b5f8d9a895ada Vlastimil Babka 2021-11-02  2904  		 * If the slab is brand new and nobody can yet access its
4b5f8d9a895ada Vlastimil Babka 2021-11-02  2905  		 * memcg_data, no synchronization is required and memcg_data can
4b5f8d9a895ada Vlastimil Babka 2021-11-02  2906  		 * be simply assigned.
2e9bd483159939 Roman Gushchin  2021-02-24  2907  		 */
4b5f8d9a895ada Vlastimil Babka 2021-11-02  2908  		slab->memcg_data = memcg_data;
4b5f8d9a895ada Vlastimil Babka 2021-11-02  2909  	} else if (cmpxchg(&slab->memcg_data, 0, memcg_data)) {
2e9bd483159939 Roman Gushchin  2021-02-24  2910  		/*
4b5f8d9a895ada Vlastimil Babka 2021-11-02  2911  		 * If the slab is already in use, somebody can allocate and
4b5f8d9a895ada Vlastimil Babka 2021-11-02  2912  		 * assign obj_cgroups in parallel. In this case the existing
2e9bd483159939 Roman Gushchin  2021-02-24  2913  		 * objcg vector should be reused.
2e9bd483159939 Roman Gushchin  2021-02-24  2914  		 */
10befea91b61c4 Roman Gushchin  2020-08-06  2915  		kfree(vec);
2e9bd483159939 Roman Gushchin  2021-02-24  2916  		return 0;
2e9bd483159939 Roman Gushchin  2021-02-24  2917  	}
10befea91b61c4 Roman Gushchin  2020-08-06  2918  
2e9bd483159939 Roman Gushchin  2021-02-24  2919  	kmemleak_not_leak(vec);
10befea91b61c4 Roman Gushchin  2020-08-06  2920  	return 0;
10befea91b61c4 Roman Gushchin  2020-08-06  2921  }
10befea91b61c4 Roman Gushchin  2020-08-06  2922  

:::::: The code at line 2888 was first introduced by commit
:::::: 4b5f8d9a895ada8e0abb58ccd35d9fe229e3a595 mm/memcg: Convert slab objcgs from struct page to struct slab

:::::: TO: Vlastimil Babka <vbabka@suse.cz>
:::::: CC: Vlastimil Babka <vbabka@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
