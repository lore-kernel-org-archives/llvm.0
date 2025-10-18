Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBE926B0A9;
	Sat, 18 Oct 2025 03:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760757468; cv=none; b=iDQTd7D2fGqDDz9S43Evc881CynwjbWSxOWpspP+me29b8kj56oghLs1FHtrLF/G9/xr/Pue8XfoFGXKtKKJTrMJVcnzzRSabJEp4LSCxD2VLvmMYwz202Aw34+I5Npt2JJsVNUYskGmj+0t+S7MbbuwHMkNtF/01hyn3PnzUd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760757468; c=relaxed/simple;
	bh=7Vx87lHdOaGgT8cNQFzE/wh6BCUdFDVGRNMFvSeK79o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWBzlZw3uHCLdqdZ2morttzdIpHvy47SbIE9Kg3Vqw3Br1DR8oPG6xsIwz0ZMgzPOhsYJSx4RG63SCeYnm79Gz6DpDFocvP486wMndoGBCJXDD11NSP7+7jJRrDMssF4Ncn0Pzw6w+iuosfdWlY7bUVVZIFyCOdeNhl4S4Zca/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=niHCCITn; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="niHCCITn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760757468; x=1792293468;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7Vx87lHdOaGgT8cNQFzE/wh6BCUdFDVGRNMFvSeK79o=;
  b=niHCCITnOrJcF0tvCdMxiH8+KCjY7UlAyZnuzfMkEpQnPyAsvxXC0+E8
   UBqN8gfX29OHYRE1XxecY0/3p1gbVWn+rwmC4LZmVjBrmChQfHQN4dTpR
   dfosqckdwhPxwdYxKkzT+Vw/ZzG4gF/becFXAq7QhRZhovv7lesQ7zFC2
   815yg7zYOrjzLVYdeKhXRP7w4a5b6exsjobUfhMc6hPd/m60+1FWndiHr
   iOf3TeQDnTAAX/OJKaJjkLbEYoeBISfk3sX414p4zDzDzk2ezdP0FOuka
   PO1xjUlkg6i0g6VIXfIAnfIJs+TGg/6+S95HdL8jNxDVjvhHR4Mix9c9B
   Q==;
X-CSE-ConnectionGUID: GInWeLzvSTqHFU/O51vuuw==
X-CSE-MsgGUID: r8rwTJGGR0enyrj4RO9FAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="80412384"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="80412384"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 20:17:45 -0700
X-CSE-ConnectionGUID: J8z+L6K4TFqD8ZwyHrS/gA==
X-CSE-MsgGUID: zeD0un+QQeyxVzWXKM/ZMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,237,1754982000"; 
   d="scan'208";a="182060246"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 17 Oct 2025 19:07:20 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9wLg-0007zL-1I;
	Sat, 18 Oct 2025 02:07:16 +0000
Date: Sat, 18 Oct 2025 10:06:57 +0800
From: kernel test robot <lkp@intel.com>
To: Pingfan Liu <piliu@redhat.com>, cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Pingfan Liu <piliu@redhat.com>, Waiman Long <longman@redhat.com>,
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Subject: Re: [PATCHv3] sched/deadline: Walk up cpuset hierarchy to decide
 root domain when hot-unplug
Message-ID: <202510180955.gfjiuCP0-lkp@intel.com>
References: <20251017122636.17671-1-piliu@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017122636.17671-1-piliu@redhat.com>

Hi Pingfan,

kernel test robot noticed the following build errors:

[auto build test ERROR on tj-cgroup/for-next]
[also build test ERROR on tip/sched/core tip/master linus/master v6.18-rc1 next-20251017]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pingfan-Liu/sched-deadline-Walk-up-cpuset-hierarchy-to-decide-root-domain-when-hot-unplug/20251017-202902
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git for-next
patch link:    https://lore.kernel.org/r/20251017122636.17671-1-piliu%40redhat.com
patch subject: [PATCHv3] sched/deadline: Walk up cpuset hierarchy to decide root domain when hot-unplug
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20251018/202510180955.gfjiuCP0-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510180955.gfjiuCP0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510180955.gfjiuCP0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from init/main.c:53:
>> include/linux/cpuset.h:286:11: error: call to undeclared function 'housekeeping_cpumask'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     286 |         hk_msk = housekeeping_cpumask(HK_TYPE_DOMAIN);
         |                  ^
>> include/linux/cpuset.h:286:32: error: use of undeclared identifier 'HK_TYPE_DOMAIN'
     286 |         hk_msk = housekeeping_cpumask(HK_TYPE_DOMAIN);
         |                                       ^~~~~~~~~~~~~~
>> include/linux/cpuset.h:287:6: error: call to undeclared function 'housekeeping_enabled'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     287 |         if (housekeeping_enabled(HK_TYPE_DOMAIN)) {
         |             ^
   include/linux/cpuset.h:287:27: error: use of undeclared identifier 'HK_TYPE_DOMAIN'
     287 |         if (housekeeping_enabled(HK_TYPE_DOMAIN)) {
         |                                  ^~~~~~~~~~~~~~
   In file included from init/main.c:57:
>> include/linux/sched/isolation.h:43:37: error: static declaration of 'housekeeping_cpumask' follows non-static declaration
      43 | static inline const struct cpumask *housekeeping_cpumask(enum hk_type type)
         |                                     ^
   include/linux/cpuset.h:286:11: note: previous implicit declaration is here
     286 |         hk_msk = housekeeping_cpumask(HK_TYPE_DOMAIN);
         |                  ^
   In file included from init/main.c:57:
>> include/linux/sched/isolation.h:48:20: error: static declaration of 'housekeeping_enabled' follows non-static declaration
      48 | static inline bool housekeeping_enabled(enum hk_type type)
         |                    ^
   include/linux/cpuset.h:287:6: note: previous implicit declaration is here
     287 |         if (housekeeping_enabled(HK_TYPE_DOMAIN)) {
         |             ^
   6 errors generated.


vim +/housekeeping_cpumask +286 include/linux/cpuset.h

   279	
   280	static inline void task_get_rd_effective_cpus(struct task_struct *p,
   281			struct cpumask *cpus)
   282	{
   283		const struct cpumask *hk_msk;
   284		struct cpumask msk;
   285	
 > 286		hk_msk = housekeeping_cpumask(HK_TYPE_DOMAIN);
 > 287		if (housekeeping_enabled(HK_TYPE_DOMAIN)) {
   288			if (!cpumask_and(&msk, p->cpus_ptr, hk_msk)) {
   289				/* isolated cpus belong to a root domain */
   290				cpumask_andnot(cpus, cpu_active_mask, hk_msk);
   291				return;
   292			}
   293		}
   294		cpumask_and(cpus, cpu_active_mask, hk_msk);
   295	}
   296	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
