Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7AE21CC56;
	Sat,  8 Nov 2025 18:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762627597; cv=none; b=Dne1xxdXO+bAkFJGAxBgq+H6dHerEoEMGN6iKm716G0wvUkHUu4lhrTNXsbRHpbo6iz8IDKjBUFmo98iF5COnu4r+Kp7pHbqEMa5lGjGAjcHFHAZy1B0OfNuYOJLf5IrPqLSkpcGCWQSmRtYUSplI/NIWIjLS8o2iQ3alYhH91k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762627597; c=relaxed/simple;
	bh=6Dana25+opIaIeaI3CPAKv5gElWCCFDGww5LtNljsCo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mypA+inez1P50mFBnrsx/DDkttwlD6K5DQH31Igu6/AoiK6xEY9iUS5jwKvnX2u3+o9S4Qd3yh3O3pIC/MnrqJRw7xTxBtvYBjtfTIFiHsD+Sk6QbZXQkRBDVt0GfqEgaeReEp+7baJgyX1hvisHG2g6lqoieGJGeQoQY2PWi/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h4INGUt3; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h4INGUt3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762627595; x=1794163595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6Dana25+opIaIeaI3CPAKv5gElWCCFDGww5LtNljsCo=;
  b=h4INGUt3REWj+u0XaYS+RtOrPi4msddYOWMOZaAU0HoL9GDzgtWkhmCM
   mxAmbWugQd+x7UgJ6d5z8rCI2cRLADxzQO/2Tf3SwDF6s/yvVlxTFDkat
   iF1/VQCtsfP350XgnRKbv4afp0zllrqfj6W4Y8cuV1TVq9e0jbEZM6II2
   FldA5AkZ4E9jA091FL4OFcNBSQA4SZTPL/SK9r9eVfsDRVzpoSZJNZuJ5
   gu/4cV6E9HkpFRtvlsYBVEoRfY/W+um7lh+lSFP45we+XSPcxSRedXPRW
   ay4HFZToOPAeE92Ltb6Npyf2bDgDcYTfbBQafb4TI/3TJIG+o6DSzUJ4t
   Q==;
X-CSE-ConnectionGUID: agqR1od7ST+z6mYUHX1I+w==
X-CSE-MsgGUID: +VHPeKQwQVOxslfVAxc5WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64650797"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64650797"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2025 10:46:35 -0800
X-CSE-ConnectionGUID: Vfoh66b1QfaoxRkbDf8mFQ==
X-CSE-MsgGUID: /Z5XJTliTf2/2nMSAOatSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,290,1754982000"; 
   d="scan'208";a="211744178"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Nov 2025 10:46:32 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHnxG-0001LB-31;
	Sat, 08 Nov 2025 18:46:30 +0000
Date: Sun, 9 Nov 2025 02:46:12 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:scratch/gourry/isolation/linus 7/11]
 kernel/cgroup/cpuset.c:2812:20: error: use of undeclared identifier
 'default_sysram_nodelist'
Message-ID: <202511090218.1AkRYdc8-lkp@intel.com>
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
commit: 2c5eedd6cd1524843e21a0e1ec1d1c8d9fd78e14 [7/11] cpuset: introduce cpuset.mems.default
config: arm-randconfig-003-20251108 (https://download.01.org/0day-ci/archive/20251109/202511090218.1AkRYdc8-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d78e0ded5215824a63ac04fb87effd9eacf875eb)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251109/202511090218.1AkRYdc8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511090218.1AkRYdc8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/cgroup/cpuset.c:2812:20: error: use of undeclared identifier 'default_sysram_nodelist'
    2812 |                 if (!nodes_empty(default_sysram_nodelist))
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:2814:7: error: use of undeclared identifier 'default_sysram_nodelist'
    2814 |                                   default_sysram_nodelist);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:3601:20: error: use of undeclared identifier 'default_sysram_nodelist'
    3601 |                 if (!nodes_empty(default_sysram_nodelist))
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:3603:7: error: use of undeclared identifier 'default_sysram_nodelist'
    3603 |                                   default_sysram_nodelist);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:3635:19: error: use of undeclared identifier 'default_sysram_nodelist'
    3635 |         if (!nodes_empty(default_sysram_nodelist))
         |                          ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:3637:6: error: use of undeclared identifier 'default_sysram_nodelist'
    3637 |                           default_sysram_nodelist);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:3840:19: error: use of undeclared identifier 'default_sysram_nodelist'
    3840 |         if (!nodes_empty(default_sysram_nodelist))
         |                          ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:3842:6: error: use of undeclared identifier 'default_sysram_nodelist'
    3842 |                           default_sysram_nodelist);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:3873:19: error: use of undeclared identifier 'default_sysram_nodelist'
    3873 |         if (!nodes_empty(default_sysram_nodelist))
         |                          ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:3875:6: error: use of undeclared identifier 'default_sysram_nodelist'
    3875 |                           default_sysram_nodelist);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:4067:20: error: use of undeclared identifier 'default_sysram_nodelist'
    4067 |                 if (!nodes_empty(default_sysram_nodelist))
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:4070:7: error: use of undeclared identifier 'default_sysram_nodelist'
    4070 |                                   default_sysram_nodelist);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:4141:19: error: use of undeclared identifier 'default_sysram_nodelist'
    4141 |         if (!nodes_empty(default_sysram_nodelist))
         |                          ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:4143:6: error: use of undeclared identifier 'default_sysram_nodelist'
    4143 |                           default_sysram_nodelist);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:4375:38: error: use of undeclared identifier 'default_sysram_nodelist'
    4375 |         if (!protected_node && !nodes_empty(default_sysram_nodelist))
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:4376:31: error: use of undeclared identifier 'default_sysram_nodelist'
    4376 |                 allowed &= node_isset(node, default_sysram_nodelist);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:4376:31: error: use of undeclared identifier 'default_sysram_nodelist'
    4376 |                 allowed &= node_isset(node, default_sysram_nodelist);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:4376:31: error: use of undeclared identifier 'default_sysram_nodelist'
    4376 |                 allowed &= node_isset(node, default_sysram_nodelist);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:4376:31: error: use of undeclared identifier 'default_sysram_nodelist'
    4376 |                 allowed &= node_isset(node, default_sysram_nodelist);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +/default_sysram_nodelist +2812 kernel/cgroup/cpuset.c

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
> 2812			if (!nodes_empty(default_sysram_nodelist))
  2813				nodes_and(cp->mems_default, cp->effective_mems,
  2814					  default_sysram_nodelist);
  2815			spin_unlock_irq(&callback_lock);
  2816	
  2817			WARN_ON(!is_in_v2_mode() &&
  2818				!nodes_equal(cp->mems_allowed, cp->effective_mems));
  2819	
  2820			cpuset_update_tasks_nodemask(cp);
  2821	
  2822			rcu_read_lock();
  2823			css_put(&cp->css);
  2824		}
  2825		rcu_read_unlock();
  2826	}
  2827	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
