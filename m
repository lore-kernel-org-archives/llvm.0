Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111D117BA6;
	Tue,  5 May 2026 02:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777948154; cv=none; b=YIeqLeKWeq8R3X5l8lwbXhXZXWEkM7/EeXTqLUb7x43yDW7kIgtlcnQVvvFfpad3ChNoSGCs1tflHR0ZdnhqLP9ftyMGJN4kHjZtYr1lTXEZdPyDbIDDR3izdbSwat8DoR3pHQsyto3Ff9uPhQtny+rgGbk/llWw4WD/R0wQvIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777948154; c=relaxed/simple;
	bh=xMDOpFuV/QpjXQueUurBsSOm/lhLbfdmda63ejEJYAE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pUNn36NKuLM6Se3RzcIqePDNjEJuzecJOTK6XSxcD/IoIVKazMLsUFltb3BBLMYs/DQOFxTjXfHKy9iWN58VMe8TsdwczDdrxhdBfmFe1jVNSYAKhUKhhxbzwFEBLZK+3yMI8CRc7X9+CcJVtW+Y2QY822kBdDyg1B1XCwP8ZcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MhMPt4Xm; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MhMPt4Xm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777948152; x=1809484152;
  h=date:from:to:cc:subject:message-id;
  bh=xMDOpFuV/QpjXQueUurBsSOm/lhLbfdmda63ejEJYAE=;
  b=MhMPt4XmIOBnh6BxZV0t0seRzP2BDTy+LPSSjbVEnGkpZKXYP4Tbz3St
   ryN5ntJOcDthmNdHlnMPNNSD3QSNw8gfwj8Rbf097QZiOy2CbrTXq9a68
   3L2UfygpGEUl0pIgPNo51V+x3hNfDr/b1IqZbMfIWEaEpCbtlaWCTsht4
   U1NEJkFa0tU3PgU0slu3jWyTiLzfWLWyO9qgYP4L6wYCQmhUpqIUJ5WZk
   ceoyowA1SEqEaF8HzsyrCWqMpJjDihgZbnq5ijqbqF+mCGw8FVESpsWrN
   AL0P7XaGTHXy2izQXI2i8/QYOSWY2qHBxP7H/jXiNk77L7SQBAn2NJUv+
   A==;
X-CSE-ConnectionGUID: NBQjQrU/TLaA9CVFrVyPLQ==
X-CSE-MsgGUID: +7jf3PNrSAm8c6eoRKuUuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="89400893"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="89400893"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 19:29:11 -0700
X-CSE-ConnectionGUID: bEVthhVtTe+wf//B6RT/qw==
X-CSE-MsgGUID: AofikJ2HT9a918LimDaH8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="232546923"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 May 2026 19:29:09 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wK5Ww-000000004AT-11ty;
	Tue, 05 May 2026 02:29:03 +0000
Date: Tue, 05 May 2026 10:28:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 35/95]
 fs/bcachefs/alloc/foreground.c:560:2: error: expected expression
Message-ID: <202605051042.0qptLM0O-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   8f7020ecb925b9ea9413ac31dd0d2078e99f92cf
commit: ca284ad06b139fe4dc8f053ada179473c1b71bb1 [35/95] bcachefs: alloc: filter spurious freelist_wait wakes on the waiter side
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260505/202605051042.0qptLM0O-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605051042.0qptLM0O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605051042.0qptLM0O-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/alloc/foreground.c:560:2: error: expected expression
           u32 wake_counter_snapshot = atomic_read(&ca->alloc_wake_counter);
           ^
>> fs/bcachefs/alloc/foreground.c:647:41: error: use of undeclared identifier 'wake_counter_snapshot'
           alloc_trace_add(req, ca->dev_idx, ret, wake_counter_snapshot);
                                                  ^
   2 errors generated.


vim +560 fs/bcachefs/alloc/foreground.c

   540	
   541	/**
   542	 * bch2_bucket_alloc_trans - allocate a single bucket from a specific device
   543	 * @trans:	transaction object
   544	 * @req:	state for the entire allocation
   545	 *
   546	 * Returns:	an open_bucket on success, or an ERR_PTR() on failure.
   547	 */
   548	static struct open_bucket *bch2_bucket_alloc_trans(struct btree_trans *trans,
   549							   struct alloc_request *req)
   550	{
   551		struct bch_fs *c = trans->c;
   552		struct bch_dev *ca = req->ca;
   553		struct open_bucket *ob = NULL;
   554		bool freespace = READ_ONCE(ca->mi.freespace_initialized);
   555		bool waiting = false;
   556	
   557		req->btree_bitmap = req->data_type == BCH_DATA_btree;
   558		memset(&req->counters, 0, sizeof(req->counters));
   559	again:
 > 560		u32 wake_counter_snapshot = atomic_read(&ca->alloc_wake_counter);
   561		bch2_dev_usage_read_fast(ca, &req->usage);
   562		u64 avail = __dev_buckets_free(ca, req->usage, req->watermark);
   563	
   564		if (req->usage.buckets[BCH_DATA_need_discard] >
   565		    min(avail, ca->mi.nbuckets >> 7))
   566			bch2_do_discards_async(c);
   567	
   568		if (req->usage.buckets[BCH_DATA_need_gc_gens] > avail)
   569			bch2_gc_gens_async(c);
   570	
   571		if (should_invalidate_buckets(ca, req->usage))
   572			bch2_dev_do_invalidates(ca);
   573	
   574		if (!avail) {
   575			if (req->watermark > BCH_WATERMARK_normal &&
   576			    c->recovery.pass_done < BCH_RECOVERY_PASS_check_allocations)
   577				goto alloc;
   578	
   579			if (bch2_copygc_can_make_progress(ca)) {
   580				req->copygc_can_make_progress = true;
   581				bch2_copygc_wakeup(c);
   582			}
   583	
   584			track_event_change(&c->times[BCH_TIME_blocked_allocate], true);
   585	
   586			if (req->cl &&
   587			    !(req->flags & BCH_WRITE_alloc_nowait) &&
   588			    !req->will_retry_target_devices &&
   589			    !req->will_retry_all_devices &&
   590			    !req->will_retry_set_devices) {
   591				if ((!req->copygc_can_make_progress ||
   592				     req->watermark == BCH_WATERMARK_copygc) &&
   593				    (req->nr_effective || (req->devs_have && req->devs_have->nr))) {
   594					ob = ERR_PTR(bch_err_throw(c, bucket_alloc_no_progress));
   595				} else if (!waiting) {
   596					closure_wait(&c->allocator.freelist_wait, req->cl);
   597					waiting = true;
   598					goto again;
   599				} else {
   600					ob = ERR_PTR(bch_err_throw(c, bucket_alloc_blocked));
   601				}
   602			} else {
   603				ob = ERR_PTR(bch_err_throw(c, freelist_empty));
   604			}
   605	
   606			goto err;
   607		}
   608	
   609		if (waiting)
   610			bch2_alloc_wake_dev(ca);
   611	alloc:
   612		ob = likely(freespace)
   613			? bch2_bucket_alloc_freelist(trans, req)
   614			: bch2_bucket_alloc_early(trans, req);
   615	
   616		if (!ob && req->btree_bitmap != BTREE_BITMAP_ANY) {
   617			req->btree_bitmap = BTREE_BITMAP_ANY;
   618			goto alloc;
   619		}
   620	
   621		if (!ob && freespace && c->recovery.pass_done < BCH_RECOVERY_PASS_check_alloc_info) {
   622			freespace = false;
   623			goto alloc;
   624		}
   625	err:
   626		if (!ob)
   627			ob = ERR_PTR(bch_err_throw(c, no_buckets_found));
   628	
   629		int ret = PTR_ERR_OR_ZERO(ob);
   630	
   631		if (!ret) {
   632			ob->data_type = req->data_type;
   633	
   634			event_inc_trace(c, bucket_alloc, buf,
   635				bucket_alloc_to_text(&buf, c, req, ob));
   636		} else if (bch2_err_matches(ret, BCH_ERR_open_buckets_empty) ||
   637			   bch2_err_matches(ret, BCH_ERR_open_bucket_alloc_blocked)) {
   638			event_inc_trace(c, open_bucket_alloc_fail, buf,
   639				bch2_fs_open_buckets_to_text(&buf, c));
   640		} else if (!bch2_err_matches(ret, BCH_ERR_transaction_restart) &&
   641			   !req->will_retry_target_devices &&
   642			   !req->will_retry_all_devices &&
   643			   !req->will_retry_set_devices)
   644			event_inc_trace(c, bucket_alloc_fail, buf,
   645				bucket_alloc_to_text(&buf, c, req, ob));
   646	
 > 647		alloc_trace_add(req, ca->dev_idx, ret, wake_counter_snapshot);
   648	
   649		return ob;
   650	}
   651	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
