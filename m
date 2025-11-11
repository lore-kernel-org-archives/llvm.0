Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562BB3587B1;
	Tue, 11 Nov 2025 15:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762873850; cv=none; b=e7JWrZOVnrbOiLplcMiW5QTunbX6Z3PnyWdXnvKRLmjn7dPJAbiWv9Q8cqku6V5+mdINN1Nno5sxnwgcr22sQNgKJVU0Tqa/AumQbuM1aHIcluDseBwtxaIFEIUK8Vg2AJvzg/hiWXK4dg+P1fZWg3PamQbpyNHcvTFfOoletTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762873850; c=relaxed/simple;
	bh=8qZhVpJQaDFaIpjREnR3ixrwboW9MAewAES9E52FZ4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dgk6fY5qX8BVzdN8XC97Ongxy1ZVACNKR5/rJNCXJ11+kpA0YSCRZbYNREK8AraKOiiDPaXiOzLi+04yLUvlmEpYPRHO+deAdPq/GYQaUbuo0hc9jcWi4ZscP95gLMs09BLdRo6Ui1GPZh3Fp91UZDxIj84rODM+Z5Qx2GAsLts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CI+4L8J5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CI+4L8J5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762873846; x=1794409846;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8qZhVpJQaDFaIpjREnR3ixrwboW9MAewAES9E52FZ4w=;
  b=CI+4L8J5nyFGxHsiQ3KfVo7Camov01M9SfvShAmm7HPaMBgA1o+8uH3+
   oJXKJBWfTGdR1ioOf/BHlsNMiCmZVQW+Bd4bpAfKXZZFTdDhXM0Babteu
   REt6z3L3J4FKWtkLUY/JcCxaGmL5Lpby8gUWIx0LcLXNbni5801qZmD0b
   VXBD8dfiRBnH71JcqMh9we5EZmy3YZFk3iL89pfMrVNWBtygi6TSPuDdS
   CCu+vkbKZo1tswaXuHx7LkEltktqKsiNUklMCaWTdOB1OpqZvd8GOuXrz
   8+3GpQ8F32raLKVeU1ZLr78lEEdS/BqUq2xs9Imazb2wd3rvpOpQUwuYn
   A==;
X-CSE-ConnectionGUID: cytvhMn9SEaeu6D0T3rjyQ==
X-CSE-MsgGUID: o7fqCdyUQs2rkI+loj+lBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="64970913"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="64970913"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 07:10:46 -0800
X-CSE-ConnectionGUID: eDxml34cTbuq2s8cxArGJA==
X-CSE-MsgGUID: Vu92M8HoQIOGivw5XlC4yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="193235578"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Nov 2025 07:10:46 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIq16-0003Gt-1i;
	Tue, 11 Nov 2025 15:10:44 +0000
Date: Tue, 11 Nov 2025 23:10:44 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:scratch/gourry/isolation/linus 6/10]
 kernel/cgroup/cpuset-v1.c:296:2: error: call to undeclared function
 'cpuset_update_mems_default'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202511112320.TLM8ho9H-lkp@intel.com>
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
config: sparc64-randconfig-002-20251111 (https://download.01.org/0day-ci/archive/20251111/202511112320.TLM8ho9H-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251111/202511112320.TLM8ho9H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511112320.TLM8ho9H-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/cgroup/cpuset-v1.c:296:2: error: call to undeclared function 'cpuset_update_mems_default'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     296 |         cpuset_update_mems_default(cs);
         |         ^
   kernel/cgroup/cpuset-v1.c:296:2: note: did you mean 'cpuset_mems_default'?
   include/linux/cpuset.h:80:19: note: 'cpuset_mems_default' declared here
      80 | extern nodemask_t cpuset_mems_default(struct task_struct *p);
         |                   ^
   1 error generated.


vim +/cpuset_update_mems_default +296 kernel/cgroup/cpuset-v1.c

   284	
   285	void cpuset1_hotplug_update_tasks(struct cpuset *cs,
   286				    struct cpumask *new_cpus, nodemask_t *new_mems,
   287				    bool cpus_updated, bool mems_updated)
   288	{
   289		bool is_empty;
   290	
   291		cpuset_callback_lock_irq();
   292		cpumask_copy(cs->cpus_allowed, new_cpus);
   293		cpumask_copy(cs->effective_cpus, new_cpus);
   294		cs->mems_allowed = *new_mems;
   295		cs->effective_mems = *new_mems;
 > 296		cpuset_update_mems_default(cs);
   297		cpuset_callback_unlock_irq();
   298	
   299		/*
   300		 * Don't call cpuset_update_tasks_cpumask() if the cpuset becomes empty,
   301		 * as the tasks will be migrated to an ancestor.
   302		 */
   303		if (cpus_updated && !cpumask_empty(cs->cpus_allowed))
   304			cpuset_update_tasks_cpumask(cs, new_cpus);
   305		if (mems_updated && !nodes_empty(cs->mems_allowed))
   306			cpuset_update_tasks_nodemask(cs);
   307	
   308		is_empty = cpumask_empty(cs->cpus_allowed) ||
   309			   nodes_empty(cs->mems_allowed);
   310	
   311		/*
   312		 * Move tasks to the nearest ancestor with execution resources,
   313		 * This is full cgroup operation which will also call back into
   314		 * cpuset. Execute it asynchronously using workqueue.
   315		 */
   316		if (is_empty && cs->css.cgroup->nr_populated_csets &&
   317		    css_tryget_online(&cs->css)) {
   318			struct cpuset_remove_tasks_struct *s;
   319	
   320			s = kzalloc(sizeof(*s), GFP_KERNEL);
   321			if (WARN_ON_ONCE(!s)) {
   322				css_put(&cs->css);
   323				return;
   324			}
   325	
   326			s->cs = cs;
   327			INIT_WORK(&s->work, cpuset_migrate_tasks_workfn);
   328			schedule_work(&s->work);
   329		}
   330	}
   331	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
