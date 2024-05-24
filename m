Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31E73A268;
	Fri, 24 May 2024 18:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716575866; cv=none; b=VP+nwcClm7vd9I6LOk8b/hVxJi83YQlnqCXQbrzQRE/0MjYN5RMDutS8Me1p8Al4/HXhFMH3HBR2djQjn8K0ddrDI4lVICGFg4QWnrqgzld58Vt6mXXAGJj2nqDh7X6X1ET5FASjrSw2JobIWQ6esOj/qYTldRyN511QQk1NLWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716575866; c=relaxed/simple;
	bh=WuZsFTk4V1/+re+xCpFbakqU6PKXmJJRF7pBxJTebww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cdHeNMYTge3sVazY3PeG9S9jYu4rPbC/nhiKGO89MvnTSnSWF/n5eqPlbCda9RQEAv91Ik26l2mdEktrpqtwnQ/wAT5d6Hh70/HGZUzCcwekY10RAImVenoITtcUQO/n4pTC7P8LiLU5k9uynr5ClvcEHJRTe2PMIoMWOVKahbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NuCGJj72; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NuCGJj72"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716575865; x=1748111865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WuZsFTk4V1/+re+xCpFbakqU6PKXmJJRF7pBxJTebww=;
  b=NuCGJj72kh8arUt2mXzZTgAgSSAACy/jnObEIYEGlmFFvVh2D3+ZxtMq
   xvS77hCknJFmGUDgg4/nsjUG6GQYkJpJwaZud6lpLtqoF6ggczPVGWHPP
   sEgRvcIlOKYe5MKDJqHXSWn+qqijx9aghRbYEXTF8202dPjr9L4dgRgHY
   zjRUdtzTu5/bxfpTwWTyHRYkYOJGkeRqSim5zunabac7P+dTUUtA6Bkim
   Aq+soMGG1f5mCCb1mftDhjJLmVsiG1Wju+kOSbn9ggQ5TqApqhBYK9SXk
   a3n2ozPfpDQl7WRk6z6UoQcRCLcuqDCdH9WGqqjZh06BNdPeUQZ6uAVNW
   w==;
X-CSE-ConnectionGUID: 61tYRHVZRsO9GiiieROSDQ==
X-CSE-MsgGUID: N1oq23b8TQqmYdROGki8eg==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="23631452"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="23631452"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 11:37:44 -0700
X-CSE-ConnectionGUID: lr/L+B/rTQmqSgP3TySIDA==
X-CSE-MsgGUID: auGwczonThyluRLsnAy3Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="34022031"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 24 May 2024 11:37:43 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAZmN-0005nL-0I;
	Fri, 24 May 2024 18:36:49 +0000
Date: Sat, 25 May 2024 02:36:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 19/20] fs/bcachefs/btree_io.c:737:22:
 warning: format specifies type 'unsigned int' but the argument has type
 'size_t' (aka 'unsigned long')
Message-ID: <202405250253.TtQZAfKA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   66168c7564110bd4d13fdae9ba677fad12d89728
commit: 4f2b201a5d676c84ca898273516c0cf8aec96ba4 [19/20] bcachefs: Check for bsets past bch_btree_ptr_v2.sectors_written
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240525/202405250253.TtQZAfKA-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7aa382fd7257d9bd4f7fc50bb7078a3c26a1628c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405250253.TtQZAfKA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405250253.TtQZAfKA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/btree_io.c:3:
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
>> fs/bcachefs/btree_io.c:737:22: warning: format specifies type 'unsigned int' but the argument has type 'size_t' (aka 'unsigned long') [-Wformat]
     736 |                          "bset past end of btree node (offset %u len %u but written %u)",
         |                                                                                     ~~
         |                                                                                     %zu
     737 |                          offset, sectors, ptr_written ?: btree_sectors(c))) {
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_io.c:628:53: note: expanded from macro 'btree_err_on'
     628 | #define btree_err_on(cond, ...) ((cond) ? btree_err(__VA_ARGS__) : false)
         |                                                     ^~~~~~~~~~~
   fs/bcachefs/btree_io.c:618:18: note: expanded from macro 'btree_err'
     618 |                                msg, ##__VA_ARGS__);                     \
         |                                ~~~    ^~~~~~~~~~~
   fs/bcachefs/btree_io.c:1890:36: warning: bitwise operation between different enumeration types ('enum bch_watermark' and 'enum bch_trans_commit_flags') [-Wenum-enum-conversion]
    1890 |                                         BCH_WATERMARK_interior_updates|
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
    1891 |                                         BCH_TRANS_COMMIT_journal_reclaim|
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_update.h:190:71: note: expanded from macro 'bch2_trans_do'
     190 |         bch2_trans_run(_c, commit_do(trans, _disk_res, _journal_seq, _flags, _do))
         |                                                                              ^~~
   fs/bcachefs/btree_update.h:174:25: note: expanded from macro 'commit_do'
     174 |         lockrestart_do(_trans, _do ?: bch2_trans_commit(_trans, (_disk_res),\
         |                                ^~~
   fs/bcachefs/btree_iter.h:670:11: note: expanded from macro 'lockrestart_do'
     670 |         _ret2 = (_do);                                                  \
         |                  ^~~
   fs/bcachefs/btree_update.h:184:14: note: expanded from macro 'bch2_trans_run'
     184 |         int _ret = (_do);                                               \
         |                     ^~~
   7 warnings generated.


vim +737 fs/bcachefs/btree_io.c

   680	
   681	static int validate_bset(struct bch_fs *c, struct bch_dev *ca,
   682				 struct btree *b, struct bset *i,
   683				 unsigned offset, unsigned sectors,
   684				 int write, bool have_retry, bool *saw_error)
   685	{
   686		unsigned version = le16_to_cpu(i->version);
   687		unsigned ptr_written = btree_ptr_sectors_written(&b->key);
   688		struct printbuf buf1 = PRINTBUF;
   689		struct printbuf buf2 = PRINTBUF;
   690		int ret = 0;
   691	
   692		btree_err_on(!bch2_version_compatible(version),
   693			     -BCH_ERR_btree_node_read_err_incompatible,
   694			     c, ca, b, i,
   695			     btree_node_unsupported_version,
   696			     "unsupported bset version %u.%u",
   697			     BCH_VERSION_MAJOR(version),
   698			     BCH_VERSION_MINOR(version));
   699	
   700		if (btree_err_on(version < c->sb.version_min,
   701				 -BCH_ERR_btree_node_read_err_fixable,
   702				 c, NULL, b, i,
   703				 btree_node_bset_older_than_sb_min,
   704				 "bset version %u older than superblock version_min %u",
   705				 version, c->sb.version_min)) {
   706			mutex_lock(&c->sb_lock);
   707			c->disk_sb.sb->version_min = cpu_to_le16(version);
   708			bch2_write_super(c);
   709			mutex_unlock(&c->sb_lock);
   710		}
   711	
   712		if (btree_err_on(BCH_VERSION_MAJOR(version) >
   713				 BCH_VERSION_MAJOR(c->sb.version),
   714				 -BCH_ERR_btree_node_read_err_fixable,
   715				 c, NULL, b, i,
   716				 btree_node_bset_newer_than_sb,
   717				 "bset version %u newer than superblock version %u",
   718				 version, c->sb.version)) {
   719			mutex_lock(&c->sb_lock);
   720			c->disk_sb.sb->version = cpu_to_le16(version);
   721			bch2_write_super(c);
   722			mutex_unlock(&c->sb_lock);
   723		}
   724	
   725		btree_err_on(BSET_SEPARATE_WHITEOUTS(i),
   726			     -BCH_ERR_btree_node_read_err_incompatible,
   727			     c, ca, b, i,
   728			     btree_node_unsupported_version,
   729			     "BSET_SEPARATE_WHITEOUTS no longer supported");
   730	
   731		if (!write &&
   732		    btree_err_on(offset + sectors > (ptr_written ?: btree_sectors(c)),
   733				 -BCH_ERR_btree_node_read_err_fixable,
   734				 c, ca, b, i,
   735				 bset_past_end_of_btree_node,
   736				 "bset past end of btree node (offset %u len %u but written %u)",
 > 737				 offset, sectors, ptr_written ?: btree_sectors(c))) {
   738			i->u64s = 0;
   739			ret = 0;
   740			goto out;
   741		}
   742	
   743		btree_err_on(offset && !i->u64s,
   744			     -BCH_ERR_btree_node_read_err_fixable,
   745			     c, ca, b, i,
   746			     bset_empty,
   747			     "empty bset");
   748	
   749		btree_err_on(BSET_OFFSET(i) && BSET_OFFSET(i) != offset,
   750			     -BCH_ERR_btree_node_read_err_want_retry,
   751			     c, ca, b, i,
   752			     bset_wrong_sector_offset,
   753			     "bset at wrong sector offset");
   754	
   755		if (!offset) {
   756			struct btree_node *bn =
   757				container_of(i, struct btree_node, keys);
   758			/* These indicate that we read the wrong btree node: */
   759	
   760			if (b->key.k.type == KEY_TYPE_btree_ptr_v2) {
   761				struct bch_btree_ptr_v2 *bp =
   762					&bkey_i_to_btree_ptr_v2(&b->key)->v;
   763	
   764				/* XXX endianness */
   765				btree_err_on(bp->seq != bn->keys.seq,
   766					     -BCH_ERR_btree_node_read_err_must_retry,
   767					     c, ca, b, NULL,
   768					     bset_bad_seq,
   769					     "incorrect sequence number (wrong btree node)");
   770			}
   771	
   772			btree_err_on(BTREE_NODE_ID(bn) != b->c.btree_id,
   773				     -BCH_ERR_btree_node_read_err_must_retry,
   774				     c, ca, b, i,
   775				     btree_node_bad_btree,
   776				     "incorrect btree id");
   777	
   778			btree_err_on(BTREE_NODE_LEVEL(bn) != b->c.level,
   779				     -BCH_ERR_btree_node_read_err_must_retry,
   780				     c, ca, b, i,
   781				     btree_node_bad_level,
   782				     "incorrect level");
   783	
   784			if (!write)
   785				compat_btree_node(b->c.level, b->c.btree_id, version,
   786						  BSET_BIG_ENDIAN(i), write, bn);
   787	
   788			if (b->key.k.type == KEY_TYPE_btree_ptr_v2) {
   789				struct bch_btree_ptr_v2 *bp =
   790					&bkey_i_to_btree_ptr_v2(&b->key)->v;
   791	
   792				if (BTREE_PTR_RANGE_UPDATED(bp)) {
   793					b->data->min_key = bp->min_key;
   794					b->data->max_key = b->key.k.p;
   795				}
   796	
   797				btree_err_on(!bpos_eq(b->data->min_key, bp->min_key),
   798					     -BCH_ERR_btree_node_read_err_must_retry,
   799					     c, ca, b, NULL,
   800					     btree_node_bad_min_key,
   801					     "incorrect min_key: got %s should be %s",
   802					     (printbuf_reset(&buf1),
   803					      bch2_bpos_to_text(&buf1, bn->min_key), buf1.buf),
   804					     (printbuf_reset(&buf2),
   805					      bch2_bpos_to_text(&buf2, bp->min_key), buf2.buf));
   806			}
   807	
   808			btree_err_on(!bpos_eq(bn->max_key, b->key.k.p),
   809				     -BCH_ERR_btree_node_read_err_must_retry,
   810				     c, ca, b, i,
   811				     btree_node_bad_max_key,
   812				     "incorrect max key %s",
   813				     (printbuf_reset(&buf1),
   814				      bch2_bpos_to_text(&buf1, bn->max_key), buf1.buf));
   815	
   816			if (write)
   817				compat_btree_node(b->c.level, b->c.btree_id, version,
   818						  BSET_BIG_ENDIAN(i), write, bn);
   819	
   820			btree_err_on(bch2_bkey_format_invalid(c, &bn->format, write, &buf1),
   821				     -BCH_ERR_btree_node_read_err_bad_node,
   822				     c, ca, b, i,
   823				     btree_node_bad_format,
   824				     "invalid bkey format: %s\n  %s", buf1.buf,
   825				     (printbuf_reset(&buf2),
   826				      bch2_bkey_format_to_text(&buf2, &bn->format), buf2.buf));
   827			printbuf_reset(&buf1);
   828	
   829			compat_bformat(b->c.level, b->c.btree_id, version,
   830				       BSET_BIG_ENDIAN(i), write,
   831				       &bn->format);
   832		}
   833	out:
   834	fsck_err:
   835		printbuf_exit(&buf2);
   836		printbuf_exit(&buf1);
   837		return ret;
   838	}
   839	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
