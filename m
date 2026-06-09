Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D233C3458;
	Tue,  9 Jun 2026 05:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780983548; cv=none; b=Dc1cXncoK44pe+TFgkxK9e9eWuHpnbRu38G4IhVKVOKIE9h2a4PptKChxScHoKIRe2SBO+Js0uaNgsdYcq+QMlSjoorptUeLMstJyyM7siUHvx4ARBVhu1IDyVoSgRlc4ZjP/SWO5SFySilN7VxFrJHau9lWc66QPW1/zOObsio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780983548; c=relaxed/simple;
	bh=tJ04mNI3wGoT1FrO9b4vb8ttcVS8WUOvs0hrFvHr1ZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GEElAytjRNFxRgDU2HRNjDVb5H6uwluAIfV+gfPivzW/SI4MsvVfe8UxCVIJSg/N6r2iUZCBy6oXVmHJmcovC4eQApYjC3iAwzy7yg9Z5qb9Ovt7VlH4kErXgSOJt7M9iOtjI9OqsIpNOmECO3HEzDXc3N6K1uMl/roDm1LSTJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dUH7UO82; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dUH7UO82"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780983547; x=1812519547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tJ04mNI3wGoT1FrO9b4vb8ttcVS8WUOvs0hrFvHr1ZM=;
  b=dUH7UO82fkJgzgG2JbxhD2Nz6e++ZHtdld4RTGZIMwppseggqX+l43n0
   +UnNmTv+JYjQnfbQcflHBhSl1SY1sRu9Hqxs+eV8CvZLxuqEs5iqDoC4Z
   UJp2Q8RowabLyEHuzcnIM9NcJ/7C/qRYJOD9HWFU0AffsEB2Z5yO7L/ok
   +yfcRTqb+Y/6SHzvrzDmDGWNGN9CYphn72Panb+JD9rMOyNyrhcp55UaB
   xvbIaIazMzuQi8Z4jIPjAi2tXC8NdGYyFUTCil7jtjTGDigPv6VJZQ+fd
   DeWwKoE/S0QtUzfDgKx0L7unYV++F3RVemeufnp3YSXyfsVmH7DpHLn5c
   g==;
X-CSE-ConnectionGUID: ELOfyI3oQz6F2KDhrYqw4Q==
X-CSE-MsgGUID: tnVjPTBpSLqoYKpjysHKfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="93120100"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="93120100"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 22:39:05 -0700
X-CSE-ConnectionGUID: tQMiSenwQDmsiLJyCAF8+A==
X-CSE-MsgGUID: q5Y77oasQeOaj1XrdjL5OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="245798226"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Jun 2026 22:39:03 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWpAy-00000000Jfu-2EuS;
	Tue, 09 Jun 2026 05:39:00 +0000
Date: Tue, 09 Jun 2026 13:38:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 32/52]
 kernel/time/hrtimer.c:599:13: error: call to undeclared function
 'hrtimer_time_to_monotonic'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202606091353.TwHVKGhK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   bca5a81b57571c48bb81e7225cb1e4248f98b346
commit: 7a200ad6980105f50270ca602d25d2960bfd63f6 [32/52] helper
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260609/202606091353.TwHVKGhK-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 7917772d7d61384696c61102c08c2ea158e610fa)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260609/202606091353.TwHVKGhK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606091353.TwHVKGhK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/time/hrtimer.c:599:13: error: call to undeclared function 'hrtimer_time_to_monotonic'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     599 |                 expires = hrtimer_time_to_monotonic(base, base->expires_next);
         |                           ^
   kernel/time/hrtimer.c:871:12: error: call to undeclared function 'hrtimer_time_to_monotonic'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     871 |         expires = hrtimer_time_to_monotonic(base, expires);
         |                   ^
   kernel/time/hrtimer.c:965:13: error: call to undeclared function 'hrtimer_time_to_monotonic'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     965 |                 expires = hrtimer_time_to_monotonic(base, next->expires);
         |                           ^
   kernel/time/hrtimer.c:1550:12: error: call to undeclared function 'hrtimer_time_to_monotonic'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1550 |         expires = hrtimer_time_to_monotonic(timer->base, expires);
         |                   ^
   4 errors generated.


vim +/hrtimer_time_to_monotonic +599 kernel/time/hrtimer.c

   590	
   591	/* Find the base with the earliest expiry */
   592	static void hrtimer_bases_first(struct hrtimer_cpu_base *cpu_base,unsigned int active,
   593					ktime_t *expires_next, struct hrtimer **next_timer)
   594	{
   595		struct hrtimer_clock_base *base;
   596		ktime_t expires;
   597	
   598		for_each_active_base(base, cpu_base, active) {
 > 599			expires = hrtimer_time_to_monotonic(base, base->expires_next);
   600			if (expires < *expires_next) {
   601				*expires_next = expires;
   602				*next_timer = clock_base_next_timer(base);
   603			}
   604		}
   605	}
   606	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
