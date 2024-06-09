Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7838B65E;
	Sun,  9 Jun 2024 08:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717922642; cv=none; b=AN0PpM9rWJAwJ2fOZ+ekh19fLFxAUmpkYsX7hIQWKCNiUt8HOzCLhN+bqp1kGve0Y3MVGTujhvCuXn2ewpv+eWTGBluzcAUqBr3XNIcoA2TMqsyGY0Y76zkWT43D2Db4tjR4n04hSB9yMW9LiEUU5nfbs+lmROMK0hWs1QKDRjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717922642; c=relaxed/simple;
	bh=P3jgUiSm8qQBKqNO6sXYWOj6I4UDr2lE/NmkgVYUaIA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sTKrOJyee+sI6xG41ygD6n4pOec8CBbUmUQDzXLmZCvjqA0YW5OdeilUchlbfjajcRtN+KWbsI0pz3rYdp/eQ4PRWVEQAL+o5/WYEumUKLK8+RVxsTB6ZGAo6SVlvF+objr0CR150ptn9Jy8oaKnTc72GtSMlnTUOmy/sBzglKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iq56qmQq; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iq56qmQq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717922641; x=1749458641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P3jgUiSm8qQBKqNO6sXYWOj6I4UDr2lE/NmkgVYUaIA=;
  b=Iq56qmQq5tFG3BgQl/9028/r8DeS8I1XRhHgyMDNgjzq1UdZ7FsXsvui
   npuQkrWB4ezooxr2jPqk5ISeoW9UjjbP6ayNjO+h8UKIKlJs/fk6+kBSF
   ozt8dl70Yd/QRv4RJtDmggG9q11fMw09df05gvAnDKUGrD7JiP4AAwfxD
   u0S6N8Lu3CQ3tSUapF/LtJ9mr6ZzqmblADhFvEVBQt6I3oPuS4SfNNtJb
   LKe5l+8OD1+bRXrrEiEA2dThVZjK1hwTdwfJb4MT/KryEhL+eGfM4zueX
   Tx8arR+yAgUy5J9E8XQrn6wiWgbRpcwEmo36XMpPJO3hFdd8AtkAzNGtr
   g==;
X-CSE-ConnectionGUID: jXIMA3xARROJCtJ4P61yfg==
X-CSE-MsgGUID: 95Fnets8QEWHdEbIcV/e+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="14399831"
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="14399831"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 01:44:00 -0700
X-CSE-ConnectionGUID: Jhfs3dedSbKqqo8je3dJuA==
X-CSE-MsgGUID: 3spXNCV2SVm9yu13iV1CKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="39318986"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Jun 2024 01:43:59 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGE9c-00010Y-0k;
	Sun, 09 Jun 2024 08:43:56 +0000
Date: Sun, 9 Jun 2024 16:43:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 46/97]
 fs/bcachefs/alloc_foreground.c:1709:38: error: call to undeclared function
 'bch2_fs_usage_read_one'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202406091631.AlBzaflH-lkp@intel.com>
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
commit: da76cae296ca4407c458a0ffc9a746627e16304d [46/97] bcachefs: Delete journal-buf-sharded old style accounting
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240609/202406091631.AlBzaflH-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406091631.AlBzaflH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406091631.AlBzaflH-lkp@intel.com/

Note: the bcachefs/bcachefs-testing HEAD e514088a9cf20c9729c12fb6cf92de291fb7cca6 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from fs/bcachefs/alloc_foreground.c:14:
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
>> fs/bcachefs/alloc_foreground.c:1709:38: error: call to undeclared function 'bch2_fs_usage_read_one'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1709 |         prt_printf(out, "hidden\t%llu\n",                       bch2_fs_usage_read_one(c, &c->usage_base->b.hidden));
         |                                                                 ^
   fs/bcachefs/alloc_foreground.c:1709:38: note: did you mean 'bch2_fs_usage_read_short'?
   fs/bcachefs/buckets.h:299:1: note: 'bch2_fs_usage_read_short' declared here
     299 | bch2_fs_usage_read_short(struct bch_fs *);
         | ^
>> fs/bcachefs/alloc_foreground.c:1709:68: error: no member named 'usage_base' in 'struct bch_fs'
    1709 |         prt_printf(out, "hidden\t%llu\n",                       bch2_fs_usage_read_one(c, &c->usage_base->b.hidden));
         |                                                                                            ~  ^
   fs/bcachefs/util.h:192:54: note: expanded from macro 'prt_printf'
     192 | #define prt_printf(_out, ...)           bch2_prt_printf(_out, __VA_ARGS__)
         |                                                               ^~~~~~~~~~~
   fs/bcachefs/alloc_foreground.c:1710:67: error: no member named 'usage_base' in 'struct bch_fs'
    1710 |         prt_printf(out, "btree\t%llu\n",                        bch2_fs_usage_read_one(c, &c->usage_base->b.btree));
         |                                                                                            ~  ^
   fs/bcachefs/util.h:192:54: note: expanded from macro 'prt_printf'
     192 | #define prt_printf(_out, ...)           bch2_prt_printf(_out, __VA_ARGS__)
         |                                                               ^~~~~~~~~~~
   fs/bcachefs/alloc_foreground.c:1711:67: error: no member named 'usage_base' in 'struct bch_fs'
    1711 |         prt_printf(out, "data\t%llu\n",                         bch2_fs_usage_read_one(c, &c->usage_base->b.data));
         |                                                                                            ~  ^
   fs/bcachefs/util.h:192:54: note: expanded from macro 'prt_printf'
     192 | #define prt_printf(_out, ...)           bch2_prt_printf(_out, __VA_ARGS__)
         |                                                               ^~~~~~~~~~~
   fs/bcachefs/alloc_foreground.c:1712:68: error: no member named 'usage_base' in 'struct bch_fs'
    1712 |         prt_printf(out, "cached\t%llu\n",                       bch2_fs_usage_read_one(c, &c->usage_base->b.cached));
         |                                                                                            ~  ^
   fs/bcachefs/util.h:192:54: note: expanded from macro 'prt_printf'
     192 | #define prt_printf(_out, ...)           bch2_prt_printf(_out, __VA_ARGS__)
         |                                                               ^~~~~~~~~~~
   fs/bcachefs/alloc_foreground.c:1713:70: error: no member named 'usage_base' in 'struct bch_fs'
    1713 |         prt_printf(out, "reserved\t%llu\n",                     bch2_fs_usage_read_one(c, &c->usage_base->b.reserved));
         |                                                                                            ~  ^
   fs/bcachefs/util.h:192:54: note: expanded from macro 'prt_printf'
     192 | #define prt_printf(_out, ...)           bch2_prt_printf(_out, __VA_ARGS__)
         |                                                               ^~~~~~~~~~~
   fs/bcachefs/alloc_foreground.c:1715:71: error: no member named 'usage_base' in 'struct bch_fs'
    1715 |         prt_printf(out, "nr_inodes\t%llu\n",                    bch2_fs_usage_read_one(c, &c->usage_base->b.nr_inodes));
         |                                                                                            ~  ^
   fs/bcachefs/util.h:192:54: note: expanded from macro 'prt_printf'
     192 | #define prt_printf(_out, ...)           bch2_prt_printf(_out, __VA_ARGS__)
         |                                                               ^~~~~~~~~~~
   5 warnings and 7 errors generated.


vim +/bch2_fs_usage_read_one +1709 fs/bcachefs/alloc_foreground.c

e98786ea855cb2 Kent Overstreet 2024-05-03  1696  
e98786ea855cb2 Kent Overstreet 2024-05-03  1697  void bch2_fs_alloc_debug_to_text(struct printbuf *out, struct bch_fs *c)
e98786ea855cb2 Kent Overstreet 2024-05-03  1698  {
e98786ea855cb2 Kent Overstreet 2024-05-03  1699  	unsigned nr[BCH_DATA_NR];
e98786ea855cb2 Kent Overstreet 2024-05-03  1700  
e98786ea855cb2 Kent Overstreet 2024-05-03  1701  	memset(nr, 0, sizeof(nr));
e98786ea855cb2 Kent Overstreet 2024-05-03  1702  
e98786ea855cb2 Kent Overstreet 2024-05-03  1703  	for (unsigned i = 0; i < ARRAY_SIZE(c->open_buckets); i++)
e98786ea855cb2 Kent Overstreet 2024-05-03  1704  		nr[c->open_buckets[i].data_type]++;
e98786ea855cb2 Kent Overstreet 2024-05-03  1705  
e98786ea855cb2 Kent Overstreet 2024-05-03  1706  	printbuf_tabstop_push(out, 24);
e98786ea855cb2 Kent Overstreet 2024-05-03  1707  
e98786ea855cb2 Kent Overstreet 2024-05-03  1708  	percpu_down_read(&c->mark_lock);
e98786ea855cb2 Kent Overstreet 2024-05-03 @1709  	prt_printf(out, "hidden\t%llu\n",			bch2_fs_usage_read_one(c, &c->usage_base->b.hidden));
e98786ea855cb2 Kent Overstreet 2024-05-03  1710  	prt_printf(out, "btree\t%llu\n",			bch2_fs_usage_read_one(c, &c->usage_base->b.btree));
e98786ea855cb2 Kent Overstreet 2024-05-03  1711  	prt_printf(out, "data\t%llu\n",				bch2_fs_usage_read_one(c, &c->usage_base->b.data));
e98786ea855cb2 Kent Overstreet 2024-05-03  1712  	prt_printf(out, "cached\t%llu\n",			bch2_fs_usage_read_one(c, &c->usage_base->b.cached));
e98786ea855cb2 Kent Overstreet 2024-05-03  1713  	prt_printf(out, "reserved\t%llu\n",			bch2_fs_usage_read_one(c, &c->usage_base->b.reserved));
e98786ea855cb2 Kent Overstreet 2024-05-03  1714  	prt_printf(out, "online_reserved\t%llu\n",		percpu_u64_get(c->online_reserved));
e98786ea855cb2 Kent Overstreet 2024-05-03  1715  	prt_printf(out, "nr_inodes\t%llu\n",			bch2_fs_usage_read_one(c, &c->usage_base->b.nr_inodes));
e98786ea855cb2 Kent Overstreet 2024-05-03  1716  	percpu_up_read(&c->mark_lock);
e98786ea855cb2 Kent Overstreet 2024-05-03  1717  
e98786ea855cb2 Kent Overstreet 2024-05-03  1718  	prt_newline(out);
e98786ea855cb2 Kent Overstreet 2024-05-03  1719  	prt_printf(out, "freelist_wait\t%s\n",			c->freelist_wait.list.first ? "waiting" : "empty");
e98786ea855cb2 Kent Overstreet 2024-05-03  1720  	prt_printf(out, "open buckets allocated\t%i\n",		OPEN_BUCKETS_COUNT - c->open_buckets_nr_free);
e98786ea855cb2 Kent Overstreet 2024-05-03  1721  	prt_printf(out, "open buckets total\t%u\n",		OPEN_BUCKETS_COUNT);
e98786ea855cb2 Kent Overstreet 2024-05-03  1722  	prt_printf(out, "open_buckets_wait\t%s\n",		c->open_buckets_wait.list.first ? "waiting" : "empty");
e98786ea855cb2 Kent Overstreet 2024-05-03  1723  	prt_printf(out, "open_buckets_btree\t%u\n",		nr[BCH_DATA_btree]);
e98786ea855cb2 Kent Overstreet 2024-05-03  1724  	prt_printf(out, "open_buckets_user\t%u\n",		nr[BCH_DATA_user]);
e98786ea855cb2 Kent Overstreet 2024-05-03  1725  	prt_printf(out, "btree reserve cache\t%u\n",		c->btree_reserve_cache_nr);
e98786ea855cb2 Kent Overstreet 2024-05-03  1726  }
e98786ea855cb2 Kent Overstreet 2024-05-03  1727  

:::::: The code at line 1709 was first introduced by commit
:::::: e98786ea855cb28176e27ffce23fb163a36ed32e bcachefs: bch2_print_allocator_stuck()

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
