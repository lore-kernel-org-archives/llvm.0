Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B584879D6;
	Fri, 17 Mar 2023 21:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679089944; x=1710625944;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8eQMoQiTmuxn++Usa45XJwNDsrf1ZBPdDqy4GY4DSGw=;
  b=BB+rA2p71egyP6jtqkw0FJVjWE5+mykNihRBRuaNZ69YtdByIOEWQSD7
   fIFJRKhqgT5nHWiMDWJpg9TleK64hxTMD1SkDnZoM+l9jqdmthkctFpzi
   0prNTE4NUVT/esmDt3obE58Yv2t6D/fArmEHnCMopxMnB8BcVase1KU39
   Tdd/dvpI008kLOpha9M+D8dELS4wXTogwC4QVfTC9jBXkASGxOS3NsQe3
   LSvoFkbamWc/e0EcKYUviJE7roxzLqcmOMjKfaO65mJnPlg9ucob9tWhF
   p45LCu1byzh7E1ZzjpUcNO6u3Rh8weJwPlrvAdMzUPSIY+e+av1OVkXTM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="335865461"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="335865461"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 14:52:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="823802762"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="823802762"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 17 Mar 2023 14:52:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdHzn-0009ak-2W;
	Fri, 17 Mar 2023 21:52:19 +0000
Date: Sat, 18 Mar 2023 05:51:47 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Hocko <mhocko@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Leonardo Bras <leobras@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Frederic Weisbecker <fweisbecker@suse.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeelb@google.com>,
	Muchun Song <muchun.song@linux.dev>,
	LKML <linux-kernel@vger.kernel.org>, Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH 2/2] memcg: do not drain charge pcp caches on remote
 isolated cpus
Message-ID: <202303180520.5lKAJwrg-lkp@intel.com>
References: <20230317134448.11082-3-mhocko@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230317134448.11082-3-mhocko@kernel.org>

Hi Michal,

I love your patch! Yet something to improve:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.3-rc2 next-20230317]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Hocko/sched-isolation-Add-cpu_is_isolated-API/20230317-214621
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230317134448.11082-3-mhocko%40kernel.org
patch subject: [PATCH 2/2] memcg: do not drain charge pcp caches on remote isolated cpus
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20230318/202303180520.5lKAJwrg-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/b376cfcf40a43276e1280950bb926fdf3521940a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Michal-Hocko/sched-isolation-Add-cpu_is_isolated-API/20230317-214621
        git checkout b376cfcf40a43276e1280950bb926fdf3521940a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303180520.5lKAJwrg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/memcontrol.c:2369:14: error: implicit declaration of function 'cpu_is_isolated' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                           else if (!cpu_is_isolated(cpu))
                                     ^
   1 error generated.


vim +/cpu_is_isolated +2369 mm/memcontrol.c

  2331	
  2332	/*
  2333	 * Drains all per-CPU charge caches for given root_memcg resp. subtree
  2334	 * of the hierarchy under it.
  2335	 */
  2336	static void drain_all_stock(struct mem_cgroup *root_memcg)
  2337	{
  2338		int cpu, curcpu;
  2339	
  2340		/* If someone's already draining, avoid adding running more workers. */
  2341		if (!mutex_trylock(&percpu_charge_mutex))
  2342			return;
  2343		/*
  2344		 * Notify other cpus that system-wide "drain" is running
  2345		 * We do not care about races with the cpu hotplug because cpu down
  2346		 * as well as workers from this path always operate on the local
  2347		 * per-cpu data. CPU up doesn't touch memcg_stock at all.
  2348		 */
  2349		migrate_disable();
  2350		curcpu = smp_processor_id();
  2351		for_each_online_cpu(cpu) {
  2352			struct memcg_stock_pcp *stock = &per_cpu(memcg_stock, cpu);
  2353			struct mem_cgroup *memcg;
  2354			bool flush = false;
  2355	
  2356			rcu_read_lock();
  2357			memcg = stock->cached;
  2358			if (memcg && stock->nr_pages &&
  2359			    mem_cgroup_is_descendant(memcg, root_memcg))
  2360				flush = true;
  2361			else if (obj_stock_flush_required(stock, root_memcg))
  2362				flush = true;
  2363			rcu_read_unlock();
  2364	
  2365			if (flush &&
  2366			    !test_and_set_bit(FLUSHING_CACHED_CHARGE, &stock->flags)) {
  2367				if (cpu == curcpu)
  2368					drain_local_stock(&stock->work);
> 2369				else if (!cpu_is_isolated(cpu))
  2370					schedule_work_on(cpu, &stock->work);
  2371			}
  2372		}
  2373		migrate_enable();
  2374		mutex_unlock(&percpu_charge_mutex);
  2375	}
  2376	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
