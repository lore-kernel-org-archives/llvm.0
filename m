Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8821414D439;
	Tue,  9 Jul 2024 22:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720565863; cv=none; b=CZy9hYJN+EQVUr/KUuvu0zNlqasRdzU3CtslSWYDFYl0zvwkaGtn6/HXWrNnTPsNbWmK2YrwBHBThWn7BLv8nRm4V4/8LFIlcAjzcnDOOPj6eR7/JQHUNiizyzx5za+xLHC/4aHoZugFpm2jQXmhKwTT4LNWBg+tDBQP+uMeGg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720565863; c=relaxed/simple;
	bh=bbg1GllZgIe/2cmRr+76Ti3OyyoHWis1boqMVBRj/Ao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GwZroDMro1CtbBDDUR322dzymWxP4nt/UPhw9QbGoDEaSAfpXc+hYX1ZOZJTRSc+NwslmGdJGts2ou6DOoAtEr9Z+EGLK1UywVuiNW7cTvzOHKHUMVOW0Vr0Xu5mhmiCv55X6FrZ8JOchvFHtaGh/opyu7RWCTCDQepuu8nY23I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ASjs4jJk; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ASjs4jJk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720565862; x=1752101862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bbg1GllZgIe/2cmRr+76Ti3OyyoHWis1boqMVBRj/Ao=;
  b=ASjs4jJkhGTensAvoa7oKC0wQ4gq/MDN/vQWnmjPKo/4jMwblPyIO/pt
   ESoOoFXThJxLhtTgSWj6rmplpsrQ+/Ed/uSCV6RPiIm9vOE7+QxuHQZQ4
   qf8FBmq6rNh5eLymsI/92XWnHyqvItk4WvuFQz2btAoEs0yljLva4rW/o
   oHau1z6oanAJPNNU+TZyAKwUrbTl0cXYpIrbH6jLGGg58BiFYDNBvJTjM
   T2LEnFayTgfa7rxZDey9tZ3jyi5z68U7yHjIq51SGYPwU7hC0RlX6zgQZ
   4bN9O5P+ZTjxZ6GX/D1Q2zBABoWtpEp9tIa3TrFpZ/zjldNQaXs/CkDGd
   A==;
X-CSE-ConnectionGUID: UhxxYrPYTWOybCic6/C44A==
X-CSE-MsgGUID: s6gDWVrtQqueuqFSqe08/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="17487795"
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; 
   d="scan'208";a="17487795"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 15:57:41 -0700
X-CSE-ConnectionGUID: hC4W2MtgSU+v1UztbPTodQ==
X-CSE-MsgGUID: ulpDJagfSkqPCOwRY3HZ0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; 
   d="scan'208";a="47788373"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Jul 2024 15:57:41 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRJmD-000XCQ-2J;
	Tue, 09 Jul 2024 22:57:37 +0000
Date: Wed, 10 Jul 2024 06:57:24 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:perf/uprobes 7/12] kernel/events/uprobes.c:2153:19:
 error: no member named 'register_rwsem' in 'struct uprobe'; did you mean
 'register_mutex'?
Message-ID: <202407100614.Dfc2rQ4d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/uprobes
head:   73ff94f5e22f2853e1595f9781995b5c3990065c
commit: 672488bd391cab9b2bb22d3ba6b05cc80566f0c8 [7/12] perf/uprobe: SRCU-ify uprobe->consumer list
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240710/202407100614.Dfc2rQ4d-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240710/202407100614.Dfc2rQ4d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407100614.Dfc2rQ4d-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/events/uprobes.c:2153:19: error: no member named 'register_rwsem' in 'struct uprobe'; did you mean 'register_mutex'?
    2153 |         up_read(&uprobe->register_rwsem);
         |                          ^~~~~~~~~~~~~~
         |                          register_mutex
   kernel/events/uprobes.c:62:16: note: 'register_mutex' declared here
      62 |         struct mutex            register_mutex;
         |                                 ^
   1 error generated.


vim +2153 kernel/events/uprobes.c

3a9ea0520f38de Oleg Nesterov  2012-05-29  2107  
672488bd391cab Peter Zijlstra 2024-07-05  2108  #define for_each_consumer_rcu(pos, head) \
672488bd391cab Peter Zijlstra 2024-07-05  2109  	for (pos = rcu_dereference_raw(head); pos; \
672488bd391cab Peter Zijlstra 2024-07-05  2110  	     pos = rcu_dereference_raw(pos->next))
672488bd391cab Peter Zijlstra 2024-07-05  2111  
da1816b1caeccd Oleg Nesterov  2012-12-29  2112  static void handler_chain(struct uprobe *uprobe, struct pt_regs *regs)
da1816b1caeccd Oleg Nesterov  2012-12-29  2113  {
da1816b1caeccd Oleg Nesterov  2012-12-29  2114  	struct uprobe_consumer *uc;
da1816b1caeccd Oleg Nesterov  2012-12-29  2115  	int remove = UPROBE_HANDLER_REMOVE;
0dfd0eb8e4d72d Anton Arapov   2013-04-03  2116  	bool need_prep = false; /* prepare return uprobe, when needed */
ec74f3d52897ff Peter Zijlstra 2024-07-09  2117  	bool had_handler = false;
da1816b1caeccd Oleg Nesterov  2012-12-29  2118  
672488bd391cab Peter Zijlstra 2024-07-05  2119  	guard(srcu)(&uprobes_srcu);
672488bd391cab Peter Zijlstra 2024-07-05  2120  
672488bd391cab Peter Zijlstra 2024-07-05  2121  	for_each_consumer_rcu(uc, uprobe->consumers) {
ea024870cf1068 Anton Arapov   2013-04-03  2122  		int rc = 0;
da1816b1caeccd Oleg Nesterov  2012-12-29  2123  
ea024870cf1068 Anton Arapov   2013-04-03  2124  		if (uc->handler) {
ea024870cf1068 Anton Arapov   2013-04-03  2125  			rc = uc->handler(uc, regs);
da1816b1caeccd Oleg Nesterov  2012-12-29  2126  			WARN(rc & ~UPROBE_HANDLER_MASK,
d75f773c86a2b8 Sakari Ailus   2019-03-25  2127  				"bad rc=0x%x from %ps()\n", rc, uc->handler);
ea024870cf1068 Anton Arapov   2013-04-03  2128  		}
0dfd0eb8e4d72d Anton Arapov   2013-04-03  2129  
0dfd0eb8e4d72d Anton Arapov   2013-04-03  2130  		if (uc->ret_handler)
0dfd0eb8e4d72d Anton Arapov   2013-04-03  2131  			need_prep = true;
0dfd0eb8e4d72d Anton Arapov   2013-04-03  2132  
ec74f3d52897ff Peter Zijlstra 2024-07-09  2133  		/*
ec74f3d52897ff Peter Zijlstra 2024-07-09  2134  		 * A single handler that does not mask out REMOVE, means the
ec74f3d52897ff Peter Zijlstra 2024-07-09  2135  		 * probe stays.
ec74f3d52897ff Peter Zijlstra 2024-07-09  2136  		 */
ec74f3d52897ff Peter Zijlstra 2024-07-09  2137  		had_handler = true;
da1816b1caeccd Oleg Nesterov  2012-12-29  2138  		remove &= rc;
da1816b1caeccd Oleg Nesterov  2012-12-29  2139  	}
da1816b1caeccd Oleg Nesterov  2012-12-29  2140  
ec74f3d52897ff Peter Zijlstra 2024-07-09  2141  	/*
ec74f3d52897ff Peter Zijlstra 2024-07-09  2142  	 * If there were no handlers called, nobody asked for it to be removed
ec74f3d52897ff Peter Zijlstra 2024-07-09  2143  	 * but also nobody got to mask the value. Fix it up.
ec74f3d52897ff Peter Zijlstra 2024-07-09  2144  	 */
ec74f3d52897ff Peter Zijlstra 2024-07-09  2145  	if (!had_handler)
ec74f3d52897ff Peter Zijlstra 2024-07-09  2146  		remove = 0;
ec74f3d52897ff Peter Zijlstra 2024-07-09  2147  
0dfd0eb8e4d72d Anton Arapov   2013-04-03  2148  	if (need_prep && !remove)
0dfd0eb8e4d72d Anton Arapov   2013-04-03  2149  		prepare_uretprobe(uprobe, regs); /* put bp at return */
0dfd0eb8e4d72d Anton Arapov   2013-04-03  2150  
ec74f3d52897ff Peter Zijlstra 2024-07-09  2151  	if (remove)
da1816b1caeccd Oleg Nesterov  2012-12-29  2152  		unapply_uprobe(uprobe, current->mm);
da1816b1caeccd Oleg Nesterov  2012-12-29 @2153  	up_read(&uprobe->register_rwsem);
da1816b1caeccd Oleg Nesterov  2012-12-29  2154  }
da1816b1caeccd Oleg Nesterov  2012-12-29  2155  

:::::: The code at line 2153 was first introduced by commit
:::::: da1816b1caeccdff04531e763bb35d7caa3ed19f uprobes: Teach handler_chain() to filter out the probed task

:::::: TO: Oleg Nesterov <oleg@redhat.com>
:::::: CC: Oleg Nesterov <oleg@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
