Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D596E34252C;
	Mon, 22 Jun 2026 17:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782150870; cv=none; b=d6IykgZvDuq2EMQV4cs5iGp5bqmj7rGhy6lZSiWMRF+yIV9XUXhbUqmhuYXSYFPnJ/GkxUJnZbW6ttiZTXQ1ew+vKMeoMIctShU4YJFiArqZ8xjJSIQeila/PVnEhQYuXaUjDubC6sBxtMl2kMLfhXCo+W8heIUWizjiGfXfpIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782150870; c=relaxed/simple;
	bh=AlNnN2FawhFZ0ePrVFJHbOVc7lSn8rdJQCTI06vynVE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j24AOyLlJtmY/JmIEjwzhLvPnEvd69fJbDkBtPOcCHzMau0eFVxz8bObrPGXAvpB0fvL5avlsMe6vVu9dbgu9JTjV0pvFKuky4Fmq/4dOLdroip6aAW+NAeEEUJ5cy4YNUBvFqErhXjgM9ae5oIBLzzwQ+RdfnF/hAtMFDAgOr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C8JP4Iv8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C8JP4Iv8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782150869; x=1813686869;
  h=date:from:to:cc:subject:message-id;
  bh=AlNnN2FawhFZ0ePrVFJHbOVc7lSn8rdJQCTI06vynVE=;
  b=C8JP4Iv8hgVkID0/IcEvVuTdyEIoqRh74I4ddsPa0GTdy1f3idppYgpB
   aeHsVo5A/czPkcgq8yLHwmmxFVzxjAk2VZWf9gGsa64ofj9R/midj4o8u
   yHfePgmdcppkjFtnDhY3TN7SPkdtr45ktTu0DdA+LDAFOe3rSecVWSmIP
   kwOUDy9lWEbEePWfzx9yHxJP+TSlN8gYAUOd9LxUql2+R7vjop5rj9L2s
   sNVSx7qHoSMD2OhIfC9ikHYUKJrO2wgaTdG0WI1+kjNLM2MTDh/ocPdS9
   ACIBD6ZoLAh5LpTfKV/nIlEkvPzhkttWbMvwa6uTuDFIAkfbrxnOj0Qpe
   g==;
X-CSE-ConnectionGUID: STwlrsOCRyWK7M29R3ZGtA==
X-CSE-MsgGUID: T10TJErlRgi1tO0cV9saRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="94386553"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="94386553"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 10:54:29 -0700
X-CSE-ConnectionGUID: 7i/7P049SUCraTtG7coA5A==
X-CSE-MsgGUID: geo7jJkjQg6I2bucdUgwUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="246948922"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 22 Jun 2026 10:54:26 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbiqm-000000001f0-1zL6;
	Mon, 22 Jun 2026 17:54:24 +0000
Date: Tue, 23 Jun 2026 01:48:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 35/95]
 fs/bcachefs/alloc/foreground.c:560:2: warning: label followed by a
 declaration is a C23 extension
Message-ID: <202606230132.MsodX56Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   ca944a61e079450f82be88c91e349638c75cf4b6
commit: ca284ad06b139fe4dc8f053ada179473c1b71bb1 [35/95] bcachefs: alloc: filter spurious freelist_wait wakes on the waiter side
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260623/202606230132.MsodX56Z-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project a9b492db3d50683e446cd1a5c9ffaf4e92cb77a7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230132.MsodX56Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230132.MsodX56Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/alloc/foreground.c:560:2: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     560 |         u32 wake_counter_snapshot = atomic_read(&ca->alloc_wake_counter);
         |         ^
   1 warning generated.


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
   647		alloc_trace_add(req, ca->dev_idx, ret, wake_counter_snapshot);
   648	
   649		return ob;
   650	}
   651	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
