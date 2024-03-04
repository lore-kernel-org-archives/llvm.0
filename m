Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B80217E9;
	Mon,  4 Mar 2024 01:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709515660; cv=none; b=tOZbLju5swFSUHY9iJTMH1GsioKoWdbzmqO7LABEnO/f+CNDK5ePRZKc0gSQfM1vjFiiwCWk0HqvYcDg6vb/7WoeHrqt09X4vrfB9i9Jb9bv+/J/YoVt8QcC6hFNDm6zTyKWGeLjNxOyqIXisfEgKvcz9Q5eZkDy0eiCYd4+rk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709515660; c=relaxed/simple;
	bh=0q26ncL5TG6jVVgDr3Je51b0MMBosiL7vsYphsVjxjw=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pH+WQR4naMiO0XtCYhplYJrtz/ne5TKc66Zyav5j8r9igQMjoQJ4L4eAZ2QpuwSXWje7/uGVlD5u6GniXgdKsVH5+WuIdMHp09oOJVdRa8TlNYRKcAIgDsmP3zE5UNyORjj57rmWChazEJGtV/v8wpZyTYXzgK/QSiZhwrjAqDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gwtx38uv; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gwtx38uv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709515659; x=1741051659;
  h=date:from:cc:subject:message-id:mime-version;
  bh=0q26ncL5TG6jVVgDr3Je51b0MMBosiL7vsYphsVjxjw=;
  b=gwtx38uvs6/BEFLSrECZ+bHzMxAPrMRa6HywgWE1ekwaKYS17R59SFAi
   yGH86nIDeOTzDAnnDL/ijj/jPybE6vQ14ncQ1P1lgWDvmJ/hCvvrMBPVL
   HNG/Bn40a3HyHoTSkBd0L99vHoZDeU9nniIbOxpvWULRQlaDyzDh3CTlN
   lM3Ig/ym4AkvAns0/E+u0+NXjQdXXbFu8uw9DdFHTb0eEbTjRB1gd2LBq
   voMPfRPZbxCyToFQayZGd02yro0S2y02iok2zs8dPind/0tyHqVTcwsWn
   pTgGUypwmd9rol0g1PZTYG+xa2AHu5C6UvHM26p99out4XiZIGR8B9B51
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4115236"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="4115236"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 17:27:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="9014293"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Mar 2024 17:27:36 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgx78-0002F9-1o;
	Mon, 04 Mar 2024 01:27:34 +0000
Date: Mon, 4 Mar 2024 09:26:41 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: fs/bcachefs/btree_write_buffer.c:262:26: warning: bitwise operation
 between different enumeration types ('enum bch_watermark' and 'enum
 bch_trans_commit_flags')
Message-ID: <202403040934.34jM6TvV-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   90d35da658da8cff0d4ecbb5113f5fac9d00eb72
commit: 183bcc89b855c412bfefa545b799006d66f689a6 bcachefs: Clean up btree write buffer write ref handling
date:   9 weeks ago
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240304/202403040934.34jM6TvV-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403040934.34jM6TvV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403040934.34jM6TvV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/btree_write_buffer.c:3:
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
>> fs/bcachefs/btree_write_buffer.c:262:26: warning: bitwise operation between different enumeration types ('enum bch_watermark' and 'enum bch_trans_commit_flags') [-Wenum-enum-conversion]
     262 |                                 BCH_WATERMARK_reclaim|
         |                                 ~~~~~~~~~~~~~~~~~~~~~^
     263 |                                 BCH_TRANS_COMMIT_no_check_rw|
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_update.h:138:23: note: expanded from macro 'commit_do'
     138 |                                         (_journal_seq), (_flags)))
         |                                                          ^~~~~~
   fs/bcachefs/btree_iter.h:679:12: note: expanded from macro 'lockrestart_do'
     679 |                 _ret2 = (_do);                                          \
         |                          ^~~
   6 warnings generated.


vim +262 fs/bcachefs/btree_write_buffer.c

   139	
   140	int __bch2_btree_write_buffer_flush(struct btree_trans *trans, bool locked)
   141	{
   142		struct bch_fs *c = trans->c;
   143		struct journal *j = &c->journal;
   144		struct btree_write_buffer *wb = &c->btree_write_buffer;
   145		struct journal_entry_pin pin;
   146		struct btree_write_buffered_key *i, *keys;
   147		struct btree_iter iter = { NULL };
   148		size_t nr = 0, skipped = 0, fast = 0, slowpath = 0;
   149		bool write_locked = false;
   150		union btree_write_buffer_state s;
   151		int ret = 0;
   152	
   153		memset(&pin, 0, sizeof(pin));
   154	
   155		if (!locked && !mutex_trylock(&wb->flush_lock))
   156			return 0;
   157	
   158		bch2_journal_pin_copy(j, &pin, &wb->journal_pin,
   159				      bch2_btree_write_buffer_journal_flush);
   160		bch2_journal_pin_drop(j, &wb->journal_pin);
   161	
   162		s = btree_write_buffer_switch(wb);
   163		keys = wb->keys[s.idx];
   164		nr = s.nr;
   165	
   166		if (race_fault())
   167			goto slowpath;
   168	
   169		/*
   170		 * We first sort so that we can detect and skip redundant updates, and
   171		 * then we attempt to flush in sorted btree order, as this is most
   172		 * efficient.
   173		 *
   174		 * However, since we're not flushing in the order they appear in the
   175		 * journal we won't be able to drop our journal pin until everything is
   176		 * flushed - which means this could deadlock the journal if we weren't
   177		 * passing BCH_TRANS_COMMIT_journal_reclaim. This causes the update to fail
   178		 * if it would block taking a journal reservation.
   179		 *
   180		 * If that happens, simply skip the key so we can optimistically insert
   181		 * as many keys as possible in the fast path.
   182		 */
   183		sort(keys, nr, sizeof(keys[0]),
   184		     btree_write_buffered_key_cmp, NULL);
   185	
   186		for (i = keys; i < keys + nr; i++) {
   187			if (i + 1 < keys + nr &&
   188			    i[0].btree == i[1].btree &&
   189			    bpos_eq(i[0].k.k.p, i[1].k.k.p)) {
   190				skipped++;
   191				i->journal_seq = 0;
   192				continue;
   193			}
   194	
   195			if (write_locked &&
   196			    (iter.path->btree_id != i->btree ||
   197			     bpos_gt(i->k.k.p, iter.path->l[0].b->key.k.p))) {
   198				bch2_btree_node_unlock_write(trans, iter.path, iter.path->l[0].b);
   199				write_locked = false;
   200			}
   201	
   202			if (!iter.path || iter.path->btree_id != i->btree) {
   203				bch2_trans_iter_exit(trans, &iter);
   204				bch2_trans_iter_init(trans, &iter, i->btree, i->k.k.p,
   205						     BTREE_ITER_INTENT|BTREE_ITER_ALL_SNAPSHOTS);
   206			}
   207	
   208			bch2_btree_iter_set_pos(&iter, i->k.k.p);
   209			iter.path->preserve = false;
   210	
   211			do {
   212				ret = bch2_btree_write_buffer_flush_one(trans, &iter, i, 0,
   213									&write_locked, &fast);
   214				if (!write_locked)
   215					bch2_trans_begin(trans);
   216			} while (bch2_err_matches(ret, BCH_ERR_transaction_restart));
   217	
   218			if (ret == -BCH_ERR_journal_reclaim_would_deadlock) {
   219				slowpath++;
   220				continue;
   221			}
   222			if (ret)
   223				break;
   224	
   225			i->journal_seq = 0;
   226		}
   227	
   228		if (write_locked)
   229			bch2_btree_node_unlock_write(trans, iter.path, iter.path->l[0].b);
   230		bch2_trans_iter_exit(trans, &iter);
   231	
   232		trace_write_buffer_flush(trans, nr, skipped, fast, wb->size);
   233	
   234		if (slowpath)
   235			goto slowpath;
   236	
   237		bch2_fs_fatal_err_on(ret, c, "%s: insert error %s", __func__, bch2_err_str(ret));
   238	out:
   239		bch2_journal_pin_drop(j, &pin);
   240		mutex_unlock(&wb->flush_lock);
   241		return ret;
   242	slowpath:
   243		trace_and_count(c, write_buffer_flush_slowpath, trans, slowpath, nr);
   244	
   245		/*
   246		 * Now sort the rest by journal seq and bump the journal pin as we go.
   247		 * The slowpath zapped the seq of keys that were successfully flushed so
   248		 * we can skip those here.
   249		 */
   250		sort(keys, nr, sizeof(keys[0]),
   251		     btree_write_buffered_journal_cmp,
   252		     NULL);
   253	
   254		for (i = keys; i < keys + nr; i++) {
   255			if (!i->journal_seq)
   256				continue;
   257	
   258			bch2_journal_pin_update(j, i->journal_seq, &pin,
   259				      bch2_btree_write_buffer_journal_flush);
   260	
   261			ret = commit_do(trans, NULL, NULL,
 > 262					BCH_WATERMARK_reclaim|
   263					BCH_TRANS_COMMIT_no_check_rw|
   264					BCH_TRANS_COMMIT_no_enospc|
   265					BCH_TRANS_COMMIT_no_journal_res|
   266					BCH_TRANS_COMMIT_journal_reclaim,
   267					btree_write_buffered_insert(trans, i));
   268			if (bch2_fs_fatal_err_on(ret, c, "%s: insert error %s", __func__, bch2_err_str(ret)))
   269				break;
   270		}
   271	
   272		goto out;
   273	}
   274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
