Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DA71A5BBD;
	Sun,  9 Mar 2025 23:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741563500; cv=none; b=N8iUvHPfL2VpAuGXgOawPa1RRMN8TDCAqMc62bEk417IL76RkBwBZFr/lnDib+iA5T+W3Jwj4D/LQGkKaZV3FvggWKV5TovJJ0g+ChpDhv0tK24PJoeRzTRXqjhJWq+ud+4QZ0wI+VdP8WckYwjgqflC1e1jjaxkB4tAJeTfC2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741563500; c=relaxed/simple;
	bh=/izPVUy5MC4S8uIrvfB+SOwfc+/o2SaudLkWbuBEhCs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZtsG8qtsiD5jjFgQdxt0Muv7rODDtLFgLbhtwgOk0SwJsNYTxLiMjzLg18mX3/vSD5I/dMebSZq8X8WEKv+oXPUxhNXDpb09I41/bBplKSK1rxg01W9UiIq18ibxJ3gaQKahJfh4IIRmo6l6q2nvh6Q1lzk89nVe3TwqFCYKXD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fV4Jh7OF; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fV4Jh7OF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741563498; x=1773099498;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/izPVUy5MC4S8uIrvfB+SOwfc+/o2SaudLkWbuBEhCs=;
  b=fV4Jh7OFdLHyM2z50s4NVzjZmVHZBwhKxghoOU16pvEuip5x0kcjNa4L
   DMvkcSix7HvL9GVVvozGZifWyH3sekowVLReKlbLXnUOhAILNUphAWalP
   zT4ORcYvP8uz6u3nVg90PPqQIndFixTt2Pp5+hLkiy+Ms38mKlP3psnwR
   c9uqufWw1Y3iiBt+n8/vfSZ6L4vKozXhKY4dJhxLreYNhZPJDqI/AShw3
   irD7y7lYtWf0BR8Y90UUGMWc5NsnVJHT3tN+lm8SFWYTj2y7mTlHf0+Ok
   WGWKiUDlGaR6nBtLTXQ5NPnjgKhle3Dk4HOfHG8c3asGb19pvhnD3zc0+
   A==;
X-CSE-ConnectionGUID: YqLgYZ8ESeWj/aEUBPXM5A==
X-CSE-MsgGUID: xRgZeF6RRtqNstAlsQgN6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="42456053"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="42456053"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 16:38:16 -0700
X-CSE-ConnectionGUID: 2AyDQT45SkOZvThQXEALRA==
X-CSE-MsgGUID: av3e0nu4S/iT1ezazAn0YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="119998476"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 09 Mar 2025 16:38:15 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trQDk-0003Yg-1z;
	Sun, 09 Mar 2025 23:38:12 +0000
Date: Mon, 10 Mar 2025 07:37:22 +0800
From: kernel test robot <lkp@intel.com>
To: Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [toke:mq-cake-api-experiments 2/2] net/sched/sch_cake.c:1995:26:
 error: call to '__compiletime_assert_676' declared with 'error' attribute:
 min(priv->min_timer_slack, diff) signedness error
Message-ID: <202503100749.dxifTDc6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/toke/linux.git mq-cake-api-experiments
head:   a9175301728058ffe2aaa7943c9882edbc88accb
commit: a9175301728058ffe2aaa7943c9882edbc88accb [2/2] net/sched: Convert mq-cake to use shared state API
config: hexagon-randconfig-002-20250310 (https://download.01.org/0day-ci/archive/20250310/202503100749.dxifTDc6-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e15545cad8297ec7555f26e5ae74a9f0511203e7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250310/202503100749.dxifTDc6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503100749.dxifTDc6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/sched/sch_cake.c:1995:26: error: call to '__compiletime_assert_676' declared with 'error' attribute: min(priv->min_timer_slack, diff) signedness error
    1995 |         priv->min_timer_slack = min(priv->min_timer_slack, diff);
         |                                 ^
   include/linux/minmax.h:105:19: note: expanded from macro 'min'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^
   include/linux/minmax.h:98:2: note: expanded from macro '__careful_cmp'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^
   include/linux/minmax.h:93:2: note: expanded from macro '__careful_cmp_once'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:530:2: note: expanded from macro '_compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:523:4: note: expanded from macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:51:1: note: expanded from here
      51 | __compiletime_assert_676
         | ^
   1 error generated.


vim +1995 net/sched/sch_cake.c

046f6fd5daefac7 Toke Høiland-Jørgensen 2018-07-06  1987  
e3ac36ec3b7d956 Jonas                  2024-11-14  1988  static inline void cake_update_timer_slack(ktime_t now, ktime_t next, struct cake_sched_data *priv)
e3ac36ec3b7d956 Jonas                  2024-11-14  1989  {
e3ac36ec3b7d956 Jonas                  2024-11-14  1990  	s64 diff = ktime_to_ns(ktime_sub(now, next));
e3ac36ec3b7d956 Jonas                  2024-11-14  1991  	if (diff < 0) {
e3ac36ec3b7d956 Jonas                  2024-11-14  1992  		pr_warn("diff is %lli\n", diff);
e3ac36ec3b7d956 Jonas                  2024-11-14  1993  		return;
e3ac36ec3b7d956 Jonas                  2024-11-14  1994  	}
e3ac36ec3b7d956 Jonas                  2024-11-14 @1995  	priv->min_timer_slack = min(priv->min_timer_slack, diff);
e3ac36ec3b7d956 Jonas                  2024-11-14  1996  	priv->max_timer_slack = max(priv->max_timer_slack, diff);
e3ac36ec3b7d956 Jonas                  2024-11-14  1997  	priv->avg_timer_slack = cake_ewma(priv->avg_timer_slack, diff, 3);
e3ac36ec3b7d956 Jonas                  2024-11-14  1998  }
e3ac36ec3b7d956 Jonas                  2024-11-14  1999  

:::::: The code at line 1995 was first introduced by commit
:::::: e3ac36ec3b7d9566a566c4140af356372efb69ea net: sched: turn cake into mq_cake

:::::: TO: Jonas <j.koeppeler@tu-berlin.de>
:::::: CC: Jonas Köppeler <j.koeppeler@tu-berlin.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
