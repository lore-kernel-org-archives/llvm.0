Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141EC22D7A9;
	Tue, 26 May 2026 13:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802176; cv=none; b=i851OcxGC7EioTyVfhs9KS3Jb0nFxAUiWBd2lFtaiOEJCMvAd2wyveXztXpsEzSxh/C0wLT2U+QvIMSsy6LZ4rehgClgn/EAoJFmaCKfCeLKzDSuRndZAdpjfpj5eWg0EYlDIoz3QSmgDI6U0D4PBc158tDrMNnTK4euLfrv3Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802176; c=relaxed/simple;
	bh=YFBXj9kJAK2GUBcqj2oJN6vkUDXLvNaK/aM1Qe9i5Gs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Oo9v6vlz9ydi1Ree1z/qiN+LpPRTqhBu3/Y3quirVqM33ZFipfGC5IKMC0mergJOJ1N8x9oIti31rKAZKrZ5nwi9R9lzJO/XARhS0S7FzZtF1+NZptOjJUP7t1fCSC+0hPjSkkOsRvPO+ilex4DhVBlj6kLsMny4sHiEHVLFMOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gin2EEmw; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gin2EEmw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779802175; x=1811338175;
  h=date:from:to:cc:subject:message-id;
  bh=YFBXj9kJAK2GUBcqj2oJN6vkUDXLvNaK/aM1Qe9i5Gs=;
  b=gin2EEmwgUU9Z+4k3POG+VKtTNgusEd47g/Jh4SEIfGUDvyvJubjiY1S
   u4T4G2XwU5WpaSzX+X/GAmJPeTir5WyrCLe7c5LkNskbviXJdlLRTpH7n
   UPfXwOak81hjmrdab36WVBYht4stQUtGWUyl7Lypoz33OT5nnG4w0O7Dy
   dpb4yrvaDBOrlZXQnn5TMPTrHb+c3Av9MqxETF/1THgGV7zp0FdUH0htK
   J8zQIDZJ3lOXKhHP50v06oqI3NV552mXHghrJ/yc1Cn7UZOlIt3rmzDA/
   cODa4Apxr9coRoVqfBpvz2L65lhqKjQI/JtmCx8zlW3KFHyRyY2B4/VYZ
   Q==;
X-CSE-ConnectionGUID: Xz0OpZuUTre2LDA84vp2oA==
X-CSE-MsgGUID: PJ0E5TWwSSGtruVUZ0tatw==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80597417"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="80597417"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 06:29:35 -0700
X-CSE-ConnectionGUID: 4ir42ViOQSyzCOm/3IfOfg==
X-CSE-MsgGUID: tEM3y2IaT3KgsDsAiCyqqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="280042297"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 26 May 2026 06:29:33 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRrqc-00000000CPl-1ZSN;
	Tue, 26 May 2026 13:29:30 +0000
Date: Tue, 26 May 2026 15:29:17 +0200
From: kernel test robot <lkp@intel.com>
To: Li kunyu <likunyu10@163.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: kernel/sched/fair.c:7632:6: warning: variable 'delta' is
 used uninitialized whenever 'if' condition is false
Message-ID: <202605261559.6RBLgJz5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Li-kunyu/kernel-sched-fair-Fix-the-issue-of-virtual-runtime-conversion-error/20260526-151853
head:   bd4bbad39597b8716ec86aff4dff435d94b116b8
commit: bd4bbad39597b8716ec86aff4dff435d94b116b8 kernel/sched/fair: Fix the issue of virtual runtime conversion error
date:   6 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260526/202605261559.6RBLgJz5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605261559.6RBLgJz5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605261559.6RBLgJz5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:7632:6: warning: variable 'delta' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    7632 |         if (unlikely(se->load.weight != NICE_0_LOAD))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:22: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:7644:28: note: uninitialized use occurs here
    7644 |         hrtick_start(rq, (scale * delta) / 1024);
         |                                   ^~~~~
   kernel/sched/fair.c:7632:2: note: remove the 'if' if its condition is always true
    7632 |         if (unlikely(se->load.weight != NICE_0_LOAD))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    7633 |                 delta = (NICE_0_LOAD * vdelta) / se->load.weight;
   kernel/sched/fair.c:7615:11: note: initialize the variable 'delta' to silence this warning
    7615 |         u64 delta;
         |                  ^
         |                   = 0
   1 warning generated.


vim +7632 kernel/sched/fair.c

  7603	
  7604	/**************************************************
  7605	 * CFS operations on tasks:
  7606	 */
  7607	
  7608	#ifdef CONFIG_SCHED_HRTICK
  7609	static void hrtick_start_fair(struct rq *rq, struct task_struct *p)
  7610	{
  7611		struct sched_entity *se = &p->se;
  7612		unsigned long scale = 1024;
  7613		unsigned long util = 0;
  7614		u64 vdelta;
  7615		u64 delta;
  7616	
  7617		WARN_ON_ONCE(task_rq(p) != rq);
  7618	
  7619		if (rq->cfs.h_nr_queued <= 1)
  7620			return;
  7621	
  7622		/*
  7623		 * Compute time until virtual deadline
  7624		 */
  7625		vdelta = se->deadline - se->vruntime;
  7626		if ((s64)vdelta < 0) {
  7627			if (task_current_donor(rq, p))
  7628				resched_curr(rq);
  7629			return;
  7630		}
  7631	
> 7632		if (unlikely(se->load.weight != NICE_0_LOAD))
  7633			delta = (NICE_0_LOAD * vdelta) / se->load.weight;
  7634	
  7635		/*
  7636		 * Correct for instantaneous load of other classes.
  7637		 */
  7638		util += cpu_util_irq(rq);
  7639		if (util && util < 1024) {
  7640			scale *= 1024;
  7641			scale /= (1024 - util);
  7642		}
  7643	
  7644		hrtick_start(rq, (scale * delta) / 1024);
  7645	}
  7646	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
