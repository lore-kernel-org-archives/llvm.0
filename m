Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59963313522;
	Tue, 11 Nov 2025 15:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762873266; cv=none; b=pDK0KE7XbcBc8j54Fu2q3Sh23dcsKr+Pu8byaExXi/lUInIaFbuiy96ETRsR8No/gnwuPYRaxeYxVfj98BfjT8ux+kA7TwEH2keKJ9ZyTmzQKMJmNDJ2HVntMc3aQeELlyp7y0f0i35rQq760r//buzxvw3Gp5f2qJy8z2X8xo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762873266; c=relaxed/simple;
	bh=tUo7jGlVCUEOtkNucTxLLr3+ngNXEy2i6Qp04RNwv+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O5ECfPEqsffMtKppk96WDj0KIr3S6kmObeFc7pdcYnRupWcE/8VZ+bs5NqpDO65j6l4o8mM2/AKOw+hrrFBuS9EpzCct1se8tPNHoF/bNmHe+9iLt+asaOTWoJJ/3OX/NYGQJK3PtZtInDetwqtYJg+bR9EnyP59FeOXZukC4x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sp2XKFBx; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sp2XKFBx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762873265; x=1794409265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tUo7jGlVCUEOtkNucTxLLr3+ngNXEy2i6Qp04RNwv+4=;
  b=Sp2XKFBx4SUjY7c2dZATgXj0pW82c9o7vraObXJ2bMK9r+C0fzr7uyYJ
   E85D80ar0Nv9mkWygU227ZO9QBgr5rNaJHowxmWlTj4L4N/g1EFQNS4g3
   u1qMYJG1NgYH/N8ylHrvlBzaEGxcyDv6HRjrdesV7VhwpwQKHqMGTEfUJ
   XxTx8P/d/KIKPATjKgjfI+ErjyO77ucelHIwyUnK8Y57RQE5KPrJLKcxK
   XALE733kAGdjqBtTq1cD+E18wkqLBbfVUTxFu9NSJWRjhm4RKAouh655t
   Sbf3NLNpC44l8UV1dtMI9dUK9tEN7NidsQPLzWqYVkX9CiPxt1hSwli2l
   A==;
X-CSE-ConnectionGUID: u8Z5+R6aSH6R1fN1nrH7vw==
X-CSE-MsgGUID: ycBz8AL5R46jpkLQ9IujFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="76282577"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="76282577"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 07:00:47 -0800
X-CSE-ConnectionGUID: uOTAuAtsTY6xA20sS9VfOg==
X-CSE-MsgGUID: yoXEEIhaTum35lnBYnvcRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="188819621"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Nov 2025 07:00:45 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIprP-0003Fz-1n;
	Tue, 11 Nov 2025 15:00:43 +0000
Date: Tue, 11 Nov 2025 23:00:08 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:scratch/gourry/isolation/linus 6/10]
 kernel/cgroup/cpuset.c:2812:46: error: too many arguments to function call,
 expected single argument 'nodes', have 2 arguments
Message-ID: <202511112239.aI1ulpX0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux scratch/gourry/isolation/linus
head:   c74a85115777a0e4ff7ba671c4631adb4ba32ecc
commit: 81b4628c13856d1bc84678ed6655180ca0554688 [6/10] cpuset: introduce cpuset.mems.default
config: i386-defconfig (https://download.01.org/0day-ci/archive/20251111/202511112239.aI1ulpX0-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251111/202511112239.aI1ulpX0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511112239.aI1ulpX0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/cgroup/cpuset.c:2812:46: error: too many arguments to function call, expected single argument 'nodes', have 2 arguments
    2812 |                 mt_nodemask_sysram_mask(&cp->mems_default, &cp->effective_mems);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~                    ^~~~~~~~~~~~~~~~~~~
   include/linux/memory-tiers.h:99:20: note: 'mt_nodemask_sysram_mask' declared here
      99 | static inline void mt_nodemask_sysram_mask(nodemask_t *nodes) { return; }
         |                    ^                       ~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:3599:46: error: too many arguments to function call, expected single argument 'nodes', have 2 arguments
    3599 |                 mt_nodemask_sysram_mask(&cs->mems_default, &cs->effective_mems);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~                    ^~~~~~~~~~~~~~~~~~~
   include/linux/memory-tiers.h:99:20: note: 'mt_nodemask_sysram_mask' declared here
      99 | static inline void mt_nodemask_sysram_mask(nodemask_t *nodes) { return; }
         |                    ^                       ~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:3631:45: error: too many arguments to function call, expected single argument 'nodes', have 2 arguments
    3631 |         mt_nodemask_sysram_mask(&cs->mems_default, &cs->effective_mems);
         |         ~~~~~~~~~~~~~~~~~~~~~~~                    ^~~~~~~~~~~~~~~~~~~
   include/linux/memory-tiers.h:99:20: note: 'mt_nodemask_sysram_mask' declared here
      99 | static inline void mt_nodemask_sysram_mask(nodemask_t *nodes) { return; }
         |                    ^                       ~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:3835:5: error: too many arguments to function call, expected single argument 'nodes', have 2 arguments
    3834 |         mt_nodemask_sysram_mask(&top_cpuset.mems_default,
         |         ~~~~~~~~~~~~~~~~~~~~~~~
    3835 |                                 &top_cpuset.effective_mems);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/memory-tiers.h:99:20: note: 'mt_nodemask_sysram_mask' declared here
      99 | static inline void mt_nodemask_sysram_mask(nodemask_t *nodes) { return; }
         |                    ^                       ~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:3865:45: error: too many arguments to function call, expected single argument 'nodes', have 2 arguments
    3865 |         mt_nodemask_sysram_mask(&cs->mems_default, &cs->effective_mems);
         |         ~~~~~~~~~~~~~~~~~~~~~~~                    ^~~~~~~~~~~~~~~~~~~
   include/linux/memory-tiers.h:99:20: note: 'mt_nodemask_sysram_mask' declared here
      99 | static inline void mt_nodemask_sysram_mask(nodemask_t *nodes) { return; }
         |                    ^                       ~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:4058:6: error: too many arguments to function call, expected single argument 'nodes', have 2 arguments
    4057 |                 mt_nodemask_sysram_mask(&top_cpuset.mems_default,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~
    4058 |                                         &top_cpuset.effective_mems);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/memory-tiers.h:99:20: note: 'mt_nodemask_sysram_mask' declared here
      99 | static inline void mt_nodemask_sysram_mask(nodemask_t *nodes) { return; }
         |                    ^                       ~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:4130:5: error: too many arguments to function call, expected single argument 'nodes', have 2 arguments
    4129 |         mt_nodemask_sysram_mask(&top_cpuset.mems_default,
         |         ~~~~~~~~~~~~~~~~~~~~~~~
    4130 |                                 &top_cpuset.effective_mems);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/memory-tiers.h:99:20: note: 'mt_nodemask_sysram_mask' declared here
      99 | static inline void mt_nodemask_sysram_mask(nodemask_t *nodes) { return; }
         |                    ^                       ~~~~~~~~~~~~~~~~~
   7 errors generated.


vim +/nodes +2812 kernel/cgroup/cpuset.c

  2769	
  2770	/*
  2771	 * update_nodemasks_hier - Update effective nodemasks and tasks in the subtree
  2772	 * @cs: the cpuset to consider
  2773	 * @new_mems: a temp variable for calculating new effective_mems
  2774	 *
  2775	 * When configured nodemask is changed, the effective nodemasks of this cpuset
  2776	 * and all its descendants need to be updated.
  2777	 *
  2778	 * On legacy hierarchy, effective_mems will be the same with mems_allowed.
  2779	 *
  2780	 * Called with cpuset_mutex held
  2781	 */
  2782	static void update_nodemasks_hier(struct cpuset *cs, nodemask_t *new_mems)
  2783	{
  2784		struct cpuset *cp;
  2785		struct cgroup_subsys_state *pos_css;
  2786	
  2787		rcu_read_lock();
  2788		cpuset_for_each_descendant_pre(cp, pos_css, cs) {
  2789			struct cpuset *parent = parent_cs(cp);
  2790	
  2791			nodes_and(*new_mems, cp->mems_allowed, parent->effective_mems);
  2792	
  2793			/*
  2794			 * If it becomes empty, inherit the effective mask of the
  2795			 * parent, which is guaranteed to have some MEMs.
  2796			 */
  2797			if (is_in_v2_mode() && nodes_empty(*new_mems))
  2798				*new_mems = parent->effective_mems;
  2799	
  2800			/* Skip the whole subtree if the nodemask remains the same. */
  2801			if (nodes_equal(*new_mems, cp->effective_mems)) {
  2802				pos_css = css_rightmost_descendant(pos_css);
  2803				continue;
  2804			}
  2805	
  2806			if (!css_tryget_online(&cp->css))
  2807				continue;
  2808			rcu_read_unlock();
  2809	
  2810			spin_lock_irq(&callback_lock);
  2811			cp->effective_mems = *new_mems;
> 2812			mt_nodemask_sysram_mask(&cp->mems_default, &cp->effective_mems);
  2813			spin_unlock_irq(&callback_lock);
  2814	
  2815			WARN_ON(!is_in_v2_mode() &&
  2816				!nodes_equal(cp->mems_allowed, cp->effective_mems));
  2817	
  2818			cpuset_update_tasks_nodemask(cp);
  2819	
  2820			rcu_read_lock();
  2821			css_put(&cp->css);
  2822		}
  2823		rcu_read_unlock();
  2824	}
  2825	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
