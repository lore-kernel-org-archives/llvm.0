Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308A263BC;
	Thu,  3 Aug 2023 20:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691092850; x=1722628850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xw8k5VtTQ+dwT22l0/d/AvYVgus5prDEfKHEgHZOLGg=;
  b=dUW9Hdl8f+91WcDjnTpJSQOOnKr92UJjOgMPmDMhfZaGZ+wWFd2sxr0f
   oZ6SD0qkpEpA52TmgJ8EnmydNqOejvGCFhST9Q6NghOJYtJN7FCePJNq1
   Iizo/6+7tUzRKTlZvUjyuNMRd8/qw6NvCITxMA5QxB43c/1I1H2tYqZ0T
   tP2DBQJ/MY6bV6N3ZnjpNybtuj3xoKqtCSHlESoRh5LIXnVOQ5sml1CFE
   9sGeiC1pbisLRC8Fp4K4R07eGdR1BtGMpkCtVbz/XZubNrLwYD1IU25Lg
   xmEkeZGFY2udrshgzWV8fPDAbuk2B9vc07DVl7DMlckrGDo9b1aBkWp8z
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="349577358"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="349577358"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 13:00:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="843741624"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="843741624"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 03 Aug 2023 13:00:48 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qReV5-0002Kt-1b;
	Thu, 03 Aug 2023 20:00:47 +0000
Date: Fri, 4 Aug 2023 04:00:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:mgctime 4/10] fs/ubifs/file.c:1381:5: error: conflicting
 types for 'ubifs_update_time'
Message-ID: <202308040322.Z3JXrLZJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git mgctime
head:   ffef667f9698cae637fe41b46df59816f79c050f
commit: 8e5568e178ddba11db584128ea843e8fba301dba [4/10] fs: change update_time prototype
config: riscv-randconfig-r023-20230731 (https://download.01.org/0day-ci/archive/20230804/202308040322.Z3JXrLZJ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308040322.Z3JXrLZJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308040322.Z3JXrLZJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/ubifs/dir.c:1701:17: error: incompatible function pointer types initializing 'int (*)(struct inode *, int)' with an expression of type 'int (struct inode *, struct timespec64 *, int)' [-Wincompatible-function-pointer-types]
    1701 |         .update_time = ubifs_update_time,
         |                        ^~~~~~~~~~~~~~~~~
   1 error generated.
--
>> fs/ubifs/file.c:1381:5: error: conflicting types for 'ubifs_update_time'
    1381 | int ubifs_update_time(struct inode *inode, int flags)
         |     ^
   fs/ubifs/ubifs.h:2030:5: note: previous declaration is here
    2030 | int ubifs_update_time(struct inode *inode, struct timespec64 *time, int flags);
         |     ^
>> fs/ubifs/file.c:1654:17: error: incompatible function pointer types initializing 'int (*)(struct inode *, int)' with an expression of type 'int (struct inode *, struct timespec64 *, int)' [-Wincompatible-function-pointer-types]
    1654 |         .update_time = ubifs_update_time,
         |                        ^~~~~~~~~~~~~~~~~
   fs/ubifs/file.c:1664:17: error: incompatible function pointer types initializing 'int (*)(struct inode *, int)' with an expression of type 'int (struct inode *, struct timespec64 *, int)' [-Wincompatible-function-pointer-types]
    1664 |         .update_time = ubifs_update_time,
         |                        ^~~~~~~~~~~~~~~~~
   3 errors generated.
--
>> fs/orangefs/inode.c:908:35: error: too many arguments to function call, expected 2, have 3
     908 |         generic_update_time(inode, time, flags);
         |         ~~~~~~~~~~~~~~~~~~~              ^~~~~
   include/linux/fs.h:2346:12: note: 'generic_update_time' declared here
    2346 | extern int generic_update_time(struct inode *, int);
         |            ^
>> fs/orangefs/inode.c:974:17: error: incompatible function pointer types initializing 'int (*)(struct inode *, int)' with an expression of type 'int (struct inode *, struct timespec64 *, int)' [-Wincompatible-function-pointer-types]
     974 |         .update_time = orangefs_update_time,
         |                        ^~~~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> fs/orangefs/symlink.c:18:17: error: incompatible function pointer types initializing 'int (*)(struct inode *, int)' with an expression of type 'int (struct inode *, struct timespec64 *, int)' [-Wincompatible-function-pointer-types]
      18 |         .update_time = orangefs_update_time,
         |                        ^~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> fs/orangefs/namei.c:445:17: error: incompatible function pointer types initializing 'int (*)(struct inode *, int)' with an expression of type 'int (struct inode *, struct timespec64 *, int)' [-Wincompatible-function-pointer-types]
     445 |         .update_time = orangefs_update_time,
         |                        ^~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +/ubifs_update_time +1381 fs/ubifs/file.c

  1374	
  1375	/**
  1376	 * ubifs_update_time - update time of inode.
  1377	 * @inode: inode to update
  1378	 *
  1379	 * This function updates time of the inode.
  1380	 */
> 1381	int ubifs_update_time(struct inode *inode, int flags)
  1382	{
  1383		struct ubifs_inode *ui = ubifs_inode(inode);
  1384		struct ubifs_info *c = inode->i_sb->s_fs_info;
  1385		struct ubifs_budget_req req = { .dirtied_ino = 1,
  1386				.dirtied_ino_d = ALIGN(ui->data_len, 8) };
  1387		struct timespec64 time = current_time(inode);
  1388		int err, release;
  1389	
  1390		if (!IS_ENABLED(CONFIG_UBIFS_ATIME_SUPPORT))
  1391			return generic_update_time(inode, flags);
  1392	
  1393		err = ubifs_budget_space(c, &req);
  1394		if (err)
  1395			return err;
  1396	
  1397		mutex_lock(&ui->ui_mutex);
  1398		if (flags & S_ATIME)
  1399			inode->i_atime = time;
  1400		if (flags & S_CTIME)
  1401			inode_set_ctime_to_ts(inode, time);
  1402		if (flags & S_MTIME)
  1403			inode->i_mtime = time;
  1404	
  1405		release = ui->dirty;
  1406		__mark_inode_dirty(inode, I_DIRTY_SYNC);
  1407		mutex_unlock(&ui->ui_mutex);
  1408		if (release)
  1409			ubifs_release_budget(c, &req);
  1410		return 0;
  1411	}
  1412	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
