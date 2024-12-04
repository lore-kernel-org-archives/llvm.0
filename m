Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7021CDFCE;
	Wed,  4 Dec 2024 13:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733319158; cv=none; b=cMNge81AxjEahoOFxfQtKRg5FUVdbmNqaXpsFxMe54ZbK9dYYzndgHtMon6HsdVWvyQIi7QryoRIyGAFXT/fC2QMLdw8Ab3zvIKpYc9Gd/0PvxEN4DG6OZG9m3dCebtLKx3Cf5YoofXrNZfS5gazhvSzO7B5tnNJZ23c7yVEcEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733319158; c=relaxed/simple;
	bh=2pulV6tIBY7tLa2ptxteVVCFuOqfcQxcC79w2H1p+pc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KioDhwjbl5TEvvfUqvJKwC5MiGX07nGJiO6f0ZSPN+k3q+n69qi0XRuTyXGRxZjQqBX5BhJqDD/z63izO9nYpRSzrKJaeT/EKXgzcuIiWTVBjok4F7KytfR4QMV2rf3ZG67yvvhV42ADG4PHRWvtJviGKCGFXSp248+VTnWtpCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eE202G+m; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eE202G+m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733319155; x=1764855155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2pulV6tIBY7tLa2ptxteVVCFuOqfcQxcC79w2H1p+pc=;
  b=eE202G+m/G0uw2K5dcPgAIMcPKZnuL9+u1C5PkiD1na2qEUoEjoF01LT
   /ToBLTx8bhtICppT3bfCMGNbadU5eT4Ast9v16nb8nTo5RWvuEIm8JHr2
   zD+PaYR1ufDHpC8X9GVniSKIhfiAq5sg2jWp/CVK0fBz907WhbLQvEz4A
   KKmerkx2prdnbJZib4hkutA3oVXHXODOyYeWXJ3G7NpEyu5+/UWTuuoXy
   UaVmkD9TsXzW90ey0AfKjmf66aVOW92fHQpZvrl17TtlcvULkCt7Qt2pv
   Hg6W5pWZbJg6h6NHgusDkkU+9Uf8LhZoZWWVPQGCeuZN7YzFAf9bltsEv
   g==;
X-CSE-ConnectionGUID: ncAJBV50QF+8NHcWwRRtTQ==
X-CSE-MsgGUID: DvO/f5N/Qiy/nZ7OnlXFRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="32944206"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="32944206"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 05:32:10 -0800
X-CSE-ConnectionGUID: qFfZeC7iQdCLjqTdv1rfIw==
X-CSE-MsgGUID: JUyqSgFmRXCnWBKylufIuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="98580292"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 04 Dec 2024 05:32:08 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIpU6-00033n-1r;
	Wed, 04 Dec 2024 13:32:06 +0000
Date: Wed, 4 Dec 2024 21:32:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 176/180]
 fs/bcachefs/inode.c:959:2: error: expected expression
Message-ID: <202412042149.TEgwq7rt-lkp@intel.com>
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
config: arm-randconfig-003-20241204 (https://download.01.org/0day-ci/archive/20241204/202412042149.TEgwq7rt-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412042149.TEgwq7rt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412042149.TEgwq7rt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/inode.c:959:2: error: expected expression
           struct bkey_s_c k;
           ^
>> fs/bcachefs/inode.c:960:10: error: use of undeclared identifier 'k'
           while ((k = bch2_btree_iter_peek(iter)).k &&
                   ^
   fs/bcachefs/inode.c:961:26: error: use of undeclared identifier 'k'
                  !(ret = bkey_err(k)) &&
                                   ^
   fs/bcachefs/inode.c:962:17: error: use of undeclared identifier 'k'
                  bkey_lt(k.k->p, POS(0, max))) {
                          ^
   fs/bcachefs/inode.c:992:2: error: use of undeclared identifier 'k'
           k = bch2_btree_iter_peek_slot(iter);
           ^
   fs/bcachefs/inode.c:993:17: error: use of undeclared identifier 'k'
           ret = bkey_err(k);
                          ^
   fs/bcachefs/inode.c:999:21: error: use of undeclared identifier 'k'
           inode_u->bi_inum        = k.k->p.offset;
                                     ^
   fs/bcachefs/inode.c:1001:31: error: use of undeclared identifier 'k'
           cursor->v.idx           = cpu_to_le64(k.k->p.offset + 1);
                                                 ^
   include/linux/byteorder/generic.h:86:21: note: expanded from macro 'cpu_to_le64'
   #define cpu_to_le64 __cpu_to_le64
                       ^
   8 errors generated.


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
 > 960		while ((k = bch2_btree_iter_peek(iter)).k &&
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
