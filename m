Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA4F171CD;
	Sat,  4 Jul 2026 02:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783132825; cv=none; b=hPnVPW8eL9pvWfXTQqxzSpS6DYLZGvAVxoRvMplXPNHIYBwx6hEBboCMR2/NIjAr6Z35EOr/RISyIGaJDBssuyhaXZM8fTg5UCZr/lfo60dStIqO3R/+xAwEcVwojJLTItDNYDiSLwzEDEzfS6SlatMJppASvtELbGK4stBsz4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783132825; c=relaxed/simple;
	bh=EpbQ2gsNgum2WSmaF16V21ehDBRsvil2h/Q5c/F5oDw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Cny6TYH5b5317Jlomy3bSDqED3ckLz13HJXnaJMV4GP7AjYUk0Ybv1pI8q+bh/v/Ed71evMk4OTsqKvdW6tFlwGLpTaxhK5gF7OLPyxOsWHi5sCXx9u/CH/DecgMdRVO/eYxtRDAbHDNwsB4hZwJJHZG0NfWKY5tzbjSCvWF2XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n9B7eE7c; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n9B7eE7c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783132824; x=1814668824;
  h=date:from:to:cc:subject:message-id;
  bh=EpbQ2gsNgum2WSmaF16V21ehDBRsvil2h/Q5c/F5oDw=;
  b=n9B7eE7ccZCSfHDSQ1xpXqSlUdIulHGtO8gDkFelEFYy6oykJjBTdGaX
   YDZlJFTEIMrDXmWmh875pEzX+OCJHsMQQWKEDIaB6dLWl7/KlASiQiiDD
   +5KH3xsB3Q2Lcg6YrQr5BgzKyv4LvI8DUpyc9QmJM4aYRqha2SWawJb/n
   fESFPCMG4oyGepePdFto7o4mqa80TPRV8dHpJ1IzMGQL9GSC3yUMjsC3T
   bKgRK/HT1e3iLh0fBfiyrijxuxLBG6GdTuTr9wazBsrE7DIWXCueOflZ5
   Y9GK1IvtH0jGuJtqMKqoS3EtMe/XPpAtNLFR2knCc/ULr/ELSY9wwoO4a
   w==;
X-CSE-ConnectionGUID: oPj0vq3kT8OUnoEjLjeFEg==
X-CSE-MsgGUID: Psy7dnqhS2Szn3N5Xqaw7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83645847"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="83645847"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 19:40:23 -0700
X-CSE-ConnectionGUID: dq+IpUSPTleWk9LdmsxEhw==
X-CSE-MsgGUID: 51Jm6Lo0SLKa+PfbI1WUdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="258122388"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 03 Jul 2026 19:40:21 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfqIk-00000000CmJ-3ZCM;
	Sat, 04 Jul 2026 02:40:18 +0000
Date: Sat, 04 Jul 2026 10:39:22 +0800
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:folded_pgtable 13/13]
 include/asm-generic/pgtable-nop4d.h:46:36: error: call to undeclared function
 'pgd_val'; ISO C99 and later do not support implicit function declarations
Message-ID: <202607041001.lwd0KBN0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/davidhildenbrand/linux folded_pgtable
head:   898b37f4865d94ff198bb62dfe2517a6d1b7d44e
commit: 898b37f4865d94ff198bb62dfe2517a6d1b7d44e [13/13] mm/pgtable: catch abuse of folded dummy pgd_t/p4d_t/pud_t
config: i386-defconfig (https://download.01.org/0day-ci/archive/20260704/202607041001.lwd0KBN0-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607041001.lwd0KBN0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607041001.lwd0KBN0-lkp@intel.com/

All errors (new ones prefixed by >>):

   WARN /zdci/src/lkp/lib/log.sh:131:in `log_warn': /opt/cross/rustc-1.96.0-bindgen-0.72.1 doesn't exist
     from /zdci/src/kernel-tests/lib/debug.sh:164: kbuild_log_warn
     from /zdci/src/kernel-tests/lib/kbuild.sh:3371: export_rust_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3361: export_compiler_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3840: invoke_make
     from /zdci/src/kernel-tests/lib/kbuild.sh:4022: make
     from /zdci/src/kernel-tests/common.sh:202: redirect_error_to_screen
     from /zdci/src/kernel-tests/common.sh:210: redirect_command_errors
     from /zdci/src/kernel-tests/lib/kbuild.sh:5680: make_prepare
     from /zdci/src/kernel-tests/lib/kbuild.sh:5909: test_kernel_build
     from /zdci/src/kernel-tests/lib/builder/base.sh:442: builder_execute_build
     from /zdci/src/kernel-tests/lib/kbuild.sh:6419: compile_one_config
     from /zdci/src/kernel-tests/lib/builder/base.sh:88: builder_compile
     from /zdci/src/kernel-tests/bisect-test-build-error.sh:101: main
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/x86/include/asm/irqflags.h:100:
   In file included from arch/x86/include/asm/paravirt.h:10:
   In file included from arch/x86/include/asm/paravirt_types.h:12:
   In file included from arch/x86/include/asm/pgtable_types.h:354:
>> include/asm-generic/pgtable-nop4d.h:46:36: error: call to undeclared function 'pgd_val'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      46 |         BUILD_BUG_ON(__builtin_constant_p(pgd_val(*pgd)));
         |                                           ^
   include/asm-generic/pgtable-nop4d.h:46:36: note: did you mean 'pgd_bad'?
   include/asm-generic/pgtable-nop4d.h:22:19: note: 'pgd_bad' declared here
      22 | static inline int pgd_bad(pgd_t pgd)            { return 0; }
         |                   ^
   include/asm-generic/pgtable-nop4d.h:53:36: error: call to undeclared function 'pgd_val'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      53 |         BUILD_BUG_ON(__builtin_constant_p(pgd_val(*pgdp)));
         |                                           ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/x86/include/asm/irqflags.h:100:
   In file included from arch/x86/include/asm/paravirt.h:10:
   In file included from arch/x86/include/asm/paravirt_types.h:12:
   In file included from arch/x86/include/asm/pgtable_types.h:380:
>> include/asm-generic/pgtable-nopud.h:53:36: error: call to undeclared function 'pgd_val'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      53 |         BUILD_BUG_ON(__builtin_constant_p(p4d_val(*p4d)));
         |                                           ^
   include/asm-generic/pgtable-nop4d.h:58:24: note: expanded from macro 'p4d_val'
      58 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/x86/include/asm/irqflags.h:100:
   In file included from arch/x86/include/asm/paravirt.h:10:
   In file included from arch/x86/include/asm/paravirt_types.h:12:
   In file included from arch/x86/include/asm/pgtable_types.h:380:
   include/asm-generic/pgtable-nopud.h:61:36: error: call to undeclared function 'pgd_val'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      61 |         BUILD_BUG_ON(__builtin_constant_p(p4d_val(*p4dp)));
         |                                           ^
   include/asm-generic/pgtable-nop4d.h:58:24: note: expanded from macro 'p4d_val'
      58 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/x86/include/asm/irqflags.h:100:
   In file included from arch/x86/include/asm/paravirt.h:10:
   In file included from arch/x86/include/asm/paravirt_types.h:12:
   In file included from arch/x86/include/asm/pgtable_types.h:404:
>> include/asm-generic/pgtable-nopmd.h:55:36: error: call to undeclared function 'pgd_val'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      55 |         BUILD_BUG_ON(__builtin_constant_p(pud_val(*pud)));
         |                                           ^
   include/asm-generic/pgtable-nopud.h:66:24: note: expanded from macro 'pud_val'
      66 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^
   include/asm-generic/pgtable-nop4d.h:58:24: note: expanded from macro 'p4d_val'
      58 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/x86/include/asm/irqflags.h:100:
   In file included from arch/x86/include/asm/paravirt.h:10:
   In file included from arch/x86/include/asm/paravirt_types.h:12:
   In file included from arch/x86/include/asm/pgtable_types.h:404:
   include/asm-generic/pgtable-nopmd.h:63:36: error: call to undeclared function 'pgd_val'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      63 |         BUILD_BUG_ON(__builtin_constant_p(pud_val(*pudp)));
         |                                           ^
   include/asm-generic/pgtable-nopud.h:66:24: note: expanded from macro 'pud_val'
      66 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^
   include/asm-generic/pgtable-nop4d.h:58:24: note: expanded from macro 'p4d_val'
      58 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:


vim +/pgd_val +46 include/asm-generic/pgtable-nop4d.h

    43	
    44	static __always_inline p4d_t *p4d_offset(pgd_t *pgd, unsigned long address)
    45	{
  > 46		BUILD_BUG_ON(__builtin_constant_p(pgd_val(*pgd)));
    47		return (p4d_t *)pgd;
    48	}
    49	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
