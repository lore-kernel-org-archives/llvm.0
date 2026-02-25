Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED1B30E830;
	Wed, 25 Feb 2026 20:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772051584; cv=none; b=qnZi21FemxxS14cwsvkhI4wJ2UaqefysAnfNyVTfPyZ7WO1Z26KYnHUbfK3JCNbd5bROclP2ReGnaugEHZtvKM4PjNwr2AcIZ1w3RwjD+xZ5Na8Tapp3LfJhlA37zGpiy8Iac5ZiDgRzjsXOdgINWY8P16UmnzoZ8sarG/6GjJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772051584; c=relaxed/simple;
	bh=AA5yUjh+wfL2uhzky9IyapxVOT6Sa8BBUuKC3EURrVg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bVxKmWDdhEkbQnK9SV/rMU6aUvr+yQymYQN/x2ujeSE3gNqFTQPnX8eNXKUrW6ziiVfsCOvaYdnmvTY25sMsgir6b6g9jFtvUh0W2F6XlAVWL2IO9NL9bZHnl/GxXMxjabUU7QHfy7RdgQnbDVX0iTVoEWkKH3OZ7y7oDKU2UFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PN0uYP/w; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PN0uYP/w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772051582; x=1803587582;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AA5yUjh+wfL2uhzky9IyapxVOT6Sa8BBUuKC3EURrVg=;
  b=PN0uYP/wqcJv5AMmLTgDL6jmR72D/ylYIRq6+laWMKXicitqKD/advO+
   M5b3zNKbjW2QyVJY+rI/fuJbbaeoptkL5XxuqnfGqkEvzqgQmLwJ6nb8Y
   UN0AhVkjjsWpkrqHxvkhPznXhuScQabcHryppIk8wrD6hx1MaFMKATAKT
   O+qG1GpbingM5tRpcjRdX7IExZwr4Xi6bhLJrG23ZRCCNLRJBl6GRf0L4
   ojbTY/z8T0ncC4DRvzEqAJHyU/gxV3cJzVClZbGqgJNc1o3eTT9WOfU7o
   Dl1YoEkZVxmf3bOisViirV1uP5GwJ1AP+L2n+YOLEajX/DIAdeClN7DZN
   A==;
X-CSE-ConnectionGUID: 9gR8Au03TMOrsPlYvpR9Gg==
X-CSE-MsgGUID: i759AaLKTUuNQgARwCSJ0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73209047"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="73209047"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 12:32:59 -0800
X-CSE-ConnectionGUID: egZLcQ9MSpa21LjT+SzfFQ==
X-CSE-MsgGUID: vMOjWhZXTW+Rt5v7/gh13Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="220969771"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 25 Feb 2026 12:32:58 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvLZ1-000000007GF-37YW;
	Wed, 25 Feb 2026 20:32:55 +0000
Date: Thu, 26 Feb 2026 04:23:31 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mark:sched/preempt-dynamic-optimizations 1/1]
 kernel/sched/core.c:7415:13: warning: no previous prototype for function
 '__cond_resched'
Message-ID: <202602260409.2GS5AzSo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git sche=
d/preempt-dynamic-optimizations
head:   b07713067f078a16fdbf289db10c6f72a7a75aa0
commit: b07713067f078a16fdbf289db10c6f72a7a75aa0 [1/1] HACK: sched: Disable=
 {cond,might}_resched() when ARCH_HAS_PREEMPT_LAZY=3Dy
config: s390-randconfig-001-20260226 (https://download.01.org/0day-ci/archi=
ve/20260226/202602260409.2GS5AzSo-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a1=
09fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260226/202602260409.2GS5AzSo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602260409.2GS5AzSo-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/core.c:7415:13: warning: no previous prototype for function=
 '__cond_resched' [-Wmissing-prototypes]
    7415 | int __sched __cond_resched(void)
         |             ^
   kernel/sched/core.c:7415:1: note: declare 'static' if the function is no=
t intended to be used outside of this translation unit
    7415 | int __sched __cond_resched(void)
         | ^
         | static=20
   kernel/sched/core.c:7455:13: warning: no previous prototype for function=
 'dynamic_cond_resched' [-Wmissing-prototypes]
    7455 | int __sched dynamic_cond_resched(void)
         |             ^
   kernel/sched/core.c:7455:1: note: declare 'static' if the function is no=
t intended to be used outside of this translation unit
    7455 | int __sched dynamic_cond_resched(void)
         | ^
         | static=20
>> kernel/sched/core.c:7464:13: warning: no previous prototype for function=
 'dynamic_might_resched' [-Wmissing-prototypes]
    7464 | int __sched dynamic_might_resched(void)
         |             ^
   kernel/sched/core.c:7464:1: note: declare 'static' if the function is no=
t intended to be used outside of this translation unit
    7464 | int __sched dynamic_might_resched(void)
         | ^
         | static=20
   3 warnings generated.


vim +/__cond_resched +7415 kernel/sched/core.c

d50dde5a10f305 kernel/sched/core.c Dario Faggioli     2013-11-07  7413 =20
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7414  #if=
 !defined(CONFIG_PREEMPTION) || defined(CONFIG_PREEMPT_DYNAMIC)
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07 @7415  int=
 __sched __cond_resched(void)
^1da177e4c3f41 kernel/sched.c      Linus Torvalds     2005-04-16  7416  {
82c387ef7568c0 kernel/sched/core.c Thomas Gleixner    2024-12-16  7417  	if=
 (should_resched(0) && !irqs_disabled()) {
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7418  		p=
reempt_schedule_common();
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7419  		r=
eturn 1;
^1da177e4c3f41 kernel/sched.c      Linus Torvalds     2005-04-16  7420  	}
^1da177e4c3f41 kernel/sched.c      Linus Torvalds     2005-04-16  7421  	/*
2c00e1199c0608 kernel/sched/core.c Ankur Arora        2024-12-12  7422  	 *=
 In PREEMPT_RCU kernels, ->rcu_read_lock_nesting tells the tick
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7423  	 *=
 whether the current CPU is in an RCU read-side critical section,
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7424  	 *=
 so the tick can report quiescent states even for CPUs looping
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7425  	 *=
 in kernel context.  In contrast, in non-preemptible kernels,
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7426  	 *=
 RCU readers leave no in-memory hints, which means that CPU-bound
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7427  	 *=
 processes executing in kernel context might never report an
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7428  	 *=
 RCU quiescent state.  Therefore, the following code causes
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7429  	 *=
 cond_resched() to report a quiescent state, but only when RCU
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7430  	 *=
 is in urgent need of one.
2c00e1199c0608 kernel/sched/core.c Ankur Arora        2024-12-12  7431  	 *=
 A third case, preemptible, but non-PREEMPT_RCU provides for
2c00e1199c0608 kernel/sched/core.c Ankur Arora        2024-12-12  7432  	 *=
 urgently needed quiescent states via rcu_flavor_sched_clock_irq().
^1da177e4c3f41 kernel/sched.c      Linus Torvalds     2005-04-16  7433  	 */
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7434  #if=
ndef CONFIG_PREEMPT_RCU
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7435  	rc=
u_all_qs();
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7436  #en=
dif
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7437  	re=
turn 0;
^1da177e4c3f41 kernel/sched.c      Linus Torvalds     2005-04-16  7438  }
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7439  EXP=
ORT_SYMBOL(__cond_resched);
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7440  #en=
dif
^1da177e4c3f41 kernel/sched.c      Linus Torvalds     2005-04-16  7441 =20
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7442  #if=
def CONFIG_PREEMPT_DYNAMIC
b7ebb758568b60 kernel/sched/core.c Ingo Molnar        2025-05-28  7443  # i=
fdef CONFIG_HAVE_PREEMPT_DYNAMIC_CALL
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7444  #  =
define cond_resched_dynamic_enabled	__cond_resched
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7445  #  =
define cond_resched_dynamic_disabled	((void *)&__static_call_return0)
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7446  DEF=
INE_STATIC_CALL_RET0(cond_resched, __cond_resched);
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7447  EXP=
ORT_STATIC_CALL_TRAMP(cond_resched);
48f24c4da1ee7f kernel/sched.c      Ingo Molnar        2006-07-03  7448 =20
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7449  #  =
define might_resched_dynamic_enabled	__cond_resched
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7450  #  =
define might_resched_dynamic_disabled ((void *)&__static_call_return0)
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7451  DEF=
INE_STATIC_CALL_RET0(might_resched, __cond_resched);
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7452  EXP=
ORT_STATIC_CALL_TRAMP(might_resched);
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7453  # e=
lif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7454  sta=
tic DEFINE_STATIC_KEY_FALSE(sk_dynamic_cond_resched);
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7455  int=
 __sched dynamic_cond_resched(void)
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7456  {
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7457  	if=
 (!static_branch_unlikely(&sk_dynamic_cond_resched))
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7458  		r=
eturn 0;
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7459  	re=
turn __cond_resched();
700a78335fc28a kernel/sched/core.c Christian G=C3=B6ttsche 2022-06-15  7460=
  }
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7461  EXP=
ORT_SYMBOL(dynamic_cond_resched);
700a78335fc28a kernel/sched/core.c Christian G=C3=B6ttsche 2022-06-15  7462=
 =20
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7463  sta=
tic DEFINE_STATIC_KEY_FALSE(sk_dynamic_might_resched);
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07 @7464  int=
 __sched dynamic_might_resched(void)
700a78335fc28a kernel/sched/core.c Christian G=C3=B6ttsche 2022-06-15  7465=
  {
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7466  	if=
 (!static_branch_unlikely(&sk_dynamic_might_resched))
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7467  		r=
eturn 0;
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7468  	re=
turn __cond_resched();
e43379f10b4219 kernel/sched.c      Matt Mackall       2005-05-01  7469  }
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7470  EXP=
ORT_SYMBOL(dynamic_might_resched);
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7471  # e=
ndif
b7ebb758568b60 kernel/sched/core.c Ingo Molnar        2025-05-28  7472  #en=
dif /* CONFIG_PREEMPT_DYNAMIC */
^1da177e4c3f41 kernel/sched.c      Linus Torvalds     2005-04-16  7473 =20

:::::: The code at line 7415 was first introduced by commit
:::::: 04746ed80bcf3130951ed4d5c1bc5b0bcabdde22 sched/syscalls: Split out k=
ernel/sched/syscalls.c from kernel/sched/core.c

:::::: TO: Ingo Molnar <mingo@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
