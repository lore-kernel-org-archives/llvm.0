Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D540258CE7;
	Thu, 30 Apr 2026 01:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777512037; cv=none; b=QsTY96pkd3B1sJqqZk7ScHWSyj4lAOXLrnvNtktzRSIKh33mwae3+DYtcwzllE5aQNRyGdQT2bO8YTPm/PzyAUkLgQ5V62xt5xhoUk/7qAEOFnLrUKP+g/qSh5gr48bsnoXKxXxzkcpcHajWpBdCvQ+MEPM6TSxBH3sXy7Dzg4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777512037; c=relaxed/simple;
	bh=R3yYnsNb2Puk91RctVi5ia+fe8CuSZ/jd5J3HRXKKCI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uA878BiLuVq71I6q4Rl2qGRHfHXOoq7fl8T7wc8SaAtYsD/5obDzZFDFudfG68Kf4cL5l11p2keDfjLQY5B25IDWNppnDQY4BQzEyY9VD5iGGpUnpwNk2lzkOQc8fpuJ+kwk/JrL5wIZmWFZx9ZVfPok3Eax8yNFAYTHFHB9eJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CD6sV4Ie; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CD6sV4Ie"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777512035; x=1809048035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R3yYnsNb2Puk91RctVi5ia+fe8CuSZ/jd5J3HRXKKCI=;
  b=CD6sV4IezmsWddQErPV66vYMZ0bVIkdrvUBCI5xaG1ffVlPUXSWQ29iV
   9pBQaGeKGILYVLx1ZvYRP0uE2r/4YpHowjJW2cJeyjlBJ6q2o4oGBNTep
   Pf7yyzcK/OhXCQibJcr+6UZZPMx0gLVuJOSVPIvFA6FpqOuJBojrtGs8f
   AzglBfIncTBFi9gb1PLJWi33Pkr4VZiBmRehgx+FanFw4+PoirFDNWf7R
   e8kZsK87LsL191Oaxe+7QwB2f6OAJ2xZYpIk79WLY8NE0/91Sc/VrOTzz
   VbamHRRAJKMNRFYGu6aQpqhm8oswE9the+RJ8RvzsR4/hYdKn42sVUkhN
   w==;
X-CSE-ConnectionGUID: a23g+fNhSruo1FO15sD15g==
X-CSE-MsgGUID: LDypDuDvS+uAQaFR6f5OyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89914710"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="89914710"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 18:20:34 -0700
X-CSE-ConnectionGUID: yx+oneNuSaOFkDr3jFGOAg==
X-CSE-MsgGUID: rO32wq3nRreIIIphQhJGqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="227935449"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 29 Apr 2026 18:20:33 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIG4o-000000004hB-40Wm;
	Thu, 30 Apr 2026 01:20:26 +0000
Date: Thu, 30 Apr 2026 03:19:44 +0200
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 17/44]
 kernel/time/benchmarks.c:65:8: warning: variable 'b' is used uninitialized
 whenever 'if' condition is true
Message-ID: <202604300314.gaiQVLYr-lkp@intel.com>
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
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260430/202604300314.gaiQVLYr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300314.gaiQVLYr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300314.gaiQVLYr-lkp@intel.com/

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
