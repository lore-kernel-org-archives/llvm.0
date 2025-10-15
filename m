Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72592308F1E;
	Wed, 15 Oct 2025 20:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760560668; cv=none; b=OrEZvrfsqPnD75KJfOoYgb4t8sXQ2gBGty1tuKK5HUucApkolL4TvS2l6benuZeO/HOph9NF6ab8ApvOvzG8Dgjy4k51fECRiGLcoxmDTWP9HSHytH5wXJjvRxqz5kZo/34kcv8PHfBfhQ9wwPitLungmZaEFotC+WMloWqDCSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760560668; c=relaxed/simple;
	bh=bYToAaFq1pt50F45ZB950pPAZFg8vQn/7H+rEcbwyLk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CCuEEpMQfRlUgXETQpRsthDfAy+TvyStMhHLNnDOOnLGKBxO+iW5DbpFFj8YnSQpXLx8d72DIFvOY6/w5LV9+7j6eazRFK8TxV/nwSO8FUK+DjDqya8ru5+Me1SbJFcAnZNO3mFtQV0fPDKRBD5cKSpCCrQx+n7pwE6W1fFN2gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bbzHIIrv; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bbzHIIrv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760560667; x=1792096667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bYToAaFq1pt50F45ZB950pPAZFg8vQn/7H+rEcbwyLk=;
  b=bbzHIIrvKGZia6RrD77tZvYZ1m0qeRARQrQcTLHPgpbsYBbvDMR+p2pY
   Tc6ww7QbBtdfSpRlSl2j7aGfx/Dx6KywKXKZciMLB9ojqzDWT7/pYiAYM
   vD6XToAcHH2K2WgOJp13awdZq87f3cXAKm3f8lIX8zdLta0vbwhkn+bYw
   eUHkyy7HjnCDNMGSFVvbnR6qY33RGu451y1sfIyxWPhQTsCul8NCiw/KM
   mnq+afeCRDO2v4LPX0IY3UhSx2Yx0s0MaebEwpb+igGkBr6oQnXr1SrGt
   cUSO6at7hdpVrgMzUJRzwOdq+/CAhfVHAgNjclqEON+ZA1JX2MM2Ty7wc
   Q==;
X-CSE-ConnectionGUID: DVfbVqwgS324vGs0UmgCuw==
X-CSE-MsgGUID: mjKzP0LfRBKTnSi5NwvJWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62788981"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="62788981"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 13:37:46 -0700
X-CSE-ConnectionGUID: ER339t/6STa4Od8pSeAubg==
X-CSE-MsgGUID: K6IJbDq5Rxy6SyoExIHH8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="182255926"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 15 Oct 2025 13:37:44 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v98Fi-0004DB-0r;
	Wed, 15 Oct 2025 20:37:42 +0000
Date: Thu, 16 Oct 2025 04:37:19 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/cid 47/64] include/linux/mm_types.h:1223:22: error:
 no member named 'lru_gen' in 'struct mm_struct'
Message-ID: <202510160434.EYObBtM9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/cid
head:   e196d67a03daa4beb27afc2961845664ac3ef3d5
commit: ca9070e3656a97ecc5cfbfd1dd101d98ddef2d36 [47/64] sched/mmcid: Use proper data structures
config: arm64-randconfig-001-20251016 (https://download.01.org/0day-ci/archive/20251016/202510160434.EYObBtM9-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510160434.EYObBtM9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510160434.EYObBtM9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/resource_ext.h:11:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   include/linux/mm_types.h:981:20: error: field has incomplete type 'struct mm_mm_cid'
     981 |                 struct mm_mm_cid mm_cid;
         |                                  ^
   include/linux/mm_types.h:981:10: note: forward declaration of 'struct mm_mm_cid'
     981 |                 struct mm_mm_cid mm_cid;
         |                        ^
>> include/linux/mm_types.h:1223:22: error: no member named 'lru_gen' in 'struct mm_struct'
    1223 |         INIT_LIST_HEAD(&mm->lru_gen.list);
         |                         ~~  ^
   include/linux/mm_types.h:1224:6: error: no member named 'lru_gen' in 'struct mm_struct'
    1224 |         mm->lru_gen.bitmap = 0;
         |         ~~  ^
   include/linux/mm_types.h:1237:17: error: no member named 'lru_gen' in 'struct mm_struct'
    1237 |         WRITE_ONCE(mm->lru_gen.bitmap, -1);
         |                    ~~  ^
   include/linux/mm_types.h:1237:17: error: no member named 'lru_gen' in 'struct mm_struct'
    1237 |         WRITE_ONCE(mm->lru_gen.bitmap, -1);
         |                    ~~  ^
   include/linux/mm_types.h:1237:17: error: no member named 'lru_gen' in 'struct mm_struct'
    1237 |         WRITE_ONCE(mm->lru_gen.bitmap, -1);
         |                    ~~  ^
   include/linux/mm_types.h:1237:17: error: no member named 'lru_gen' in 'struct mm_struct'
    1237 |         WRITE_ONCE(mm->lru_gen.bitmap, -1);
         |                    ~~  ^
   include/linux/mm_types.h:1237:17: error: no member named 'lru_gen' in 'struct mm_struct'
    1237 |         WRITE_ONCE(mm->lru_gen.bitmap, -1);
         |                    ~~  ^
   include/linux/mm_types.h:1237:17: error: no member named 'lru_gen' in 'struct mm_struct'
    1237 |         WRITE_ONCE(mm->lru_gen.bitmap, -1);
         |                    ~~  ^
   include/linux/mm_types.h:1237:17: error: no member named 'lru_gen' in 'struct mm_struct'
    1237 |         WRITE_ONCE(mm->lru_gen.bitmap, -1);
         |                    ~~  ^
   include/linux/mm_types.h:1281:27: error: no member named 'mm_mt' in 'struct mm_struct'
    1281 |         mas_init(&vmi->mas, &mm->mm_mt, addr);
         |                              ~~  ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:16:
   In file included from include/linux/energy_model.h:7:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:21:
   In file included from include/linux/xarray.h:21:
   In file included from include/linux/sched/mm.h:11:
   include/linux/sched/coredump.h:25:28: error: no member named 'flags' in 'struct mm_struct'
      25 |         return __get_dumpable(mm->flags);
         |                               ~~  ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:16:
   In file included from include/linux/energy_model.h:7:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:21:
   In file included from include/linux/xarray.h:21:
   include/linux/sched/mm.h:37:18: error: no member named 'mm_count' in 'struct mm_struct'
      37 |         atomic_inc(&mm->mm_count);
         |                     ~~  ^
   include/linux/sched/mm.h:54:40: error: no member named 'mm_count' in 'struct mm_struct'
      54 |         if (unlikely(atomic_dec_and_test(&mm->mm_count)))
         |                                           ~~  ^
   include/linux/sched/mm.h:133:18: error: no member named 'mm_users' in 'struct mm_struct'
     133 |         atomic_inc(&mm->mm_users);
         |                     ~~  ^
   include/linux/sched/mm.h:138:34: error: no member named 'mm_users' in 'struct mm_struct'
     138 |         return atomic_inc_not_zero(&mm->mm_users);
         |                                     ~~  ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
--
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:198:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     198 |         case 2: set->sig[1] = 0;
         |                 ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:211:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     211 |         case 2: set->sig[1] = -1;
         |                 ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:242:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     242 |         case 2: set->sig[1] = 0;
         |                 ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:255:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     255 |         case 2: set->sig[1] = -1;
         |                 ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm64/kernel/asm-offsets.c:12:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/arm64/include/asm/hardirq.h:17:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/arm64/include/asm/io.h:12:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/arm64/include/asm/pgtable.h:15:
   In file included from arch/arm64/include/asm/tlbflush.h:16:
   In file included from include/linux/mmu_notifier.h:8:
   include/linux/mmap_lock.h:71:25: error: no member named 'mmap_lock' in 'struct mm_struct'
      71 |         rwsem_assert_held(&mm->mmap_lock);
         |                            ~~  ^
   include/linux/mmap_lock.h:76:31: error: no member named 'mmap_lock' in 'struct mm_struct'
      76 |         rwsem_assert_held_write(&mm->mmap_lock);
         |                                  ~~  ^
>> include/linux/mmap_lock.h:83:21: error: no member named 'mm_lock_seq' in 'struct mm_struct'
      83 |         seqcount_init(&mm->mm_lock_seq);
         |                        ~~  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   49 warnings and 20 errors generated.
   make[3]: *** [scripts/Makefile.build:182: arch/arm64/kernel/asm-offsets.s] Error 1 shuffle=3959790598
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1282: prepare0] Error 2 shuffle=3959790598
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3959790598
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3959790598
   make: Target 'prepare' not remade because of errors.


vim +1223 include/linux/mm_types.h

bd74fdaea146029 Yu Zhao 2022-09-18  1220  
bd74fdaea146029 Yu Zhao 2022-09-18  1221  static inline void lru_gen_init_mm(struct mm_struct *mm)
bd74fdaea146029 Yu Zhao 2022-09-18  1222  {
bd74fdaea146029 Yu Zhao 2022-09-18 @1223  	INIT_LIST_HEAD(&mm->lru_gen.list);
bd74fdaea146029 Yu Zhao 2022-09-18  1224  	mm->lru_gen.bitmap = 0;
bd74fdaea146029 Yu Zhao 2022-09-18  1225  #ifdef CONFIG_MEMCG
bd74fdaea146029 Yu Zhao 2022-09-18  1226  	mm->lru_gen.memcg = NULL;
bd74fdaea146029 Yu Zhao 2022-09-18  1227  #endif
bd74fdaea146029 Yu Zhao 2022-09-18  1228  }
bd74fdaea146029 Yu Zhao 2022-09-18  1229  

:::::: The code at line 1223 was first introduced by commit
:::::: bd74fdaea146029e4fa12c6de89adbe0779348a9 mm: multi-gen LRU: support page table walks

:::::: TO: Yu Zhao <yuzhao@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
