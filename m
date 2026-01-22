Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87E138BDC8;
	Thu, 22 Jan 2026 02:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769049098; cv=none; b=i/WlrIj89cGf67sDIi+eYDomlIPTARslkWoFslJixDpfani5tu4R86331HPBitFqU8D3Jd7Ln0tkXGMMwoiinz0MqwQtNfOM40E+cB6JBKiKqf3xRabIARazIDbC9Wo2luHH5EYE8vuL24u+QNVkJdu6Y74Ayg9x8u9maJer79c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769049098; c=relaxed/simple;
	bh=Pn8Gj4A1H6PIhGJESn9EoJmpfHhTo9SGxC9b5CdblUE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LEi958PhqBZJXM1U/wGLh1EbtD+wv28Hr6COL69hPzB8i+z/jUTzPTKyz/oKEzTLgMXw2fzwyOC4LYGfKohTwtKyDiOtQm+mZgczvqxaXPQBbsxlGhqDGIjCSLbiH4xyYr6hKn5Dda7gijkswdV0ZsDUjf3K4VphdBgZHWyUxxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dWHoXhex; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dWHoXhex"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769049096; x=1800585096;
  h=date:from:to:cc:subject:message-id;
  bh=Pn8Gj4A1H6PIhGJESn9EoJmpfHhTo9SGxC9b5CdblUE=;
  b=dWHoXhexy89mFfHD04jEYR0IZbshJqug98SKFoMym8xD0+tmi0JaURx1
   n+xBfUZsy0VuOOtCLqA4au/K0eoBBz+VKNCr5MyHziVJTqerNv+sreUlm
   QrDI9A10MbIJ/5fXqydYOlR+TQiXcR+i/BUvxVL3rzExqHOLATeFoMjmd
   muFG+zFAadE0qDbI7hW+5Zbqoj3AZ9zT41LLos82EveAxvRnHe8XU+0z8
   j6btre6xbi1+/JdP5ImTb3YNZ78/P1kkC722KJ1g4+2AFOs0yFc/lchXu
   vk+wX/NuFrvVJYE8z6VQs2Jo45TgaEqDIQdI5CY473+qRLI0Zoam2aXm+
   Q==;
X-CSE-ConnectionGUID: BbRLTDmDQhujY+VhgCiboA==
X-CSE-MsgGUID: XsOLek4rTeiqDwxmd6+FfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="69484789"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="69484789"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 18:31:31 -0800
X-CSE-ConnectionGUID: 9tbVFc4lQGOMsB2epULyOA==
X-CSE-MsgGUID: Bc5SdH0xQzCujGxa2eF+uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="206516189"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Jan 2026 18:31:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vikTm-00000000SKa-28aO;
	Thu, 22 Jan 2026 02:31:26 +0000
Date: Thu, 22 Jan 2026 10:30:28 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:locking/core 10/10] kernel/futex/core.c:982:1:
 warning: spinlock 'atomic ? __u.__val : q->lock_ptr' is still held at the end
 of function
Message-ID: <202601221040.TeM0ihff-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   33d9e7fdf9c17417347d1f06ddebaf25f21ab62a
commit: 33d9e7fdf9c17417347d1f06ddebaf25f21ab62a [10/10] futex: Convert to compiler context analysis
config: arm64-randconfig-001-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221040.TeM0ihff-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221040.TeM0ihff-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221040.TeM0ihff-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/futex/core.c:982:1: warning: spinlock 'atomic ? __u.__val : q->lock_ptr' is still held at the end of function [-Wthread-safety-analysis]
     982 | }
         | ^
   kernel/futex/core.c:976:2: note: spinlock acquired here
     976 |         spin_lock(lock_ptr);
         |         ^
>> kernel/futex/core.c:982:1: warning: expecting spinlock 'q->lock_ptr' to be held at the end of function [-Wthread-safety-analysis]
     982 | }
         | ^
   kernel/futex/core.c:966:6: note: spinlock acquired here
     966 | void futex_q_lockptr_lock(struct futex_q *q)
         |      ^
   2 warnings generated.


vim +982 kernel/futex/core.c

c1e2f0eaf015fb kernel/futex.c      Peter Zijlstra            2017-12-08  965  
b04b8f3032aae6 kernel/futex/core.c Sebastian Andrzej Siewior 2025-04-16  966  void futex_q_lockptr_lock(struct futex_q *q)
b04b8f3032aae6 kernel/futex/core.c Sebastian Andrzej Siewior 2025-04-16  967  {
b04b8f3032aae6 kernel/futex/core.c Sebastian Andrzej Siewior 2025-04-16  968  	spinlock_t *lock_ptr;
b04b8f3032aae6 kernel/futex/core.c Sebastian Andrzej Siewior 2025-04-16  969  
b04b8f3032aae6 kernel/futex/core.c Sebastian Andrzej Siewior 2025-04-16  970  	/*
b04b8f3032aae6 kernel/futex/core.c Sebastian Andrzej Siewior 2025-04-16  971  	 * See futex_unqueue() why lock_ptr can change.
b04b8f3032aae6 kernel/futex/core.c Sebastian Andrzej Siewior 2025-04-16  972  	 */
b04b8f3032aae6 kernel/futex/core.c Sebastian Andrzej Siewior 2025-04-16  973  	guard(rcu)();
b04b8f3032aae6 kernel/futex/core.c Sebastian Andrzej Siewior 2025-04-16  974  retry:
b04b8f3032aae6 kernel/futex/core.c Sebastian Andrzej Siewior 2025-04-16  975  	lock_ptr = READ_ONCE(q->lock_ptr);
b04b8f3032aae6 kernel/futex/core.c Sebastian Andrzej Siewior 2025-04-16  976  	spin_lock(lock_ptr);
b04b8f3032aae6 kernel/futex/core.c Sebastian Andrzej Siewior 2025-04-16  977  
b04b8f3032aae6 kernel/futex/core.c Sebastian Andrzej Siewior 2025-04-16  978  	if (unlikely(lock_ptr != q->lock_ptr)) {
b04b8f3032aae6 kernel/futex/core.c Sebastian Andrzej Siewior 2025-04-16  979  		spin_unlock(lock_ptr);
b04b8f3032aae6 kernel/futex/core.c Sebastian Andrzej Siewior 2025-04-16  980  		goto retry;
b04b8f3032aae6 kernel/futex/core.c Sebastian Andrzej Siewior 2025-04-16  981  	}
b04b8f3032aae6 kernel/futex/core.c Sebastian Andrzej Siewior 2025-04-16 @982  }
b04b8f3032aae6 kernel/futex/core.c Sebastian Andrzej Siewior 2025-04-16  983  

:::::: The code at line 982 was first introduced by commit
:::::: b04b8f3032aae6121303bfa324c768faba032242 futex: Introduce futex_q_lockptr_lock()

:::::: TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
