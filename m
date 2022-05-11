Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB6F2F25
	for <llvm@lists.linux.dev>; Wed, 11 May 2022 17:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652291404; x=1683827404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/vM6rf2wBk5Cbv3Z8b62ikUGKNOMtivKf/Dzuq7Y748=;
  b=Hup/H26ymhLhGzp6//NbH9uPRJkISiGfwEerygwGbPwJcRaDkUSMN3rT
   XQbgEc3FgO4u086ygI2mtmWheXTbwJcfwFq+bn/pFLiV28MFnpVs2xMb3
   vyVbt8pHT8XqGDKC6RjPiehNf2MgH/GTDSxwkh4n4z2Bg0Hodyn87a+x4
   ym+vI/PlyWrIE3GzSiedxL21ZCKNUMmJFL2RYUr07sDumWXlVW3oXGAIk
   G5/BXbl2QXNNdgXUIXStMNsbHC00Q8w6HOfifYI9h4LzRIUjS9tfhno5u
   DX8YIr2KIjc6PEI0zVPfLD1f57edf0jcEGv/JZualZye7sBPuacmkyMBv
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="257317720"
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; 
   d="scan'208";a="257317720"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 10:50:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; 
   d="scan'208";a="697674781"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 11 May 2022 10:50:02 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1noqTJ-000JNU-O8;
	Wed, 11 May 2022 17:50:01 +0000
Date: Thu, 12 May 2022 01:49:04 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 10902/11094] mm/memcontrol.c:7467:6: error:
 redefinition of 'obj_cgroup_may_zswap'
Message-ID: <202205120115.D6nVZNke-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6107040c99d5dfc920721c198d45ed2d639b113a
commit: bf7930005b547c94d4cd312a2e0400cb8cf76d2a [10902/11094] zswap: memcg accounting
config: i386-randconfig-a001-20220509 (https://download.01.org/0day-ci/archive/20220512/202205120115.D6nVZNke-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd123c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=bf7930005b547c94d4cd312a2e0400cb8cf76d2a
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout bf7930005b547c94d4cd312a2e0400cb8cf76d2a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/memcontrol.c:7467:6: error: redefinition of 'obj_cgroup_may_zswap'
   bool obj_cgroup_may_zswap(struct obj_cgroup *objcg)
        ^
   include/linux/memcontrol.h:1816:20: note: previous definition is here
   static inline bool obj_cgroup_may_zswap(struct obj_cgroup *objcg)
                      ^
>> mm/memcontrol.c:7504:6: error: redefinition of 'obj_cgroup_charge_zswap'
   void obj_cgroup_charge_zswap(struct obj_cgroup *objcg, size_t size)
        ^
   include/linux/memcontrol.h:1820:20: note: previous definition is here
   static inline void obj_cgroup_charge_zswap(struct obj_cgroup *objcg,
                      ^
>> mm/memcontrol.c:7511:6: error: call to undeclared function 'obj_cgroup_charge'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (obj_cgroup_charge(objcg, GFP_KERNEL, size))
               ^
   mm/memcontrol.c:7511:6: note: did you mean 'mem_cgroup_charge'?
   include/linux/memcontrol.h:684:19: note: 'mem_cgroup_charge' declared here
   static inline int mem_cgroup_charge(struct folio *folio, struct mm_struct *mm,
                     ^
>> mm/memcontrol.c:7528:6: error: redefinition of 'obj_cgroup_uncharge_zswap'
   void obj_cgroup_uncharge_zswap(struct obj_cgroup *objcg, size_t size)
        ^
   include/linux/memcontrol.h:1824:20: note: previous definition is here
   static inline void obj_cgroup_uncharge_zswap(struct obj_cgroup *objcg,
                      ^
>> mm/memcontrol.c:7532:2: error: call to undeclared function 'obj_cgroup_uncharge'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           obj_cgroup_uncharge(objcg, size);
           ^
   mm/memcontrol.c:7532:2: note: did you mean 'mem_cgroup_uncharge'?
   include/linux/memcontrol.h:704:20: note: 'mem_cgroup_uncharge' declared here
   static inline void mem_cgroup_uncharge(struct folio *folio)
                      ^
   5 errors generated.


vim +/obj_cgroup_may_zswap +7467 mm/memcontrol.c

  7453	
  7454	#ifdef CONFIG_ZSWAP
  7455	/**
  7456	 * obj_cgroup_may_zswap - check if this cgroup can zswap
  7457	 * @objcg: the object cgroup
  7458	 *
  7459	 * Check if the hierarchical zswap limit has been reached.
  7460	 *
  7461	 * This doesn't check for specific headroom, and it is not atomic
  7462	 * either. But with zswap, the size of the allocation is only known
  7463	 * once compression has occured, and this optimistic pre-check avoids
  7464	 * spending cycles on compression when there is already no room left
  7465	 * or zswap is disabled altogether somewhere in the hierarchy.
  7466	 */
> 7467	bool obj_cgroup_may_zswap(struct obj_cgroup *objcg)
  7468	{
  7469		struct mem_cgroup *memcg, *original_memcg;
  7470		bool ret = true;
  7471	
  7472		original_memcg = get_mem_cgroup_from_objcg(objcg);
  7473		for (memcg = original_memcg; memcg != root_mem_cgroup;
  7474		     memcg = parent_mem_cgroup(memcg)) {
  7475			unsigned long max = READ_ONCE(memcg->zswap_max);
  7476			unsigned long pages;
  7477	
  7478			if (max == PAGE_COUNTER_MAX)
  7479				continue;
  7480			if (max == 0) {
  7481				ret = false;
  7482				break;
  7483			}
  7484	
  7485			cgroup_rstat_flush(memcg->css.cgroup);
  7486			pages = memcg_page_state(memcg, MEMCG_ZSWAP_B) / PAGE_SIZE;
  7487			if (pages < max)
  7488				continue;
  7489			ret = false;
  7490			break;
  7491		}
  7492		mem_cgroup_put(original_memcg);
  7493		return ret;
  7494	}
  7495	
  7496	/**
  7497	 * obj_cgroup_charge_zswap - charge compression backend memory
  7498	 * @objcg: the object cgroup
  7499	 * @size: size of compressed object
  7500	 *
  7501	 * This forces the charge after obj_cgroup_may_swap() allowed
  7502	 * compression and storage in zwap for this cgroup to go ahead.
  7503	 */
> 7504	void obj_cgroup_charge_zswap(struct obj_cgroup *objcg, size_t size)
  7505	{
  7506		struct mem_cgroup *memcg;
  7507	
  7508		VM_WARN_ON_ONCE(!(current->flags & PF_MEMALLOC));
  7509	
  7510		/* PF_MEMALLOC context, charging must succeed */
> 7511		if (obj_cgroup_charge(objcg, GFP_KERNEL, size))
  7512			VM_WARN_ON_ONCE(1);
  7513	
  7514		rcu_read_lock();
  7515		memcg = obj_cgroup_memcg(objcg);
  7516		mod_memcg_state(memcg, MEMCG_ZSWAP_B, size);
  7517		mod_memcg_state(memcg, MEMCG_ZSWAPPED, 1);
  7518		rcu_read_unlock();
  7519	}
  7520	
  7521	/**
  7522	 * obj_cgroup_uncharge_zswap - uncharge compression backend memory
  7523	 * @objcg: the object cgroup
  7524	 * @size: size of compressed object
  7525	 *
  7526	 * Uncharges zswap memory on page in.
  7527	 */
> 7528	void obj_cgroup_uncharge_zswap(struct obj_cgroup *objcg, size_t size)
  7529	{
  7530		struct mem_cgroup *memcg;
  7531	
> 7532		obj_cgroup_uncharge(objcg, size);
  7533	
  7534		rcu_read_lock();
  7535		memcg = obj_cgroup_memcg(objcg);
  7536		mod_memcg_state(memcg, MEMCG_ZSWAP_B, -size);
  7537		mod_memcg_state(memcg, MEMCG_ZSWAPPED, -1);
  7538		rcu_read_unlock();
  7539	}
  7540	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
