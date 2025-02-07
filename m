Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F9C23C8C7;
	Fri,  7 Feb 2025 22:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738968623; cv=none; b=F3mkNFCheguve9lFBp+JDC+MLn5DVl3wsrTh/gmvSiLkI03DRzaZZviDeXAKplHELwSnQLqIdmS93CEXGGXqXoTq8UFbF7KAM8s7wSzke5zELm1ng8wus78jqtjg+swhLuAVsBk9+ohF1mnSFJJnbBx8Ku0RE8bOOq83/pUTssQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738968623; c=relaxed/simple;
	bh=Rywow2VJHbUjqGlzct/KBtLKpCyad14t3+Sp4fnvnng=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PnQ7LjqCjiX+YpXKsjFsZ895p78pcs43ceqYngQhtSrqAfI60FL70xDSzcoe808RsbNMN4zVSI2PcKXAk65wAfQc4ZGIpSStRxeFpasjOABYTs2kp6Srzhzy+MdxEIWoZnU86UInByuUjVxW7g2Z5agwrwiRZAJYU+17FeNAo8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kJLb6/uB; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kJLb6/uB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738968621; x=1770504621;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rywow2VJHbUjqGlzct/KBtLKpCyad14t3+Sp4fnvnng=;
  b=kJLb6/uBzIr1BkudAYQ99sbbkwTzT9IXr4kHlfQC3A4gwGMA/b0mWKav
   Vz1JmorUgkOBOH2OEKdHyZWqo2dMadsDnQW/66/ahl+zKBAPQmKLMmPdi
   pReq6QabsJ5ARIL5IUCsQ0FvRsxqjmNzh4QtxgCjQQPT8bHJG1J9ItTkF
   jAC539YgNh1rWvustSsO6X7XCHKc7tqTzkLzOVviX/v/uWeAZ4i2v3oUh
   TMf8J9Wl3iuHFPETHZs+LO51fh3d9/Uh0cdUEje4KPTNhuTlZ8QbY7zC5
   vtkTPyiLEwyzdkMAZwvvd7mGzmEgDV/4oPjlDGvzDWffRuElXhx1xPbvg
   w==;
X-CSE-ConnectionGUID: lUDO6/4OSAe4f3JyS0ppAA==
X-CSE-MsgGUID: lGYXehirTwOMczoCn23MkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="49862104"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="49862104"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 14:50:20 -0800
X-CSE-ConnectionGUID: Fzk086L5SAW0dWNr78r0dQ==
X-CSE-MsgGUID: gjTR0XvlRAqjOjFK6x4m3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116251474"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Feb 2025 14:50:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgXAu-000z93-2c;
	Fri, 07 Feb 2025 22:50:16 +0000
Date: Sat, 8 Feb 2025 06:49:53 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea Gelmini <andrea.gelmini@gelma.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:pr/739 1/1]
 fs/bcachefs/btree_key_cache.c:149:7: error: use of undeclared identifier
 'PF_MEMALLOC_NORECLAIM'
Message-ID: <202502080600.dIbMsRzU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs pr/739
head:   8fd3bb46913c536490fe0c180ce57dc1c0d630ba
commit: 8fd3bb46913c536490fe0c180ce57dc1c0d630ba [1/1] Fix typos
config: i386-buildonly-randconfig-005-20250208 (https://download.01.org/0day-ci/archive/20250208/202502080600.dIbMsRzU-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502080600.dIbMsRzU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502080600.dIbMsRzU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/btree_key_cache.c:149:7: error: use of undeclared identifier 'PF_MEMALLOC_NORECLAIM'
     149 |         ck = allocate_dropping_locks(trans, ret,
         |              ^
   fs/bcachefs/btree_iter.h:900:37: note: expanded from macro 'allocate_dropping_locks'
     900 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                            ^
>> fs/bcachefs/btree_key_cache.c:149:7: error: use of undeclared identifier 'PF_MEMALLOC_NOWARN'
   fs/bcachefs/btree_iter.h:900:59: note: expanded from macro 'allocate_dropping_locks'
     900 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                                                  ^
   fs/bcachefs/btree_key_cache.c:245:26: error: use of undeclared identifier 'PF_MEMALLOC_NORECLAIM'
     245 |                 struct bkey_i *new_k = allocate_dropping_locks(trans, ret,
         |                                        ^
   fs/bcachefs/btree_iter.h:900:37: note: expanded from macro 'allocate_dropping_locks'
     900 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                            ^
   fs/bcachefs/btree_key_cache.c:245:26: error: use of undeclared identifier 'PF_MEMALLOC_NOWARN'
   fs/bcachefs/btree_iter.h:900:59: note: expanded from macro 'allocate_dropping_locks'
     900 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                                                  ^
   4 errors generated.
--
>> fs/bcachefs/btree_cache.c:834:24: error: use of undeclared identifier 'PF_MEMALLOC_NORECLAIM'; did you mean 'KMALLOC_RECLAIM'?
     834 |         if (memalloc_flags_do(PF_MEMALLOC_NORECLAIM,
         |                               ^~~~~~~~~~~~~~~~~~~~~
         |                               KMALLOC_RECLAIM
   fs/bcachefs/btree_iter.h:882:46: note: expanded from macro 'memalloc_flags_do'
     882 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^
   include/linux/slab.h:609:2: note: 'KMALLOC_RECLAIM' declared here
     609 |         KMALLOC_RECLAIM,
         |         ^
   1 error generated.
--
>> fs/bcachefs/ec.c:950:9: error: use of undeclared identifier 'PF_MEMALLOC_NORECLAIM'
     950 |         return allocate_dropping_locks_errcode(trans,
         |                ^
   fs/bcachefs/btree_iter.h:890:31: note: expanded from macro 'allocate_dropping_locks_errcode'
     890 |         int _ret = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                      ^
>> fs/bcachefs/ec.c:950:9: error: use of undeclared identifier 'PF_MEMALLOC_NOWARN'
   fs/bcachefs/btree_iter.h:890:53: note: expanded from macro 'allocate_dropping_locks_errcode'
     890 |         int _ret = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                                            ^
   2 errors generated.


vim +/PF_MEMALLOC_NORECLAIM +149 fs/bcachefs/btree_key_cache.c

d2cb6b219d3728 Kent Overstreet 2024-06-08  134  
2ca88e5ad9b296 Kent Overstreet 2019-03-07  135  static struct bkey_cached *
d2cb6b219d3728 Kent Overstreet 2024-06-08  136  bkey_cached_alloc(struct btree_trans *trans, struct btree_path *path, unsigned key_u64s)
2ca88e5ad9b296 Kent Overstreet 2019-03-07  137  {
5f1929f1f077d3 Kent Overstreet 2024-06-13  138  	struct bch_fs *c = trans->c;
5f1929f1f077d3 Kent Overstreet 2024-06-13  139  	struct btree_key_cache *bc = &c->btree_key_cache;
3d21d48e898a2e Kent Overstreet 2022-09-03  140  	bool pcpu_readers = btree_uses_pcpu_readers(path->btree_id);
6c36318cc702f0 Kent Overstreet 2023-01-07  141  	int ret;
8f7f566f5774d3 Kent Overstreet 2022-06-17  142  
5f1929f1f077d3 Kent Overstreet 2024-06-13  143  	struct bkey_cached *ck = container_of_or_null(
5f1929f1f077d3 Kent Overstreet 2024-06-13  144  				rcu_pending_dequeue(&bc->pending[pcpu_readers]),
5f1929f1f077d3 Kent Overstreet 2024-06-13  145  				struct bkey_cached, rcu);
5f1929f1f077d3 Kent Overstreet 2024-06-13  146  	if (ck)
5f1929f1f077d3 Kent Overstreet 2024-06-13  147  		goto lock;
5f1929f1f077d3 Kent Overstreet 2024-06-13  148  
5f1929f1f077d3 Kent Overstreet 2024-06-13 @149  	ck = allocate_dropping_locks(trans, ret,
8fd3bb46913c53 Andrea Gelmini  2024-12-22  150  				     __bkey_cached_alloc(key_u64s));
6c36318cc702f0 Kent Overstreet 2023-01-07  151  	if (ret) {
d2cb6b219d3728 Kent Overstreet 2024-06-08  152  		if (ck)
d2cb6b219d3728 Kent Overstreet 2024-06-08  153  			kfree(ck->k);
6c36318cc702f0 Kent Overstreet 2023-01-07  154  		kmem_cache_free(bch2_key_cache, ck);
6c36318cc702f0 Kent Overstreet 2023-01-07  155  		return ERR_PTR(ret);
6c36318cc702f0 Kent Overstreet 2023-01-07  156  	}
6c36318cc702f0 Kent Overstreet 2023-01-07  157  
5f1929f1f077d3 Kent Overstreet 2024-06-13  158  	if (ck) {
0d2234a79e877b Kent Overstreet 2023-05-20  159  		bch2_btree_lock_init(&ck->c, pcpu_readers ? SIX_LOCK_INIT_PCPU : 0);
4e6defd106b69c Kent Overstreet 2022-08-31  160  		ck->c.cached = true;
5f1929f1f077d3 Kent Overstreet 2024-06-13  161  		goto lock;
5f1929f1f077d3 Kent Overstreet 2024-06-13  162  	}
5f1929f1f077d3 Kent Overstreet 2024-06-13  163  
5f1929f1f077d3 Kent Overstreet 2024-06-13  164  	ck = container_of_or_null(rcu_pending_dequeue_from_all(&bc->pending[pcpu_readers]),
5f1929f1f077d3 Kent Overstreet 2024-06-13  165  				  struct bkey_cached, rcu);
5f1929f1f077d3 Kent Overstreet 2024-06-13  166  	if (ck)
5f1929f1f077d3 Kent Overstreet 2024-06-13  167  		goto lock;
5f1929f1f077d3 Kent Overstreet 2024-06-13  168  lock:
5f1929f1f077d3 Kent Overstreet 2024-06-13  169  	six_lock_intent(&ck->c.lock, NULL, NULL);
5f1929f1f077d3 Kent Overstreet 2024-06-13  170  	six_lock_write(&ck->c.lock, NULL, NULL);
125907203cc902 Kent Overstreet 2020-11-19  171  	return ck;
125907203cc902 Kent Overstreet 2020-11-19  172  }
2ca88e5ad9b296 Kent Overstreet 2019-03-07  173  

:::::: The code at line 149 was first introduced by commit
:::::: 5f1929f1f077d3997ab8cd4a8136aad304b0e9df bcachefs: key cache can now allocate from pending

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
