Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AB114F126;
	Mon, 14 Oct 2024 08:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728895862; cv=none; b=YfmhQSFzjP3vXSxJeHHt1NiB/RFVHkQ6KD7CFZ/evk546cK5ua69yT8J7GVVxlOTQJrorQ8h2ngaQqNGQkbszOpn/HnSQgMpxAhABsSJAFycMviMHPUkj3ZQBc6Y/qwIztBGDqtPozFUC6C91z8wg7zFp3DETG9L+JIwJPkaqC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728895862; c=relaxed/simple;
	bh=C7dxJhXhK3VNwFXnrkIUgeVRsDCxmZOpQyOG7nKTdKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kgWrZ5t3g3oamF65iUcPZF+Lxf4jraAKLzCyDsvuGd8+00SxkP8RKkJoh+iaDFLCv9v1x3DcFnKDebKfXak9D6PwiSaaZaRsxtlN2J4eSmh0jqZ0F6EaMUkcygzomieNtz1L1T3SHOrAnsZXID1/h/JQc06mPYhwwbn6ZgNvSQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DaBUlPNh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DaBUlPNh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728895860; x=1760431860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C7dxJhXhK3VNwFXnrkIUgeVRsDCxmZOpQyOG7nKTdKs=;
  b=DaBUlPNhsl/ODe145MGgwwuYW5hheDKANMiQPp4JtEbkbZMFIEXkzHML
   eHyNndDEhJ49i4TFMhKX2My+VJExpA7lVuqMulPDFj7vwYRUVO3eqJq+C
   F+W3NwISE1a7IZW8VUd0194BV1jHU1qHfn7nhtBPgYS6qFKst2QP2rk4/
   WP7Roa4exHFsgEwQ3f8afLWL61Mo4djGSlSBgjtW0EhIotcGCdJlh/hAu
   lf4p+i04UU3Z/vJWXOnbmdMK1JSWgpeZJ0wq564Q8CiiFVYPonN0bfn5L
   1ESMydGIWAto33gI1FLMH5KxrhmJY3G4AUs37Io3dQwwb6in1o4exktLu
   w==;
X-CSE-ConnectionGUID: DSig9N2qRNOYsJfYH1mHug==
X-CSE-MsgGUID: dOhfUdQ4RyuIFeQfCXl24A==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="39630495"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="39630495"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 01:50:57 -0700
X-CSE-ConnectionGUID: cglX4U5mTFKPbZymjbAIVg==
X-CSE-MsgGUID: 8C5YGUjHRRu8AZm+KBfkng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="100844863"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Oct 2024 01:50:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0Gmz-000F6P-1O;
	Mon, 14 Oct 2024 08:50:53 +0000
Date: Mon, 14 Oct 2024 16:50:39 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Juri Lelli <juri.lelli@redhat.com>,
	John Stultz <jstultz@google.com>, Metin Kaya <metin.kaya@arm.com>
Subject: [peterz-queue:sched/core 4/10] kernel/locking/spinlock_rt.c:168:28:
 error: too few arguments to function call, expected 2, have 1
Message-ID: <202410141601.k9Ew7p7O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   f3542dc97564eea82e113e7978ed9ea5ccc7f37e
commit: 8d8fcb8c6a67c5c2674c25effa5c728b1410232d [4/10] locking/mutex: Remove wakeups from under mutex::wait_lock
config: i386-buildonly-randconfig-001-20241014 (https://download.01.org/0day-ci/archive/20241014/202410141601.k9Ew7p7O-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241014/202410141601.k9Ew7p7O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410141601.k9Ew7p7O-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/locking/spinlock_rt.c:168:28: error: too few arguments to function call, expected 2, have 1
     168 |         rtlock_slowlock_locked(rtm);
         |         ~~~~~~~~~~~~~~~~~~~~~~    ^
   kernel/locking/rtmutex.c:1819:21: note: 'rtlock_slowlock_locked' declared here
    1819 | static void __sched rtlock_slowlock_locked(struct rt_mutex_base *lock,
         |                     ^                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1820 |                                            struct wake_q_head *wake_q)
         |                                            ~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +168 kernel/locking/spinlock_rt.c

8282947f673452 Thomas Gleixner 2021-08-15  163  
8282947f673452 Thomas Gleixner 2021-08-15  164  static __always_inline int
8d8fcb8c6a67c5 Peter Zijlstra  2024-10-09  165  rwbase_rtmutex_slowlock_locked(struct rt_mutex_base *rtm, unsigned int state,
8d8fcb8c6a67c5 Peter Zijlstra  2024-10-09  166  			       struct wake_q_head *wake_q)
8282947f673452 Thomas Gleixner 2021-08-15  167  {
8282947f673452 Thomas Gleixner 2021-08-15 @168  	rtlock_slowlock_locked(rtm);
8282947f673452 Thomas Gleixner 2021-08-15  169  	return 0;
8282947f673452 Thomas Gleixner 2021-08-15  170  }
8282947f673452 Thomas Gleixner 2021-08-15  171  

:::::: The code at line 168 was first introduced by commit
:::::: 8282947f67345246b4a6344dbceb07484d3d4dad locking/rwlock: Provide RT variant

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
