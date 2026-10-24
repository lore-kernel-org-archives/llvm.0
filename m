Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792803061;
	b=Y85q+pXeubXF8Cx7L/5BG4JqvYFcAonqWQ98ThNX8ZYkIct5CHXj05NWsKYhqkdR4XXu
	 QnwtDWnF+iopqqHVv9SUUCyZAgaSk9bTBZUy3EPguRTvx1IL1MYzi6A1HFCl+xmL0KSJ7
	 byaPdWJjIkyqHTmmZgM6Af0gdx6/RKn6CFmO3lXuYfsLMEaLStUZsDCW6Nz/Kk2tfNa0/
	 1Cp/3ojfdmRyfH98Oqmqtlg2WYS+QtFzPmsfhPqR098cDDkNi46em5FHVd/lrKdCaBlBk
	 oytDXZ+rfQzsyjHo31haaLbw6pzCi6Msjq5YW/iC8WDl57xYLBlZcE/aP0jlhDnyh3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792803061;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=JSYUNar/tOY5LBdVqQGzlgZqoauQErcEV4DQhSpG4/k=;
	b=EpNndPEPCmfapLBxxJcSLEqYt+OaPNUxV9Sq2dSy43SBqg1dpaDI2/ingWhNStPGygIf
	 V+WoDPktDlLFwZDTItGwa8YtMu1a2aAYrli6gpy65CkfbS/xSm0GL+NRURsmki8sIQkFN
	 yPR85S9kjHlSLGAHqvogOLJfJ8Q2nTXGKZqjXxItQp1nPdeKLH55aQtYMV+2wWSyUPa4i
	 xXLQsEGhCXk4hwX3Pey1nZuVwXcsNnUYhYCy9ygvvpnz/K8gOA3OjKBLcrmIOB58lYQxQ
	 RHBltGUFZjqA+aBOMnDpDfyEPrGFuhFqN47Ymor0haxwtlPoeCRUzFbFzWHlv3iE8Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dBLhPbJ6;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB977606A31A;
	Sat, 24 Oct 2026 00:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB977606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dBLhPbJ6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792803060; x=1824339060;
  h=date:from:to:cc:subject:message-id;
  bh=i2mXs0A1Tjh2gMr34iM1qofcVBU4Nir/APpZAYpWPeg=;
  b=dBLhPbJ6GIro1T/2wiSsMA/syqIJ66ZA8tuA2VOF1c0IVMFlOQ7Bkyqb
   tqnTMLqp6xlfyBPyWDMWPZCgDHxeEYvS32tWFNTgJ4Q1RiJzW0R6K8amg
   5BPs+NfosmPjb+r941CPbW/aPeJq2/4xtM9xop3n2kHjujH3RwYxRqGG7
   xN6DmMfzO1ASLjNTfDzcP5usbm2BQAUP/XjSYH5pwU5l3VchUCWkLXG80
   O45AFtex55J1hhw8wOtF6m38uKyChiNb2mbIEL/etr6/wmHwPp6I4CMxZ
   /eTOViGECmkgvq8HE/j8QZNMDvxCtSoihb38G/L+GKN6vYfBfNAb3PY9i
   A==;
X-CSE-ConnectionGUID: 6V7nWnijTZ6rSuWxBEd83Q==
X-CSE-MsgGUID: 66BkM+NeQ1iI/61b8F0T7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1553095"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1553095"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 17:50:59 -0700
X-CSE-ConnectionGUID: ar5DtkqwQZ6i8obyb3UGHQ==
X-CSE-MsgGUID: 3oe/jp87Sz6OL5rN8/tKtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="3791521"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 23 Oct 2026 17:50:59 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKPyJ-000000002vT-3jsS;
	Sat, 24 Oct 2026 00:50:55 +0000
Date: Sat, 24 Oct 2026 02:50:51 +0200
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:kss-2026-10-23 25/25]
 arch/x86/kernel/cet.c:330:6: error: redefinition of
 'arch_kernel_stack_lock_current'
Message-ID: <202610240248.jnn1TnCR-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git kss-2026-10-23
head:   b6fa923e47fcecf329844fd91ed615de35478ea3
commit: b6fa923e47fcecf329844fd91ed615de35478ea3 [25/25] x86/boot: Add CPU shadow stack bootstrapping
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20261024/202610240248.jnn1TnCR-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610240248.jnn1TnCR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610240248.jnn1TnCR-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/cet.c:277:17: warning: no previous prototype for function 'kshstk_build' [-Wmissing-prototypes]
     277 | asmlinkage void kshstk_build(unsigned long *root_sp)
         |                 ^
   arch/x86/kernel/cet.c:277:12: note: declare 'static' if the function is not intended to be used outside of this translation unit
     277 | asmlinkage void kshstk_build(unsigned long *root_sp)
         |            ^
         |            static 
>> arch/x86/kernel/cet.c:330:6: error: redefinition of 'arch_kernel_stack_lock_current'
     330 | void arch_kernel_stack_lock_current(void)
         |      ^
   arch/x86/include/asm/shstk.h:49:20: note: previous definition is here
      49 | static inline void arch_kernel_stack_lock_current(void) {}
         |                    ^
>> arch/x86/kernel/cet.c:351:18: error: no member named 'kshstk_ssp' in 'struct thread_struct'
     351 |         current->thread.kshstk_ssp = kshstk_enable_current();
         |         ~~~~~~~~~~~~~~~ ^
>> arch/x86/kernel/cet.c:351:31: error: call to undeclared function 'kshstk_enable_current'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     351 |         current->thread.kshstk_ssp = kshstk_enable_current();
         |                                      ^
   1 warning and 3 errors generated.


vim +/arch_kernel_stack_lock_current +330 arch/x86/kernel/cet.c

   266	
   267	/*
   268	 * Use the unwinder infrastructure to walk back up the regular stack
   269	 * and mirror all the return addresses over to the shadow stack.
   270	 *
   271	 * root_sp is captured in assembly before calling here to prevent the
   272	 * compiler from messing with it. There may be additional frames or
   273	 * other gunk on the stack below root_sp by the time the unwinder
   274	 * starts, but those will ignored. All that matters is that the stack
   275	 * is back to "root_sp" when shadow stacks are enabled.
   276	 */
 > 277	asmlinkage void kshstk_build(unsigned long *root_sp)
   278	{
   279		unsigned long ents[KSHSTK_MAX_ENTS];
   280		struct unwind_state state;
   281		unsigned long *ro_slot;
   282		unsigned long *rw_slot;
   283		int n = 0;
   284	
   285		/*
   286		 * Use the unwinder to find the return addresses of callers.
   287		 * Note that ents[0] is the most recent call. The is the
   288		 * opposite of stacks. ents[] is tempoarary "upside down"
   289		 * storage that will be reversed when copied to the shadow
   290		 * stack.
   291		 */
   292		for (unwind_start(&state, current, NULL, root_sp);
   293		     !unwind_done(&state) && n < KSHSTK_MAX_ENTS;
   294		     unwind_next_frame(&state))
   295			ents[n++] = unwind_get_return_address(&state);
   296	
   297		BUG_ON(n == KSHSTK_MAX_ENTS);
   298	
   299		/* Transfer the return addresses to the shadow stack: */
   300		ro_slot = task_shstk_slot(0);
   301		rw_slot = shstk_alias(ro_slot);
   302		for (int i = n - 1; i >= 0; i--) {
   303			*rw_slot = ents[i];
   304			rw_slot--;
   305			ro_slot--;
   306		}
   307		/* Put a restore token in the last slot: */
   308		shstk_create_restore_token(ro_slot);
   309	}
   310	
   311	static void kshstk_prepare_pages(void)
   312	{
   313		/*
   314		 * Necessary for the init_task shadow stack on the boot CPU,
   315		 * but not the secondary CPUs which have normal vmap'd stacks.
   316		 */
   317		set_memory_shstk_noalias((unsigned long)task_shadow_stack(current),
   318					 shadow_stack_size() / PAGE_SIZE);
   319	}
   320	
   321	/*
   322	 * This "locks" the stack in place and does not allow any control
   323	 * flow manipulation to occur because of changes to the stack.
   324	 *
   325	 * CPU enters with shadow stacks disabled and leaves with them
   326	 * enabled.
   327	 *
   328	 * Must be called before the CPU does its first context switch.
   329	 */
 > 330	void arch_kernel_stack_lock_current(void)
   331	{
   332		unsigned long flags;
   333	
   334		if (!cpu_feature_enabled(X86_FEATURE_KERN_SHSTK))
   335			return;
   336	
   337		kshstk_prepare_pages();
   338	
   339		/*
   340		 * Regular interrupts are delivered on stack level 0. There
   341		 * is a window within the enabling where CET_SHSTK_EN=1 but
   342		 * SSP is not yet set. If an interrupt is delivered in that
   343		 * window, it would try to push on to this stack. Disable
   344		 * regular interrupts over this window.
   345		 *
   346		 * Interrupts that use other stack levels (like NMI) are OK
   347		 * because FRED switches stacks for them and does not push
   348		 * on stack level 0.
   349		 */
   350		local_irq_save(flags);
 > 351		current->thread.kshstk_ssp = kshstk_enable_current();

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
