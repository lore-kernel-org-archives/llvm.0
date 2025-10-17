Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FA8334688;
	Fri, 17 Oct 2025 11:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760700631; cv=none; b=E3GuZiRetbIPNwO/YQ40va7rudunfta1KMCCaPJzYsSb13sSKJHC9HsI4JAVIdGzE1Qy4e/9LTFPDrAIJMx87Y+RHD8xg/VPOuhLQ59np2knJcOjwkQW8YKvkepWoK2JkA8z8e1dpCdCpWqyyNamdN1ogILdy+ISxMhexi7z37U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760700631; c=relaxed/simple;
	bh=UOxG6FVbX7f5Kbj68ywdJSmTJvsUDynkaT+bUwkerwk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QhB/ZLwQZjXCEAgnJvgBE3qHD4M8MHI5bY9H9N5oih12qNvTJjNAW3nrFEIQ5uKlTKu4LXnKAYO4AFu62+qnSAgoz1MRfhUyqojJQT8Ak+nD64nAu90ASKzgY21xcH17uwDxAba8CGEkbPIqU6Hf8+NNWigDxxrQzkscAIMONA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nIg4LhJF; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nIg4LhJF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760700629; x=1792236629;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UOxG6FVbX7f5Kbj68ywdJSmTJvsUDynkaT+bUwkerwk=;
  b=nIg4LhJFfGyV5io/W0J8ylp+o7nwcRLoGJ6qDUU7wrDzpq8wy/t1CFK7
   smNf4htnTUc1OksxWRehMPpGgLUgfkKIUboHzyWFq3YzXEAL6jWfaP5D+
   7cdMUvlRRe+IFwmchDVaC525muwGGfr098fBuq57uJfEGrixBnaD3vVSq
   YlaUx8GAIQHLNurw/gM570pfrazmmdDREcao8a7ncKzWlN9fOkRGE1X/8
   RCl9Wk310ck4bfAinMsJW/FB53/kzdFkuPpfJJtwy5iPBwSrw0AUnNycD
   Aoq9dgMDtYwTCAA27VwQRw/juY5OhsDuJ/q0EHO+OGnmGEi2RaQqsZUFX
   w==;
X-CSE-ConnectionGUID: 1822UjOZT3m5pwYku1w/0w==
X-CSE-MsgGUID: VZgh0/KHQViAK/yzqFmYaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="73513899"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="73513899"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 04:30:28 -0700
X-CSE-ConnectionGUID: xnMpFlO0SgGkDH4lV+eaTw==
X-CSE-MsgGUID: i64J7G0pRMWyJxAvQqM+CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="182412893"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 17 Oct 2025 04:30:27 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9ifA-0005uo-2Q;
	Fri, 17 Oct 2025 11:30:24 +0000
Date: Fri, 17 Oct 2025 19:29:50 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/cid-v2 31/62] include/linux/rseq_entry.h:183:3:
 error: cannot jump from this asm goto statement to one of its possible
 targets
Message-ID: <202510171954.NcoH4NY0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/cid-v2
head:   64baaab00f25781e1449f942fee472a2575cb5bf
commit: 8706210bce8c0cd08f3e86572d4121e7d67ff07b [31/62] rseq: Provide and use rseq_update_user_cs()
config: arm64-randconfig-004-20251017 (https://download.01.org/0day-ci/archive/20251017/202510171954.NcoH4NY0-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510171954.NcoH4NY0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510171954.NcoH4NY0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/rseq.c:75:
>> include/linux/rseq_entry.h:183:3: error: cannot jump from this asm goto statement to one of its possible targets
     183 |                 unsafe_put_user(0ULL, &t->rseq.usrptr->rseq_cs, efault);
         |                 ^
   arch/arm64/include/asm/uaccess.h:426:2: note: expanded from macro 'unsafe_put_user'
     426 |         __raw_put_mem("sttr", x, uaccess_mask_ptr(ptr), label, U)
         |         ^
   arch/arm64/include/asm/uaccess.h:318:3: note: expanded from macro '__raw_put_mem'
     318 |                 __put_mem_asm(str, "%x", __pu_val, (ptr), label, type);         \
         |                 ^
   arch/arm64/include/asm/uaccess.h:298:2: note: expanded from macro '__put_mem_asm'
     298 |         asm goto(                                                       \
         |         ^
   include/linux/rseq_entry.h:193:1: note: possible target of asm goto statement
     193 | efault:
         | ^
   include/linux/rseq_entry.h:127:2: note: jump exits scope of variable with __attribute__((cleanup))
     127 |         scoped_masked_user_rw_access(ucs, efault) {
         |         ^
   include/linux/uaccess.h:831:2: note: expanded from macro 'scoped_masked_user_rw_access'
     831 |         scoped_masked_user_rw_access_size((_uptr), sizeof(*(_uptr)), _elbl)
         |         ^
   include/linux/uaccess.h:819:2: note: expanded from macro 'scoped_masked_user_rw_access_size'
     819 |         __scoped_masked_user_access(rw, (_uptr), (_size), _elbl)
         |         ^
   include/linux/uaccess.h:751:44: note: expanded from macro '__scoped_masked_user_access'
     751 |                 for (CLASS(masked_user_##_mode##_access, scope) (_tmpptr); !____stop;           \
         |                                                          ^
   In file included from kernel/rseq.c:75:
>> include/linux/rseq_entry.h:183:3: error: cannot jump from this asm goto statement to one of its possible targets
     183 |                 unsafe_put_user(0ULL, &t->rseq.usrptr->rseq_cs, efault);
         |                 ^
   arch/arm64/include/asm/uaccess.h:426:2: note: expanded from macro 'unsafe_put_user'
     426 |         __raw_put_mem("sttr", x, uaccess_mask_ptr(ptr), label, U)
         |         ^
   arch/arm64/include/asm/uaccess.h:315:3: note: expanded from macro '__raw_put_mem'
     315 |                 __put_mem_asm(str, "%w", __pu_val, (ptr), label, type);         \
         |                 ^
   arch/arm64/include/asm/uaccess.h:298:2: note: expanded from macro '__put_mem_asm'
     298 |         asm goto(                                                       \
         |         ^
   include/linux/rseq_entry.h:193:1: note: possible target of asm goto statement
     193 | efault:
         | ^
   include/linux/rseq_entry.h:127:2: note: jump exits scope of variable with __attribute__((cleanup))
     127 |         scoped_masked_user_rw_access(ucs, efault) {
         |         ^
   include/linux/uaccess.h:831:2: note: expanded from macro 'scoped_masked_user_rw_access'
     831 |         scoped_masked_user_rw_access_size((_uptr), sizeof(*(_uptr)), _elbl)
         |         ^
   include/linux/uaccess.h:819:2: note: expanded from macro 'scoped_masked_user_rw_access_size'
     819 |         __scoped_masked_user_access(rw, (_uptr), (_size), _elbl)
         |         ^
   include/linux/uaccess.h:751:44: note: expanded from macro '__scoped_masked_user_access'
     751 |                 for (CLASS(masked_user_##_mode##_access, scope) (_tmpptr); !____stop;           \
         |                                                          ^
   In file included from kernel/rseq.c:75:
>> include/linux/rseq_entry.h:183:3: error: cannot jump from this asm goto statement to one of its possible targets
     183 |                 unsafe_put_user(0ULL, &t->rseq.usrptr->rseq_cs, efault);
         |                 ^
   arch/arm64/include/asm/uaccess.h:426:2: note: expanded from macro 'unsafe_put_user'
     426 |         __raw_put_mem("sttr", x, uaccess_mask_ptr(ptr), label, U)
         |         ^
   arch/arm64/include/asm/uaccess.h:312:3: note: expanded from macro '__raw_put_mem'
     312 |                 __put_mem_asm(str "h", "%w", __pu_val, (ptr), label, type);     \
         |                 ^
   arch/arm64/include/asm/uaccess.h:298:2: note: expanded from macro '__put_mem_asm'
     298 |         asm goto(                                                       \
         |         ^
   include/linux/rseq_entry.h:193:1: note: possible target of asm goto statement
     193 | efault:
         | ^
   include/linux/rseq_entry.h:127:2: note: jump exits scope of variable with __attribute__((cleanup))
     127 |         scoped_masked_user_rw_access(ucs, efault) {
         |         ^
   include/linux/uaccess.h:831:2: note: expanded from macro 'scoped_masked_user_rw_access'
     831 |         scoped_masked_user_rw_access_size((_uptr), sizeof(*(_uptr)), _elbl)
         |         ^
   include/linux/uaccess.h:819:2: note: expanded from macro 'scoped_masked_user_rw_access_size'
     819 |         __scoped_masked_user_access(rw, (_uptr), (_size), _elbl)
         |         ^
   include/linux/uaccess.h:751:44: note: expanded from macro '__scoped_masked_user_access'
     751 |                 for (CLASS(masked_user_##_mode##_access, scope) (_tmpptr); !____stop;           \
         |                                                          ^
   In file included from kernel/rseq.c:75:
>> include/linux/rseq_entry.h:183:3: error: cannot jump from this asm goto statement to one of its possible targets
     183 |                 unsafe_put_user(0ULL, &t->rseq.usrptr->rseq_cs, efault);
         |                 ^
   arch/arm64/include/asm/uaccess.h:426:2: note: expanded from macro 'unsafe_put_user'
     426 |         __raw_put_mem("sttr", x, uaccess_mask_ptr(ptr), label, U)
         |         ^
   arch/arm64/include/asm/uaccess.h:309:3: note: expanded from macro '__raw_put_mem'
     309 |                 __put_mem_asm(str "b", "%w", __pu_val, (ptr), label, type);     \
         |                 ^
   arch/arm64/include/asm/uaccess.h:298:2: note: expanded from macro '__put_mem_asm'
     298 |         asm goto(                                                       \
         |         ^
   include/linux/rseq_entry.h:193:1: note: possible target of asm goto statement
     193 | efault:
         | ^
   include/linux/rseq_entry.h:127:2: note: jump exits scope of variable with __attribute__((cleanup))
     127 |         scoped_masked_user_rw_access(ucs, efault) {
         |         ^
   include/linux/uaccess.h:831:2: note: expanded from macro 'scoped_masked_user_rw_access'
     831 |         scoped_masked_user_rw_access_size((_uptr), sizeof(*(_uptr)), _elbl)
         |         ^
   include/linux/uaccess.h:819:2: note: expanded from macro 'scoped_masked_user_rw_access_size'
     819 |         __scoped_masked_user_access(rw, (_uptr), (_size), _elbl)
         |         ^
   include/linux/uaccess.h:751:44: note: expanded from macro '__scoped_masked_user_access'
     751 |                 for (CLASS(masked_user_##_mode##_access, scope) (_tmpptr); !____stop;           \
         |                                                          ^
   In file included from kernel/rseq.c:75:
   include/linux/rseq_entry.h:178:3: error: cannot jump from this asm goto statement to one of its possible targets
     178 |                 unsafe_put_user(0ULL, &t->rseq.usrptr->rseq_cs, efault);
         |                 ^
   arch/arm64/include/asm/uaccess.h:426:2: note: expanded from macro 'unsafe_put_user'
     426 |         __raw_put_mem("sttr", x, uaccess_mask_ptr(ptr), label, U)
         |         ^
   arch/arm64/include/asm/uaccess.h:318:3: note: expanded from macro '__raw_put_mem'
     318 |                 __put_mem_asm(str, "%x", __pu_val, (ptr), label, type);         \
         |                 ^
   arch/arm64/include/asm/uaccess.h:298:2: note: expanded from macro '__put_mem_asm'
     298 |         asm goto(                                                       \
         |         ^
   include/linux/rseq_entry.h:193:1: note: possible target of asm goto statement
     193 | efault:
         | ^
   include/linux/rseq_entry.h:127:2: note: jump exits scope of variable with __attribute__((cleanup))
     127 |         scoped_masked_user_rw_access(ucs, efault) {
         |         ^
   include/linux/uaccess.h:831:2: note: expanded from macro 'scoped_masked_user_rw_access'
     831 |         scoped_masked_user_rw_access_size((_uptr), sizeof(*(_uptr)), _elbl)
         |         ^
   include/linux/uaccess.h:819:2: note: expanded from macro 'scoped_masked_user_rw_access_size'
     819 |         __scoped_masked_user_access(rw, (_uptr), (_size), _elbl)
         |         ^
   include/linux/uaccess.h:751:44: note: expanded from macro '__scoped_masked_user_access'
     751 |                 for (CLASS(masked_user_##_mode##_access, scope) (_tmpptr); !____stop;           \
         |                                                          ^
   In file included from kernel/rseq.c:75:
   include/linux/rseq_entry.h:178:3: error: cannot jump from this asm goto statement to one of its possible targets
     178 |                 unsafe_put_user(0ULL, &t->rseq.usrptr->rseq_cs, efault);
         |                 ^
   arch/arm64/include/asm/uaccess.h:426:2: note: expanded from macro 'unsafe_put_user'
     426 |         __raw_put_mem("sttr", x, uaccess_mask_ptr(ptr), label, U)
         |         ^
   arch/arm64/include/asm/uaccess.h:315:3: note: expanded from macro '__raw_put_mem'
     315 |                 __put_mem_asm(str, "%w", __pu_val, (ptr), label, type);         \
         |                 ^
   arch/arm64/include/asm/uaccess.h:298:2: note: expanded from macro '__put_mem_asm'
     298 |         asm goto(                                                       \
         |         ^
   include/linux/rseq_entry.h:193:1: note: possible target of asm goto statement
     193 | efault:
         | ^
   include/linux/rseq_entry.h:127:2: note: jump exits scope of variable with __attribute__((cleanup))
     127 |         scoped_masked_user_rw_access(ucs, efault) {
         |         ^
   include/linux/uaccess.h:831:2: note: expanded from macro 'scoped_masked_user_rw_access'
     831 |         scoped_masked_user_rw_access_size((_uptr), sizeof(*(_uptr)), _elbl)
         |         ^
   include/linux/uaccess.h:819:2: note: expanded from macro 'scoped_masked_user_rw_access_size'
     819 |         __scoped_masked_user_access(rw, (_uptr), (_size), _elbl)
         |         ^
   include/linux/uaccess.h:751:44: note: expanded from macro '__scoped_masked_user_access'
     751 |                 for (CLASS(masked_user_##_mode##_access, scope) (_tmpptr); !____stop;           \
         |                                                          ^
   In file included from kernel/rseq.c:75:
   include/linux/rseq_entry.h:178:3: error: cannot jump from this asm goto statement to one of its possible targets
     178 |                 unsafe_put_user(0ULL, &t->rseq.usrptr->rseq_cs, efault);
         |                 ^
   arch/arm64/include/asm/uaccess.h:426:2: note: expanded from macro 'unsafe_put_user'
     426 |         __raw_put_mem("sttr", x, uaccess_mask_ptr(ptr), label, U)
         |         ^
   arch/arm64/include/asm/uaccess.h:312:3: note: expanded from macro '__raw_put_mem'
     312 |                 __put_mem_asm(str "h", "%w", __pu_val, (ptr), label, type);     \
         |                 ^
   arch/arm64/include/asm/uaccess.h:298:2: note: expanded from macro '__put_mem_asm'
     298 |         asm goto(                                                       \
         |         ^
   include/linux/rseq_entry.h:193:1: note: possible target of asm goto statement
     193 | efault:
         | ^
   include/linux/rseq_entry.h:127:2: note: jump exits scope of variable with __attribute__((cleanup))
     127 |         scoped_masked_user_rw_access(ucs, efault) {


vim +183 include/linux/rseq_entry.h

    84	
    85	/*
    86	 * Check whether there is a valid critical section and whether the
    87	 * instruction pointer in @regs is inside the critical section.
    88	 *
    89	 *  - If the critical section is invalid, terminate the task.
    90	 *
    91	 *  - If valid and the instruction pointer is inside, set it to the abort IP
    92	 *
    93	 *  - If valid and the instruction pointer is outside, clear the critical
    94	 *    section address.
    95	 *
    96	 * Returns true, if the section was valid and either fixup or clear was
    97	 * done, false otherwise.
    98	 *
    99	 * In the failure case task::rseq_event::fatal is set when a invalid
   100	 * section was found. It's clear when the failure was an unresolved page
   101	 * fault.
   102	 *
   103	 * If inlined into the exit to user path with interrupts disabled, the
   104	 * caller has to protect against page faults with pagefault_disable().
   105	 *
   106	 * In preemptible task context this would be counterproductive as the page
   107	 * faults could not be fully resolved. As a consequence unresolved page
   108	 * faults in task context are fatal too.
   109	 */
   110	
   111	#ifdef RSEQ_BUILD_SLOW_PATH
   112	/*
   113	 * The debug version is put out of line, but kept here so the code stays
   114	 * together.
   115	 *
   116	 * @csaddr has already been checked by the caller to be in user space
   117	 */
   118	bool rseq_debug_update_user_cs(struct task_struct *t, struct pt_regs *regs,
   119				       unsigned long csaddr)
   120	{
   121		struct rseq_cs __user *ucs = (struct rseq_cs __user *)(unsigned long)csaddr;
   122		u64 start_ip, abort_ip, offset, cs_end, head, tasksize = TASK_SIZE;
   123		unsigned long ip = instruction_pointer(regs);
   124		u64 __user *uc_head = (u64 __user *) ucs;
   125		u32 usig, __user *uc_sig;
   126	
   127		scoped_masked_user_rw_access(ucs, efault) {
   128			/*
   129			 * Evaluate the user pile and exit if one of the conditions
   130			 * is not fulfilled.
   131			 */
   132			unsafe_get_user(start_ip, &ucs->start_ip, efault);
   133			if (unlikely(start_ip >= tasksize))
   134				goto die;
   135			/* If outside, just clear the critical section. */
   136			if (ip < start_ip)
   137				goto clear;
   138	
   139			unsafe_get_user(offset, &ucs->post_commit_offset, efault);
   140			cs_end = start_ip + offset;
   141			/* Check for overflow and wraparound */
   142			if (unlikely(cs_end >= tasksize || cs_end < start_ip))
   143				goto die;
   144	
   145			/* If not inside, clear it. */
   146			if (ip >= cs_end)
   147				goto clear;
   148	
   149			unsafe_get_user(abort_ip, &ucs->abort_ip, efault);
   150			/* Ensure it's "valid" */
   151			if (unlikely(abort_ip >= tasksize || abort_ip < sizeof(*uc_sig)))
   152				goto die;
   153			/* Validate that the abort IP is not in the critical section */
   154			if (unlikely(abort_ip - start_ip < offset))
   155				goto die;
   156	
   157			/*
   158			 * Check version and flags for 0. No point in emitting
   159			 * deprecated warnings before dying. That could be done in
   160			 * the slow path eventually, but *shrug*.
   161			 */
   162			unsafe_get_user(head, uc_head, efault);
   163			if (unlikely(head))
   164				goto die;
   165	
   166			/* abort_ip - 4 is >= 0. See abort_ip check above */
   167			uc_sig = (u32 __user *)(unsigned long)(abort_ip - sizeof(*uc_sig));
   168			unsafe_get_user(usig, uc_sig, efault);
   169			if (unlikely(usig != t->rseq.sig))
   170				goto die;
   171	
   172			/* rseq_event.user_irq is only valid if CONFIG_GENERIC_IRQ_ENTRY=y */
   173			if (IS_ENABLED(CONFIG_GENERIC_IRQ_ENTRY)) {
   174				/* If not in interrupt from user context, let it die */
   175				if (unlikely(!t->rseq.event.user_irq))
   176					goto die;
   177			}
   178			unsafe_put_user(0ULL, &t->rseq.usrptr->rseq_cs, efault);
   179			instruction_pointer_set(regs, (unsigned long)abort_ip);
   180			rseq_stat_inc(rseq_stats.fixup);
   181			break;
   182		clear:
 > 183			unsafe_put_user(0ULL, &t->rseq.usrptr->rseq_cs, efault);
   184			rseq_stat_inc(rseq_stats.clear);
   185			abort_ip = 0ULL;
   186		}
   187	
   188		if (unlikely(abort_ip))
   189			rseq_trace_ip_fixup(ip, start_ip, offset, abort_ip);
   190		return true;
   191	die:
   192		t->rseq.event.fatal = true;
   193	efault:
   194		return false;
   195	}
   196	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
