Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D7026E6F4;
	Thu, 30 Oct 2025 16:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761840685; cv=none; b=iVzgoEANKQ15rh5B1eMDS3TqbuhLWEJrDsk09zhkzLwOtzGC6ha1zr1a2LKJyH6a+wRe0jk4h4iPElfQCTow45bQ3VUZCw4Jx+Z+WPFRNgGWLsVo9De2qSMOS7y0gBDEajjK3+H8chSKHWWiO+g5cArcU9bxnIE/Y5OV9drrp5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761840685; c=relaxed/simple;
	bh=PT7u8KWqn5FQdsLdcceeQOYD4kpNQUuZxjU7zmJ1lDU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e3RGOxMJegpZkmjr/PUHiX5RLaEjwEgnRrPLfJvu2JtVm+gyR4VRIlrXU8I1ItWAtWM5C7/VYPS/DclTPpG/VtkKULGamEqPssYlnzxzaIYGKTUnr07+Xp2xyK6sJIczbIMnrEI2tGWAWdR9V11Ob0qlwTsyrKcXEaMxK/I6Lao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V7Zvc8tf; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V7Zvc8tf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761840683; x=1793376683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PT7u8KWqn5FQdsLdcceeQOYD4kpNQUuZxjU7zmJ1lDU=;
  b=V7Zvc8tfLFSLlGxgnW3DwlXhku2uJtR0UbXp5e3Gj4DEM5hgeN/0KV3R
   ZaXc218vLJkiLG0LOQIXA54ueBL76WXz2lEtYS0iI3/a6w3KuKIaDwK3d
   vi9AZA3kt6gBo2x3QRVxcTirCG1TGtDrlFA+jaxv1lYf4bLVulAF/ZtCA
   ANHC3ORjQCSkPpJwYc1GKDOGzmSK5fPKoFOQOV17D0fbRbyzWDOnv0psn
   Kri7lsutCcJ/2b/sQFiLSlmJqOIjs/jKHIRyynbZzw96UZLlEdDxI7ztY
   azoF3Jj9wir/J8QaODDnEpebuWf3BPniH1F/5o976zcfpVFrJxrP9CRxJ
   Q==;
X-CSE-ConnectionGUID: hLK1crQfQJG5XrQ3Bt66Gg==
X-CSE-MsgGUID: v+asEf5UTtqePLlX1CLAhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63193017"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="63193017"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 09:11:22 -0700
X-CSE-ConnectionGUID: IJZZXrqnQH248qUuoBDHLg==
X-CSE-MsgGUID: IQVIzYgiSRCwlnp6Pg12xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="185654906"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 30 Oct 2025 09:11:21 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vEVF8-0000000013Q-2iAn;
	Thu, 30 Oct 2025 16:11:18 +0000
Date: Thu, 30 Oct 2025 17:10:57 +0100
From: kernel test robot <lkp@intel.com>
To: Martin KaFai Lau <martin.lau@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Martin KaFai Lau <martin.lau@linux.dev>
Subject: [martin-lau-bpf-next:ls.rqspin.v2.2 3/3]
 kernel/bpf/bpf_local_storage.c:497:29: warning: variable 'owner_storage_ptr'
 set but not used
Message-ID: <202510301735.G36o9EqL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/martin.lau/bpf-next.git ls.rqspin.v2.2
head:   b735af227349c9ef167cae8acf8bc8864e13f636
commit: b735af227349c9ef167cae8acf8bc8864e13f636 [3/3] [DONT PUSH]
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251030/202510301735.G36o9EqL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510301735.G36o9EqL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510301735.G36o9EqL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/bpf_local_storage.c:497:29: warning: variable 'owner_storage_ptr' set but not used [-Wunused-but-set-variable]
     497 |         struct bpf_local_storage **owner_storage_ptr;
         |                                    ^
   1 warning generated.


vim +/owner_storage_ptr +497 kernel/bpf/bpf_local_storage.c

450af8d0f6be2e7 KP Singh         2020-08-25  490  
450af8d0f6be2e7 KP Singh         2020-08-25  491  int bpf_local_storage_alloc(void *owner,
450af8d0f6be2e7 KP Singh         2020-08-25  492  			    struct bpf_local_storage_map *smap,
b00fa38a9c1cba0 Joanne Koong     2022-03-17  493  			    struct bpf_local_storage_elem *first_selem,
b00fa38a9c1cba0 Joanne Koong     2022-03-17  494  			    gfp_t gfp_flags)
450af8d0f6be2e7 KP Singh         2020-08-25  495  {
450af8d0f6be2e7 KP Singh         2020-08-25  496  	struct bpf_local_storage *prev_storage, *storage;
450af8d0f6be2e7 KP Singh         2020-08-25 @497  	struct bpf_local_storage **owner_storage_ptr;
16b59442646c808 Amery Hung       2025-10-02  498  	struct bpf_local_storage_map_bucket *b;
16b59442646c808 Amery Hung       2025-10-02  499  	unsigned long flags;
450af8d0f6be2e7 KP Singh         2020-08-25  500  	int err;
450af8d0f6be2e7 KP Singh         2020-08-25  501  
450af8d0f6be2e7 KP Singh         2020-08-25  502  	err = mem_charge(smap, owner, sizeof(*storage));
450af8d0f6be2e7 KP Singh         2020-08-25  503  	if (err)
450af8d0f6be2e7 KP Singh         2020-08-25  504  		return err;
450af8d0f6be2e7 KP Singh         2020-08-25  505  
4855a75ebf485f7 Hou Tao          2025-01-08  506  	if (smap->bpf_ma)
6ae9d5e99e1dd26 Martin KaFai Lau 2023-03-22  507  		storage = bpf_mem_cache_alloc_flags(&smap->storage_ma, gfp_flags);
4855a75ebf485f7 Hou Tao          2025-01-08  508  	else
e9aae8beba825e4 Roman Gushchin   2020-12-01  509  		storage = bpf_map_kzalloc(&smap->map, sizeof(*storage),
b00fa38a9c1cba0 Joanne Koong     2022-03-17  510  					  gfp_flags | __GFP_NOWARN);
450af8d0f6be2e7 KP Singh         2020-08-25  511  	if (!storage) {
450af8d0f6be2e7 KP Singh         2020-08-25  512  		err = -ENOMEM;
450af8d0f6be2e7 KP Singh         2020-08-25  513  		goto uncharge;
450af8d0f6be2e7 KP Singh         2020-08-25  514  	}
450af8d0f6be2e7 KP Singh         2020-08-25  515  
fc6652aab6ad545 Martin KaFai Lau 2023-03-07  516  	RCU_INIT_POINTER(storage->smap, smap);
450af8d0f6be2e7 KP Singh         2020-08-25  517  	INIT_HLIST_HEAD(&storage->list);
fe3c7ea310ef417 Amery Hung       2025-10-02  518  	raw_res_spin_lock_init(&storage->lock);
450af8d0f6be2e7 KP Singh         2020-08-25  519  	storage->owner = owner;
b735af227349c9e Martin KaFai Lau 2025-10-22  520  	storage->bpf_ma = smap->bpf_ma;
b735af227349c9e Martin KaFai Lau 2025-10-22  521  	storage->owner_storage_ptr = owner_storage(smap, owner);
450af8d0f6be2e7 KP Singh         2020-08-25  522  	bpf_selem_link_storage_nolock(storage, first_selem);
16b59442646c808 Amery Hung       2025-10-02  523  
16b59442646c808 Amery Hung       2025-10-02  524  	b = select_bucket(smap, storage);
fe3c7ea310ef417 Amery Hung       2025-10-02  525  	err = raw_res_spin_lock_irqsave(&b->lock, flags);
fe3c7ea310ef417 Amery Hung       2025-10-02  526  	if (err)
fe3c7ea310ef417 Amery Hung       2025-10-02  527  		goto uncharge;
fe3c7ea310ef417 Amery Hung       2025-10-02  528  
16b59442646c808 Amery Hung       2025-10-02  529  	bpf_selem_link_map_nolock(smap, first_selem, b);
450af8d0f6be2e7 KP Singh         2020-08-25  530  
b735af227349c9e Martin KaFai Lau 2025-10-22  531  	owner_storage_ptr = storage->owner_storage_ptr;
b735af227349c9e Martin KaFai Lau 2025-10-22  532  
450af8d0f6be2e7 KP Singh         2020-08-25  533  	/* Publish storage to the owner.
450af8d0f6be2e7 KP Singh         2020-08-25  534  	 * Instead of using any lock of the kernel object (i.e. owner),
450af8d0f6be2e7 KP Singh         2020-08-25  535  	 * cmpxchg will work with any kernel object regardless what
450af8d0f6be2e7 KP Singh         2020-08-25  536  	 * the running context is, bh, irq...etc.
450af8d0f6be2e7 KP Singh         2020-08-25  537  	 *
450af8d0f6be2e7 KP Singh         2020-08-25  538  	 * From now on, the owner->storage pointer (e.g. sk->sk_bpf_storage)
450af8d0f6be2e7 KP Singh         2020-08-25  539  	 * is protected by the storage->lock.  Hence, when freeing
450af8d0f6be2e7 KP Singh         2020-08-25  540  	 * the owner->storage, the storage->lock must be held before
450af8d0f6be2e7 KP Singh         2020-08-25  541  	 * setting owner->storage ptr to NULL.
450af8d0f6be2e7 KP Singh         2020-08-25  542  	 */
b735af227349c9e Martin KaFai Lau 2025-10-22  543  	prev_storage = cmpxchg(unrcu_pointer(storage->owner_storage_ptr), NULL, storage);
450af8d0f6be2e7 KP Singh         2020-08-25  544  	if (unlikely(prev_storage)) {
16b59442646c808 Amery Hung       2025-10-02  545  		bpf_selem_unlink_map_nolock(first_selem);
fe3c7ea310ef417 Amery Hung       2025-10-02  546  		raw_res_spin_unlock_irqrestore(&b->lock, flags);
450af8d0f6be2e7 KP Singh         2020-08-25  547  		err = -EAGAIN;
450af8d0f6be2e7 KP Singh         2020-08-25  548  		goto uncharge;
450af8d0f6be2e7 KP Singh         2020-08-25  549  
450af8d0f6be2e7 KP Singh         2020-08-25  550  		/* Note that even first_selem was linked to smap's
450af8d0f6be2e7 KP Singh         2020-08-25  551  		 * bucket->list, first_selem can be freed immediately
450af8d0f6be2e7 KP Singh         2020-08-25  552  		 * (instead of kfree_rcu) because
450af8d0f6be2e7 KP Singh         2020-08-25  553  		 * bpf_local_storage_map_free() does a
0fe4b381a59ebc5 KP Singh         2021-12-24  554  		 * synchronize_rcu_mult (waiting for both sleepable and
0fe4b381a59ebc5 KP Singh         2021-12-24  555  		 * normal programs) before walking the bucket->list.
450af8d0f6be2e7 KP Singh         2020-08-25  556  		 * Hence, no one is accessing selem from the
450af8d0f6be2e7 KP Singh         2020-08-25  557  		 * bucket->list under rcu_read_lock().
450af8d0f6be2e7 KP Singh         2020-08-25  558  		 */
450af8d0f6be2e7 KP Singh         2020-08-25  559  	}
fe3c7ea310ef417 Amery Hung       2025-10-02  560  	raw_res_spin_unlock_irqrestore(&b->lock, flags);
450af8d0f6be2e7 KP Singh         2020-08-25  561  
450af8d0f6be2e7 KP Singh         2020-08-25  562  	return 0;
450af8d0f6be2e7 KP Singh         2020-08-25  563  
450af8d0f6be2e7 KP Singh         2020-08-25  564  uncharge:
b735af227349c9e Martin KaFai Lau 2025-10-22  565  	bpf_local_storage_free(storage, smap, true);
450af8d0f6be2e7 KP Singh         2020-08-25  566  	mem_uncharge(smap, owner, sizeof(*storage));
450af8d0f6be2e7 KP Singh         2020-08-25  567  	return err;
450af8d0f6be2e7 KP Singh         2020-08-25  568  }
450af8d0f6be2e7 KP Singh         2020-08-25  569  

:::::: The code at line 497 was first introduced by commit
:::::: 450af8d0f6be2e7dd2a528a3fb054bb726bf1747 bpf: Split bpf_local_storage to bpf_sk_storage

:::::: TO: KP Singh <kpsingh@google.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
