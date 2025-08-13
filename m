Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934AE2F60A3;
	Wed, 13 Aug 2025 23:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755128606; cv=none; b=ppVXxPigWqpTVTMWNUg/7fXpuJ33bOcBxXbQj+uM0hrkfbw0XD/VkFSVx7hoCpHEk9NHnZngLcQ5C+gGtU0ptPrUwPPt1Yh5uol2fe/oDcdgXjaAD5dJ+xjEhG90TA4Mg83g+Gw2zmTHrFp9LMgTSSjEWAy2ZhTKPjRXFGwVdBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755128606; c=relaxed/simple;
	bh=ivtXglFyA8LLUtTyziPgS6A+xyex6nMrqs44hSYsp44=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KGEGpzTzKZE14JtVzFDQiRBMBmX7MgChY8xLGD6erZWsJIyLcE8AEg008+HAhKs6ETGOV3zrKcSqGN53TP91yXBoucDjLBDXkibVYR74ZLsLJOsfn0egxJt4nnzJYC8X+W94wr9xLGJRU2mVWN7CzmXYmEw9P0QoVqseLTGi+/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ESFLysxE; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ESFLysxE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755128603; x=1786664603;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ivtXglFyA8LLUtTyziPgS6A+xyex6nMrqs44hSYsp44=;
  b=ESFLysxEcleEy3z5aAJYKEBDOdC+IkZ4lrkUWLbOHLm2upgei558amw2
   tJIES/hTjzbLtQywYMj2lwnWQfmMcTV1Zx/jr0UY18m+tqikSFq65RMXS
   lwTSt+8ItO/7oAgQBErlP8sm+D3rAaLIChYQsS+0ApDEERS4IefTFe7xU
   cwu5iSI/tqHhC9Vh3gZ9ncQaf0TOs094X9PSIn/74H6NRtP56YA55xehs
   qBk+elvL160K04U06xXYWRTaZt3mvw20Klu0S9peT8sz8zNiB1YZkruoc
   KyGJV9sm46TPg2WUwcA3FsDegY/T8tez76n8cjP2nAl3vYKWeCb2HP35M
   g==;
X-CSE-ConnectionGUID: 3gxsXb3qTfiHFf4Byls8ng==
X-CSE-MsgGUID: C/WjDI3vSzuxr8Upuc2mwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57306401"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="57306401"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 16:43:22 -0700
X-CSE-ConnectionGUID: 4hY4BcDDSnSGRErMpW/U1g==
X-CSE-MsgGUID: A6anEkWTTySZoe0/pIx5Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="166970738"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 13 Aug 2025 16:43:20 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umL7m-000APU-11;
	Wed, 13 Aug 2025 23:43:18 +0000
Date: Thu, 14 Aug 2025 07:41:48 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/perf 12/19] fs/exec.c:1759:2: error: call to
 undeclared function 'rseq_execve'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202508140702.KMYT7USe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/perf
head:   c3f9d97d82881880460dacf48da60a280f4797cd
commit: e1783910d069f5b08f5eb850dd59377c90fafca6 [12/19] rseq: Replace the pointless event mask bit fiddling
config: x86_64-buildonly-randconfig-001-20250814 (https://download.01.org/0day-ci/archive/20250814/202508140702.KMYT7USe-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508140702.KMYT7USe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508140702.KMYT7USe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/exec.c:1759:2: error: call to undeclared function 'rseq_execve'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1759 |         rseq_execve(current);
         |         ^
   fs/exec.c:1759:2: note: did you mean 'ksm_execve'?
   include/linux/ksm.h:115:19: note: 'ksm_execve' declared here
     115 | static inline int ksm_execve(struct mm_struct *mm)
         |                   ^
   1 error generated.


vim +/rseq_execve +1759 fs/exec.c

5d1baf3b63bfc8 Oleg Nesterov     2013-09-11  1729  
978ffcbf00d82b Linus Torvalds    2024-01-08  1730  static int bprm_execve(struct linux_binprm *bprm)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1731  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1732  	int retval;
0f2122045b9462 Jens Axboe        2020-09-13  1733  
a2a8474c3fff88 Oleg Nesterov     2009-09-05  1734  	retval = prepare_bprm_creds(bprm);
a2a8474c3fff88 Oleg Nesterov     2009-09-05  1735  	if (retval)
b6043501289ebf Eric W. Biederman 2020-11-20  1736  		return retval;
498052bba55eca Al Viro           2009-03-30  1737  
275498a98b1fe7 Kees Cook         2022-10-18  1738  	/*
275498a98b1fe7 Kees Cook         2022-10-18  1739  	 * Check for unsafe execution states before exec_binprm(), which
275498a98b1fe7 Kees Cook         2022-10-18  1740  	 * will call back into begin_new_exec(), into bprm_creds_from_file(),
275498a98b1fe7 Kees Cook         2022-10-18  1741  	 * where setuid-ness is evaluated.
275498a98b1fe7 Kees Cook         2022-10-18  1742  	 */
9e00cdb091b008 Oleg Nesterov     2014-01-23  1743  	check_unsafe_exec(bprm);
a2a8474c3fff88 Oleg Nesterov     2009-09-05  1744  	current->in_execve = 1;
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  1745  	sched_mm_cid_before_execve(current);
a6f76f23d297f7 David Howells     2008-11-14  1746  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1747  	sched_exec();
^1da177e4c3f41 Linus Torvalds    2005-04-16  1748  
b8bff599261c93 Eric W. Biederman 2020-03-22  1749  	/* Set the unchanging part of bprm->cred */
b8bff599261c93 Eric W. Biederman 2020-03-22  1750  	retval = security_bprm_creds_for_exec(bprm);
a5874fde3c0884 Mickaël Salaün    2024-12-12  1751  	if (retval || bprm->is_check)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1752  		goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1753  
5d1baf3b63bfc8 Oleg Nesterov     2013-09-11  1754  	retval = exec_binprm(bprm);
a6f76f23d297f7 David Howells     2008-11-14  1755  	if (retval < 0)
a6f76f23d297f7 David Howells     2008-11-14  1756  		goto out;
a6f76f23d297f7 David Howells     2008-11-14  1757  
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  1758  	sched_mm_cid_after_execve(current);
169eae7711ea4b Mathieu Desnoyers 2025-03-27 @1759  	rseq_execve(current);
a6f76f23d297f7 David Howells     2008-11-14  1760  	/* execve succeeded */
f9ce1f1cda8b73 Kentaro Takeda    2009-02-05  1761  	current->in_execve = 0;
fd593511cdfc0b Beau Belgrave     2023-03-28  1762  	user_events_execve(current);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1763  	acct_update_integrals(current);
16d51a590a8ce3 Jann Horn         2019-07-16  1764  	task_numa_free(current, false);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1765  	return retval;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1766  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1767  out:
8890b29341f30f Eric W. Biederman 2020-04-04  1768  	/*
3d742d4b6ebb33 Randy Dunlap      2021-02-24  1769  	 * If past the point of no return ensure the code never
8890b29341f30f Eric W. Biederman 2020-04-04  1770  	 * returns to the userspace process.  Use an existing fatal
8890b29341f30f Eric W. Biederman 2020-04-04  1771  	 * signal if present otherwise terminate the process with
8890b29341f30f Eric W. Biederman 2020-04-04  1772  	 * SIGSEGV.
8890b29341f30f Eric W. Biederman 2020-04-04  1773  	 */
8890b29341f30f Eric W. Biederman 2020-04-04  1774  	if (bprm->point_of_no_return && !fatal_signal_pending(current))
e21294a7aaae32 Eric W. Biederman 2021-10-25  1775  		force_fatal_sig(SIGSEGV);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1776  
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  1777  	sched_mm_cid_after_execve(current);
169eae7711ea4b Mathieu Desnoyers 2025-03-27  1778  	rseq_set_notify_resume(current);
f9ce1f1cda8b73 Kentaro Takeda    2009-02-05  1779  	current->in_execve = 0;
a6f76f23d297f7 David Howells     2008-11-14  1780  
0c9cdff054aec0 Eric W. Biederman 2020-07-12  1781  	return retval;
0c9cdff054aec0 Eric W. Biederman 2020-07-12  1782  }
0c9cdff054aec0 Eric W. Biederman 2020-07-12  1783  

:::::: The code at line 1759 was first introduced by commit
:::::: 169eae7711ea4b745e2d33d53e7b88689b10e1a0 rseq: Eliminate useless task_work on execve

:::::: TO: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
