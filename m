Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C981213150;
	Wed, 30 Oct 2024 17:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730307990; cv=none; b=jxb2s+yzE8Fj6vcvLSyRo/+sZ5sLO7sqQV5MlIp3Z3AI1FxY1vrb82SHkmmsazeN5RecxiIH5ujAdKax79yP+r9HNpzriIMcrN2PHXgH0osscMyuEz8m/Fpi6kl97IZuEew1RKnB1OoWFx1UVoy98VAsMmRh0TYHKyDjrFUUjlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730307990; c=relaxed/simple;
	bh=+Pq/Keqee/A6Rq5iMayhtYjlRnMtWU/O8UEky+x1zk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RD5L8Z50yRv332/K4jpmhY/pKE6D7iUFKHdoxEfqyH/TWBPkfz0dSob6ACsVvsk67N7HyznG3SmcRhXvb1PEYqOYljZB+ovJ/0Ab/nvDPRw6uszRPHx9YQQe+sbJCCk0w/b+2Pra5c98HX3WgYTrdJQqBJ1DgfxqlLaYHZQbfbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RQIayQFv; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RQIayQFv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730307988; x=1761843988;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+Pq/Keqee/A6Rq5iMayhtYjlRnMtWU/O8UEky+x1zk8=;
  b=RQIayQFvLVqHY/j5x69l4Tasj3+zzWFQcmcsHscY/kCZIdb/i44f4orF
   z8Uxf3v7Sk7vKsUixRUuLpPS+Jy95++jpHDFq5eaYACjVMEBLvl3LMKrm
   PejR0D3MwO37+Y6xbUQcxPfUOXPFM0QRwkW3tp75eG39w357rIhIhOmmG
   8Hht5DR9SZouCDhTg/VI8eD6AFPYtq6U4X0JhNnDl81RSvwdC7IV33Svj
   4HCXmigqxbtJ4N+YMrtWO5fKZ6ua+yhmft6VHDwl0LLuIsT1WPXAIG+gt
   W4pov9okMQYl3GRjuoGR2lDj/nfy+2OmlRvKBlmP14awXrPIkFPd/muze
   g==;
X-CSE-ConnectionGUID: eTI7PZCDS6m1T1Ih/pL5eg==
X-CSE-MsgGUID: ZYCV3YISTyqt3N80RU8Reg==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="41391351"
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="41391351"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 10:06:27 -0700
X-CSE-ConnectionGUID: DWvKgUhFRReM3EWwNk/L0A==
X-CSE-MsgGUID: pgO9+UqtTKKrVrcpU+k21g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="87526236"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Oct 2024 10:06:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6C9E-000f6q-31;
	Wed, 30 Oct 2024 17:06:20 +0000
Date: Thu, 31 Oct 2024 01:06:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Joel Fernandes (Google)" <joel@joelfernandes.org>,
	Suleiman Souhlal <suleiman@google.com>,
	Aashish Sharma <shraash@google.com>,
	Shin Kawamura <kawasin@google.com>,
	Vineeth Remanan Pillai <vineeth@bitbyteword.org>
Subject: Re: [PATCH] dl_server: Reset DL server params when rd changes
Message-ID: <202410310046.qSHsY4dH-lkp@intel.com>
References: <20241029225116.3998487-1-joel@joelfernandes.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029225116.3998487-1-joel@joelfernandes.org>

Hi Joel,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on linus/master v6.12-rc5 next-20241030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joel-Fernandes-Google/dl_server-Reset-DL-server-params-when-rd-changes/20241030-065241
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20241029225116.3998487-1-joel%40joelfernandes.org
patch subject: [PATCH] dl_server: Reset DL server params when rd changes
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20241031/202410310046.qSHsY4dH-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410310046.qSHsY4dH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410310046.qSHsY4dH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:19:
   In file included from include/linux/sched/isolation.h:5:
   In file included from include/linux/cpuset.h:17:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from kernel/sched/build_policy.c:60:
>> kernel/sched/deadline.c:1631:40: error: no member named 'rd' in 'struct rq'
    1631 |         struct root_domain *rd = cpu_rq(cpu)->rd;
         |                                  ~~~~~~~~~~~  ^
   1 warning and 1 error generated.


vim +1631 kernel/sched/deadline.c

  1626	
  1627	void dl_server_start(struct sched_dl_entity *dl_se)
  1628	{
  1629		struct rq *rq = dl_se->rq;
  1630		int cpu = cpu_of(rq);
> 1631		struct root_domain *rd = cpu_rq(cpu)->rd;
  1632	
  1633		/*
  1634		 * XXX: the apply do not work fine at the init phase for the
  1635		 * fair server because things are not yet set. We need to improve
  1636		 * this before getting generic.
  1637		 */
  1638		if (!dl_server(dl_se) || dl_se->last_rd != rd) {
  1639			u64 runtime =  50 * NSEC_PER_MSEC;
  1640			u64 period = 1000 * NSEC_PER_MSEC;
  1641	
  1642			dl_se->last_rd = rd;
  1643			dl_server_apply_params(dl_se, runtime, period, 1);
  1644	
  1645			if (!dl_server(dl_se)) {
  1646				dl_se->dl_server = 1;
  1647				dl_se->dl_defer = 1;
  1648				setup_new_dl_entity(dl_se);
  1649			}
  1650		}
  1651	
  1652		if (!dl_se->dl_runtime)
  1653			return;
  1654	
  1655		enqueue_dl_entity(dl_se, ENQUEUE_WAKEUP);
  1656		if (!dl_task(dl_se->rq->curr) || dl_entity_preempt(dl_se, &rq->curr->dl))
  1657			resched_curr(dl_se->rq);
  1658	}
  1659	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
