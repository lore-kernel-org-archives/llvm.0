Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D75927B347;
	Thu, 23 Oct 2025 09:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761211072; cv=none; b=qVjGlDjwR4wU2U9kZ23TAgdfwbUb/t3C+7W/HfNcAWKk9Cf4TGXDvV83VNXgk6HyiiG7qqKnCIXSl5xEFK+dcTCHrKb9ObfcSgfPUV4swhFcS3F+YPITMZoOGHnXoPVfUqkU2nJj1V0FjlJ7B1AywMi4e7k/73UgFRBpJXlJkdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761211072; c=relaxed/simple;
	bh=8fDxK7IJbLk6W/nj6/k7CRd/vX5OM1gDwrZaCNY2L9E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E0MN87+4FXceyU5PyZy1TkMPPA71dtmwY+S48eoi+x0CYuhxffUPahfBdwRQ9DKtWvkL8GK12NPy7/PWBHweVbXbXw4kWdCHqtciszd3OF+JhotH7MEFl8oL6Q8wDkHLoc3gb4afHpv8p4jAfrY3CxfJl013/pjVK83/hEcc3Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jxzrV9RK; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jxzrV9RK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761211071; x=1792747071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8fDxK7IJbLk6W/nj6/k7CRd/vX5OM1gDwrZaCNY2L9E=;
  b=jxzrV9RKBClxhguGzrV8JgfpbYAI1giN9VHXkwSq+6+7oX484OVQQPR0
   jFGRffFFRZm237k9euXzK6xIzRZDJU6FZzXmKZzxRacF8BNLPwiWxEadC
   RD8LgAoB94xx7TrQu8kP65Xx4V/JQKW5T4xdPRJ4YqaaQbmCtwETgtluL
   90RoghfxfwB7LwE7ko6TEXqDZypGwAeRhZluaAPoejC1ihYQ8sKncYTVb
   /61vyLNKdK+2uuIFe6jYHPQoSbjS+DZo6DPzkxpZvtR2dTs8hb2UDD2c6
   UdsbopE6mTYm/MPR4pZV//1M0dIXQfYOt8czHqsMDT7BGS18mDV7mIKxi
   A==;
X-CSE-ConnectionGUID: MqWyUQwvRJG2aR0hbDVSgA==
X-CSE-MsgGUID: lp9JceEgQYCyyiHw3EUvfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86001575"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="86001575"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 02:17:49 -0700
X-CSE-ConnectionGUID: 3P+AzLb2TlGVOk9nbpdJjw==
X-CSE-MsgGUID: 7nSvZPT9Rm2kG4t26XBajA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="188400887"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 23 Oct 2025 02:17:46 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBrS2-000DHB-2M;
	Thu, 23 Oct 2025 09:17:43 +0000
Date: Thu, 23 Oct 2025 17:16:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 616/639]
 fs/bcachefs/btree/commit.c:717:4: error: call to undeclared function
 '__WARN'; ISO C99 and later do not support implicit function declarations
Message-ID: <202510231728.B7tME22w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   9cf2b75e5d1fb8dae9b931b6fd89c90f7c2d3afe
commit: aed4fab12bad84894df626b9255385ac6e7545e1 [616/639] bcachefs: BCH_FSCK_ERR_validate_error_in_commit
config: x86_64-buildonly-randconfig-005-20251023 (https://download.01.org/0day-ci/archive/20251023/202510231728.B7tME22w-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510231728.B7tME22w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510231728.B7tME22w-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/btree/commit.c:717:4: error: call to undeclared function '__WARN'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     717 |                         __WARN();
         |                         ^
   fs/bcachefs/btree/commit.c:731:4: error: call to undeclared function '__WARN'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     731 |                         __WARN();
         |                         ^
   2 errors generated.


vim +/__WARN +717 fs/bcachefs/btree/commit.c

   590	
   591	static inline int
   592	bch2_trans_commit_write_locked(struct btree_trans *trans,
   593				       enum bch_trans_commit_flags flags,
   594				       struct btree_insert_entry **stopped_at,
   595				       unsigned long trace_ip)
   596	{
   597		struct bch_fs *c = trans->c;
   598		struct btree_trans_commit_hook *h;
   599		unsigned u64s = 0;
   600		int ret = 0;
   601	
   602		bch2_trans_verify_not_unlocked_or_in_restart(trans);
   603	#if 0
   604		/* todo: bring back dynamic fault injection */
   605		if (race_fault()) {
   606			trace_and_count(c, trans_restart_fault_inject, trans, trace_ip);
   607			return btree_trans_restart(trans, BCH_ERR_transaction_restart_fault_inject);
   608		}
   609	#endif
   610		/*
   611		 * Check if the insert will fit in the leaf node with the write lock
   612		 * held, otherwise another thread could write the node changing the
   613		 * amount of space available:
   614		 */
   615	
   616		prefetch(&trans->c->journal.flags);
   617	
   618		trans_for_each_update(trans, i) {
   619			/* Multiple inserts might go to same leaf: */
   620			if (!same_leaf_as_prev(trans, i))
   621				u64s = 0;
   622	
   623			u64s += i->k->k.u64s;
   624			ret = !i->cached
   625				? btree_key_can_insert(trans, insert_l(trans, i)->b, u64s)
   626				: btree_key_can_insert_cached(trans, flags, trans->paths + i->path, u64s);
   627			if (ret) {
   628				*stopped_at = i;
   629				return ret;
   630			}
   631	
   632			i->k->k.needs_whiteout = false;
   633		}
   634	
   635		/*
   636		 * Don't get journal reservation until after we know insert will
   637		 * succeed:
   638		 */
   639		if (likely(!(flags & BCH_TRANS_COMMIT_no_journal_res))) {
   640			try(bch2_trans_journal_res_get(trans,
   641					(flags & BCH_WATERMARK_MASK)|
   642					JOURNAL_RES_GET_NONBLOCK));
   643	
   644			if (unlikely(trans->journal_transaction_names))
   645				journal_transaction_name(trans);
   646		}
   647	
   648		/*
   649		 * Not allowed to fail after we've gotten our journal reservation - we
   650		 * have to use it:
   651		 */
   652	
   653		if (IS_ENABLED(CONFIG_BCACHEFS_DEBUG) &&
   654		    !(flags & BCH_TRANS_COMMIT_no_journal_res)) {
   655			if (static_branch_unlikely(&bch2_journal_seq_verify))
   656				trans_for_each_update(trans, i)
   657					i->k->k.bversion.lo = trans->journal_res.seq;
   658			else if (static_branch_unlikely(&bch2_inject_invalid_keys))
   659				trans_for_each_update(trans, i)
   660					i->k->k.bversion = MAX_VERSION;
   661		}
   662	
   663		h = trans->hooks;
   664		while (h) {
   665			try(h->fn(trans, h));
   666			h = h->next;
   667		}
   668	
   669		struct bkey_i *accounting;
   670	
   671		scoped_guard(percpu_read, &c->mark_lock)
   672			for (accounting = btree_trans_subbuf_base(trans, &trans->accounting);
   673			     accounting != btree_trans_subbuf_top(trans, &trans->accounting);
   674			     accounting = bkey_next(accounting)) {
   675				ret = bch2_accounting_trans_commit_hook(trans,
   676							bkey_i_to_accounting(accounting), flags);
   677				if (unlikely(ret)) {
   678					for (struct bkey_i *i = btree_trans_subbuf_base(trans, &trans->accounting);
   679					     i != accounting;
   680					     i = bkey_next(i))
   681						bch2_accounting_trans_commit_revert(trans, bkey_i_to_accounting(i), flags);
   682					return ret;
   683				}
   684			}
   685	
   686		/* XXX: we only want to run this if deltas are nonzero */
   687		bch2_trans_account_disk_usage_change(trans);
   688	
   689		trans_for_each_update(trans, i)
   690			if (btree_node_type_has_atomic_triggers(i->bkey_type)) {
   691				ret = run_one_mem_trigger(trans, i, BTREE_TRIGGER_atomic|i->flags);
   692				if (bch2_fs_fatal_err_on(ret, c, "fatal error in transaction commit: %s", bch2_err_str(ret)))
   693					return ret;
   694			}
   695	
   696		if (unlikely(c->gc_pos.phase)) {
   697			ret = bch2_trans_commit_run_gc_triggers(trans);
   698			if (bch2_fs_fatal_err_on(ret, c, "fatal error in transaction commit: %s", bch2_err_str(ret)))
   699				return ret;
   700		}
   701	
   702		struct bkey_validate_context validate_context = { .from	= BKEY_VALIDATE_commit };
   703	
   704		if (!(flags & BCH_TRANS_COMMIT_no_journal_res))
   705			validate_context.flags = BCH_VALIDATE_write|BCH_VALIDATE_commit;
   706	
   707		for (struct jset_entry *i = btree_trans_journal_entries_start(trans);
   708		     i != btree_trans_journal_entries_top(trans);
   709		     i = vstruct_next(i)) {
   710			ret = bch2_journal_entry_validate(c, NULL, i,
   711							  bcachefs_metadata_version_current,
   712							  CPU_BIG_ENDIAN, validate_context);
   713			if (unlikely(ret)) {
   714				bch2_trans_inconsistent(trans, "invalid journal entry on insert from %s\n",
   715							trans->fn);
   716				bch2_sb_error_count(c, BCH_FSCK_ERR_validate_error_in_commit);
 > 717				__WARN();
   718				return ret;
   719			}
   720		}
   721	
   722		trans_for_each_update(trans, i) {
   723			validate_context.level	= i->level;
   724			validate_context.btree	= i->btree_id;
   725	
   726			ret = bch2_bkey_validate(c, bkey_i_to_s_c(i->k), validate_context);
   727			if (unlikely(ret)){
   728				bch2_trans_inconsistent(trans, "invalid bkey on insert from %s -> %ps\n",
   729							trans->fn, (void *) i->ip_allocated);
   730				bch2_sb_error_count(c, BCH_FSCK_ERR_validate_error_in_commit);
   731				__WARN();
   732				return ret;
   733			}
   734			btree_insert_entry_checks(trans, i);
   735		}
   736	
   737		if (likely(!(flags & BCH_TRANS_COMMIT_no_journal_res))) {
   738			struct journal *j = &c->journal;
   739			struct jset_entry *entry;
   740	
   741			trans_for_each_update(trans, i) {
   742				if (i->key_cache_already_flushed)
   743					continue;
   744	
   745				if (i->flags & BTREE_UPDATE_nojournal)
   746					continue;
   747	
   748				verify_update_old_key(trans, i);
   749	
   750				if (trans->journal_transaction_names) {
   751					entry = bch2_journal_add_entry(j, &trans->journal_res,
   752							       BCH_JSET_ENTRY_overwrite,
   753							       i->btree_id, i->level,
   754							       i->old_k.u64s);
   755					bkey_reassemble((struct bkey_i *) entry->start,
   756							(struct bkey_s_c) { &i->old_k, i->old_v });
   757				}
   758	
   759				entry = bch2_journal_add_entry(j, &trans->journal_res,
   760						       BCH_JSET_ENTRY_btree_keys,
   761						       i->btree_id, i->level,
   762						       i->k->k.u64s);
   763				bkey_copy((struct bkey_i *) entry->start, i->k);
   764			}
   765	
   766			memcpy_u64s_small(journal_res_entry(&c->journal, &trans->journal_res),
   767					  btree_trans_journal_entries_start(trans),
   768					  trans->journal_entries.u64s);
   769	
   770			EBUG_ON(trans->journal_res.u64s < trans->journal_entries.u64s);
   771	
   772			trans->journal_res.offset	+= trans->journal_entries.u64s;
   773			trans->journal_res.u64s		-= trans->journal_entries.u64s;
   774	
   775			if (trans->accounting.u64s)
   776				memcpy_u64s_small(bch2_journal_add_entry(j, &trans->journal_res,
   777								BCH_JSET_ENTRY_write_buffer_keys,
   778								BTREE_ID_accounting, 0,
   779								trans->accounting.u64s)->_data,
   780						  btree_trans_subbuf_base(trans, &trans->accounting),
   781						  trans->accounting.u64s);
   782	
   783			if (trans->journal_seq)
   784				*trans->journal_seq = trans->journal_res.seq;
   785		}
   786	
   787		trans_for_each_update(trans, i) {
   788			struct btree_path *path = trans->paths + i->path;
   789	
   790			if (!i->cached)
   791				bch2_btree_insert_key_leaf(trans, path, i->k, trans->journal_res.seq);
   792			else if (!i->key_cache_already_flushed)
   793				bch2_btree_insert_key_cached(trans, flags, i);
   794			else
   795				bch2_btree_key_cache_drop(trans, path);
   796		}
   797	
   798		return 0;
   799	}
   800	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
