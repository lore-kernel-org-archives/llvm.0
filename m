Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38F11862;
	Sat, 17 May 2025 16:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747499098; cv=none; b=SPI6qDpOXoTG3SMKCJCRosBuLUqDYDbXLT+/FvvinOUI8yGpeId1TL4a156EEBrrJsqxItgw5aXEjkcwX/603lOh6u3dQxCU1MhBoByTp5Uz0zj1W0gYmZUxyf7oiJUrS7pxfH3C9KZh9AfpXN67dg1dNPNLrYDvGeLR0wwXQj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747499098; c=relaxed/simple;
	bh=IbOqqinKgslmDT/VoWAxXKXdOmFlMOV8OsFEpOuDF00=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tbZ1JXEK9l5nxEQEKoEms8R629wBMp01gO45Hda3iRaGIG5mCldd747X1Zjmj4r3sauoJ49mjTyuT0RHIf5HLvkMzcv1Wij/6nXZ075SgIZSmyd9+Vape0xVzwQYLgeJ4dJDuwopdK84nod6goU8cUhe71HXXpUwE0i34VyL4C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D7oIl2sV; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D7oIl2sV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747499097; x=1779035097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IbOqqinKgslmDT/VoWAxXKXdOmFlMOV8OsFEpOuDF00=;
  b=D7oIl2sVFXryGI/fRgsvqVsvy6yn4OMZgJa9iOZduKFSN1Bzco3yaeTq
   HBq1TpXDHYKfZL1ytO9vBHGC4F64axss9Fwhsg8APDkfW9fqco394rTCi
   0LGlWRhGkRKfXkG3sNnK85jezhgsTYy8YQpjXCon7Z+7LONg3q0XnHCfC
   NPl/yECo/TT331Mip2fxDyLsMjbRPSj1I+Vy7tPSrOSFmIzLDAQUCmJz4
   kamHNRMposmeNB+uWJrVuydnODsqnxeHCnJLf2jFZQ96DJclF3u+GjtvV
   RY+N+V0yeZpB4IiXVMT6+xcz6Hp18NkD3MkWVGA+xiHs+cml1RFmNpmfP
   w==;
X-CSE-ConnectionGUID: e4UBkd7USPOCzvEnnfgeKg==
X-CSE-MsgGUID: wbyqhCoER0SsmuwcQ44iEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="48704422"
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="48704422"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 09:24:56 -0700
X-CSE-ConnectionGUID: hOmdpblORoKtqhGSQWK/Eg==
X-CSE-MsgGUID: RnPkaYO2SXaTdzuMzJ9QTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="138812769"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 May 2025 09:24:54 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGKLD-000KFR-3D;
	Sat, 17 May 2025 16:24:51 +0000
Date: Sun, 18 May 2025 00:24:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/v6.15-rc4/famnae 2/17] include/linux/cgroup-defs.h:612:1:
 warning: '_Static_assert' with no message is a C23 extension
Message-ID: <202505180016.oeLHEkhk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v6.15-rc4/famnae
head:   285522439aeea637ff1ae3f98148865b4351ccd8
commit: fb8c4d9f70b684b4e007aecd159705dc1a327786 [2/17] cgroup: -Wfamnae for struct cgroup_root
config: i386-buildonly-randconfig-001-20250517 (https://download.01.org/0day-ci/archive/20250518/202505180016.oeLHEkhk-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505180016.oeLHEkhk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505180016.oeLHEkhk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:28:
>> include/linux/cgroup-defs.h:612:1: warning: '_Static_assert' with no message is a C23 extension [-Wc23-extensions]
     612 | TRAILING_OVERLAP_ASSERT(struct cgroup_root, cgrp.ancestors, cgrp_ancestor_storage);
         | ^
   include/linux/stddef.h:105:62: note: expanded from macro 'TRAILING_OVERLAP_ASSERT'
     105 |         _Static_assert(offsetof(TYPE, FLEX) == offsetof(TYPE, FIRST))
         |                                                                     ^
   1 warning generated.
--
   In file included from kernel/cpu.c:27:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:28:
>> include/linux/cgroup-defs.h:612:1: warning: '_Static_assert' with no message is a C23 extension [-Wc23-extensions]
     612 | TRAILING_OVERLAP_ASSERT(struct cgroup_root, cgrp.ancestors, cgrp_ancestor_storage);
         | ^
   include/linux/stddef.h:105:62: note: expanded from macro 'TRAILING_OVERLAP_ASSERT'
     105 |         _Static_assert(offsetof(TYPE, FLEX) == offsetof(TYPE, FIRST))
         |                                                                     ^
   kernel/cpu.c:112:20: warning: unused function 'cpuhp_lock_acquire' [-Wunused-function]
     112 | static inline void cpuhp_lock_acquire(bool bringup) { }
         |                    ^~~~~~~~~~~~~~~~~~
   kernel/cpu.c:113:20: warning: unused function 'cpuhp_lock_release' [-Wunused-function]
     113 | static inline void cpuhp_lock_release(bool bringup) { }
         |                    ^~~~~~~~~~~~~~~~~~
   3 warnings generated.
--
   In file included from kernel/events/core.c:31:
   In file included from include/linux/hugetlb.h:10:
   In file included from include/linux/cgroup.h:28:
>> include/linux/cgroup-defs.h:612:1: warning: '_Static_assert' with no message is a C23 extension [-Wc23-extensions]
     612 | TRAILING_OVERLAP_ASSERT(struct cgroup_root, cgrp.ancestors, cgrp_ancestor_storage);
         | ^
   include/linux/stddef.h:105:62: note: expanded from macro 'TRAILING_OVERLAP_ASSERT'
     105 |         _Static_assert(offsetof(TYPE, FLEX) == offsetof(TYPE, FIRST))
         |                                                                     ^
   kernel/events/core.c:10101:19: warning: unused function 'perf_event_set_bpf_handler' [-Wunused-function]
    10101 | static inline int perf_event_set_bpf_handler(struct perf_event *event,
          |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:10137:20: warning: unused function 'perf_event_free_bpf_handler' [-Wunused-function]
    10137 | static inline void perf_event_free_bpf_handler(struct perf_event *event)
          |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.
--
   In file included from kernel/sched/core.c:14:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:94:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:60:
   In file included from include/linux/cgroup.h:28:
>> include/linux/cgroup-defs.h:612:1: warning: '_Static_assert' with no message is a C23 extension [-Wc23-extensions]
     612 | TRAILING_OVERLAP_ASSERT(struct cgroup_root, cgrp.ancestors, cgrp_ancestor_storage);
         | ^
   include/linux/stddef.h:105:62: note: expanded from macro 'TRAILING_OVERLAP_ASSERT'
     105 |         _Static_assert(offsetof(TYPE, FLEX) == offsetof(TYPE, FIRST))
         |                                                                     ^
   kernel/sched/core.c:3654:20: warning: unused function 'rq_has_pinned_tasks' [-Wunused-function]
    3654 | static inline bool rq_has_pinned_tasks(struct rq *rq)
         |                    ^~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:5825:20: warning: unused function 'sched_tick_start' [-Wunused-function]
    5825 | static inline void sched_tick_start(int cpu) { }
         |                    ^~~~~~~~~~~~~~~~
   kernel/sched/core.c:5826:20: warning: unused function 'sched_tick_stop' [-Wunused-function]
    5826 | static inline void sched_tick_stop(int cpu) { }
         |                    ^~~~~~~~~~~~~~~
   kernel/sched/core.c:6544:20: warning: unused function 'sched_core_cpu_starting' [-Wunused-function]
    6544 | static inline void sched_core_cpu_starting(unsigned int cpu) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:6545:20: warning: unused function 'sched_core_cpu_deactivate' [-Wunused-function]
    6545 | static inline void sched_core_cpu_deactivate(unsigned int cpu) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:6546:20: warning: unused function 'sched_core_cpu_dying' [-Wunused-function]
    6546 | static inline void sched_core_cpu_dying(unsigned int cpu) {}
         |                    ^~~~~~~~~~~~~~~~~~~~
   7 warnings generated.
--
   In file included from kernel/sched/fair.c:48:
   In file included from include/linux/psi.h:9:
>> include/linux/cgroup-defs.h:612:1: warning: '_Static_assert' with no message is a C23 extension [-Wc23-extensions]
     612 | TRAILING_OVERLAP_ASSERT(struct cgroup_root, cgrp.ancestors, cgrp_ancestor_storage);
         | ^
   include/linux/stddef.h:105:62: note: expanded from macro 'TRAILING_OVERLAP_ASSERT'
     105 |         _Static_assert(offsetof(TYPE, FLEX) == offsetof(TYPE, FIRST))
         |                                                                     ^
   kernel/sched/fair.c:1404:20: warning: unused function 'is_core_idle' [-Wunused-function]
    1404 | static inline bool is_core_idle(int cpu)
         |                    ^~~~~~~~~~~~
   kernel/sched/fair.c:3671:20: warning: unused function 'account_numa_enqueue' [-Wunused-function]
    3671 | static inline void account_numa_enqueue(struct rq *rq, struct task_struct *p)
         |                    ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:3675:20: warning: unused function 'account_numa_dequeue' [-Wunused-function]
    3675 | static inline void account_numa_dequeue(struct rq *rq, struct task_struct *p)
         |                    ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:3679:20: warning: unused function 'update_scan_period' [-Wunused-function]
    3679 | static inline void update_scan_period(struct task_struct *p, int new_cpu)
         |                    ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:5821:19: warning: unused function 'throttled_lb_pair' [-Wunused-function]
    5821 | static inline int throttled_lb_pair(struct task_group *tg,
         |                   ^~~~~~~~~~~~~~~~~
   6 warnings generated.
--
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:28:
>> include/linux/cgroup-defs.h:612:1: warning: '_Static_assert' with no message is a C23 extension [-Wc23-extensions]
     612 | TRAILING_OVERLAP_ASSERT(struct cgroup_root, cgrp.ancestors, cgrp_ancestor_storage);
         | ^
   include/linux/stddef.h:105:62: note: expanded from macro 'TRAILING_OVERLAP_ASSERT'
     105 |         _Static_assert(offsetof(TYPE, FLEX) == offsetof(TYPE, FIRST))
         |                                                                     ^
   1 warning generated.


vim +/_Static_assert +612 include/linux/cgroup-defs.h

   571	
   572	/*
   573	 * A cgroup_root represents the root of a cgroup hierarchy, and may be
   574	 * associated with a kernfs_root to form an active hierarchy.  This is
   575	 * internal to cgroup core.  Don't access directly from controllers.
   576	 */
   577	struct cgroup_root {
   578		struct kernfs_root *kf_root;
   579	
   580		/* The bitmask of subsystems attached to this hierarchy */
   581		unsigned int subsys_mask;
   582	
   583		/* Unique id for this hierarchy. */
   584		int hierarchy_id;
   585	
   586		/* A list running through the active hierarchies */
   587		struct list_head root_list;
   588		struct rcu_head rcu;	/* Must be near the top */
   589	
   590		/* Number of cgroups in the hierarchy, used only for /proc/cgroups */
   591		atomic_t nr_cgrps;
   592	
   593		/* Hierarchy-specific flags */
   594		unsigned int flags;
   595	
   596		/* The path to use for release notifications. */
   597		char release_agent_path[PATH_MAX];
   598	
   599		/* The name for this hierarchy - may be empty */
   600		char name[MAX_CGROUP_ROOT_NAMELEN];
   601	
   602		/*
   603		 * The root cgroup. The containing cgroup_root will be destroyed on its
   604		 * release. cgrp->ancestors[0] will be used overflowing into the
   605		 * following field. cgrp_ancestor_storage immediately follows.
   606		 */
   607		TRAILING_OVERLAP(
   608			struct cgroup, cgrp, ancestors,
   609			struct cgroup *cgrp_ancestor_storage;
   610		);
   611	};
 > 612	TRAILING_OVERLAP_ASSERT(struct cgroup_root, cgrp.ancestors, cgrp_ancestor_storage);
   613	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
