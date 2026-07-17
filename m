Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5284A126BF1;
	Fri, 17 Jul 2026 20:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784319656; cv=none; b=Le1wMmI7PhvAwi1Nb0D2wpnw5lTpqiEBfsYeiQCU2aKs3uCcUvVaV2imYZNYNFaoqLAeMd4qm3vl3XrTagmQlLK5AxJJKgpKhtBrvg0CTCRD+anNktYasbZOaJLjKvn5gqsHk91oDxgjcQuMz6Gu46+4GLc8m5cDwHNzeFNe+es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784319656; c=relaxed/simple;
	bh=Mr5XyXPU1R/xUh0cqoXIPGPbtYHdNz0Qojrzwv8Z7rA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ovVNYXZUdfeu3RrcGgndHqN7G34X3QAvhfqak2MQvpkosYoKnSe0/gnCqRl2Pp1ognrBc1JRtb8wr5rmHZfsu8n5IfLzXftuXV2ehReASCj5m20/V45u2haw1IR53lRN8mA9uRBLj4WBzlbdtqTfw9U7n6y4N6+RQkIegwUCCJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QFFI3Inc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QFFI3Inc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784319654; x=1815855654;
  h=date:from:to:cc:subject:message-id;
  bh=Mr5XyXPU1R/xUh0cqoXIPGPbtYHdNz0Qojrzwv8Z7rA=;
  b=QFFI3IncpIIOeHb7/HWw4qvQd++eoAsdMnNX2ruvlbXCas9wIuOgyw1o
   T0wzRmhzvoaod9FeouwAIWs7z+SlbFSKfLkxLqYXBheBPPJFDzFBITuLz
   z6qgCGMfqnfTlZOuRdGZcs43HBgrWr9vJCpn7hoDQvwzlaEoECKlLfHxU
   JmSwJvE1jV8NXfx89HnRyXrZpJSRC5k2pIain0Nczkx/NFrHb9ZI6umck
   rM8YB9q+oKllICNGoZhKxsP1m7TOgfrTi30ybrgjdinqKlczwm7kU3+GK
   YqvD5szvmowlRMgUEiqzPIyIypoSh4T0BwYPpIf4/oWq36IDrOfOHfJuv
   g==;
X-CSE-ConnectionGUID: lZWHTf0sQNC1XHE/D05O+A==
X-CSE-MsgGUID: YdDxscQQTCyUXBPGrMSl9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="95593975"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="95593975"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 13:20:53 -0700
X-CSE-ConnectionGUID: BAYcl6mDRzugjpYsDGgplQ==
X-CSE-MsgGUID: mSz9NW5wQqu4nvLap2je9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="280160933"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 17 Jul 2026 13:20:52 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkp36-00000000T8B-1gKM;
	Fri, 17 Jul 2026 20:20:46 +0000
Date: Sat, 18 Jul 2026 04:20:13 +0800
From: kernel test robot <lkp@intel.com>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Paul Walmsley <pjw@kernel.org>
Subject: [linux-next:master 6105/7063]
 arch/riscv/include/asm/pgtable.h:584:47: warning: variable 'asid' is
 uninitialized when used here
Message-ID: <202607180449.FJLkX0Mf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1a1757b76427f6201bfe0bf1bea9f7574f332a93
commit: 6dfbb04908eb630ae6a592454b28c2f666a20a5a [6105/7063] riscv: mm: Apply Svinval in update_mmu_cache()
config: riscv-randconfig-001-20260717 (https://download.01.org/0day-ci/archive/20260718/202607180449.FJLkX0Mf-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607180449.FJLkX0Mf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607180449.FJLkX0Mf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:31:
   In file included from include/linux/pgtable.h:6:
>> arch/riscv/include/asm/pgtable.h:584:47: warning: variable 'asid' is uninitialized when used here [-Wuninitialized]
     584 |                         local_sinval_vma(address + nr * PAGE_SIZE, asid);
         |                                                                    ^~~~
   arch/riscv/include/asm/pgtable.h:571:20: note: initialize the variable 'asid' to silence this warning
     571 |         unsigned long asid;
         |                           ^
         |                            = 0
   1 warning generated.
--
   In file included from drivers/message/fusion/mptbase.c:50:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/riscv/include/asm/elf.h:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:13:
   In file included from arch/riscv/include/asm/uaccess.h:13:
>> arch/riscv/include/asm/pgtable.h:584:47: warning: variable 'asid' is uninitialized when used here [-Wuninitialized]
     584 |                         local_sinval_vma(address + nr * PAGE_SIZE, asid);
         |                                                                    ^~~~
   arch/riscv/include/asm/pgtable.h:571:20: note: initialize the variable 'asid' to silence this warning
     571 |         unsigned long asid;
         |                           ^
         |                            = 0
   drivers/message/fusion/mptbase.c:2299:6: warning: variable 'a' set but not used [-Wunused-but-set-variable]
    2299 |         u8      *a;
         |                  ^
   drivers/message/fusion/mptbase.c:2815:6: warning: variable 'sz_first' set but not used [-Wunused-but-set-variable]
    2815 |         int sz_first, sz_last;
         |             ^
   drivers/message/fusion/mptbase.c:2815:16: warning: variable 'sz_last' set but not used [-Wunused-but-set-variable]
    2815 |         int sz_first, sz_last;
         |                       ^
   drivers/message/fusion/mptbase.c:3964:6: warning: variable 'diag1val' set but not used [-Wunused-but-set-variable]
    3964 |         u32 diag1val = 0;
         |             ^
   drivers/message/fusion/mptbase.c:6977:17: warning: variable 'time_count' set but not used [-Wunused-but-set-variable]
    6977 |         unsigned long    time_count;
         |                          ^
   drivers/message/fusion/mptbase.c:7146:17: warning: variable 'time_count' set but not used [-Wunused-but-set-variable]
    7146 |         unsigned long    time_count;
         |                          ^
   7 warnings generated.
--
   In file included from drivers/message/fusion/mptsas.c:46:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/riscv/include/asm/elf.h:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:13:
   In file included from arch/riscv/include/asm/uaccess.h:13:
>> arch/riscv/include/asm/pgtable.h:584:47: warning: variable 'asid' is uninitialized when used here [-Wuninitialized]
     584 |                         local_sinval_vma(address + nr * PAGE_SIZE, asid);
         |                                                                    ^~~~
   arch/riscv/include/asm/pgtable.h:571:20: note: initialize the variable 'asid' to silence this warning
     571 |         unsigned long asid;
         |                           ^
         |                            = 0
   drivers/message/fusion/mptsas.c:1449:5: warning: variable 'fw_id' set but not used [-Wunused-but-set-variable]
    1449 |         u8 fw_id;
         |            ^
   drivers/message/fusion/mptsas.c:1527:5: warning: variable 'fw_id' set but not used [-Wunused-but-set-variable]
    1527 |         u8 fw_id;
         |            ^
   drivers/message/fusion/mptsas.c:4790:17: warning: variable 'timeleft' set but not used [-Wunused-but-set-variable]
    4790 |         unsigned long    timeleft;
         |                          ^
   drivers/message/fusion/mptsas.c:4870:9: warning: variable 'termination_count' set but not used [-Wunused-but-set-variable]
    4870 |         u32                      termination_count;
         |                                  ^
   drivers/message/fusion/mptsas.c:4871:9: warning: variable 'query_count' set but not used [-Wunused-but-set-variable]
    4871 |         u32                      query_count;
         |                                  ^
   6 warnings generated.
--
   In file included from drivers/message/fusion/mptscsih.c:47:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/riscv/include/asm/elf.h:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:13:
   In file included from arch/riscv/include/asm/uaccess.h:13:
>> arch/riscv/include/asm/pgtable.h:584:47: warning: variable 'asid' is uninitialized when used here [-Wuninitialized]
     584 |                         local_sinval_vma(address + nr * PAGE_SIZE, asid);
         |                                                                    ^~~~
   arch/riscv/include/asm/pgtable.h:571:20: note: initialize the variable 'asid' to silence this warning
     571 |         unsigned long asid;
         |                           ^
         |                            = 0
   drivers/message/fusion/mptscsih.c:1036:8: warning: variable 'channel' set but not used [-Wunused-but-set-variable]
    1036 |         int              channel, id;
         |                          ^
   drivers/message/fusion/mptscsih.c:1036:17: warning: variable 'id' set but not used [-Wunused-but-set-variable]
    1036 |         int              channel, id;
         |                                   ^
   drivers/message/fusion/mptscsih.c:1148:15: warning: variable 'ioc' set but not used [-Wunused-but-set-variable]
    1148 |         MPT_ADAPTER     *ioc;
         |                          ^
   drivers/message/fusion/mptscsih.c:1177:6: warning: variable 'sz1' set but not used [-Wunused-but-set-variable]
    1177 |         int sz1;
         |             ^
   drivers/message/fusion/mptscsih.c:1522:17: warning: variable 'time_count' set but not used [-Wunused-but-set-variable]
    1522 |         unsigned long    time_count;
         |                          ^
   drivers/message/fusion/mptscsih.c:2345:15: warning: variable 'vtarget' set but not used [-Wunused-but-set-variable]
    2345 |         VirtTarget              *vtarget;
         |                                  ^
   7 warnings generated.
--
   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:31:
   In file included from include/linux/pgtable.h:6:
>> arch/riscv/include/asm/pgtable.h:584:47: warning: variable 'asid' is uninitialized when used here [-Wuninitialized]
     584 |                         local_sinval_vma(address + nr * PAGE_SIZE, asid);
         |                                                                    ^~~~
   arch/riscv/include/asm/pgtable.h:571:20: note: initialize the variable 'asid' to silence this warning
     571 |         unsigned long asid;
         |                           ^
         |                            = 0
   1 warning generated.
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:17:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:13:
   In file included from arch/riscv/include/asm/uaccess.h:13:
>> arch/riscv/include/asm/pgtable.h:584:47: warning: variable 'asid' is uninitialized when used here [-Wuninitialized]
     584 |                         local_sinval_vma(address + nr * PAGE_SIZE, asid);
         |                                                                    ^~~~
   arch/riscv/include/asm/pgtable.h:571:20: note: initialize the variable 'asid' to silence this warning
     571 |         unsigned long asid;
         |                           ^
         |                            = 0
   1 warning generated.
   In file included from <built-in>:4:
   In file included from lib/vdso/getrandom.c:15:
   In file included from include/uapi/linux/mman.h:5:
   In file included from arch/riscv/include/asm/mman.h:7:
   In file included from include/linux/mm.h:31:
   In file included from include/linux/pgtable.h:6:
>> arch/riscv/include/asm/pgtable.h:584:47: warning: variable 'asid' is uninitialized when used here [-Wuninitialized]
     584 |                         local_sinval_vma(address + nr * PAGE_SIZE, asid);
         |                                                                    ^~~~
   arch/riscv/include/asm/pgtable.h:571:20: note: initialize the variable 'asid' to silence this warning
     571 |         unsigned long asid;
         |                           ^
         |                            = 0
   1 warning generated.


vim +/asid +584 arch/riscv/include/asm/pgtable.h

   561	
   562	#define pgd_ERROR(e) \
   563		pr_err("%s:%d: bad pgd " PTE_FMT ".\n", __FILE__, __LINE__, pgd_val(e))
   564	
   565	
   566	/* Commit new configuration to MMU hardware */
   567	static inline void update_mmu_cache_range(struct vm_fault *vmf,
   568			struct vm_area_struct *vma, unsigned long address,
   569			pte_t *ptep, unsigned int nr)
   570	{
   571		unsigned long asid;
   572	
   573		/*
   574		 * Svvptc guarantees that the new valid pte will be visible within
   575		 * a bounded timeframe, so when the uarch does not cache invalid
   576		 * entries, we don't have to do anything.
   577		 */
   578		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SVVPTC))
   579			return;
   580	
   581		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)) {
   582			local_sfence_w_inval();
   583			while (nr--)
 > 584				local_sinval_vma(address + nr * PAGE_SIZE, asid);
   585			local_sfence_inval_ir();
   586			return;
   587		}
   588	
   589		/*
   590		 * The kernel assumes that TLBs don't cache invalid entries, but
   591		 * in RISC-V, SFENCE.VMA specifies an ordering constraint, not a
   592		 * cache flush; it is necessary even after writing invalid entries.
   593		 * Relying on flush_tlb_fix_spurious_fault would suffice, but
   594		 * the extra traps reduce performance.  So, eagerly SFENCE.VMA.
   595		 */
   596		asid = get_mm_asid(vma->vm_mm);
   597		while (nr--)
   598			local_flush_tlb_page_asid(address + nr * PAGE_SIZE, asid);
   599	}
   600	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
