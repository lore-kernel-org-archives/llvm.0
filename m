Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD90C1B951;
	Tue,  6 Feb 2024 21:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707255086; cv=none; b=HSaRveUtEqLII9wpbg8gbGMm2nVHybz5UCe7GhNKnw86j5fWmIhDb/Llubr3aL6rJ+Zsz3kIuUH8YeHRLLzp6N37nR80DcI7HE6m4M/mmqZv1qScaPMzMw11sDtbBDKUCEt4bJwnkV5skLkeCl8D8RAxFE4ptiEKSQPZHf8WBrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707255086; c=relaxed/simple;
	bh=GfYkQ+wmvhilD4S0J24vgWuyWeoJwxzYahORsu2PvI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HsVSP38jzl2DFNHi0aVlO2jG5e6SrHz/GY0JMLM2gtDrHtxDGFxQQAEUyacDwkV8QnALhTitoIgSbLqIbfhZq77VZoy9aiKHceOWEp/oL6j1/DGzoMlbOXjgMRwU5qmIdhvY3x7eQBInSV/aIarLwnpOXnKrmDaI+rG8gGJL/mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PKq5f+3L; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PKq5f+3L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707255084; x=1738791084;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GfYkQ+wmvhilD4S0J24vgWuyWeoJwxzYahORsu2PvI8=;
  b=PKq5f+3LvGir8hZdnQ2MY0xdqGBo74wKRHS/59NlQwB5FCT4w1pQ0p9U
   U4Rt08dpApiZtp/RuO7Voy0jFrZPZ1GXMkWh1gtoyK/mGJwQXtSxw3WcX
   LGWWwBGtkOIQ15M0DI3oWWhMYWKjyJUWJ4IzcdrAdVpVkah999NcnbJe/
   ygojvbqRtsTSLUu6LX3saCMGXirUPB5QkafXxOvNs8zOXt3TLXAfVeXK3
   2WzP6nfwTWFTq5lmrAl+dcmOmHAQRmX8P/tpfh9ssrkX+3JWxaerkMd68
   jNV4mn/ZL5soTvHBvlILgFYCc/JuVfTbBAnUTxpeQSuTcERNa8sIioN9R
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="11433736"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="11433736"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 13:31:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="5767978"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Feb 2024 13:31:21 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXT2E-0001o0-0O;
	Tue, 06 Feb 2024 21:31:18 +0000
Date: Wed, 7 Feb 2024 05:31:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 59/66] drivers/md/bcache/sysfs.c:747:2:
 error: too few arguments to function call, expected 3, have 2
Message-ID: <202402070517.d8Nu87mD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   50847e296b34efabe199e408ec4d72f10a866c39
commit: c7caff27eedeef30d457cbe0d5aae0698fcc954f [59/66] time_stats: don't print any output if event count is zero
config: i386-randconfig-002-20240206 (https://download.01.org/0day-ci/archive/20240207/202402070517.d8Nu87mD-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240207/202402070517.d8Nu87mD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402070517.d8Nu87mD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/md/bcache/sysfs.c:747:2: error: too few arguments to function call, expected 3, have 2
     747 |         sysfs_print_time_stats(&c->btree_gc_time,       btree_gc_times);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:366:36: note: expanded from macro 'sysfs_print_time_stats'
     366 |                 time_stats_to_seq_buf(&seq, stats);                     \
         |                 ~~~~~~~~~~~~~~~~~~~~~            ^
   include/linux/time_stats.h:153:6: note: 'time_stats_to_seq_buf' declared here
     153 | void time_stats_to_seq_buf(struct seq_buf *, struct time_stats *,
         |      ^                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     154 |                 unsigned int flags);
         |                 ~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/sysfs.c:748:2: error: too few arguments to function call, expected 3, have 2
     748 |         sysfs_print_time_stats(&c->btree_split_time,    btree_split_times);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:366:36: note: expanded from macro 'sysfs_print_time_stats'
     366 |                 time_stats_to_seq_buf(&seq, stats);                     \
         |                 ~~~~~~~~~~~~~~~~~~~~~            ^
   include/linux/time_stats.h:153:6: note: 'time_stats_to_seq_buf' declared here
     153 | void time_stats_to_seq_buf(struct seq_buf *, struct time_stats *,
         |      ^                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     154 |                 unsigned int flags);
         |                 ~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/sysfs.c:749:2: error: too few arguments to function call, expected 3, have 2
     749 |         sysfs_print_time_stats(&c->sort.time,           btree_sort_times);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:366:36: note: expanded from macro 'sysfs_print_time_stats'
     366 |                 time_stats_to_seq_buf(&seq, stats);                     \
         |                 ~~~~~~~~~~~~~~~~~~~~~            ^
   include/linux/time_stats.h:153:6: note: 'time_stats_to_seq_buf' declared here
     153 | void time_stats_to_seq_buf(struct seq_buf *, struct time_stats *,
         |      ^                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     154 |                 unsigned int flags);
         |                 ~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/sysfs.c:750:2: error: too few arguments to function call, expected 3, have 2
     750 |         sysfs_print_time_stats(&c->btree_read_time,     btree_read_times);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:366:36: note: expanded from macro 'sysfs_print_time_stats'
     366 |                 time_stats_to_seq_buf(&seq, stats);                     \
         |                 ~~~~~~~~~~~~~~~~~~~~~            ^
   include/linux/time_stats.h:153:6: note: 'time_stats_to_seq_buf' declared here
     153 | void time_stats_to_seq_buf(struct seq_buf *, struct time_stats *,
         |      ^                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     154 |                 unsigned int flags);
         |                 ~~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +747 drivers/md/bcache/sysfs.c

cafe563591446c Kent Overstreet 2013-03-23  731  
cb85114956dc88 John Sheu       2014-03-17  732  SHOW(__bch_cache_set)
cb85114956dc88 John Sheu       2014-03-17  733  {
cafe563591446c Kent Overstreet 2013-03-23  734  	struct cache_set *c = container_of(kobj, struct cache_set, kobj);
cafe563591446c Kent Overstreet 2013-03-23  735  
6f9414e0f6f35c Coly Li         2020-10-01  736  	sysfs_print(synchronous,		CACHE_SYNC(&c->cache->sb));
cafe563591446c Kent Overstreet 2013-03-23  737  	sysfs_print(journal_delay_ms,		c->journal_delay_ms);
63a96c05cd43cc Coly Li         2020-10-01  738  	sysfs_hprint(bucket_size,		bucket_bytes(c->cache));
4e1ebae3ee4e0c Coly Li         2020-10-01  739  	sysfs_hprint(block_size,		block_bytes(c->cache));
cafe563591446c Kent Overstreet 2013-03-23  740  	sysfs_print(tree_depth,			c->root->level);
cb85114956dc88 John Sheu       2014-03-17  741  	sysfs_print(root_usage_percent,		bch_root_usage(c));
cafe563591446c Kent Overstreet 2013-03-23  742  
cb85114956dc88 John Sheu       2014-03-17  743  	sysfs_hprint(btree_cache_size,		bch_cache_size(c));
cb85114956dc88 John Sheu       2014-03-17  744  	sysfs_print(btree_cache_max_chain,	bch_cache_max_chain(c));
cafe563591446c Kent Overstreet 2013-03-23  745  	sysfs_print(cache_available_percent,	100 - c->gc_stats.in_use);
cafe563591446c Kent Overstreet 2013-03-23  746  
21ba4155ff2f9e Kent Overstreet 2024-01-26 @747  	sysfs_print_time_stats(&c->btree_gc_time,	btree_gc_times);
21ba4155ff2f9e Kent Overstreet 2024-01-26  748  	sysfs_print_time_stats(&c->btree_split_time,	btree_split_times);
21ba4155ff2f9e Kent Overstreet 2024-01-26  749  	sysfs_print_time_stats(&c->sort.time,		btree_sort_times);
21ba4155ff2f9e Kent Overstreet 2024-01-26  750  	sysfs_print_time_stats(&c->btree_read_time,	btree_read_times);
cafe563591446c Kent Overstreet 2013-03-23  751  
cb85114956dc88 John Sheu       2014-03-17  752  	sysfs_print(btree_used_percent,	bch_btree_used(c));
cafe563591446c Kent Overstreet 2013-03-23  753  	sysfs_print(btree_nodes,	c->gc_stats.nodes);
cb85114956dc88 John Sheu       2014-03-17  754  	sysfs_hprint(average_key_size,	bch_average_key_size(c));
cafe563591446c Kent Overstreet 2013-03-23  755  
cafe563591446c Kent Overstreet 2013-03-23  756  	sysfs_print(cache_read_races,
cafe563591446c Kent Overstreet 2013-03-23  757  		    atomic_long_read(&c->cache_read_races));
cafe563591446c Kent Overstreet 2013-03-23  758  
a728eacbbdd229 Tang Junhui     2018-02-07  759  	sysfs_print(reclaim,
a728eacbbdd229 Tang Junhui     2018-02-07  760  		    atomic_long_read(&c->reclaim));
a728eacbbdd229 Tang Junhui     2018-02-07  761  
dff90d58a1c815 Coly Li         2019-06-28  762  	sysfs_print(reclaimed_journal_buckets,
dff90d58a1c815 Coly Li         2019-06-28  763  		    atomic_long_read(&c->reclaimed_journal_buckets));
dff90d58a1c815 Coly Li         2019-06-28  764  
a728eacbbdd229 Tang Junhui     2018-02-07  765  	sysfs_print(flush_write,
a728eacbbdd229 Tang Junhui     2018-02-07  766  		    atomic_long_read(&c->flush_write));
a728eacbbdd229 Tang Junhui     2018-02-07  767  
cafe563591446c Kent Overstreet 2013-03-23  768  	sysfs_print(writeback_keys_done,
cafe563591446c Kent Overstreet 2013-03-23  769  		    atomic_long_read(&c->writeback_keys_done));
cafe563591446c Kent Overstreet 2013-03-23  770  	sysfs_print(writeback_keys_failed,
cafe563591446c Kent Overstreet 2013-03-23  771  		    atomic_long_read(&c->writeback_keys_failed));
cafe563591446c Kent Overstreet 2013-03-23  772  
77c320eb46e216 Kent Overstreet 2013-07-11  773  	if (attr == &sysfs_errors)
77c320eb46e216 Kent Overstreet 2013-07-11  774  		return bch_snprint_string_list(buf, PAGE_SIZE, error_actions,
77c320eb46e216 Kent Overstreet 2013-07-11  775  					       c->on_error);
77c320eb46e216 Kent Overstreet 2013-07-11  776  
cafe563591446c Kent Overstreet 2013-03-23  777  	/* See count_io_errors for why 88 */
cafe563591446c Kent Overstreet 2013-03-23  778  	sysfs_print(io_error_halflife,	c->error_decay * 88);
7ba0d830dc0e4c Coly Li         2018-02-07  779  	sysfs_print(io_error_limit,	c->error_limit);
cafe563591446c Kent Overstreet 2013-03-23  780  
cafe563591446c Kent Overstreet 2013-03-23  781  	sysfs_hprint(congested,
cafe563591446c Kent Overstreet 2013-03-23  782  		     ((uint64_t) bch_get_congested(c)) << 9);
cafe563591446c Kent Overstreet 2013-03-23  783  	sysfs_print(congested_read_threshold_us,
cafe563591446c Kent Overstreet 2013-03-23  784  		    c->congested_read_threshold_us);
cafe563591446c Kent Overstreet 2013-03-23  785  	sysfs_print(congested_write_threshold_us,
cafe563591446c Kent Overstreet 2013-03-23  786  		    c->congested_write_threshold_us);
cafe563591446c Kent Overstreet 2013-03-23  787  
9aaf51654672b1 Coly Li         2018-12-13  788  	sysfs_print(cutoff_writeback, bch_cutoff_writeback);
9aaf51654672b1 Coly Li         2018-12-13  789  	sysfs_print(cutoff_writeback_sync, bch_cutoff_writeback_sync);
9aaf51654672b1 Coly Li         2018-12-13  790  
cafe563591446c Kent Overstreet 2013-03-23  791  	sysfs_print(active_journal_entries,	fifo_used(&c->journal.pin));
cafe563591446c Kent Overstreet 2013-03-23  792  	sysfs_printf(verify,			"%i", c->verify);
cafe563591446c Kent Overstreet 2013-03-23  793  	sysfs_printf(key_merging_disabled,	"%i", c->key_merging_disabled);
280481d06c8a68 Kent Overstreet 2013-10-24  794  	sysfs_printf(expensive_debug_checks,
280481d06c8a68 Kent Overstreet 2013-10-24  795  		     "%i", c->expensive_debug_checks);
cafe563591446c Kent Overstreet 2013-03-23  796  	sysfs_printf(gc_always_rewrite,		"%i", c->gc_always_rewrite);
cafe563591446c Kent Overstreet 2013-03-23  797  	sysfs_printf(btree_shrinker_disabled,	"%i", c->shrinker_disabled);
cafe563591446c Kent Overstreet 2013-03-23  798  	sysfs_printf(copy_gc_enabled,		"%i", c->copy_gc_enabled);
c5fcdedcee4e6a Coly Li         2019-11-13  799  	sysfs_printf(idle_max_writeback_rate,	"%i",
c5fcdedcee4e6a Coly Li         2019-11-13  800  		     c->idle_max_writeback_rate_enabled);
7a671d8ef821bf Coly Li         2018-12-13  801  	sysfs_printf(gc_after_writeback,	"%i", c->gc_after_writeback);
771f393e8ffc9b Coly Li         2018-03-18  802  	sysfs_printf(io_disable,		"%i",
771f393e8ffc9b Coly Li         2018-03-18  803  		     test_bit(CACHE_SET_IO_DISABLE, &c->flags));
cafe563591446c Kent Overstreet 2013-03-23  804  
cafe563591446c Kent Overstreet 2013-03-23  805  	if (attr == &sysfs_bset_tree_stats)
cafe563591446c Kent Overstreet 2013-03-23  806  		return bch_bset_print_stats(c, buf);
cafe563591446c Kent Overstreet 2013-03-23  807  
092bd54d69230b Coly Li         2020-07-25  808  	if (attr == &sysfs_feature_compat)
092bd54d69230b Coly Li         2020-07-25  809  		return bch_print_cache_set_feature_compat(c, buf, PAGE_SIZE);
092bd54d69230b Coly Li         2020-07-25  810  	if (attr == &sysfs_feature_ro_compat)
092bd54d69230b Coly Li         2020-07-25  811  		return bch_print_cache_set_feature_ro_compat(c, buf, PAGE_SIZE);
092bd54d69230b Coly Li         2020-07-25  812  	if (attr == &sysfs_feature_incompat)
092bd54d69230b Coly Li         2020-07-25  813  		return bch_print_cache_set_feature_incompat(c, buf, PAGE_SIZE);
092bd54d69230b Coly Li         2020-07-25  814  
cafe563591446c Kent Overstreet 2013-03-23  815  	return 0;
cafe563591446c Kent Overstreet 2013-03-23  816  }
cafe563591446c Kent Overstreet 2013-03-23  817  SHOW_LOCKED(bch_cache_set)
cafe563591446c Kent Overstreet 2013-03-23  818  

:::::: The code at line 747 was first introduced by commit
:::::: 21ba4155ff2f9e17cf4d27f1ad2ea42fecfed4ae bcache: Convert to lib/time_stats

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
