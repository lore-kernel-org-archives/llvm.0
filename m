Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CA02C0284;
	Sat, 17 Jan 2026 10:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768646516; cv=none; b=AXm4jwMtCHcSukXBnKZE6qUEpgBZzlOZAWcJs9ZbIB0vUnY2Fs4AWtP6jpY9LzA79sY3FJLKLKAVn4QToz2IN0xwPABt3jllBw3j1gvcAYqJiSoT4qj0DZrse2m5PhZ1Yw09OUA5yh7sPWeJAU3zzT/EpDw2eRWWlQX3pEQt+ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768646516; c=relaxed/simple;
	bh=3XQpykA7OuNEZiPosqY740yX/o+3iyPzNguFjiH8530=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MJFb2M09M+l1nsP/SxUjdlrZF3F60lZZ0l8iT41Kn1qnCdMgQmF3/apFXxN6MjAGCdvPo5NKBt4vaecLGWZcwUUnwAuGL9PzWobTNTC+w49ZAI1RM9BkaysEm5jk215ZP244S2kSyH4O7mYsmhXdVJaMSucMoV4gXfXQJI65Ewg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KAHfibI0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KAHfibI0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768646514; x=1800182514;
  h=date:from:to:cc:subject:message-id;
  bh=3XQpykA7OuNEZiPosqY740yX/o+3iyPzNguFjiH8530=;
  b=KAHfibI0bE9S3+2ifRrk1OyV8AfPoOQeZpIjFgDa71oqAgDUVsEqLL+w
   BhWDUJb4OuZ2jQod7TFmkHJF0AouqNhu0qcbhiuX4ls0E9qXgzf+KmBM5
   10/ayk54Je5hmibJm40Y1c9o+3gVIHOcqHjGAd0nij9wQvWKo/lrPb+jc
   eG2NE8Oynn2Hbi5/IvCcjzKSQ+CCu3ANLkTKKhnO5OEO/R3K2ro87QWKN
   dKTkieYaSP+uij0qmKlW/LMOw8+fu2qC75SKtMUazXRLdi5nDPmBxh1SC
   fLonzRuyez1/kezeGiOmRmafjBas67F73Y6hr7YxCayFSDziy1PiZA5J+
   g==;
X-CSE-ConnectionGUID: O2GRJGiSSLKnlnuvipjpnw==
X-CSE-MsgGUID: Fl4S2bbkSj2zFqMEbM5rSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69843419"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="69843419"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 02:41:53 -0800
X-CSE-ConnectionGUID: P5XB+Ce1Qu+Auc+wuRhccw==
X-CSE-MsgGUID: 9puuYMH4RS+sXHNl/OdiNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="243004611"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Jan 2026 02:41:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh3ka-00000000LlY-2eBY;
	Sat, 17 Jan 2026 10:41:48 +0000
Date: Sat, 17 Jan 2026 18:41:36 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Harmstone <mark@harmstone.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 David Sterba <dsterba@suse.com>, Boris Burkov <boris@bur.io>
Subject: [btrfs:pr/1157 64/80] fs/btrfs/sysfs.c:294:1: warning:
 unused variable 'btrfs_attr_features_remap_tree'
Message-ID: <202601171850.RBnKgSDA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/btrfs/linux.git pr/1157
head:   92a19b3e78cc245671e8937ffd5530cb4bb9bcc4
commit: d93a5b066ca46e8523a884494d41ac64498bcd85 [64/80] btrfs: add definitions and constants for remap-tree
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20260117/202601171850.RBnKgSDA-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171850.RBnKgSDA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601171850.RBnKgSDA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/btrfs/sysfs.c:294:1: warning: unused variable 'btrfs_attr_features_remap_tree' [-Wunused-variable]
     294 | BTRFS_FEAT_ATTR_INCOMPAT(remap_tree, REMAP_TREE);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/sysfs.c:99:2: note: expanded from macro 'BTRFS_FEAT_ATTR_INCOMPAT'
      99 |         BTRFS_FEAT_ATTR(name, FEAT_INCOMPAT, BTRFS_FEATURE_INCOMPAT, feature)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/sysfs.c:84:34: note: expanded from macro 'BTRFS_FEAT_ATTR'
      84 | static struct btrfs_feature_attr btrfs_attr_features_##_name = {             \
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:100:1: note: expanded from here
     100 | btrfs_attr_features_remap_tree
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/btrfs_attr_features_remap_tree +294 fs/btrfs/sysfs.c

   280	
   281	BTRFS_FEAT_ATTR_INCOMPAT(default_subvol, DEFAULT_SUBVOL);
   282	BTRFS_FEAT_ATTR_INCOMPAT(mixed_groups, MIXED_GROUPS);
   283	BTRFS_FEAT_ATTR_INCOMPAT(compress_lzo, COMPRESS_LZO);
   284	BTRFS_FEAT_ATTR_INCOMPAT(compress_zstd, COMPRESS_ZSTD);
   285	BTRFS_FEAT_ATTR_INCOMPAT(extended_iref, EXTENDED_IREF);
   286	BTRFS_FEAT_ATTR_INCOMPAT(raid56, RAID56);
   287	BTRFS_FEAT_ATTR_INCOMPAT(skinny_metadata, SKINNY_METADATA);
   288	BTRFS_FEAT_ATTR_INCOMPAT(no_holes, NO_HOLES);
   289	BTRFS_FEAT_ATTR_INCOMPAT(metadata_uuid, METADATA_UUID);
   290	BTRFS_FEAT_ATTR_COMPAT_RO(free_space_tree, FREE_SPACE_TREE);
   291	BTRFS_FEAT_ATTR_COMPAT_RO(block_group_tree, BLOCK_GROUP_TREE);
   292	BTRFS_FEAT_ATTR_INCOMPAT(raid1c34, RAID1C34);
   293	BTRFS_FEAT_ATTR_INCOMPAT(simple_quota, SIMPLE_QUOTA);
 > 294	BTRFS_FEAT_ATTR_INCOMPAT(remap_tree, REMAP_TREE);
   295	#ifdef CONFIG_BLK_DEV_ZONED
   296	BTRFS_FEAT_ATTR_INCOMPAT(zoned, ZONED);
   297	#endif
   298	#ifdef CONFIG_BTRFS_EXPERIMENTAL
   299	/* Remove once support for extent tree v2 is feature complete */
   300	BTRFS_FEAT_ATTR_INCOMPAT(extent_tree_v2, EXTENT_TREE_V2);
   301	/* Remove once support for raid stripe tree is feature complete. */
   302	BTRFS_FEAT_ATTR_INCOMPAT(raid_stripe_tree, RAID_STRIPE_TREE);
   303	#endif
   304	#ifdef CONFIG_FS_VERITY
   305	BTRFS_FEAT_ATTR_COMPAT_RO(verity, VERITY);
   306	#endif
   307	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
