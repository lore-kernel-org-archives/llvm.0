Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2491991D4;
	Tue, 16 Jul 2024 12:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721133296; cv=none; b=kCMDL+g3cxE3bC1OztyEaPN2703y3wN9Kn2q+Qh5Galu06IURfm69d6dKlqjmeQPiDpQxuUFC5jbQxt88e9AP8pgx5qHusPNg0mwsOCi74SJ3WUWksXJvjpxpNZRh2f6zLvlVqt9DRQEQjL6Itpuhgw3ckpLNqA6yXX+Tpdl35U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721133296; c=relaxed/simple;
	bh=QjICDvd/gRvEQAtzF4IOq+WI7BM4QKyPL6iQyarpuQw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jD3FTcTBPHoEcY/+jxlUHc+kOdvDBRSHjtBORzxgmKt0FcYtCLqo6/+fXmCdOGKsvtFmruzGMG+m+fxNqkX8GkiCaZhCwhYkXDhcrGZmRMajfLnWyxRc69+hi2k4apan1U4CKVBW4vhrUBSLipSIt1c8Y1ezD8AEMjkPzWQ7nsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ij66Vnad; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ij66Vnad"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721133295; x=1752669295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QjICDvd/gRvEQAtzF4IOq+WI7BM4QKyPL6iQyarpuQw=;
  b=Ij66Vnadh+b66SKqsxmP5S1Tum5tCMZv/ZemTeDJZ5z+LbQgKB8u/HYE
   OWYKgsyej/HAkgAf6umsRhy9U5mtgT7a8QT/IPTGJGtEpdeyXeQaoEBqX
   APNXLUHM+qtyDP3pytwl4VnZfqj+KdBxjaPm1lamTfC8X2SLwQ3fAY0+X
   paPpfvNHn0Y8fN0j9GYXThPBH7cFsCHkjEf0E9NdzAv1fG8YAMn+vLfMM
   niXhuN1rnO7vYfGUYRhA0/SFl19FBIvawh54SguM7LxIdvkMh34Jpp2GV
   yCsgqKlzE2Mk+66ks/Fxoxp38p0Myaq+Kj/m89xt7ia967dydo1KH2bcI
   Q==;
X-CSE-ConnectionGUID: kBJzKZevROuNtQ/dYsZY3Q==
X-CSE-MsgGUID: AmD9pYsFQYyfS5PZhwjwMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="36003159"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="36003159"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 05:34:54 -0700
X-CSE-ConnectionGUID: 5yU9PaNRQiijOuIVeZmK1A==
X-CSE-MsgGUID: rfIgL77yTu+DkrsoaU5Tzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="73220563"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Jul 2024 05:34:52 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sThOM-000fCn-1K;
	Tue, 16 Jul 2024 12:34:50 +0000
Date: Tue, 16 Jul 2024 20:34:12 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diff 8/8] include/linux/page-flags.h:868:2: error:
 expected ')'
Message-ID: <202407162038.HFakGUjj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   bc3cdfe89249cdc982760e0fb48820b399935d43
commit: bc3cdfe89249cdc982760e0fb48820b399935d43 [8/8] working with klp-test.patch
config: i386-buildonly-randconfig-004-20240716 (https://download.01.org/0day-ci/archive/20240716/202407162038.HFakGUjj-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240716/202407162038.HFakGUjj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407162038.HFakGUjj-lkp@intel.com/

All errors (new ones prefixed by >>):

     270 |         WARN_ON_ONCE(in_nmi());
         |         ^
   include/asm-generic/bug.h:113:3: note: expanded from macro 'WARN_ON_ONCE'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^
   arch/x86/include/asm/bug.h:85:2: note: expanded from macro '__WARN_FLAGS'
      85 |         _BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);            \
         |         ^
   arch/x86/include/asm/bug.h:30:8: note: expanded from macro '_BUG_FLAGS'
      30 |                      FAKE_SYMBOL(__bug_table_, 12)                      \
         |                      ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:49:
   In file included from arch/x86/include/asm/uprobes.h:13:
   In file included from include/linux/notifier.h:16:
   include/linux/srcu.h:285:2: error: expected ')'
     285 |         WARN_ON_ONCE(idx & ~0x1);
         |         ^
   include/asm-generic/bug.h:113:3: note: expanded from macro 'WARN_ON_ONCE'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^
   arch/x86/include/asm/bug.h:85:2: note: expanded from macro '__WARN_FLAGS'
      85 |         _BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);            \
         |         ^
   arch/x86/include/asm/bug.h:30:8: note: expanded from macro '_BUG_FLAGS'
      30 |                      FAKE_SYMBOL(__bug_table_, 12)                      \
         |                      ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:49:
   In file included from arch/x86/include/asm/uprobes.h:13:
   In file included from include/linux/notifier.h:16:
   include/linux/srcu.h:301:2: error: expected ')'
     301 |         WARN_ON_ONCE(idx & ~0x1);
         |         ^
   include/asm-generic/bug.h:113:3: note: expanded from macro 'WARN_ON_ONCE'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^
   arch/x86/include/asm/bug.h:85:2: note: expanded from macro '__WARN_FLAGS'
      85 |         _BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);            \
         |         ^
   arch/x86/include/asm/bug.h:30:8: note: expanded from macro '_BUG_FLAGS'
      30 |                      FAKE_SYMBOL(__bug_table_, 12)                      \
         |                      ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:49:
   In file included from arch/x86/include/asm/uprobes.h:13:
   In file included from include/linux/notifier.h:16:
   include/linux/srcu.h:326:2: error: expected ')'
     326 |         WARN_ON_ONCE(idx & ~0x1);
         |         ^
   include/asm-generic/bug.h:113:3: note: expanded from macro 'WARN_ON_ONCE'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^
   arch/x86/include/asm/bug.h:85:2: note: expanded from macro '__WARN_FLAGS'
      85 |         _BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);            \
         |         ^
   arch/x86/include/asm/bug.h:30:8: note: expanded from macro '_BUG_FLAGS'
      30 |                      FAKE_SYMBOL(__bug_table_, 12)                      \
         |                      ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:49:
   In file included from arch/x86/include/asm/uprobes.h:13:
   In file included from include/linux/notifier.h:16:
   include/linux/srcu.h:327:2: error: expected ')'
     327 |         WARN_ON_ONCE(in_nmi());
         |         ^
   include/asm-generic/bug.h:113:3: note: expanded from macro 'WARN_ON_ONCE'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^
   arch/x86/include/asm/bug.h:85:2: note: expanded from macro '__WARN_FLAGS'
      85 |         _BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);            \
         |         ^
   arch/x86/include/asm/bug.h:30:8: note: expanded from macro '_BUG_FLAGS'
      30 |                      FAKE_SYMBOL(__bug_table_, 12)                      \
         |                      ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:23:
>> include/linux/page-flags.h:868:2: error: expected ')'
     868 |         BUG_ON(!PageHead(page));
         |         ^
   include/asm-generic/bug.h:71:57: note: expanded from macro 'BUG_ON'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^
   arch/x86/include/asm/bug.h:71:2: note: expanded from macro 'BUG'
      71 |         _BUG_FLAGS(ASM_UD2, 0, "");                             \
         |         ^
   arch/x86/include/asm/bug.h:30:8: note: expanded from macro '_BUG_FLAGS'
      30 |                      FAKE_SYMBOL(__bug_table_, 12)                      \
         |                      ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:1428:
   include/linux/memory_hotplug.h:58:2: error: expected ')'
      58 |         BUG();
         |         ^
   arch/x86/include/asm/bug.h:71:2: note: expanded from macro 'BUG'
      71 |         _BUG_FLAGS(ASM_UD2, 0, "");                             \
         |         ^
   arch/x86/include/asm/bug.h:30:8: note: expanded from macro '_BUG_FLAGS'
      30 |                      FAKE_SYMBOL(__bug_table_, 12)                      \
         |                      ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   include/linux/gfp.h:323:2: error: expected ')'
     323 |         WARN_ON_ONCE(!is_power_of_2(align));
         |         ^
   include/asm-generic/bug.h:113:3: note: expanded from macro 'WARN_ON_ONCE'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^
   arch/x86/include/asm/bug.h:85:2: note: expanded from macro '__WARN_FLAGS'
      85 |         _BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);            \
         |         ^
   arch/x86/include/asm/bug.h:30:8: note: expanded from macro '_BUG_FLAGS'
      30 |                      FAKE_SYMBOL(__bug_table_, 12)                      \
         |                      ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
   make[3]: *** [scripts/Makefile.build:117: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=174437929
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1203: prepare0] Error 2 shuffle=174437929
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2 shuffle=174437929
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2 shuffle=174437929
   make: Target 'prepare' not remade because of errors.


vim +868 include/linux/page-flags.h

6d7779538f7659 Christoph Lameter       2007-05-06  864  
4e6af67e970a2a Andrea Arcangeli        2011-01-13  865  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
4e6af67e970a2a Andrea Arcangeli        2011-01-13  866  static inline void ClearPageCompound(struct page *page)
4e6af67e970a2a Andrea Arcangeli        2011-01-13  867  {
1d798ca3f16437 Kirill A. Shutemov      2015-11-06 @868  	BUG_ON(!PageHead(page));
1d798ca3f16437 Kirill A. Shutemov      2015-11-06  869  	ClearPageHead(page);
4e6af67e970a2a Andrea Arcangeli        2011-01-13  870  }
de53c05f2ae3d4 Matthew Wilcox (Oracle  2023-08-16  871) PAGEFLAG(LargeRmappable, large_rmappable, PF_SECOND)
de53c05f2ae3d4 Matthew Wilcox (Oracle  2023-08-16  872) #else
de53c05f2ae3d4 Matthew Wilcox (Oracle  2023-08-16  873) TESTPAGEFLAG_FALSE(LargeRmappable, large_rmappable)
4e6af67e970a2a Andrea Arcangeli        2011-01-13  874  #endif
4e6af67e970a2a Andrea Arcangeli        2011-01-13  875  

:::::: The code at line 868 was first introduced by commit
:::::: 1d798ca3f16437c71ff63e36597ff07f9c12e4d6 mm: make compound_head() robust

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
