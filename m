Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CB73D75A9;
	Thu, 21 May 2026 13:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368786; cv=none; b=SaO8iaIOlNbi/rkLYzAWRvA/tgWPp1usM0uBgRUrHqhYoafiunS42WyP5dbR4MH/hDuDsWoQeaRz2ofjwdqiK+qeoTepAiqaXHZUUdeKfPS513aidnTvK6Vtz19MuzIYo7bNTJT7ga7dczwWuhBok+/ruYhPmYq/YPGDml0D92o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368786; c=relaxed/simple;
	bh=BEBS3FSY9AkpptICWuEy94lxS6WQAqjCbT1Z1Mw4kmY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PNYmgFaman+OqS9mCjCUoS05XdbiUMLmtJ2y2pRpz3qeql0WWsBxcgKOri2lAvr1tKlvREsa2LPFOKTFigxlI8KllcgYqOmu1yQfc7Rjsb38dLWPDpbFgb9MjvLb/+QvTBUi/7axrD1irstZJaOJdcQNvf8VDZ6hmyMSS0I6aQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ut1BS141; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ut1BS141"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779368786; x=1810904786;
  h=date:from:to:cc:subject:message-id;
  bh=BEBS3FSY9AkpptICWuEy94lxS6WQAqjCbT1Z1Mw4kmY=;
  b=Ut1BS1418ifeLjvOZz6pwKHXCHGKy0y35arH8xwC5vPfgJYq6f42sT0e
   GRKugdoes68AGKr9/XAn6/X/yhj5mmMRwicX6jNfVDIjwf2ozjwtbmXsq
   vmZM9/KMxgOMgAnIcce+o5+DO/qmthGSovPIdmAB73xJQ9Yc1ItlCjUkz
   Y/oDIqWmKscDGNX/FJ//3ruW92D6nAYT1sULIVV9gX2wVFLQ7qYOTTsrt
   fzAXBDO+IeBarH466LSJ0TYhf+z59b2VLQguYKK3Lr2uFKeAxUOK2ruZg
   U8l3lp/PqpaBia5oMqA87RH27ty2Y521+j/S7MrVNOlN0Sz+lRrTYdxZY
   A==;
X-CSE-ConnectionGUID: RKFc5rQgTouCECQ5VrQUTw==
X-CSE-MsgGUID: kPdD37oCS4SRqo8HG1i7wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80464064"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="80464064"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 06:06:26 -0700
X-CSE-ConnectionGUID: TtDZ6c6qQyCmN4NqW/XIXw==
X-CSE-MsgGUID: Fc0cOnG4Remk7+nXdt2vUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="244805115"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 May 2026 06:06:23 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ36S-000000000K7-3XTg;
	Thu, 21 May 2026 13:06:20 +0000
Date: Thu, 21 May 2026 21:05:55 +0800
From: kernel test robot <lkp@intel.com>
To: Martin Kaiser <martin.kaiser@codasip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 882/1130]
 kernel/livepatch/patch.c:121:2: error: incompatible pointer to integer
 conversion assigning to 'unsigned long' from 'void *'
Message-ID: <202605212153.WkhEjI1e-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: 617b8799a3317f128df02703ebbc847a5b913978 [882/1130] ftrace: save capability-sized registers
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260521/202605212153.WkhEjI1e-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605212153.WkhEjI1e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605212153.WkhEjI1e-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/livepatch/patch.c:121:2: error: incompatible pointer to integer conversion assigning to 'unsigned long' from 'void *' [-Wint-conversion]
     121 |         ftrace_regs_set_instruction_pointer(fregs, func->new_func);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/ftrace.h:72:40: note: expanded from macro 'ftrace_regs_set_instruction_pointer'
      72 |         do { arch_ftrace_regs(fregs)->regs.ip = (_ip); } while (0)
         |                                               ^ ~~~~~
   1 error generated.


vim +121 kernel/livepatch/patch.c

    39	
    40	static void notrace klp_ftrace_handler(unsigned long ip,
    41					       unsigned long parent_ip,
    42					       struct ftrace_ops *fops,
    43					       struct ftrace_regs *fregs)
    44	{
    45		struct klp_ops *ops;
    46		struct klp_func *func;
    47		int patch_state;
    48		int bit;
    49	
    50		ops = container_of(fops, struct klp_ops, fops);
    51	
    52		/*
    53		 * The ftrace_test_recursion_trylock() will disable preemption,
    54		 * which is required for the variant of synchronize_rcu() that is
    55		 * used to allow patching functions where RCU is not watching.
    56		 * See klp_synchronize_transition() for more details.
    57		 */
    58		bit = ftrace_test_recursion_trylock(ip, parent_ip);
    59		if (WARN_ON_ONCE(bit < 0))
    60			return;
    61	
    62		func = list_first_or_null_rcu(&ops->func_stack, struct klp_func,
    63					      stack_node);
    64	
    65		/*
    66		 * func should never be NULL because preemption should be disabled here
    67		 * and unregister_ftrace_function() does the equivalent of a
    68		 * synchronize_rcu() before the func_stack removal.
    69		 */
    70		if (WARN_ON_ONCE(!func))
    71			goto unlock;
    72	
    73		/*
    74		 * In the enable path, enforce the order of the ops->func_stack and
    75		 * func->transition reads.  The corresponding write barrier is in
    76		 * __klp_enable_patch().
    77		 *
    78		 * (Note that this barrier technically isn't needed in the disable
    79		 * path.  In the rare case where klp_update_patch_state() runs before
    80		 * this handler, its TIF_PATCH_PENDING read and this func->transition
    81		 * read need to be ordered.  But klp_update_patch_state() already
    82		 * enforces that.)
    83		 */
    84		smp_rmb();
    85	
    86		if (unlikely(func->transition)) {
    87	
    88			/*
    89			 * Enforce the order of the func->transition and
    90			 * current->patch_state reads.  Otherwise we could read an
    91			 * out-of-date task state and pick the wrong function.  The
    92			 * corresponding write barrier is in klp_init_transition().
    93			 */
    94			smp_rmb();
    95	
    96			patch_state = current->patch_state;
    97	
    98			WARN_ON_ONCE(patch_state == KLP_TRANSITION_IDLE);
    99	
   100			if (patch_state == KLP_TRANSITION_UNPATCHED) {
   101				/*
   102				 * Use the previously patched version of the function.
   103				 * If no previous patches exist, continue with the
   104				 * original function.
   105				 */
   106				func = list_entry_rcu(func->stack_node.next,
   107						      struct klp_func, stack_node);
   108	
   109				if (&func->stack_node == &ops->func_stack)
   110					goto unlock;
   111			}
   112		}
   113	
   114		/*
   115		 * NOPs are used to replace existing patches with original code.
   116		 * Do nothing! Setting pc would cause an infinite loop.
   117		 */
   118		if (func->nop)
   119			goto unlock;
   120	
 > 121		ftrace_regs_set_instruction_pointer(fregs, func->new_func);
   122	
   123	unlock:
   124		ftrace_test_recursion_unlock(bit);
   125	}
   126	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
