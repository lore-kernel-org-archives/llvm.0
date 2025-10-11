Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1BD265632;
	Sat, 11 Oct 2025 12:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760185863; cv=none; b=bCdZve3Zw3mGhg6HHjNxs1whUw/ihD5rfoI/UTaRUHo1KWc6G3kdPvwRzu4woWUERgUzyP7tMC9Kfzn51IMszPH1QKjc9WLb78HMqmPsZozAh2noNnFCcUXRM/5DQz2UexGpz2pg90vkSwJWHxtDnRdrirvkjTnnBFlvj6wDSb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760185863; c=relaxed/simple;
	bh=+5QbXJmrqOQWnNS40XIOD6gLT2026MGFYlD4O21zUGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UZmeyWIU91Jimef9vDfP6Kz28VO7MoYU07vkqDzCeKqT4aZirxgFjj7to7+SzXZtLCBvwtzTnt15y2Dml5HkfJ1PJQDIpuLcF3BahIH4w2qEheeJ2rqRSd5Jn990OYr/tbcpKPkYGhmkRsRHCCEESBKICGYg6lmRF30nAdf/hR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=meaK4HYk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="meaK4HYk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760185858; x=1791721858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+5QbXJmrqOQWnNS40XIOD6gLT2026MGFYlD4O21zUGw=;
  b=meaK4HYkKLdFnqTlwUAaCLMoIPAi38bFnCLhqzq/dHK4eZMiDw5Hr09C
   c3e2KidxPrTnIp6ENSgFmBfB1fUdkb4I8KnntDfbqn3BXB2dovd++9OvR
   aZF6E9bfZ6h/tBn9cHGMGH1VFvDr+CCZC5lwWYhrxErGCmizqTDuG1bdA
   vcTti5nK2gc28bmdUVDWnEF0r4vGvfTjAU2S2juiTWpECa2wm8lMxFS9y
   J2Xr/1u5LwfkO88tt0zdRYLQZ+lypOMaNFhdO0FAGFTNE0Rv2ZDHzgoau
   XQIs3SPh58P0zcEXzTQp1fyasOJzppSmu5OUEs/rMED4Red/7sV56gdcp
   g==;
X-CSE-ConnectionGUID: BH5vsHr0S/2chgx5neHm2A==
X-CSE-MsgGUID: T/drKHMHQdqCZsfAhtgD+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="61418155"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="61418155"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 05:30:53 -0700
X-CSE-ConnectionGUID: dMQ+HE9YRrSjSm34ASJdIQ==
X-CSE-MsgGUID: oG/tLOyHTha7Xb8Df8SeEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="181957155"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Oct 2025 05:30:51 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7YkL-0003lS-1k;
	Sat, 11 Oct 2025 12:30:49 +0000
Date: Sat, 11 Oct 2025 20:30:02 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/rv-reactor-signal 3/9]
 kernel/trace/rv/monitors/sleep/sleep.c:219:26: error: static declaration of
 'rv_sleep' follows non-static declaration
Message-ID: <202510112012.OM38qh6e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/rv-reactor-signal
head:   5f1e83d0ead9b8fc09102bea3ac5c9c87daeb8a9
commit: 2efa5e94593e45e512dfc2e6429f93c98e69479b [3/9] rv: Pass va_list to reactors
config: x86_64-randconfig-008-20251011 (https://download.01.org/0day-ci/archive/20251011/202510112012.OM38qh6e-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510112012.OM38qh6e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510112012.OM38qh6e-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/rv/monitors/sleep/sleep.c:219:26: error: static declaration of 'rv_sleep' follows non-static declaration
     219 | static struct rv_monitor rv_sleep = {
         |                          ^
   include/rv/ltl_monitor.h:24:26: note: previous declaration is here
      24 | extern struct rv_monitor RV_MONITOR_NAME;
         |                          ^
   include/rv/ltl_monitor.h:19:25: note: expanded from macro 'RV_MONITOR_NAME'
      19 | #define RV_MONITOR_NAME CONCATENATE(rv_, MONITOR_NAME)
         |                         ^
   include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^
   include/linux/args.h:25:24: note: expanded from macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   <scratch space>:94:1: note: expanded from here
      94 | rv_sleep
         | ^
   1 error generated.


vim +/rv_sleep +219 kernel/trace/rv/monitors/sleep/sleep.c

f74f8bb246cf22 Nam Cao 2025-07-09  218  
f74f8bb246cf22 Nam Cao 2025-07-09 @219  static struct rv_monitor rv_sleep = {
f74f8bb246cf22 Nam Cao 2025-07-09  220  	.name = "sleep",
f74f8bb246cf22 Nam Cao 2025-07-09  221  	.description = "Monitor that RT tasks do not undesirably sleep",
f74f8bb246cf22 Nam Cao 2025-07-09  222  	.enable = enable_sleep,
f74f8bb246cf22 Nam Cao 2025-07-09  223  	.disable = disable_sleep,
f74f8bb246cf22 Nam Cao 2025-07-09  224  };
f74f8bb246cf22 Nam Cao 2025-07-09  225  

:::::: The code at line 219 was first introduced by commit
:::::: f74f8bb246cf22f27752977da62079cb615f55b2 rv: Add rtapp_sleep monitor

:::::: TO: Nam Cao <namcao@linutronix.de>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
