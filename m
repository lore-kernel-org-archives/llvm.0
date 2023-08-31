Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691D0111F;
	Thu, 31 Aug 2023 03:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693451332; x=1724987332;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mYEk4LI2pL8XWPF1zKc5qz6vdX12xJGX7KbAifejJ34=;
  b=UZtGHNNWwwj2ldnqfJWH/0ZvdoRN1Lqr0yzfyzd2CR/bHI7kxUmiIrgd
   rjb6onbHY1aKEMR+IBpzvpRF/GP9O5pG/uRD41SYRnRbFYHEWsZZwS5ax
   Z8fPNK5/BBnPhbsR20x1zEC96at88HwA7Zm4E+P2mst+pZCjdO713a9JT
   A6OJOhqi6tcWkiWWyyZOMB51urbWs2aiJ0ZqQ6KN1HF9ihwLJcjjs5+21
   JtJb+42qsORIfntfpsBM1x3fjMQge5HLbkPKle2viY7QzQ8TUlQZ+9LI9
   GBru/cOe5XlXogZ8pwnzEOFRUPBe01cartEBYjNMUHRu7qEoRegvPXE3O
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="462175913"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="462175913"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 20:08:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="913042869"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="913042869"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 30 Aug 2023 20:08:47 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbY34-000AWX-1Y;
	Thu, 31 Aug 2023 03:08:46 +0000
Date: Thu, 31 Aug 2023 11:08:43 +0800
From: kernel test robot <lkp@intel.com>
To: Yosry Ahmed <yosryahmed@google.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeelb@google.com>,
	Muchun Song <muchun.song@linux.dev>,
	Ivan Babrou <ivan@cloudflare.com>, Tejun Heo <tj@kernel.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Waiman Long <longman@redhat.com>, cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosryahmed@google.com>
Subject: Re: [PATCH v3 4/4] mm: memcg: use non-unified stats flushing for
 userspace reads
Message-ID: <202308311025.538QuXBV-lkp@intel.com>
References: <20230830175335.1536008-5-yosryahmed@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230830175335.1536008-5-yosryahmed@google.com>

Hi Yosry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master next-20230830]
[cannot apply to v6.5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yosry-Ahmed/mm-memcg-properly-name-and-document-unified-stats-flushing/20230831-015518
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230830175335.1536008-5-yosryahmed%40google.com
patch subject: [PATCH v3 4/4] mm: memcg: use non-unified stats flushing for userspace reads
config: i386-randconfig-r013-20230831 (https://download.01.org/0day-ci/archive/20230831/202308311025.538QuXBV-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308311025.538QuXBV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308311025.538QuXBV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcontrol.c:667:6: warning: no previous prototype for function 'mem_cgroup_user_flush_stats' [-Wmissing-prototypes]
   void mem_cgroup_user_flush_stats(struct mem_cgroup *memcg)
        ^
   mm/memcontrol.c:667:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mem_cgroup_user_flush_stats(struct mem_cgroup *memcg)
   ^
   static 
   1 warning generated.


vim +/mem_cgroup_user_flush_stats +667 mm/memcontrol.c

   658	
   659	/*
   660	 * mem_cgroup_user_flush_stats - do a stats flush for a user read
   661	 * @memcg: memory cgroup to flush
   662	 *
   663	 * Flush the subtree of @memcg. A mutex is used for userspace readers to gate
   664	 * the global rstat spinlock. This protects in-kernel flushers from userspace
   665	 * readers hogging the lock.
   666	 */
 > 667	void mem_cgroup_user_flush_stats(struct mem_cgroup *memcg)
   668	{
   669		mutex_lock(&stats_user_flush_mutex);
   670		do_stats_flush(memcg);
   671		mutex_unlock(&stats_user_flush_mutex);
   672	}
   673	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
