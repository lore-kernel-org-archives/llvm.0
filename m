Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65DB1A718;
	Wed, 13 Sep 2023 13:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694613413; x=1726149413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e2zyx5vdS/lyOSitc+nbQw3M6p7JLDxqpMkEW3uz0/c=;
  b=iPhtqkDNoHSan620MRLWUXI1+9yNHEBEUgSqsNz5JgfYXEGJjrILccPd
   GDXJD3kDOWWCp5eQ+fIeMbXto4bg8D5h5DQ84hDFUd/czZDByMT+WXPn/
   X09En2Cl/AgrhkAJqCNV6oOjoeX6UZTvhYjHVe6v/709gyZ/VhI9Vv6FY
   72Q7FsgGNzQPenvEXGZgyJUyj1NXSerOpDZwmr2pcQ41kO6NZl4jyUZ/e
   XEsKDG+PZNjerOlSyHEBJvRzErGbVYghWq1exmBbIVYZ8lkXkBIx0VFgB
   g2DyOU3T6q7vUXMnCU2S6TQGj/Pcohv8XVdPIjfBcfssX+8Sanh2szlbT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="442696789"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="442696789"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 06:56:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="747313787"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="747313787"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 13 Sep 2023 06:56:51 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgQML-00008V-0w;
	Wed, 13 Sep 2023 13:56:49 +0000
Date: Wed, 13 Sep 2023 21:56:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3525/4552] fs/bcachefs/movinggc.c:176:21:
 warning: comparison of distinct pointer types ('typeof (16UL) *' (aka
 'unsigned long *') and 'typeof (buckets_in_flight->nr / 4) *' (aka 'unsigned
 int *'))
Message-ID: <202309132139.VDIFJtS0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e143016b56ecb0fcda5bb6026b0a25fe55274f56
commit: dd49018737d4217648d553f13cc34483215a579b [3525/4552] bcachefs: Rhashtable based buckets_in_flight for copygc
config: powerpc-randconfig-r006-20230912 (https://download.01.org/0day-ci/archive/20230913/202309132139.VDIFJtS0-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309132139.VDIFJtS0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309132139.VDIFJtS0-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   In file included from fs/bcachefs/movinggc.c:8:
   In file included from fs/bcachefs/bcachefs.h:188:
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
   In file included from fs/bcachefs/movinggc.c:8:
   In file included from fs/bcachefs/bcachefs.h:188:
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
   In file included from fs/bcachefs/movinggc.c:8:
   In file included from fs/bcachefs/bcachefs.h:188:
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
   In file included from fs/bcachefs/movinggc.c:11:
   fs/bcachefs/btree_iter.h:257:8: warning: duplicate 'inline' declaration specifier [-Wduplicate-decl-specifier]
     257 | static inline int btree_trans_restart_nounlock(struct btree_trans *trans, int err)
         |        ^
   include/linux/compiler_types.h:215:16: note: expanded from macro 'inline'
     215 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                ^
   In file included from fs/bcachefs/movinggc.c:11:
   fs/bcachefs/btree_iter.h:268:8: warning: duplicate 'inline' declaration specifier [-Wduplicate-decl-specifier]
     268 | static inline int btree_trans_restart(struct btree_trans *trans, int err)
         |        ^
   include/linux/compiler_types.h:215:16: note: expanded from macro 'inline'
     215 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                ^
>> fs/bcachefs/movinggc.c:176:21: warning: comparison of distinct pointer types ('typeof (16UL) *' (aka 'unsigned long *') and 'typeof (buckets_in_flight->nr / 4) *' (aka 'unsigned int *')) [-Wcompare-distinct-pointer-types]
     176 |         size_t nr_to_get = max(16UL, buckets_in_flight->nr / 4);
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:75:19: note: expanded from macro 'max'
      75 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:37:24: note: expanded from macro '__careful_cmp'
      37 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:27:4: note: expanded from macro '__safe_cmp'
      27 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:21:28: note: expanded from macro '__typecheck'
      21 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                    ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   9 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=n] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]


vim +176 fs/bcachefs/movinggc.c

   167	
   168	static int bch2_copygc_get_buckets(struct btree_trans *trans,
   169				struct moving_context *ctxt,
   170				struct buckets_in_flight *buckets_in_flight,
   171				move_buckets *buckets)
   172	{
   173		struct bch_fs *c = trans->c;
   174		struct btree_iter iter;
   175		struct bkey_s_c k;
 > 176		size_t nr_to_get = max(16UL, buckets_in_flight->nr / 4);
   177		size_t saw = 0, in_flight = 0, not_movable = 0, sectors = 0;
   178		int ret;
   179	
   180		move_buckets_wait(trans, ctxt, buckets_in_flight, false);
   181	
   182		ret = bch2_btree_write_buffer_flush(trans);
   183		if (bch2_fs_fatal_err_on(ret, c, "%s: error %s from bch2_btree_write_buffer_flush()",
   184					 __func__, bch2_err_str(ret)))
   185			return ret;
   186	
   187		ret = for_each_btree_key2_upto(trans, iter, BTREE_ID_lru,
   188					  lru_pos(BCH_LRU_FRAGMENTATION_START, 0, 0),
   189					  lru_pos(BCH_LRU_FRAGMENTATION_START, U64_MAX, LRU_TIME_MAX),
   190					  0, k, ({
   191			struct move_bucket b = { .k.bucket = u64_to_bucket(k.k->p.offset) };
   192			int ret = 0;
   193	
   194			saw++;
   195	
   196			if (!bch2_bucket_is_movable(trans, &b, lru_pos_time(k.k->p)))
   197				not_movable++;
   198			else if (bucket_in_flight(buckets_in_flight, b.k))
   199				in_flight++;
   200			else {
   201				ret = darray_push(buckets, b) ?: buckets->nr >= nr_to_get;
   202				if (ret >= 0)
   203					sectors += b.sectors;
   204			}
   205			ret;
   206		}));
   207	
   208		pr_debug("have: %zu (%zu) saw %zu in flight %zu not movable %zu got %zu (%zu)/%zu buckets ret %i",
   209			 buckets_in_flight->nr, buckets_in_flight->sectors,
   210			 saw, in_flight, not_movable, buckets->nr, sectors, nr_to_get, ret);
   211	
   212		return ret < 0 ? ret : 0;
   213	}
   214	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
