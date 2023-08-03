Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0127E2591C;
	Thu,  3 Aug 2023 20:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691095980; x=1722631980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZO2vT+INEGF+8PVak6MPJN731ME3Nn1n1vMqPFWBebw=;
  b=GcagGOkzt+8Nk76IvN4nTxxt28d2dB4AAkWIRDIkQ4cZ1LMb0EAMnNPE
   6q5+I+EoiOdEMuwygOp+is1hpNq3UDBXLkh1X7RmWKsAvPyqqhe67DMmg
   G1aXoE3bnfN7Nr9jzYgPXN/sr2XOtCcyS/XaK+fsZSw4/378zjeiQj0rI
   usQEywLCkdbEQ3gYd8/ga3hLEpG8FtmOhtCijYAXzDRe/IdxrXA28lsvc
   Fw4+6+QyKaSq44M4ThVoaIQXoz23Kza/aQec2OZ7WUYaJJS2WddPccxZD
   8lmmnun37hTZKPifJkAhL3YKszH+QOQ3KEYJLjDdTCBCkAAkO3LG5Zcjf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="400953046"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="400953046"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 13:52:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="706719480"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="706719480"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 Aug 2023 13:52:49 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRfJQ-0002Ld-1d;
	Thu, 03 Aug 2023 20:52:48 +0000
Date: Fri, 4 Aug 2023 04:52:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:mgctime 8/10] fs/xfs/xfs_iops.c:920:4: error: call to
 undeclared function 'current_mgtime'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202308040449.cQuIsvCc-lkp@intel.com>
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
commit: 710fc0a96d7a0e69f16b6ded3de9959969246c3e [8/10] xfs: switch to multigrain timestamps
config: riscv-randconfig-r023-20230731 (https://download.01.org/0day-ci/archive/20230804/202308040449.cQuIsvCc-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308040449.cQuIsvCc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308040449.cQuIsvCc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/xfs/xfs_iops.c:920:4: error: call to undeclared function 'current_mgtime'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     920 |                         current_mgtime(inode);
         |                         ^
   fs/xfs/xfs_iops.c:920:4: note: did you mean 'current_time'?
   include/linux/fs.h:1477:19: note: 'current_time' declared here
    1477 | struct timespec64 current_time(struct inode *inode);
         |                   ^
>> fs/xfs/xfs_iops.c:919:37: error: assigning to 'struct timespec64' from incompatible type 'int'
     919 |                 iattr->ia_ctime = iattr->ia_mtime =
         |                                                   ^
     920 |                         current_mgtime(inode);
         |                         ~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/current_mgtime +920 fs/xfs/xfs_iops.c

   772	
   773	/*
   774	 * Truncate file.  Must have write permission and not be a directory.
   775	 *
   776	 * Caution: The caller of this function is responsible for calling
   777	 * setattr_prepare() or otherwise verifying the change is fine.
   778	 */
   779	STATIC int
   780	xfs_setattr_size(
   781		struct mnt_idmap	*idmap,
   782		struct dentry		*dentry,
   783		struct xfs_inode	*ip,
   784		struct iattr		*iattr)
   785	{
   786		struct xfs_mount	*mp = ip->i_mount;
   787		struct inode		*inode = VFS_I(ip);
   788		xfs_off_t		oldsize, newsize;
   789		struct xfs_trans	*tp;
   790		int			error;
   791		uint			lock_flags = 0;
   792		bool			did_zeroing = false;
   793	
   794		ASSERT(xfs_isilocked(ip, XFS_IOLOCK_EXCL));
   795		ASSERT(xfs_isilocked(ip, XFS_MMAPLOCK_EXCL));
   796		ASSERT(S_ISREG(inode->i_mode));
   797		ASSERT((iattr->ia_valid & (ATTR_UID|ATTR_GID|ATTR_ATIME|ATTR_ATIME_SET|
   798			ATTR_MTIME_SET|ATTR_TIMES_SET)) == 0);
   799	
   800		oldsize = inode->i_size;
   801		newsize = iattr->ia_size;
   802	
   803		/*
   804		 * Short circuit the truncate case for zero length files.
   805		 */
   806		if (newsize == 0 && oldsize == 0 && ip->i_df.if_nextents == 0) {
   807			if (!(iattr->ia_valid & (ATTR_CTIME|ATTR_MTIME)))
   808				return 0;
   809	
   810			/*
   811			 * Use the regular setattr path to update the timestamps.
   812			 */
   813			iattr->ia_valid &= ~ATTR_SIZE;
   814			return xfs_setattr_nonsize(idmap, dentry, ip, iattr);
   815		}
   816	
   817		/*
   818		 * Make sure that the dquots are attached to the inode.
   819		 */
   820		error = xfs_qm_dqattach(ip);
   821		if (error)
   822			return error;
   823	
   824		/*
   825		 * Wait for all direct I/O to complete.
   826		 */
   827		inode_dio_wait(inode);
   828	
   829		/*
   830		 * File data changes must be complete before we start the transaction to
   831		 * modify the inode.  This needs to be done before joining the inode to
   832		 * the transaction because the inode cannot be unlocked once it is a
   833		 * part of the transaction.
   834		 *
   835		 * Start with zeroing any data beyond EOF that we may expose on file
   836		 * extension, or zeroing out the rest of the block on a downward
   837		 * truncate.
   838		 */
   839		if (newsize > oldsize) {
   840			trace_xfs_zero_eof(ip, oldsize, newsize - oldsize);
   841			error = xfs_zero_range(ip, oldsize, newsize - oldsize,
   842					&did_zeroing);
   843		} else {
   844			/*
   845			 * iomap won't detect a dirty page over an unwritten block (or a
   846			 * cow block over a hole) and subsequently skips zeroing the
   847			 * newly post-EOF portion of the page. Flush the new EOF to
   848			 * convert the block before the pagecache truncate.
   849			 */
   850			error = filemap_write_and_wait_range(inode->i_mapping, newsize,
   851							     newsize);
   852			if (error)
   853				return error;
   854			error = xfs_truncate_page(ip, newsize, &did_zeroing);
   855		}
   856	
   857		if (error)
   858			return error;
   859	
   860		/*
   861		 * We've already locked out new page faults, so now we can safely remove
   862		 * pages from the page cache knowing they won't get refaulted until we
   863		 * drop the XFS_MMAP_EXCL lock after the extent manipulations are
   864		 * complete. The truncate_setsize() call also cleans partial EOF page
   865		 * PTEs on extending truncates and hence ensures sub-page block size
   866		 * filesystems are correctly handled, too.
   867		 *
   868		 * We have to do all the page cache truncate work outside the
   869		 * transaction context as the "lock" order is page lock->log space
   870		 * reservation as defined by extent allocation in the writeback path.
   871		 * Hence a truncate can fail with ENOMEM from xfs_trans_alloc(), but
   872		 * having already truncated the in-memory version of the file (i.e. made
   873		 * user visible changes). There's not much we can do about this, except
   874		 * to hope that the caller sees ENOMEM and retries the truncate
   875		 * operation.
   876		 *
   877		 * And we update in-core i_size and truncate page cache beyond newsize
   878		 * before writeback the [i_disk_size, newsize] range, so we're
   879		 * guaranteed not to write stale data past the new EOF on truncate down.
   880		 */
   881		truncate_setsize(inode, newsize);
   882	
   883		/*
   884		 * We are going to log the inode size change in this transaction so
   885		 * any previous writes that are beyond the on disk EOF and the new
   886		 * EOF that have not been written out need to be written here.  If we
   887		 * do not write the data out, we expose ourselves to the null files
   888		 * problem. Note that this includes any block zeroing we did above;
   889		 * otherwise those blocks may not be zeroed after a crash.
   890		 */
   891		if (did_zeroing ||
   892		    (newsize > ip->i_disk_size && oldsize != ip->i_disk_size)) {
   893			error = filemap_write_and_wait_range(VFS_I(ip)->i_mapping,
   894							ip->i_disk_size, newsize - 1);
   895			if (error)
   896				return error;
   897		}
   898	
   899		error = xfs_trans_alloc(mp, &M_RES(mp)->tr_itruncate, 0, 0, 0, &tp);
   900		if (error)
   901			return error;
   902	
   903		lock_flags |= XFS_ILOCK_EXCL;
   904		xfs_ilock(ip, XFS_ILOCK_EXCL);
   905		xfs_trans_ijoin(tp, ip, 0);
   906	
   907		/*
   908		 * Only change the c/mtime if we are changing the size or we are
   909		 * explicitly asked to change it.  This handles the semantic difference
   910		 * between truncate() and ftruncate() as implemented in the VFS.
   911		 *
   912		 * The regular truncate() case without ATTR_CTIME and ATTR_MTIME is a
   913		 * special case where we need to update the times despite not having
   914		 * these flags set.  For all other operations the VFS set these flags
   915		 * explicitly if it wants a timestamp update.
   916		 */
   917		if (newsize != oldsize &&
   918		    !(iattr->ia_valid & (ATTR_CTIME | ATTR_MTIME))) {
 > 919			iattr->ia_ctime = iattr->ia_mtime =
 > 920				current_mgtime(inode);
   921			iattr->ia_valid |= ATTR_CTIME | ATTR_MTIME;
   922		}
   923	
   924		/*
   925		 * The first thing we do is set the size to new_size permanently on
   926		 * disk.  This way we don't have to worry about anyone ever being able
   927		 * to look at the data being freed even in the face of a crash.
   928		 * What we're getting around here is the case where we free a block, it
   929		 * is allocated to another file, it is written to, and then we crash.
   930		 * If the new data gets written to the file but the log buffers
   931		 * containing the free and reallocation don't, then we'd end up with
   932		 * garbage in the blocks being freed.  As long as we make the new size
   933		 * permanent before actually freeing any blocks it doesn't matter if
   934		 * they get written to.
   935		 */
   936		ip->i_disk_size = newsize;
   937		xfs_trans_log_inode(tp, ip, XFS_ILOG_CORE);
   938	
   939		if (newsize <= oldsize) {
   940			error = xfs_itruncate_extents(&tp, ip, XFS_DATA_FORK, newsize);
   941			if (error)
   942				goto out_trans_cancel;
   943	
   944			/*
   945			 * Truncated "down", so we're removing references to old data
   946			 * here - if we delay flushing for a long time, we expose
   947			 * ourselves unduly to the notorious NULL files problem.  So,
   948			 * we mark this inode and flush it when the file is closed,
   949			 * and do not wait the usual (long) time for writeout.
   950			 */
   951			xfs_iflags_set(ip, XFS_ITRUNCATED);
   952	
   953			/* A truncate down always removes post-EOF blocks. */
   954			xfs_inode_clear_eofblocks_tag(ip);
   955		}
   956	
   957		ASSERT(!(iattr->ia_valid & (ATTR_UID | ATTR_GID)));
   958		setattr_copy(idmap, inode, iattr);
   959		xfs_trans_log_inode(tp, ip, XFS_ILOG_CORE);
   960	
   961		XFS_STATS_INC(mp, xs_ig_attrchg);
   962	
   963		if (xfs_has_wsync(mp))
   964			xfs_trans_set_sync(tp);
   965	
   966		error = xfs_trans_commit(tp);
   967	out_unlock:
   968		if (lock_flags)
   969			xfs_iunlock(ip, lock_flags);
   970		return error;
   971	
   972	out_trans_cancel:
   973		xfs_trans_cancel(tp);
   974		goto out_unlock;
   975	}
   976	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
