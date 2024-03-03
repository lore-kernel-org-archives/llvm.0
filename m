Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6C8BE5D;
	Sun,  3 Mar 2024 14:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709477994; cv=none; b=bdqLvbWmwp7P1sK1pkmlrSB15zHzO1c7OJil6VfhvwcZAFdntwrKKbiI+SCukHZk04a7Ucz3zb6lYcQGfA4B3jLoCaxVnQZN3zxHQsPYP2peuzB7fIG/i/qEyoH9YQA52ugmPOuHOqKAAp76V6CfoEeGBkF0XrKqEUVGNbsA1yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709477994; c=relaxed/simple;
	bh=XOvcw0FqgqKlWFcDNqcRBL8lH8YnZmV8plFAgHVpad0=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lKKaZhwIa44rRfgrKFSZG38kYfvp7QHHmE+d/nIVygMw2ilxOvnp2L6UyYhnYNthFgFKQS4kNNTHiIiDnTI+HxT32kfhbzm+pacGzSHP90la66WRxFaEkNfQrc+ELpx4rceioDcD/tDFfcefAyouzTCqS5SqOboFcAR87hv8Z8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K977dxE+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K977dxE+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709477992; x=1741013992;
  h=date:from:cc:subject:message-id:mime-version;
  bh=XOvcw0FqgqKlWFcDNqcRBL8lH8YnZmV8plFAgHVpad0=;
  b=K977dxE+Y1Khx1EFJ8tOR8e/jU3OWzAqiy+aHY/BgTmBcHjSYYFcqtMf
   tFZQPnwLikeFG0819Bm1CrDTEBD7MSqozkpmnuLd5nlhbq4H8QgK+XkQn
   xy2fURI2Zus0xrutcoDU4rA8N5LKn19mWy8EWEX81aeNplLpa0PU58dMb
   Pw20vs7g56EJ4W3emlhZxJiQbSvUSxD3NUHKInvidBMQhjxRyVa74AzCB
   LjDCqf2NsbzzhVhCQWcrIZI0Uzx/GmJUX07bIvk4MY3OIF/GqabAER4mQ
   153LJ51rW9acAEa4+VS06jkTh0/f3wmW9cPdALtShg7Our2FE3O1aHTV9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="3828804"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="3828804"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 06:59:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="13282100"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Mar 2024 06:59:50 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgnJc-0001qO-17;
	Sun, 03 Mar 2024 14:59:48 +0000
Date: Sun, 3 Mar 2024 22:59:12 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: fs/bcachefs/btree_update_interior.c:643:25: warning: bitwise
 operation between different enumeration types ('enum bch_watermark' and
 'enum bch_trans_commit_flags')
Message-ID: <202403032209.lRJJsB4O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kent.overstreet@linux.dev>

Hi Kent,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   04b8076df2534f08bb4190f90a24e0f7f8930aca
commit: cb52d23e77a6e5e9588962ba7e283b0d0d2c1976 bcachefs: Rename BTREE_INSERT flags
date:   9 weeks ago
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240303/202403032209.lRJJsB4O-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403032209.lRJJsB4O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403032209.lRJJsB4O-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/btree_update_interior.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/powerpc/include/asm/cacheflush.h:7:
   In file included from include/linux/mm.h:2177:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> fs/bcachefs/btree_update_interior.c:643:25: warning: bitwise operation between different enumeration types ('enum bch_watermark' and 'enum bch_trans_commit_flags') [-Wenum-enum-conversion]
     643 |                         BCH_WATERMARK_reclaim|
         |                         ~~~~~~~~~~~~~~~~~~~~~^
     644 |                         BCH_TRANS_COMMIT_no_enospc|
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_update.h:133:23: note: expanded from macro 'commit_do'
     133 |                                         (_journal_seq), (_flags)))
         |                                                          ^~~~~~
   fs/bcachefs/btree_iter.h:685:12: note: expanded from macro 'lockrestart_do'
     685 |                 _ret2 = (_do);                                          \
         |                          ^~~
   6 warnings generated.
--
   In file included from fs/bcachefs/recovery.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/powerpc/include/asm/cacheflush.h:7:
   In file included from include/linux/mm.h:2177:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> fs/bcachefs/recovery.c:208:39: warning: bitwise operation between different enumeration types ('enum bch_trans_commit_flags' and 'enum bch_watermark') [-Wenum-enum-conversion]
     208 |                                  ? BCH_TRANS_COMMIT_no_journal_res|BCH_WATERMARK_reclaim
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_update.h:133:23: note: expanded from macro 'commit_do'
     133 |                                         (_journal_seq), (_flags)))
         |                                                          ^~~~~~
   fs/bcachefs/btree_iter.h:685:12: note: expanded from macro 'lockrestart_do'
     685 |                 _ret2 = (_do);                                          \
         |                          ^~~
   6 warnings generated.


vim +643 fs/bcachefs/btree_update_interior.c

5b6d505a77f87a Kent Overstreet 2020-05-01  590  
00b8ccf7074fdd Kent Overstreet 2020-05-25  591  static void btree_update_nodes_written(struct btree_update *as)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  592  {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  593  	struct bch_fs *c = as->c;
ca7d8fcabf29fa Kent Overstreet 2022-08-21  594  	struct btree *b;
6bd68ec266ad71 Kent Overstreet 2023-09-12  595  	struct btree_trans *trans = bch2_trans_get(c);
00b8ccf7074fdd Kent Overstreet 2020-05-25  596  	u64 journal_seq = 0;
00b8ccf7074fdd Kent Overstreet 2020-05-25  597  	unsigned i;
6357d6071fccb5 Kent Overstreet 2020-02-08  598  	int ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  599  
7bfbbd88024d70 Kent Overstreet 2020-12-02  600  	/*
7bfbbd88024d70 Kent Overstreet 2020-12-02  601  	 * If we're already in an error state, it might be because a btree node
7bfbbd88024d70 Kent Overstreet 2020-12-02  602  	 * was never written, and we might be trying to free that same btree
7bfbbd88024d70 Kent Overstreet 2020-12-02  603  	 * node here, but it won't have been marked as allocated and we'll see
7bfbbd88024d70 Kent Overstreet 2020-12-02  604  	 * spurious disk usage inconsistencies in the transactional part below
7bfbbd88024d70 Kent Overstreet 2020-12-02  605  	 * if we don't skip it:
7bfbbd88024d70 Kent Overstreet 2020-12-02  606  	 */
7bfbbd88024d70 Kent Overstreet 2020-12-02  607  	ret = bch2_journal_error(&c->journal);
7bfbbd88024d70 Kent Overstreet 2020-12-02  608  	if (ret)
7bfbbd88024d70 Kent Overstreet 2020-12-02  609  		goto err;
7bfbbd88024d70 Kent Overstreet 2020-12-02  610  
ee7570546e89ec Kent Overstreet 2023-09-10  611  	/*
ee7570546e89ec Kent Overstreet 2023-09-10  612  	 * Wait for any in flight writes to finish before we free the old nodes
ee7570546e89ec Kent Overstreet 2023-09-10  613  	 * on disk:
ee7570546e89ec Kent Overstreet 2023-09-10  614  	 */
ee7570546e89ec Kent Overstreet 2023-09-10  615  	for (i = 0; i < as->nr_old_nodes; i++) {
ee7570546e89ec Kent Overstreet 2023-09-10  616  		__le64 seq;
ee7570546e89ec Kent Overstreet 2023-09-10  617  
ca7d8fcabf29fa Kent Overstreet 2022-08-21  618  		b = as->old_nodes[i];
ca7d8fcabf29fa Kent Overstreet 2022-08-21  619  
6bd68ec266ad71 Kent Overstreet 2023-09-12  620  		btree_node_lock_nopath_nofail(trans, &b->c, SIX_LOCK_read);
ca7d8fcabf29fa Kent Overstreet 2022-08-21  621  		seq = b->data ? b->data->keys.seq : 0;
ca7d8fcabf29fa Kent Overstreet 2022-08-21  622  		six_unlock_read(&b->c.lock);
ee7570546e89ec Kent Overstreet 2023-09-10  623  
ee7570546e89ec Kent Overstreet 2023-09-10  624  		if (seq == as->old_nodes_seq[i])
ca7d8fcabf29fa Kent Overstreet 2022-08-21  625  			wait_on_bit_io(&b->flags, BTREE_NODE_write_in_flight_inner,
9f1833cadda7bb Kent Overstreet 2021-07-10  626  				       TASK_UNINTERRUPTIBLE);
ee7570546e89ec Kent Overstreet 2023-09-10  627  	}
ee7570546e89ec Kent Overstreet 2023-09-10  628  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  629  	/*
1c6fdbd8f2465d Kent Overstreet 2017-03-16  630  	 * We did an update to a parent node where the pointers we added pointed
1c6fdbd8f2465d Kent Overstreet 2017-03-16  631  	 * to child nodes that weren't written yet: now, the child nodes have
1c6fdbd8f2465d Kent Overstreet 2017-03-16  632  	 * been written so we can write out the update to the interior node.
1c6fdbd8f2465d Kent Overstreet 2017-03-16  633  	 */
2ca88e5ad9b296 Kent Overstreet 2019-03-07  634  
2ca88e5ad9b296 Kent Overstreet 2019-03-07  635  	/*
2ca88e5ad9b296 Kent Overstreet 2019-03-07  636  	 * We can't call into journal reclaim here: we'd block on the journal
2ca88e5ad9b296 Kent Overstreet 2019-03-07  637  	 * reclaim lock, but we may need to release the open buckets we have
2ca88e5ad9b296 Kent Overstreet 2019-03-07  638  	 * pinned in order for other btree updates to make forward progress, and
2ca88e5ad9b296 Kent Overstreet 2019-03-07  639  	 * journal reclaim does btree updates when flushing bkey_cached entries,
2ca88e5ad9b296 Kent Overstreet 2019-03-07  640  	 * which may require allocations as well.
2ca88e5ad9b296 Kent Overstreet 2019-03-07  641  	 */
6bd68ec266ad71 Kent Overstreet 2023-09-12  642  	ret = commit_do(trans, &as->disk_res, &journal_seq,
f33c58fc46a9c5 Kent Overstreet 2023-06-27 @643  			BCH_WATERMARK_reclaim|
cb52d23e77a6e5 Kent Overstreet 2023-11-11  644  			BCH_TRANS_COMMIT_no_enospc|
cb52d23e77a6e5 Kent Overstreet 2023-11-11  645  			BCH_TRANS_COMMIT_no_check_rw|
cb52d23e77a6e5 Kent Overstreet 2023-11-11  646  			BCH_TRANS_COMMIT_journal_reclaim,
6bd68ec266ad71 Kent Overstreet 2023-09-12  647  			btree_update_nodes_written_trans(trans, as));
6bd68ec266ad71 Kent Overstreet 2023-09-12  648  	bch2_trans_unlock(trans);
5b6d505a77f87a Kent Overstreet 2020-05-01  649  
7bfbbd88024d70 Kent Overstreet 2020-12-02  650  	bch2_fs_fatal_err_on(ret && !bch2_journal_error(&c->journal), c,
df6a24f81aa29a Kent Overstreet 2022-10-22  651  			     "%s(): error %s", __func__, bch2_err_str(ret));
7bfbbd88024d70 Kent Overstreet 2020-12-02  652  err:
ca7d8fcabf29fa Kent Overstreet 2022-08-21  653  	if (as->b) {
e4215d0fec777e Kent Overstreet 2022-09-16  654  		struct btree_path *path;
e4215d0fec777e Kent Overstreet 2022-09-16  655  
ca7d8fcabf29fa Kent Overstreet 2022-08-21  656  		b = as->b;
6bd68ec266ad71 Kent Overstreet 2023-09-12  657  		path = get_unlocked_mut_path(trans, as->btree_id, b->c.level, b->key.k.p);
bc970cecd86d5a Kent Overstreet 2020-05-02  658  		/*
00b8ccf7074fdd Kent Overstreet 2020-05-25  659  		 * @b is the node we did the final insert into:
00b8ccf7074fdd Kent Overstreet 2020-05-25  660  		 *
bc970cecd86d5a Kent Overstreet 2020-05-02  661  		 * On failure to get a journal reservation, we still have to
bc970cecd86d5a Kent Overstreet 2020-05-02  662  		 * unblock the write and allow most of the write path to happen
bc970cecd86d5a Kent Overstreet 2020-05-02  663  		 * so that shutdown works, but the i->journal_seq mechanism
bc970cecd86d5a Kent Overstreet 2020-05-02  664  		 * won't work to prevent the btree write from being visible (we
bc970cecd86d5a Kent Overstreet 2020-05-02  665  		 * didn't get a journal sequence number) - instead
bc970cecd86d5a Kent Overstreet 2020-05-02  666  		 * __bch2_btree_node_write() doesn't do the actual write if
bc970cecd86d5a Kent Overstreet 2020-05-02  667  		 * we're in journal error state:
bc970cecd86d5a Kent Overstreet 2020-05-02  668  		 */
1c6fdbd8f2465d Kent Overstreet 2017-03-16  669  
8aaee94d463f78 Kent Overstreet 2022-10-03  670  		/*
8aaee94d463f78 Kent Overstreet 2022-10-03  671  		 * Ensure transaction is unlocked before using
8aaee94d463f78 Kent Overstreet 2022-10-03  672  		 * btree_node_lock_nopath() (the use of which is always suspect,
8aaee94d463f78 Kent Overstreet 2022-10-03  673  		 * we need to work on removing this in the future)
8aaee94d463f78 Kent Overstreet 2022-10-03  674  		 *
8aaee94d463f78 Kent Overstreet 2022-10-03  675  		 * It should be, but get_unlocked_mut_path() -> bch2_path_get()
8aaee94d463f78 Kent Overstreet 2022-10-03  676  		 * calls bch2_path_upgrade(), before we call path_make_mut(), so
8aaee94d463f78 Kent Overstreet 2022-10-03  677  		 * we may rarely end up with a locked path besides the one we
8aaee94d463f78 Kent Overstreet 2022-10-03  678  		 * have here:
8aaee94d463f78 Kent Overstreet 2022-10-03  679  		 */
6bd68ec266ad71 Kent Overstreet 2023-09-12  680  		bch2_trans_unlock(trans);
6bd68ec266ad71 Kent Overstreet 2023-09-12  681  		btree_node_lock_nopath_nofail(trans, &b->c, SIX_LOCK_intent);
6bd68ec266ad71 Kent Overstreet 2023-09-12  682  		mark_btree_node_locked(trans, path, b->c.level, BTREE_NODE_INTENT_LOCKED);
1fb4fe63178881 Kent Overstreet 2023-05-20  683  		path->l[b->c.level].lock_seq = six_lock_seq(&b->c.lock);
e4215d0fec777e Kent Overstreet 2022-09-16  684  		path->l[b->c.level].b = b;
e4215d0fec777e Kent Overstreet 2022-09-16  685  
6bd68ec266ad71 Kent Overstreet 2023-09-12  686  		bch2_btree_node_lock_write_nofail(trans, path, &b->c);
e4215d0fec777e Kent Overstreet 2022-09-16  687  
00b8ccf7074fdd Kent Overstreet 2020-05-25  688  		mutex_lock(&c->btree_interior_update_lock);
00b8ccf7074fdd Kent Overstreet 2020-05-25  689  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  690  		list_del(&as->write_blocked_list);
bf3efff5e4fc2d Kent Overstreet 2022-02-27  691  		if (list_empty(&b->write_blocked))
bf3efff5e4fc2d Kent Overstreet 2022-02-27  692  			clear_btree_node_write_blocked(b);
d0cc3defba5888 Kent Overstreet 2019-01-13  693  
5db43418d5097b Kent Overstreet 2020-12-03  694  		/*
5db43418d5097b Kent Overstreet 2020-12-03  695  		 * Node might have been freed, recheck under
5db43418d5097b Kent Overstreet 2020-12-03  696  		 * btree_interior_update_lock:
5db43418d5097b Kent Overstreet 2020-12-03  697  		 */
5db43418d5097b Kent Overstreet 2020-12-03  698  		if (as->b == b) {
00b8ccf7074fdd Kent Overstreet 2020-05-25  699  			BUG_ON(!b->c.level);
00b8ccf7074fdd Kent Overstreet 2020-05-25  700  			BUG_ON(!btree_node_dirty(b));
00b8ccf7074fdd Kent Overstreet 2020-05-25  701  
5db43418d5097b Kent Overstreet 2020-12-03  702  			if (!ret) {
96dea3d599dbc3 Kent Overstreet 2023-09-12  703  				struct bset *last = btree_bset_last(b);
96dea3d599dbc3 Kent Overstreet 2023-09-12  704  
96dea3d599dbc3 Kent Overstreet 2023-09-12  705  				last->journal_seq = cpu_to_le64(
00b8ccf7074fdd Kent Overstreet 2020-05-25  706  							     max(journal_seq,
96dea3d599dbc3 Kent Overstreet 2023-09-12  707  								 le64_to_cpu(last->journal_seq)));
6357d6071fccb5 Kent Overstreet 2020-02-08  708  
00b8ccf7074fdd Kent Overstreet 2020-05-25  709  				bch2_btree_add_journal_pin(c, b, journal_seq);
5db43418d5097b Kent Overstreet 2020-12-03  710  			} else {
5db43418d5097b Kent Overstreet 2020-12-03  711  				/*
5db43418d5097b Kent Overstreet 2020-12-03  712  				 * If we didn't get a journal sequence number we
5db43418d5097b Kent Overstreet 2020-12-03  713  				 * can't write this btree node, because recovery
5db43418d5097b Kent Overstreet 2020-12-03  714  				 * won't know to ignore this write:
5db43418d5097b Kent Overstreet 2020-12-03  715  				 */
5db43418d5097b Kent Overstreet 2020-12-03  716  				set_btree_node_never_write(b);
5db43418d5097b Kent Overstreet 2020-12-03  717  			}
bc970cecd86d5a Kent Overstreet 2020-05-02  718  		}
bc970cecd86d5a Kent Overstreet 2020-05-02  719  
00b8ccf7074fdd Kent Overstreet 2020-05-25  720  		mutex_unlock(&c->btree_interior_update_lock);
e4215d0fec777e Kent Overstreet 2022-09-16  721  
bf5a261c7af80a Kent Overstreet 2023-08-01  722  		mark_btree_node_locked_noreset(path, b->c.level, BTREE_NODE_INTENT_LOCKED);
bc970cecd86d5a Kent Overstreet 2020-05-02  723  		six_unlock_write(&b->c.lock);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  724  
00b8ccf7074fdd Kent Overstreet 2020-05-25  725  		btree_node_write_if_need(c, b, SIX_LOCK_intent);
6bd68ec266ad71 Kent Overstreet 2023-09-12  726  		btree_node_unlock(trans, path, b->c.level);
6bd68ec266ad71 Kent Overstreet 2023-09-12  727  		bch2_path_put(trans, path, true);
6357d6071fccb5 Kent Overstreet 2020-02-08  728  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  729  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  730  	bch2_journal_pin_drop(&c->journal, &as->journal);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  731  
00b8ccf7074fdd Kent Overstreet 2020-05-25  732  	mutex_lock(&c->btree_interior_update_lock);
00b8ccf7074fdd Kent Overstreet 2020-05-25  733  	for (i = 0; i < as->nr_new_nodes; i++) {
00b8ccf7074fdd Kent Overstreet 2020-05-25  734  		b = as->new_nodes[i];
58fb3e519a7612 Kent Overstreet 2020-04-07  735  
58fb3e519a7612 Kent Overstreet 2020-04-07  736  		BUG_ON(b->will_make_reachable != (unsigned long) as);
58fb3e519a7612 Kent Overstreet 2020-04-07  737  		b->will_make_reachable = 0;
bf3efff5e4fc2d Kent Overstreet 2022-02-27  738  		clear_btree_node_will_make_reachable(b);
00b8ccf7074fdd Kent Overstreet 2020-05-25  739  	}
00b8ccf7074fdd Kent Overstreet 2020-05-25  740  	mutex_unlock(&c->btree_interior_update_lock);
bc970cecd86d5a Kent Overstreet 2020-05-02  741  
00b8ccf7074fdd Kent Overstreet 2020-05-25  742  	for (i = 0; i < as->nr_new_nodes; i++) {
00b8ccf7074fdd Kent Overstreet 2020-05-25  743  		b = as->new_nodes[i];
00b8ccf7074fdd Kent Overstreet 2020-05-25  744  
6bd68ec266ad71 Kent Overstreet 2023-09-12  745  		btree_node_lock_nopath_nofail(trans, &b->c, SIX_LOCK_read);
00b8ccf7074fdd Kent Overstreet 2020-05-25  746  		btree_node_write_if_need(c, b, SIX_LOCK_read);
00b8ccf7074fdd Kent Overstreet 2020-05-25  747  		six_unlock_read(&b->c.lock);
58fb3e519a7612 Kent Overstreet 2020-04-07  748  	}
58fb3e519a7612 Kent Overstreet 2020-04-07  749  
00b8ccf7074fdd Kent Overstreet 2020-05-25  750  	for (i = 0; i < as->nr_open_buckets; i++)
00b8ccf7074fdd Kent Overstreet 2020-05-25  751  		bch2_open_bucket_put(c, c->open_buckets + as->open_buckets[i]);
8707ab0df25955 Kent Overstreet 2020-04-04  752  
6bd68ec266ad71 Kent Overstreet 2023-09-12  753  	bch2_btree_update_free(as, trans);
6bd68ec266ad71 Kent Overstreet 2023-09-12  754  	bch2_trans_put(trans);
00b8ccf7074fdd Kent Overstreet 2020-05-25  755  }
58fb3e519a7612 Kent Overstreet 2020-04-07  756  

:::::: The code at line 643 was first introduced by commit
:::::: f33c58fc46a9c5bd6cbf90edb6ce17fa3fd912d5 bcachefs: Kill BTREE_INSERT_USE_RESERVE

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
