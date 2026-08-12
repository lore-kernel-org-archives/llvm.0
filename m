Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C473BE178;
	Wed, 12 Aug 2026 08:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786523414; cv=none; b=L7MlCV7C07ImlXSYsnhzuiDNcwl+9DKG9V/ubuf5vZmX4VmgRP8WzldhO3NVUl4McYwj9f4ahTXGNymJw+FzNAMFxXGUDCqenMhaeAWrWDI0sf0x8gQnUv8voDFH1JP8ufd8OgO0/rh3c3wZev1FX7iv1GWtbRMJnDItZIOMe0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786523414; c=relaxed/simple;
	bh=grROCCp/NlSZhIChKu/T+K573rFhmjdvZT5uMTe+e3A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UWTyB4UIGWuqgvcjALq1wPYqzCWtbLd4SdRKB5X25PjhL8rcawTLVGu2KrZAieO3zUP6vkZ0h8z8LGLjUwwr58j4nQjwFBpbLQ0f9O+LdWfKJnNS/sMICnjP9oUxKPUkUn2GKS24sIGEk6+9ln73hB/OBPhXN3lBiFWWrPufCJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hE9m/Oud; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hE9m/Oud"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786523412; x=1818059412;
  h=date:from:to:cc:subject:message-id;
  bh=grROCCp/NlSZhIChKu/T+K573rFhmjdvZT5uMTe+e3A=;
  b=hE9m/OudNZanSwhW0WAM2ohhyRWbWnatCyfGvXjesRj7FU0rVZp5hBtS
   Y6cy1b9RNp2g3vkQB2C93lwVfE2Ilako//uJWjRLmumNUqz2A8Zwcu8qL
   haD+xNArv/w83YhJAImXeF05OrEx3Op/iF5vbYcLr/qd0TIXjEo4JhXhV
   tgnbaHZOK4KXKpSBlJEv/IrdNNw/JIhxr7+R4IAOKWbzUzZ8dblqLKP0y
   WmCZCYJRhivd4rq/eEdPTj/aSh6Ym31V7E8AhBn+1110h3zzTfqfkOWAK
   3rHkOkYwzmr5IYXAHqbU0+bhbKxJUqo0yoRZalYyb7WnL9rLHbKT/mAF0
   g==;
X-CSE-ConnectionGUID: atg6BK4NTWm18pbqSL7ftw==
X-CSE-MsgGUID: 7cySLFwiQ+GD6Hv4Tsb9Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="98582547"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="98582547"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 01:30:12 -0700
X-CSE-ConnectionGUID: B6SYgmSXRtCnkgOGvIVo2Q==
X-CSE-MsgGUID: lKm+h/wGQG+7TNYrCzz/3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="267072037"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Aug 2026 01:30:10 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wu4Lf-00000000Q6w-1DjN;
	Wed, 12 Aug 2026 08:30:07 +0000
Date: Wed, 12 Aug 2026 16:29:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-f2fs-devel@lists.sourceforge.net, Chao Yu <chao@kernel.org>
Subject: [jaegeuk-f2fs:dev-test 30/30] fs/f2fs/inode.c:1065:6: error:
 call to undeclared function 'current_is_kswapd'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202608121654.riTjCLm7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   7451b3cd93b30f714efc83f6571abf8c50541839
commit: 7451b3cd93b30f714efc83f6571abf8c50541839 [30/30] f2fs: call __add_ino_entry out of the eviction path
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260812/202608121654.riTjCLm7-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 12df34b8469b8095359de8c249cb1b2753fadeea)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260812/202608121654.riTjCLm7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608121654.riTjCLm7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/f2fs/inode.c:1065:6: error: call to undeclared function 'current_is_kswapd'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1065 |         if (current_is_kswapd()) {
         |             ^
   1 error generated.


vim +/current_is_kswapd +1065 fs/f2fs/inode.c

  1019	
  1020	static void f2fs_post_evict_inode(struct inode *inode)
  1021	{
  1022		struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
  1023		struct f2fs_inode_info *fi = F2FS_I(inode);
  1024		nid_t xnid = fi->i_xattr_nid;
  1025		unsigned int record_bits = 0;
  1026	
  1027		dquot_drop(inode);
  1028	
  1029		stat_dec_inline_xattr(inode);
  1030		stat_dec_inline_dir(inode);
  1031		stat_dec_inline_inode(inode);
  1032		stat_dec_compr_inode(inode);
  1033		stat_sub_compr_blocks(inode,
  1034				atomic_read(&fi->i_compr_blocks));
  1035	
  1036		if (likely(!f2fs_cp_error(sbi) &&
  1037					!is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
  1038			f2fs_bug_on(sbi, is_inode_flag_set(inode, FI_DIRTY_INODE));
  1039	
  1040		/*
  1041		 * anyway, it needs to remove the inode from sbi->inode_list[DIRTY_META]
  1042		 * list to avoid UAF in f2fs_sync_inode_meta() during checkpoint.
  1043		 */
  1044		f2fs_inode_synced(inode);
  1045	
  1046		/* for the case f2fs_new_inode() was failed, .i_ino is zero, skip it */
  1047		if (inode->i_ino)
  1048			invalidate_mapping_pages(NODE_MAPPING(sbi), inode->i_ino,
  1049								inode->i_ino);
  1050		if (xnid)
  1051			invalidate_mapping_pages(NODE_MAPPING(sbi), xnid, xnid);
  1052	
  1053		if (!inode->i_nlink)
  1054			goto skip_record;
  1055	
  1056		if (is_inode_flag_set(inode, FI_APPEND_WRITE))
  1057			record_bits = BIT(APPEND_INO);
  1058		if (is_inode_flag_set(inode, FI_UPDATE_WRITE))
  1059			record_bits = BIT(UPDATE_INO);
  1060	
  1061		if (!record_bits)
  1062			goto skip_record;
  1063	
  1064		/* Let's do this in workqueue out of the direct reclaim path. */
> 1065		if (current_is_kswapd()) {
  1066			f2fs_record_inode_state(sbi, inode->i_ino, record_bits);
  1067		} else {
  1068			struct evict_inode_work *ew =
  1069				mempool_alloc(evict_inode_work_pool, GFP_NOFS);
  1070	
  1071			ew->sbi = sbi;
  1072			ew->ino = inode->i_ino;
  1073			ew->add_ino_entry_bits = record_bits;
  1074			INIT_WORK(&ew->work, f2fs_evict_inode_work);
  1075			queue_work(sbi->evict_wq, &ew->work);
  1076		}
  1077	skip_record:
  1078		if (is_inode_flag_set(inode, FI_FREE_NID)) {
  1079			f2fs_alloc_nid_failed(sbi, inode->i_ino);
  1080			clear_inode_flag(inode, FI_FREE_NID);
  1081		} else {
  1082			/*
  1083			 * If xattr nid is corrupted, we can reach out error condition,
  1084			 * err & !f2fs_exist_written_data(sbi, inode->i_ino, ORPHAN_INO)).
  1085			 * In that case, f2fs_check_nid_range() is enough to give a clue.
  1086			 */
  1087		}
  1088	}
  1089	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
