Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C3B4C98;
	Sat,  8 Nov 2025 00:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762563351; cv=none; b=um+xfViCd9UqwjXpUkMHHrcop4xo6hrmuvOJQ5nXT0VvEUQQhtTXKRVe9zDUT3LEUqEd2m4klfRbqE5AS5w2f2Xij7e9CptpJKfBQ63wsSbAcXVKCZW6JcmAW6UjAmvj+o+5vRCYIAta5Blt0r0zV8zL4rfBMjP75Dn4zIDhQNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762563351; c=relaxed/simple;
	bh=idVQy+7g/knnElMiisnbqGbKnJRrTqt0LGwoCX4+K9E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BGeA+rbd7x0rL8MC4HH7rYhYOTgf1yIKyLBFhpOj2+rcKm/CsHwFiKORRSVnMs4wXRxknKlvWGuTPXJtz7DgsylIUIhD7xBftt9m5+BvX8Omr1iSXnGIOs44fGq5QK44X4oNroYADzTr5KOAzxbUbeylezHtyYZca55eOVvu+i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BrRm+4dt; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BrRm+4dt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762563349; x=1794099349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=idVQy+7g/knnElMiisnbqGbKnJRrTqt0LGwoCX4+K9E=;
  b=BrRm+4dtWZgsRz+Vrdg0owsEBny7My4u4+4MiXLkNaJmCftL6cCBgPNR
   Bu2Z/RMH24IsUb7h7FoNbYyBdFxnnaAhS2rcHs+2b2GsNngdnspaJCMek
   WEIB9utNkq4xXezNzLL3Bn94wSiHjJk6xs86kfG6gxNKCebPvx1EWKLWt
   sT4tSKLrdk3yAmoTBLz9lNLz18/2lg8+2sg9WXeguHqs8e0Hyu2S17BiR
   SKJCgGPe0zlIdaSAiQH0OLbsM3mESsN0ODwLuOXEPWrU1/F8cN0IHfHr1
   oQupi5vqEI6jIxEDXy78BBtElVTT/fpLSpyKbVsPd9ZfSI3ttHl/V3uyy
   Q==;
X-CSE-ConnectionGUID: /dk52jUURVeUBPP+/leQyA==
X-CSE-MsgGUID: /SzVYLKPR8Cl4PmWCdopJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64756110"
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; 
   d="scan'208";a="64756110"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 16:55:49 -0800
X-CSE-ConnectionGUID: gBIEgg9NQG2bXnQiKFMnyQ==
X-CSE-MsgGUID: NuJ6AZnfRMaVBasVyr5wBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; 
   d="scan'208";a="187485582"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Nov 2025 16:55:49 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHXF3-0000Xz-2x;
	Sat, 08 Nov 2025 00:55:45 +0000
Date: Sat, 8 Nov 2025 08:54:56 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:scratch/gourry/isolation/linus 5/11]
 mm/oom_kill.c:1123:18: error: use of undeclared identifier
 'default_sysram_nodes'
Message-ID: <202511080812.LhooV61h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux scratch/gourry/isolation/linus
head:   67062e895b94cd27af5fa58d8a567086a53d0914
commit: b5fcc368ba4cbe6b7a89e1220e01dee600b9e4c5 [5/11] mm: default slub, oom_kill, compaction, and page_alloc to sysram
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20251108/202511080812.LhooV61h-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d78e0ded5215824a63ac04fb87effd9eacf875eb)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511080812.LhooV61h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511080812.LhooV61h-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/oom_kill.c:1123:18: error: use of undeclared identifier 'default_sysram_nodes'
    1123 |                 oc->nodemask = default_sysram_nodes;
         |                                ^~~~~~~~~~~~~~~~~~~~
   mm/oom_kill.c:1160:18: error: use of undeclared identifier 'default_sysram_nodes'
    1160 |                 oc->nodemask = default_sysram_nodes;
         |                                ^~~~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> mm/page_alloc.c:4614:18: error: use of undeclared identifier 'default_sysram_nodes'
    4614 |                 ac->nodemask = default_sysram_nodes;
         |                                ^~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:4798:18: error: use of undeclared identifier 'default_sysram_nodes'
    4798 |                 ac->nodemask = default_sysram_nodes;
         |                                ^~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:4951:18: error: use of undeclared identifier 'default_sysram_nodes'
    4951 |                 ac->nodemask = default_sysram_nodes;
         |                                ^~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:5198:38: error: use of undeclared identifier 'default_sysram_nodes'
    5198 |         ac.nodemask = nodemask ? nodemask : default_sysram_nodes;
         |                                             ^~~~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +/default_sysram_nodes +1123 mm/oom_kill.c

  1109	
  1110	/**
  1111	 * out_of_memory - kill the "best" process when we run out of memory
  1112	 * @oc: pointer to struct oom_control
  1113	 *
  1114	 * If we run out of memory, we have the choice between either
  1115	 * killing a random task (bad), letting the system crash (worse)
  1116	 * OR try to be smart about which process to kill. Note that we
  1117	 * don't have to be perfect here, we just have to be good.
  1118	 */
  1119	bool out_of_memory(struct oom_control *oc)
  1120	{
  1121		unsigned long freed = 0;
  1122		if (!oc->nodemask)
> 1123			oc->nodemask = default_sysram_nodes;
  1124	
  1125		if (oom_killer_disabled)
  1126			return false;
  1127	
  1128		if (!is_memcg_oom(oc)) {
  1129			blocking_notifier_call_chain(&oom_notify_list, 0, &freed);
  1130			if (freed > 0 && !is_sysrq_oom(oc))
  1131				/* Got some memory back in the last second. */
  1132				return true;
  1133		}
  1134	
  1135		/*
  1136		 * If current has a pending SIGKILL or is exiting, then automatically
  1137		 * select it.  The goal is to allow it to allocate so that it may
  1138		 * quickly exit and free its memory.
  1139		 */
  1140		if (task_will_free_mem(current)) {
  1141			mark_oom_victim(current);
  1142			queue_oom_reaper(current);
  1143			return true;
  1144		}
  1145	
  1146		/*
  1147		 * The OOM killer does not compensate for IO-less reclaim.
  1148		 * But mem_cgroup_oom() has to invoke the OOM killer even
  1149		 * if it is a GFP_NOFS allocation.
  1150		 */
  1151		if (!(oc->gfp_mask & __GFP_FS) && !is_memcg_oom(oc))
  1152			return true;
  1153	
  1154		/*
  1155		 * Check if there were limitations on the allocation (only relevant for
  1156		 * NUMA and memcg) that may require different handling.
  1157		 */
  1158		oc->constraint = constrained_alloc(oc);
  1159		if (oc->constraint != CONSTRAINT_MEMORY_POLICY)
  1160			oc->nodemask = default_sysram_nodes;
  1161		check_panic_on_oom(oc);
  1162	
  1163		if (!is_memcg_oom(oc) && sysctl_oom_kill_allocating_task &&
  1164		    current->mm && !oom_unkillable_task(current) &&
  1165		    oom_cpuset_eligible(current, oc) &&
  1166		    current->signal->oom_score_adj != OOM_SCORE_ADJ_MIN) {
  1167			get_task_struct(current);
  1168			oc->chosen = current;
  1169			oom_kill_process(oc, "Out of memory (oom_kill_allocating_task)");
  1170			return true;
  1171		}
  1172	
  1173		select_bad_process(oc);
  1174		/* Found nothing?!?! */
  1175		if (!oc->chosen) {
  1176			dump_header(oc);
  1177			pr_warn("Out of memory and no killable processes...\n");
  1178			/*
  1179			 * If we got here due to an actual allocation at the
  1180			 * system level, we cannot survive this and will enter
  1181			 * an endless loop in the allocator. Bail out now.
  1182			 */
  1183			if (!is_sysrq_oom(oc) && !is_memcg_oom(oc))
  1184				panic("System is deadlocked on memory\n");
  1185		}
  1186		if (oc->chosen && oc->chosen != (void *)-1UL)
  1187			oom_kill_process(oc, !is_memcg_oom(oc) ? "Out of memory" :
  1188					 "Memory cgroup out of memory");
  1189		return !!oc->chosen;
  1190	}
  1191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
