Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4A813B5B5;
	Thu, 28 Mar 2024 19:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711655727; cv=none; b=FjvK3aIep09ewaXv6emPBeUjjvyggcD603ShehNm3SNPrPMWHsJkzEla/rsdnQXxFNtgFALuLgVxIF9482pwhELmXye8lspsii7rkPz6TbrmgBZA/qBlmmAq7rc2aFcpmd++AKZU8Yhmou9uat1aXG2GCpgN2uwbXxme+65pL0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711655727; c=relaxed/simple;
	bh=aIbjoPn+YayloynyGr6U+Lk9tY3NvaE0kTwRGeavl04=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TNKOf1cu+Unn8Js2wN+HpU8ThmLwuIbWSfyGXrdx98G9TBFS9r/+2Rv/dcGEGDgq62xB/T1fIzmOoFKOQQ4+46oxUFgTe+Z+pv9wZhuv3DxfuTDRaq0FjeCQB9fq6JA8XPfW4NoPX1Mz5IqPS/NLvUX25x4FIXJxLcQjXwoKt2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cYLepJPs; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cYLepJPs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711655724; x=1743191724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aIbjoPn+YayloynyGr6U+Lk9tY3NvaE0kTwRGeavl04=;
  b=cYLepJPst9SB6Dk9rHudP2AKztq3Q0aakiOA78ofx9h2LJXrN4lH6BqG
   ZRGL1C+oCDQOcNrLg9Cc+AuzaOgU16kx2KXO5JX7n+c4gXwiTnOCwuSgY
   TmGI9hbnnYMAnLTzrEb0n38GJtlT0dh/Vkw80OEyLtcdPqG++p8E7u2ho
   U6EZ2WAPTcdbgtXbfDrCddlvGtdz1bIFoJBoPTeWQfi3QssLkAoOI10kd
   U6hsfRBPxagqKGXLyZcgOATMv8RTXEehXQOY7JEvt5IWU8qYJWpw6nBHg
   h640DCfUag/ziG7thZod0ckGX95BsRZLybfQYIbo2d7SaOLG61H+zpPgP
   w==;
X-CSE-ConnectionGUID: fUdKq+SuR0CD7jn4e88vzg==
X-CSE-MsgGUID: +twbmFPWSbmGJ22uu+Kj3A==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="9791191"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="9791191"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 12:55:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="21263354"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Mar 2024 12:55:21 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpvqI-0002UF-2o;
	Thu, 28 Mar 2024 19:55:18 +0000
Date: Fri, 29 Mar 2024 03:54:58 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Kees Cook <keescook@chromium.org>
Subject: [linux-next:master 1076/1266] include/linux/alloc_tag.h:43:2: error:
 "Memory allocation profiling is incompatible with ARCH_NEEDS_WEAK_PER_CPU"
Message-ID: <202403290334.USWrYrMw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a6bd6c9333397f5a0e2667d4d82fef8c970108f2
commit: ce3297eef13a5e5c03f99dc81fa4948340938b36 [1076/1266] mm: enable page allocation tagging
config: s390-randconfig-002-20240328 (https://download.01.org/0day-ci/archive/20240329/202403290334.USWrYrMw-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 23de3862dce582ce91c1aa914467d982cb1a73b4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403290334.USWrYrMw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403290334.USWrYrMw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/input/rmi4/rmi_spi.c:8:
   In file included from include/linux/module.h:17:
   In file included from include/linux/kmod.h:9:
   In file included from include/linux/umh.h:4:
   In file included from include/linux/gfp.h:9:
>> include/linux/alloc_tag.h:43:2: error: "Memory allocation profiling is incompatible with ARCH_NEEDS_WEAK_PER_CPU"
      43 | #error "Memory allocation profiling is incompatible with ARCH_NEEDS_WEAK_PER_CPU"
         |  ^
   In file included from drivers/input/rmi4/rmi_spi.c:8:
   In file included from include/linux/module.h:17:
   In file included from include/linux/kmod.h:9:
   In file included from include/linux/umh.h:4:
>> include/linux/gfp.h:295:9: error: '__section__' attribute only applies to functions, global variables, Objective-C methods, and Objective-C properties
     295 |         return __folio_alloc_node(gfp, order, numa_node_id());
         |                ^
   include/linux/gfp.h:258:35: note: expanded from macro '__folio_alloc_node'
     258 | #define  __folio_alloc_node(...)                alloc_hooks(__folio_alloc_node_noprof(__VA_ARGS__))
         |                                                 ^
   include/linux/alloc_tag.h:155:2: note: expanded from macro 'alloc_hooks'
     155 |         DEFINE_ALLOC_TAG(_alloc_tag);                                   \
         |         ^
   include/linux/alloc_tag.h:47:9: note: expanded from macro 'DEFINE_ALLOC_TAG'
      47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _alloc_tag_cntr);      \
         |                ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/percpu-defs.h:93:2: note: expanded from macro 'DEFINE_PER_CPU_SECTION'
      93 |         __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;                   \
         |         ^
   include/linux/percpu-defs.h:54:2: note: expanded from macro '__PCPU_DUMMY_ATTRS'
      54 |         __section(".discard") __attribute__((unused))
         |         ^
   include/linux/compiler_attributes.h:334:56: note: expanded from macro '__section'
     334 | #define __section(section)              __attribute__((__section__(section)))
         |                                                        ^
   In file included from drivers/input/rmi4/rmi_spi.c:8:
   In file included from include/linux/module.h:17:
   In file included from include/linux/kmod.h:9:
   In file included from include/linux/umh.h:4:
>> include/linux/gfp.h:295:9: error: non-extern declaration of '__pcpu_unique__alloc_tag_cntr' follows extern declaration
   include/linux/gfp.h:258:35: note: expanded from macro '__folio_alloc_node'
     258 | #define  __folio_alloc_node(...)                alloc_hooks(__folio_alloc_node_noprof(__VA_ARGS__))
         |                                                 ^
   include/linux/alloc_tag.h:155:2: note: expanded from macro 'alloc_hooks'
     155 |         DEFINE_ALLOC_TAG(_alloc_tag);                                   \
         |         ^
   include/linux/alloc_tag.h:47:9: note: expanded from macro 'DEFINE_ALLOC_TAG'
      47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _alloc_tag_cntr);      \
         |                ^
   include/linux/percpu-defs.h:115:2: note: expanded from macro 'DEFINE_PER_CPU'
     115 |         DEFINE_PER_CPU_SECTION(type, name, "")
         |         ^
   include/linux/percpu-defs.h:93:26: note: expanded from macro 'DEFINE_PER_CPU_SECTION'
      93 |         __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;                   \
         |                                 ^
   <scratch space>:101:1: note: expanded from here
     101 | __pcpu_unique__alloc_tag_cntr
         | ^
   include/linux/gfp.h:295:9: note: previous declaration is here
   include/linux/gfp.h:258:35: note: expanded from macro '__folio_alloc_node'
     258 | #define  __folio_alloc_node(...)                alloc_hooks(__folio_alloc_node_noprof(__VA_ARGS__))
         |                                                 ^
   include/linux/alloc_tag.h:155:2: note: expanded from macro 'alloc_hooks'
     155 |         DEFINE_ALLOC_TAG(_alloc_tag);                                   \
         |         ^
   include/linux/alloc_tag.h:47:9: note: expanded from macro 'DEFINE_ALLOC_TAG'
      47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _alloc_tag_cntr);      \
         |                ^
   include/linux/percpu-defs.h:115:2: note: expanded from macro 'DEFINE_PER_CPU'
     115 |         DEFINE_PER_CPU_SECTION(type, name, "")
         |         ^
   include/linux/percpu-defs.h:92:33: note: expanded from macro 'DEFINE_PER_CPU_SECTION'
      92 |         extern __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;            \
         |                                        ^
   <scratch space>:100:1: note: expanded from here
     100 | __pcpu_unique__alloc_tag_cntr
         | ^
   In file included from drivers/input/rmi4/rmi_spi.c:8:
   In file included from include/linux/module.h:17:
   In file included from include/linux/kmod.h:9:
   In file included from include/linux/umh.h:4:
>> include/linux/gfp.h:295:9: error: 'section' attribute only applies to functions, global variables, Objective-C methods, and Objective-C properties
     295 |         return __folio_alloc_node(gfp, order, numa_node_id());
         |                ^
   include/linux/gfp.h:258:35: note: expanded from macro '__folio_alloc_node'
     258 | #define  __folio_alloc_node(...)                alloc_hooks(__folio_alloc_node_noprof(__VA_ARGS__))
         |                                                 ^
   include/linux/alloc_tag.h:155:2: note: expanded from macro 'alloc_hooks'
     155 |         DEFINE_ALLOC_TAG(_alloc_tag);                                   \
         |         ^
   include/linux/alloc_tag.h:47:9: note: expanded from macro 'DEFINE_ALLOC_TAG'
      47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _alloc_tag_cntr);      \
         |                ^
   include/linux/percpu-defs.h:115:2: note: expanded from macro 'DEFINE_PER_CPU'
     115 |         DEFINE_PER_CPU_SECTION(type, name, "")
         |         ^
   include/linux/percpu-defs.h:95:2: note: expanded from macro 'DEFINE_PER_CPU_SECTION'
      95 |         __PCPU_ATTRS(sec) __weak __typeof__(type) name
         |         ^
   include/linux/percpu-defs.h:50:26: note: expanded from macro '__PCPU_ATTRS'
      50 |         __percpu __attribute__((section(PER_CPU_BASE_SECTION sec)))     \
         |                                 ^
   In file included from drivers/input/rmi4/rmi_spi.c:8:
   In file included from include/linux/module.h:17:
   In file included from include/linux/kmod.h:9:
   In file included from include/linux/umh.h:4:
>> include/linux/gfp.h:295:9: error: non-extern declaration of '_alloc_tag_cntr' follows extern declaration
   include/linux/gfp.h:258:35: note: expanded from macro '__folio_alloc_node'
     258 | #define  __folio_alloc_node(...)                alloc_hooks(__folio_alloc_node_noprof(__VA_ARGS__))
         |                                                 ^
   include/linux/alloc_tag.h:155:2: note: expanded from macro 'alloc_hooks'
     155 |         DEFINE_ALLOC_TAG(_alloc_tag);                                   \
         |         ^
   include/linux/alloc_tag.h:47:51: note: expanded from macro 'DEFINE_ALLOC_TAG'
      47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _alloc_tag_cntr);      \
         |                                                          ^
   include/linux/gfp.h:295:9: note: previous declaration is here
   include/linux/gfp.h:258:35: note: expanded from macro '__folio_alloc_node'
     258 | #define  __folio_alloc_node(...)                alloc_hooks(__folio_alloc_node_noprof(__VA_ARGS__))
         |                                                 ^
   include/linux/alloc_tag.h:155:2: note: expanded from macro 'alloc_hooks'
     155 |         DEFINE_ALLOC_TAG(_alloc_tag);                                   \
         |         ^
   include/linux/alloc_tag.h:47:51: note: expanded from macro 'DEFINE_ALLOC_TAG'
      47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _alloc_tag_cntr);      \
         |                                                          ^
   In file included from drivers/input/rmi4/rmi_spi.c:8:
   In file included from include/linux/module.h:17:
   In file included from include/linux/kmod.h:9:
   In file included from include/linux/umh.h:4:
>> include/linux/gfp.h:295:9: error: weak declaration cannot have internal linkage
     295 |         return __folio_alloc_node(gfp, order, numa_node_id());
         |                ^
   include/linux/gfp.h:258:35: note: expanded from macro '__folio_alloc_node'
     258 | #define  __folio_alloc_node(...)                alloc_hooks(__folio_alloc_node_noprof(__VA_ARGS__))
         |                                                 ^
   include/linux/alloc_tag.h:155:2: note: expanded from macro 'alloc_hooks'
     155 |         DEFINE_ALLOC_TAG(_alloc_tag);                                   \
         |         ^
   include/linux/alloc_tag.h:47:9: note: expanded from macro 'DEFINE_ALLOC_TAG'
      47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _alloc_tag_cntr);      \
         |                ^
   include/linux/percpu-defs.h:115:2: note: expanded from macro 'DEFINE_PER_CPU'
     115 |         DEFINE_PER_CPU_SECTION(type, name, "")
         |         ^
   include/linux/percpu-defs.h:95:20: note: expanded from macro 'DEFINE_PER_CPU_SECTION'
      95 |         __PCPU_ATTRS(sec) __weak __typeof__(type) name
         |                           ^
   include/linux/compiler_attributes.h:403:56: note: expanded from macro '__weak'
     403 | #define __weak                          __attribute__((__weak__))
         |                                                        ^
   In file included from drivers/input/rmi4/rmi_spi.c:8:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/input/rmi4/rmi_spi.c:8:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/input/rmi4/rmi_spi.c:8:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/input/rmi4/rmi_spi.c:8:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/input/rmi4/rmi_spi.c:8:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/input/rmi4/rmi_spi.c:8:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   In file included from include/linux/compat.h:17:
--
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   include/linux/compat.h:454:10: warning: array index 7 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:454:42: warning: array index 6 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:454:53: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                            ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/input/rmi4/rmi_spi.c:8:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   include/linux/compat.h:456:22: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                             ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/input/rmi4/rmi_spi.c:8:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   include/linux/compat.h:456:10: warning: array index 5 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:456:42: warning: array index 4 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:456:53: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                                                            ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/input/rmi4/rmi_spi.c:8:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   include/linux/compat.h:458:22: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                             ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/input/rmi4/rmi_spi.c:8:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   include/linux/compat.h:458:10: warning: array index 3 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:458:42: warning: array index 2 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:458:53: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                                                            ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/input/rmi4/rmi_spi.c:8:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/input/rmi4/rmi_spi.c:8:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
>> include/linux/mm.h:2862:22: error: '__section__' attribute only applies to functions, global variables, Objective-C methods, and Objective-C properties
    2862 |         struct page *page = alloc_pages(gfp | __GFP_COMP, order);
         |                             ^
   include/linux/gfp.h:301:28: note: expanded from macro 'alloc_pages'
     301 | #define alloc_pages(...)                        alloc_hooks(alloc_pages_noprof(__VA_ARGS__))
         |                                                 ^
   include/linux/alloc_tag.h:155:2: note: expanded from macro 'alloc_hooks'
     155 |         DEFINE_ALLOC_TAG(_alloc_tag);                                   \
         |         ^
   include/linux/alloc_tag.h:47:9: note: expanded from macro 'DEFINE_ALLOC_TAG'
      47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _alloc_tag_cntr);      \
         |                ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/percpu-defs.h:93:2: note: expanded from macro 'DEFINE_PER_CPU_SECTION'
      93 |         __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;                   \
         |         ^
   include/linux/percpu-defs.h:54:2: note: expanded from macro '__PCPU_DUMMY_ATTRS'
      54 |         __section(".discard") __attribute__((unused))
         |         ^
   include/linux/compiler_attributes.h:334:56: note: expanded from macro '__section'
     334 | #define __section(section)              __attribute__((__section__(section)))
         |                                                        ^
   In file included from drivers/input/rmi4/rmi_spi.c:8:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
>> include/linux/mm.h:2862:22: error: non-extern declaration of '__pcpu_unique__alloc_tag_cntr' follows extern declaration
   include/linux/gfp.h:301:28: note: expanded from macro 'alloc_pages'
     301 | #define alloc_pages(...)                        alloc_hooks(alloc_pages_noprof(__VA_ARGS__))
         |                                                 ^
   include/linux/alloc_tag.h:155:2: note: expanded from macro 'alloc_hooks'
     155 |         DEFINE_ALLOC_TAG(_alloc_tag);                                   \
         |         ^
   include/linux/alloc_tag.h:47:9: note: expanded from macro 'DEFINE_ALLOC_TAG'
      47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _alloc_tag_cntr);      \
         |                ^
   include/linux/percpu-defs.h:115:2: note: expanded from macro 'DEFINE_PER_CPU'
     115 |         DEFINE_PER_CPU_SECTION(type, name, "")
         |         ^
   include/linux/percpu-defs.h:93:26: note: expanded from macro 'DEFINE_PER_CPU_SECTION'
      93 |         __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;                   \
         |                                 ^
   <scratch space>:67:1: note: expanded from here
      67 | __pcpu_unique__alloc_tag_cntr
         | ^
   include/linux/mm.h:2862:22: note: previous declaration is here
   include/linux/gfp.h:301:28: note: expanded from macro 'alloc_pages'
     301 | #define alloc_pages(...)                        alloc_hooks(alloc_pages_noprof(__VA_ARGS__))
         |                                                 ^
   include/linux/alloc_tag.h:155:2: note: expanded from macro 'alloc_hooks'
     155 |         DEFINE_ALLOC_TAG(_alloc_tag);                                   \
         |         ^
   include/linux/alloc_tag.h:47:9: note: expanded from macro 'DEFINE_ALLOC_TAG'
      47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _alloc_tag_cntr);      \
         |                ^
   include/linux/percpu-defs.h:115:2: note: expanded from macro 'DEFINE_PER_CPU'
     115 |         DEFINE_PER_CPU_SECTION(type, name, "")
         |         ^
   include/linux/percpu-defs.h:92:33: note: expanded from macro 'DEFINE_PER_CPU_SECTION'
      92 |         extern __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;            \
         |                                        ^
   <scratch space>:66:1: note: expanded from here
      66 | __pcpu_unique__alloc_tag_cntr
         | ^
   In file included from drivers/input/rmi4/rmi_spi.c:8:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
>> include/linux/mm.h:2862:22: error: 'section' attribute only applies to functions, global variables, Objective-C methods, and Objective-C properties
    2862 |         struct page *page = alloc_pages(gfp | __GFP_COMP, order);
         |                             ^
   include/linux/gfp.h:301:28: note: expanded from macro 'alloc_pages'
     301 | #define alloc_pages(...)                        alloc_hooks(alloc_pages_noprof(__VA_ARGS__))
         |                                                 ^
   include/linux/alloc_tag.h:155:2: note: expanded from macro 'alloc_hooks'
     155 |         DEFINE_ALLOC_TAG(_alloc_tag);                                   \
         |         ^
   include/linux/alloc_tag.h:47:9: note: expanded from macro 'DEFINE_ALLOC_TAG'
      47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _alloc_tag_cntr);      \
         |                ^
   include/linux/percpu-defs.h:115:2: note: expanded from macro 'DEFINE_PER_CPU'
     115 |         DEFINE_PER_CPU_SECTION(type, name, "")
         |         ^
   include/linux/percpu-defs.h:95:2: note: expanded from macro 'DEFINE_PER_CPU_SECTION'
      95 |         __PCPU_ATTRS(sec) __weak __typeof__(type) name
         |         ^
   include/linux/percpu-defs.h:50:26: note: expanded from macro '__PCPU_ATTRS'
      50 |         __percpu __attribute__((section(PER_CPU_BASE_SECTION sec)))     \
         |                                 ^
   In file included from drivers/input/rmi4/rmi_spi.c:8:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
>> include/linux/mm.h:2862:22: error: non-extern declaration of '_alloc_tag_cntr' follows extern declaration
   include/linux/gfp.h:301:28: note: expanded from macro 'alloc_pages'
     301 | #define alloc_pages(...)                        alloc_hooks(alloc_pages_noprof(__VA_ARGS__))
         |                                                 ^
   include/linux/alloc_tag.h:155:2: note: expanded from macro 'alloc_hooks'
     155 |         DEFINE_ALLOC_TAG(_alloc_tag);                                   \
         |         ^
   include/linux/alloc_tag.h:47:51: note: expanded from macro 'DEFINE_ALLOC_TAG'
      47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _alloc_tag_cntr);      \
         |                                                          ^
   include/linux/mm.h:2862:22: note: previous declaration is here
   include/linux/gfp.h:301:28: note: expanded from macro 'alloc_pages'
     301 | #define alloc_pages(...)                        alloc_hooks(alloc_pages_noprof(__VA_ARGS__))
         |                                                 ^
   include/linux/alloc_tag.h:155:2: note: expanded from macro 'alloc_hooks'
     155 |         DEFINE_ALLOC_TAG(_alloc_tag);                                   \
         |         ^
   include/linux/alloc_tag.h:47:51: note: expanded from macro 'DEFINE_ALLOC_TAG'
      47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _alloc_tag_cntr);      \
         |                                                          ^
   In file included from drivers/input/rmi4/rmi_spi.c:8:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
>> include/linux/mm.h:2862:22: error: weak declaration cannot have internal linkage
    2862 |         struct page *page = alloc_pages(gfp | __GFP_COMP, order);
         |                             ^
   include/linux/gfp.h:301:28: note: expanded from macro 'alloc_pages'
     301 | #define alloc_pages(...)                        alloc_hooks(alloc_pages_noprof(__VA_ARGS__))
         |                                                 ^
   include/linux/alloc_tag.h:155:2: note: expanded from macro 'alloc_hooks'
     155 |         DEFINE_ALLOC_TAG(_alloc_tag);                                   \
         |         ^
   include/linux/alloc_tag.h:47:9: note: expanded from macro 'DEFINE_ALLOC_TAG'
      47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _alloc_tag_cntr);      \
         |                ^
   include/linux/percpu-defs.h:115:2: note: expanded from macro 'DEFINE_PER_CPU'
     115 |         DEFINE_PER_CPU_SECTION(type, name, "")
         |         ^
   include/linux/percpu-defs.h:95:20: note: expanded from macro 'DEFINE_PER_CPU_SECTION'
      95 |         __PCPU_ATTRS(sec) __weak __typeof__(type) name
         |                           ^
   include/linux/compiler_attributes.h:403:56: note: expanded from macro '__weak'
     403 | #define __weak                          __attribute__((__weak__))
         |                                                        ^
   In file included from drivers/input/rmi4/rmi_spi.c:9:
   In file included from include/linux/rmi.h:13:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/input/rmi4/rmi_spi.c:9:
   In file included from include/linux/rmi.h:13:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/input/rmi4/rmi_spi.c:9:
   In file included from include/linux/rmi.h:13:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   74 warnings and 11 errors generated.
..


vim +43 include/linux/alloc_tag.h

d08b311b6d4946 Suren Baghdasaryan 2024-03-21  37  
d08b311b6d4946 Suren Baghdasaryan 2024-03-21  38  #ifdef ARCH_NEEDS_WEAK_PER_CPU
d08b311b6d4946 Suren Baghdasaryan 2024-03-21  39  /*
d08b311b6d4946 Suren Baghdasaryan 2024-03-21  40   * When percpu variables are required to be defined as weak, static percpu
d08b311b6d4946 Suren Baghdasaryan 2024-03-21  41   * variables can't be used inside a function (see comments for DECLARE_PER_CPU_SECTION).
d08b311b6d4946 Suren Baghdasaryan 2024-03-21  42   */
d08b311b6d4946 Suren Baghdasaryan 2024-03-21 @43  #error "Memory allocation profiling is incompatible with ARCH_NEEDS_WEAK_PER_CPU"
d08b311b6d4946 Suren Baghdasaryan 2024-03-21  44  #endif
d08b311b6d4946 Suren Baghdasaryan 2024-03-21  45  

:::::: The code at line 43 was first introduced by commit
:::::: d08b311b6d4946b22d966201da4008a197736e3d lib: add allocation tagging support for memory allocation profiling

:::::: TO: Suren Baghdasaryan <surenb@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
