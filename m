Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4141F9F6F;
	Mon,  2 Dec 2024 08:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733129072; cv=none; b=R01ycfc0QJfJQVFl8D2KdbTyqSUft7cyiuyWJN8iF4iQvm+vw5nFIgYlMVw/gECc8B2kTjNQmZxkYIBoOTrXmz06naLh+m3GA8WVSGo3Ir+3DoerF3Hk5U9BCGWiAixqs1l5oyVvFBj4jrx2zfyoCyBTBZtK6jMq/Q5c+HtuUX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733129072; c=relaxed/simple;
	bh=xxltjI7lNa9wWp99gnUUl5OZnvmHOV+xQOObayUr8H8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sPIJV3gRiIlK59sbfKa33D+TvaNGthlbsxDu9+tu3zbw5eemHrXqxfHJWrzhj8G9Q+U9jHttF2YevY0M+c8niTna32qF/FBi2RQXV53NjhNlU4TkRVVU4dJsgMswR1kYldEoUb4Ztp+KNDn5Z7ytX7+96sTODrs0+C0Y3zzP0EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cYsaicyt; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cYsaicyt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733129070; x=1764665070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xxltjI7lNa9wWp99gnUUl5OZnvmHOV+xQOObayUr8H8=;
  b=cYsaicytF12kHTtTu29qMtbWYxrJ7uWhVS+RFnbjjwQuLHBsEwwbmNTa
   Unv3qUSLcPwm9dwQznAaQ8ql05+EVilthsfOGw7PxfnxBIQCeujLwNTrv
   3/akpDBbPz/yv1Ihqt/KhG7NToaW3rXeu9g9QuGej4txnwU1ngrb3K4w3
   B8tU+sUeFl5in7CmhJ8VLB393p7QwWAljs+GEqriPD8peoq9d7g79l1dx
   dwm7EGngTVjDTeX19Sd5mpYExyQBSRlyMicHaWvOlyxKRRF2TupAihsr/
   Mkb1BxlQJlq+N+wEANGJx5C8kTkhB8QDu28y1mCZ4Fa2XqBQulYe6zwMC
   A==;
X-CSE-ConnectionGUID: r8baXAccROGC/WlcDT08Lg==
X-CSE-MsgGUID: wvKFhybVTCyDxwJ1djfSBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="36149820"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="36149820"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 00:44:29 -0800
X-CSE-ConnectionGUID: 3lB9qhLyQY+SsoIvK7JrBw==
X-CSE-MsgGUID: LfwrpnVMQ/yXYUlU8IyXIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="92946069"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 02 Dec 2024 00:44:28 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tI22b-0002DN-1T;
	Mon, 02 Dec 2024 08:44:25 +0000
Date: Mon, 2 Dec 2024 16:43:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 173/173] fs/bcachefs/inode.c:931:19:
 warning: variable 'start' is uninitialized when used here
Message-ID: <202412021612.VGYuCb7c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   a6c90193bc06c071ac00989791a284cf94def0e5
commit: a6c90193bc06c071ac00989791a284cf94def0e5 [173/173] bcachefs: bcachefs_metadata_version_persistent_inode_cursors
config: x86_64-buildonly-randconfig-004-20241202 (https://download.01.org/0day-ci/archive/20241202/202412021612.VGYuCb7c-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412021612.VGYuCb7c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412021612.VGYuCb7c-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/inode.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/bcachefs/inode.c:931:19: warning: variable 'start' is uninitialized when used here [-Wuninitialized]
     931 |                 cursor->v.idx = start;
         |                                 ^~~~~
   fs/bcachefs/inode.c:894:21: note: initialize the variable 'start' to silence this warning
     894 |         u64 min, max, start, pos;
         |                            ^
         |                             = 0
   fs/bcachefs/inode.c:871:19: warning: unused function 'bkey_generation' [-Wunused-function]
     871 | static inline u32 bkey_generation(struct bkey_s_c k)
         |                   ^~~~~~~~~~~~~~~
   3 warnings generated.


vim +/start +931 fs/bcachefs/inode.c

   883	
   884	/*
   885	 * This just finds an empty slot:
   886	 */
   887	int bch2_inode_create(struct btree_trans *trans,
   888			      struct btree_iter *iter,
   889			      struct bch_inode_unpacked *inode_u,
   890			      u32 snapshot, u64 cpu)
   891	{
   892		struct bch_fs *c = trans->c;
   893		struct bkey_s_c k;
   894		u64 min, max, start, pos;
   895		int ret = 0;
   896		unsigned bits = (c->opts.inodes_32bit ? 31 : 63);
   897	
   898		u64 cursor_idx = c->opts.shard_inode_numbers ? cpu : 0;
   899	
   900		if (c->opts.shard_inode_numbers) {
   901			bits -= c->inode_shard_bits;
   902	
   903			min = (cpu << bits);
   904			max = (cpu << bits) | ~(ULLONG_MAX << bits);
   905	
   906			min = max_t(u64, min, BLOCKDEV_INODE_MAX);
   907		} else {
   908			min = BLOCKDEV_INODE_MAX;
   909			max = ~(ULLONG_MAX << bits);
   910		}
   911	
   912		struct btree_iter cursor_iter;
   913		struct bkey_s_c cursor_k = bch2_bkey_get_iter(trans, &cursor_iter,
   914						BTREE_ID_logged_ops,
   915						POS(LOGGED_OPS_INUM_inode_cursors, cursor_idx),
   916						BTREE_ITER_cached);
   917		ret = bkey_err(cursor_k);
   918		if (ret)
   919			return ret;
   920	
   921		struct bkey_i_inode_alloc_cursor *cursor =
   922			bch2_bkey_alloc(trans, &cursor_iter, 0, inode_alloc_cursor);
   923		ret = PTR_ERR_OR_ZERO(cursor);
   924		if (ret)
   925			goto cursor_err;
   926	
   927		if (cursor_k.k->type == KEY_TYPE_inode_alloc_cursor) {
   928			cursor->v.idx = bkey_s_c_to_inode_alloc_cursor(cursor_k).v->idx;
   929			cursor->v.gen = bkey_s_c_to_inode_alloc_cursor(cursor_k).v->gen;
   930		} else {
 > 931			cursor->v.idx = start;
   932			cursor->v.gen = 0;
   933		}
   934	
   935		bch2_trans_iter_exit(trans, &cursor_iter);
   936	
   937		if (le64_to_cpu(cursor->v.idx)  < min)
   938			cursor->v.idx = cpu_to_le64(min);
   939	
   940		if (le64_to_cpu(cursor->v.idx) >= max) {
   941			cursor->v.idx = cpu_to_le64(min);
   942			le64_add_cpu(&cursor->v.gen, 1);
   943		}
   944	
   945		pos = start = le64_to_cpu(cursor->v.idx);
   946	
   947		bch2_trans_iter_init(trans, iter, BTREE_ID_inodes, POS(0, pos),
   948				     BTREE_ITER_all_snapshots|
   949				     BTREE_ITER_intent);
   950	again:
   951		while ((k = bch2_btree_iter_peek(iter)).k &&
   952		       !(ret = bkey_err(k)) &&
   953		       bkey_lt(k.k->p, POS(0, max))) {
   954			if (pos < iter->pos.offset)
   955				goto found_slot;
   956	
   957			/*
   958			 * We don't need to iterate over keys in every snapshot once
   959			 * we've found just one:
   960			 */
   961			pos = iter->pos.offset + 1;
   962			bch2_btree_iter_set_pos(iter, POS(0, pos));
   963		}
   964	
   965		if (!ret && pos < max)
   966			goto found_slot;
   967	
   968		if (!ret && start == min)
   969			ret = -BCH_ERR_ENOSPC_inode_create;
   970	
   971		if (ret) {
   972			bch2_trans_iter_exit(trans, iter);
   973			return ret;
   974		}
   975	
   976		/* Retry from start */
   977		pos = start = min;
   978		bch2_btree_iter_set_pos(iter, POS(0, pos));
   979		le64_add_cpu(&cursor->v.gen, 1);
   980		goto again;
   981	found_slot:
   982		bch2_btree_iter_set_pos(iter, SPOS(0, pos, snapshot));
   983		k = bch2_btree_iter_peek_slot(iter);
   984		ret = bkey_err(k);
   985		if (ret) {
   986			bch2_trans_iter_exit(trans, iter);
   987			return ret;
   988		}
   989	
   990		inode_u->bi_inum	= k.k->p.offset;
   991		inode_u->bi_generation	= le64_to_cpu(cursor->v.gen);
   992		cursor->v.idx		= cpu_to_le64(k.k->p.offset + 1);
   993		return 0;
   994	cursor_err:
   995		bch2_trans_iter_exit(trans, &cursor_iter);
   996		return ret;
   997	}
   998	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
