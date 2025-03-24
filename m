Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA80469D;
	Mon, 24 Mar 2025 14:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742826562; cv=none; b=hp+iX7Xj4T6T3hr+5FDYbMJi936YyQoRP9Ojki/rWSNfbqNQBqrYJtvvU29jdX1NLr+CaAiRIhq0zo8lF/uQhHYH7PKYPkvmKaOqCisniVohsuMJ7X0YorKySIcrM5qm2IZ48Rr5ZZShHJ9LFbN4yi9mym6GkdJqMG+jpLFLlyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742826562; c=relaxed/simple;
	bh=1uUaPfIC7dDjB/a9oyQWfMXO0KLUY45e/WgktKkLsko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pE27+1wRNOwxXde2+Zpt6sqzdXTJabskweXWtdAitAK3rWmNwOSzSJyT8FI4NzZB43E/CRIbN9huEBA/rGId4/kilEoZNqDtwKNuH7s+HuyCFNpjmBtjKi1BYzT/amvPV1vZQshH40sCj6c4xvkkzPgJ8NhTouvAkz+SBQTDgxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yo/j2kSh; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yo/j2kSh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742826560; x=1774362560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1uUaPfIC7dDjB/a9oyQWfMXO0KLUY45e/WgktKkLsko=;
  b=Yo/j2kShZyP7SH1WX/BJUZMsS1L4Ydz7stHsQ9h9XWjtV0WxZ98zG2+g
   u0eheMY4R0QyCtfw2ypS+XIRiinHVna1Af8RIMW4a7sn0qHO80vRxpcXX
   k9IXKoHdVHj9tFEzt62TPCRjdIpdJCT2RvrnaoHgHZSeefRVoHhyPxHNc
   q01xwB9DXxHTPyftcT8lnPjktfezcCwraPjPAp+6XyIonbetaxTB59k1S
   Q1hPR140KwwcNEX2BUrmkr9TRqPh7Vka6DDYUYWcI/lSOe1qOuDLb06Dl
   ADnKRFfAk08OCxUlnBHHcuGp0Rrc9rWXoqNTuJFzUC6Fcz7AW7CQQe08U
   w==;
X-CSE-ConnectionGUID: CAlH+w5YTcWRfIEe3t0QSw==
X-CSE-MsgGUID: hj/rYxsDSie7Im4F2xQTGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="54698023"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; 
   d="scan'208";a="54698023"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 07:29:19 -0700
X-CSE-ConnectionGUID: 4TkTc564THWKGSMwITt2sA==
X-CSE-MsgGUID: 3wtiTd/zQ7eQfN/rF2x12A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; 
   d="scan'208";a="161280025"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 24 Mar 2025 07:29:18 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twinj-0003fX-2U;
	Mon, 24 Mar 2025 14:29:15 +0000
Date: Mon, 24 Mar 2025 22:28:26 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/hrtick 3/4] kernel/time/hrtimer.c:1991:20:
 error: use of undeclared identifier 'TIF_REARM'
Message-ID: <202503242205.mSkjeC9O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/hrtick
head:   adf71785ae176daaf2d8c0de6cac055d18c35d96
commit: a88605da40649a8343a20b492a5ebed89e25fcb8 [3/4] entry,hrtimer,x86: Push reprogramming timers into the interrupt return path
config: hexagon-randconfig-002-20250324 (https://download.01.org/0day-ci/archive/20250324/202503242205.mSkjeC9O-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250324/202503242205.mSkjeC9O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503242205.mSkjeC9O-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/time/hrtimer.c:1991:20: error: use of undeclared identifier 'TIF_REARM'
    1991 |         clear_thread_flag(TIF_REARM);
         |                           ^
   1 error generated.


vim +/TIF_REARM +1991 kernel/time/hrtimer.c

  1980	
  1981	void hrtimer_rearm(void)
  1982	{
  1983		struct hrtimer_cpu_base *cpu_base = this_cpu_ptr(&hrtimer_bases);
  1984		unsigned long flags;
  1985		ktime_t now;
  1986	
  1987		raw_spin_lock_irqsave(&cpu_base->lock, flags);
  1988		now = hrtimer_update_base(cpu_base);
  1989		__hrtimer_rearm(cpu_base, now);
  1990		raw_spin_unlock_irqrestore(&cpu_base->lock, flags);
> 1991		clear_thread_flag(TIF_REARM);
  1992	}
  1993	#endif /* !CONFIG_HIGH_RES_TIMERS */
  1994	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
