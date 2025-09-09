Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190531D5CE8;
	Tue,  9 Sep 2025 07:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757403930; cv=none; b=t4aYPUgb+v4wVwQvtd85+rnIlgM32cms/eq5XGvgqBS+e13BkGLnK2NZH9/ZrDW7bHoqOgKzgKImYE0zEsIA7Ckp6zY1rRQH35aYXi2U09+uU7ye06kdQdpsFldcEuXeHAAuET9i3z37V0OWchKkH40n83IxKiNdEyxvDWGSAEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757403930; c=relaxed/simple;
	bh=DgLbBTsfNU1GLL+/gdtLM8LZRs7HUl/SySuSVgRu4Hg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ebiGJHzOl7ji3o6alJokAKT83A1bpme0gHnHdVDJtMAbAvFPu1xthwoQu07VeOyGoo5D+/QhRzTbWku1npuEGWjdoIM8hzRptybgcDtw2BCFNZzQVZSKBSW0R3hI78ZHuWhWFhyLGbF4J03+nxA/q0J2Of+kdisBf/iZ7u8czYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bdH/x/xH; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bdH/x/xH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757403929; x=1788939929;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DgLbBTsfNU1GLL+/gdtLM8LZRs7HUl/SySuSVgRu4Hg=;
  b=bdH/x/xHtrYD/XbJVYeljWm0cFkPT2vYrBmdlzFoEgm7XCouJAuhL152
   auizPOaP0QoXjjLnkmLyyjdiMhV4vE5lsWJ5DQq15nT+qzJo75EXGYvDW
   9ChxMqnbvlbP8wfcK5BLGL7p+rUOCTs1HjcnxvCakuH1+lFk1JZx+43yP
   R/Hd39GYxkvO1BzdsXj1L3sEontWfwpmhA3auDc18R0rx4OAu0qpmU0E8
   oRtBMZWFb7/aR91HkViwKUNHqiRj7KTals8hRZ2avomgBWxpfc9GJXlO8
   X2Bg4etfcB8EzMq2lGVA7RlFwJkaZCJf6Rl461efaKYNKR7IN7rrv3dVC
   w==;
X-CSE-ConnectionGUID: 0yBXv1OsTiSF06q95vEgzA==
X-CSE-MsgGUID: 6cVEXhbpTYWGbIPgT9ejyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59749871"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="59749871"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 00:45:28 -0700
X-CSE-ConnectionGUID: iRSuGsjaRoW2/h78JzeFxg==
X-CSE-MsgGUID: OS2c5byHRNeeLcourBLdHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="172183374"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Sep 2025 00:45:27 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvt2a-0004bd-2L;
	Tue, 09 Sep 2025 07:45:24 +0000
Date: Tue, 9 Sep 2025 15:45:18 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/slice 53/58] kernel/rseq.c:570:17: error: use of
 undeclared identifier '__NR_rseq_slice_yield'; did you mean
 'sys_rseq_slice_yield'?
Message-ID: <202509091526.S7YDwuui-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/slice
head:   a2e41ac0ef0218895394b1ac12abe5b67d6d62d0
commit: cb7ab3a89035c04560e3748df70de733c1a54663 [53/58] rseq: Implement syscall entry work for time slice extensions
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250909/202509091526.S7YDwuui-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509091526.S7YDwuui-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509091526.S7YDwuui-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/rseq.c:570:17: error: use of undeclared identifier '__NR_rseq_slice_yield'; did you mean 'sys_rseq_slice_yield'?
     570 |             syscall != __NR_rseq_slice_yield)
         |                        ^~~~~~~~~~~~~~~~~~~~~
         |                        sys_rseq_slice_yield
   include/linux/syscalls.h:960:17: note: 'sys_rseq_slice_yield' declared here
     960 | asmlinkage long sys_rseq_slice_yield(void);
         |                 ^
   1 error generated.


vim +570 kernel/rseq.c

   526	
   527	/*
   528	 * Invoked from syscall entry if a time slice extension was granted and the
   529	 * kernel did not clear it before user space left the critical section.
   530	 */
   531	void rseq_syscall_enter_work(long syscall)
   532	{
   533		struct task_struct *curr = current;
   534		bool granted = curr->rseq.slice.state.granted;
   535	
   536		clear_task_syscall_work(curr, SYSCALL_RSEQ_SLICE);
   537	
   538		if (static_branch_unlikely(&rseq_debug_enabled))
   539			rseq_slice_validate_ctrl(granted ? RSEQ_SLICE_EXT_GRANTED : 0);
   540	
   541		/*
   542		 * The kernel might have raced, revoked the grant and updated
   543		 * userspace, but kept the SLICE work set.
   544		 */
   545		if (!granted)
   546			return;
   547	
   548		rseq_stat_inc(rseq_stats.s_yielded);
   549	
   550		/*
   551		 * Required to make set_tsk_need_resched() correct on PREEMPT[RT]
   552		 * kernels.
   553		 */
   554		scoped_guard(preempt) {
   555			/*
   556			 * Now that preemption is disabled, quickly check whether
   557			 * the task was already rescheduled before arriving here.
   558			 */
   559			if (!curr->rseq.event.sched_switch)
   560				rseq_slice_set_need_resched(curr);
   561		}
   562	
   563		curr->rseq.slice.state.granted = false;
   564		/*
   565		 * Clear the grant in user space and check whether this was the
   566		 * correct syscall to yield. If the user access fails or the task
   567		 * used an arbitrary syscall, terminate it.
   568		 */
   569		if (put_user_masked_u32(0U, &curr->rseq.usrptr->slice_ctrl) ||
 > 570		    syscall != __NR_rseq_slice_yield)
   571			force_sig(SIGSEGV);
   572	}
   573	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
