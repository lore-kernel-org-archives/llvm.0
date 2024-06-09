Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C98333DF;
	Sun,  9 Jun 2024 10:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717928226; cv=none; b=ngOAMXdbiP4K9z8JiGw6q6GQsai5ci+d7AOkHSQxFH5RjKlNwwHBH5u4VdzZZqvKk8SYzTkzia+EPtQI/WTWkNJqHmQS8CRIjg2CbvmQbTmhwc95bp+X5Ggd5NZkFfRii+xgJelgHgPevhQ3OP05AIjZHKV5g/Wk1gxk+Cvpx0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717928226; c=relaxed/simple;
	bh=6ps65X/7104QnnaasPZmpMuIH3fXLdBlFf8AVg8DsFM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M9FwIFqruVx1XC4TlcHj46Fz1nALZVQLetetkY0lSSFHfa9jBt+TQWPf5yDKMPvcY5ORLtgYRs78XbQqf7/eeoKUqLZaDlFHI8xQa7eCxSWHtmMKpEwuSU2x4V8NV7U+oVt7WKN+YlSzEgiQDmRNykVxS0CSk8pYJYVyaJKNDAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W5OLOGUO; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W5OLOGUO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717928225; x=1749464225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6ps65X/7104QnnaasPZmpMuIH3fXLdBlFf8AVg8DsFM=;
  b=W5OLOGUOM8zgeMSbob3B+SjZgAShquVRRGGqY8YEZjm1x5+Ax794rQYr
   Id+ot1Fn4k4d8vL3dGt2nTwXd2etYXUYTO0JzhVJObG6Fctp3lJxyf85n
   NEHyFj7biqealGgODaEhMHFJ3AAI1IKEoMoppfTyulVNWPol5xf+QNKrE
   H4kcLi6x9xvp1jdYcYhQH8rFBln68lD4aL+W2uRtjgHJ1s1S8iPJo9UyA
   GUgHsv1KxyXDPC9FkRFQ89B/wdYooj81yrFJ9QSo1EeVZYq5u50ofj1uD
   wV6+Ep4oyoaW38mzLsuhaFcS/6HOh/vuA+LcyNo6IpA+JjST5O5kwXbV0
   g==;
X-CSE-ConnectionGUID: 74HCGrL6S9m/sazsxhTiQQ==
X-CSE-MsgGUID: uu1IGRqkSzmteD1TL8ss6Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="32093809"
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="32093809"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 03:17:04 -0700
X-CSE-ConnectionGUID: 9qpslnQRTIW9xBowU/58dQ==
X-CSE-MsgGUID: iMIYow+6QnCX48hejfQJkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="39452937"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Jun 2024 03:17:03 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGFbg-00015e-2m;
	Sun, 09 Jun 2024 10:17:00 +0000
Date: Sun, 9 Jun 2024 18:16:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 97/97] fs/bcachefs/btree_iter.c:3411:69:
 error: use of undeclared identifier 'ck'
Message-ID: <202406091840.plSRX5vC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   e514088a9cf20c9729c12fb6cf92de291fb7cca6
commit: e514088a9cf20c9729c12fb6cf92de291fb7cca6 [97/97] debug per paul
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240609/202406091840.plSRX5vC-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406091840.plSRX5vC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406091840.plSRX5vC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/bcachefs/btree_iter.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> fs/bcachefs/btree_iter.c:3411:69: error: use of undeclared identifier 'ck'
    3411 |                 WARN_ON_ONCE(poll_state_synchronize_srcu(&c->btree_trans_barrier, ck->btree_trans_barrier_seq));
         |                                                                                   ^
   5 warnings and 1 error generated.


vim +/ck +3411 fs/bcachefs/btree_iter.c

  3376	
  3377	void bch2_fs_btree_iter_exit(struct bch_fs *c)
  3378	{
  3379		struct btree_transaction_stats *s;
  3380		struct btree_trans *trans;
  3381		int cpu;
  3382	
  3383		if (c->btree_trans_bufs)
  3384			for_each_possible_cpu(cpu) {
  3385				struct btree_trans *trans =
  3386					per_cpu_ptr(c->btree_trans_bufs, cpu)->trans;
  3387	
  3388				if (trans) {
  3389					closure_sync(&trans->ref);
  3390	
  3391					seqmutex_lock(&c->btree_trans_lock);
  3392					list_del(&trans->list);
  3393					seqmutex_unlock(&c->btree_trans_lock);
  3394				}
  3395				kfree(trans);
  3396			}
  3397		free_percpu(c->btree_trans_bufs);
  3398	
  3399		trans = list_first_entry_or_null(&c->btree_trans_list, struct btree_trans, list);
  3400		if (trans)
  3401			panic("%s leaked btree_trans\n", trans->fn);
  3402	
  3403		for (s = c->btree_transaction_stats;
  3404		     s < c->btree_transaction_stats + ARRAY_SIZE(c->btree_transaction_stats);
  3405		     s++) {
  3406			kfree(s->max_paths_text);
  3407			bch2_time_stats_exit(&s->lock_hold_times);
  3408		}
  3409	
  3410		if (c->btree_trans_barrier_initialized) {
> 3411			WARN_ON_ONCE(poll_state_synchronize_srcu(&c->btree_trans_barrier, ck->btree_trans_barrier_seq));
  3412			cleanup_srcu_struct(&c->btree_trans_barrier);
  3413		}
  3414		mempool_exit(&c->btree_trans_mem_pool);
  3415		mempool_exit(&c->btree_trans_pool);
  3416	}
  3417	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
