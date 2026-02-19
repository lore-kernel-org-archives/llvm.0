Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAD923D7FD;
	Thu, 19 Feb 2026 04:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771476333; cv=none; b=p36W3k44VLMQwZ6ZCA9MVyFRCfczdrw6GMD7Sa1qg+XK7jVYDFwm1zSCcXl94hQ3YzP3CjbaUMRxMJrxgHZlggVyLmfu91nJ+M1AP4rhjyCMNRVrDom0+k7dJnzAVbh2GzCCUVjuFY27V2phDAsPIVA8mX03VpEQSXtCLGqbvlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771476333; c=relaxed/simple;
	bh=ViVu70pg5P474sP/TX6OmYrloh4nl6hZ2ybwAhsbUeQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z5RIZY/U4ZbQwzvHaxEfL1YePLdRlrB2LNDSfaXQowzAWxDH/nzj8ithh+vcL0G/yNirkCOVdHBH+D//F3bouyyoO1EgiJ7QLYuIEWwKg4oX0BSI/p6IdE1ilL7TEaOMFf8GUJwQC8e8LbuKv92JVxW54zsv6uMDFJIWlIWuZdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jk+3koeb; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jk+3koeb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771476332; x=1803012332;
  h=date:from:to:cc:subject:message-id;
  bh=ViVu70pg5P474sP/TX6OmYrloh4nl6hZ2ybwAhsbUeQ=;
  b=jk+3koebRx07amwqOS+lgVyZ0n0QlaTG8zesKEPnkvgN6Whs8pN5+DjS
   Ai2Y2asSFo7uFbyMpAKvksmIPy1qUVaVshLlhOg/UTTN/zTeTUJ6ADJhZ
   3W0hsHaCyh+nnEPtlBFvWYqVilnknvumHIOJV2oR0nNwloneYBaOi5pum
   mHRsc5Z5Zb179keDocAm9L6fOB3NGu8kkDnJ4bVn0UvR+mD5TIInrAjML
   Zn65cRdOJX6QK88KB8l0oVcOFuZ0SerJUKehi8M7YiLljeXwIS78jTbjJ
   oURfaBYGCIuVbFyIBEBtoQ9A/tBS6stkKcW4+86ENKtpDJ2EyANuw7eLr
   g==;
X-CSE-ConnectionGUID: xSIToeIxR2qGMmcKp3bTeA==
X-CSE-MsgGUID: cXkjPzMWQyinrvKgyaZNAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="76394041"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="76394041"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 20:45:31 -0800
X-CSE-ConnectionGUID: 9Zf6xYP4QwmWuIDu7R31SQ==
X-CSE-MsgGUID: M6Q6/wrMSji6pSowBKOb0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="237390325"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Feb 2026 20:45:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsvug-000000012xY-1UXG;
	Thu, 19 Feb 2026 04:45:18 +0000
Date: Thu, 19 Feb 2026 12:45:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 404/405]
 fs/bcachefs/alloc/background.c:811:5: warning: format specifies type
 'unsigned int' but the argument has type '__u64' (aka 'unsigned long long')
Message-ID: <202602191218.C8PZpcL4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   3d8e2e3e57fe808ecc7fd11e9bbe1d2894116cf9
commit: 85cde1245a273a5b44dbb108f98d51c77468d730 [404/405] bcachefs: alloc trigger: convert BUG_ON to fsck_err for bucket going empty while not open
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260219/202602191218.C8PZpcL4-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602191218.C8PZpcL4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602191218.C8PZpcL4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/alloc/background.c:811:5: warning: format specifies type 'unsigned int' but the argument has type '__u64' (aka 'unsigned long long') [-Wformat]
     810 |                                 "bucket %u:%llu going empty but not open\n%s",
         |                                         ~~
         |                                         %llu
     811 |                                 new.k->p.inode, new.k->p.offset,
         |                                 ^~~~~~~~~~~~~~
   fs/bcachefs/init/error.h:145:16: note: expanded from macro 'log_fsck_err_on'
     145 |                 log_fsck_err(__VA_ARGS__);                              \
         |                              ^~~~~~~~~~~
   fs/bcachefs/init/error.h:139:44: note: expanded from macro 'log_fsck_err'
     139 |         __fsck_err(c, FSCK_CAN_IGNORE, _err_type, __VA_ARGS__)
         |                                                   ^~~~~~~~~~~
   fs/bcachefs/init/error.h:110:54: note: expanded from macro '__fsck_err'
     110 | #define __fsck_err(...)         fsck_err_wrap(bch2_fsck_err(__VA_ARGS__))
         |                                                             ^~~~~~~~~~~
   fs/bcachefs/init/error.h:93:38: note: expanded from macro 'bch2_fsck_err'
      93 |                         _flags, BCH_FSCK_ERR_##_err_type, __VA_ARGS__)
         |                                                           ^~~~~~~~~~~
   fs/bcachefs/init/error.h:100:13: note: expanded from macro 'fsck_err_wrap'
     100 |         int _ret = _do;                                                 \
         |                    ^~~
   1 warning generated.


vim +811 fs/bcachefs/alloc/background.c

   770	
   771	int bch2_trigger_alloc(struct btree_trans *trans,
   772			       enum btree_id btree, unsigned level,
   773			       struct bkey_s_c old, struct bkey_s new,
   774			       enum btree_iter_update_trigger_flags flags)
   775	{
   776		struct bch_fs *c = trans->c;
   777		int ret = 0;
   778	
   779		CLASS(bch2_dev_bucket_tryget, ca)(c, new.k->p);
   780		if (!ca)
   781			return bch_err_throw(c, trigger_alloc);
   782	
   783		struct bch_alloc_v4 old_a_convert;
   784		const struct bch_alloc_v4 *old_a = bch2_alloc_to_v4(old, &old_a_convert);
   785	
   786		struct bch_alloc_v4 *new_a;
   787		if (likely(new.k->type == KEY_TYPE_alloc_v4)) {
   788			new_a = bkey_s_to_alloc_v4(new).v;
   789		} else {
   790			BUG_ON(!(flags & (BTREE_TRIGGER_gc|BTREE_TRIGGER_check_repair)));
   791	
   792			struct bkey_i_alloc_v4 *new_ka =
   793				errptr_try(bch2_alloc_to_v4_mut_inlined(trans, new.s_c));
   794			new_a = &new_ka->v;
   795		}
   796	
   797		if (flags & BTREE_TRIGGER_transactional) {
   798			alloc_data_type_set(new_a, new_a->data_type);
   799	
   800			int is_empty_delta = (int) data_type_is_empty(new_a->data_type) -
   801					     (int) data_type_is_empty(old_a->data_type);
   802	
   803			if (is_empty_delta < 0 &&
   804			    (new_a->data_type != BCH_DATA_sb &&
   805			     new_a->data_type != BCH_DATA_journal) &&
   806			    !bch2_bucket_is_open_safe(c, new.k->p.inode, new.k->p.offset)) {
   807				CLASS(printbuf, buf)();
   808				log_fsck_err_on(true, trans,
   809					alloc_key_bucket_nonempty_to_empty_not_open,
   810					"bucket %u:%llu going empty but not open\n%s",
 > 811					new.k->p.inode, new.k->p.offset,
   812					(bch2_bkey_val_to_text(&buf, c, new.s_c), buf.buf));
   813			}
   814	
   815			if (is_empty_delta < 0) {
   816				new_a->io_time[READ] = bch2_current_io_time(c, READ);
   817				new_a->io_time[WRITE]= bch2_current_io_time(c, WRITE);
   818				SET_BCH_ALLOC_V4_NEED_INC_GEN(new_a, true);
   819				SET_BCH_ALLOC_V4_NEED_DISCARD(new_a, true);
   820			}
   821	
   822			if (data_type_is_empty(new_a->data_type) &&
   823			    BCH_ALLOC_V4_NEED_INC_GEN(new_a) &&
   824			    !bch2_bucket_is_open_safe(c, new.k->p.inode, new.k->p.offset)) {
   825				if (new_a->oldest_gen == new_a->gen &&
   826				    !bch2_bucket_sectors_total(*new_a))
   827					new_a->oldest_gen++;
   828				new_a->gen++;
   829				SET_BCH_ALLOC_V4_NEED_INC_GEN(new_a, false);
   830				alloc_data_type_set(new_a, new_a->data_type);
   831			}
   832	
   833			if (old_a->data_type != new_a->data_type ||
   834			    (new_a->data_type == BCH_DATA_free &&
   835			     alloc_freespace_genbits(*old_a) != alloc_freespace_genbits(*new_a))) {
   836				try(bch2_bucket_do_index(trans, ca, old, old_a, false));
   837				try(bch2_bucket_do_index(trans, ca, new.s_c, new_a, true));
   838			}
   839	
   840			if (new_a->data_type == BCH_DATA_cached &&
   841			    !new_a->io_time[READ])
   842				new_a->io_time[READ] = bch2_current_io_time(c, READ);
   843	
   844			try(bch2_lru_change(trans, new.k->p.inode,
   845					    bucket_to_u64(new.k->p),
   846					    alloc_lru_idx_read(*old_a),
   847					    alloc_lru_idx_read(*new_a)));
   848	
   849			try(bch2_lru_change(trans,
   850					    BCH_LRU_BUCKET_FRAGMENTATION,
   851					    bucket_to_u64(new.k->p),
   852					    alloc_lru_idx_fragmentation(*old_a, ca),
   853					    alloc_lru_idx_fragmentation(*new_a, ca)));
   854	
   855			if (old_a->gen != new_a->gen)
   856				try(bch2_bucket_gen_update(trans, new.k->p, new_a->gen));
   857	
   858			try(bch2_alloc_key_to_dev_counters(trans, ca, old_a, new_a, flags));
   859		}
   860	
   861		if ((flags & BTREE_TRIGGER_atomic) && (flags & BTREE_TRIGGER_insert)) {
   862			u64 transaction_seq = trans->journal_res.seq;
   863			BUG_ON(!transaction_seq);
   864	
   865			CLASS(printbuf, buf)();
   866			if (log_fsck_err_on(transaction_seq && new_a->journal_seq_nonempty > transaction_seq,
   867					    trans, alloc_key_journal_seq_in_future,
   868					    "bucket journal seq in future (currently at %llu)\n%s",
   869					    journal_cur_seq(&c->journal),
   870					    (bch2_bkey_val_to_text(&buf, c, new.s_c), buf.buf)))
   871				new_a->journal_seq_nonempty = transaction_seq;
   872	
   873			int is_empty_delta = (int) data_type_is_empty(new_a->data_type) -
   874					     (int) data_type_is_empty(old_a->data_type);
   875	
   876			/*
   877			 * Record journal sequence number of empty -> nonempty transition:
   878			 * Note that there may be multiple empty -> nonempty
   879			 * transitions, data in a bucket may be overwritten while we're
   880			 * still writing to it - so be careful to only record the first:
   881			 * */
   882			if (is_empty_delta < 0 &&
   883			    new_a->journal_seq_empty <= c->journal.flushed_seq_ondisk) {
   884				new_a->journal_seq_nonempty	= transaction_seq;
   885				new_a->journal_seq_empty	= 0;
   886			}
   887	
   888			/*
   889			 * Bucket becomes empty: mark it as waiting for a journal flush,
   890			 * unless updates since empty -> nonempty transition were never
   891			 * flushed - we may need to ask the journal not to flush
   892			 * intermediate sequence numbers:
   893			 */
   894			if (is_empty_delta > 0) {
   895				if (new_a->journal_seq_nonempty == transaction_seq ||
   896				    bch2_journal_noflush_seq(&c->journal,
   897							     new_a->journal_seq_nonempty,
   898							     transaction_seq)) {
   899					new_a->journal_seq_nonempty = new_a->journal_seq_empty = 0;
   900				} else {
   901					new_a->journal_seq_empty = transaction_seq;
   902	
   903					ret = bch2_set_bucket_needs_journal_commit(&c->buckets_waiting_for_journal,
   904										   c->journal.flushed_seq_ondisk,
   905										   new.k->p.inode, new.k->p.offset,
   906										   transaction_seq);
   907					if (bch2_fs_fatal_err_on(ret, c,
   908							"setting bucket_needs_journal_commit: %s",
   909							bch2_err_str(ret)))
   910						return ret;
   911				}
   912			}
   913	
   914			if (new_a->gen != old_a->gen) {
   915				guard(rcu)();
   916				u8 *gen = bucket_gen(ca, new.k->p.offset);
   917				if (unlikely(!gen))
   918					return inval_bucket_key(trans, new.s_c);
   919				*gen = new_a->gen;
   920			}
   921	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
