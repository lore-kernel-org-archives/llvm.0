Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0C0197A82;
	Fri,  8 Nov 2024 10:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731062644; cv=none; b=DR75ZQr5+v+APgWPZfMXrMPUytLPim/FjGnlXRMDtxRdCIDn5jkE2fNWNeGCNXbMLq0HJKf6u672Dk2Qx/hlqn4CScwxNqb2Y5ssEnmN5XGom5EbX4O/gPgZewFEfwi3gqTwM3760iMUJDEWZJ0DQib/TZ07bq6fRDmygZPLBmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731062644; c=relaxed/simple;
	bh=pKVfJHvvQLAwg+GAuopJ1p7Sbn4EliRCuovpLfmOBjg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Alg6uniTYP87dGWBLqz9DlDWcqVx0yrrhUjVKamqqI6ce3S1Ehxwvn4Hk2yPUdQDMbx2JaAwDmAF3mAEpYU6urqquFSLWDQHkmAb1pTQCQfRh6Bem6aYXiLZJd5f7u8S02sFvfyfXoflBXy7+QqqFeRGEAy9v064JyAwUMDTMUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kAu4j7aH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kAu4j7aH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731062642; x=1762598642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pKVfJHvvQLAwg+GAuopJ1p7Sbn4EliRCuovpLfmOBjg=;
  b=kAu4j7aHlSNuGv9x98nzqrLgUBIdfa5Dsu9pEOJrIQZvZ/SSWRKO99YB
   GcYF+je5BIlqwTMT0ULuOlkkrJpHtlF7EYehvBDxzbmfvfaVFQlKilTgt
   HCyX3S6Nx84lc/fYYAOM7zhJ0+uiPtW0zfZkhdfg2oQkDU+Q38Qx5ee0s
   KDInk3NTyN4fFxLtukr37snjh/MxyJfqkMxZ7NlYdWLI58LzaYCnc1G44
   zeZhRWsA+XGemQb59pBsDyHLpTzBcn4ahqVIunmkq1k6gwnBPir1hySVV
   NIPV+D2yDEAQjfGTxd+K29y9h8pJ//u6WdSCnA8qKBsMRuMwyEGrevz40
   g==;
X-CSE-ConnectionGUID: 34QavX1VSqC8sQglR+gRtA==
X-CSE-MsgGUID: A6sryzeaT8et0XirLDT0OA==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="41556511"
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="41556511"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 02:44:01 -0800
X-CSE-ConnectionGUID: F6zfpPl0Twqu/j6cK8Fmmw==
X-CSE-MsgGUID: ebdBl/cwS7q+FnLQ5McUww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="85653755"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Nov 2024 02:44:00 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9MT7-000rKq-1k;
	Fri, 08 Nov 2024 10:43:57 +0000
Date: Fri, 8 Nov 2024 18:43:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 14/106] fs/bcachefs/btree_io.c:829:1:
 warning: unused label 'out'
Message-ID: <202411081800.PWsZWM56-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   58c37c5cc0d274e8b0d514d049e391186d879986
commit: a78c8274ea0c7ebccf2474a9c2e4a15cead79295 [14/106] bcachefs: Fix validate_bset() repair path
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241108/202411081800.PWsZWM56-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411081800.PWsZWM56-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411081800.PWsZWM56-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/btree_io.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> fs/bcachefs/btree_io.c:829:1: warning: unused label 'out' [-Wunused-label]
     829 | out:
         | ^~~~
   fs/bcachefs/btree_io.c:1873:36: warning: bitwise operation between different enumeration types ('enum bch_watermark' and 'enum bch_trans_commit_flags') [-Wenum-enum-conversion]
    1873 |                                         BCH_WATERMARK_interior_updates|
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
    1874 |                                         BCH_TRANS_COMMIT_journal_reclaim|
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:915:73: note: expanded from macro 'bch2_trans_do'
     915 | #define bch2_trans_do(_c, _do)  bch2_trans_run(_c, lockrestart_do(trans, _do))
         |                                                                          ^~~
   fs/bcachefs/btree_iter.h:714:11: note: expanded from macro 'lockrestart_do'
     714 |         _ret2 = (_do);                                                  \
         |                  ^~~
   fs/bcachefs/btree_iter.h:910:14: note: expanded from macro 'bch2_trans_run'
     910 |         int _ret = (_do);                                               \
         |                     ^~~
   6 warnings generated.


vim +/out +829 fs/bcachefs/btree_io.c

aae15aafcd43ec5 Kent Overstreet 2021-04-24  679  
91f6ad6f947c965 Kent Overstreet 2021-02-02  680  static int validate_bset(struct bch_fs *c, struct bch_dev *ca,
91f6ad6f947c965 Kent Overstreet 2021-02-02  681  			 struct btree *b, struct bset *i,
e719fc34f000048 Kent Overstreet 2021-07-16  682  			 unsigned offset, unsigned sectors,
494dcc57a7bf639 Kent Overstreet 2023-01-03  683  			 int write, bool have_retry, bool *saw_error)
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  684  {
39fb2983c586293 Kent Overstreet 2020-01-07  685  	unsigned version = le16_to_cpu(i->version);
652bc7fabc28294 Kent Overstreet 2024-05-24  686  	unsigned ptr_written = btree_ptr_sectors_written(bkey_i_to_s_c(&b->key));
fa8e94faeece12c Kent Overstreet 2022-02-25  687  	struct printbuf buf1 = PRINTBUF;
fa8e94faeece12c Kent Overstreet 2022-02-25  688  	struct printbuf buf2 = PRINTBUF;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  689  	int ret = 0;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  690  
a02a0121b3de81f Kent Overstreet 2023-06-28  691  	btree_err_on(!bch2_version_compatible(version),
b65db750e2bb925 Kent Overstreet 2023-10-24  692  		     -BCH_ERR_btree_node_read_err_incompatible,
1292bc2ebf63e70 Kent Overstreet 2024-05-24  693  		     c, ca, b, i, NULL,
b65db750e2bb925 Kent Overstreet 2023-10-24  694  		     btree_node_unsupported_version,
ba8eeae8eee0aae Kent Overstreet 2023-06-27  695  		     "unsupported bset version %u.%u",
ba8eeae8eee0aae Kent Overstreet 2023-06-27  696  		     BCH_VERSION_MAJOR(version),
ba8eeae8eee0aae Kent Overstreet 2023-06-27  697  		     BCH_VERSION_MINOR(version));
39fb2983c586293 Kent Overstreet 2020-01-07  698  
84cc758d6b19ae8 Kent Overstreet 2021-03-21  699  	if (btree_err_on(version < c->sb.version_min,
b65db750e2bb925 Kent Overstreet 2023-10-24  700  			 -BCH_ERR_btree_node_read_err_fixable,
1292bc2ebf63e70 Kent Overstreet 2024-05-24  701  			 c, NULL, b, i, NULL,
b65db750e2bb925 Kent Overstreet 2023-10-24  702  			 btree_node_bset_older_than_sb_min,
84cc758d6b19ae8 Kent Overstreet 2021-03-21  703  			 "bset version %u older than superblock version_min %u",
84cc758d6b19ae8 Kent Overstreet 2021-03-21  704  			 version, c->sb.version_min)) {
84cc758d6b19ae8 Kent Overstreet 2021-03-21  705  		mutex_lock(&c->sb_lock);
84cc758d6b19ae8 Kent Overstreet 2021-03-21  706  		c->disk_sb.sb->version_min = cpu_to_le16(version);
84cc758d6b19ae8 Kent Overstreet 2021-03-21  707  		bch2_write_super(c);
84cc758d6b19ae8 Kent Overstreet 2021-03-21  708  		mutex_unlock(&c->sb_lock);
84cc758d6b19ae8 Kent Overstreet 2021-03-21  709  	}
84cc758d6b19ae8 Kent Overstreet 2021-03-21  710  
ba8eeae8eee0aae Kent Overstreet 2023-06-27  711  	if (btree_err_on(BCH_VERSION_MAJOR(version) >
ba8eeae8eee0aae Kent Overstreet 2023-06-27  712  			 BCH_VERSION_MAJOR(c->sb.version),
b65db750e2bb925 Kent Overstreet 2023-10-24  713  			 -BCH_ERR_btree_node_read_err_fixable,
1292bc2ebf63e70 Kent Overstreet 2024-05-24  714  			 c, NULL, b, i, NULL,
b65db750e2bb925 Kent Overstreet 2023-10-24  715  			 btree_node_bset_newer_than_sb,
84cc758d6b19ae8 Kent Overstreet 2021-03-21  716  			 "bset version %u newer than superblock version %u",
84cc758d6b19ae8 Kent Overstreet 2021-03-21  717  			 version, c->sb.version)) {
84cc758d6b19ae8 Kent Overstreet 2021-03-21  718  		mutex_lock(&c->sb_lock);
84cc758d6b19ae8 Kent Overstreet 2021-03-21  719  		c->disk_sb.sb->version = cpu_to_le16(version);
84cc758d6b19ae8 Kent Overstreet 2021-03-21  720  		bch2_write_super(c);
84cc758d6b19ae8 Kent Overstreet 2021-03-21  721  		mutex_unlock(&c->sb_lock);
84cc758d6b19ae8 Kent Overstreet 2021-03-21  722  	}
84cc758d6b19ae8 Kent Overstreet 2021-03-21  723  
5f65d74d791d9bc Kent Overstreet 2021-03-29  724  	btree_err_on(BSET_SEPARATE_WHITEOUTS(i),
b65db750e2bb925 Kent Overstreet 2023-10-24  725  		     -BCH_ERR_btree_node_read_err_incompatible,
1292bc2ebf63e70 Kent Overstreet 2024-05-24  726  		     c, ca, b, i, NULL,
b65db750e2bb925 Kent Overstreet 2023-10-24  727  		     btree_node_unsupported_version,
5f65d74d791d9bc Kent Overstreet 2021-03-29  728  		     "BSET_SEPARATE_WHITEOUTS no longer supported");
5f65d74d791d9bc Kent Overstreet 2021-03-29  729  
9cc8eb3098b8e78 Kent Overstreet 2024-05-10  730  	if (!write &&
9cc8eb3098b8e78 Kent Overstreet 2024-05-10  731  	    btree_err_on(offset + sectors > (ptr_written ?: btree_sectors(c)),
b65db750e2bb925 Kent Overstreet 2023-10-24  732  			 -BCH_ERR_btree_node_read_err_fixable,
1292bc2ebf63e70 Kent Overstreet 2024-05-24  733  			 c, ca, b, i, NULL,
b65db750e2bb925 Kent Overstreet 2023-10-24  734  			 bset_past_end_of_btree_node,
9cc8eb3098b8e78 Kent Overstreet 2024-05-10  735  			 "bset past end of btree node (offset %u len %u but written %zu)",
a78c8274ea0c7eb Kent Overstreet 2024-11-08  736  			 offset, sectors, ptr_written ?: btree_sectors(c)))
39fb2983c586293 Kent Overstreet 2020-01-07  737  		i->u64s = 0;
39fb2983c586293 Kent Overstreet 2020-01-07  738  
e719fc34f000048 Kent Overstreet 2021-07-16  739  	btree_err_on(offset && !i->u64s,
b65db750e2bb925 Kent Overstreet 2023-10-24  740  		     -BCH_ERR_btree_node_read_err_fixable,
1292bc2ebf63e70 Kent Overstreet 2024-05-24  741  		     c, ca, b, i, NULL,
b65db750e2bb925 Kent Overstreet 2023-10-24  742  		     bset_empty,
39fb2983c586293 Kent Overstreet 2020-01-07  743  		     "empty bset");
39fb2983c586293 Kent Overstreet 2020-01-07  744  
b65db750e2bb925 Kent Overstreet 2023-10-24  745  	btree_err_on(BSET_OFFSET(i) && BSET_OFFSET(i) != offset,
b65db750e2bb925 Kent Overstreet 2023-10-24  746  		     -BCH_ERR_btree_node_read_err_want_retry,
1292bc2ebf63e70 Kent Overstreet 2024-05-24  747  		     c, ca, b, i, NULL,
b65db750e2bb925 Kent Overstreet 2023-10-24  748  		     bset_wrong_sector_offset,
e719fc34f000048 Kent Overstreet 2021-07-16  749  		     "bset at wrong sector offset");
e719fc34f000048 Kent Overstreet 2021-07-16  750  
e719fc34f000048 Kent Overstreet 2021-07-16  751  	if (!offset) {
39fb2983c586293 Kent Overstreet 2020-01-07  752  		struct btree_node *bn =
39fb2983c586293 Kent Overstreet 2020-01-07  753  			container_of(i, struct btree_node, keys);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  754  		/* These indicate that we read the wrong btree node: */
f36dff2885ee709 Kent Overstreet 2020-05-12  755  
f36dff2885ee709 Kent Overstreet 2020-05-12  756  		if (b->key.k.type == KEY_TYPE_btree_ptr_v2) {
f36dff2885ee709 Kent Overstreet 2020-05-12  757  			struct bch_btree_ptr_v2 *bp =
f36dff2885ee709 Kent Overstreet 2020-05-12  758  				&bkey_i_to_btree_ptr_v2(&b->key)->v;
f36dff2885ee709 Kent Overstreet 2020-05-12  759  
f36dff2885ee709 Kent Overstreet 2020-05-12  760  			/* XXX endianness */
f36dff2885ee709 Kent Overstreet 2020-05-12  761  			btree_err_on(bp->seq != bn->keys.seq,
b65db750e2bb925 Kent Overstreet 2023-10-24  762  				     -BCH_ERR_btree_node_read_err_must_retry,
1292bc2ebf63e70 Kent Overstreet 2024-05-24  763  				     c, ca, b, NULL, NULL,
b65db750e2bb925 Kent Overstreet 2023-10-24  764  				     bset_bad_seq,
f36dff2885ee709 Kent Overstreet 2020-05-12  765  				     "incorrect sequence number (wrong btree node)");
f36dff2885ee709 Kent Overstreet 2020-05-12  766  		}
f36dff2885ee709 Kent Overstreet 2020-05-12  767  
39fb2983c586293 Kent Overstreet 2020-01-07  768  		btree_err_on(BTREE_NODE_ID(bn) != b->c.btree_id,
b65db750e2bb925 Kent Overstreet 2023-10-24  769  			     -BCH_ERR_btree_node_read_err_must_retry,
1292bc2ebf63e70 Kent Overstreet 2024-05-24  770  			     c, ca, b, i, NULL,
b65db750e2bb925 Kent Overstreet 2023-10-24  771  			     btree_node_bad_btree,
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  772  			     "incorrect btree id");
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  773  
39fb2983c586293 Kent Overstreet 2020-01-07  774  		btree_err_on(BTREE_NODE_LEVEL(bn) != b->c.level,
b65db750e2bb925 Kent Overstreet 2023-10-24  775  			     -BCH_ERR_btree_node_read_err_must_retry,
1292bc2ebf63e70 Kent Overstreet 2024-05-24  776  			     c, ca, b, i, NULL,
b65db750e2bb925 Kent Overstreet 2023-10-24  777  			     btree_node_bad_level,
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  778  			     "incorrect level");
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  779  
39fb2983c586293 Kent Overstreet 2020-01-07  780  		if (!write)
39fb2983c586293 Kent Overstreet 2020-01-07  781  			compat_btree_node(b->c.level, b->c.btree_id, version,
39fb2983c586293 Kent Overstreet 2020-01-07  782  					  BSET_BIG_ENDIAN(i), write, bn);
39fb2983c586293 Kent Overstreet 2020-01-07  783  
548b3d209fa5c6a Kent Overstreet 2020-02-07  784  		if (b->key.k.type == KEY_TYPE_btree_ptr_v2) {
548b3d209fa5c6a Kent Overstreet 2020-02-07  785  			struct bch_btree_ptr_v2 *bp =
548b3d209fa5c6a Kent Overstreet 2020-02-07  786  				&bkey_i_to_btree_ptr_v2(&b->key)->v;
548b3d209fa5c6a Kent Overstreet 2020-02-07  787  
51d2dfb82d0553c Kent Overstreet 2021-01-26  788  			if (BTREE_PTR_RANGE_UPDATED(bp)) {
51d2dfb82d0553c Kent Overstreet 2021-01-26  789  				b->data->min_key = bp->min_key;
51d2dfb82d0553c Kent Overstreet 2021-01-26  790  				b->data->max_key = b->key.k.p;
51d2dfb82d0553c Kent Overstreet 2021-01-26  791  			}
51d2dfb82d0553c Kent Overstreet 2021-01-26  792  
e88a75ebe86c1df Kent Overstreet 2022-11-24  793  			btree_err_on(!bpos_eq(b->data->min_key, bp->min_key),
b65db750e2bb925 Kent Overstreet 2023-10-24  794  				     -BCH_ERR_btree_node_read_err_must_retry,
1292bc2ebf63e70 Kent Overstreet 2024-05-24  795  				     c, ca, b, NULL, NULL,
b65db750e2bb925 Kent Overstreet 2023-10-24  796  				     btree_node_bad_min_key,
f020bfcdb058e45 Kent Overstreet 2021-03-04  797  				     "incorrect min_key: got %s should be %s",
fa8e94faeece12c Kent Overstreet 2022-02-25  798  				     (printbuf_reset(&buf1),
fa8e94faeece12c Kent Overstreet 2022-02-25  799  				      bch2_bpos_to_text(&buf1, bn->min_key), buf1.buf),
fa8e94faeece12c Kent Overstreet 2022-02-25  800  				     (printbuf_reset(&buf2),
fa8e94faeece12c Kent Overstreet 2022-02-25  801  				      bch2_bpos_to_text(&buf2, bp->min_key), buf2.buf));
548b3d209fa5c6a Kent Overstreet 2020-02-07  802  		}
548b3d209fa5c6a Kent Overstreet 2020-02-07  803  
e88a75ebe86c1df Kent Overstreet 2022-11-24  804  		btree_err_on(!bpos_eq(bn->max_key, b->key.k.p),
b65db750e2bb925 Kent Overstreet 2023-10-24  805  			     -BCH_ERR_btree_node_read_err_must_retry,
1292bc2ebf63e70 Kent Overstreet 2024-05-24  806  			     c, ca, b, i, NULL,
b65db750e2bb925 Kent Overstreet 2023-10-24  807  			     btree_node_bad_max_key,
f020bfcdb058e45 Kent Overstreet 2021-03-04  808  			     "incorrect max key %s",
fa8e94faeece12c Kent Overstreet 2022-02-25  809  			     (printbuf_reset(&buf1),
fa8e94faeece12c Kent Overstreet 2022-02-25  810  			      bch2_bpos_to_text(&buf1, bn->max_key), buf1.buf));
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  811  
39fb2983c586293 Kent Overstreet 2020-01-07  812  		if (write)
39fb2983c586293 Kent Overstreet 2020-01-07  813  			compat_btree_node(b->c.level, b->c.btree_id, version,
39fb2983c586293 Kent Overstreet 2020-01-07  814  					  BSET_BIG_ENDIAN(i), write, bn);
39fb2983c586293 Kent Overstreet 2020-01-07  815  
e08e63e44e65761 Kent Overstreet 2023-08-06  816  		btree_err_on(bch2_bkey_format_invalid(c, &bn->format, write, &buf1),
b65db750e2bb925 Kent Overstreet 2023-10-24  817  			     -BCH_ERR_btree_node_read_err_bad_node,
1292bc2ebf63e70 Kent Overstreet 2024-05-24  818  			     c, ca, b, i, NULL,
b65db750e2bb925 Kent Overstreet 2023-10-24  819  			     btree_node_bad_format,
6c6439650ec913c Kent Overstreet 2023-08-03  820  			     "invalid bkey format: %s\n  %s", buf1.buf,
6c6439650ec913c Kent Overstreet 2023-08-03  821  			     (printbuf_reset(&buf2),
6c6439650ec913c Kent Overstreet 2023-08-03  822  			      bch2_bkey_format_to_text(&buf2, &bn->format), buf2.buf));
6c6439650ec913c Kent Overstreet 2023-08-03  823  		printbuf_reset(&buf1);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  824  
39fb2983c586293 Kent Overstreet 2020-01-07  825  		compat_bformat(b->c.level, b->c.btree_id, version,
39fb2983c586293 Kent Overstreet 2020-01-07  826  			       BSET_BIG_ENDIAN(i), write,
39fb2983c586293 Kent Overstreet 2020-01-07  827  			       &bn->format);
39fb2983c586293 Kent Overstreet 2020-01-07  828  	}
fa8e94faeece12c Kent Overstreet 2022-02-25 @829  out:
39fb2983c586293 Kent Overstreet 2020-01-07  830  fsck_err:
fa8e94faeece12c Kent Overstreet 2022-02-25  831  	printbuf_exit(&buf2);
fa8e94faeece12c Kent Overstreet 2022-02-25  832  	printbuf_exit(&buf1);
39fb2983c586293 Kent Overstreet 2020-01-07  833  	return ret;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  834  }
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  835  

:::::: The code at line 829 was first introduced by commit
:::::: fa8e94faeece12c20b541f647059f29867e98bc0 bcachefs: Heap allocate printbufs

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
