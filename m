Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14C523C39A;
	Fri, 17 Oct 2025 02:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760667481; cv=none; b=nLB56DLdboYOr4OxdNHW9QjahaxHKujG0nV+sUww4P4iNQyZ1fZ+ASDHaXXcb/1CLflv9pHhL/1a8r8vW85v6Qbce+KPNz5IDHi4T2fgtXD1DRE5b/xWJ26UxZbju9sQhdPPJJQbvxiT8F1ocTu5QReLZbNi6EiIBTMG2Tsa860=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760667481; c=relaxed/simple;
	bh=8PzPXACkbtO7c8cK21V9ojH9y1teqhhQdQlEzC9/NG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uFNadxqwRfBoF8MhrPh+nRg6pP1eOX49Z/0oJL2knMnZX3f5k+kzgQn7aWhnfOLTJBdEduGOe6tW3XSQc290C6GzzicToBnCcsoYhlYSEhyaZ+bvsahJfuP+Yh7Y1t7+usSk6dBK3TXZMaM+Xk9BEir3kW07TIKUQKsTDGpTx0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O9XVPsk0; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O9XVPsk0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760667480; x=1792203480;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8PzPXACkbtO7c8cK21V9ojH9y1teqhhQdQlEzC9/NG4=;
  b=O9XVPsk0IsIuPc0NB7wrYz0rZ3U0PsBxmAieE9B/o/DZnoDZ99E0JOtw
   LOmBrNdOUXzHEo6IPxR1obikxh+OCs1Cm0HGMmh1eNQ6MikJkTmlb2b8d
   2qVkwzUozlmd6RO8uUI1OxNG9rOZYkoMZcF2N4wU0xo4oEYdwCnw+TNGg
   +E7CBMFupIH4dIcr7XOK2IYWpY+70UX8difGIMMx0dhX1RDePuv5LIhUz
   GgFiNxkQgrsf+NTqmmBjLDmB5p6pnvthCGu8P9jwjr0YgaUBa07K7suxi
   ZSbsYFIln2UsuZ7wIz8Sc9LUGGXMcK40MIHLhBigDybsHLAxuEREDal+u
   A==;
X-CSE-ConnectionGUID: vlGmZYt7Rf+ZxHaY0X+rzA==
X-CSE-MsgGUID: +8C9JaaKSfu84HTC1ofS3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="63020192"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="63020192"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 19:17:56 -0700
X-CSE-ConnectionGUID: 0mtAfkURTLOoqn3irNz/mw==
X-CSE-MsgGUID: S0WVeFLBSICVKSaDZr9oVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="182549462"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 16 Oct 2025 19:17:53 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9a2Q-0005Ry-2u;
	Fri, 17 Oct 2025 02:17:50 +0000
Date: Fri, 17 Oct 2025 10:17:36 +0800
From: kernel test robot <lkp@intel.com>
To: Pingfan Liu <piliu@redhat.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Pingfan Liu <piliu@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Subject: Re: [PATCHv2] sched/deadline: Walk up cpuset hierarchy to decide
 root domain when hot-unplug
Message-ID: <202510170932.nTEduJGM-lkp@intel.com>
References: <20251016120041.17990-1-piliu@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016120041.17990-1-piliu@redhat.com>

Hi Pingfan,

kernel test robot noticed the following build errors:

[auto build test ERROR on tj-cgroup/for-next]
[also build test ERROR on tip/sched/core tip/master linus/master v6.18-rc1 next-20251016]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pingfan-Liu/sched-deadline-Walk-up-cpuset-hierarchy-to-decide-root-domain-when-hot-unplug/20251016-200452
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git for-next
patch link:    https://lore.kernel.org/r/20251016120041.17990-1-piliu%40redhat.com
patch subject: [PATCHv2] sched/deadline: Walk up cpuset hierarchy to decide root domain when hot-unplug
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20251017/202510170932.nTEduJGM-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510170932.nTEduJGM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510170932.nTEduJGM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from init/main.c:53:
>> include/linux/cpuset.h:282:9: error: returning 'const struct cpumask *' from a function with result type 'struct cpumask *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     282 |         return cpu_active_mask;
         |                ^~~~~~~~~~~~~~~
   include/linux/cpumask.h:125:27: note: expanded from macro 'cpu_active_mask'
     125 | #define cpu_active_mask   ((const struct cpumask *)&__cpu_active_mask)
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +282 include/linux/cpuset.h

   279	
   280	static inline struct cpumask *cpuset_task_rd_effective_cpus(struct task_struct *p)
   281	{
 > 282		return cpu_active_mask;
   283	}
   284	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
