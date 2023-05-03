Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D4627704;
	Wed,  3 May 2023 17:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683134671; x=1714670671;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ictUyULjurCrIeBuakXm/Hst2gHg3co35QIND7kUM3M=;
  b=nBT6OtB3fbtBlwLZkeVTPgtT0faMc3RRKb24e1W+3iNVfIhRnbIJZArJ
   m3P5K0IOMQkVO37UYIqfNi2da2NJm92bank8porGeMPO25XGe9z28lEzi
   dQmAHX99vEspH/9IUVK5tsBHreEtJl66stkcI18G71EkIoYOsATwYTDhO
   EmE2itCTMR+VpyaFGPXpg5/pzF42qNHMAOyYo++F7+4CVKJSgOI4S+4NW
   goKS/83uuwM1WmXxJXqg5Ljm2SqAlCGgUyMB1mIs4P9OAVk1zZ++vOpxh
   7Qbi/SbcUvE0Dj7PaZzNXuELPbjwqGvBOFFeOV/j+Ys8ezDhglwVGiKWX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="328337462"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; 
   d="scan'208";a="328337462"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 10:24:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="808353882"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; 
   d="scan'208";a="808353882"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 03 May 2023 10:24:26 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puGDJ-0002AG-1W;
	Wed, 03 May 2023 17:24:25 +0000
Date: Thu, 4 May 2023 01:23:44 +0800
From: kernel test robot <lkp@intel.com>
To: Raghavendra K T <raghavendra.kt@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH V1 1/2] sched/numa: Introduce per vma scan counter
Message-ID: <202305040103.BRgS5gsL-lkp@intel.com>
References: <abd037023141f25f79c6bbbb801c8405e4c449a1.1683033105.git.raghavendra.kt@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abd037023141f25f79c6bbbb801c8405e4c449a1.1683033105.git.raghavendra.kt@amd.com>

Hi Raghavendra,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master next-20230428]
[cannot apply to tip/sched/core tip/master tip/auto-latest v6.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Raghavendra-K-T/sched-numa-Introduce-per-vma-scan-counter/20230503-100717
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/abd037023141f25f79c6bbbb801c8405e4c449a1.1683033105.git.raghavendra.kt%40amd.com
patch subject: [RFC PATCH V1 1/2] sched/numa: Introduce per vma scan counter
config: x86_64-randconfig-a016-20230501 (https://download.01.org/0day-ci/archive/20230504/202305040103.BRgS5gsL-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2e4296f7fd895ddd9ab683b8bd350f3aa654d91d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Raghavendra-K-T/sched-numa-Introduce-per-vma-scan-counter/20230503-100717
        git checkout 2e4296f7fd895ddd9ab683b8bd350f3aa654d91d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305040103.BRgS5gsL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:2940:6: warning: variable 'windows' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (scan_size < MAX_SCAN_WINDOW)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:2944:2: note: uninitialized use occurs here
           windows /= 2;
           ^~~~~~~
   kernel/sched/fair.c:2940:2: note: remove the 'if' if its condition is always true
           if (scan_size < MAX_SCAN_WINDOW)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:2937:22: note: initialize the variable 'windows' to silence this warning
           unsigned int windows;
                               ^
                                = 0
   kernel/sched/fair.c:6191:6: warning: no previous prototype for function 'init_cfs_bandwidth' [-Wmissing-prototypes]
   void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
        ^
   kernel/sched/fair.c:6191:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
   ^
   static 
   kernel/sched/fair.c:12003:6: warning: no previous prototype for function 'task_vruntime_update' [-Wmissing-prototypes]
   void task_vruntime_update(struct rq *rq, struct task_struct *p, bool in_fi)
        ^
   kernel/sched/fair.c:12003:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void task_vruntime_update(struct rq *rq, struct task_struct *p, bool in_fi)
   ^
   static 
   kernel/sched/fair.c:12613:6: warning: no previous prototype for function 'free_fair_sched_group' [-Wmissing-prototypes]
   void free_fair_sched_group(struct task_group *tg) { }
        ^
   kernel/sched/fair.c:12613:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void free_fair_sched_group(struct task_group *tg) { }
   ^
   static 
   kernel/sched/fair.c:12615:5: warning: no previous prototype for function 'alloc_fair_sched_group' [-Wmissing-prototypes]
   int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
       ^
   kernel/sched/fair.c:12615:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
   ^
   static 
   kernel/sched/fair.c:12620:6: warning: no previous prototype for function 'online_fair_sched_group' [-Wmissing-prototypes]
   void online_fair_sched_group(struct task_group *tg) { }
        ^
   kernel/sched/fair.c:12620:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void online_fair_sched_group(struct task_group *tg) { }
   ^
   static 
   kernel/sched/fair.c:12622:6: warning: no previous prototype for function 'unregister_fair_sched_group' [-Wmissing-prototypes]
   void unregister_fair_sched_group(struct task_group *tg) { }
        ^
   kernel/sched/fair.c:12622:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void unregister_fair_sched_group(struct task_group *tg) { }
   ^
   static 
   kernel/sched/fair.c:535:20: warning: unused function 'list_del_leaf_cfs_rq' [-Wunused-function]
   static inline void list_del_leaf_cfs_rq(struct cfs_rq *cfs_rq)
                      ^
   kernel/sched/fair.c:556:19: warning: unused function 'tg_is_idle' [-Wunused-function]
   static inline int tg_is_idle(struct task_group *tg)
                     ^
   kernel/sched/fair.c:3606:20: warning: unused function 'load_avg_is_decayed' [-Wunused-function]
   static inline bool load_avg_is_decayed(struct sched_avg *sa)
                      ^
   kernel/sched/fair.c:6164:20: warning: unused function 'cfs_bandwidth_used' [-Wunused-function]
   static inline bool cfs_bandwidth_used(void)
                      ^
   kernel/sched/fair.c:6172:20: warning: unused function 'sync_throttle' [-Wunused-function]
   static inline void sync_throttle(struct task_group *tg, int cpu) {}
                      ^
   kernel/sched/fair.c:6197:37: warning: unused function 'tg_cfs_bandwidth' [-Wunused-function]
   static inline struct cfs_bandwidth *tg_cfs_bandwidth(struct task_group *tg)
                                       ^
   kernel/sched/fair.c:6201:20: warning: unused function 'destroy_cfs_bandwidth' [-Wunused-function]
   static inline void destroy_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
                      ^
   kernel/sched/fair.c:9235:19: warning: unused function 'check_misfit_status' [-Wunused-function]
   static inline int check_misfit_status(struct rq *rq, struct sched_domain *sd)
                     ^
   15 warnings generated.


vim +2940 kernel/sched/fair.c

  2933	
  2934	static bool vma_is_accessed(struct vm_area_struct *vma)
  2935	{
  2936		unsigned long pids;
  2937		unsigned int windows;
  2938		unsigned int scan_size = READ_ONCE(sysctl_numa_balancing_scan_size);
  2939	
> 2940		if (scan_size < MAX_SCAN_WINDOW)
  2941			windows = MAX_SCAN_WINDOW / scan_size;
  2942	
  2943		/* Allow only half of the windows for disjoint set cases */
  2944		windows /= 2;
  2945	
  2946		windows = max(VMA_DISJOINT_SET_ACCESS_THRESH, windows);
  2947	
  2948		/*
  2949		 * Make sure to allow scanning of disjoint vma set for the first
  2950		 * few times.
  2951		 * OR At mm level allow unconditional access first two times, so that
  2952		 * all the (pages) of VMAs get prot_none fault introduced irrespective
  2953		 * of accesses.
  2954		 * This is also done to avoid any side effect of task scanning
  2955		 * amplifying the unfairness of disjoint set of VMAs' access.
  2956		 */
  2957		if (READ_ONCE(vma->numab_state->scan_counter) < windows ||
  2958			READ_ONCE(current->mm->numa_scan_seq) < 2)
  2959			return true;
  2960	
  2961		pids = vma->numab_state->access_pids[0] | vma->numab_state->access_pids[1];
  2962	
  2963		return test_bit(hash_32(current->pid, ilog2(BITS_PER_LONG)), &pids);
  2964	}
  2965	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
