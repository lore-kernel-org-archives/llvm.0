Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624FB7FD;
	Wed, 13 Sep 2023 03:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694576524; x=1726112524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FnoCl35Jnuf2N3Eg05aqIF9mIbC0SMuhkNALLM/8Zqc=;
  b=OWYBCHVKOirEeGSAwzxtdAT6kkAKU3glspU/tsC9QdDRoJ2zYHDUhsUG
   az6Zg4FgsvAvpcMMpZ+eD3mKRMcYbWqHMu/S+q4SyP+wC/JLGMJtMP4Kr
   T3bvHohrwbB8/Uu1CfWZfNYdBCjg6Q3qNl0+GZmGmrjV7q4E56BKVm+ev
   Dgx4wA5Bil5cFe0dSO1JyIrXChCgxwGmEXB8Bi0z340IxTfunZ+LkPZ3X
   PNjKz0/h9tL4ztaXMRMTvTUjsmgKGOjbR67ekb/1D9ERSp9qx0dTaMPEP
   Jmyn5uMg9Vks+xahxCNRPDOluL78pxEQs4I/Whl/UZLLTBMZbCHPyCfHj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="442586163"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="442586163"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 20:42:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="747145572"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="747145572"
Received: from lkp-server02.sh.intel.com (HELO e6439d5ea182) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 12 Sep 2023 20:42:01 -0700
Received: from kbuild by e6439d5ea182 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgGlL-00002d-22;
	Wed, 13 Sep 2023 03:41:59 +0000
Date: Wed, 13 Sep 2023 11:41:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3349/4552] fs/bcachefs/alloc_background.c:272:10:
 warning: format specifies type 'unsigned long' but the argument has type
 'unsigned int'
Message-ID: <202309131127.7deYbx3z-lkp@intel.com>
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
commit: 11be8e8db283485aa09fa68985f2aee1af0097bf [3349/4552] bcachefs: New on disk format: Backpointers
config: powerpc-randconfig-r006-20230912 (https://download.01.org/0day-ci/archive/20230913/202309131127.7deYbx3z-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309131127.7deYbx3z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309131127.7deYbx3z-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
>> fs/bcachefs/alloc_background.c:272:10: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
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
   fs/bcachefs/alloc_background.c:81:20: warning: unused function 'alloc_field_v1_put' [-Wunused-function]
      81 | static inline void alloc_field_v1_put(struct bkey_i_alloc *a, void **p,
         |                    ^
   17 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=n] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]


vim +272 fs/bcachefs/alloc_background.c

   264	
   265	int bch2_alloc_v4_invalid(const struct bch_fs *c, struct bkey_s_c k,
   266				  int rw, struct printbuf *err)
   267	{
   268		struct bkey_s_c_alloc_v4 a = bkey_s_c_to_alloc_v4(k);
   269	
   270		if (alloc_v4_u64s(a.v) != bkey_val_u64s(k.k)) {
   271			prt_printf(err, "bad val size (%lu != %u)",
 > 272			       bkey_val_u64s(k.k), alloc_v4_u64s(a.v));
   273			return -BCH_ERR_invalid_bkey;
   274		}
   275	
   276		if (!BCH_ALLOC_V4_BACKPOINTERS_START(a.v) &&
   277		    BCH_ALLOC_V4_NR_BACKPOINTERS(a.v)) {
   278			prt_printf(err, "invalid backpointers_start");
   279			return -BCH_ERR_invalid_bkey;
   280		}
   281	
   282		/*
   283		 * XXX this is wrong, we'll be checking updates that happened from
   284		 * before BCH_FS_CHECK_BACKPOINTERS_DONE
   285		 */
   286		if (rw == WRITE && test_bit(BCH_FS_CHECK_BACKPOINTERS_DONE, &c->flags)) {
   287			unsigned i, bp_len = 0;
   288	
   289			for (i = 0; i < BCH_ALLOC_V4_NR_BACKPOINTERS(a.v); i++)
   290				bp_len += alloc_v4_backpointers_c(a.v)[i].bucket_len;
   291	
   292			if (bp_len > a.v->dirty_sectors) {
   293				prt_printf(err, "too many backpointers");
   294				return -BCH_ERR_invalid_bkey;
   295			}
   296		}
   297	
   298		if (rw == WRITE) {
   299			if (alloc_data_type(*a.v, a.v->data_type) != a.v->data_type) {
   300				prt_printf(err, "invalid data type (got %u should be %u)",
   301				       a.v->data_type, alloc_data_type(*a.v, a.v->data_type));
   302				return -BCH_ERR_invalid_bkey;
   303			}
   304	
   305			switch (a.v->data_type) {
   306			case BCH_DATA_free:
   307			case BCH_DATA_need_gc_gens:
   308			case BCH_DATA_need_discard:
   309				if (a.v->dirty_sectors ||
   310				    a.v->cached_sectors ||
   311				    a.v->stripe) {
   312					prt_printf(err, "empty data type free but have data");
   313					return -BCH_ERR_invalid_bkey;
   314				}
   315				break;
   316			case BCH_DATA_sb:
   317			case BCH_DATA_journal:
   318			case BCH_DATA_btree:
   319			case BCH_DATA_user:
   320			case BCH_DATA_parity:
   321				if (!a.v->dirty_sectors) {
   322					prt_printf(err, "data_type %s but dirty_sectors==0",
   323					       bch2_data_types[a.v->data_type]);
   324					return -BCH_ERR_invalid_bkey;
   325				}
   326				break;
   327			case BCH_DATA_cached:
   328				if (!a.v->cached_sectors ||
   329				    a.v->dirty_sectors ||
   330				    a.v->stripe) {
   331					prt_printf(err, "data type inconsistency");
   332					return -BCH_ERR_invalid_bkey;
   333				}
   334	
   335				if (!a.v->io_time[READ] &&
   336				    test_bit(BCH_FS_CHECK_ALLOC_TO_LRU_REFS_DONE, &c->flags)) {
   337					prt_printf(err, "cached bucket with read_time == 0");
   338					return -BCH_ERR_invalid_bkey;
   339				}
   340				break;
   341			case BCH_DATA_stripe:
   342				if (!a.v->stripe) {
   343					prt_printf(err, "data_type %s but stripe==0",
   344					       bch2_data_types[a.v->data_type]);
   345					return -BCH_ERR_invalid_bkey;
   346				}
   347				break;
   348			}
   349		}
   350	
   351		return 0;
   352	}
   353	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
