Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF3812C485;
	Fri, 24 May 2024 16:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716566442; cv=none; b=uIwUsWk8ADgKpQTeUDWSTXYckfXSMxPttdYFHIwdOZx6dJ3RKCtPRjebmx80ktMjMEc8d4v2xVo9WW1JXEcZCZZpg31jyTM4yGtU2F6jsdT/fxSVdoJ+vJ2WHYPA/+2Scd9H2OfmPN7hhB06YABy8h0hnSDwR47JMzTBd1DGVHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716566442; c=relaxed/simple;
	bh=T8k4JUAyIss4mH/x5Ih9z9QbzZGW9lVW9BB5nG2P8/g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nVkockE0Ry1qIkRcm+igKGGUVPvAwTdYMRYYr8Ahf6HGnqAfxud09p2wshsry+KWTyxAns2Q2WkQ4izBrOkTCWZfHVL7XzvRaqD6DfxLy0dPBWWEyTLG7UajMuyoQ8pB7giRAMjyw4oalFWBJF52ayMwwh8xv+vSTUrOBIjiLww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sun/aGHR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sun/aGHR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716566440; x=1748102440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T8k4JUAyIss4mH/x5Ih9z9QbzZGW9lVW9BB5nG2P8/g=;
  b=Sun/aGHRwxzvHIGPbKgnEpJlQCDonVGf0AaY7Dd1virs6dEOAdVr7+I/
   xqAYt5lqpgEn4saR4tExP/8m8XgBpnUlpOI2w2xIoEc4z50U3khg+YX7T
   x6bE7PxWstmK6j2cK2KfuatBtzVT5LAdmTueDoKFICMIEs2kSYXTYnNyn
   QH+wEdCDlya11p4kjAK4+DNNA1Dhn5dDXNpyu8mHlZBrsINnCaJlrBoSY
   HdVj2yC/PKwziml3xTs0tZyDX1pgPNGj2hrFA+cyCYa8glyBZ+7Rd1Ioq
   e5NCkBlxSomiL9wVV/U5KQGDLGVH5x0gX9RpecrPrkEGlpnLGYZlcdabg
   w==;
X-CSE-ConnectionGUID: l6PgQgRBRiirHAUyfV2mNA==
X-CSE-MsgGUID: qxi0tzKYSDmqjy1NEgWsbA==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="24363223"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; 
   d="scan'208";a="24363223"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 09:00:26 -0700
X-CSE-ConnectionGUID: 9UiUdGBkTIO1Nw5p55+FAA==
X-CSE-MsgGUID: L/BhBCdtSAWSXJEX1bhKKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; 
   d="scan'208";a="34074543"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 24 May 2024 09:00:25 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAXLC-0005a4-2p;
	Fri, 24 May 2024 16:00:22 +0000
Date: Fri, 24 May 2024 23:59:44 +0800
From: kernel test robot <lkp@intel.com>
To: David Sterba <dsterba@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kdave-btrfs-devel:dev/param-const 48/48] fs/btrfs/super.c:667:34:
 error: passing 'const struct btrfs_fs_info *' to parameter of type 'struct
 btrfs_fs_info *' discards qualifiers
Message-ID: <202405242326.Wami9vM6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kdave/btrfs-devel.git dev/param-const
head:   96da40206d7e27b71b58cca6209a17a61acff478
commit: 96da40206d7e27b71b58cca6209a17a61acff478 [48/48] constify parameters where it's ok
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240524/202405242326.Wami9vM6-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7aa382fd7257d9bd4f7fc50bb7078a3c26a1628c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240524/202405242326.Wami9vM6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405242326.Wami9vM6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/btrfs/super.c:6:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/riscv/include/asm/cacheflush.h:9:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/btrfs/super.c:667:34: error: passing 'const struct btrfs_fs_info *' to parameter of type 'struct btrfs_fs_info *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     667 |         if (btrfs_check_mountopts_zoned(info, mount_opt))
         |                                         ^~~~
   fs/btrfs/zoned.h:132:69: note: passing argument to parameter 'info' here
     132 | static inline int btrfs_check_mountopts_zoned(struct btrfs_fs_info *info,
         |                                                                     ^
   1 warning and 1 error generated.


vim +667 fs/btrfs/super.c

d7407606564c59 Misono, Tomohiro 2017-12-14  643  
96da40206d7e27 David Sterba     2024-05-22  644  bool btrfs_check_options(const struct btrfs_fs_info *info, unsigned long *mount_opt,
eddb1a433f2631 Josef Bacik      2023-11-22  645  			 unsigned long flags)
2b41b19dd6d063 Josef Bacik      2023-11-22  646  {
2b41b19dd6d063 Josef Bacik      2023-11-22  647  	bool ret = true;
d7407606564c59 Misono, Tomohiro 2017-12-14  648  
2b41b19dd6d063 Josef Bacik      2023-11-22  649  	if (!(flags & SB_RDONLY) &&
eddb1a433f2631 Josef Bacik      2023-11-22  650  	    (check_ro_option(info, *mount_opt, BTRFS_MOUNT_NOLOGREPLAY, "nologreplay") ||
eddb1a433f2631 Josef Bacik      2023-11-22  651  	     check_ro_option(info, *mount_opt, BTRFS_MOUNT_IGNOREBADROOTS, "ignorebadroots") ||
eddb1a433f2631 Josef Bacik      2023-11-22  652  	     check_ro_option(info, *mount_opt, BTRFS_MOUNT_IGNOREDATACSUMS, "ignoredatacsums")))
2b41b19dd6d063 Josef Bacik      2023-11-22  653  		ret = false;
d7407606564c59 Misono, Tomohiro 2017-12-14  654  
2b41b19dd6d063 Josef Bacik      2023-11-22  655  	if (btrfs_fs_compat_ro(info, FREE_SPACE_TREE) &&
eddb1a433f2631 Josef Bacik      2023-11-22  656  	    !btrfs_raw_test_opt(*mount_opt, FREE_SPACE_TREE) &&
eddb1a433f2631 Josef Bacik      2023-11-22  657  	    !btrfs_raw_test_opt(*mount_opt, CLEAR_CACHE)) {
2b41b19dd6d063 Josef Bacik      2023-11-22  658  		btrfs_err(info, "cannot disable free-space-tree");
2b41b19dd6d063 Josef Bacik      2023-11-22  659  		ret = false;
d7407606564c59 Misono, Tomohiro 2017-12-14  660  	}
2b41b19dd6d063 Josef Bacik      2023-11-22  661  	if (btrfs_fs_compat_ro(info, BLOCK_GROUP_TREE) &&
eddb1a433f2631 Josef Bacik      2023-11-22  662  	     !btrfs_raw_test_opt(*mount_opt, FREE_SPACE_TREE)) {
2b41b19dd6d063 Josef Bacik      2023-11-22  663  		btrfs_err(info, "cannot disable free-space-tree with block-group-tree feature");
2b41b19dd6d063 Josef Bacik      2023-11-22  664  		ret = false;
d7407606564c59 Misono, Tomohiro 2017-12-14  665  	}
2b41b19dd6d063 Josef Bacik      2023-11-22  666  
eddb1a433f2631 Josef Bacik      2023-11-22 @667  	if (btrfs_check_mountopts_zoned(info, mount_opt))
2b41b19dd6d063 Josef Bacik      2023-11-22  668  		ret = false;
2b41b19dd6d063 Josef Bacik      2023-11-22  669  
2b41b19dd6d063 Josef Bacik      2023-11-22  670  	if (!test_bit(BTRFS_FS_STATE_REMOUNTING, &info->fs_state)) {
eddb1a433f2631 Josef Bacik      2023-11-22  671  		if (btrfs_raw_test_opt(*mount_opt, SPACE_CACHE))
2b41b19dd6d063 Josef Bacik      2023-11-22  672  			btrfs_info(info, "disk space caching is enabled");
eddb1a433f2631 Josef Bacik      2023-11-22  673  		if (btrfs_raw_test_opt(*mount_opt, FREE_SPACE_TREE))
2b41b19dd6d063 Josef Bacik      2023-11-22  674  			btrfs_info(info, "using free-space-tree");
36350e95a2b1fe Gu Jinxiang      2018-07-12  675  	}
d7407606564c59 Misono, Tomohiro 2017-12-14  676  
2b41b19dd6d063 Josef Bacik      2023-11-22  677  	return ret;
d7407606564c59 Misono, Tomohiro 2017-12-14  678  }
d7407606564c59 Misono, Tomohiro 2017-12-14  679  

:::::: The code at line 667 was first introduced by commit
:::::: eddb1a433f2631ef211b3253ba7e7aba20310ebc btrfs: add reconfigure callback for fs_context

:::::: TO: Josef Bacik <josef@toxicpanda.com>
:::::: CC: David Sterba <dsterba@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
