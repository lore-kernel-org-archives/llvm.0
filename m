Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1961F0E34;
	Wed, 10 Sep 2025 01:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757467752; cv=none; b=R6F2oUbDYv2XT1CknMlSnTdMPOEg2fAobO062h0IWGK13WBDnm4GB5R0EM0wOs4Mw5lsVFOCNaValQebyDQiqve0N0TIFKLaWgx07lY+cICRv7nfuEKsLnBsl46rL5x8LpvRoK8+VnSIIN7lpIFRGipNaB9FXUHXOm8z6QRRs4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757467752; c=relaxed/simple;
	bh=HscWie2Ilk4xQV1Zd+7YGIelayTD0+3EqzpU5bE4Id8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=it4aHnRBCLMUCNxRBsljmaU3QMqlFE0/9K8JSfBoduN1xFiAv/u7QijPXRfSBmsy0fjj/GapXA9Y6tbemrtW1bJ6h4AUi7QXRq6cXQ4zA27jCxBbji71yyQoX/JHY1Um7eiSKP70z0dngHVyT+VdHFetNcAMYVHF1i1hxFPchmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H9DWl5Kq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H9DWl5Kq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757467751; x=1789003751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HscWie2Ilk4xQV1Zd+7YGIelayTD0+3EqzpU5bE4Id8=;
  b=H9DWl5KqYy1eTgxph0qJheHRhUj1j1SOwGZvdzGHa17fpM+BwB3A/FB+
   rB3WZfrVk9G1mtslmgpfxwncieZrNTD0S+04HbIi5c6OpNUUn1/+/RQ+Y
   LAZr7cILj4GZn+64HWYyow+JgQc3ptM1WbiCqDMq4Fw/XHyVRR9iVz5ba
   6Ou9Uxz46tuk3JVruBEPBcHzr61Q5bnxAJwKnuT0O5mW4SAQI2LRYYl9x
   OV2Ddf3tLSScl/uO8PzFqIyq9J9Rqb/mEMYoUbwIjGqzjWvJD8AWhzX0R
   TBXtDdmnnx1g0MMae09KxB9qxeMfAyPyUWmXeHb9n1HQo2azk4IW7vbk6
   A==;
X-CSE-ConnectionGUID: hzMojuxKTheRv10sAdcQJQ==
X-CSE-MsgGUID: +3oaDorvTKuRyYRO0lZbVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59831765"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59831765"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 18:29:08 -0700
X-CSE-ConnectionGUID: N4YyE0CzQp6s/++X2UlYzg==
X-CSE-MsgGUID: Cm+AoObWTHW/zsMd/lkGIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; 
   d="scan'208";a="173156661"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Sep 2025 18:29:06 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uw9dv-0005Pt-2J;
	Wed, 10 Sep 2025 01:29:03 +0000
Date: Wed, 10 Sep 2025 09:28:49 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-sparc64-generic-2 3/20]
 include/linux/seqlock.h:836:9: error: call to undeclared function
 'cpu_relax'; ISO C99 and later do not support implicit function declarations
Message-ID: <202509100933.esuTIrM4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-sparc64-generic-2
head:   cfbb19760241686a2899d3f83ce4ad7695f61f4b
commit: 36fdead9d1980586c1db9a961289a181a38086f9 [3/20] vdso/datapage: Make headers always usable
config: riscv-randconfig-002-20250910 (https://download.01.org/0day-ci/archive/20250910/202509100933.esuTIrM4-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7fb1dc08d2f025aad5777bb779dfac1197e9ef87)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250910/202509100933.esuTIrM4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509100933.esuTIrM4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:17:
>> include/linux/seqlock.h:836:9: error: call to undeclared function 'cpu_relax'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     836 |         return read_seqcount_begin(&sl->seqcount);
         |                ^
   include/linux/seqlock.h:299:2: note: expanded from macro 'read_seqcount_begin'
     299 |         raw_read_seqcount_begin(s);                                     \
         |         ^
   include/linux/seqlock.h:288:36: note: expanded from macro 'raw_read_seqcount_begin'
     288 | #define raw_read_seqcount_begin(s) __read_seqcount_begin(s)
         |                                    ^
   include/linux/seqlock.h:276:3: note: expanded from macro '__read_seqcount_begin'
     276 |                 cpu_relax();                                            \
         |                 ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:24: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                                      ^      ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
--
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:163:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     163 | _SIG_SET_BINOP(sigandnsets, _sig_andn)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:139:24: note: expanded from macro '_SIG_SET_BINOP'
     139 |                 b3 = b->sig[3]; b2 = b->sig[2];                         \
         |                                      ^      ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:163:1: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     163 | _SIG_SET_BINOP(sigandnsets, _sig_andn)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:140:3: note: expanded from macro '_SIG_SET_BINOP'
     140 |                 r->sig[3] = op(a3, b3);                                 \
         |                 ^      ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:163:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     163 | _SIG_SET_BINOP(sigandnsets, _sig_andn)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:141:3: note: expanded from macro '_SIG_SET_BINOP'
     141 |                 r->sig[2] = op(a2, b2);                                 \
         |                 ^      ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:174:27: note: expanded from macro '_SIG_SET_OP'
     174 |         case 4: set->sig[3] = op(set->sig[3]);                          \
         |                                  ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:174:10: note: expanded from macro '_SIG_SET_OP'
     174 |         case 4: set->sig[3] = op(set->sig[3]);                          \
         |                 ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:175:20: note: expanded from macro '_SIG_SET_OP'
     175 |                 set->sig[2] = op(set->sig[2]);                          \
         |                                  ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:175:3: note: expanded from macro '_SIG_SET_OP'
     175 |                 set->sig[2] = op(set->sig[2]);                          \
         |                 ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:13:
   In file included from include/linux/posix-timers.h:5:
   In file included from include/linux/alarmtimer.h:6:
>> include/linux/hrtimer.h:222:2: error: call to undeclared function 'cpu_relax'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     222 |         cpu_relax();
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:804:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     804 |         insb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:104:53: note: expanded from macro 'insb'
     104 | #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:812:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     812 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
     105 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:820:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     820 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
     106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:829:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     829 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
     118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:838:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     838 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
     119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:847:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     847 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
     120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/asm-offsets.c:11:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:29:
   In file included from include/linux/cgroup-defs.h:20:
>> include/linux/u64_stats_sync.h:171:9: error: call to undeclared function 'cpu_relax'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     171 |         return read_seqcount_begin(&syncp->seq);
         |                ^
   include/linux/seqlock.h:299:2: note: expanded from macro 'read_seqcount_begin'
     299 |         raw_read_seqcount_begin(s);                                     \
         |         ^
   include/linux/seqlock.h:288:36: note: expanded from macro 'raw_read_seqcount_begin'
     288 | #define raw_read_seqcount_begin(s) __read_seqcount_begin(s)
         |                                    ^
   include/linux/seqlock.h:276:3: note: expanded from macro '__read_seqcount_begin'
     276 |                 cpu_relax();                                            \
         |                 ^
   In file included from arch/riscv/kernel/asm-offsets.c:11:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
>> include/linux/cgroup.h:481:3: error: call to undeclared function 'cpu_relax'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     481 |                 cpu_relax();
         |                 ^
   35 warnings and 4 errors generated.
   make[3]: *** [scripts/Makefile.build:182: arch/riscv/kernel/asm-offsets.s] Error 1 shuffle=3791524517
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1282: prepare0] Error 2 shuffle=3791524517
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3791524517
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3791524517
   make: Target 'prepare' not remade because of errors.


vim +/cpu_relax +836 include/linux/seqlock.h

9b0fd802e8c054 Mathieu Desnoyers         2014-07-16  804  
6617feca15c68a Thomas Gleixner           2011-07-16  805  #define __SEQLOCK_UNLOCKED(lockname)					\
6617feca15c68a Thomas Gleixner           2011-07-16  806  	{								\
1909760f5fc3f1 Ahmed S. Darwish          2020-09-04  807  		.seqcount = SEQCNT_SPINLOCK_ZERO(lockname, &(lockname).lock), \
6617feca15c68a Thomas Gleixner           2011-07-16  808  		.lock =	__SPIN_LOCK_UNLOCKED(lockname)			\
6617feca15c68a Thomas Gleixner           2011-07-16  809  	}
6617feca15c68a Thomas Gleixner           2011-07-16  810  
89b88845e05752 Ahmed S. Darwish          2020-07-20  811  /**
89b88845e05752 Ahmed S. Darwish          2020-07-20  812   * seqlock_init() - dynamic initializer for seqlock_t
89b88845e05752 Ahmed S. Darwish          2020-07-20  813   * @sl: Pointer to the seqlock_t instance
89b88845e05752 Ahmed S. Darwish          2020-07-20  814   */
89b88845e05752 Ahmed S. Darwish          2020-07-20  815  #define seqlock_init(sl)						\
6617feca15c68a Thomas Gleixner           2011-07-16  816  	do {								\
89b88845e05752 Ahmed S. Darwish          2020-07-20  817  		spin_lock_init(&(sl)->lock);				\
1909760f5fc3f1 Ahmed S. Darwish          2020-09-04  818  		seqcount_spinlock_init(&(sl)->seqcount, &(sl)->lock);	\
6617feca15c68a Thomas Gleixner           2011-07-16  819  	} while (0)
6617feca15c68a Thomas Gleixner           2011-07-16  820  
89b88845e05752 Ahmed S. Darwish          2020-07-20  821  /**
24a18772868222 Sebastian Andrzej Siewior 2020-09-24  822   * DEFINE_SEQLOCK(sl) - Define a statically allocated seqlock_t
89b88845e05752 Ahmed S. Darwish          2020-07-20  823   * @sl: Name of the seqlock_t instance
89b88845e05752 Ahmed S. Darwish          2020-07-20  824   */
89b88845e05752 Ahmed S. Darwish          2020-07-20  825  #define DEFINE_SEQLOCK(sl) \
89b88845e05752 Ahmed S. Darwish          2020-07-20  826  		seqlock_t sl = __SEQLOCK_UNLOCKED(sl)
6617feca15c68a Thomas Gleixner           2011-07-16  827  
89b88845e05752 Ahmed S. Darwish          2020-07-20  828  /**
89b88845e05752 Ahmed S. Darwish          2020-07-20  829   * read_seqbegin() - start a seqlock_t read side critical section
89b88845e05752 Ahmed S. Darwish          2020-07-20  830   * @sl: Pointer to seqlock_t
89b88845e05752 Ahmed S. Darwish          2020-07-20  831   *
89b88845e05752 Ahmed S. Darwish          2020-07-20  832   * Return: count, to be passed to read_seqretry()
6617feca15c68a Thomas Gleixner           2011-07-16  833   */
6617feca15c68a Thomas Gleixner           2011-07-16  834  static inline unsigned read_seqbegin(const seqlock_t *sl)
6617feca15c68a Thomas Gleixner           2011-07-16  835  {
183ec5f26b2fc9 Marco Elver               2024-11-04 @836  	return read_seqcount_begin(&sl->seqcount);
6617feca15c68a Thomas Gleixner           2011-07-16  837  }
6617feca15c68a Thomas Gleixner           2011-07-16  838  

:::::: The code at line 836 was first introduced by commit
:::::: 183ec5f26b2fc97a4a9871865bfe9b33c41fddb2 kcsan, seqlock: Fix incorrect assumption in read_seqbegin()

:::::: TO: Marco Elver <elver@google.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
