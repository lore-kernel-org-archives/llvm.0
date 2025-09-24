Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E891E5201;
	Wed, 24 Sep 2025 00:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758675111; cv=none; b=V4CuPl2mfOaWfAWH8RIPo9EyxOqvPOsq/gp9s1caM/0+nc6bX8QiuARZasFr8ePMVTV6xwvkQYkE9SH0c1fkkj4XwXSAGYKc4h829QQoQmSAiZUfE6zIe2LvUqJEDScflzZbN7Zrqmsx2Cu3THd31wvDCD9XbnlDFxIuQOn2SW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758675111; c=relaxed/simple;
	bh=jLL/9vva6zqkJR3ahbsZnJ898KzWELN4WdHoMGgcJdM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qh9Ec4InDgPERXFN935mUitF+W4SKcRtG5F2Z4kt0iB8GnkGdjW+0sowWJaz7wgh1RHaM/12TJcGjgzzU1wNMgbB/hWNTnhM3ZQelmomAQP4aTZ/96dFi7ibWUeaDMJRrsd1E2wk3VkcRXOlj5mM1JjzX29sPTWqEvK7EIhDPzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pft7SRj6; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pft7SRj6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758675109; x=1790211109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jLL/9vva6zqkJR3ahbsZnJ898KzWELN4WdHoMGgcJdM=;
  b=Pft7SRj6N2p6ZP1xp3vpuHOD+FDTAIxyqsMwRSqVTM4Tm0naWOkLBmj3
   WrG5bCYrjODDhs28Eqw7yKApSjt3tIT1hr421jIaShBLV9TIMuR5RGw1T
   sogc0Kc7XEfbxYf3mny5+lxlJLivfa/Ou8GVgYHcNQGxo7fNms+bMivj/
   vno+GlqwroYWIA9FavSMi709FMHTF0M89C+0pSBN8jP8V50MzdAf0mkFv
   Xwht6hE8mV1CD5WwFH4hyAkGZBFEp6UvJkLz00L6XT4I/2v8IwZG3XQY4
   bw8o9JTO0IdRS+9rxZXjUj8ux8d2ce3JzYOPC33D25r7Pq+dSAVvsQ4xM
   g==;
X-CSE-ConnectionGUID: g4Oct8gOQxqNKBuEZLYQmQ==
X-CSE-MsgGUID: 8oCMTObIRdySb24Gd0IZWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60180877"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="60180877"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 17:51:48 -0700
X-CSE-ConnectionGUID: 6E7a4+/QSTayRZ5rvHjGFA==
X-CSE-MsgGUID: YgzU2ypgQlCWxt1qwKLvsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="182169998"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 23 Sep 2025 17:51:47 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1Dj4-0003fx-0c;
	Wed, 24 Sep 2025 00:51:28 +0000
Date: Wed, 24 Sep 2025 08:51:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:test 6/10] samples/ftrace/ftrace-direct-multi.c:228:65:
 error: too few arguments to function call, expected 3, have 2
Message-ID: <202509240807.fmfwk0FM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git test
head:   1b7fc74c36a93e90816f58c37a84522f0949095a
commit: 1f794792351edadc4dfae1ff42137d4de53960bb [6/10] ftrace: Use direct hash interface in direct functions
config: x86_64-buildonly-randconfig-001-20250924 (https://download.01.org/0day-ci/archive/20250924/202509240807.fmfwk0FM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250924/202509240807.fmfwk0FM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509240807.fmfwk0FM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> samples/ftrace/ftrace-direct-multi.c:228:65: error: too few arguments to function call, expected 3, have 2
     228 |         return register_ftrace_direct(&direct, (unsigned long) my_tramp);
         |                ~~~~~~~~~~~~~~~~~~~~~~                                  ^
   include/linux/ftrace.h:539:5: note: 'register_ftrace_direct' declared here
     539 | int register_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr);
         |     ^                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/ftrace/ftrace-direct-multi.c:233:66: error: too few arguments to function call, expected 4, have 3
     233 |         unregister_ftrace_direct(&direct, (unsigned long) my_tramp, true);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~                                        ^
   include/linux/ftrace.h:540:5: note: 'unregister_ftrace_direct' declared here
     540 | int unregister_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr,
         |     ^                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     541 |                              bool free_filters);
         |                              ~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> samples/ftrace/ftrace-direct-too.c:243:65: error: too few arguments to function call, expected 3, have 2
     243 |         return register_ftrace_direct(&direct, (unsigned long) my_tramp);
         |                ~~~~~~~~~~~~~~~~~~~~~~                                  ^
   include/linux/ftrace.h:539:5: note: 'register_ftrace_direct' declared here
     539 | int register_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr);
         |     ^                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/ftrace/ftrace-direct-too.c:248:65: error: too few arguments to function call, expected 4, have 3
     248 |         unregister_ftrace_direct(&direct, (unsigned long)my_tramp, true);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~                                       ^
   include/linux/ftrace.h:540:5: note: 'unregister_ftrace_direct' declared here
     540 | int unregister_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr,
         |     ^                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     541 |                              bool free_filters);
         |                              ~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> samples/ftrace/ftrace-direct-multi-modify.c:347:48: error: too few arguments to function call, expected 4, have 2
     347 |                 ret = modify_ftrace_direct(&direct, tramps[t]);
         |                       ~~~~~~~~~~~~~~~~~~~~                   ^
   include/linux/ftrace.h:542:5: note: 'modify_ftrace_direct' declared here
     542 | int modify_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr, bool lock_direct_mutex);
         |     ^                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/ftrace/ftrace-direct-multi-modify.c:365:48: error: too few arguments to function call, expected 3, have 2
     365 |         ret = register_ftrace_direct(&direct, my_tramp);
         |               ~~~~~~~~~~~~~~~~~~~~~~                  ^
   include/linux/ftrace.h:539:5: note: 'register_ftrace_direct' declared here
     539 | int register_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr);
         |     ^                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/ftrace/ftrace-direct-multi-modify.c:375:50: error: too few arguments to function call, expected 4, have 3
     375 |         unregister_ftrace_direct(&direct, my_tramp, true);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~                        ^
   include/linux/ftrace.h:540:5: note: 'unregister_ftrace_direct' declared here
     540 | int unregister_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr,
         |     ^                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     541 |                              bool free_filters);
         |                              ~~~~~~~~~~~~~~~~~
   3 errors generated.
--
>> samples/ftrace/ftrace-direct-modify.c:305:48: error: too few arguments to function call, expected 4, have 2
     305 |                 ret = modify_ftrace_direct(&direct, tramps[t]);
         |                       ~~~~~~~~~~~~~~~~~~~~                   ^
   include/linux/ftrace.h:542:5: note: 'modify_ftrace_direct' declared here
     542 | int modify_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr, bool lock_direct_mutex);
         |     ^                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/ftrace/ftrace-direct-modify.c:321:48: error: too few arguments to function call, expected 3, have 2
     321 |         ret = register_ftrace_direct(&direct, my_tramp);
         |               ~~~~~~~~~~~~~~~~~~~~~~                  ^
   include/linux/ftrace.h:539:5: note: 'register_ftrace_direct' declared here
     539 | int register_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr);
         |     ^                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/ftrace/ftrace-direct-modify.c:331:50: error: too few arguments to function call, expected 4, have 3
     331 |         unregister_ftrace_direct(&direct, my_tramp, true);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~                        ^
   include/linux/ftrace.h:540:5: note: 'unregister_ftrace_direct' declared here
     540 | int unregister_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr,
         |     ^                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     541 |                              bool free_filters);
         |                              ~~~~~~~~~~~~~~~~~
   3 errors generated.
--
>> samples/ftrace/ftrace-direct.c:210:65: error: too few arguments to function call, expected 3, have 2
     210 |         return register_ftrace_direct(&direct, (unsigned long) my_tramp);
         |                ~~~~~~~~~~~~~~~~~~~~~~                                  ^
   include/linux/ftrace.h:539:5: note: 'register_ftrace_direct' declared here
     539 | int register_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr);
         |     ^                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/ftrace/ftrace-direct.c:215:65: error: too few arguments to function call, expected 4, have 3
     215 |         unregister_ftrace_direct(&direct, (unsigned long)my_tramp, true);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~                                       ^
   include/linux/ftrace.h:540:5: note: 'unregister_ftrace_direct' declared here
     540 | int unregister_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr,
         |     ^                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     541 |                              bool free_filters);
         |                              ~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +228 samples/ftrace/ftrace-direct-multi.c

5fae941b9a6f95 Jiri Olsa      2021-10-08  222  
5fae941b9a6f95 Jiri Olsa      2021-10-08  223  static int __init ftrace_direct_multi_init(void)
5fae941b9a6f95 Jiri Olsa      2021-10-08  224  {
5fae941b9a6f95 Jiri Olsa      2021-10-08  225  	ftrace_set_filter_ip(&direct, (unsigned long) wake_up_process, 0, 0);
5fae941b9a6f95 Jiri Olsa      2021-10-08  226  	ftrace_set_filter_ip(&direct, (unsigned long) schedule, 0, 0);
5fae941b9a6f95 Jiri Olsa      2021-10-08  227  
da8bdfbd422333 Florent Revest 2023-03-21 @228  	return register_ftrace_direct(&direct, (unsigned long) my_tramp);
5fae941b9a6f95 Jiri Olsa      2021-10-08  229  }
5fae941b9a6f95 Jiri Olsa      2021-10-08  230  

:::::: The code at line 228 was first introduced by commit
:::::: da8bdfbd422333fbb7c85ac1d7f18592d17d6665 ftrace: Rename _ftrace_direct_multi APIs to _ftrace_direct APIs

:::::: TO: Florent Revest <revest@chromium.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
