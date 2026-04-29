Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F44539FCC6;
	Wed, 29 Apr 2026 21:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777497836; cv=none; b=QwzbG3DyympHTtNBReoktDSPI3JkIj05aCrWCjo/N+QDU7dqvqwfWjDgCQz6sWoQjBNXxzUd3qYeZsOlc/Qf4Vm32WcVaOrJ/m9DCHdHlh7d/94rTquxn+UmTtEerCVJBxLNgI1g2nUOiJVJoSsUpczxy8ylS5Dp5/SLSgSXuHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777497836; c=relaxed/simple;
	bh=5h9i+l8XsvO0j4mEZ+8HShzsZ7MQ0oZQ3Lm321Jrbeo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sLsqLC6zOlB9qRisMnvAzSJSpvcYOYYuFLg+pO6vzc+vsLboWa/2DgSoOs71405d2eStNnyKX+E0iebx4/U4kOIafQOomoX55+8PlgaAsa+PU4bI+YaBgh6e75Qwi3ydixd8X47O4gvKJmx8UzFcal+lrfKI40kinpx84c9gCgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c/54MEuP; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/54MEuP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777497835; x=1809033835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5h9i+l8XsvO0j4mEZ+8HShzsZ7MQ0oZQ3Lm321Jrbeo=;
  b=c/54MEuPRk5Uurb8o9VADvmoxoAPIkMzqTadhls7iz963h4sYemJjU5s
   kqmmuD/r3rvIRwIFwGPKJCyixgfHKV3aFx5MTrVlwlDV27u5rgzhee2YN
   vEuwWlBp0lF4lfgjkNinD68goX9QQsMHdYyUSxZE1dv9Vtod+qjZ7tpRd
   Cio6ZEKtP0Byj/j9nvnpr202lBfaGa5s34/34w2qkG6WqpIV3urE0oRUM
   46iXwBD/VdQBD5dBXgg1rUHsrogs6N/QKiqyltH6lAKvzcjmERhH7reJA
   5wEbZ2et5kKf3vvniXlH78MMt1dSN7tKDNrg84Wl9eY5nzAJr1A0WHwqV
   A==;
X-CSE-ConnectionGUID: HBvWk2h8SA2xk9GzW4PcsQ==
X-CSE-MsgGUID: x37TN8FKQk2nb4k9rOuQFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78459837"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="78459837"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 14:23:55 -0700
X-CSE-ConnectionGUID: za0cLyQMTvqlHwtb4HfmVA==
X-CSE-MsgGUID: 0txvbWSUR665JJTmigujRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="234410903"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Apr 2026 14:23:54 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wICNq-00000000BYX-3K1a;
	Wed, 29 Apr 2026 21:23:50 +0000
Date: Thu, 30 Apr 2026 05:23:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 17/44]
 kernel/time/benchmarks.c:65:8: warning: variable 'b' is used uninitialized
 whenever 'if' condition is true
Message-ID: <202604300558.Y15GkXgc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   3e5442acb7e21f08c3eff2ecdace624b6647d5b1
commit: 2d4cde60596e5113f58afbb253423ffcabc891ac [17/44] benchmarks
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260430/202604300558.Y15GkXgc-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300558.Y15GkXgc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300558.Y15GkXgc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/benchmarks.c:65:8: warning: variable 'b' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
      65 |                         if (!ktime_get_aux(CLOCK_AUX, &a)) {
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/benchmarks.c:76:13: note: uninitialized use occurs here
      76 |                 *sample = b - a;
         |                           ^
   kernel/time/benchmarks.c:65:4: note: remove the 'if' if its condition is always false
      65 |                         if (!ktime_get_aux(CLOCK_AUX, &a)) {
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      66 |                                 *sample = KTIME_MAX;
         |                                 ~~~~~~~~~~~~~~~~~~~~
      67 |                                 continue;
         |                                 ~~~~~~~~~
      68 |                         }
         |                         ~
   kernel/time/benchmarks.c:62:15: note: initialize the variable 'b' to silence this warning
      62 |                 ktime_t a, b;
         |                             ^
         |                              = 0
   1 warning generated.


vim +65 kernel/time/benchmarks.c

    57	
    58	static void benchmark_ktime_get_aux(struct benchmark_samples *samples)
    59	{
    60		for (size_t l = 0; l < ARRAY_SIZE(samples->d); l++) {
    61			ktime_t *sample = &samples->d[l];
    62			ktime_t a, b;
    63	
    64			scoped_guard(preempt) {
  > 65				if (!ktime_get_aux(CLOCK_AUX, &a)) {
    66					*sample = KTIME_MAX;
    67					continue;
    68				}
    69	
    70				if (!ktime_get_aux(CLOCK_AUX, &b)) {
    71					*sample = KTIME_MAX;
    72					continue;
    73				}
    74			}
    75	
    76			*sample = b - a;
    77		}
    78	}
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
