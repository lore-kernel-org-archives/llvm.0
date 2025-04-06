Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9368819D88B;
	Sun,  6 Apr 2025 09:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743930961; cv=none; b=fSt1L+enl2vZisTcJKqLTL9xvc2aZGQmhqhMVvIrm2WkVqzFQWRWonCj2RXkgimaLAGC+CrSAtbQEELWhtU9j+OnsFHmn8qBGanfIhsu8fsIYA3apr9d51/ZmCUvtJXP1TuBt9T5xX9wt3Ejd4GvcV7KKvJ/8S8jz2IjNQ70iTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743930961; c=relaxed/simple;
	bh=IwcYTGp5qiihasW5cahapIyYe4LU1gH/IIvzpFnzq90=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SsAm98k60bZeBt2PsF4SGuWbRruYqwYlLrtbk3qlqfFkGDAb4NMjb+lNJUN5cGJAPkUh+6oleTVBsO3LgB76iXHY29+1Y3fpE1/N7vqEodeR1+HkFwpDuFV1Wieh0c/iBZoksTDvkVe9ECYdf+CWDn44FNkoNDOC1mxZdSENhEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iPuiVG9f; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iPuiVG9f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743930959; x=1775466959;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IwcYTGp5qiihasW5cahapIyYe4LU1gH/IIvzpFnzq90=;
  b=iPuiVG9fny2BS9eQk1+jgFxlfpB9MuCZyXQqq/+8I7eZ/z1zK+VCoILt
   hvstQHhnnXsxI1ncFmXD1yKODAPQftu9qiJbSn9lnBNPCJbeLpdq4OAd+
   WaSdQJklfLOMsDGqzyGOSMcE/zDzDVO0tlfQDgKcVrACgj0TRQ+kUEW1s
   w1vdqvFlxTndbpDTprdWx4In16AlA3vPeCJ86NaewppOaIak+rWrpVptc
   8ZipaRr7P73m+CMfwxA2/QJNGdzcfleN6+hf1vylLhqM+H6I27uGzKOUi
   0ZvJFUUP13RYYnPsYnFKFd2jnWr45zQyhFzZF17GenZ62T1SjjJ1bOpsM
   w==;
X-CSE-ConnectionGUID: W8Kb+t3KReCRvZw4CVzrbg==
X-CSE-MsgGUID: c3zYMRunQV6lomUIxEB6vA==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="62724330"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="62724330"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 02:15:55 -0700
X-CSE-ConnectionGUID: +WndEalIQmGRozi9GQs9WQ==
X-CSE-MsgGUID: TiFCqRYbSEq7DxLDoTXZjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="128200078"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Apr 2025 02:15:53 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1M6Z-0002WH-1V;
	Sun, 06 Apr 2025 09:15:51 +0000
Date: Sun, 6 Apr 2025 17:14:54 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-werror 8/8] include/linux/ktime.h:134:2: error:
 use of undeclared identifier '_BUG_FLAGS'
Message-ID: <202504061746.iVmLYKTY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-werror
head:   e8a76adeb37a54222d935bddfb4105b5cdd3b3c9
commit: e8a76adeb37a54222d935bddfb4105b5cdd3b3c9 [8/8] todo
config: i386-buildonly-randconfig-001-20250406 (https://download.01.org/0day-ci/archive/20250406/202504061746.iVmLYKTY-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250406/202504061746.iVmLYKTY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504061746.iVmLYKTY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:19:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:18:
   In file included from include/linux/timer.h:6:
>> include/linux/ktime.h:134:2: error: too many arguments provided to function-like macro invocation
     134 |         BUG_ON(div < 0);
         |         ^
   include/asm-generic/bug.h:166:57: note: expanded from macro 'BUG_ON'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^
   arch/x86/include/asm/bug.h:91:32: note: expanded from macro 'BUG'
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |                                       ^
   arch/x86/include/asm/bug.h:83:9: note: macro '_BUG_FLAGS' defined here
      83 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:19:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:18:
   In file included from include/linux/timer.h:6:
>> include/linux/ktime.h:134:2: error: use of undeclared identifier '_BUG_FLAGS'
     134 |         BUG_ON(div < 0);
         |         ^
   include/asm-generic/bug.h:166:57: note: expanded from macro 'BUG_ON'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^
   arch/x86/include/asm/bug.h:91:2: note: expanded from macro 'BUG'
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:19:
>> include/linux/slab.h:717:3: error: too many arguments provided to function-like macro invocation
     717 |                 BUG();
         |                 ^
   arch/x86/include/asm/bug.h:91:32: note: expanded from macro 'BUG'
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |                                       ^
   arch/x86/include/asm/bug.h:83:9: note: macro '_BUG_FLAGS' defined here
      83 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:19:
>> include/linux/slab.h:717:3: error: use of undeclared identifier '_BUG_FLAGS'
     717 |                 BUG();
         |                 ^
   arch/x86/include/asm/bug.h:91:2: note: expanded from macro 'BUG'
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:95:
   In file included from arch/x86/include/asm/desc.h:8:
   In file included from arch/x86/include/asm/fixmap.h:191:
>> include/asm-generic/fixmap.h:38:2: error: too many arguments provided to function-like macro invocation
      38 |         BUG_ON(vaddr >= FIXADDR_TOP || vaddr < FIXADDR_START);
         |         ^
   include/asm-generic/bug.h:166:57: note: expanded from macro 'BUG_ON'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^
   arch/x86/include/asm/bug.h:91:32: note: expanded from macro 'BUG'
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |                                       ^
   arch/x86/include/asm/bug.h:83:9: note: macro '_BUG_FLAGS' defined here
      83 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:95:
   In file included from arch/x86/include/asm/desc.h:8:
   In file included from arch/x86/include/asm/fixmap.h:191:
>> include/asm-generic/fixmap.h:38:2: error: use of undeclared identifier '_BUG_FLAGS'
      38 |         BUG_ON(vaddr >= FIXADDR_TOP || vaddr < FIXADDR_START);
         |         ^
   include/asm-generic/bug.h:166:57: note: expanded from macro 'BUG_ON'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^
   arch/x86/include/asm/bug.h:91:2: note: expanded from macro 'BUG'
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:95:
>> arch/x86/include/asm/desc.h:408:2: error: too many arguments provided to function-like macro invocation
     408 |         BUG_ON(n > 0xFF);
         |         ^
   include/asm-generic/bug.h:166:57: note: expanded from macro 'BUG_ON'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^
   arch/x86/include/asm/bug.h:91:32: note: expanded from macro 'BUG'
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |                                       ^
   arch/x86/include/asm/bug.h:83:9: note: macro '_BUG_FLAGS' defined here
      83 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:95:
>> arch/x86/include/asm/desc.h:408:2: error: use of undeclared identifier '_BUG_FLAGS'
     408 |         BUG_ON(n > 0xFF);
         |         ^
   include/asm-generic/bug.h:166:57: note: expanded from macro 'BUG_ON'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^
   arch/x86/include/asm/bug.h:91:2: note: expanded from macro 'BUG'
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:21:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:21:
>> include/linux/xarray.h:1676:2: error: too many arguments provided to function-like macro invocation
    1676 |         BUG_ON(order > 0);
         |         ^
   include/asm-generic/bug.h:166:57: note: expanded from macro 'BUG_ON'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^
   arch/x86/include/asm/bug.h:91:32: note: expanded from macro 'BUG'
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |                                       ^
   arch/x86/include/asm/bug.h:83:9: note: macro '_BUG_FLAGS' defined here
      83 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:21:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:21:
>> include/linux/xarray.h:1676:2: error: use of undeclared identifier '_BUG_FLAGS'
    1676 |         BUG_ON(order > 0);
         |         ^
   include/asm-generic/bug.h:166:57: note: expanded from macro 'BUG_ON'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^
   arch/x86/include/asm/bug.h:91:2: note: expanded from macro 'BUG'
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:9:
   In file included from include/linux/dcache.h:9:
   In file included from include/linux/rculist_bl.h:8:
   In file included from include/linux/list_bl.h:6:
>> include/linux/bit_spinlock.h:60:2: error: too many arguments provided to function-like macro invocation
      60 |         BUG_ON(!test_bit(bitnum, addr));
         |         ^
   include/asm-generic/bug.h:166:57: note: expanded from macro 'BUG_ON'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^
   arch/x86/include/asm/bug.h:91:32: note: expanded from macro 'BUG'
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |                                       ^
   arch/x86/include/asm/bug.h:83:9: note: macro '_BUG_FLAGS' defined here
      83 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:9:
   In file included from include/linux/dcache.h:9:
   In file included from include/linux/rculist_bl.h:8:
   In file included from include/linux/list_bl.h:6:
>> include/linux/bit_spinlock.h:60:2: error: use of undeclared identifier '_BUG_FLAGS'
      60 |         BUG_ON(!test_bit(bitnum, addr));
         |         ^
   include/asm-generic/bug.h:166:57: note: expanded from macro 'BUG_ON'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^
   arch/x86/include/asm/bug.h:91:2: note: expanded from macro 'BUG'
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:9:
   In file included from include/linux/dcache.h:9:
   In file included from include/linux/rculist_bl.h:8:
   In file included from include/linux/list_bl.h:6:
   include/linux/bit_spinlock.h:77:2: error: too many arguments provided to function-like macro invocation
      77 |         BUG_ON(!test_bit(bitnum, addr));
         |         ^
   include/asm-generic/bug.h:166:57: note: expanded from macro 'BUG_ON'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^
   arch/x86/include/asm/bug.h:91:32: note: expanded from macro 'BUG'
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |                                       ^
   arch/x86/include/asm/bug.h:83:9: note: macro '_BUG_FLAGS' defined here
      83 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:9:
   In file included from include/linux/dcache.h:9:
   In file included from include/linux/rculist_bl.h:8:
   In file included from include/linux/list_bl.h:6:
   include/linux/bit_spinlock.h:77:2: error: use of undeclared identifier '_BUG_FLAGS'
      77 |         BUG_ON(!test_bit(bitnum, addr));
         |         ^
   include/asm-generic/bug.h:166:57: note: expanded from macro 'BUG_ON'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^
   arch/x86/include/asm/bug.h:91:2: note: expanded from macro 'BUG'
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:34:
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
   In file included from include/linux/fs.h:34:
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
   In file included from include/linux/fs.h:34:
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
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
--
   include/linux/signal.h:163:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     163 | _SIG_SET_BINOP(sigandnsets, _sig_andn)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:141:3: note: expanded from macro '_SIG_SET_BINOP'
     141 |                 r->sig[2] = op(a2, b2);                                 \
         |                 ^      ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:174:27: note: expanded from macro '_SIG_SET_OP'
     174 |         case 4: set->sig[3] = op(set->sig[3]);                          \
         |                                  ^        ~
   include/linux/signal.h:186:24: note: expanded from macro '_sig_not'
     186 | #define _sig_not(x)     (~(x))
         |                            ^
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:174:10: note: expanded from macro '_SIG_SET_OP'
     174 |         case 4: set->sig[3] = op(set->sig[3]);                          \
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:175:20: note: expanded from macro '_SIG_SET_OP'
     175 |                 set->sig[2] = op(set->sig[2]);                          \
         |                                  ^        ~
   include/linux/signal.h:186:24: note: expanded from macro '_sig_not'
     186 | #define _sig_not(x)     (~(x))
         |                            ^
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:175:3: note: expanded from macro '_SIG_SET_OP'
     175 |                 set->sig[2] = op(set->sig[2]);                          \
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:12:
   In file included from arch/x86/include/asm/uaccess.h:17:
   In file included from arch/x86/include/asm/tlbflush.h:13:
>> arch/x86/include/asm/smp.h:162:72: error: too many arguments provided to function-like macro invocation
     162 | static inline void __noreturn mwait_play_dead(unsigned int eax_hint) { BUG(); }
         |                                                                        ^
   arch/x86/include/asm/bug.h:91:32: note: expanded from macro 'BUG'
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |                                       ^
   arch/x86/include/asm/bug.h:83:9: note: macro '_BUG_FLAGS' defined here
      83 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:12:
   In file included from arch/x86/include/asm/uaccess.h:17:
   In file included from arch/x86/include/asm/tlbflush.h:13:
>> arch/x86/include/asm/smp.h:162:72: error: use of undeclared identifier '_BUG_FLAGS'
     162 | static inline void __noreturn mwait_play_dead(unsigned int eax_hint) { BUG(); }
         |                                                                        ^
   arch/x86/include/asm/bug.h:91:2: note: expanded from macro 'BUG'
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:304:
>> include/linux/quota.h:114:3: error: too many arguments provided to function-like macro invocation
     114 |                 BUG();
         |                 ^
   arch/x86/include/asm/bug.h:91:32: note: expanded from macro 'BUG'
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |                                       ^
   arch/x86/include/asm/bug.h:83:9: note: macro '_BUG_FLAGS' defined here
      83 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:304:
>> include/linux/quota.h:114:3: error: use of undeclared identifier '_BUG_FLAGS'
     114 |                 BUG();
         |                 ^
   arch/x86/include/asm/bug.h:91:2: note: expanded from macro 'BUG'
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:304:
   include/linux/quota.h:141:3: error: too many arguments provided to function-like macro invocation
     141 |                 BUG();
         |                 ^
   arch/x86/include/asm/bug.h:91:32: note: expanded from macro 'BUG'
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |                                       ^
   arch/x86/include/asm/bug.h:83:9: note: macro '_BUG_FLAGS' defined here
      83 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         |         ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   28 warnings and 20 errors generated.
   make[3]: *** [scripts/Makefile.build:102: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=1516602118
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1272: prepare0] Error 2 shuffle=1516602118
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=1516602118
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=1516602118
   make: Target 'prepare' not remade because of errors.


vim +/_BUG_FLAGS +134 include/linux/ktime.h

67cb9366ff5f99 Daniel Borkmann 2014-06-11  125  
166afb64511eef Thomas Gleixner 2014-07-16  126  #if BITS_PER_LONG < 64
f7bcb70ebae0dc John Stultz     2015-05-08  127  extern s64 __ktime_divns(const ktime_t kt, s64 div);
f7bcb70ebae0dc John Stultz     2015-05-08  128  static inline s64 ktime_divns(const ktime_t kt, s64 div)
8b618628b2bf83 Nicolas Pitre   2014-12-03  129  {
f7bcb70ebae0dc John Stultz     2015-05-08  130  	/*
f7bcb70ebae0dc John Stultz     2015-05-08  131  	 * Negative divisors could cause an inf loop,
f7bcb70ebae0dc John Stultz     2015-05-08  132  	 * so bug out here.
f7bcb70ebae0dc John Stultz     2015-05-08  133  	 */
f7bcb70ebae0dc John Stultz     2015-05-08 @134  	BUG_ON(div < 0);
8b618628b2bf83 Nicolas Pitre   2014-12-03  135  	if (__builtin_constant_p(div) && !(div >> 32)) {
2456e855354415 Thomas Gleixner 2016-12-25  136  		s64 ns = kt;
f7bcb70ebae0dc John Stultz     2015-05-08  137  		u64 tmp = ns < 0 ? -ns : ns;
f7bcb70ebae0dc John Stultz     2015-05-08  138  
f7bcb70ebae0dc John Stultz     2015-05-08  139  		do_div(tmp, div);
f7bcb70ebae0dc John Stultz     2015-05-08  140  		return ns < 0 ? -tmp : tmp;
8b618628b2bf83 Nicolas Pitre   2014-12-03  141  	} else {
8b618628b2bf83 Nicolas Pitre   2014-12-03  142  		return __ktime_divns(kt, div);
8b618628b2bf83 Nicolas Pitre   2014-12-03  143  	}
8b618628b2bf83 Nicolas Pitre   2014-12-03  144  }
166afb64511eef Thomas Gleixner 2014-07-16  145  #else /* BITS_PER_LONG < 64 */
f7bcb70ebae0dc John Stultz     2015-05-08  146  static inline s64 ktime_divns(const ktime_t kt, s64 div)
f7bcb70ebae0dc John Stultz     2015-05-08  147  {
f7bcb70ebae0dc John Stultz     2015-05-08  148  	/*
f7bcb70ebae0dc John Stultz     2015-05-08  149  	 * 32-bit implementation cannot handle negative divisors,
f7bcb70ebae0dc John Stultz     2015-05-08  150  	 * so catch them on 64bit as well.
f7bcb70ebae0dc John Stultz     2015-05-08  151  	 */
f7bcb70ebae0dc John Stultz     2015-05-08  152  	WARN_ON(div < 0);
2456e855354415 Thomas Gleixner 2016-12-25  153  	return kt / div;
f7bcb70ebae0dc John Stultz     2015-05-08  154  }
166afb64511eef Thomas Gleixner 2014-07-16  155  #endif
166afb64511eef Thomas Gleixner 2014-07-16  156  

:::::: The code at line 134 was first introduced by commit
:::::: f7bcb70ebae0dcdb5a2d859b09e4465784d99029 ktime: Fix ktime_divns to do signed division

:::::: TO: John Stultz <john.stultz@linaro.org>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
