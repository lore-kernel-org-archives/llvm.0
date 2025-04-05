Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4676C1B043F;
	Sat,  5 Apr 2025 04:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743826066; cv=none; b=gdqApucIRbIhP5nPezlw0vSbu+FMreixF4uIW0vA0stLvm8PzUbQUidaRAUlb4fieKE58cixOQV1iFspfes00270TDAI8O1iECl7hOvuioh+yksYlkl/hxrtEA+8GALMrDXHvDSqlvIbsegPcvC2ew7wJEy1iGto0yI2EPOB4rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743826066; c=relaxed/simple;
	bh=YTgPK8emZtOkOuQahPeALEYS0BLiS6UwaCEe75EbPK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qu6vOOtXg1MoBb+wy/OkJmYopoZmyyYf/lmbQJtVA4RG2rGZApw4zVvwgKcaRWfy2PhxWAgoF8gidNhVY4LDZlW7gQUaztDVs02t6uE6f1K2bdHxS757uhMMxCLWL6rZhkvfuq3G/ay6vs6SkttzpLIul4ErnWbsxtpFi9tDRJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BKBVtjm+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BKBVtjm+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743826064; x=1775362064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YTgPK8emZtOkOuQahPeALEYS0BLiS6UwaCEe75EbPK0=;
  b=BKBVtjm+X+5+d6RuKLtTIPBiWvS4C5cPcLf+jJyYTxcJYKShzSIEwKH4
   dzHiqxD/IJByScTB7IjxJ3JVs1QULXFmv7mig0fKMToEdHEdHaFFUviCa
   5CwaGPJ/RxwwVyKTHuVWakJrRtqVw1FZrRablkI1zgeB7CFYJbRhSfqPo
   8TDuulK9CNrWLFuYFcTSK0FwLo/FA4j+uxFmIAvmdplGHjRWt4fA5cK7X
   URyD011wTXDpHz/szYAVD3cEWDpQ1WqN0AGaJ//vNsnnT57i9B0Ir3bXk
   EFnMoQUFFMf3CUUy23qA9K2L4ueRI9lsGTvRm3iYWFTSTh9M9+FQa5PdV
   Q==;
X-CSE-ConnectionGUID: a/lX4vO3T+i+vyFbppVzpA==
X-CSE-MsgGUID: E/IJjY8PSkSNRWSp00KMRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="70651855"
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="70651855"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 21:07:40 -0700
X-CSE-ConnectionGUID: iNaVNRY5TVW8Kghk0LVIvQ==
X-CSE-MsgGUID: mIUMiF3lTca2CfKc99cGFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="131620026"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Apr 2025 21:07:38 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0uoi-0001nv-21;
	Sat, 05 Apr 2025 04:07:36 +0000
Date: Sat, 5 Apr 2025 12:07:11 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-werror 6/7]
 arch/x86/include/asm/uaccess_64.h:128:3: error: unknown directive
Message-ID: <202504051253.2t0cOwDF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-werror
head:   d9200f830505ef0415720e0bd90fe183e62222c5
commit: 31eabb43d04f7a788da11c3c06cb00ace7e6bd2e [6/7] x86/alternative: Improve code generation readability
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250405/202504051253.2t0cOwDF-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504051253.2t0cOwDF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504051253.2t0cOwDF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/maccess.c:6:
   In file included from include/linux/mm.h:35:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:12:
   In file included from arch/x86/include/asm/uaccess.h:15:
   arch/x86/include/asm/smap.h:35:2: error: unknown directive
      35 |         alternative("", "stac", X86_FEATURE_SMAP);
         |         ^
   arch/x86/include/asm/alternative.h:228:22: note: expanded from macro 'alternative'
     228 |         asm_inline volatile(ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
         |                             ^
   arch/x86/include/asm/alternative.h:193:2: note: expanded from macro 'ALTERNATIVE'
     193 |         __ALTERNATIVE("\t" oldinstr, newinstr, ft_flags) "\n"
         |         ^
   arch/x86/include/asm/alternative.h:175:2: note: expanded from macro '__ALTERNATIVE'
     175 |         OLDINSTR(oldinstr)                                              \
         |         ^
   arch/x86/include/asm/alternative.h:157:3: note: expanded from macro 'OLDINSTR'
     157 |         "773: "
         |          ^
   <inline asm>:6:131: note: instantiated into assembly here
       6 | 773: .pushsection .altinstructions,"a";  .long 771b - .;  .long 774f - .;  .4byte ( 9*32+20);  .byte 773b-771b;  .byte 775f-774f; .popsection.pushsection .altinstr_replacement, "ax"
         |                                                                                                                                   ^
   In file included from mm/maccess.c:6:
   In file included from include/linux/mm.h:35:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:12:
   In file included from arch/x86/include/asm/uaccess.h:22:
>> arch/x86/include/asm/uaccess_64.h:128:3: error: unknown directive
     128 |                 ALTERNATIVE("rep movsb",
         |                 ^
   arch/x86/include/asm/alternative.h:193:2: note: expanded from macro 'ALTERNATIVE'
     193 |         __ALTERNATIVE("\t" oldinstr, newinstr, ft_flags) "\n"
         |         ^
   arch/x86/include/asm/alternative.h:175:2: note: expanded from macro '__ALTERNATIVE'
     175 |         OLDINSTR(oldinstr)                                              \
         |         ^
   arch/x86/include/asm/alternative.h:157:3: note: expanded from macro 'OLDINSTR'
     157 |         "773: "
         |          ^
   <inline asm>:7:154: note: instantiated into assembly here
       7 | 773: .pushsection .altinstructions,"a";  .long 771b - .;  .long 774f - .;  .4byte (((1 << 0) << 16) | ((18*32+ 4)));  .byte 773b-771b;  .byte 775f-774f; .popsection.pushsection .altinstr_replacement, "ax"
         |                                                                                                                                                          ^
   In file included from mm/maccess.c:6:
   In file included from include/linux/mm.h:35:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:12:
   In file included from arch/x86/include/asm/uaccess.h:15:
   arch/x86/include/asm/smap.h:29:2: error: unknown directive
      29 |         alternative("", "clac", X86_FEATURE_SMAP);
         |         ^
   arch/x86/include/asm/alternative.h:228:22: note: expanded from macro 'alternative'
     228 |         asm_inline volatile(ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
         |                             ^
   arch/x86/include/asm/alternative.h:193:2: note: expanded from macro 'ALTERNATIVE'
     193 |         __ALTERNATIVE("\t" oldinstr, newinstr, ft_flags) "\n"
         |         ^
   arch/x86/include/asm/alternative.h:175:2: note: expanded from macro '__ALTERNATIVE'
     175 |         OLDINSTR(oldinstr)                                              \
         |         ^
   arch/x86/include/asm/alternative.h:157:3: note: expanded from macro 'OLDINSTR'
     157 |         "773: "
         |          ^
   <inline asm>:6:131: note: instantiated into assembly here
       6 | 773: .pushsection .altinstructions,"a";  .long 771b - .;  .long 774f - .;  .4byte ( 9*32+20);  .byte 773b-771b;  .byte 775f-774f; .popsection.pushsection .altinstr_replacement, "ax"
         |                                                                                                                                   ^
   In file included from mm/maccess.c:6:
   In file included from include/linux/mm.h:35:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:12:
   In file included from arch/x86/include/asm/uaccess.h:15:
   arch/x86/include/asm/smap.h:35:2: error: unknown directive
      35 |         alternative("", "stac", X86_FEATURE_SMAP);
         |         ^
   arch/x86/include/asm/alternative.h:228:22: note: expanded from macro 'alternative'
     228 |         asm_inline volatile(ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
         |                             ^
   arch/x86/include/asm/alternative.h:193:2: note: expanded from macro 'ALTERNATIVE'
     193 |         __ALTERNATIVE("\t" oldinstr, newinstr, ft_flags) "\n"
         |         ^
   arch/x86/include/asm/alternative.h:175:2: note: expanded from macro '__ALTERNATIVE'
     175 |         OLDINSTR(oldinstr)                                              \
         |         ^
   arch/x86/include/asm/alternative.h:157:3: note: expanded from macro 'OLDINSTR'
     157 |         "773: "
         |          ^
   <inline asm>:6:131: note: instantiated into assembly here
       6 | 773: .pushsection .altinstructions,"a";  .long 771b - .;  .long 774f - .;  .4byte ( 9*32+20);  .byte 773b-771b;  .byte 775f-774f; .popsection.pushsection .altinstr_replacement, "ax"
         |                                                                                                                                   ^
   In file included from mm/maccess.c:6:
   In file included from include/linux/mm.h:35:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:12:
   In file included from arch/x86/include/asm/uaccess.h:22:
>> arch/x86/include/asm/uaccess_64.h:128:3: error: unknown directive
     128 |                 ALTERNATIVE("rep movsb",
         |                 ^
   arch/x86/include/asm/alternative.h:193:2: note: expanded from macro 'ALTERNATIVE'
     193 |         __ALTERNATIVE("\t" oldinstr, newinstr, ft_flags) "\n"
         |         ^
   arch/x86/include/asm/alternative.h:175:2: note: expanded from macro '__ALTERNATIVE'
     175 |         OLDINSTR(oldinstr)                                              \
         |         ^
   arch/x86/include/asm/alternative.h:157:3: note: expanded from macro 'OLDINSTR'
     157 |         "773: "
         |          ^
   <inline asm>:7:154: note: instantiated into assembly here
       7 | 773: .pushsection .altinstructions,"a";  .long 771b - .;  .long 774f - .;  .4byte (((1 << 0) << 16) | ((18*32+ 4)));  .byte 773b-771b;  .byte 775f-774f; .popsection.pushsection .altinstr_replacement, "ax"
         |                                                                                                                                                          ^
   In file included from mm/maccess.c:6:
   In file included from include/linux/mm.h:35:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:12:
   In file included from arch/x86/include/asm/uaccess.h:15:
   arch/x86/include/asm/smap.h:29:2: error: unknown directive
      29 |         alternative("", "clac", X86_FEATURE_SMAP);
         |         ^
   arch/x86/include/asm/alternative.h:228:22: note: expanded from macro 'alternative'
     228 |         asm_inline volatile(ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
         |                             ^
   arch/x86/include/asm/alternative.h:193:2: note: expanded from macro 'ALTERNATIVE'
     193 |         __ALTERNATIVE("\t" oldinstr, newinstr, ft_flags) "\n"
         |         ^
   arch/x86/include/asm/alternative.h:175:2: note: expanded from macro '__ALTERNATIVE'
     175 |         OLDINSTR(oldinstr)                                              \
         |         ^
   arch/x86/include/asm/alternative.h:157:3: note: expanded from macro 'OLDINSTR'
     157 |         "773: "
         |          ^
   <inline asm>:6:131: note: instantiated into assembly here
       6 | 773: .pushsection .altinstructions,"a";  .long 771b - .;  .long 774f - .;  .4byte ( 9*32+20);  .byte 773b-771b;  .byte 775f-774f; .popsection.pushsection .altinstr_replacement, "ax"
         |                                                                                                                                   ^
   6 errors generated.
--
   mm/shmem.c:1689:20: warning: unused function 'shmem_show_mpol' [-Wunused-function]
    1689 | static inline void shmem_show_mpol(struct seq_file *seq, struct mempolicy *mpol)
         |                    ^~~~~~~~~~~~~~~
   In file included from mm/shmem.c:24:
   In file included from include/linux/fs.h:7:
   In file included from include/linux/wait_bit.h:8:
   In file included from include/linux/wait.h:9:
   In file included from include/linux/spinlock.h:60:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/x86/include/asm/thread_info.h:12:
   In file included from arch/x86/include/asm/page.h:12:
>> arch/x86/include/asm/page_64.h:54:2: error: unknown directive
      54 |         alternative_call_2(clear_page_orig,
         |         ^
   arch/x86/include/asm/alternative.h:275:22: note: expanded from macro 'alternative_call_2'
     275 |         asm_inline volatile(ALTERNATIVE_2("call %c[old]", "call %c[new1]", ft_flags1,   \
         |                             ^
   arch/x86/include/asm/alternative.h:199:2: note: expanded from macro 'ALTERNATIVE_2'
     199 |         __ALTERNATIVE_2("\n\t" oldinstr, newinstr1, ft_flags1,          \
         |         ^
   arch/x86/include/asm/alternative.h:181:16: note: expanded from macro '__ALTERNATIVE_2'
     181 |         __ALTERNATIVE(__ALTERNATIVE(oldinstr, newinstr1, ft_flags1),\
         |                       ^
   arch/x86/include/asm/alternative.h:175:2: note: expanded from macro '__ALTERNATIVE'
     175 |         OLDINSTR(oldinstr)                                              \
         |         ^
   arch/x86/include/asm/alternative.h:157:3: note: expanded from macro 'OLDINSTR'
     157 |         "773: "
         |          ^
   <inline asm>:7:131: note: instantiated into assembly here
       7 | 773: .pushsection .altinstructions,"a";  .long 771b - .;  .long 774f - .;  .4byte ( 3*32+16);  .byte 773b-771b;  .byte 775f-774f; .popsection.pushsection .altinstr_replacement, "ax"
         |                                                                                                                                   ^
   In file included from mm/shmem.c:24:
   In file included from include/linux/fs.h:7:
   In file included from include/linux/wait_bit.h:8:
   In file included from include/linux/wait.h:9:
   In file included from include/linux/spinlock.h:60:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/x86/include/asm/thread_info.h:12:
   In file included from arch/x86/include/asm/page.h:12:
>> arch/x86/include/asm/page_64.h:54:2: error: unknown directive
      54 |         alternative_call_2(clear_page_orig,
         |         ^
   arch/x86/include/asm/alternative.h:275:22: note: expanded from macro 'alternative_call_2'
     275 |         asm_inline volatile(ALTERNATIVE_2("call %c[old]", "call %c[new1]", ft_flags1,   \
         |                             ^
   arch/x86/include/asm/alternative.h:199:2: note: expanded from macro 'ALTERNATIVE_2'
     199 |         __ALTERNATIVE_2("\n\t" oldinstr, newinstr1, ft_flags1,          \
         |         ^
   arch/x86/include/asm/alternative.h:181:2: note: expanded from macro '__ALTERNATIVE_2'
     181 |         __ALTERNATIVE(__ALTERNATIVE(oldinstr, newinstr1, ft_flags1),\
         |         ^
   arch/x86/include/asm/alternative.h:175:2: note: expanded from macro '__ALTERNATIVE'
     175 |         OLDINSTR(oldinstr)                                              \
         |         ^
   arch/x86/include/asm/alternative.h:157:3: note: expanded from macro 'OLDINSTR'
     157 |         "773: "
         |          ^
   <inline asm>:12:131: note: instantiated into assembly here
      12 | 773: .pushsection .altinstructions,"a";  .long 771b - .;  .long 774f - .;  .4byte ( 9*32+ 9);  .byte 773b-771b;  .byte 775f-774f; .popsection.pushsection .altinstr_replacement, "ax"
         |                                                                                                                                   ^
   1 warning and 2 errors generated.
--
     199 |         __ALTERNATIVE_2("\n\t" oldinstr, newinstr1, ft_flags1,          \
         |         ^
   arch/x86/include/asm/alternative.h:181:2: note: expanded from macro '__ALTERNATIVE_2'
     181 |         __ALTERNATIVE(__ALTERNATIVE(oldinstr, newinstr1, ft_flags1),\
         |         ^
   arch/x86/include/asm/alternative.h:175:2: note: expanded from macro '__ALTERNATIVE'
     175 |         OLDINSTR(oldinstr)                                              \
         |         ^
   arch/x86/include/asm/alternative.h:157:3: note: expanded from macro 'OLDINSTR'
     157 |         "773: "
         |          ^
   <inline asm>:12:124: note: instantiated into assembly here
      12 | 773: .pushsection .altinstructions,"a";  .long 771b - .;  .long 774f - .;  .4byte 519;  .byte 773b-771b;  .byte 775f-774f; .popsection.pushsection .altinstr_replacement, "ax"
         |                                                                                                                            ^
   In file included from mm/memory.c:42:
   In file included from include/linux/kernel_stat.h:7:
   In file included from include/linux/percpu.h:12:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/x86/include/asm/thread_info.h:59:
   arch/x86/include/asm/cpufeature.h:101:11: error: unknown directive
     101 |         asm goto(ALTERNATIVE_TERNARY("jmp 6f", %c[feature], "", "jmp %l[t_no]")
         |                  ^
   arch/x86/include/asm/alternative.h:213:2: note: expanded from macro 'ALTERNATIVE_TERNARY'
     213 |         ALTERNATIVE_2(oldinstr, newinstr_no, X86_FEATURE_ALWAYS, newinstr_yes, ft_flags)
         |         ^
   arch/x86/include/asm/alternative.h:199:2: note: expanded from macro 'ALTERNATIVE_2'
     199 |         __ALTERNATIVE_2("\n\t" oldinstr, newinstr1, ft_flags1,          \
         |         ^
   arch/x86/include/asm/alternative.h:181:16: note: expanded from macro '__ALTERNATIVE_2'
     181 |         __ALTERNATIVE(__ALTERNATIVE(oldinstr, newinstr1, ft_flags1),\
         |                       ^
   arch/x86/include/asm/alternative.h:175:2: note: expanded from macro '__ALTERNATIVE'
     175 |         OLDINSTR(oldinstr)                                              \
         |         ^
   arch/x86/include/asm/alternative.h:157:3: note: expanded from macro 'OLDINSTR'
     157 |         "773: "
         |          ^
   <inline asm>:7:131: note: instantiated into assembly here
       7 | 773: .pushsection .altinstructions,"a";  .long 771b - .;  .long 774f - .;  .4byte ( 3*32+21);  .byte 773b-771b;  .byte 775f-774f; .popsection.pushsection .altinstr_replacement, "ax"
         |                                                                                                                                   ^
   In file included from mm/memory.c:42:
   In file included from include/linux/kernel_stat.h:7:
   In file included from include/linux/percpu.h:12:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/x86/include/asm/thread_info.h:59:
   arch/x86/include/asm/cpufeature.h:101:11: error: unknown directive
     101 |         asm goto(ALTERNATIVE_TERNARY("jmp 6f", %c[feature], "", "jmp %l[t_no]")
         |                  ^
   arch/x86/include/asm/alternative.h:213:2: note: expanded from macro 'ALTERNATIVE_TERNARY'
     213 |         ALTERNATIVE_2(oldinstr, newinstr_no, X86_FEATURE_ALWAYS, newinstr_yes, ft_flags)
         |         ^
   arch/x86/include/asm/alternative.h:199:2: note: expanded from macro 'ALTERNATIVE_2'
     199 |         __ALTERNATIVE_2("\n\t" oldinstr, newinstr1, ft_flags1,          \
         |         ^
   arch/x86/include/asm/alternative.h:181:2: note: expanded from macro '__ALTERNATIVE_2'
     181 |         __ALTERNATIVE(__ALTERNATIVE(oldinstr, newinstr1, ft_flags1),\
         |         ^
   arch/x86/include/asm/alternative.h:175:2: note: expanded from macro '__ALTERNATIVE'
     175 |         OLDINSTR(oldinstr)                                              \
         |         ^
   arch/x86/include/asm/alternative.h:157:3: note: expanded from macro 'OLDINSTR'
     157 |         "773: "
         |          ^
   <inline asm>:12:124: note: instantiated into assembly here
      12 | 773: .pushsection .altinstructions,"a";  .long 771b - .;  .long 774f - .;  .4byte 519;  .byte 773b-771b;  .byte 775f-774f; .popsection.pushsection .altinstr_replacement, "ax"
         |                                                                                                                            ^
   In file included from mm/memory.c:43:
   In file included from include/linux/mm.h:35:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:12:
   In file included from arch/x86/include/asm/uaccess.h:15:
   arch/x86/include/asm/smap.h:35:2: error: unknown directive
      35 |         alternative("", "stac", X86_FEATURE_SMAP);
         |         ^
   arch/x86/include/asm/alternative.h:228:22: note: expanded from macro 'alternative'
     228 |         asm_inline volatile(ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
         |                             ^
   arch/x86/include/asm/alternative.h:193:2: note: expanded from macro 'ALTERNATIVE'
     193 |         __ALTERNATIVE("\t" oldinstr, newinstr, ft_flags) "\n"
         |         ^
   arch/x86/include/asm/alternative.h:175:2: note: expanded from macro '__ALTERNATIVE'
     175 |         OLDINSTR(oldinstr)                                              \
         |         ^
   arch/x86/include/asm/alternative.h:157:3: note: expanded from macro 'OLDINSTR'
     157 |         "773: "
         |          ^
   <inline asm>:6:131: note: instantiated into assembly here
       6 | 773: .pushsection .altinstructions,"a";  .long 771b - .;  .long 774f - .;  .4byte ( 9*32+20);  .byte 773b-771b;  .byte 775f-774f; .popsection.pushsection .altinstr_replacement, "ax"
         |                                                                                                                                   ^
   In file included from mm/memory.c:43:
   In file included from include/linux/mm.h:35:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:12:
   In file included from arch/x86/include/asm/uaccess.h:22:
>> arch/x86/include/asm/uaccess_64.h:128:3: error: unknown directive
     128 |                 ALTERNATIVE("rep movsb",
         |                 ^
   arch/x86/include/asm/alternative.h:193:2: note: expanded from macro 'ALTERNATIVE'
     193 |         __ALTERNATIVE("\t" oldinstr, newinstr, ft_flags) "\n"
         |         ^
   arch/x86/include/asm/alternative.h:175:2: note: expanded from macro '__ALTERNATIVE'
     175 |         OLDINSTR(oldinstr)                                              \
         |         ^
   arch/x86/include/asm/alternative.h:157:3: note: expanded from macro 'OLDINSTR'
     157 |         "773: "
         |          ^
   <inline asm>:7:154: note: instantiated into assembly here
       7 | 773: .pushsection .altinstructions,"a";  .long 771b - .;  .long 774f - .;  .4byte (((1 << 0) << 16) | ((18*32+ 4)));  .byte 773b-771b;  .byte 775f-774f; .popsection.pushsection .altinstr_replacement, "ax"
         |                                                                                                                                                          ^
   In file included from mm/memory.c:43:
   In file included from include/linux/mm.h:35:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:12:
   In file included from arch/x86/include/asm/uaccess.h:15:
   arch/x86/include/asm/smap.h:29:2: error: unknown directive
      29 |         alternative("", "clac", X86_FEATURE_SMAP);
         |         ^
   arch/x86/include/asm/alternative.h:228:22: note: expanded from macro 'alternative'
     228 |         asm_inline volatile(ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
         |                             ^
   arch/x86/include/asm/alternative.h:193:2: note: expanded from macro 'ALTERNATIVE'
     193 |         __ALTERNATIVE("\t" oldinstr, newinstr, ft_flags) "\n"
         |         ^
   arch/x86/include/asm/alternative.h:175:2: note: expanded from macro '__ALTERNATIVE'
     175 |         OLDINSTR(oldinstr)                                              \
         |         ^
   arch/x86/include/asm/alternative.h:157:3: note: expanded from macro 'OLDINSTR'
     157 |         "773: "
         |          ^
   <inline asm>:6:131: note: instantiated into assembly here
       6 | 773: .pushsection .altinstructions,"a";  .long 771b - .;  .long 774f - .;  .4byte ( 9*32+20);  .byte 773b-771b;  .byte 775f-774f; .popsection.pushsection .altinstr_replacement, "ax"
         |                                                                                                                                   ^
   In file included from mm/memory.c:43:
   In file included from include/linux/mm.h:35:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:12:
   In file included from arch/x86/include/asm/uaccess.h:15:
   arch/x86/include/asm/smap.h:35:2: error: unknown directive
      35 |         alternative("", "stac", X86_FEATURE_SMAP);
         |         ^
   arch/x86/include/asm/alternative.h:228:22: note: expanded from macro 'alternative'
     228 |         asm_inline volatile(ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
         |                             ^
   arch/x86/include/asm/alternative.h:193:2: note: expanded from macro 'ALTERNATIVE'
     193 |         __ALTERNATIVE("\t" oldinstr, newinstr, ft_flags) "\n"
         |         ^
   arch/x86/include/asm/alternative.h:175:2: note: expanded from macro '__ALTERNATIVE'
     175 |         OLDINSTR(oldinstr)                                              \
         |         ^
   arch/x86/include/asm/alternative.h:157:3: note: expanded from macro 'OLDINSTR'
     157 |         "773: "
         |          ^
   <inline asm>:6:131: note: instantiated into assembly here
       6 | 773: .pushsection .altinstructions,"a";  .long 771b - .;  .long 774f - .;  .4byte ( 9*32+20);  .byte 773b-771b;  .byte 775f-774f; .popsection.pushsection .altinstr_replacement, "ax"
         |                                                                                                                                   ^
   In file included from mm/memory.c:43:
   In file included from include/linux/mm.h:35:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:12:
   In file included from arch/x86/include/asm/uaccess.h:22:
>> arch/x86/include/asm/uaccess_64.h:128:3: error: unknown directive
     128 |                 ALTERNATIVE("rep movsb",
         |                 ^
   arch/x86/include/asm/alternative.h:193:2: note: expanded from macro 'ALTERNATIVE'
     193 |         __ALTERNATIVE("\t" oldinstr, newinstr, ft_flags) "\n"
         |         ^
   arch/x86/include/asm/alternative.h:175:2: note: expanded from macro '__ALTERNATIVE'
     175 |         OLDINSTR(oldinstr)                                              \
         |         ^
   arch/x86/include/asm/alternative.h:157:3: note: expanded from macro 'OLDINSTR'
     157 |         "773: "
         |          ^
   <inline asm>:7:154: note: instantiated into assembly here
       7 | 773: .pushsection .altinstructions,"a";  .long 771b - .;  .long 774f - .;  .4byte (((1 << 0) << 16) | ((18*32+ 4)));  .byte 773b-771b;  .byte 775f-774f; .popsection.pushsection .altinstr_replacement, "ax"
         |                                                                                                                                                          ^
   In file included from mm/memory.c:43:
   In file included from include/linux/mm.h:35:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:12:
   In file included from arch/x86/include/asm/uaccess.h:15:
   arch/x86/include/asm/smap.h:29:2: error: unknown directive
      29 |         alternative("", "clac", X86_FEATURE_SMAP);
         |         ^
   arch/x86/include/asm/alternative.h:228:22: note: expanded from macro 'alternative'
     228 |         asm_inline volatile(ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
         |                             ^
   arch/x86/include/asm/alternative.h:193:2: note: expanded from macro 'ALTERNATIVE'
     193 |         __ALTERNATIVE("\t" oldinstr, newinstr, ft_flags) "\n"
         |         ^
   arch/x86/include/asm/alternative.h:175:2: note: expanded from macro '__ALTERNATIVE'
     175 |         OLDINSTR(oldinstr)                                              \
         |         ^
   arch/x86/include/asm/alternative.h:157:3: note: expanded from macro 'OLDINSTR'
     157 |         "773: "
         |          ^
   <inline asm>:6:131: note: instantiated into assembly here
       6 | 773: .pushsection .altinstructions,"a";  .long 771b - .;  .long 774f - .;  .4byte ( 9*32+20);  .byte 773b-771b;  .byte 775f-774f; .popsection.pushsection .altinstr_replacement, "ax"
         |                                                                                                                                   ^
   In file included from mm/memory.c:42:
   In file included from include/linux/kernel_stat.h:7:
   In file included from include/linux/percpu.h:12:
   In file included from include/linux/sched.h:13:
   In file included from arch/x86/include/asm/processor.h:20:
   In file included from arch/x86/include/asm/page.h:12:
>> arch/x86/include/asm/page_64.h:54:2: error: unknown directive
      54 |         alternative_call_2(clear_page_orig,
         |         ^
   arch/x86/include/asm/alternative.h:275:22: note: expanded from macro 'alternative_call_2'
     275 |         asm_inline volatile(ALTERNATIVE_2("call %c[old]", "call %c[new1]", ft_flags1,   \
         |                             ^
   arch/x86/include/asm/alternative.h:199:2: note: expanded from macro 'ALTERNATIVE_2'
     199 |         __ALTERNATIVE_2("\n\t" oldinstr, newinstr1, ft_flags1,          \
         |         ^
   arch/x86/include/asm/alternative.h:181:16: note: expanded from macro '__ALTERNATIVE_2'
     181 |         __ALTERNATIVE(__ALTERNATIVE(oldinstr, newinstr1, ft_flags1),\
         |                       ^
   arch/x86/include/asm/alternative.h:175:2: note: expanded from macro '__ALTERNATIVE'
     175 |         OLDINSTR(oldinstr)                                              \
         |         ^
   arch/x86/include/asm/alternative.h:157:3: note: expanded from macro 'OLDINSTR'
     157 |         "773: "
         |          ^
   <inline asm>:7:131: note: instantiated into assembly here
       7 | 773: .pushsection .altinstructions,"a";  .long 771b - .;  .long 774f - .;  .4byte ( 3*32+16);  .byte 773b-771b;  .byte 775f-774f; .popsection.pushsection .altinstr_replacement, "ax"
         |                                                                                                                                   ^
   In file included from mm/memory.c:42:
   In file included from include/linux/kernel_stat.h:7:
   In file included from include/linux/percpu.h:12:
   In file included from include/linux/sched.h:13:
   In file included from arch/x86/include/asm/processor.h:20:
   In file included from arch/x86/include/asm/page.h:12:
>> arch/x86/include/asm/page_64.h:54:2: error: unknown directive
      54 |         alternative_call_2(clear_page_orig,
         |         ^
   arch/x86/include/asm/alternative.h:275:22: note: expanded from macro 'alternative_call_2'
     275 |         asm_inline volatile(ALTERNATIVE_2("call %c[old]", "call %c[new1]", ft_flags1,   \
         |                             ^
   arch/x86/include/asm/alternative.h:199:2: note: expanded from macro 'ALTERNATIVE_2'
     199 |         __ALTERNATIVE_2("\n\t" oldinstr, newinstr1, ft_flags1,          \
         |         ^
   arch/x86/include/asm/alternative.h:181:2: note: expanded from macro '__ALTERNATIVE_2'
     181 |         __ALTERNATIVE(__ALTERNATIVE(oldinstr, newinstr1, ft_flags1),\
         |         ^
   arch/x86/include/asm/alternative.h:175:2: note: expanded from macro '__ALTERNATIVE'
     175 |         OLDINSTR(oldinstr)                                              \
         |         ^
   arch/x86/include/asm/alternative.h:157:3: note: expanded from macro 'OLDINSTR'
     157 |         "773: "
         |          ^
   <inline asm>:12:131: note: instantiated into assembly here
      12 | 773: .pushsection .altinstructions,"a";  .long 771b - .;  .long 774f - .;  .4byte ( 9*32+ 9);  .byte 773b-771b;  .byte 775f-774f; .popsection.pushsection .altinstr_replacement, "ax"
         |                                                                                                                                   ^
   In file included from mm/memory.c:42:
   In file included from include/linux/kernel_stat.h:7:
   In file included from include/linux/percpu.h:12:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/x86/include/asm/thread_info.h:59:
   arch/x86/include/asm/cpufeature.h:101:11: error: unknown directive
     101 |         asm goto(ALTERNATIVE_TERNARY("jmp 6f", %c[feature], "", "jmp %l[t_no]")
         |                  ^
   arch/x86/include/asm/alternative.h:213:2: note: expanded from macro 'ALTERNATIVE_TERNARY'
     213 |         ALTERNATIVE_2(oldinstr, newinstr_no, X86_FEATURE_ALWAYS, newinstr_yes, ft_flags)
         |         ^
   arch/x86/include/asm/alternative.h:199:2: note: expanded from macro 'ALTERNATIVE_2'
     199 |         __ALTERNATIVE_2("\n\t" oldinstr, newinstr1, ft_flags1,          \
         |         ^
   arch/x86/include/asm/alternative.h:181:16: note: expanded from macro '__ALTERNATIVE_2'
     181 |         __ALTERNATIVE(__ALTERNATIVE(oldinstr, newinstr1, ft_flags1),\
         |                       ^
   arch/x86/include/asm/alternative.h:175:2: note: expanded from macro '__ALTERNATIVE'
     175 |         OLDINSTR(oldinstr)                                              \
         |         ^
   arch/x86/include/asm/alternative.h:157:3: note: expanded from macro 'OLDINSTR'
     157 |         "773: "
         |          ^
   <inline asm>:7:131: note: instantiated into assembly here
       7 | 773: .pushsection .altinstructions,"a";  .long 771b - .;  .long 774f - .;  .4byte ( 3*32+21);  .byte 773b-771b;  .byte 775f-774f; .popsection.pushsection .altinstr_replacement, "ax"
         |                                                                                                                                   ^
   In file included from mm/memory.c:42:
   In file included from include/linux/kernel_stat.h:7:
   In file included from include/linux/percpu.h:12:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/x86/include/asm/thread_info.h:59:
   arch/x86/include/asm/cpufeature.h:101:11: error: unknown directive
     101 |         asm goto(ALTERNATIVE_TERNARY("jmp 6f", %c[feature], "", "jmp %l[t_no]")
         |                  ^
   arch/x86/include/asm/alternative.h:213:2: note: expanded from macro 'ALTERNATIVE_TERNARY'
     213 |         ALTERNATIVE_2(oldinstr, newinstr_no, X86_FEATURE_ALWAYS, newinstr_yes, ft_flags)
         |         ^
   arch/x86/include/asm/alternative.h:199:2: note: expanded from macro 'ALTERNATIVE_2'
     199 |         __ALTERNATIVE_2("\n\t" oldinstr, newinstr1, ft_flags1,          \
         |         ^
   arch/x86/include/asm/alternative.h:181:2: note: expanded from macro '__ALTERNATIVE_2'
     181 |         __ALTERNATIVE(__ALTERNATIVE(oldinstr, newinstr1, ft_flags1),\
         |         ^
   arch/x86/include/asm/alternative.h:175:2: note: expanded from macro '__ALTERNATIVE'
     175 |         OLDINSTR(oldinstr)                                              \
         |         ^
   arch/x86/include/asm/alternative.h:157:3: note: expanded from macro 'OLDINSTR'
     157 |         "773: "
         |          ^
   <inline asm>:12:124: note: instantiated into assembly here
      12 | 773: .pushsection .altinstructions,"a";  .long 771b - .;  .long 774f - .;  .4byte 519;  .byte 773b-771b;  .byte 775f-774f; .popsection.pushsection .altinstr_replacement, "ax"
         |                                                                                                                            ^
   In file included from mm/memory.c:42:
   In file included from include/linux/kernel_stat.h:7:
   In file included from include/linux/percpu.h:12:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/x86/include/asm/thread_info.h:59:
   arch/x86/include/asm/cpufeature.h:101:11: error: unknown directive
     101 |         asm goto(ALTERNATIVE_TERNARY("jmp 6f", %c[feature], "", "jmp %l[t_no]")
         |                  ^
   arch/x86/include/asm/alternative.h:213:2: note: expanded from macro 'ALTERNATIVE_TERNARY'
     213 |         ALTERNATIVE_2(oldinstr, newinstr_no, X86_FEATURE_ALWAYS, newinstr_yes, ft_flags)
         |         ^
   arch/x86/include/asm/alternative.h:199:2: note: expanded from macro 'ALTERNATIVE_2'
     199 |         __ALTERNATIVE_2("\n\t" oldinstr, newinstr1, ft_flags1,          \
         |         ^
   arch/x86/include/asm/alternative.h:181:16: note: expanded from macro '__ALTERNATIVE_2'
     181 |         __ALTERNATIVE(__ALTERNATIVE(oldinstr, newinstr1, ft_flags1),\
         |                       ^
   arch/x86/include/asm/alternative.h:175:2: note: expanded from macro '__ALTERNATIVE'
     175 |         OLDINSTR(oldinstr)                                              \
         |         ^
   arch/x86/include/asm/alternative.h:157:3: note: expanded from macro 'OLDINSTR'
     157 |         "773: "
         |          ^
   <inline asm>:7:131: note: instantiated into assembly here
       7 | 773: .pushsection .altinstructions,"a";  .long 771b - .;  .long 774f - .;  .4byte ( 3*32+21);  .byte 773b-771b;  .byte 775f-774f; .popsection.pushsection .altinstr_replacement, "ax"
..


vim +128 arch/x86/include/asm/uaccess_64.h

1b1d9258181bae arch/x86/include/asm/uaccess_64.h Jan Beulich    2009-12-18  117  
1b1d9258181bae arch/x86/include/asm/uaccess_64.h Jan Beulich    2009-12-18  118  static __always_inline __must_check unsigned long
577e6a7fd50d51 arch/x86/include/asm/uaccess_64.h Linus Torvalds 2023-04-15  119  copy_user_generic(void *to, const void *from, unsigned long len)
1b1d9258181bae arch/x86/include/asm/uaccess_64.h Jan Beulich    2009-12-18  120  {
3639a535587d7a arch/x86/include/asm/uaccess_64.h Linus Torvalds 2023-04-15  121  	stac();
954e482bde20b0 arch/x86/include/asm/uaccess_64.h Fenghua Yu     2012-05-24  122  	/*
adfcf4231b8cbc arch/x86/include/asm/uaccess_64.h Linus Torvalds 2023-04-15  123  	 * If CPU has FSRM feature, use 'rep movs'.
427fda2c8a4977 arch/x86/include/asm/uaccess_64.h Linus Torvalds 2023-04-16  124  	 * Otherwise, use rep_movs_alternative.
954e482bde20b0 arch/x86/include/asm/uaccess_64.h Fenghua Yu     2012-05-24  125  	 */
577e6a7fd50d51 arch/x86/include/asm/uaccess_64.h Linus Torvalds 2023-04-15  126  	asm volatile(
577e6a7fd50d51 arch/x86/include/asm/uaccess_64.h Linus Torvalds 2023-04-15  127  		"1:\n\t"
577e6a7fd50d51 arch/x86/include/asm/uaccess_64.h Linus Torvalds 2023-04-15 @128  		ALTERNATIVE("rep movsb",
427fda2c8a4977 arch/x86/include/asm/uaccess_64.h Linus Torvalds 2023-04-16  129  			    "call rep_movs_alternative", ALT_NOT(X86_FEATURE_FSRM))
577e6a7fd50d51 arch/x86/include/asm/uaccess_64.h Linus Torvalds 2023-04-15  130  		"2:\n"
577e6a7fd50d51 arch/x86/include/asm/uaccess_64.h Linus Torvalds 2023-04-15  131  		_ASM_EXTABLE_UA(1b, 2b)
577e6a7fd50d51 arch/x86/include/asm/uaccess_64.h Linus Torvalds 2023-04-15  132  		:"+c" (len), "+D" (to), "+S" (from), ASM_CALL_CONSTRAINT
ca96b162bfd21a arch/x86/include/asm/uaccess_64.h Mateusz Guzik  2023-08-30  133  		: : "memory", "rax");
3639a535587d7a arch/x86/include/asm/uaccess_64.h Linus Torvalds 2023-04-15  134  	clac();
577e6a7fd50d51 arch/x86/include/asm/uaccess_64.h Linus Torvalds 2023-04-15  135  	return len;
1b1d9258181bae arch/x86/include/asm/uaccess_64.h Jan Beulich    2009-12-18  136  }
95912008ba1fb9 include/asm-x86_64/uaccess.h      Andi Kleen     2006-09-26  137  

:::::: The code at line 128 was first introduced by commit
:::::: 577e6a7fd50d519c201d20968b6a027a6563dc4c x86: inline the 'rep movs' in user copies for the FSRM case

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
