Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEDD31B83B;
	Mon, 12 Jan 2026 21:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768252690; cv=none; b=kQspe+QN1AMbEFW63BTDNRXNlsT/Xf4GjM5aYuovE1/OgJ8KykNtzSfHbcln3yi5qbKoC80qhIr7y30wOIPFAHklVNkZZihA2QzlnvX6Dy7lpoqD7oyHIjyO0qhPtqdqbRIjmDAIIJNIQJGFv8ZXc99Sd3OzzH3hdHt2r40wmG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768252690; c=relaxed/simple;
	bh=DfxObpo6Y93oK6WebsUhNJHm93ICTWu4vyN9DE21aPs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QddZ/1Z9r9z181fo2FdVEEAzcb4YIwEELuCL7+9YlEs8woZRe6dRrPTK3MQKKwGgB/8bmLhku73SQ66qtxuYGh1EjznGPtKqzhTlpPGN2BoKkJtym4ItatFUG4UkBUwL1x4QrCeg65bfIP8wqmJgOSwj/ZXJODjLQeVlW3i5zhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PXPVXyBG; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PXPVXyBG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768252690; x=1799788690;
  h=date:from:to:cc:subject:message-id;
  bh=DfxObpo6Y93oK6WebsUhNJHm93ICTWu4vyN9DE21aPs=;
  b=PXPVXyBGVcXqQdKuPwv7gshi4FHjhhFYn8OjJ0YEBsYgr+lTudERr592
   sORtHOKfBHhntN4xDVmwO+8gxgduRcCOGUusuz6pwvZ5eiG3npJC6b6cz
   K9rsE0KzWEBmTOYuLA8YrQIg1POCodFKGVTDpB/TdVRv8U1+Qjw/etnis
   VDbzztCR3y3LAveMlYAltfrfm5mPgWY64xudJlvBUKyEjHmAyxRE/1ty7
   B6CDpNbjQzY/pjiVzC0yR9KXx6j0/ILUDA8DSHZ9pzwmr0ZgzVz9wQg9Y
   a+XxVbwreqJYrjtskJMn2aTzxdeHBKQI+oonnZ5SmgLb+jnEQEVvo841A
   A==;
X-CSE-ConnectionGUID: NSYBG8n5RhK0mKgetCOkxA==
X-CSE-MsgGUID: eXb7FutBQ8Ghpj7CpXflnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69432797"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69432797"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 13:17:58 -0800
X-CSE-ConnectionGUID: QpxgiCe9Rq+eFWSFCySprQ==
X-CSE-MsgGUID: 0xHuBotZSbS8ldUMzzU7Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="203356870"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Jan 2026 13:17:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfPIP-00000000DtC-2WVc;
	Mon, 12 Jan 2026 21:17:53 +0000
Date: Tue, 13 Jan 2026 05:17:30 +0800
From: kernel test robot <lkp@intel.com>
To: Hou Wenlong <houwenlong.hwl@antgroup.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/urgent 2/2]
 arch/x86/kernel/traps.c:400:14: warning: no previous prototype for function
 'handle_bug'
Message-ID: <202601130559.lb8bMZHD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/urgent
head:   695d896472d6543523de43110b0016b8b4469643
commit: 695d896472d6543523de43110b0016b8b4469643 [2/2] x86_64/bug: Handle __WARN_printf() trap in early_fixup_exception()
config: i386-buildonly-randconfig-002-20260113 (https://download.01.org/0day-ci/archive/20260113/202601130559.lb8bMZHD-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130559.lb8bMZHD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601130559.lb8bMZHD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/traps.c:400:14: warning: no previous prototype for function 'handle_bug' [-Wmissing-prototypes]
     400 | noinstr bool handle_bug(struct pt_regs *regs)
         |              ^
   arch/x86/kernel/traps.c:400:9: note: declare 'static' if the function is not intended to be used outside of this translation unit
     400 | noinstr bool handle_bug(struct pt_regs *regs)
         |         ^
         |         static 
   1 warning generated.


vim +/handle_bug +400 arch/x86/kernel/traps.c

   399	
 > 400	noinstr bool handle_bug(struct pt_regs *regs)
   401	{
   402		unsigned long addr = regs->ip;
   403		bool handled = false;
   404		int ud_type, ud_len;
   405		s32 ud_imm;
   406	
   407		ud_type = decode_bug(addr, &ud_imm, &ud_len);
   408		if (ud_type == BUG_NONE)
   409			return handled;
   410	
   411		/*
   412		 * All lies, just get the WARN/BUG out.
   413		 */
   414		instrumentation_begin();
   415		/*
   416		 * Normally @regs are unpoisoned by irqentry_enter(), but handle_bug()
   417		 * is a rare case that uses @regs without passing them to
   418		 * irqentry_enter().
   419		 */
   420		kmsan_unpoison_entry_regs(regs);
   421		/*
   422		 * Since we're emulating a CALL with exceptions, restore the interrupt
   423		 * state to what it was at the exception site.
   424		 */
   425		if (regs->flags & X86_EFLAGS_IF)
   426			raw_local_irq_enable();
   427	
   428		switch (ud_type) {
   429		case BUG_UD1_WARN:
   430			if (report_bug_entry((void *)pt_regs_val(regs, ud_imm), regs) == BUG_TRAP_TYPE_WARN)
   431				handled = true;
   432			break;
   433	
   434		case BUG_UD2:
   435			if (report_bug(regs->ip, regs) == BUG_TRAP_TYPE_WARN) {
   436				handled = true;
   437				break;
   438			}
   439			fallthrough;
   440	
   441		case BUG_UDB:
   442		case BUG_LOCK:
   443			if (handle_cfi_failure(regs) == BUG_TRAP_TYPE_WARN) {
   444				handled = true;
   445				break;
   446			}
   447			break;
   448	
   449		case BUG_UD1_UBSAN:
   450			if (IS_ENABLED(CONFIG_UBSAN_TRAP)) {
   451				pr_crit("%s at %pS\n",
   452					report_ubsan_failure(ud_imm),
   453					(void *)regs->ip);
   454			}
   455			break;
   456	
   457		default:
   458			break;
   459		}
   460	
   461		/*
   462		 * When continuing, and regs->ip hasn't changed, move it to the next
   463		 * instruction. When not continuing execution, restore the instruction
   464		 * pointer.
   465		 */
   466		if (handled) {
   467			if (regs->ip == addr)
   468				regs->ip += ud_len;
   469		} else {
   470			regs->ip = addr;
   471		}
   472	
   473		if (regs->flags & X86_EFLAGS_IF)
   474			raw_local_irq_disable();
   475		instrumentation_end();
   476	
   477		return handled;
   478	}
   479	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
