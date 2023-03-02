Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A600AEC4;
	Thu,  2 Mar 2023 03:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677727200; x=1709263200;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t39k5IA0JGSnChZMwYnmkknrrqBavdd97gLwRrDss+s=;
  b=DaO6gLGfKmcLAYghAgTcPp57i+dd2GfCx1wBIpJ011pSHflThLo6vOgl
   o9yyEk4hjqrjrhNQ3DT7UHPS1N8UNrcqjQcRHdpBfJklnx7eMP77J1R9p
   TSktkiNxFhcp5c+X3a2Y/5hU5GzXRK85UW7JikiwNPOn0XVGa7p0pV4wY
   nhOSZQmKiNCuzDEKaVI5e72rZVjsL72J0EkwjPRLzcpc5A8CX+rY6Z6JZ
   52KZ0m2PToc+CQEWEDmArCu/4ubMjEPnGEGo5to1gEME64JYHGxZBosRO
   csYSzIMbKV3drKVSdjXlaFy417jSo/t3SHrY1gvaw5dSMhAoOOcKrgSZj
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="336898211"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="336898211"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 19:19:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="920496847"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="920496847"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 01 Mar 2023 19:19:58 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXZU5-00008h-1q;
	Thu, 02 Mar 2023 03:19:57 +0000
Date: Thu, 2 Mar 2023 11:19:14 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Gerst <brgerst@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	David Woodhouse <dwmw@amazon.co.uk>,
	Usama Arif <usama.arif@bytedance.com>
Subject: [dwmw2:parallel-6.2-rc8-v12bis 6/11]
 arch/x86/kernel/head_64.S:250:7: error: invalid operand for instruction
Message-ID: <202303021149.0zmHwcA6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux parallel-6.2-rc8-v12bis
head:   1be25b975a05184b71fc403cb4f742d78d1fbf32
commit: ac86ad32434d4661db0bef6791b7953d369585e2 [6/11] x86/smpboot: Remove initial_stack on 64-bit
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20230302/202303021149.0zmHwcA6-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add dwmw2 git://git.infradead.org/users/dwmw2/linux
        git fetch --no-tags dwmw2 parallel-6.2-rc8-v12bis
        git checkout ac86ad32434d4661db0bef6791b7953d369585e2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303021149.0zmHwcA6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/head_64.S:250:7: error: invalid operand for instruction
    xorq %edx, %edx
         ^~~~


vim +250 arch/x86/kernel/head_64.S

   189	
   190		/* Enable PAE mode, PGE and LA57 */
   191		orl	$(X86_CR4_PAE | X86_CR4_PGE), %ecx
   192	#ifdef CONFIG_X86_5LEVEL
   193		testl	$1, __pgtable_l5_enabled(%rip)
   194		jz	1f
   195		orl	$X86_CR4_LA57, %ecx
   196	1:
   197	#endif
   198		movq	%rcx, %cr4
   199	
   200		/* Setup early boot stage 4-/5-level pagetables. */
   201		addq	phys_base(%rip), %rax
   202	
   203		/*
   204		 * For SEV guests: Verify that the C-bit is correct. A malicious
   205		 * hypervisor could lie about the C-bit position to perform a ROP
   206		 * attack on the guest by writing to the unencrypted stack and wait for
   207		 * the next RET instruction.
   208		 * %rsi carries pointer to realmode data and is callee-clobbered. Save
   209		 * and restore it.
   210		 */
   211		pushq	%rsi
   212		movq	%rax, %rdi
   213		call	sev_verify_cbit
   214		popq	%rsi
   215	
   216		/*
   217		 * Switch to new page-table
   218		 *
   219		 * For the boot CPU this switches to early_top_pgt which still has the
   220		 * indentity mappings present. The secondary CPUs will switch to the
   221		 * init_top_pgt here, away from the trampoline_pgd and unmap the
   222		 * indentity mapped ranges.
   223		 */
   224		movq	%rax, %cr3
   225	
   226		/*
   227		 * Do a global TLB flush after the CR3 switch to make sure the TLB
   228		 * entries from the identity mapping are flushed.
   229		 */
   230		movq	%cr4, %rcx
   231		movq	%rcx, %rax
   232		xorq	$X86_CR4_PGE, %rcx
   233		movq	%rcx, %cr4
   234		movq	%rax, %cr4
   235	
   236		/* Ensure I am executing from virtual addresses */
   237		movq	$1f, %rax
   238		ANNOTATE_RETPOLINE_SAFE
   239		jmp	*%rax
   240	1:
   241		UNWIND_HINT_EMPTY
   242		ANNOTATE_NOENDBR // above
   243	
   244	#ifdef CONFIG_SMP
   245		movl	smpboot_control(%rip), %ecx
   246	
   247		/* Get the per cpu offset for the given CPU# which is in ECX */
   248		movq	__per_cpu_offset(,%rcx,8), %rdx
   249	#else
 > 250		xorq	%edx, %edx /* zero-extended to clear all of RDX */
   251	#endif /* CONFIG_SMP */
   252	
   253		/*
   254		 * Setup a boot time stack - Any secondary CPU will have lost its stack
   255		 * by now because the cr3-switch above unmaps the real-mode stack.
   256		 *
   257		 * RDX contains the per-cpu offset
   258		 */
   259		movq	pcpu_hot + X86_current_task(%rdx), %rax
   260		movq	TASK_threadsp(%rax), %rsp
   261	
   262		/*
   263		 * We must switch to a new descriptor in kernel space for the GDT
   264		 * because soon the kernel won't have access anymore to the userspace
   265		 * addresses where we're currently running on. We have to do that here
   266		 * because in 32bit we couldn't load a 64bit linear address.
   267		 */
   268		lgdt	early_gdt_descr(%rip)
   269	
   270		/* set up data segments */
   271		xorl %eax,%eax
   272		movl %eax,%ds
   273		movl %eax,%ss
   274		movl %eax,%es
   275	
   276		/*
   277		 * We don't really need to load %fs or %gs, but load them anyway
   278		 * to kill any stale realmode selectors.  This allows execution
   279		 * under VT hardware.
   280		 */
   281		movl %eax,%fs
   282		movl %eax,%gs
   283	
   284		/* Set up %gs.
   285		 *
   286		 * The base of %gs always points to fixed_percpu_data. If the
   287		 * stack protector canary is enabled, it is located at %gs:40.
   288		 * Note that, on SMP, the boot cpu uses init data section until
   289		 * the per cpu areas are set up.
   290		 */
   291		movl	$MSR_GS_BASE,%ecx
   292		movl	initial_gs(%rip),%eax
   293		movl	initial_gs+4(%rip),%edx
   294		wrmsr
   295	
   296		/* Setup and Load IDT */
   297		pushq	%rsi
   298		call	early_setup_idt
   299		popq	%rsi
   300	
   301		/* Check if nx is implemented */
   302		movl	$0x80000001, %eax
   303		cpuid
   304		movl	%edx,%edi
   305	
   306		/* Setup EFER (Extended Feature Enable Register) */
   307		movl	$MSR_EFER, %ecx
   308		rdmsr
   309		/*
   310		 * Preserve current value of EFER for comparison and to skip
   311		 * EFER writes if no change was made (for TDX guest)
   312		 */
   313		movl    %eax, %edx
   314		btsl	$_EFER_SCE, %eax	/* Enable System Call */
   315		btl	$20,%edi		/* No Execute supported? */
   316		jnc     1f
   317		btsl	$_EFER_NX, %eax
   318		btsq	$_PAGE_BIT_NX,early_pmd_flags(%rip)
   319	
   320		/* Avoid writing EFER if no change was made (for TDX guest) */
   321	1:	cmpl	%edx, %eax
   322		je	1f
   323		xor	%edx, %edx
   324		wrmsr				/* Make changes effective */
   325	1:
   326		/* Setup cr0 */
   327		movl	$CR0_STATE, %eax
   328		/* Make changes effective */
   329		movq	%rax, %cr0
   330	
   331		/* zero EFLAGS after setting rsp */
   332		pushq $0
   333		popfq
   334	
   335		/* rsi is pointer to real mode structure with interesting info.
   336		   pass it to C */
   337		movq	%rsi, %rdi
   338	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
