Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55183232;
	Wed, 12 Mar 2025 10:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741773634; cv=none; b=m/PaEi11lP2DXkYbUi+KQ9tGXcQ/NvJy2OLHHtt/HNapsA0KLCQpZS5g8DoMojAo99VwHLM1yNRHRr4YokGLURKLoyWRrEJn30TFuTvwB1CjRPLSzMPh8Cexxzt1vusdYqe4OEsISSN+Ud0gg9xQPglV4F2+WQpvnF8+a82UwCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741773634; c=relaxed/simple;
	bh=Ry0O+xHWc8uUmPcH37d44TyTMpOxE5y4W2/77QnjcJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QgOMfwTtK7HNLRBnr/eChw+jP00ctJrB89SalTO53onU9LJ5bCBoB4Xhq5vRr7Diz4ITnDaKjmbrz1asgnIKIywNsP3He+vnsh5XuiI81i8DjbD9cGk2fZpFjp9ABByynrABS4Hrnew+Qd1rrfeAUss9HccplKk8muFpk2PNC3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j3c92ozW; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j3c92ozW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741773627; x=1773309627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ry0O+xHWc8uUmPcH37d44TyTMpOxE5y4W2/77QnjcJ0=;
  b=j3c92ozWwn8KEO5PHZmSQfzsMPonVLzgmhQ3zjLHHnnsAsiPFE7uXgku
   pQF7UYRxpB/j6shEjEJwhD3CPzoliIaUshnWBJHzrwgtMIcncct5iX8Vp
   JV8jhH2v1OFymc3hf9sen2Cqa/SMiEyA5m4DD4svdtF4hq1u2U/e79Wi2
   TKy+Fh37D+HnozIaj13DlEHE60WhiIHA/sBV77gipusBUhxA2d3QbAa5w
   iN5AIvbB9/I3+olC1FMQZUaRs1Dnc2MR6cUew1JrVxb+wM4YItEvccInY
   AiPdt36YGYp/oNVeMGjxbh89p68YLYmS8CzqZ7jwF5YMgRNKcjwq4p8sZ
   A==;
X-CSE-ConnectionGUID: Ffqbxv65SUSpKUMrqan/aw==
X-CSE-MsgGUID: 5n2PTt3FS52BalPW9WZn2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42880851"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="42880851"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 03:00:24 -0700
X-CSE-ConnectionGUID: 3fUA440aQ3qwgwjL9+u+dg==
X-CSE-MsgGUID: jS4rykWESrSeEoonZCIaVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="125232395"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 12 Mar 2025 03:00:22 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsIsu-0008Mc-0o;
	Wed, 12 Mar 2025 10:00:20 +0000
Date: Wed, 12 Mar 2025 17:59:38 +0800
From: kernel test robot <lkp@intel.com>
To: David Sterba <dsterba@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [btrfs:dev/param-const-manual 129/132] fs/btrfs/inode.c:4046:43:
 error: passing argument 1 of 'btrfs_sync_inode_flags_to_i_flags' from
 incompatible pointer type
Message-ID: <202503121745.DMBtRz5g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/btrfs/linux.git dev/param-const-manual
head:   45b6784a058cd49532e6e70b0ff5727ade6b4bbf
commit: 42b0edc3c17de54ab03c66a3bf6232e27ec88eb1 [129/132] btrfs: pass struct btrfs_inode to btrfs_sync_inode_flags_to_i_flags()
config: i386-buildonly-randconfig-004-20250312 (https://download.01.org/0day-ci/archive/20250312/202503121745.DMBtRz5g-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503121745.DMBtRz5g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503121745.DMBtRz5g-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/btrfs/inode.c: In function 'btrfs_read_locked_inode':
>> fs/btrfs/inode.c:4046:43: error: passing argument 1 of 'btrfs_sync_inode_flags_to_i_flags' from incompatible pointer type [-Werror=incompatible-pointer-types]
    4046 |         btrfs_sync_inode_flags_to_i_flags(vfs_inode);
         |                                           ^~~~~~~~~
         |                                           |
         |                                           struct inode *
   In file included from fs/btrfs/inode.c:64:
   fs/btrfs/ioctl.h:23:60: note: expected 'struct btrfs_inode *' but argument is of type 'struct inode *'
      23 | void btrfs_sync_inode_flags_to_i_flags(struct btrfs_inode *inode);
         |                                        ~~~~~~~~~~~~~~~~~~~~^~~~~
   cc1: some warnings being treated as errors


vim +/btrfs_sync_inode_flags_to_i_flags +4046 fs/btrfs/inode.c

69673992b1aea55 Leo Martins               2024-08-30  3847  
d352ac68148b699 Chris Mason               2008-09-29  3848  /*
69673992b1aea55 Leo Martins               2024-08-30  3849   * Read a locked inode from the btree into the in-memory inode and add it to
69673992b1aea55 Leo Martins               2024-08-30  3850   * its root list/tree.
69673992b1aea55 Leo Martins               2024-08-30  3851   *
69673992b1aea55 Leo Martins               2024-08-30  3852   * On failure clean up the inode.
d352ac68148b699 Chris Mason               2008-09-29  3853   */
d6c743f76a9fe9b David Sterba              2025-02-17  3854  static int btrfs_read_locked_inode(struct btrfs_inode *inode, struct btrfs_path *path)
39279cc3d2704cf Chris Mason               2007-06-12  3855  {
d6c743f76a9fe9b David Sterba              2025-02-17  3856  	struct btrfs_root *root = inode->root;
d6c743f76a9fe9b David Sterba              2025-02-17  3857  	struct btrfs_fs_info *fs_info = root->fs_info;
5f39d397dfbe140 Chris Mason               2007-10-15  3858  	struct extent_buffer *leaf;
39279cc3d2704cf Chris Mason               2007-06-12  3859  	struct btrfs_inode_item *inode_item;
d6c743f76a9fe9b David Sterba              2025-02-17  3860  	struct inode *vfs_inode = &inode->vfs_inode;
39279cc3d2704cf Chris Mason               2007-06-12  3861  	struct btrfs_key location;
67de11769bd5ec3 Miao Xie                  2013-12-26  3862  	unsigned long ptr;
46a53cca826e71e Chris Mason               2009-04-27  3863  	int maybe_acls;
618e21d5957c88c Josef Bacik               2007-07-11  3864  	u32 rdev;
39279cc3d2704cf Chris Mason               2007-06-12  3865  	int ret;
2f7e33d432d097a Miao Xie                  2011-06-23  3866  	bool filled = false;
63541927c8d11d2 Filipe David Borba Manana 2014-01-07  3867  	int first_xattr_slot;
2f7e33d432d097a Miao Xie                  2011-06-23  3868  
d6c743f76a9fe9b David Sterba              2025-02-17  3869  	ret = btrfs_init_file_extent_tree(inode);
3d7db6e8bd22e69 Filipe Manana             2024-04-30  3870  	if (ret)
69673992b1aea55 Leo Martins               2024-08-30  3871  		goto out;
3d7db6e8bd22e69 Filipe Manana             2024-04-30  3872  
e9dcee71b400598 David Sterba              2025-02-18  3873  	ret = btrfs_fill_inode(inode, &rdev);
2f7e33d432d097a Miao Xie                  2011-06-23  3874  	if (!ret)
2f7e33d432d097a Miao Xie                  2011-06-23  3875  		filled = true;
39279cc3d2704cf Chris Mason               2007-06-12  3876  
7c855e16ab72596 Leo Martins               2024-08-30  3877  	ASSERT(path);
1748f843a0190ef Mark Fasheh               2011-07-12  3878  
d6c743f76a9fe9b David Sterba              2025-02-17  3879  	btrfs_get_inode_key(inode, &location);
dc17ff8f11d129d Chris Mason               2008-01-08  3880  
39279cc3d2704cf Chris Mason               2007-06-12  3881  	ret = btrfs_lookup_inode(NULL, root, path, &location, 0);
67710892ec983aa Filipe Manana             2016-06-06  3882  	if (ret) {
69673992b1aea55 Leo Martins               2024-08-30  3883  		/*
69673992b1aea55 Leo Martins               2024-08-30  3884  		 * ret > 0 can come from btrfs_search_slot called by
69673992b1aea55 Leo Martins               2024-08-30  3885  		 * btrfs_lookup_inode(), this means the inode was not found.
69673992b1aea55 Leo Martins               2024-08-30  3886  		 */
69673992b1aea55 Leo Martins               2024-08-30  3887  		if (ret > 0)
69673992b1aea55 Leo Martins               2024-08-30  3888  			ret = -ENOENT;
69673992b1aea55 Leo Martins               2024-08-30  3889  		goto out;
67710892ec983aa Filipe Manana             2016-06-06  3890  	}
5f39d397dfbe140 Chris Mason               2007-10-15  3891  
5f39d397dfbe140 Chris Mason               2007-10-15  3892  	leaf = path->nodes[0];
2f7e33d432d097a Miao Xie                  2011-06-23  3893  
2f7e33d432d097a Miao Xie                  2011-06-23  3894  	if (filled)
67de11769bd5ec3 Miao Xie                  2013-12-26  3895  		goto cache_index;
2f7e33d432d097a Miao Xie                  2011-06-23  3896  
5f39d397dfbe140 Chris Mason               2007-10-15  3897  	inode_item = btrfs_item_ptr(leaf, path->slots[0],
39279cc3d2704cf Chris Mason               2007-06-12  3898  				    struct btrfs_inode_item);
d6c743f76a9fe9b David Sterba              2025-02-17  3899  	vfs_inode->i_mode = btrfs_inode_mode(leaf, inode_item);
d6c743f76a9fe9b David Sterba              2025-02-17  3900  	set_nlink(vfs_inode, btrfs_inode_nlink(leaf, inode_item));
d6c743f76a9fe9b David Sterba              2025-02-17  3901  	i_uid_write(vfs_inode, btrfs_inode_uid(leaf, inode_item));
d6c743f76a9fe9b David Sterba              2025-02-17  3902  	i_gid_write(vfs_inode, btrfs_inode_gid(leaf, inode_item));
d6c743f76a9fe9b David Sterba              2025-02-17  3903  	btrfs_i_size_write(inode, btrfs_inode_size(leaf, inode_item));
d6c743f76a9fe9b David Sterba              2025-02-17  3904  	btrfs_inode_set_file_extent_range(inode, 0,
d6c743f76a9fe9b David Sterba              2025-02-17  3905  			round_up(i_size_read(vfs_inode), fs_info->sectorsize));
d6c743f76a9fe9b David Sterba              2025-02-17  3906  
d6c743f76a9fe9b David Sterba              2025-02-17  3907  	inode_set_atime(vfs_inode, btrfs_timespec_sec(leaf, &inode_item->atime),
b1c38a1338c9059 Jeff Layton               2023-10-04  3908  			btrfs_timespec_nsec(leaf, &inode_item->atime));
5f39d397dfbe140 Chris Mason               2007-10-15  3909  
d6c743f76a9fe9b David Sterba              2025-02-17  3910  	inode_set_mtime(vfs_inode, btrfs_timespec_sec(leaf, &inode_item->mtime),
b1c38a1338c9059 Jeff Layton               2023-10-04  3911  			btrfs_timespec_nsec(leaf, &inode_item->mtime));
5f39d397dfbe140 Chris Mason               2007-10-15  3912  
d6c743f76a9fe9b David Sterba              2025-02-17  3913  	inode_set_ctime(vfs_inode, btrfs_timespec_sec(leaf, &inode_item->ctime),
2a9462de4352d14 Jeff Layton               2023-07-05  3914  			btrfs_timespec_nsec(leaf, &inode_item->ctime));
5f39d397dfbe140 Chris Mason               2007-10-15  3915  
d6c743f76a9fe9b David Sterba              2025-02-17  3916  	inode->i_otime_sec = btrfs_timespec_sec(leaf, &inode_item->otime);
d6c743f76a9fe9b David Sterba              2025-02-17  3917  	inode->i_otime_nsec = btrfs_timespec_nsec(leaf, &inode_item->otime);
5f39d397dfbe140 Chris Mason               2007-10-15  3918  
d6c743f76a9fe9b David Sterba              2025-02-17  3919  	inode_set_bytes(vfs_inode, btrfs_inode_nbytes(leaf, inode_item));
d6c743f76a9fe9b David Sterba              2025-02-17  3920  	inode->generation = btrfs_inode_generation(leaf, inode_item);
d6c743f76a9fe9b David Sterba              2025-02-17  3921  	inode->last_trans = btrfs_inode_transid(leaf, inode_item);
5dc562c541e1026 Josef Bacik               2012-08-17  3922  
d6c743f76a9fe9b David Sterba              2025-02-17  3923  	inode_set_iversion_queried(vfs_inode, btrfs_inode_sequence(leaf, inode_item));
d6c743f76a9fe9b David Sterba              2025-02-17  3924  	vfs_inode->i_generation = inode->generation;
d6c743f76a9fe9b David Sterba              2025-02-17  3925  	vfs_inode->i_rdev = 0;
6e17d30bfaf43e0 Yang Dongsheng            2015-04-09  3926  	rdev = btrfs_inode_rdev(leaf, inode_item);
6e17d30bfaf43e0 Yang Dongsheng            2015-04-09  3927  
d6c743f76a9fe9b David Sterba              2025-02-17  3928  	if (S_ISDIR(vfs_inode->i_mode))
d6c743f76a9fe9b David Sterba              2025-02-17  3929  		inode->index_cnt = (u64)-1;
d9891ae28b0d3d3 Filipe Manana             2024-04-30  3930  
77eea05e7851d91 Boris Burkov              2021-06-30  3931  	btrfs_inode_split_flags(btrfs_inode_flags(leaf, inode_item),
d6c743f76a9fe9b David Sterba              2025-02-17  3932  				&inode->flags, &inode->ro_flags);
d6c743f76a9fe9b David Sterba              2025-02-17  3933  	btrfs_update_inode_mapping_flags(inode);
6e17d30bfaf43e0 Yang Dongsheng            2015-04-09  3934  
6e17d30bfaf43e0 Yang Dongsheng            2015-04-09  3935  cache_index:
5dc562c541e1026 Josef Bacik               2012-08-17  3936  	/*
5dc562c541e1026 Josef Bacik               2012-08-17  3937  	 * If we were modified in the current generation and evicted from memory
5dc562c541e1026 Josef Bacik               2012-08-17  3938  	 * and then re-read we need to do a full sync since we don't have any
5dc562c541e1026 Josef Bacik               2012-08-17  3939  	 * idea about which extents were modified before we were evicted from
5dc562c541e1026 Josef Bacik               2012-08-17  3940  	 * cache.
6e17d30bfaf43e0 Yang Dongsheng            2015-04-09  3941  	 *
6e17d30bfaf43e0 Yang Dongsheng            2015-04-09  3942  	 * This is required for both inode re-read from disk and delayed inode
6140ba8a0a14609 David Sterba              2023-12-06  3943  	 * in the delayed_nodes xarray.
5dc562c541e1026 Josef Bacik               2012-08-17  3944  	 */
d6c743f76a9fe9b David Sterba              2025-02-17  3945  	if (inode->last_trans == btrfs_get_fs_generation(fs_info))
d6c743f76a9fe9b David Sterba              2025-02-17  3946  		set_bit(BTRFS_INODE_NEEDS_FULL_SYNC, &inode->runtime_flags);
5dc562c541e1026 Josef Bacik               2012-08-17  3947  
bde6c242027b0f1 Filipe Manana             2015-07-24  3948  	/*
bde6c242027b0f1 Filipe Manana             2015-07-24  3949  	 * We don't persist the id of the transaction where an unlink operation
bde6c242027b0f1 Filipe Manana             2015-07-24  3950  	 * against the inode was last made. So here we assume the inode might
bde6c242027b0f1 Filipe Manana             2015-07-24  3951  	 * have been evicted, and therefore the exact value of last_unlink_trans
bde6c242027b0f1 Filipe Manana             2015-07-24  3952  	 * lost, and set it to last_trans to avoid metadata inconsistencies
bde6c242027b0f1 Filipe Manana             2015-07-24  3953  	 * between the inode and its parent if the inode is fsync'ed and the log
bde6c242027b0f1 Filipe Manana             2015-07-24  3954  	 * replayed. For example, in the scenario:
bde6c242027b0f1 Filipe Manana             2015-07-24  3955  	 *
bde6c242027b0f1 Filipe Manana             2015-07-24  3956  	 * touch mydir/foo
bde6c242027b0f1 Filipe Manana             2015-07-24  3957  	 * ln mydir/foo mydir/bar
bde6c242027b0f1 Filipe Manana             2015-07-24  3958  	 * sync
bde6c242027b0f1 Filipe Manana             2015-07-24  3959  	 * unlink mydir/bar
bde6c242027b0f1 Filipe Manana             2015-07-24  3960  	 * echo 2 > /proc/sys/vm/drop_caches   # evicts inode
bde6c242027b0f1 Filipe Manana             2015-07-24  3961  	 * xfs_io -c fsync mydir/foo
bde6c242027b0f1 Filipe Manana             2015-07-24  3962  	 * <power failure>
bde6c242027b0f1 Filipe Manana             2015-07-24  3963  	 * mount fs, triggers fsync log replay
bde6c242027b0f1 Filipe Manana             2015-07-24  3964  	 *
bde6c242027b0f1 Filipe Manana             2015-07-24  3965  	 * We must make sure that when we fsync our inode foo we also log its
bde6c242027b0f1 Filipe Manana             2015-07-24  3966  	 * parent inode, otherwise after log replay the parent still has the
bde6c242027b0f1 Filipe Manana             2015-07-24  3967  	 * dentry with the "bar" name but our inode foo has a link count of 1
bde6c242027b0f1 Filipe Manana             2015-07-24  3968  	 * and doesn't have an inode ref with the name "bar" anymore.
bde6c242027b0f1 Filipe Manana             2015-07-24  3969  	 *
bde6c242027b0f1 Filipe Manana             2015-07-24  3970  	 * Setting last_unlink_trans to last_trans is a pessimistic approach,
0132761017e012a Nicholas D Steeves        2016-05-19  3971  	 * but it guarantees correctness at the expense of occasional full
bde6c242027b0f1 Filipe Manana             2015-07-24  3972  	 * transaction commits on fsync if our inode is a directory, or if our
bde6c242027b0f1 Filipe Manana             2015-07-24  3973  	 * inode is not a directory, logging its parent unnecessarily.
bde6c242027b0f1 Filipe Manana             2015-07-24  3974  	 */
d6c743f76a9fe9b David Sterba              2025-02-17  3975  	inode->last_unlink_trans = inode->last_trans;
bde6c242027b0f1 Filipe Manana             2015-07-24  3976  
3ebac17ce593490 Filipe Manana             2020-07-15  3977  	/*
3ebac17ce593490 Filipe Manana             2020-07-15  3978  	 * Same logic as for last_unlink_trans. We don't persist the generation
3ebac17ce593490 Filipe Manana             2020-07-15  3979  	 * of the last transaction where this inode was used for a reflink
3ebac17ce593490 Filipe Manana             2020-07-15  3980  	 * operation, so after eviction and reloading the inode we must be
3ebac17ce593490 Filipe Manana             2020-07-15  3981  	 * pessimistic and assume the last transaction that modified the inode.
3ebac17ce593490 Filipe Manana             2020-07-15  3982  	 */
d6c743f76a9fe9b David Sterba              2025-02-17  3983  	inode->last_reflink_trans = inode->last_trans;
3ebac17ce593490 Filipe Manana             2020-07-15  3984  
67de11769bd5ec3 Miao Xie                  2013-12-26  3985  	path->slots[0]++;
d6c743f76a9fe9b David Sterba              2025-02-17  3986  	if (vfs_inode->i_nlink != 1 ||
67de11769bd5ec3 Miao Xie                  2013-12-26  3987  	    path->slots[0] >= btrfs_header_nritems(leaf))
67de11769bd5ec3 Miao Xie                  2013-12-26  3988  		goto cache_acl;
67de11769bd5ec3 Miao Xie                  2013-12-26  3989  
67de11769bd5ec3 Miao Xie                  2013-12-26  3990  	btrfs_item_key_to_cpu(leaf, &location, path->slots[0]);
d6c743f76a9fe9b David Sterba              2025-02-17  3991  	if (location.objectid != btrfs_ino(inode))
67de11769bd5ec3 Miao Xie                  2013-12-26  3992  		goto cache_acl;
67de11769bd5ec3 Miao Xie                  2013-12-26  3993  
67de11769bd5ec3 Miao Xie                  2013-12-26  3994  	ptr = btrfs_item_ptr_offset(leaf, path->slots[0]);
67de11769bd5ec3 Miao Xie                  2013-12-26  3995  	if (location.type == BTRFS_INODE_REF_KEY) {
67de11769bd5ec3 Miao Xie                  2013-12-26  3996  		struct btrfs_inode_ref *ref;
67de11769bd5ec3 Miao Xie                  2013-12-26  3997  
67de11769bd5ec3 Miao Xie                  2013-12-26  3998  		ref = (struct btrfs_inode_ref *)ptr;
d6c743f76a9fe9b David Sterba              2025-02-17  3999  		inode->dir_index = btrfs_inode_ref_index(leaf, ref);
67de11769bd5ec3 Miao Xie                  2013-12-26  4000  	} else if (location.type == BTRFS_INODE_EXTREF_KEY) {
67de11769bd5ec3 Miao Xie                  2013-12-26  4001  		struct btrfs_inode_extref *extref;
67de11769bd5ec3 Miao Xie                  2013-12-26  4002  
67de11769bd5ec3 Miao Xie                  2013-12-26  4003  		extref = (struct btrfs_inode_extref *)ptr;
d6c743f76a9fe9b David Sterba              2025-02-17  4004  		inode->dir_index = btrfs_inode_extref_index(leaf, extref);
67de11769bd5ec3 Miao Xie                  2013-12-26  4005  	}
2f7e33d432d097a Miao Xie                  2011-06-23  4006  cache_acl:
46a53cca826e71e Chris Mason               2009-04-27  4007  	/*
46a53cca826e71e Chris Mason               2009-04-27  4008  	 * try to precache a NULL acl entry for files that don't have
46a53cca826e71e Chris Mason               2009-04-27  4009  	 * any xattrs or acls
46a53cca826e71e Chris Mason               2009-04-27  4010  	 */
33345d01522f815 Li Zefan                  2011-04-20  4011  	maybe_acls = acls_after_inode_item(leaf, path->slots[0],
d6c743f76a9fe9b David Sterba              2025-02-17  4012  					   btrfs_ino(inode), &first_xattr_slot);
63541927c8d11d2 Filipe David Borba Manana 2014-01-07  4013  	if (first_xattr_slot != -1) {
63541927c8d11d2 Filipe David Borba Manana 2014-01-07  4014  		path->slots[0] = first_xattr_slot;
15a0ace9137c2c4 David Sterba              2025-02-18  4015  		ret = btrfs_load_inode_props(inode, path);
63541927c8d11d2 Filipe David Borba Manana 2014-01-07  4016  		if (ret)
0b246afa62b0cf5 Jeff Mahoney              2016-06-22  4017  			btrfs_err(fs_info,
351fd3532159441 David Sterba              2014-05-15  4018  				  "error loading props for ino %llu (root %llu): %d",
d6c743f76a9fe9b David Sterba              2025-02-17  4019  				  btrfs_ino(inode), btrfs_root_id(root), ret);
63541927c8d11d2 Filipe David Borba Manana 2014-01-07  4020  	}
63541927c8d11d2 Filipe David Borba Manana 2014-01-07  4021  
72c04902d1e27c8 Al Viro                   2009-06-24  4022  	if (!maybe_acls)
d6c743f76a9fe9b David Sterba              2025-02-17  4023  		cache_no_acl(vfs_inode);
46a53cca826e71e Chris Mason               2009-04-27  4024  
d6c743f76a9fe9b David Sterba              2025-02-17  4025  	switch (vfs_inode->i_mode & S_IFMT) {
39279cc3d2704cf Chris Mason               2007-06-12  4026  	case S_IFREG:
d6c743f76a9fe9b David Sterba              2025-02-17  4027  		vfs_inode->i_mapping->a_ops = &btrfs_aops;
d6c743f76a9fe9b David Sterba              2025-02-17  4028  		vfs_inode->i_fop = &btrfs_file_operations;
d6c743f76a9fe9b David Sterba              2025-02-17  4029  		vfs_inode->i_op = &btrfs_file_inode_operations;
39279cc3d2704cf Chris Mason               2007-06-12  4030  		break;
39279cc3d2704cf Chris Mason               2007-06-12  4031  	case S_IFDIR:
d6c743f76a9fe9b David Sterba              2025-02-17  4032  		vfs_inode->i_fop = &btrfs_dir_file_operations;
d6c743f76a9fe9b David Sterba              2025-02-17  4033  		vfs_inode->i_op = &btrfs_dir_inode_operations;
39279cc3d2704cf Chris Mason               2007-06-12  4034  		break;
39279cc3d2704cf Chris Mason               2007-06-12  4035  	case S_IFLNK:
d6c743f76a9fe9b David Sterba              2025-02-17  4036  		vfs_inode->i_op = &btrfs_symlink_inode_operations;
d6c743f76a9fe9b David Sterba              2025-02-17  4037  		inode_nohighmem(vfs_inode);
d6c743f76a9fe9b David Sterba              2025-02-17  4038  		vfs_inode->i_mapping->a_ops = &btrfs_aops;
39279cc3d2704cf Chris Mason               2007-06-12  4039  		break;
618e21d5957c88c Josef Bacik               2007-07-11  4040  	default:
d6c743f76a9fe9b David Sterba              2025-02-17  4041  		vfs_inode->i_op = &btrfs_special_inode_operations;
d6c743f76a9fe9b David Sterba              2025-02-17  4042  		init_special_inode(vfs_inode, vfs_inode->i_mode, rdev);
618e21d5957c88c Josef Bacik               2007-07-11  4043  		break;
39279cc3d2704cf Chris Mason               2007-06-12  4044  	}
6cbff00f4632c80 Christoph Hellwig         2009-04-17  4045  
d6c743f76a9fe9b David Sterba              2025-02-17 @4046  	btrfs_sync_inode_flags_to_i_flags(vfs_inode);
69673992b1aea55 Leo Martins               2024-08-30  4047  
d6c743f76a9fe9b David Sterba              2025-02-17  4048  	ret = btrfs_add_inode_to_root(inode, true);
69673992b1aea55 Leo Martins               2024-08-30  4049  	if (ret)
69673992b1aea55 Leo Martins               2024-08-30  4050  		goto out;
69673992b1aea55 Leo Martins               2024-08-30  4051  
67710892ec983aa Filipe Manana             2016-06-06  4052  	return 0;
69673992b1aea55 Leo Martins               2024-08-30  4053  out:
d6c743f76a9fe9b David Sterba              2025-02-17  4054  	iget_failed(vfs_inode);
69673992b1aea55 Leo Martins               2024-08-30  4055  	return ret;
39279cc3d2704cf Chris Mason               2007-06-12  4056  }
39279cc3d2704cf Chris Mason               2007-06-12  4057  

:::::: The code at line 4046 was first introduced by commit
:::::: d6c743f76a9fe9b2e80f404c485c238a46080e02 btrfs: pass struct btrfs_inode to btrfs_read_locked_inode()

:::::: TO: David Sterba <dsterba@suse.com>
:::::: CC: David Sterba <dsterba@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
