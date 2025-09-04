Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A7B284693;
	Thu,  4 Sep 2025 21:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757019624; cv=none; b=uPkbCsoDfs1en5UmfCHXsImIkrqYOCJe8aQUtfAlvqW6caTINWZmJLhPbW+Ae/b2ewGKVUOt1L1y8GWd2OBkAbvEBQRikGtipuKy3W9qoedRYZTTHUaAUyhszbenroSvZ37AOG3f9V7asVe48OLmM0HyudSP9r4EhtOKGo+t2QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757019624; c=relaxed/simple;
	bh=hfb0jJEaDVUQIZi23GABhhywWqoqoKPbPcj9mhXwHtk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XzfkLwhCt1PAmS5EGrSqQ5KlS1CNXZH8Pnlxb4w2BykpzVy9XOm4qztxGVC+lAUmo63obLdVOPryGN0uh50mWoPaFE7TCto0bTVP21UBw/4DkH4DzG+m5Usw/9WSbKsAIdi93/M/TRJ/vMJcc7TQHEzpuhrpvHGQEANWpU7Aqgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G0qsR489; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G0qsR489"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757019623; x=1788555623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hfb0jJEaDVUQIZi23GABhhywWqoqoKPbPcj9mhXwHtk=;
  b=G0qsR489dUcD9DIv9QlYZs2/N3loso4dujGiHYnyEcloCbj0AVqidS4S
   4qrYFWGNS+QpoHJBJkkIM3IMlRXVgMlqbRUNLLM8MSfItJXHWHj6jtwX8
   yckEd/QCwEQU1GVSXqygjTM8eGMdiipn4YZDvwkTPJEJuwklR+lyD7zZu
   bSyYklUph6v925S3hrMjrdTLppA7QofhO+KnOXI1XPc0CbhifQ/+znwm5
   +Os5ZT1lU5n0j5hZRi3doR4wgxa0QTnxQX0JWpqovrSkE57ll3dwBXGwH
   HaWuwBfv4Qj2N56LnXggbKIpk2JCb2vEXKuJ4eLwkvZL3OK4kppOtn6jP
   Q==;
X-CSE-ConnectionGUID: vJiFPWDpTJ2ssH8KvXUObg==
X-CSE-MsgGUID: cdA3h17aTye7MH14NE5epg==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="70470819"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; 
   d="scan'208";a="70470819"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 14:00:21 -0700
X-CSE-ConnectionGUID: Pw8jXoUgTMCyRxpc7PwYkw==
X-CSE-MsgGUID: JPR96OYuSza0WRefOjng3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; 
   d="scan'208";a="177218652"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 04 Sep 2025 14:00:19 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuH45-0005ut-11;
	Thu, 04 Sep 2025 21:00:17 +0000
Date: Fri, 5 Sep 2025 05:00:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 316/351]
 fs/bcachefs/backpointers.c:969:5: error: call to undeclared function
 '__WARN'; ISO C99 and later do not support implicit function declarations
Message-ID: <202509050437.mtgpC5gW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   ee47b5b15f8620c81d1382cc851a1c01b96b9c96
commit: e0277fea307f1b134bbed3cb22ec32613e9140fc [316/351] bcachefs: Fix infinite loop in backpointers fsck on upgrade
config: x86_64-buildonly-randconfig-001-20250905 (https://download.01.org/0day-ci/archive/20250905/202509050437.mtgpC5gW-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250905/202509050437.mtgpC5gW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509050437.mtgpC5gW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/backpointers.c:969:5: error: call to undeclared function '__WARN'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     969 |                                 __WARN();
         |                                 ^
   1 error generated.


vim +/__WARN +969 fs/bcachefs/backpointers.c

   866	
   867	static int check_bucket_backpointer_mismatch(struct btree_trans *trans, struct bkey_s_c alloc_k,
   868						     bool *had_mismatch,
   869						     struct bkey_buf *last_flushed,
   870						     struct bpos *last_pos,
   871						     unsigned *nr_iters)
   872	{
   873		struct bch_fs *c = trans->c;
   874		struct bch_alloc_v4 a_convert;
   875		const struct bch_alloc_v4 *a = bch2_alloc_to_v4(alloc_k, &a_convert);
   876		bool need_commit = false;
   877	
   878		if (!bpos_eq(*last_pos, alloc_k.k->p))
   879			*nr_iters = 0;
   880	
   881		*last_pos = alloc_k.k->p;
   882	
   883		*had_mismatch = false;
   884	
   885		if (a->data_type == BCH_DATA_sb ||
   886		    a->data_type == BCH_DATA_journal ||
   887		    a->data_type == BCH_DATA_parity)
   888			return 0;
   889	
   890		u32 sectors[ALLOC_SECTORS_NR];
   891		memset(sectors, 0, sizeof(sectors));
   892	
   893		CLASS(bch2_dev_bucket_tryget_noerror, ca)(trans->c, alloc_k.k->p);
   894		if (!ca)
   895			return 0;
   896	
   897		struct bkey_s_c bp_k;
   898		int ret = 0;
   899		for_each_btree_key_max_norestart(trans, iter, BTREE_ID_backpointers,
   900					bucket_pos_to_bp_start(ca, alloc_k.k->p),
   901					bucket_pos_to_bp_end(ca, alloc_k.k->p), 0, bp_k, ret) {
   902			if (bp_k.k->type != KEY_TYPE_backpointer)
   903				continue;
   904	
   905			struct bkey_s_c_backpointer bp = bkey_s_c_to_backpointer(bp_k);
   906	
   907			if (c->sb.version_upgrade_complete < bcachefs_metadata_version_backpointer_bucket_gen &&
   908			    (bp.v->bucket_gen != a->gen ||
   909			     bp.v->pad)) {
   910				ret = bch2_backpointer_del(trans, bp_k.k->p);
   911				if (ret)
   912					return ret;
   913	
   914				need_commit = true;
   915				continue;
   916			}
   917	
   918			if (bp.v->bucket_gen != a->gen)
   919				continue;
   920	
   921			int alloc_counter = data_type_to_alloc_counter(bp.v->data_type);
   922			if (alloc_counter < 0)
   923				continue;
   924	
   925			sectors[alloc_counter] += bp.v->bucket_len;
   926		};
   927		if (ret)
   928			return ret;
   929	
   930		if (need_commit) {
   931			ret = bch2_trans_commit(trans, NULL, NULL, BCH_TRANS_COMMIT_no_enospc);
   932			if (ret)
   933				return ret;
   934		}
   935	
   936		if (sectors[ALLOC_dirty]  != a->dirty_sectors ||
   937		    sectors[ALLOC_cached] != a->cached_sectors ||
   938		    sectors[ALLOC_stripe] != a->stripe_sectors) {
   939			if (sectors[ALLOC_dirty]  > a->dirty_sectors ||
   940			    sectors[ALLOC_cached] > a->cached_sectors ||
   941			    sectors[ALLOC_stripe] > a->stripe_sectors) {
   942				if (*nr_iters) {
   943					CLASS(printbuf, buf)();
   944					bch2_log_msg_start(c, &buf);
   945	
   946					prt_printf(&buf, "backpointer sectors > bucket sectors, but found no bad backpointers\n"
   947						   "bucket %llu:%llu data type %s, counters\n",
   948						   alloc_k.k->p.inode,
   949						   alloc_k.k->p.offset,
   950						   __bch2_data_types[a->data_type]);
   951					if (sectors[ALLOC_dirty]  > a->dirty_sectors)
   952						prt_printf(&buf, "dirty: %u > %u\n",
   953							   sectors[ALLOC_dirty], a->dirty_sectors);
   954					if (sectors[ALLOC_cached] > a->cached_sectors)
   955						prt_printf(&buf, "cached: %u > %u\n",
   956							   sectors[ALLOC_cached], a->cached_sectors);
   957					if (sectors[ALLOC_stripe] > a->stripe_sectors)
   958						prt_printf(&buf, "stripe: %u > %u\n",
   959							   sectors[ALLOC_stripe], a->stripe_sectors);
   960	
   961					for_each_btree_key_max_norestart(trans, iter, BTREE_ID_backpointers,
   962								bucket_pos_to_bp_start(ca, alloc_k.k->p),
   963								bucket_pos_to_bp_end(ca, alloc_k.k->p), 0, bp_k, ret) {
   964						bch2_bkey_val_to_text(&buf, c, bp_k);
   965						prt_newline(&buf);
   966					}
   967	
   968					bch2_print_str(c, KERN_ERR, buf.buf);
 > 969					__WARN();
   970					return ret;
   971				}
   972	
   973				*nr_iters += 1;
   974	
   975				return check_bucket_backpointers_to_extents(trans, ca, alloc_k.k->p) ?:
   976					bch_err_throw(c, transaction_restart_nested);
   977			}
   978	
   979			/*
   980			 * Post 1.14 upgrade, we assume that backpointers are mostly
   981			 * correct and a sector count mismatch is probably due to a
   982			 * write buffer race
   983			 *
   984			 * Pre upgrade, we expect all the buckets to be wrong, a write
   985			 * buffer flush is pointless:
   986			 */
   987			if (c->sb.version_upgrade_complete >= bcachefs_metadata_version_backpointer_bucket_gen) {
   988				ret = bch2_backpointers_maybe_flush(trans, alloc_k, last_flushed);
   989				if (ret)
   990					return ret;
   991			}
   992	
   993			bool empty = (sectors[ALLOC_dirty] +
   994				      sectors[ALLOC_stripe] +
   995				      sectors[ALLOC_cached]) == 0;
   996	
   997			ret = bch2_bucket_bitmap_set(ca, &ca->bucket_backpointer_mismatch,
   998						     alloc_k.k->p.offset) ?:
   999				(empty
  1000				 ? bch2_bucket_bitmap_set(ca, &ca->bucket_backpointer_empty,
  1001							  alloc_k.k->p.offset)
  1002				 : 0);
  1003	
  1004			*had_mismatch = true;
  1005		}
  1006	
  1007		return 0;
  1008	}
  1009	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
