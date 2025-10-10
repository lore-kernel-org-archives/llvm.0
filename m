Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B9A30276C;
	Fri, 10 Oct 2025 20:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760129248; cv=none; b=AdGEkEIIAhVqj+ci45bCphUY4s5DOeKTFnAFwvo/aCeJQs0O56vUErYL2Q++R0rKuRy2nzA7WOTxz3nyUJhdbBLZ4DuwkcnGDDYGAPgoN5+SyRkKzrohm4h/61NK/+UUpar7USvRr2jL9a+OZbBQ2GDc209NLcdTnTmMBsZ8+Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760129248; c=relaxed/simple;
	bh=cNro36dQ5OIKNxoEKAJbGiwUSLSWqr7HbJGTmYLUr00=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eC2RrF32bS3YqB50sPQQH3HosAJh5eFGjrTU1c/lbgJYe6H8GUmL0Aly31YqJziaCIsH79bnMTY8ZOiGjw8UNKWRYWX1mOU3OdaRSPnAob9o5Mx44Z/FQQP3HhrLtGOC4VziApGk5BhTFxOh+/QpFQED5jN72/t6qVL+FzGHPGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QaComHJF; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QaComHJF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760129246; x=1791665246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cNro36dQ5OIKNxoEKAJbGiwUSLSWqr7HbJGTmYLUr00=;
  b=QaComHJFNAqcmk0Uu+mJIOGGaKJMuVb8fpNS30fPnAscYT4nZLulpOVd
   3eH6QBfgjpz328WBmGSRlLKuSpJqrRIhZf4bxu0zI90poGn7CdA29LT1H
   FPP/dSnq8iLMdKAjYEkZupzs6LmEdxsQit8ugs84bYr9q55zMxV4D6ccz
   yz5IGbCT6e+UA07Q2Dptp45vbk53XBFVAxWaAcxsGb7x3x5RFNzWYjhyk
   ny+8Wj5y5XC90WCUUzfEDcsgP5kOzKNWyBTq5HBveonFKR7Tp+9Z43dyH
   +6orIfLIWvAyE21imNTNoijlSaoNMfnKa7h0Ee0kwErBlP2bef0qQzwN8
   A==;
X-CSE-ConnectionGUID: i0Aft9eqR5u6D9NPwCAm/Q==
X-CSE-MsgGUID: o6A80E8yRNOpd8Vha58z3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="79799119"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="79799119"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 13:47:25 -0700
X-CSE-ConnectionGUID: ckKCCIJDS+CvgtqOQVl6sw==
X-CSE-MsgGUID: XJ+fyeXmRyGi1FGYZHFp9A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Oct 2025 13:47:23 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7K1J-00039r-0G;
	Fri, 10 Oct 2025 20:47:21 +0000
Date: Sat, 11 Oct 2025 04:46:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 475/534] fs/bcachefs/init/fs.c:1177:25:
 warning: result of comparison of constant 262144 with expression of type
 'u16' (aka 'unsigned short') is always false
Message-ID: <202510110402.cCZEYDTY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs master
head:   9a59939e496692bfa0e4cd6e7b8f79d416c49f72
commit: 545f4e8a2c74eb3720ca8128fd64afad5ac5772e [475/534] bcachefs: split out init/dev.c
config: hexagon-randconfig-002-20251011 (https://download.01.org/0day-ci/archive/20251011/202510110402.cCZEYDTY-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510110402.cCZEYDTY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510110402.cCZEYDTY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/init/fs.c:1177:25: warning: result of comparison of constant 262144 with expression of type 'u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
    1176 |         if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1177 |             c->opts.block_size > PAGE_SIZE) {
         |             ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:86: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ~~~~~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:68:3: note: expanded from macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
>> fs/bcachefs/init/fs.c:1177:25: warning: result of comparison of constant 262144 with expression of type 'u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
    1176 |         if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1177 |             c->opts.block_size > PAGE_SIZE) {
         |             ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
>> fs/bcachefs/init/fs.c:1177:25: warning: result of comparison of constant 262144 with expression of type 'u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
    1176 |         if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1177 |             c->opts.block_size > PAGE_SIZE) {
         |             ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:61: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   3 warnings generated.


vim +1177 fs/bcachefs/init/fs.c

3466077e580c52 fs/bcachefs/super.c Kent Overstreet 2025-08-02  1060  
a349868b5e2503 fs/bcachefs/super.c Kent Overstreet 2025-04-28  1061  static struct bch_fs *bch2_fs_alloc(struct bch_sb *sb, struct bch_opts *opts,
58c36e6710d3b3 fs/bcachefs/super.c Kent Overstreet 2025-04-03  1062  				    bch_sb_handles *sbs)
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1063  {
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1064  	struct bch_fs *c;
ecf37a4a80ec02 fs/bcachefs/super.c Kent Overstreet 2019-02-14  1065  	unsigned i, iter_size;
0d7fd3bd2d8742 fs/bcachefs/super.c Kent Overstreet 2025-07-14  1066  	CLASS(printbuf, name)();
7be9ab637fb9c5 fs/bcachefs/super.c Chris Webb      2021-11-04  1067  	int ret = 0;
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1068  
cb6fc943b650c4 fs/bcachefs/super.c Kent Overstreet 2024-02-01  1069  	c = kvmalloc(sizeof(struct bch_fs), GFP_KERNEL|__GFP_ZERO);
7be9ab637fb9c5 fs/bcachefs/super.c Chris Webb      2021-11-04  1070  	if (!c) {
65d48e35250fe4 fs/bcachefs/super.c Kent Overstreet 2023-03-14  1071  		c = ERR_PTR(-BCH_ERR_ENOMEM_fs_alloc);
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1072  		goto out;
7be9ab637fb9c5 fs/bcachefs/super.c Chris Webb      2021-11-04  1073  	}
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1074  
a349868b5e2503 fs/bcachefs/super.c Kent Overstreet 2025-04-28  1075  	c->stdio = (void *)(unsigned long) opts->stdio;
2b41226d7f4b3b fs/bcachefs/super.c Kent Overstreet 2023-12-04  1076  
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1077  	__module_get(THIS_MODULE);
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1078  
505b7a4c2844d8 fs/bcachefs/super.c Kent Overstreet 2020-10-15  1079  	closure_init(&c->cl, NULL);
505b7a4c2844d8 fs/bcachefs/super.c Kent Overstreet 2020-10-15  1080  
505b7a4c2844d8 fs/bcachefs/super.c Kent Overstreet 2020-10-15  1081  	c->kobj.kset = bcachefs_kset;
505b7a4c2844d8 fs/bcachefs/super.c Kent Overstreet 2020-10-15  1082  	kobject_init(&c->kobj, &bch2_fs_ktype);
505b7a4c2844d8 fs/bcachefs/super.c Kent Overstreet 2020-10-15  1083  	kobject_init(&c->internal, &bch2_fs_internal_ktype);
505b7a4c2844d8 fs/bcachefs/super.c Kent Overstreet 2020-10-15  1084  	kobject_init(&c->opts_dir, &bch2_fs_opts_dir_ktype);
505b7a4c2844d8 fs/bcachefs/super.c Kent Overstreet 2020-10-15  1085  	kobject_init(&c->time_stats, &bch2_fs_time_stats_ktype);
104c69745fdf7e fs/bcachefs/super.c Daniel Hill     2022-03-15  1086  	kobject_init(&c->counters_kobj, &bch2_fs_counters_ktype);
505b7a4c2844d8 fs/bcachefs/super.c Kent Overstreet 2020-10-15  1087  
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1088  	c->minor		= -1;
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1089  	c->disk_sb.fs_sb	= true;
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1090  
1ada160618d66b fs/bcachefs/super.c Kent Overstreet 2020-06-15  1091  	init_rwsem(&c->state_lock);
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1092  	mutex_init(&c->sb_lock);
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1093  	mutex_init(&c->replicas_gc_lock);
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1094  	mutex_init(&c->btree_root_lock);
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1095  	INIT_WORK(&c->read_only_work, bch2_fs_read_only_work);
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1096  
63508b756443cb fs/bcachefs/super.c Kent Overstreet 2023-12-06  1097  	refcount_set(&c->ro_ref, 1);
63508b756443cb fs/bcachefs/super.c Kent Overstreet 2023-12-06  1098  	init_waitqueue_head(&c->ro_ref_wait);
63508b756443cb fs/bcachefs/super.c Kent Overstreet 2023-12-06  1099  
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1100  	for (i = 0; i < BCH_TIME_STAT_NR; i++)
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1101  		bch2_time_stats_init(&c->times[i]);
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1102  
b092dadd55fb24 fs/bcachefs/super.c Kent Overstreet 2018-11-04  1103  	bch2_fs_allocator_background_init(c);
b092dadd55fb24 fs/bcachefs/super.c Kent Overstreet 2018-11-04  1104  	bch2_fs_allocator_foreground_init(c);
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1105  	bch2_fs_btree_cache_init_early(&c->btree_cache);
a17e985be9831b fs/bcachefs/super.c Kent Overstreet 2025-04-05  1106  	bch2_fs_btree_gc_init_early(c);
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1107  	bch2_fs_btree_interior_update_init_early(c);
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1108  	bch2_fs_btree_iter_init_early(c);
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1109  	bch2_fs_btree_key_cache_init_early(&c->btree_key_cache);
a17e985be9831b fs/bcachefs/super.c Kent Overstreet 2025-04-05  1110  	bch2_fs_btree_write_buffer_init_early(c);
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1111  	bch2_fs_copygc_init(c);
84c72755b9aab3 fs/bcachefs/super.c Kent Overstreet 2022-04-09  1112  	bch2_fs_ec_init_early(c);
a17e985be9831b fs/bcachefs/super.c Kent Overstreet 2025-04-05  1113  	bch2_fs_journal_init_early(&c->journal);
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1114  	bch2_fs_journal_keys_init(c);
b9fa375bab2786 fs/bcachefs/super.c Kent Overstreet 2023-03-11  1115  	bch2_fs_move_init(c);
a17e985be9831b fs/bcachefs/super.c Kent Overstreet 2025-04-05  1116  	bch2_fs_nocow_locking_init_early(c);
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1117  	bch2_fs_quota_init(c);
001c1d146f3862 fs/bcachefs/super.c Kent Overstreet 2025-05-09  1118  	bch2_fs_recovery_passes_init(c);
f5d26fa31ed2e2 fs/bcachefs/super.c Kent Overstreet 2023-10-25  1119  	bch2_fs_sb_errors_init_early(c);
15dbd0d8146356 fs/bcachefs/super.c Kent Overstreet 2025-05-01  1120  	bch2_fs_snapshots_init_early(c);
a17e985be9831b fs/bcachefs/super.c Kent Overstreet 2025-04-05  1121  	bch2_fs_subvolumes_init_early(c);
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1122  
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1123  	INIT_LIST_HEAD(&c->list);
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1124  
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1125  	mutex_init(&c->bio_bounce_pages_lock);
14b393ee768e83 fs/bcachefs/super.c Kent Overstreet 2021-03-16  1126  	mutex_init(&c->snapshot_table_lock);
37fad9497f5d37 fs/bcachefs/super.c Kent Overstreet 2023-09-29  1127  	init_rwsem(&c->snapshot_create_lock);
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1128  
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1129  	spin_lock_init(&c->btree_write_error_lock);
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1130  
5b593ee172bd53 fs/bcachefs/super.c Kent Overstreet 2021-01-26  1131  	INIT_LIST_HEAD(&c->journal_iters);
f1d786a0dbc448 fs/bcachefs/super.c Kent Overstreet 2020-03-25  1132  
f5d26fa31ed2e2 fs/bcachefs/super.c Kent Overstreet 2023-10-25  1133  	INIT_LIST_HEAD(&c->fsck_error_msgs);
f5d26fa31ed2e2 fs/bcachefs/super.c Kent Overstreet 2023-10-25  1134  	mutex_init(&c->fsck_error_msgs_lock);
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1135  
5e82a9a1f4f82e fs/bcachefs/super.c Kent Overstreet 2019-02-10  1136  	seqcount_init(&c->usage_lock);
5e82a9a1f4f82e fs/bcachefs/super.c Kent Overstreet 2019-02-10  1137  
ef1b20924b0f58 fs/bcachefs/super.c Kent Overstreet 2021-05-18  1138  	sema_init(&c->io_in_flight, 128);
ef1b20924b0f58 fs/bcachefs/super.c Kent Overstreet 2021-05-18  1139  
9edbcc72f6987b fs/bcachefs/super.c Kent Overstreet 2023-03-15  1140  	INIT_LIST_HEAD(&c->vfs_inodes_list);
9edbcc72f6987b fs/bcachefs/super.c Kent Overstreet 2023-03-15  1141  	mutex_init(&c->vfs_inodes_lock);
9edbcc72f6987b fs/bcachefs/super.c Kent Overstreet 2023-03-15  1142  
991ba021129088 fs/bcachefs/super.c Kent Overstreet 2021-12-10  1143  	c->journal.flush_write_time	= &c->times[BCH_TIME_journal_flush_write];
991ba021129088 fs/bcachefs/super.c Kent Overstreet 2021-12-10  1144  	c->journal.noflush_write_time	= &c->times[BCH_TIME_journal_noflush_write];
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1145  	c->journal.flush_seq_time	= &c->times[BCH_TIME_journal_flush_seq];
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1146  
fca1223ccfac2a fs/bcachefs/super.c Kent Overstreet 2020-12-03  1147  	mutex_init(&c->sectors_available_lock);
fca1223ccfac2a fs/bcachefs/super.c Kent Overstreet 2020-12-03  1148  
e2b605601ad569 fs/bcachefs/super.c Kent Overstreet 2021-11-05  1149  	ret = percpu_init_rwsem(&c->mark_lock);
e2b605601ad569 fs/bcachefs/super.c Kent Overstreet 2021-11-05  1150  	if (ret)
73e6ab95640a7d fs/bcachefs/super.c Kent Overstreet 2018-12-01  1151  		goto err;
73e6ab95640a7d fs/bcachefs/super.c Kent Overstreet 2018-12-01  1152  
0d7fd3bd2d8742 fs/bcachefs/super.c Kent Overstreet 2025-07-14  1153  	scoped_guard(mutex, &c->sb_lock)
e2b605601ad569 fs/bcachefs/super.c Kent Overstreet 2021-11-05  1154  		ret = bch2_sb_to_fs(c, sb);
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1155  
e2b605601ad569 fs/bcachefs/super.c Kent Overstreet 2021-11-05  1156  	if (ret)
e2b605601ad569 fs/bcachefs/super.c Kent Overstreet 2021-11-05  1157  		goto err;
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1158  
2430e72f42778a fs/bcachefs/super.c Kent Overstreet 2021-12-04  1159  	/* Compat: */
73bd774d28d2b2 fs/bcachefs/super.c Kent Overstreet 2023-07-06  1160  	if (le16_to_cpu(sb->version) <= bcachefs_metadata_version_inode_v2 &&
2430e72f42778a fs/bcachefs/super.c Kent Overstreet 2021-12-04  1161  	    !BCH_SB_JOURNAL_FLUSH_DELAY(sb))
2430e72f42778a fs/bcachefs/super.c Kent Overstreet 2021-12-04  1162  		SET_BCH_SB_JOURNAL_FLUSH_DELAY(sb, 1000);
2430e72f42778a fs/bcachefs/super.c Kent Overstreet 2021-12-04  1163  
73bd774d28d2b2 fs/bcachefs/super.c Kent Overstreet 2023-07-06  1164  	if (le16_to_cpu(sb->version) <= bcachefs_metadata_version_inode_v2 &&
2430e72f42778a fs/bcachefs/super.c Kent Overstreet 2021-12-04  1165  	    !BCH_SB_JOURNAL_RECLAIM_DELAY(sb))
2430e72f42778a fs/bcachefs/super.c Kent Overstreet 2021-12-04  1166  		SET_BCH_SB_JOURNAL_RECLAIM_DELAY(sb, 100);
2430e72f42778a fs/bcachefs/super.c Kent Overstreet 2021-12-04  1167  
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1168  	c->opts = bch2_opts_default;
8244f3209b5b49 fs/bcachefs/super.c Kent Overstreet 2021-12-14  1169  	ret = bch2_opts_from_sb(&c->opts, sb);
8244f3209b5b49 fs/bcachefs/super.c Kent Overstreet 2021-12-14  1170  	if (ret)
8244f3209b5b49 fs/bcachefs/super.c Kent Overstreet 2021-12-14  1171  		goto err;
8244f3209b5b49 fs/bcachefs/super.c Kent Overstreet 2021-12-14  1172  
a349868b5e2503 fs/bcachefs/super.c Kent Overstreet 2025-04-28  1173  	bch2_opts_apply(&c->opts, *opts);
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1174  
67b8a8afcb04e2 fs/bcachefs/super.c Kent Overstreet 2025-09-06  1175  #ifdef __KERNEL__
9caea9208fc3fb fs/bcachefs/super.c Kent Overstreet 2025-05-23  1176  	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
9caea9208fc3fb fs/bcachefs/super.c Kent Overstreet 2025-05-23 @1177  	    c->opts.block_size > PAGE_SIZE) {
9caea9208fc3fb fs/bcachefs/super.c Kent Overstreet 2025-05-23  1178  		bch_err(c, "cannot mount bs > ps filesystem without CONFIG_TRANSPARENT_HUGEPAGE");
9caea9208fc3fb fs/bcachefs/super.c Kent Overstreet 2025-05-23  1179  		ret = -EINVAL;
9caea9208fc3fb fs/bcachefs/super.c Kent Overstreet 2025-05-23  1180  		goto err;
9caea9208fc3fb fs/bcachefs/super.c Kent Overstreet 2025-05-23  1181  	}
67b8a8afcb04e2 fs/bcachefs/super.c Kent Overstreet 2025-09-06  1182  #endif
9caea9208fc3fb fs/bcachefs/super.c Kent Overstreet 2025-05-23  1183  
7c8f6f980dc85f fs/bcachefs/super.c Kent Overstreet 2022-01-12  1184  	c->btree_key_cache_btrees |= 1U << BTREE_ID_alloc;
7c8f6f980dc85f fs/bcachefs/super.c Kent Overstreet 2022-01-12  1185  	if (c->opts.inodes_use_key_cache)
7c8f6f980dc85f fs/bcachefs/super.c Kent Overstreet 2022-01-12  1186  		c->btree_key_cache_btrees |= 1U << BTREE_ID_inodes;
aaad530ac6b1c8 fs/bcachefs/super.c Kent Overstreet 2023-08-27  1187  	c->btree_key_cache_btrees |= 1U << BTREE_ID_logged_ops;
7c8f6f980dc85f fs/bcachefs/super.c Kent Overstreet 2022-01-12  1188  
8244f3209b5b49 fs/bcachefs/super.c Kent Overstreet 2021-12-14  1189  	c->block_bits		= ilog2(block_sectors(c));
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1190  	c->btree_foreground_merge_threshold = BTREE_FOREGROUND_MERGE_THRESHOLD(c);
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1191  
7be9ab637fb9c5 fs/bcachefs/super.c Chris Webb      2021-11-04  1192  	if (bch2_fs_init_fault("fs_alloc")) {
e2b605601ad569 fs/bcachefs/super.c Kent Overstreet 2021-11-05  1193  		bch_err(c, "fs_alloc fault injected");
e2b605601ad569 fs/bcachefs/super.c Kent Overstreet 2021-11-05  1194  		ret = -EFAULT;
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1195  		goto err;
7be9ab637fb9c5 fs/bcachefs/super.c Chris Webb      2021-11-04  1196  	}
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1197  
c02e5b57283ad6 fs/bcachefs/super.c Kent Overstreet 2025-04-02  1198  	if (c->sb.multi_device)
58c36e6710d3b3 fs/bcachefs/super.c Kent Overstreet 2025-04-03  1199  		pr_uuid(&name, c->sb.user_uuid.b);
58c36e6710d3b3 fs/bcachefs/super.c Kent Overstreet 2025-04-03  1200  	else
58c36e6710d3b3 fs/bcachefs/super.c Kent Overstreet 2025-04-03  1201  		prt_bdevname(&name, sbs->data[0].bdev);
58c36e6710d3b3 fs/bcachefs/super.c Kent Overstreet 2025-04-03  1202  
58c36e6710d3b3 fs/bcachefs/super.c Kent Overstreet 2025-04-03  1203  	ret = name.allocation_failure ? -BCH_ERR_ENOMEM_fs_name_alloc : 0;
58c36e6710d3b3 fs/bcachefs/super.c Kent Overstreet 2025-04-03  1204  	if (ret)
58c36e6710d3b3 fs/bcachefs/super.c Kent Overstreet 2025-04-03  1205  		goto err;
58c36e6710d3b3 fs/bcachefs/super.c Kent Overstreet 2025-04-03  1206  
58c36e6710d3b3 fs/bcachefs/super.c Kent Overstreet 2025-04-03  1207  	strscpy(c->name, name.buf, sizeof(c->name));
58c36e6710d3b3 fs/bcachefs/super.c Kent Overstreet 2025-04-03  1208  
ae2f17d5ad02bc fs/bcachefs/super.c Kent Overstreet 2019-12-14  1209  	iter_size = sizeof(struct sort_iter) +
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1210  		(btree_blocks(c) + 1) * 2 *
ae2f17d5ad02bc fs/bcachefs/super.c Kent Overstreet 2019-12-14  1211  		sizeof(struct sort_iter_set);
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1212  
d4d71b58e5139a fs/bcachefs/super.c Kent Overstreet 2025-04-05  1213  	if (!(c->btree_read_complete_wq = alloc_workqueue("bcachefs_btree_read_complete",
6b83aee8a41b12 fs/bcachefs/super.c Kent Overstreet 2024-01-22  1214  				WQ_HIGHPRI|WQ_FREEZABLE|WQ_MEM_RECLAIM, 512)) ||
c9b1d94a2196fc fs/bcachefs/super.c Kent Overstreet 2025-04-18  1215  	    enumerated_ref_init(&c->writes, BCH_WRITE_REF_NR,
c9b1d94a2196fc fs/bcachefs/super.c Kent Overstreet 2025-04-18  1216  				bch2_writes_disabled) ||
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1217  	    mempool_init_kmalloc_pool(&c->fill_iter, 1, iter_size) ||
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1218  	    bioset_init(&c->btree_bio, 1,
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1219  			max(offsetof(struct btree_read_bio, bio),
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1220  			    offsetof(struct btree_write_bio, wbio.bio)),
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1221  			BIOSET_NEED_BVECS) ||
5663a4152138fd fs/bcachefs/super.c Kent Overstreet 2018-11-27  1222  	    !(c->pcpu = alloc_percpu(struct bch_fs_pcpu)) ||
8bb8d683a4013f fs/bcachefs/super.c Kent Overstreet 2023-12-27  1223  	    !(c->usage = alloc_percpu(struct bch_fs_usage_base)) ||
5e82a9a1f4f82e fs/bcachefs/super.c Kent Overstreet 2019-02-10  1224  	    !(c->online_reserved = alloc_percpu(u64)) ||
cb6fc943b650c4 fs/bcachefs/super.c Kent Overstreet 2024-02-01  1225  	    mempool_init_kvmalloc_pool(&c->btree_bounce_pool, 1,
ec4edd7b9d2038 fs/bcachefs/super.c Kent Overstreet 2024-01-16  1226  				       c->opts.btree_node_size) ||
df448ca355ce84 fs/bcachefs/super.c Kent Overstreet 2024-12-01  1227  	    mempool_init_kmalloc_pool(&c->large_bkey_pool, 1, 2048)) {
09b9c72bd4b77a fs/bcachefs/super.c Kent Overstreet 2025-05-28  1228  		ret = bch_err_throw(c, ENOMEM_fs_other_alloc);
7be9ab637fb9c5 fs/bcachefs/super.c Chris Webb      2021-11-04  1229  		goto err;
7be9ab637fb9c5 fs/bcachefs/super.c Chris Webb      2021-11-04  1230  	}
7be9ab637fb9c5 fs/bcachefs/super.c Chris Webb      2021-11-04  1231  
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1232  	ret =
0499a82b18b5dd fs/bcachefs/super.c Kent Overstreet 2025-04-21  1233  	    bch2_fs_async_obj_init(c) ?:
3466077e580c52 fs/bcachefs/super.c Kent Overstreet 2025-08-02  1234  	    bch2_blacklist_table_initialize(c) ?:
e2b605601ad569 fs/bcachefs/super.c Kent Overstreet 2021-11-05  1235  	    bch2_fs_btree_cache_init(c) ?:
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1236  	    bch2_fs_btree_iter_init(c) ?:
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1237  	    bch2_fs_btree_key_cache_init(&c->btree_key_cache) ?:
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1238  	    bch2_fs_buckets_waiting_for_journal_init(c) ?:
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1239  	    bch2_io_clock_init(&c->io_clock[READ]) ?:
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1240  	    bch2_io_clock_init(&c->io_clock[WRITE]) ?:
e2b605601ad569 fs/bcachefs/super.c Kent Overstreet 2021-11-05  1241  	    bch2_fs_compress_init(c) ?:
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1242  	    bch2_fs_counters_init(c) ?:
e2b605601ad569 fs/bcachefs/super.c Kent Overstreet 2021-11-05  1243  	    bch2_fs_ec_init(c) ?:
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1244  	    bch2_fs_encryption_init(c) ?:
dbbfca9f41e869 fs/bcachefs/super.c Kent Overstreet 2023-08-03  1245  	    bch2_fs_fsio_init(c) ?:
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1246  	    bch2_fs_fs_io_direct_init(c) ?:
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1247  	    bch2_fs_io_read_init(c) ?:
96fc7d8adb7881 fs/bcachefs/super.c Kent Overstreet 2025-05-05  1248  	    bch2_fs_rebalance_init(c) ?:
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1249  	    bch2_fs_sb_errors_init(c) ?:
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1250  	    bch2_fs_vfs_init(c);
7be9ab637fb9c5 fs/bcachefs/super.c Chris Webb      2021-11-04  1251  	if (ret)
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1252  		goto err;
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1253  
39c7eb806fbf32 fs/bcachefs/super.c Kent Overstreet 2025-09-05  1254  	/*
39c7eb806fbf32 fs/bcachefs/super.c Kent Overstreet 2025-09-05  1255  	 * just make sure this is always allocated if we might need it - mount
39c7eb806fbf32 fs/bcachefs/super.c Kent Overstreet 2025-09-05  1256  	 * failing due to kthread_create() failing is _very_ annoying
39c7eb806fbf32 fs/bcachefs/super.c Kent Overstreet 2025-09-05  1257  	 */
39c7eb806fbf32 fs/bcachefs/super.c Kent Overstreet 2025-09-05  1258  	if (!(c->sb.features & BIT_ULL(BCH_FEATURE_no_alloc_info)) ||
39c7eb806fbf32 fs/bcachefs/super.c Kent Overstreet 2025-09-05  1259  	    go_rw_in_recovery(c)) {
1cddad0fcbccc7 fs/bcachefs/super.c Kent Overstreet 2025-06-15  1260  		/*
1cddad0fcbccc7 fs/bcachefs/super.c Kent Overstreet 2025-06-15  1261  		 * start workqueues/kworkers early - kthread creation checks for
1cddad0fcbccc7 fs/bcachefs/super.c Kent Overstreet 2025-06-15  1262  		 * pending signals, which is _very_ annoying
1cddad0fcbccc7 fs/bcachefs/super.c Kent Overstreet 2025-06-15  1263  		 */
1cddad0fcbccc7 fs/bcachefs/super.c Kent Overstreet 2025-06-15  1264  		ret = bch2_fs_init_rw(c);
1cddad0fcbccc7 fs/bcachefs/super.c Kent Overstreet 2025-06-15  1265  		if (ret)
1cddad0fcbccc7 fs/bcachefs/super.c Kent Overstreet 2025-06-15  1266  			goto err;
1cddad0fcbccc7 fs/bcachefs/super.c Kent Overstreet 2025-06-15  1267  	}
1cddad0fcbccc7 fs/bcachefs/super.c Kent Overstreet 2025-06-15  1268  

:::::: The code at line 1177 was first introduced by commit
:::::: 9caea9208fc3fbdbd4a41a2de8c6a0c969b030f9 bcachefs: Don't mount bs > ps without TRANSPARENT_HUGEPAGE

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
