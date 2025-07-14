Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD66277807;
	Mon, 14 Jul 2025 22:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752533377; cv=none; b=Zxwi63RCQpNRf1ZHUBddWKI0WpVzK1HRpRuuT/olSLcEaqLru2TPoMGMcECvzIG+qDvn+MLbC2Gpcvj5dgPCwCF817vCbt1mn8U2KUDpAr7b2CCnQEY4YZdRhISYdU3P4tzCDihnwQ7Kx4BtlWgwoH3A/qSXN3tsYTw5sbTAnsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752533377; c=relaxed/simple;
	bh=xMhquiMNXYA4qNuP4WJC9dTpaKh9sNSzqg71Fxfs/Jw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o12EDyz2442AnyaSFPt/Q//NAVuXJze/KGkXeRVOqrTcda7i1brnjvSG9zX/EI0goOqlIvJ1pisT8qRgdV90U0APvXpuBIZoTrBHHGXxbR2KDUjiNTsztBvFq3j041yQUUTU030Y2WXPyWY3v8Zek7WHWAHR+N25Gwwf3FBC8XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jX08VfR4; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jX08VfR4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752533375; x=1784069375;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xMhquiMNXYA4qNuP4WJC9dTpaKh9sNSzqg71Fxfs/Jw=;
  b=jX08VfR4ELcee8gNT2vetkbKVsY4QFWQusX/kcfQLyEnezYSVYixEB2Z
   /wxKqCHTSn8MbsaiWlOJFWWDaHrQnMAvwg19j1amHR9M9cNNHER0tBB++
   yQxlpbLR9Z0QwZNXoWYntNezJdykEQ6+xMrJ9s77/MF4+CST3b10eg1w3
   P0ixW9V2p/Si57jw0N1q4cjs5gs7JwzCQoFapS6CynjUtMcW5/U0L/ryp
   fQDgWrIaQCLFLjZDDV/FuEvpQ8VlKcu4I492qDpckkz2GKBYpPWhQiXTk
   oKz7vK0UmNNU4/J8eXP7jf2mKa3x0fbNis0CZPiNKXf8owmtZrn7JHwdC
   w==;
X-CSE-ConnectionGUID: Rr+VzptPTFe5taqqDcZPJQ==
X-CSE-MsgGUID: h0VQtTMNTaa6WpeiUYCAeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="80180648"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="80180648"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 15:49:32 -0700
X-CSE-ConnectionGUID: ArIpu08zTSa1vkROVr6w8A==
X-CSE-MsgGUID: SPxMwcLQTmSFlWvK7wTFgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="161069988"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Jul 2025 15:49:31 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubRzF-0009Q3-1K;
	Mon, 14 Jul 2025 22:49:29 +0000
Date: Tue, 15 Jul 2025 06:48:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 141/167]
 fs/bcachefs/disk_accounting.c:827:5: error: cannot jump from this goto
 statement to its label
Message-ID: <202507150642.s3bnqd64-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   682a2b74b475e6c88226463a4679ec820c56a29e
commit: 32533d15f20474ef9cc6c8e39d1914124037d85c [141/167] bcachefs: convert disk_accounting.c to CLASS/guards
config: arm-randconfig-001-20250715 (https://download.01.org/0day-ci/archive/20250715/202507150642.s3bnqd64-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 16534d19bf50bde879a83f0ae62875e2c5120e64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250715/202507150642.s3bnqd64-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507150642.s3bnqd64-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/disk_accounting.c:827:5: error: cannot jump from this goto statement to its label
     827 |                                 goto err;
         |                                 ^
   fs/bcachefs/disk_accounting.c:834:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     834 |         guard(percpu_write)(&c->mark_lock);
         |         ^
   include/linux/cleanup.h:338:15: note: expanded from macro 'guard'
     338 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:168:1: note: expanded from here
     168 | __UNIQUE_ID_guard460
         | ^
   fs/bcachefs/disk_accounting.c:788:3: error: cannot jump from this goto statement to its label
     788 |                 goto err;
         |                 ^
   fs/bcachefs/disk_accounting.c:834:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     834 |         guard(percpu_write)(&c->mark_lock);
         |         ^
   include/linux/cleanup.h:338:15: note: expanded from macro 'guard'
     338 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:168:1: note: expanded from here
     168 | __UNIQUE_ID_guard460
         | ^
   2 errors generated.


vim +827 fs/bcachefs/disk_accounting.c

19773ec997201a Kent Overstreet 2024-10-07  733  
1d16c605cc55ef Kent Overstreet 2023-11-09  734  /*
1d16c605cc55ef Kent Overstreet 2023-11-09  735   * At startup time, initialize the in memory accounting from the btree (and
1d16c605cc55ef Kent Overstreet 2023-11-09  736   * journal)
1d16c605cc55ef Kent Overstreet 2023-11-09  737   */
1d16c605cc55ef Kent Overstreet 2023-11-09  738  int bch2_accounting_read(struct bch_fs *c)
1d16c605cc55ef Kent Overstreet 2023-11-09  739  {
2574e95a8b78ef Kent Overstreet 2024-06-06  740  	struct bch_accounting_mem *acc = &c->accounting;
32533d15f20474 Kent Overstreet 2025-07-14  741  	CLASS(btree_trans, trans)(c);
32533d15f20474 Kent Overstreet 2025-07-14  742  	CLASS(printbuf, buf)();
1d16c605cc55ef Kent Overstreet 2023-11-09  743  
b71d89bd7b1fbe Kent Overstreet 2024-11-24  744  	/*
b71d89bd7b1fbe Kent Overstreet 2024-11-24  745  	 * We might run more than once if we rewind to start topology repair or
b71d89bd7b1fbe Kent Overstreet 2024-11-24  746  	 * btree node scan - and those might cause us to get different results,
b71d89bd7b1fbe Kent Overstreet 2024-11-24  747  	 * so we can't just skip if we've already run.
b71d89bd7b1fbe Kent Overstreet 2024-11-24  748  	 *
b71d89bd7b1fbe Kent Overstreet 2024-11-24  749  	 * Instead, zero out any accounting we have:
b71d89bd7b1fbe Kent Overstreet 2024-11-24  750  	 */
32533d15f20474 Kent Overstreet 2025-07-14  751  	scoped_guard(percpu_write, &c->mark_lock) {
b71d89bd7b1fbe Kent Overstreet 2024-11-24  752  		darray_for_each(acc->k, e)
b71d89bd7b1fbe Kent Overstreet 2024-11-24  753  			percpu_memset(e->v[0], 0, sizeof(u64) * e->nr_counters);
b71d89bd7b1fbe Kent Overstreet 2024-11-24  754  		for_each_member_device(c, ca)
b71d89bd7b1fbe Kent Overstreet 2024-11-24  755  			percpu_memset(ca->usage, 0, sizeof(*ca->usage));
b71d89bd7b1fbe Kent Overstreet 2024-11-24  756  		percpu_memset(c->usage, 0, sizeof(*c->usage));
32533d15f20474 Kent Overstreet 2025-07-14  757  	}
b71d89bd7b1fbe Kent Overstreet 2024-11-24  758  
ba9752e5f43637 Kent Overstreet 2024-11-29  759  	struct btree_iter iter;
ba9752e5f43637 Kent Overstreet 2024-11-29  760  	bch2_trans_iter_init(trans, &iter, BTREE_ID_accounting, POS_MIN,
ba9752e5f43637 Kent Overstreet 2024-11-29  761  			     BTREE_ITER_prefetch|BTREE_ITER_all_snapshots);
ba9752e5f43637 Kent Overstreet 2024-11-29  762  	iter.flags &= ~BTREE_ITER_with_journal;
ba9752e5f43637 Kent Overstreet 2024-11-29  763  	int ret = for_each_btree_key_continue(trans, iter,
1d16c605cc55ef Kent Overstreet 2023-11-09  764  				BTREE_ITER_prefetch|BTREE_ITER_all_snapshots, k, ({
1d16c605cc55ef Kent Overstreet 2023-11-09  765  			struct bkey u;
1d16c605cc55ef Kent Overstreet 2023-11-09  766  			struct bkey_s_c k = bch2_btree_path_peek_slot_exact(btree_iter_path(trans, &iter), &u);
44a43cf9fdccc3 Kent Overstreet 2024-12-05  767  
44a43cf9fdccc3 Kent Overstreet 2024-12-05  768  			if (k.k->type != KEY_TYPE_accounting)
44a43cf9fdccc3 Kent Overstreet 2024-12-05  769  				continue;
44a43cf9fdccc3 Kent Overstreet 2024-12-05  770  
44a43cf9fdccc3 Kent Overstreet 2024-12-05  771  			struct disk_accounting_pos acc_k;
44a43cf9fdccc3 Kent Overstreet 2024-12-05  772  			bpos_to_disk_accounting_pos(&acc_k, k.k->p);
44a43cf9fdccc3 Kent Overstreet 2024-12-05  773  
ba9752e5f43637 Kent Overstreet 2024-11-29  774  			if (acc_k.type >= BCH_DISK_ACCOUNTING_TYPE_NR)
ba9752e5f43637 Kent Overstreet 2024-11-29  775  				break;
ba9752e5f43637 Kent Overstreet 2024-11-29  776  
62095464e9d2a2 Kent Overstreet 2025-04-17  777  			if (!bch2_accounting_is_mem(&acc_k)) {
393a05a7413aa3 Kent Overstreet 2025-03-29  778  				struct disk_accounting_pos next;
393a05a7413aa3 Kent Overstreet 2025-03-29  779  				memset(&next, 0, sizeof(next));
393a05a7413aa3 Kent Overstreet 2025-03-29  780  				next.type = acc_k.type + 1;
9180ad2e161b70 Kent Overstreet 2025-03-21  781  				bch2_btree_iter_set_pos(trans, &iter, disk_accounting_pos_to_bpos(&next));
44a43cf9fdccc3 Kent Overstreet 2024-12-05  782  				continue;
ba9752e5f43637 Kent Overstreet 2024-11-29  783  			}
44a43cf9fdccc3 Kent Overstreet 2024-12-05  784  
a850bde6498b46 Kent Overstreet 2024-02-08  785  			accounting_read_key(trans, k);
a850bde6498b46 Kent Overstreet 2024-02-08  786  		}));
1d16c605cc55ef Kent Overstreet 2023-11-09  787  	if (ret)
1d16c605cc55ef Kent Overstreet 2023-11-09  788  		goto err;
1d16c605cc55ef Kent Overstreet 2023-11-09  789  
1d16c605cc55ef Kent Overstreet 2023-11-09  790  	struct journal_keys *keys = &c->journal_keys;
2e8d686a4a13c0 Kent Overstreet 2024-06-04  791  	struct journal_key *dst = keys->data;
1d16c605cc55ef Kent Overstreet 2023-11-09  792  	move_gap(keys, keys->nr);
2e8d686a4a13c0 Kent Overstreet 2024-06-04  793  
1d16c605cc55ef Kent Overstreet 2023-11-09  794  	darray_for_each(*keys, i) {
1d16c605cc55ef Kent Overstreet 2023-11-09  795  		if (i->k->k.type == KEY_TYPE_accounting) {
44a43cf9fdccc3 Kent Overstreet 2024-12-05  796  			struct disk_accounting_pos acc_k;
44a43cf9fdccc3 Kent Overstreet 2024-12-05  797  			bpos_to_disk_accounting_pos(&acc_k, i->k->k.p);
44a43cf9fdccc3 Kent Overstreet 2024-12-05  798  
62095464e9d2a2 Kent Overstreet 2025-04-17  799  			if (!bch2_accounting_is_mem(&acc_k))
44a43cf9fdccc3 Kent Overstreet 2024-12-05  800  				continue;
44a43cf9fdccc3 Kent Overstreet 2024-12-05  801  
1d16c605cc55ef Kent Overstreet 2023-11-09  802  			struct bkey_s_c k = bkey_i_to_s_c(i->k);
1d16c605cc55ef Kent Overstreet 2023-11-09  803  			unsigned idx = eytzinger0_find(acc->k.data, acc->k.nr,
1d16c605cc55ef Kent Overstreet 2023-11-09  804  						sizeof(acc->k.data[0]),
1d16c605cc55ef Kent Overstreet 2023-11-09  805  						accounting_pos_cmp, &k.k->p);
1d16c605cc55ef Kent Overstreet 2023-11-09  806  
1d16c605cc55ef Kent Overstreet 2023-11-09  807  			bool applied = idx < acc->k.nr &&
cf49f8a8c277f9 Kent Overstreet 2024-09-26  808  				bversion_cmp(acc->k.data[idx].bversion, k.k->bversion) >= 0;
1d16c605cc55ef Kent Overstreet 2023-11-09  809  
1d16c605cc55ef Kent Overstreet 2023-11-09  810  			if (applied)
1d16c605cc55ef Kent Overstreet 2023-11-09  811  				continue;
1d16c605cc55ef Kent Overstreet 2023-11-09  812  
2e8d686a4a13c0 Kent Overstreet 2024-06-04  813  			if (i + 1 < &darray_top(*keys) &&
2e8d686a4a13c0 Kent Overstreet 2024-06-04  814  			    i[1].k->k.type == KEY_TYPE_accounting &&
2e8d686a4a13c0 Kent Overstreet 2024-06-04  815  			    !journal_key_cmp(i, i + 1)) {
9773547b16b1e1 Kent Overstreet 2024-09-27  816  				WARN_ON(bversion_cmp(i[0].k->k.bversion, i[1].k->k.bversion) >= 0);
2e8d686a4a13c0 Kent Overstreet 2024-06-04  817  
2e8d686a4a13c0 Kent Overstreet 2024-06-04  818  				i[1].journal_seq = i[0].journal_seq;
2e8d686a4a13c0 Kent Overstreet 2024-06-04  819  
2e8d686a4a13c0 Kent Overstreet 2024-06-04  820  				bch2_accounting_accumulate(bkey_i_to_accounting(i[1].k),
2e8d686a4a13c0 Kent Overstreet 2024-06-04  821  							   bkey_s_c_to_accounting(k));
2e8d686a4a13c0 Kent Overstreet 2024-06-04  822  				continue;
2e8d686a4a13c0 Kent Overstreet 2024-06-04  823  			}
2e8d686a4a13c0 Kent Overstreet 2024-06-04  824  
a850bde6498b46 Kent Overstreet 2024-02-08  825  			ret = accounting_read_key(trans, k);
1d16c605cc55ef Kent Overstreet 2023-11-09  826  			if (ret)
1d16c605cc55ef Kent Overstreet 2023-11-09 @827  				goto err;
1d16c605cc55ef Kent Overstreet 2023-11-09  828  		}
2e8d686a4a13c0 Kent Overstreet 2024-06-04  829  
2e8d686a4a13c0 Kent Overstreet 2024-06-04  830  		*dst++ = *i;
1d16c605cc55ef Kent Overstreet 2023-11-09  831  	}
2e8d686a4a13c0 Kent Overstreet 2024-06-04  832  	keys->gap = keys->nr = dst - keys->data;
1d16c605cc55ef Kent Overstreet 2023-11-09  833  
32533d15f20474 Kent Overstreet 2025-07-14  834  	guard(percpu_write)(&c->mark_lock);
9104fc1928704e Kent Overstreet 2024-09-25  835  
8dabb19ff4b802 Kent Overstreet 2024-12-03  836  	darray_for_each_reverse(acc->k, i) {
19773ec997201a Kent Overstreet 2024-10-07  837  		struct disk_accounting_pos acc_k;
8dabb19ff4b802 Kent Overstreet 2024-12-03  838  		bpos_to_disk_accounting_pos(&acc_k, i->pos);
9104fc1928704e Kent Overstreet 2024-09-25  839  
19773ec997201a Kent Overstreet 2024-10-07  840  		u64 v[BCH_ACCOUNTING_MAX_COUNTERS];
8dabb19ff4b802 Kent Overstreet 2024-12-03  841  		memset(v, 0, sizeof(v));
8dabb19ff4b802 Kent Overstreet 2024-12-03  842  
8dabb19ff4b802 Kent Overstreet 2024-12-03  843  		for (unsigned j = 0; j < i->nr_counters; j++)
8dabb19ff4b802 Kent Overstreet 2024-12-03  844  			v[j] = percpu_u64_get(i->v[0] + j);
9104fc1928704e Kent Overstreet 2024-09-25  845  
431312b59cf54f Kent Overstreet 2024-09-25  846  		/*
19773ec997201a Kent Overstreet 2024-10-07  847  		 * If the entry counters are zeroed, it should be treated as
19773ec997201a Kent Overstreet 2024-10-07  848  		 * nonexistent - it might point to an invalid device.
19773ec997201a Kent Overstreet 2024-10-07  849  		 *
19773ec997201a Kent Overstreet 2024-10-07  850  		 * Remove it, so that if it's re-added it gets re-marked in the
19773ec997201a Kent Overstreet 2024-10-07  851  		 * superblock:
431312b59cf54f Kent Overstreet 2024-09-25  852  		 */
8dabb19ff4b802 Kent Overstreet 2024-12-03  853  		ret = bch2_is_zero(v, sizeof(v[0]) * i->nr_counters)
19773ec997201a Kent Overstreet 2024-10-07  854  			? -BCH_ERR_remove_disk_accounting_entry
62095464e9d2a2 Kent Overstreet 2025-04-17  855  			: bch2_disk_accounting_validate_late(trans, &acc_k, v, i->nr_counters);
19773ec997201a Kent Overstreet 2024-10-07  856  
19773ec997201a Kent Overstreet 2024-10-07  857  		if (ret == -BCH_ERR_remove_disk_accounting_entry) {
8dabb19ff4b802 Kent Overstreet 2024-12-03  858  			free_percpu(i->v[0]);
8dabb19ff4b802 Kent Overstreet 2024-12-03  859  			free_percpu(i->v[1]);
8dabb19ff4b802 Kent Overstreet 2024-12-03  860  			darray_remove_item(&acc->k, i);
19773ec997201a Kent Overstreet 2024-10-07  861  			ret = 0;
431312b59cf54f Kent Overstreet 2024-09-25  862  			continue;
19773ec997201a Kent Overstreet 2024-10-07  863  		}
431312b59cf54f Kent Overstreet 2024-09-25  864  
431312b59cf54f Kent Overstreet 2024-09-25  865  		if (ret)
431312b59cf54f Kent Overstreet 2024-09-25  866  			goto fsck_err;
9104fc1928704e Kent Overstreet 2024-09-25  867  	}
9104fc1928704e Kent Overstreet 2024-09-25  868  
8dabb19ff4b802 Kent Overstreet 2024-12-03  869  	eytzinger0_sort(acc->k.data, acc->k.nr, sizeof(acc->k.data[0]),
8dabb19ff4b802 Kent Overstreet 2024-12-03  870  			accounting_pos_cmp, NULL);
8dabb19ff4b802 Kent Overstreet 2024-12-03  871  
32533d15f20474 Kent Overstreet 2025-07-14  872  	scoped_guard(preempt) {
8bb8d683a4013f Kent Overstreet 2023-12-27  873  		struct bch_fs_usage_base *usage = this_cpu_ptr(c->usage);
1d16c605cc55ef Kent Overstreet 2023-11-09  874  
1d16c605cc55ef Kent Overstreet 2023-11-09  875  		for (unsigned i = 0; i < acc->k.nr; i++) {
1d16c605cc55ef Kent Overstreet 2023-11-09  876  			struct disk_accounting_pos k;
1d16c605cc55ef Kent Overstreet 2023-11-09  877  			bpos_to_disk_accounting_pos(&k, acc->k.data[i].pos);
1d16c605cc55ef Kent Overstreet 2023-11-09  878  
1d16c605cc55ef Kent Overstreet 2023-11-09  879  			u64 v[BCH_ACCOUNTING_MAX_COUNTERS];
2574e95a8b78ef Kent Overstreet 2024-06-06  880  			bch2_accounting_mem_read_counters(acc, i, v, ARRAY_SIZE(v), false);
1d16c605cc55ef Kent Overstreet 2023-11-09  881  
1d16c605cc55ef Kent Overstreet 2023-11-09  882  			switch (k.type) {
1d16c605cc55ef Kent Overstreet 2023-11-09  883  			case BCH_DISK_ACCOUNTING_persistent_reserved:
1d16c605cc55ef Kent Overstreet 2023-11-09  884  				usage->reserved += v[0] * k.persistent_reserved.nr_replicas;
1d16c605cc55ef Kent Overstreet 2023-11-09  885  				break;
1d16c605cc55ef Kent Overstreet 2023-11-09  886  			case BCH_DISK_ACCOUNTING_replicas:
1d16c605cc55ef Kent Overstreet 2023-11-09  887  				fs_usage_data_type_to_base(usage, k.replicas.data_type, v[0]);
1d16c605cc55ef Kent Overstreet 2023-11-09  888  				break;
18dad454cd16cb Kent Overstreet 2025-05-24  889  			case BCH_DISK_ACCOUNTING_dev_data_type: {
18dad454cd16cb Kent Overstreet 2025-05-24  890  				guard(rcu)();
a7ecd5f2ccabb9 Kent Overstreet 2024-11-24  891  				struct bch_dev *ca = bch2_dev_rcu_noerror(c, k.dev_data_type.dev);
f5095b9f85a167 Kent Overstreet 2024-01-01  892  				if (ca) {
f5095b9f85a167 Kent Overstreet 2024-01-01  893  					struct bch_dev_usage_type __percpu *d = &ca->usage->d[k.dev_data_type.data_type];
f5095b9f85a167 Kent Overstreet 2024-01-01  894  					percpu_u64_set(&d->buckets,	v[0]);
f5095b9f85a167 Kent Overstreet 2024-01-01  895  					percpu_u64_set(&d->sectors,	v[1]);
f5095b9f85a167 Kent Overstreet 2024-01-01  896  					percpu_u64_set(&d->fragmented,	v[2]);
f5095b9f85a167 Kent Overstreet 2024-01-01  897  
f5095b9f85a167 Kent Overstreet 2024-01-01  898  					if (k.dev_data_type.data_type == BCH_DATA_sb ||
f5095b9f85a167 Kent Overstreet 2024-01-01  899  					    k.dev_data_type.data_type == BCH_DATA_journal)
f5095b9f85a167 Kent Overstreet 2024-01-01  900  						usage->hidden += v[0] * ca->mi.bucket_size;
f5095b9f85a167 Kent Overstreet 2024-01-01  901  				}
f5095b9f85a167 Kent Overstreet 2024-01-01  902  				break;
1d16c605cc55ef Kent Overstreet 2023-11-09  903  			}
1d16c605cc55ef Kent Overstreet 2023-11-09  904  			}
18dad454cd16cb Kent Overstreet 2025-05-24  905  		}
32533d15f20474 Kent Overstreet 2025-07-14  906  	}
9104fc1928704e Kent Overstreet 2024-09-25  907  fsck_err:
1d16c605cc55ef Kent Overstreet 2023-11-09  908  err:
1d16c605cc55ef Kent Overstreet 2023-11-09  909  	bch_err_fn(c, ret);
1d16c605cc55ef Kent Overstreet 2023-11-09  910  	return ret;
1d16c605cc55ef Kent Overstreet 2023-11-09  911  }
1d16c605cc55ef Kent Overstreet 2023-11-09  912  

:::::: The code at line 827 was first introduced by commit
:::::: 1d16c605cc55ef26f0c65b362665a6c99080ccbc bcachefs: Disk space accounting rewrite

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
