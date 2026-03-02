Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28382387596;
	Mon,  2 Mar 2026 08:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772438424; cv=none; b=NIXUczcbPHkJhpVQh6gC5IvPUWZAmC6Nb/vvsLbhqAVcv6cPgaFbAqT0vaX6IzchDUZdS9bOar/MqNkHJn1+LeAcW0SnDxiqjFRYkSOWnxzBsevdQyB++JEqa0a6vhFEYROdX1PPF+fu57PkU68flJkYXCx5U/yY+Urdje1uyRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772438424; c=relaxed/simple;
	bh=tCzvcA2tonLKYsoMsy1OOCIelL2mS9j6e3gdt1Px7kI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cZOBjJQa2N5UQi/P/GdX40DBa7RAfDCCW+D0KDOE0PTEMN5Q3UJ4I2Oj/g1n17q7AZNFhMeZWO3ikvJTSqQ8fA4iYVLJAxQyzLr5dpnVV0LuO4U84oDR0K5jKCFi8AkMNuOO4XlFAVu5V/Cxpv6EbTNCLnj+jaKJjW7GdwMFrCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h8+dAEDS; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h8+dAEDS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772438420; x=1803974420;
  h=date:from:to:cc:subject:message-id;
  bh=tCzvcA2tonLKYsoMsy1OOCIelL2mS9j6e3gdt1Px7kI=;
  b=h8+dAEDSQMt7zUn7XnZd0ZtcXJ8wDQSbLVCA4C9ARUYeYI24ILA/6aZw
   TJHAr2kSOd64keQNUgzC7OVaGy7jsaTCKjz/cM4PWjTLGx9oGj4G76iDf
   nd64S+OlqTlIkVeKBtCvzbFmTXULPfhI92h48hXn8+L7a+PUlxR7wpAI6
   fndYXH6K54bDS5A9gFl7AEGIl1+AAHAZhSWIwqa9Z1Ls1nPUbbRVr/MID
   tKlDFLjVe7IOfJlLg7FN6wZa2LPqYstrxzy2tVXy0yhJWlhEIa3WX/7fP
   vTY+34gNk0r89O/8S8wGRXEN/yyM8flERP/Hgy7GKF+bekeAqbDMKuRuC
   w==;
X-CSE-ConnectionGUID: LTezOz2fTe6acty6TzRCDA==
X-CSE-MsgGUID: vy8FeuZvSEaZSsd4lqiqQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="91015149"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="91015149"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 00:00:18 -0800
X-CSE-ConnectionGUID: DC2iEJcSQtug5O/Sdd0B4g==
X-CSE-MsgGUID: jlL+3oDfTZGY2pNH4YXNmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="222073650"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Mar 2026 00:00:17 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwyCM-000000000az-0XGi;
	Mon, 02 Mar 2026 08:00:14 +0000
Date: Mon, 02 Mar 2026 15:59:30 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irq/core 4/14] arch/x86/mm/tlb.c:1147:3: error:
 use of undeclared identifier 'IRQ_COUNT_TLB'
Message-ID: <202603021546.Eg5usdzl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/core
head:   81f5ad552e6edb1dcf872e7c1f4ea54298056007
commit: aed686b8876eb9fd2978b066562ba4c72f6696ef [4/14] x86/irq: Make irqstats array based
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260302/202603021546.Eg5usdzl-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260302/202603021546.Eg5usdzl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603021546.Eg5usdzl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/mm/tlb.c:1147:3: error: use of undeclared identifier 'IRQ_COUNT_TLB'
    1147 |                 inc_irq_stat(TLB);
         |                 ^
   arch/x86/include/asm/hardirq.h:70:58: note: expanded from macro 'inc_irq_stat'
      70 | #define inc_irq_stat(index)     this_cpu_inc(irq_stat.counts[IRQ_COUNT_##index])
         |                                                              ^
   <scratch space>:121:1: note: expanded from here
     121 | IRQ_COUNT_TLB
         | ^
>> arch/x86/mm/tlb.c:1147:3: error: use of undeclared identifier 'IRQ_COUNT_TLB'
   arch/x86/include/asm/hardirq.h:70:58: note: expanded from macro 'inc_irq_stat'
      70 | #define inc_irq_stat(index)     this_cpu_inc(irq_stat.counts[IRQ_COUNT_##index])
         |                                                              ^
   <scratch space>:121:1: note: expanded from here
     121 | IRQ_COUNT_TLB
         | ^
>> arch/x86/mm/tlb.c:1147:3: error: use of undeclared identifier 'IRQ_COUNT_TLB'
   arch/x86/include/asm/hardirq.h:70:58: note: expanded from macro 'inc_irq_stat'
      70 | #define inc_irq_stat(index)     this_cpu_inc(irq_stat.counts[IRQ_COUNT_##index])
         |                                                              ^
   <scratch space>:121:1: note: expanded from here
     121 | IRQ_COUNT_TLB
         | ^
>> arch/x86/mm/tlb.c:1147:3: error: use of undeclared identifier 'IRQ_COUNT_TLB'
   arch/x86/include/asm/hardirq.h:70:58: note: expanded from macro 'inc_irq_stat'
      70 | #define inc_irq_stat(index)     this_cpu_inc(irq_stat.counts[IRQ_COUNT_##index])
         |                                                              ^
   <scratch space>:121:1: note: expanded from here
     121 | IRQ_COUNT_TLB
         | ^
>> arch/x86/mm/tlb.c:1147:3: error: use of undeclared identifier 'IRQ_COUNT_TLB'
   arch/x86/include/asm/hardirq.h:70:58: note: expanded from macro 'inc_irq_stat'
      70 | #define inc_irq_stat(index)     this_cpu_inc(irq_stat.counts[IRQ_COUNT_##index])
         |                                                              ^
   <scratch space>:121:1: note: expanded from here
     121 | IRQ_COUNT_TLB
         | ^
>> arch/x86/mm/tlb.c:1147:3: error: use of undeclared identifier 'IRQ_COUNT_TLB'
   arch/x86/include/asm/hardirq.h:70:58: note: expanded from macro 'inc_irq_stat'
      70 | #define inc_irq_stat(index)     this_cpu_inc(irq_stat.counts[IRQ_COUNT_##index])
         |                                                              ^
   <scratch space>:121:1: note: expanded from here
     121 | IRQ_COUNT_TLB
         | ^
>> arch/x86/mm/tlb.c:1147:3: error: use of undeclared identifier 'IRQ_COUNT_TLB'
   arch/x86/include/asm/hardirq.h:70:58: note: expanded from macro 'inc_irq_stat'
      70 | #define inc_irq_stat(index)     this_cpu_inc(irq_stat.counts[IRQ_COUNT_##index])
         |                                                              ^
   <scratch space>:121:1: note: expanded from here
     121 | IRQ_COUNT_TLB
         | ^
>> arch/x86/mm/tlb.c:1147:3: error: use of undeclared identifier 'IRQ_COUNT_TLB'
   arch/x86/include/asm/hardirq.h:70:58: note: expanded from macro 'inc_irq_stat'
      70 | #define inc_irq_stat(index)     this_cpu_inc(irq_stat.counts[IRQ_COUNT_##index])
         |                                                              ^
   <scratch space>:121:1: note: expanded from here
     121 | IRQ_COUNT_TLB
         | ^
>> arch/x86/mm/tlb.c:1147:3: error: use of undeclared identifier 'IRQ_COUNT_TLB'
   arch/x86/include/asm/hardirq.h:70:58: note: expanded from macro 'inc_irq_stat'
      70 | #define inc_irq_stat(index)     this_cpu_inc(irq_stat.counts[IRQ_COUNT_##index])
         |                                                              ^
   <scratch space>:121:1: note: expanded from here
     121 | IRQ_COUNT_TLB
         | ^
>> arch/x86/mm/tlb.c:1147:3: error: use of undeclared identifier 'IRQ_COUNT_TLB'
   arch/x86/include/asm/hardirq.h:70:58: note: expanded from macro 'inc_irq_stat'
      70 | #define inc_irq_stat(index)     this_cpu_inc(irq_stat.counts[IRQ_COUNT_##index])
         |                                                              ^
   <scratch space>:121:1: note: expanded from here
     121 | IRQ_COUNT_TLB
         | ^
>> arch/x86/mm/tlb.c:1147:3: error: use of undeclared identifier 'IRQ_COUNT_TLB'
   arch/x86/include/asm/hardirq.h:70:58: note: expanded from macro 'inc_irq_stat'
      70 | #define inc_irq_stat(index)     this_cpu_inc(irq_stat.counts[IRQ_COUNT_##index])
         |                                                              ^
   <scratch space>:121:1: note: expanded from here
     121 | IRQ_COUNT_TLB
         | ^
>> arch/x86/mm/tlb.c:1147:3: error: use of undeclared identifier 'IRQ_COUNT_TLB'
   arch/x86/include/asm/hardirq.h:70:58: note: expanded from macro 'inc_irq_stat'
      70 | #define inc_irq_stat(index)     this_cpu_inc(irq_stat.counts[IRQ_COUNT_##index])
         |                                                              ^
   <scratch space>:121:1: note: expanded from here
     121 | IRQ_COUNT_TLB
         | ^
>> arch/x86/mm/tlb.c:1147:3: error: use of undeclared identifier 'IRQ_COUNT_TLB'
   arch/x86/include/asm/hardirq.h:70:58: note: expanded from macro 'inc_irq_stat'
      70 | #define inc_irq_stat(index)     this_cpu_inc(irq_stat.counts[IRQ_COUNT_##index])
         |                                                              ^
   <scratch space>:121:1: note: expanded from here
     121 | IRQ_COUNT_TLB
         | ^
>> arch/x86/mm/tlb.c:1147:3: error: use of undeclared identifier 'IRQ_COUNT_TLB'
   arch/x86/include/asm/hardirq.h:70:58: note: expanded from macro 'inc_irq_stat'
      70 | #define inc_irq_stat(index)     this_cpu_inc(irq_stat.counts[IRQ_COUNT_##index])
         |                                                              ^
   <scratch space>:121:1: note: expanded from here
     121 | IRQ_COUNT_TLB
         | ^
>> arch/x86/mm/tlb.c:1147:3: error: use of undeclared identifier 'IRQ_COUNT_TLB'
   arch/x86/include/asm/hardirq.h:70:58: note: expanded from macro 'inc_irq_stat'
      70 | #define inc_irq_stat(index)     this_cpu_inc(irq_stat.counts[IRQ_COUNT_##index])
         |                                                              ^
   <scratch space>:121:1: note: expanded from here
     121 | IRQ_COUNT_TLB
         | ^
>> arch/x86/mm/tlb.c:1147:3: error: use of undeclared identifier 'IRQ_COUNT_TLB'
   arch/x86/include/asm/hardirq.h:70:58: note: expanded from macro 'inc_irq_stat'
      70 | #define inc_irq_stat(index)     this_cpu_inc(irq_stat.counts[IRQ_COUNT_##index])
         |                                                              ^
   <scratch space>:121:1: note: expanded from here
     121 | IRQ_COUNT_TLB
         | ^
>> arch/x86/mm/tlb.c:1147:3: error: use of undeclared identifier 'IRQ_COUNT_TLB'
   arch/x86/include/asm/hardirq.h:70:58: note: expanded from macro 'inc_irq_stat'
      70 | #define inc_irq_stat(index)     this_cpu_inc(irq_stat.counts[IRQ_COUNT_##index])
         |                                                              ^
   <scratch space>:121:1: note: expanded from here
     121 | IRQ_COUNT_TLB
         | ^
>> arch/x86/mm/tlb.c:1147:3: error: use of undeclared identifier 'IRQ_COUNT_TLB'
   arch/x86/include/asm/hardirq.h:70:58: note: expanded from macro 'inc_irq_stat'
      70 | #define inc_irq_stat(index)     this_cpu_inc(irq_stat.counts[IRQ_COUNT_##index])
         |                                                              ^
   <scratch space>:121:1: note: expanded from here
     121 | IRQ_COUNT_TLB
         | ^
>> arch/x86/mm/tlb.c:1147:3: error: use of undeclared identifier 'IRQ_COUNT_TLB'
   arch/x86/include/asm/hardirq.h:70:58: note: expanded from macro 'inc_irq_stat'
      70 | #define inc_irq_stat(index)     this_cpu_inc(irq_stat.counts[IRQ_COUNT_##index])
         |                                                              ^
   <scratch space>:121:1: note: expanded from here
     121 | IRQ_COUNT_TLB
         | ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +/IRQ_COUNT_TLB +1147 arch/x86/mm/tlb.c

  1116	
  1117	/*
  1118	 * flush_tlb_func()'s memory ordering requirement is that any
  1119	 * TLB fills that happen after we flush the TLB are ordered after we
  1120	 * read active_mm's tlb_gen.  We don't need any explicit barriers
  1121	 * because all x86 flush operations are serializing and the
  1122	 * atomic64_read operation won't be reordered by the compiler.
  1123	 */
  1124	static void flush_tlb_func(void *info)
  1125	{
  1126		/*
  1127		 * We have three different tlb_gen values in here.  They are:
  1128		 *
  1129		 * - mm_tlb_gen:     the latest generation.
  1130		 * - local_tlb_gen:  the generation that this CPU has already caught
  1131		 *                   up to.
  1132		 * - f->new_tlb_gen: the generation that the requester of the flush
  1133		 *                   wants us to catch up to.
  1134		 */
  1135		const struct flush_tlb_info *f = info;
  1136		struct mm_struct *loaded_mm = this_cpu_read(cpu_tlbstate.loaded_mm);
  1137		u32 loaded_mm_asid = this_cpu_read(cpu_tlbstate.loaded_mm_asid);
  1138		u64 local_tlb_gen;
  1139		bool local = smp_processor_id() == f->initiating_cpu;
  1140		unsigned long nr_invalidate = 0;
  1141		u64 mm_tlb_gen;
  1142	
  1143		/* This code cannot presently handle being reentered. */
  1144		VM_WARN_ON(!irqs_disabled());
  1145	
  1146		if (!local) {
> 1147			inc_irq_stat(TLB);
  1148			count_vm_tlb_event(NR_TLB_REMOTE_FLUSH_RECEIVED);
  1149		}
  1150	
  1151		/* The CPU was left in the mm_cpumask of the target mm. Clear it. */
  1152		if (f->mm && f->mm != loaded_mm) {
  1153			cpumask_clear_cpu(raw_smp_processor_id(), mm_cpumask(f->mm));
  1154			trace_tlb_flush(TLB_REMOTE_WRONG_CPU, 0);
  1155			return;
  1156		}
  1157	
  1158		if (unlikely(loaded_mm == &init_mm))
  1159			return;
  1160	
  1161		/* Reload the ASID if transitioning into or out of a global ASID */
  1162		if (mm_needs_global_asid(loaded_mm, loaded_mm_asid)) {
  1163			switch_mm_irqs_off(NULL, loaded_mm, NULL);
  1164			loaded_mm_asid = this_cpu_read(cpu_tlbstate.loaded_mm_asid);
  1165		}
  1166	
  1167		/* Broadcast ASIDs are always kept up to date with INVLPGB. */
  1168		if (is_global_asid(loaded_mm_asid))
  1169			return;
  1170	
  1171		VM_WARN_ON(this_cpu_read(cpu_tlbstate.ctxs[loaded_mm_asid].ctx_id) !=
  1172			   loaded_mm->context.ctx_id);
  1173	
  1174		if (this_cpu_read(cpu_tlbstate_shared.is_lazy)) {
  1175			/*
  1176			 * We're in lazy mode.  We need to at least flush our
  1177			 * paging-structure cache to avoid speculatively reading
  1178			 * garbage into our TLB.  Since switching to init_mm is barely
  1179			 * slower than a minimal flush, just switch to init_mm.
  1180			 *
  1181			 * This should be rare, with native_flush_tlb_multi() skipping
  1182			 * IPIs to lazy TLB mode CPUs.
  1183			 */
  1184			switch_mm_irqs_off(NULL, &init_mm, NULL);
  1185			return;
  1186		}
  1187	
  1188		local_tlb_gen = this_cpu_read(cpu_tlbstate.ctxs[loaded_mm_asid].tlb_gen);
  1189	
  1190		if (unlikely(f->new_tlb_gen != TLB_GENERATION_INVALID &&
  1191			     f->new_tlb_gen <= local_tlb_gen)) {
  1192			/*
  1193			 * The TLB is already up to date in respect to f->new_tlb_gen.
  1194			 * While the core might be still behind mm_tlb_gen, checking
  1195			 * mm_tlb_gen unnecessarily would have negative caching effects
  1196			 * so avoid it.
  1197			 */
  1198			return;
  1199		}
  1200	
  1201		/*
  1202		 * Defer mm_tlb_gen reading as long as possible to avoid cache
  1203		 * contention.
  1204		 */
  1205		mm_tlb_gen = atomic64_read(&loaded_mm->context.tlb_gen);
  1206	
  1207		if (unlikely(local_tlb_gen == mm_tlb_gen)) {
  1208			/*
  1209			 * There's nothing to do: we're already up to date.  This can
  1210			 * happen if two concurrent flushes happen -- the first flush to
  1211			 * be handled can catch us all the way up, leaving no work for
  1212			 * the second flush.
  1213			 */
  1214			goto done;
  1215		}
  1216	
  1217		WARN_ON_ONCE(local_tlb_gen > mm_tlb_gen);
  1218		WARN_ON_ONCE(f->new_tlb_gen > mm_tlb_gen);
  1219	
  1220		/*
  1221		 * If we get to this point, we know that our TLB is out of date.
  1222		 * This does not strictly imply that we need to flush (it's
  1223		 * possible that f->new_tlb_gen <= local_tlb_gen), but we're
  1224		 * going to need to flush in the very near future, so we might
  1225		 * as well get it over with.
  1226		 *
  1227		 * The only question is whether to do a full or partial flush.
  1228		 *
  1229		 * We do a partial flush if requested and two extra conditions
  1230		 * are met:
  1231		 *
  1232		 * 1. f->new_tlb_gen == local_tlb_gen + 1.  We have an invariant that
  1233		 *    we've always done all needed flushes to catch up to
  1234		 *    local_tlb_gen.  If, for example, local_tlb_gen == 2 and
  1235		 *    f->new_tlb_gen == 3, then we know that the flush needed to bring
  1236		 *    us up to date for tlb_gen 3 is the partial flush we're
  1237		 *    processing.
  1238		 *
  1239		 *    As an example of why this check is needed, suppose that there
  1240		 *    are two concurrent flushes.  The first is a full flush that
  1241		 *    changes context.tlb_gen from 1 to 2.  The second is a partial
  1242		 *    flush that changes context.tlb_gen from 2 to 3.  If they get
  1243		 *    processed on this CPU in reverse order, we'll see
  1244		 *     local_tlb_gen == 1, mm_tlb_gen == 3, and end != TLB_FLUSH_ALL.
  1245		 *    If we were to use __flush_tlb_one_user() and set local_tlb_gen to
  1246		 *    3, we'd be break the invariant: we'd update local_tlb_gen above
  1247		 *    1 without the full flush that's needed for tlb_gen 2.
  1248		 *
  1249		 * 2. f->new_tlb_gen == mm_tlb_gen.  This is purely an optimization.
  1250		 *    Partial TLB flushes are not all that much cheaper than full TLB
  1251		 *    flushes, so it seems unlikely that it would be a performance win
  1252		 *    to do a partial flush if that won't bring our TLB fully up to
  1253		 *    date.  By doing a full flush instead, we can increase
  1254		 *    local_tlb_gen all the way to mm_tlb_gen and we can probably
  1255		 *    avoid another flush in the very near future.
  1256		 */
  1257		if (f->end != TLB_FLUSH_ALL &&
  1258		    f->new_tlb_gen == local_tlb_gen + 1 &&
  1259		    f->new_tlb_gen == mm_tlb_gen) {
  1260			/* Partial flush */
  1261			unsigned long addr = f->start;
  1262	
  1263			/* Partial flush cannot have invalid generations */
  1264			VM_WARN_ON(f->new_tlb_gen == TLB_GENERATION_INVALID);
  1265	
  1266			/* Partial flush must have valid mm */
  1267			VM_WARN_ON(f->mm == NULL);
  1268	
  1269			nr_invalidate = (f->end - f->start) >> f->stride_shift;
  1270	
  1271			while (addr < f->end) {
  1272				flush_tlb_one_user(addr);
  1273				addr += 1UL << f->stride_shift;
  1274			}
  1275			if (local)
  1276				count_vm_tlb_events(NR_TLB_LOCAL_FLUSH_ONE, nr_invalidate);
  1277		} else {
  1278			/* Full flush. */
  1279			nr_invalidate = TLB_FLUSH_ALL;
  1280	
  1281			flush_tlb_local();
  1282			if (local)
  1283				count_vm_tlb_event(NR_TLB_LOCAL_FLUSH_ALL);
  1284		}
  1285	
  1286		/* Both paths above update our state to mm_tlb_gen. */
  1287		this_cpu_write(cpu_tlbstate.ctxs[loaded_mm_asid].tlb_gen, mm_tlb_gen);
  1288	
  1289		/* Tracing is done in a unified manner to reduce the code size */
  1290	done:
  1291		trace_tlb_flush(!local ? TLB_REMOTE_SHOOTDOWN :
  1292					(f->mm == NULL) ? TLB_LOCAL_SHOOTDOWN :
  1293							  TLB_LOCAL_MM_SHOOTDOWN,
  1294				nr_invalidate);
  1295	}
  1296	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
