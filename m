Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BB37E
	for <llvm@lists.linux.dev>; Sat,  4 Jun 2022 13:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654348480; x=1685884480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ytrw4Og2YCHQpPFnuFjJZsjin+GwHNxM2aWxWrx7swg=;
  b=ETMpiWn+3gLT/ZzJcNDFH0J8NNdCi2s2RgBGcs4B+vrzaqULwruzLJH0
   xAarKdZaGSmo2axf4liVu4VzJVnVvPLm3VVceFjRdw7sGScjV5fEnpTwN
   PPZNLjpwic5/eRyKCySscOTjI4DK2amX05To1sLMOKwBm/ABd/m3tFLeA
   +hf0dX2twnjJuzwoxpIQ85ehLqV2MN7liYegCdRJJ/VMkIMLhKAD/zC/d
   BgcTd3/WfMbYgojq9rY2rk7flqzWLo8I6h6aHztZhlA8b9anr0Yt4e6KQ
   /owYxIAgbCZRpuxCL1CiY8gmeINaeyAS+6VKC7FAu9TflJ/qO87ReZU5U
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10368"; a="256295932"
X-IronPort-AV: E=Sophos;i="5.91,277,1647327600"; 
   d="scan'208";a="256295932"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2022 06:14:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,277,1647327600"; 
   d="scan'208";a="681561309"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 04 Jun 2022 06:14:37 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nxTbx-000AtU-6U;
	Sat, 04 Jun 2022 13:14:37 +0000
Date: Sat, 4 Jun 2022 21:14:13 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 14460/14806]
 arch/powerpc/kernel/head_book3s_32.S:843:15: error: invalid operand for
 instruction
Message-ID: <202206042137.ddP716IJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1cfd968b58a10b2b2489d8f64c956c846621ba46
commit: 3e8635fb2e072672cbc650989ffedf8300ad67fb [14460/14806] powerpc/kasan: Force thread size increase with KASAN
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20220604/202206042137.ddP716IJ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b364c76683f8ef241025a9556300778c07b590c2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=3e8635fb2e072672cbc650989ffedf8300ad67fb
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 3e8635fb2e072672cbc650989ffedf8300ad67fb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/kernel/ fs/cifs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

    ^
   arch/powerpc/kernel/head_book3s_32.S:643:66: note: while in macro instantiation
    .section ".head.text","ax"; . = 0x2700; DO_KVM 0x2700; Trap_27: EXCEPTION_PROLOG 0x2700 Trap_27; prepare_transfer_to_handler; bl unknown_exception; b interrupt_return
                                                                    ^
   <instantiation>:6:17: error: invalid operand for instruction
    addi %r1, %r1, (1 << (15 + 1)) - 208
                   ^
   <instantiation>:2:2: note: while in macro instantiation
    EXCEPTION_PROLOG_1
    ^
   arch/powerpc/kernel/head_book3s_32.S:644:66: note: while in macro instantiation
    .section ".head.text","ax"; . = 0x2800; DO_KVM 0x2800; Trap_28: EXCEPTION_PROLOG 0x2800 Trap_28; prepare_transfer_to_handler; bl unknown_exception; b interrupt_return
                                                                    ^
   <instantiation>:6:17: error: invalid operand for instruction
    addi %r1, %r1, (1 << (15 + 1)) - 208
                   ^
   <instantiation>:2:2: note: while in macro instantiation
    EXCEPTION_PROLOG_1
    ^
   arch/powerpc/kernel/head_book3s_32.S:645:66: note: while in macro instantiation
    .section ".head.text","ax"; . = 0x2900; DO_KVM 0x2900; Trap_29: EXCEPTION_PROLOG 0x2900 Trap_29; prepare_transfer_to_handler; bl unknown_exception; b interrupt_return
                                                                    ^
   <instantiation>:6:17: error: invalid operand for instruction
    addi %r1, %r1, (1 << (15 + 1)) - 208
                   ^
   <instantiation>:2:2: note: while in macro instantiation
    EXCEPTION_PROLOG_1
    ^
   arch/powerpc/kernel/head_book3s_32.S:646:66: note: while in macro instantiation
    .section ".head.text","ax"; . = 0x2a00; DO_KVM 0x2a00; Trap_2a: EXCEPTION_PROLOG 0x2a00 Trap_2a; prepare_transfer_to_handler; bl unknown_exception; b interrupt_return
                                                                    ^
   <instantiation>:6:17: error: invalid operand for instruction
    addi %r1, %r1, (1 << (15 + 1)) - 208
                   ^
   <instantiation>:2:2: note: while in macro instantiation
    EXCEPTION_PROLOG_1
    ^
   arch/powerpc/kernel/head_book3s_32.S:647:66: note: while in macro instantiation
    .section ".head.text","ax"; . = 0x2b00; DO_KVM 0x2b00; Trap_2b: EXCEPTION_PROLOG 0x2b00 Trap_2b; prepare_transfer_to_handler; bl unknown_exception; b interrupt_return
                                                                    ^
   <instantiation>:6:17: error: invalid operand for instruction
    addi %r1, %r1, (1 << (15 + 1)) - 208
                   ^
   <instantiation>:2:2: note: while in macro instantiation
    EXCEPTION_PROLOG_1
    ^
   arch/powerpc/kernel/head_book3s_32.S:648:66: note: while in macro instantiation
    .section ".head.text","ax"; . = 0x2c00; DO_KVM 0x2c00; Trap_2c: EXCEPTION_PROLOG 0x2c00 Trap_2c; prepare_transfer_to_handler; bl unknown_exception; b interrupt_return
                                                                    ^
   <instantiation>:6:17: error: invalid operand for instruction
    addi %r1, %r1, (1 << (15 + 1)) - 208
                   ^
   <instantiation>:2:2: note: while in macro instantiation
    EXCEPTION_PROLOG_1
    ^
   arch/powerpc/kernel/head_book3s_32.S:649:66: note: while in macro instantiation
    .section ".head.text","ax"; . = 0x2d00; DO_KVM 0x2d00; Trap_2d: EXCEPTION_PROLOG 0x2d00 Trap_2d; prepare_transfer_to_handler; bl unknown_exception; b interrupt_return
                                                                    ^
   <instantiation>:6:17: error: invalid operand for instruction
    addi %r1, %r1, (1 << (15 + 1)) - 208
                   ^
   <instantiation>:2:2: note: while in macro instantiation
    EXCEPTION_PROLOG_1
    ^
   arch/powerpc/kernel/head_book3s_32.S:650:66: note: while in macro instantiation
    .section ".head.text","ax"; . = 0x2e00; DO_KVM 0x2e00; Trap_2e: EXCEPTION_PROLOG 0x2e00 Trap_2e; prepare_transfer_to_handler; bl unknown_exception; b interrupt_return
                                                                    ^
   <instantiation>:6:17: error: invalid operand for instruction
    addi %r1, %r1, (1 << (15 + 1)) - 208
                   ^
   <instantiation>:2:2: note: while in macro instantiation
    EXCEPTION_PROLOG_1
    ^
   arch/powerpc/kernel/head_book3s_32.S:651:66: note: while in macro instantiation
    .section ".head.text","ax"; . = 0x2f00; DO_KVM 0x2f00; Trap_2f: EXCEPTION_PROLOG 0x2f00 Trap_2f; prepare_transfer_to_handler; bl unknown_exception; b interrupt_return
                                                                    ^
   <instantiation>:12:17: error: invalid operand for instruction
    addi %r1, %r1, (1 << (15 + 1)) - 208
                   ^
   arch/powerpc/kernel/head_book3s_32.S:731:2: note: while in macro instantiation
    vmap_stack_overflow_exception
    ^
   <instantiation>:6:17: error: invalid operand for instruction
    addi %r1, %r1, (1 << (15 + 1)) - 208
                   ^
   <instantiation>:2:2: note: while in macro instantiation
    EXCEPTION_PROLOG_1
    ^
   arch/powerpc/kernel/head_book3s_32.S:736:2: note: while in macro instantiation
    EXCEPTION_PROLOG 0xf20 AltiVecUnavailable
    ^
   <instantiation>:6:17: error: invalid operand for instruction
    addi %r1, %r1, (1 << (15 + 1)) - 208
                   ^
   <instantiation>:2:2: note: while in macro instantiation
    EXCEPTION_PROLOG_1
    ^
   arch/powerpc/kernel/head_book3s_32.S:748:2: note: while in macro instantiation
    EXCEPTION_PROLOG 0xf00 PerformanceMonitor
    ^
>> arch/powerpc/kernel/head_book3s_32.S:843:15: error: invalid operand for instruction
    addi %r1,%r1,(1 << (15 + 1))-16
                 ^
   arch/powerpc/kernel/head_book3s_32.S:969:11: error: invalid operand for instruction
    stwu %r0,(1 << (15 + 1))-16(%r1)
             ^
--
>> arch/powerpc/kernel/misc_32.S:385:15: error: invalid operand for instruction
    addi %r1,%r1,(1 << (15 + 1))-16
                 ^


vim +843 arch/powerpc/kernel/head_book3s_32.S

cd08f109e26231 arch/powerpc/kernel/head_32.S        Christophe Leroy       2019-12-21  733  
dc13b889b586f4 arch/powerpc/kernel/head_book3s_32.S Christophe Leroy       2021-03-12  734  	__HEAD
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  735  AltiVecUnavailable:
719e7e212c7e63 arch/powerpc/kernel/head_book3s_32.S Christophe Leroy       2021-03-12  736  	EXCEPTION_PROLOG 0xf20 AltiVecUnavailable
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  737  #ifdef CONFIG_ALTIVEC
37f9ef553bed63 arch/powerpc/kernel/head_32.S        Benjamin Herrenschmidt 2009-06-12  738  	beq	1f
37f9ef553bed63 arch/powerpc/kernel/head_32.S        Benjamin Herrenschmidt 2009-06-12  739  	bl	load_up_altivec		/* if from user, just load it up */
37f9ef553bed63 arch/powerpc/kernel/head_32.S        Benjamin Herrenschmidt 2009-06-12  740  	b	fast_exception_return
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  741  #endif /* CONFIG_ALTIVEC */
4c0104a83fc399 arch/powerpc/kernel/head_book3s_32.S Christophe Leroy       2021-03-12  742  1:	prepare_transfer_to_handler
4c0104a83fc399 arch/powerpc/kernel/head_book3s_32.S Christophe Leroy       2021-03-12  743  	bl	altivec_unavailable_exception
4c0104a83fc399 arch/powerpc/kernel/head_book3s_32.S Christophe Leroy       2021-03-12  744  	b	interrupt_return
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  745  
dc13b889b586f4 arch/powerpc/kernel/head_book3s_32.S Christophe Leroy       2021-03-12  746  	__HEAD
555d97ac87aef0 arch/powerpc/kernel/head_32.S        Andy Fleming           2005-12-15  747  PerformanceMonitor:
719e7e212c7e63 arch/powerpc/kernel/head_book3s_32.S Christophe Leroy       2021-03-12 @748  	EXCEPTION_PROLOG 0xf00 PerformanceMonitor
4c0104a83fc399 arch/powerpc/kernel/head_book3s_32.S Christophe Leroy       2021-03-12  749  	prepare_transfer_to_handler
4c0104a83fc399 arch/powerpc/kernel/head_book3s_32.S Christophe Leroy       2021-03-12  750  	bl	performance_monitor_exception
4c0104a83fc399 arch/powerpc/kernel/head_book3s_32.S Christophe Leroy       2021-03-12  751  	b	interrupt_return
555d97ac87aef0 arch/powerpc/kernel/head_32.S        Andy Fleming           2005-12-15  752  
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  753  
dc13b889b586f4 arch/powerpc/kernel/head_book3s_32.S Christophe Leroy       2021-03-12  754  	__HEAD
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  755  /*
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  756   * This code is jumped to from the startup code to copy
ccdcef72c249c2 arch/powerpc/kernel/head_32.S        Dale Farnsworth        2008-12-17  757   * the kernel image to physical address PHYSICAL_START.
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  758   */
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  759  relocate_kernel:
ccdcef72c249c2 arch/powerpc/kernel/head_32.S        Dale Farnsworth        2008-12-17  760  	lis	r3,PHYSICAL_START@h	/* Destination base address */
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  761  	li	r6,0			/* Destination offset */
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  762  	li	r5,0x4000		/* # bytes of memory to copy */
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  763  	bl	copy_and_flush		/* copy the first 0x4000 bytes */
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  764  	addi	r0,r3,4f@l		/* jump to the address of 4f */
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  765  	mtctr	r0			/* in copy and do the rest. */
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  766  	bctr				/* jump to the copy */
56afad88522890 arch/powerpc/kernel/head_book3s_32.S Christophe Leroy       2021-06-04  767  4:	lis	r5,_end-KERNELBASE@h
56afad88522890 arch/powerpc/kernel/head_book3s_32.S Christophe Leroy       2021-06-04  768  	ori	r5,r5,_end-KERNELBASE@l
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  769  	bl	copy_and_flush		/* copy the rest */
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  770  	b	turn_on_mmu
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  771  
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  772  /*
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  773   * Copy routine used to copy the kernel to start at physical address 0
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  774   * and flush and invalidate the caches as needed.
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  775   * r3 = dest addr, r4 = source addr, r5 = copy limit, r6 = start offset
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  776   * on exit, r3, r4, r5 are unchanged, r6 is updated to be >= r5.
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  777   */
27e21e8f128a56 arch/powerpc/kernel/head_book3s_32.S Christophe Leroy       2021-11-30  778  _GLOBAL(copy_and_flush)
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  779  	addi	r5,r5,-4
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  780  	addi	r6,r6,-4
7dffb72028bfd9 arch/powerpc/kernel/head_32.S        Stephen Rothwell       2005-10-17  781  4:	li	r0,L1_CACHE_BYTES/4
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  782  	mtctr	r0
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  783  3:	addi	r6,r6,4			/* copy a cache line */
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  784  	lwzx	r0,r6,r4
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  785  	stwx	r0,r6,r3
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  786  	bdnz	3b
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  787  	dcbst	r6,r3			/* write it to memory */
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  788  	sync
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  789  	icbi	r6,r3			/* flush the icache line */
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  790  	cmplw	0,r6,r5
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  791  	blt	4b
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  792  	sync				/* additional sync needed on g4 */
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  793  	isync
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  794  	addi	r5,r5,4
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  795  	addi	r6,r6,4
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  796  	blr
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  797  
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  798  #ifdef CONFIG_SMP
ee0339f205d603 arch/powerpc/kernel/head_32.S        Jon Loeliger           2006-06-17  799  	.globl __secondary_start_mpc86xx
ee0339f205d603 arch/powerpc/kernel/head_32.S        Jon Loeliger           2006-06-17  800  __secondary_start_mpc86xx:
ee0339f205d603 arch/powerpc/kernel/head_32.S        Jon Loeliger           2006-06-17  801  	mfspr	r3, SPRN_PIR
ee0339f205d603 arch/powerpc/kernel/head_32.S        Jon Loeliger           2006-06-17  802  	stw	r3, __secondary_hold_acknowledge@l(0)
ee0339f205d603 arch/powerpc/kernel/head_32.S        Jon Loeliger           2006-06-17  803  	mr	r24, r3			/* cpu # */
ee0339f205d603 arch/powerpc/kernel/head_32.S        Jon Loeliger           2006-06-17  804  	b	__secondary_start
ee0339f205d603 arch/powerpc/kernel/head_32.S        Jon Loeliger           2006-06-17  805  
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  806  	.globl	__secondary_start_pmac_0
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  807  __secondary_start_pmac_0:
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  808  	/* NB the entries for cpus 0, 1, 2 must each occupy 8 bytes. */
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  809  	li	r24,0
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  810  	b	1f
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  811  	li	r24,1
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  812  	b	1f
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  813  	li	r24,2
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  814  	b	1f
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  815  	li	r24,3
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  816  1:
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  817  	/* on powersurge, we come in here with IR=0 and DR=1, and DBAT 0
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  818  	   set to map the 0xf0000000 - 0xffffffff region */
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  819  	mfmsr	r0
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  820  	rlwinm	r0,r0,0,28,26		/* clear DR (0x10) */
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  821  	mtmsr	r0
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  822  	isync
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  823  
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  824  	.globl	__secondary_start
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  825  __secondary_start:
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  826  	/* Copy some CPU settings from CPU 0 */
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  827  	bl	__restore_cpu_setup
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  828  
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  829  	lis	r3,-KERNELBASE@h
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  830  	mr	r4,r24
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  831  	bl	call_setup_cpu		/* Call setup_cpu for this CPU */
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  832  	lis	r3,-KERNELBASE@h
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  833  	bl	init_idle_6xx
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  834  
4e67bfd7aa21b4 arch/powerpc/kernel/head_32.S        Christophe Leroy       2019-01-17  835  	/* get current's stack and current */
7c19c2e5f9c18e arch/powerpc/kernel/head_32.S        Christophe Leroy       2019-01-31  836  	lis	r2,secondary_current@ha
7c19c2e5f9c18e arch/powerpc/kernel/head_32.S        Christophe Leroy       2019-01-31  837  	tophys(r2,r2)
7c19c2e5f9c18e arch/powerpc/kernel/head_32.S        Christophe Leroy       2019-01-31  838  	lwz	r2,secondary_current@l(r2)
ed1cd6deb013a1 arch/powerpc/kernel/head_32.S        Christophe Leroy       2019-01-31  839  	tophys(r1,r2)
ed1cd6deb013a1 arch/powerpc/kernel/head_32.S        Christophe Leroy       2019-01-31  840  	lwz	r1,TASK_STACK(r1)
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  841  
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  842  	/* stack */
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26 @843  	addi	r1,r1,THREAD_SIZE-STACK_FRAME_OVERHEAD
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  844  	li	r0,0
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  845  	tophys(r3,r1)
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  846  	stw	r0,0(r3)
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  847  
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  848  	/* load up the MMU */
b7f8b440f3001c arch/powerpc/kernel/head_32.S        Christophe Leroy       2019-06-11  849  	bl	load_segment_registers
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  850  	bl	load_up_mmu
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  851  
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  852  	/* ptr to phys current thread */
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  853  	tophys(r4,r2)
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  854  	addi	r4,r4,THREAD	/* phys address of our thread_struct */
ee43eb788b3a06 arch/powerpc/kernel/head_32.S        Benjamin Herrenschmidt 2009-07-14  855  	mtspr	SPRN_SPRG_THREAD,r4
c4a22611bf6ced arch/powerpc/kernel/head_book3s_32.S Christophe Leroy       2020-11-25  856  BEGIN_MMU_FTR_SECTION
4622a2d43101ea arch/powerpc/kernel/head_32.S        Christophe Leroy       2019-03-11  857  	lis	r4, (swapper_pg_dir - PAGE_OFFSET)@h
4622a2d43101ea arch/powerpc/kernel/head_32.S        Christophe Leroy       2019-03-11  858  	ori	r4, r4, (swapper_pg_dir - PAGE_OFFSET)@l
c4a22611bf6ced arch/powerpc/kernel/head_book3s_32.S Christophe Leroy       2020-11-25  859  	rlwinm	r4, r4, 4, 0xffff01ff
c4a22611bf6ced arch/powerpc/kernel/head_book3s_32.S Christophe Leroy       2020-11-25  860  	mtspr	SPRN_SDR1, r4
c4a22611bf6ced arch/powerpc/kernel/head_book3s_32.S Christophe Leroy       2020-11-25  861  END_MMU_FTR_SECTION_IFCLR(MMU_FTR_HPTE_TABLE)
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  862  
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  863  	/* enable MMU and jump to start_secondary */
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  864  	li	r4,MSR_KERNEL
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  865  	lis	r3,start_secondary@h
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  866  	ori	r3,r3,start_secondary@l
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  867  	mtspr	SPRN_SRR0,r3
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  868  	mtspr	SPRN_SRR1,r4
120c0518ec321f arch/powerpc/kernel/head_book3s_32.S Christophe Leroy       2020-11-08  869  	rfi
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  870  #endif /* CONFIG_SMP */
14cf11af6cf608 arch/powerpc/kernel/head.S           Paul Mackerras         2005-09-26  871  

:::::: The code at line 843 was first introduced by commit
:::::: 14cf11af6cf608eb8c23e989ddb17a715ddce109 powerpc: Merge enough to start building in arch/powerpc.

:::::: TO: Paul Mackerras <paulus@samba.org>
:::::: CC: Paul Mackerras <paulus@samba.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
