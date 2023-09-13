Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00566250E2;
	Wed, 13 Sep 2023 23:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694648412; x=1726184412;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C1FDyltSoQ3qjQLQbuNS/6kccI9mTJ4EheIrqfUnPWo=;
  b=Ohh0CMdr9KkYIXqc3BS+lnCAq4qY7hf/SJoB0hD++ofoEgdX7djAGkFi
   GrynWQhCxwl/pPrv/Bakr74IqI3XGK3yAsD9gpI2eKqcyGndQGvjmxW6n
   MQ3lzh8PA/OaDEyA/5MYIUnragnh9zww49tkbFPQocsYb5JNGNzSNOPuL
   mxQD5J8FKjw4IQRy8mlJH+PhU584DbzLKpCoViQ0vk9GAAv14j0G26Gbn
   ayIY+llTnJvvOL0/+nfXXJmAyPIUC1WqyWK1J5CkxxlmW/V/VxVV+Dsjb
   VCCOkf882OLUn8vVfFavF+pngtJhBpMQ2OzbKG8RnCaKrMKNys+1Lb3aE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="445244050"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="445244050"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 16:40:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="834516968"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="834516968"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 13 Sep 2023 16:40:06 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgZSn-0000oj-00;
	Wed, 13 Sep 2023 23:40:05 +0000
Date: Thu, 14 Sep 2023 07:39:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3807/4552] fs/bcachefs/snapshot.c:942:5: warning:
 no previous prototype for function 'bch2_snapshot_node_delete'
Message-ID: <202309140719.SIXNytRW-lkp@intel.com>
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
commit: c25d6a495d7f6c73c4f14d31c5e1b80ff8cbe338 [3807/4552] bcachefs: Cleanup redundant snapshot nodes
config: powerpc-randconfig-r006-20230912 (https://download.01.org/0day-ci/archive/20230914/202309140719.SIXNytRW-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309140719.SIXNytRW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309140719.SIXNytRW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/snapshot.c:3:
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
   In file included from fs/bcachefs/snapshot.c:3:
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
   In file included from fs/bcachefs/snapshot.c:3:
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
   In file included from fs/bcachefs/snapshot.c:3:
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
>> fs/bcachefs/snapshot.c:942:5: warning: no previous prototype for function 'bch2_snapshot_node_delete' [-Wmissing-prototypes]
     942 | int bch2_snapshot_node_delete(struct btree_trans *trans, u32 id)
         |     ^
   fs/bcachefs/snapshot.c:942:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     942 | int bch2_snapshot_node_delete(struct btree_trans *trans, u32 id)
         | ^
         | static 
   7 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=n] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]


vim +/bch2_snapshot_node_delete +942 fs/bcachefs/snapshot.c

   941	
 > 942	int bch2_snapshot_node_delete(struct btree_trans *trans, u32 id)
   943	{
   944		struct bch_fs *c = trans->c;
   945		struct btree_iter iter, p_iter = (struct btree_iter) { NULL };
   946		struct btree_iter c_iter = (struct btree_iter) { NULL };
   947		struct btree_iter tree_iter = (struct btree_iter) { NULL };
   948		struct bkey_s_c_snapshot s;
   949		u32 parent_id, child_id;
   950		unsigned i;
   951		int ret = 0;
   952	
   953		s = bch2_bkey_get_iter_typed(trans, &iter, BTREE_ID_snapshots, POS(0, id),
   954					     BTREE_ITER_INTENT, snapshot);
   955		ret = bkey_err(s);
   956		bch2_fs_inconsistent_on(bch2_err_matches(ret, ENOENT), c,
   957					"missing snapshot %u", id);
   958	
   959		if (ret)
   960			goto err;
   961	
   962		BUG_ON(s.v->children[1]);
   963	
   964		parent_id = le32_to_cpu(s.v->parent);
   965		child_id = le32_to_cpu(s.v->children[0]);
   966	
   967		if (parent_id) {
   968			struct bkey_i_snapshot *parent;
   969	
   970			parent = bch2_bkey_get_mut_typed(trans, &p_iter,
   971					     BTREE_ID_snapshots, POS(0, parent_id),
   972					     0, snapshot);
   973			ret = PTR_ERR_OR_ZERO(parent);
   974			bch2_fs_inconsistent_on(bch2_err_matches(ret, ENOENT), c,
   975						"missing snapshot %u", parent_id);
   976			if (unlikely(ret))
   977				goto err;
   978	
   979			/* find entry in parent->children for node being deleted */
   980			for (i = 0; i < 2; i++)
   981				if (le32_to_cpu(parent->v.children[i]) == id)
   982					break;
   983	
   984			if (bch2_fs_inconsistent_on(i == 2, c,
   985						"snapshot %u missing child pointer to %u",
   986						parent_id, id))
   987				goto err;
   988	
   989			parent->v.children[i] = le32_to_cpu(child_id);
   990	
   991			normalize_snapshot_child_pointers(&parent->v);
   992		}
   993	
   994		if (child_id) {
   995			struct bkey_i_snapshot *child;
   996	
   997			child = bch2_bkey_get_mut_typed(trans, &c_iter,
   998					     BTREE_ID_snapshots, POS(0, child_id),
   999					     0, snapshot);
  1000			ret = PTR_ERR_OR_ZERO(child);
  1001			bch2_fs_inconsistent_on(bch2_err_matches(ret, ENOENT), c,
  1002						"missing snapshot %u", child_id);
  1003			if (unlikely(ret))
  1004				goto err;
  1005	
  1006			child->v.parent = cpu_to_le32(parent_id);
  1007	
  1008			if (!child->v.parent) {
  1009				child->v.skip[0] = 0;
  1010				child->v.skip[1] = 0;
  1011				child->v.skip[2] = 0;
  1012			}
  1013		}
  1014	
  1015		if (!parent_id) {
  1016			/*
  1017			 * We're deleting the root of a snapshot tree: update the
  1018			 * snapshot_tree entry to point to the new root, or delete it if
  1019			 * this is the last snapshot ID in this tree:
  1020			 */
  1021			struct bkey_i_snapshot_tree *s_t;
  1022	
  1023			BUG_ON(s.v->children[1]);
  1024	
  1025			s_t = bch2_bkey_get_mut_typed(trans, &tree_iter,
  1026					BTREE_ID_snapshot_trees, POS(0, le32_to_cpu(s.v->tree)),
  1027					0, snapshot_tree);
  1028			ret = PTR_ERR_OR_ZERO(s_t);
  1029			if (ret)
  1030				goto err;
  1031	
  1032			if (s.v->children[0]) {
  1033				s_t->v.root_snapshot = s.v->children[0];
  1034			} else {
  1035				s_t->k.type = KEY_TYPE_deleted;
  1036				set_bkey_val_u64s(&s_t->k, 0);
  1037			}
  1038		}
  1039	
  1040		ret = bch2_btree_delete_at(trans, &iter, 0);
  1041	err:
  1042		bch2_trans_iter_exit(trans, &tree_iter);
  1043		bch2_trans_iter_exit(trans, &p_iter);
  1044		bch2_trans_iter_exit(trans, &c_iter);
  1045		bch2_trans_iter_exit(trans, &iter);
  1046		return ret;
  1047	}
  1048	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
