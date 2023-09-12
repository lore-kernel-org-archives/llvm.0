Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0D7168C9;
	Tue, 12 Sep 2023 10:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694514446; x=1726050446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qGr4kPRYNLBcmOoU7BZXbzH8qvdnbOtuzecITq1V4t4=;
  b=aMEAudmneoAbHWYrtHWYf2GHFPGLOYkBZD8ChCvU87BkKJwnvVazu2sB
   3hPjZFHaJR746zsLrSJuM38kekBBlZ6DMh/pAz0HuKb/ADyT/JL98J2ZA
   xLjxYTSyrKzknk35zfOblVrPHGD2LgSNk5G6ZUWXPZtSdej+S2rX8qb0o
   86k0YdwJxHn8LapJv549ezrEGqTA+SkRcdp8ui/jLSBUVARouaFRIGgBB
   asFTkkZzIP6yJgLb9H0tQ/x6GZ53awH0TAbSq0mtC+8G9xtW1JLQ/J/hA
   Gof4Ji83QscHJ7WphMVfqRq4wL3lJGmYar/x1GHL2IwUoXEdqCgez/1Vh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="444770770"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="444770770"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 03:27:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="917387011"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="917387011"
Received: from lkp-server02.sh.intel.com (HELO 1e56c5165d33) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 12 Sep 2023 03:27:24 -0700
Received: from kbuild by 1e56c5165d33 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg0c6-0000GB-0m;
	Tue, 12 Sep 2023 10:27:22 +0000
Date: Tue, 12 Sep 2023 18:27:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2179/4552] fs/bcachefs/btree_key_cache.c:701:33:
 warning: format specifies type 'size_t' (aka 'unsigned int') but the
 argument has type 'long'
Message-ID: <202309121832.Vdd6Enjx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3c13c772fc233a10342c8e1605ff0855dfdf0c89
commit: 0b07f462c6742128c9fcd67656fb110f2d39c4e1 [2179/4552] bcachefs: btree key cache locking improvements
config: powerpc-randconfig-r006-20230912 (https://download.01.org/0day-ci/archive/20230912/202309121832.Vdd6Enjx-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309121832.Vdd6Enjx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309121832.Vdd6Enjx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      47 | DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      48 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     669 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:211:1: note: expanded from here
     211 | __do_insl
         | ^
   arch/powerpc/include/asm/io.h:611:56: note: expanded from macro '__do_insl'
     611 | #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
         |                                        ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/bcachefs/btree_key_cache.c:2:
   In file included from fs/bcachefs/bcachefs.h:184:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      49 | DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      50 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     669 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:213:1: note: expanded from here
     213 | __do_outsb
         | ^
   arch/powerpc/include/asm/io.h:612:58: note: expanded from macro '__do_outsb'
     612 | #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/bcachefs/btree_key_cache.c:2:
   In file included from fs/bcachefs/bcachefs.h:184:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      51 | DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      52 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     669 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:215:1: note: expanded from here
     215 | __do_outsw
         | ^
   arch/powerpc/include/asm/io.h:613:58: note: expanded from macro '__do_outsw'
     613 | #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/bcachefs/btree_key_cache.c:2:
   In file included from fs/bcachefs/bcachefs.h:184:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      53 | DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      54 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     669 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:217:1: note: expanded from here
     217 | __do_outsl
         | ^
   arch/powerpc/include/asm/io.h:614:58: note: expanded from macro '__do_outsl'
     614 | #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/bcachefs/btree_key_cache.c:6:
   fs/bcachefs/btree_locking.h:169:35: warning: implicit conversion from enumeration type 'enum btree_node_locked_type' to different enumeration type 'enum six_lock_type' [-Wenum-conversion]
     169 |                         six_lock_increment(&b->c.lock, want);
         |                         ~~~~~~~~~~~~~~~~~~             ^~~~
   fs/bcachefs/btree_locking.h:202:46: warning: implicit conversion from enumeration type 'enum six_lock_type' to different enumeration type 'enum btree_node_locked_type' [-Wenum-conversion]
     202 |                 btree_node_lock_increment(trans, b, level, type) ||
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~                  ^~~~
>> fs/bcachefs/btree_key_cache.c:701:33: warning: format specifies type 'size_t' (aka 'unsigned int') but the argument has type 'long' [-Wformat]
     701 |         pr_buf(out, "nr_keys:\t%zu\n",  atomic_long_read(&c->nr_keys));
         |                                ~~~      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                %ld
   fs/bcachefs/util.h:261:6: note: expanded from macro 'pr_buf'
     261 |                                  __VA_ARGS__);                          \
         |                                  ^~~~~~~~~~~
   fs/bcachefs/btree_key_cache.c:702:34: warning: format specifies type 'size_t' (aka 'unsigned int') but the argument has type 'long' [-Wformat]
     702 |         pr_buf(out, "nr_dirty:\t%zu\n", atomic_long_read(&c->nr_dirty));
         |                                 ~~~     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                 %ld
   fs/bcachefs/util.h:261:6: note: expanded from macro 'pr_buf'
     261 |                                  __VA_ARGS__);                          \
         |                                  ^~~~~~~~~~~
   10 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=n] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]


vim +701 fs/bcachefs/btree_key_cache.c

   697	
   698	void bch2_btree_key_cache_to_text(struct printbuf *out, struct btree_key_cache *c)
   699	{
   700		pr_buf(out, "nr_freed:\t%zu\n",	c->nr_freed);
 > 701		pr_buf(out, "nr_keys:\t%zu\n",	atomic_long_read(&c->nr_keys));
   702		pr_buf(out, "nr_dirty:\t%zu\n",	atomic_long_read(&c->nr_dirty));
   703	}
   704	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
