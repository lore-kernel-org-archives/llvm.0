Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584B515B10D;
	Wed,  4 Dec 2024 16:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733328752; cv=none; b=f7HpfbYq7l8e6+R1oqnyy6n7Nhg4sAgXkrhMAlDUlOzOQPNaAMHPLn270KRWAopBeyozgoocy8DSU1l22ozAjB3roiTW8sTccLO6mqE0PrJRkwIzhZAyW8nb17F8p+eXZR/TEk2KAiPnlZBliDybsAauQCXKLw1Jc/XW4pmBgrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733328752; c=relaxed/simple;
	bh=A0mWy9FBXqC8mM3bOixPp1DSyoXn/b8myrlBMw7cjk8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=to01NgnDINat5RuFnn0NYsBNpQWMIZr+lkLe9LYB9aVfkOQGhVnID9u61lyrxaFMNhIc3L5B0nM+rvfyMZja9MyOOEYErtbPv3BI5zxeCbsP0zeADhR5869e3CinnarlOkyxatp6LjjQ5Efc4NKAQ3ysPcw9Zucv4ADemlBHAUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VACpi4+8; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VACpi4+8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733328751; x=1764864751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A0mWy9FBXqC8mM3bOixPp1DSyoXn/b8myrlBMw7cjk8=;
  b=VACpi4+8EvOzjnAYaEFylDGV1OHMpoxqigbSTZ1rPU1WVbSr49MLzF+4
   Wj8DOaWTLLptR12iLinvPWsXdd3bO1GN6VCoJjYYU2s3DSC+sIA5H8Epr
   Fiu0CjaUUnihiylmsM5qr9xR6t9H7N4ktK9OHOdUhOE8HdZ3o/1S449Xu
   ofege1YRkFXuZMDY3IpCQEJmAFuk5qFGywgLaJEW1WhsdeG8u9zy77Tjl
   spElzbaBcS2yF8KNTm4RmQglsCBdz2IEugz7097RbBCADVNAKsw0zTA34
   tsMkVJZsxZ2F90m6QoNvMAYYfhaZHb2U79zN1w5KJD5tDHQvWuWakhC5+
   A==;
X-CSE-ConnectionGUID: AlcpLiIHTqq6TUD4S6MsLQ==
X-CSE-MsgGUID: NHQHxCQiQf23ZO4lsLdpgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="56086851"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="56086851"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 08:12:30 -0800
X-CSE-ConnectionGUID: oPcqAMprTyyDLeolDmCVjw==
X-CSE-MsgGUID: wWI8fBZTQnizCoRB3Fxq8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="131254580"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 04 Dec 2024 08:12:28 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIrzG-0003FR-1J;
	Wed, 04 Dec 2024 16:12:26 +0000
Date: Thu, 5 Dec 2024 00:11:41 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 176/180]
 fs/bcachefs/inode.c:959:2: warning: label followed by a declaration is a C23
 extension
Message-ID: <202412050055.F6gaGrvq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   24ae9afb293a4cbfc4c2bd727c956f16d2db072b
commit: 7b158984d408fc2ee75b7877b1ef37ef496ef8ea [176/180] bcachefs: bcachefs_metadata_version_persistent_inode_cursors
config: i386-buildonly-randconfig-002-20241204 (https://download.01.org/0day-ci/archive/20241205/202412050055.F6gaGrvq-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412050055.F6gaGrvq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412050055.F6gaGrvq-lkp@intel.com/

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
>> fs/bcachefs/inode.c:959:2: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     959 |         struct bkey_s_c k;
         |         ^
   fs/bcachefs/inode.c:871:19: warning: unused function 'bkey_generation' [-Wunused-function]
     871 | static inline u32 bkey_generation(struct bkey_s_c k)
         |                   ^~~~~~~~~~~~~~~
   3 warnings generated.


vim +959 fs/bcachefs/inode.c

   936	
   937	/*
   938	 * This just finds an empty slot:
   939	 */
   940	int bch2_inode_create(struct btree_trans *trans,
   941			      struct btree_iter *iter,
   942			      struct bch_inode_unpacked *inode_u,
   943			      u32 snapshot, u64 cpu)
   944	{
   945		u64 min, max;
   946		struct bkey_i_inode_alloc_cursor *cursor =
   947			bch2_inode_alloc_cursor_get(trans, cpu, &min, &max);
   948		int ret = PTR_ERR_OR_ZERO(cursor);
   949		if (ret)
   950			return ret;
   951	
   952		u64 start = le64_to_cpu(cursor->v.idx);
   953		u64 pos = start;
   954	
   955		bch2_trans_iter_init(trans, iter, BTREE_ID_inodes, POS(0, pos),
   956				     BTREE_ITER_all_snapshots|
   957				     BTREE_ITER_intent);
   958	again:
 > 959		struct bkey_s_c k;
   960		while ((k = bch2_btree_iter_peek(iter)).k &&
   961		       !(ret = bkey_err(k)) &&
   962		       bkey_lt(k.k->p, POS(0, max))) {
   963			if (pos < iter->pos.offset)
   964				goto found_slot;
   965	
   966			/*
   967			 * We don't need to iterate over keys in every snapshot once
   968			 * we've found just one:
   969			 */
   970			pos = iter->pos.offset + 1;
   971			bch2_btree_iter_set_pos(iter, POS(0, pos));
   972		}
   973	
   974		if (!ret && pos < max)
   975			goto found_slot;
   976	
   977		if (!ret && start == min)
   978			ret = -BCH_ERR_ENOSPC_inode_create;
   979	
   980		if (ret) {
   981			bch2_trans_iter_exit(trans, iter);
   982			return ret;
   983		}
   984	
   985		/* Retry from start */
   986		pos = start = min;
   987		bch2_btree_iter_set_pos(iter, POS(0, pos));
   988		le32_add_cpu(&cursor->v.gen, 1);
   989		goto again;
   990	found_slot:
   991		bch2_btree_iter_set_pos(iter, SPOS(0, pos, snapshot));
   992		k = bch2_btree_iter_peek_slot(iter);
   993		ret = bkey_err(k);
   994		if (ret) {
   995			bch2_trans_iter_exit(trans, iter);
   996			return ret;
   997		}
   998	
   999		inode_u->bi_inum	= k.k->p.offset;
  1000		inode_u->bi_generation	= le64_to_cpu(cursor->v.gen);
  1001		cursor->v.idx		= cpu_to_le64(k.k->p.offset + 1);
  1002		return 0;
  1003	}
  1004	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
