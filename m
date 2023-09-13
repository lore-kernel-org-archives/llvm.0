Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F33E10F5;
	Wed, 13 Sep 2023 08:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694595068; x=1726131068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CxZlJL4IZV34v0VOIj/Uns0IfPnLy4SJOkl5TJm3F50=;
  b=CERfqWmdeNnn9QpmYyYxlFpm64ZhJfErFXGjbH4uAOJW3DNVS9otuppx
   8uplqcRB7RcAQBJJhMloAhqPiM6Q/ssddlCF4wLXfKxeYETFjizBvyRw+
   1rgYf/Aylital6eEFWxfbOWqEYxKpJTDLcD3b6fiFXUuFh4R3SCU9AQBn
   Qmskikpf/w5B4g2diSm/qwouC0Pj1dJrC6P7a7OHuNjRQZVUJEyXvcBUI
   ZsvR7ieycv0fp/qCGansaKkRvy6dEIM5sfkn7rdY0IpRM5niaqYamMBRc
   c4zTX2WBzl+H1bGRVuJ+qtS5nQjs6qHNlUU3y7NlOupanZU5D/5qx6E8t
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="375934535"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="375934535"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 01:51:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="737415081"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="737415081"
Received: from lkp-server02.sh.intel.com (HELO cf13c67269a2) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 13 Sep 2023 01:51:05 -0700
Received: from kbuild by cf13c67269a2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgLaR-0000IP-0R;
	Wed, 13 Sep 2023 08:51:03 +0000
Date: Wed, 13 Sep 2023 16:50:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3370/4552] fs/bcachefs/alloc_background.c:627:10:
 warning: format specifies type 'unsigned long' but the argument has type
 'size_t' (aka 'unsigned int')
Message-ID: <202309131633.dudKjDW7-lkp@intel.com>
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
commit: 4be0d766a7e917bc514bd9f5ebeca365a2b22f07 [3370/4552] bcachefs: bucket_gens btree
config: powerpc-randconfig-r006-20230912 (https://download.01.org/0day-ci/archive/20230913/202309131633.dudKjDW7-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309131633.dudKjDW7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309131633.dudKjDW7-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   In file included from fs/bcachefs/alloc_background.c:2:
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
   In file included from fs/bcachefs/alloc_background.c:5:
   In file included from fs/bcachefs/backpointers.h:5:
   fs/bcachefs/btree_iter.h:248:8: warning: duplicate 'inline' declaration specifier [-Wduplicate-decl-specifier]
     248 | static inline int btree_trans_restart_nounlock(struct btree_trans *trans, int err)
         |        ^
   include/linux/compiler_types.h:215:16: note: expanded from macro 'inline'
     215 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                ^
   In file included from fs/bcachefs/alloc_background.c:5:
   In file included from fs/bcachefs/backpointers.h:5:
   fs/bcachefs/btree_iter.h:258:8: warning: duplicate 'inline' declaration specifier [-Wduplicate-decl-specifier]
     258 | static inline int btree_trans_restart(struct btree_trans *trans, int err)
         |        ^
   include/linux/compiler_types.h:215:16: note: expanded from macro 'inline'
     215 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                ^
   In file included from fs/bcachefs/alloc_background.c:7:
   In file included from fs/bcachefs/btree_io.h:7:
   fs/bcachefs/btree_locking.h:88:46: warning: implicit conversion from enumeration type 'enum six_lock_type' to different enumeration type 'enum btree_node_locked_type' [-Wenum-conversion]
      88 |         mark_btree_node_locked_noreset(path, level, type);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~              ^~~~
   fs/bcachefs/btree_locking.h:175:51: warning: implicit conversion from enumeration type 'enum six_lock_type' to different enumeration type 'enum btree_node_locked_type' [-Wenum-conversion]
     175 |         mark_btree_node_locked_noreset(path, b->c.level, SIX_LOCK_intent);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                   ^~~~~~~~~~~~~~~
   fs/bcachefs/btree_locking.h:241:33: warning: implicit conversion from enumeration type 'enum btree_node_locked_type' to different enumeration type 'enum six_lock_type' [-Wenum-conversion]
     241 |                         six_lock_increment(&b->lock, want);
         |                         ~~~~~~~~~~~~~~~~~~           ^~~~
   fs/bcachefs/btree_locking.h:261:49: warning: implicit conversion from enumeration type 'enum six_lock_type' to different enumeration type 'enum btree_node_locked_type' [-Wenum-conversion]
     261 |             btree_node_lock_increment(trans, b, level, type) ||
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~                  ^~~~
   fs/bcachefs/btree_locking.h:288:49: warning: implicit conversion from enumeration type 'enum six_lock_type' to different enumeration type 'enum btree_node_locked_type' [-Wenum-conversion]
     288 |         mark_btree_node_locked_noreset(path, b->level, SIX_LOCK_write);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                 ^~~~~~~~~~~~~~
   In file included from fs/bcachefs/alloc_background.c:7:
   fs/bcachefs/btree_io.h:203:33: warning: implicit conversion from enumeration type 'enum btree_id' to different enumeration type 'enum btree_node_type' [-Wenum-conversion]
     203 |             btree_node_type_is_extents(btree_id) &&
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^~~~~~~~
   fs/bcachefs/btree_io.h:220:33: warning: implicit conversion from enumeration type 'enum btree_id' to different enumeration type 'enum btree_node_type' [-Wenum-conversion]
     220 |             btree_node_type_is_extents(btree_id) &&
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^~~~~~~~
   fs/bcachefs/alloc_background.c:272:10: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
     272 |                 prt_printf(err, "bad val size (%lu != %u)",
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                %u
     273 |                        bkey_val_u64s(k.k), alloc_v4_u64s(a.v));
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bkey.h:47:27: note: expanded from macro 'bkey_val_u64s'
      47 | #define bkey_val_u64s(_k)       ((_k)->u64s - BKEY_U64s)
         |                                 ^
   fs/bcachefs/util.h:221:54: note: expanded from macro 'prt_printf'
     221 | #define prt_printf(_out, ...)           bch2_prt_printf(_out, __VA_ARGS__)
         |                                                               ^~~~~~~~~~~
>> fs/bcachefs/alloc_background.c:627:10: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     627 |                 prt_printf(err, "bad val size (%lu != %zu)",
         |                                                ~~~
         |                                                %zu
     628 |                        bkey_val_bytes(k.k), sizeof(struct bch_bucket_gens));
         |                        ^~~~~~~~~~~~~~~~~~~
   fs/bcachefs/util.h:221:54: note: expanded from macro 'prt_printf'
     221 | #define prt_printf(_out, ...)           bch2_prt_printf(_out, __VA_ARGS__)
         |                                                               ^~~~~~~~~~~
   fs/bcachefs/alloc_background.c:939:17: warning: no previous prototype for function 'bch2_get_key_or_hole' [-Wmissing-prototypes]
     939 | struct bkey_s_c bch2_get_key_or_hole(struct btree_iter *iter, struct bpos end, struct bkey *hole)
         |                 ^
   fs/bcachefs/alloc_background.c:939:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     939 | struct bkey_s_c bch2_get_key_or_hole(struct btree_iter *iter, struct bpos end, struct bkey *hole)
         | ^
         | static 
   fs/bcachefs/alloc_background.c:1003:17: warning: no previous prototype for function 'bch2_get_key_or_real_bucket_hole' [-Wmissing-prototypes]
    1003 | struct bkey_s_c bch2_get_key_or_real_bucket_hole(struct btree_iter *iter, struct bkey *hole)
         |                 ^
   fs/bcachefs/alloc_background.c:1003:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1003 | struct bkey_s_c bch2_get_key_or_real_bucket_hole(struct btree_iter *iter, struct bkey *hole)
         | ^
         | static 
   fs/bcachefs/alloc_background.c:81:20: warning: unused function 'alloc_field_v1_put' [-Wunused-function]
      81 | static inline void alloc_field_v1_put(struct bkey_i_alloc *a, void **p,
         |                    ^
   20 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=n] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]


vim +627 fs/bcachefs/alloc_background.c

   621	
   622	int bch2_bucket_gens_invalid(const struct bch_fs *c, struct bkey_s_c k,
   623				     int rw, struct printbuf *err)
   624	{
   625		if (bkey_val_bytes(k.k) != sizeof(struct bch_bucket_gens)) {
   626			prt_printf(err, "bad val size (%lu != %zu)",
 > 627			       bkey_val_bytes(k.k), sizeof(struct bch_bucket_gens));
   628			return -BCH_ERR_invalid_bkey;
   629		}
   630	
   631		return 0;
   632	}
   633	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
