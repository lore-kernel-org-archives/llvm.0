Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FE31E4AB;
	Thu, 26 Jun 2025 02:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750904173; cv=none; b=Q7OgKW7H4vijYHS6HZN6YXmt7Gv4fYMMrBnCxKgD4lgDbhOoB8cJmVLzHa3NIUTOLojPAZGWGjPNEEOxDtXdZ0tvD1T0GjuIbwbGe+octda8tuAH+QoA3G7bODN9/eSmdOtOvUNXzivNiozhhO1uaaxcJ+KSV1Tda5yT0V5PBbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750904173; c=relaxed/simple;
	bh=HW4kJu00ATOOKDuRlaHxblQzg2A8enScdoULXJJc274=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AZI9oJpKdYRvbHr3FlLOuoJojS1QUA5hNNKEMFVzq3yEnVT+IQVj1THmxwk3EV7cXypVkgaAIQf12BthoVXZmOrtHu9qBiSiSnnqTRbsj2j3PVk04qid2ZomQmy0M9pIjjrA6o4zFN7Z08qMHedenZd5QxKBWTDlVlUq6WSrHQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IPfhUJw5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IPfhUJw5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750904171; x=1782440171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HW4kJu00ATOOKDuRlaHxblQzg2A8enScdoULXJJc274=;
  b=IPfhUJw5jbWlzYYWkyW5HOV7J0tcrMSKJQH35lQUzbFIDR/Dlv549D7n
   AYURPQsf7maXqU7PE4s2EyrNXqFPhNAWa/gG0aH+xX1P/FizvLHAcDfkv
   fKAqkPA3WV+Wp0ZNGPkKkuGpujIo8ek7r23rmWKxaE228bo1/A2x8f9PE
   ZTC1uEmGIZbZBIzwQVp6u328QX5J+iGkRWZCfhKQ3TrxwrWNtjUXF4Lez
   k8jfnOp8+xWMB9qnE16JLYaZ28xtt9KSdEB/+N2MB+1GHBFs+5K6Mt0D+
   ygHerls2/kDIAAzzoO+1pm0FSzgzQsGbT1a5vihgLa1rdaMVSvjYkZZrp
   Q==;
X-CSE-ConnectionGUID: z0+3c8C0QqqZFGd8D4cepg==
X-CSE-MsgGUID: 8b8Hhdt1TRqCDvSX0+6i/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53156429"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="53156429"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 19:15:57 -0700
X-CSE-ConnectionGUID: C9sdGrsOSbyOWKnXQmqncA==
X-CSE-MsgGUID: T+kWdoLPR++8v78hiCutUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="176032595"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Jun 2025 19:15:55 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUc9Z-000TcE-1w;
	Thu, 26 Jun 2025 02:15:53 +0000
Date: Thu, 26 Jun 2025 10:15:52 +0800
From: kernel test robot <lkp@intel.com>
To: Alan Huang <mmpgouride@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [koverstreet-bcachefs:bcachefs-testing 63/80]
 fs/bcachefs/btree_iter.c:3333:8: warning: variable 'lock_dropped' set but
 not used
Message-ID: <202506261026.ZxtJ7yeV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   9b8def1f419439b6f2377b64b79255bf66fb0779
commit: adebee6063850d3ea25b14f75d9d5a4cd487a5ec [63/80] bcachefs: Refactor trans->mem allocation
config: x86_64-buildonly-randconfig-004-20250626 (https://download.01.org/0day-ci/archive/20250626/202506261026.ZxtJ7yeV-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250626/202506261026.ZxtJ7yeV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506261026.ZxtJ7yeV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/btree_iter.c:3333:8: warning: variable 'lock_dropped' set but not used [-Wunused-but-set-variable]
    3333 |                 bool lock_dropped = false;
         |                      ^
   1 warning generated.


vim +/lock_dropped +3333 fs/bcachefs/btree_iter.c

  3305	
  3306	/**
  3307	 * bch2_trans_begin() - reset a transaction after a interrupted attempt
  3308	 * @trans: transaction to reset
  3309	 *
  3310	 * Returns:	current restart counter, to be used with trans_was_restarted()
  3311	 *
  3312	 * While iterating over nodes or updating nodes a attempt to lock a btree node
  3313	 * may return BCH_ERR_transaction_restart when the trylock fails. When this
  3314	 * occurs bch2_trans_begin() should be called and the transaction retried.
  3315	 */
  3316	u32 bch2_trans_begin(struct btree_trans *trans)
  3317	{
  3318		struct btree_path *path;
  3319		unsigned i;
  3320		u64 now;
  3321	
  3322		bch2_trans_reset_updates(trans);
  3323	
  3324		trans->restart_count++;
  3325		trans->mem_top			= 0;
  3326	
  3327		if (unlikely(trans->restarted == BCH_ERR_transaction_restart_mem_realloced)) {
  3328			unsigned new_bytes = trans->realloc_bytes_required;
  3329			EBUG_ON(new_bytes > BTREE_TRANS_MEM_MAX);
  3330			EBUG_ON(!trans->mem);
  3331			EBUG_ON(!trans->mem_bytes);
  3332	
> 3333			bool lock_dropped = false;
  3334			void *new_mem = allocate_dropping_locks_norelock(trans, lock_dropped,
  3335						krealloc(trans->mem, new_bytes, _gfp));
  3336			if (!new_mem) {
  3337				new_mem = mempool_alloc(&trans->c->btree_trans_mem_pool, GFP_KERNEL);
  3338				new_bytes = BTREE_TRANS_MEM_MAX;
  3339				trans->used_mempool = true;
  3340				kfree(trans->mem);
  3341			}
  3342	
  3343			EBUG_ON(!new_mem);
  3344	
  3345			trans->mem = new_mem;
  3346			trans->mem_bytes = new_bytes;
  3347		}
  3348	
  3349		trans_for_each_path(trans, path, i) {
  3350			path->should_be_locked = false;
  3351	
  3352			/*
  3353			 * If the transaction wasn't restarted, we're presuming to be
  3354			 * doing something new: dont keep iterators excpt the ones that
  3355			 * are in use - except for the subvolumes btree:
  3356			 */
  3357			if (!trans->restarted && path->btree_id != BTREE_ID_subvolumes)
  3358				path->preserve = false;
  3359	
  3360			/*
  3361			 * XXX: we probably shouldn't be doing this if the transaction
  3362			 * was restarted, but currently we still overflow transaction
  3363			 * iterators if we do that
  3364			 */
  3365			if (!path->ref && !path->preserve)
  3366				__bch2_path_free(trans, i);
  3367			else
  3368				path->preserve = false;
  3369		}
  3370	
  3371		now = local_clock();
  3372	
  3373		if (!IS_ENABLED(CONFIG_BCACHEFS_NO_LATENCY_ACCT) &&
  3374		    time_after64(now, trans->last_begin_time + 10))
  3375			__bch2_time_stats_update(&btree_trans_stats(trans)->duration,
  3376						 trans->last_begin_time, now);
  3377	
  3378		if (!trans->restarted &&
  3379		    (need_resched() ||
  3380		     time_after64(now, trans->last_begin_time + BTREE_TRANS_MAX_LOCK_HOLD_TIME_NS))) {
  3381			bch2_trans_unlock(trans);
  3382			cond_resched();
  3383			now = local_clock();
  3384		}
  3385		trans->last_begin_time = now;
  3386	
  3387		if (unlikely(trans->srcu_held &&
  3388			     time_after(jiffies, trans->srcu_lock_time + msecs_to_jiffies(10))))
  3389			bch2_trans_srcu_unlock(trans);
  3390	
  3391		trans->last_begin_ip = _RET_IP_;
  3392	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
