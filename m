Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0357B
	for <llvm@lists.linux.dev>; Thu, 24 Feb 2022 02:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645668549; x=1677204549;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=umV0LeVJElAOrBgOzVYC0/wzC4LagbyZJ4BUoDCmMaQ=;
  b=nPSH0ZPNmmyNZIcQqfvFYXG6uF6UMkCBpJKYecKXfGMmlCS334ILfvOe
   BktPufSFwvTZfnTMXd9iMVTO2JMQ1DwRCoiBq+vizBJoFF7NlLis4GtAN
   Vqx7HUDSTfIIcyMKraftBbVQVewq71BDR6NEuKSMUBzm1805BhSwCEPWg
   +KQzm8aOc3f4v0XgzOdkIo842wYmgzmus7lNJFtRaxotblg3oaaXUrOhw
   KauglTLdXY1NyuoU5VJwHcBILCv0scwsPAykOu6xwv5Dj1aglm3M6ghdQ
   mnZyfUETcaomxXhXkG2m/G5maawXATZ7G0hmgwcFJlJ3D/Yxvu9dDh6Hu
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="276754675"
X-IronPort-AV: E=Sophos;i="5.88,392,1635231600"; 
   d="scan'208";a="276754675"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 18:09:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,392,1635231600"; 
   d="scan'208";a="508684941"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 23 Feb 2022 18:08:58 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nN3Yv-000273-Pf; Thu, 24 Feb 2022 02:08:57 +0000
Date: Thu, 24 Feb 2022 10:08:35 +0800
From: kernel test robot <lkp@intel.com>
To: Omar Sandoval <osandov@fb.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Sterba <dsterba@suse.com>,
	Nikolay Borisov <nborisov@suse.com>,
	Josef Bacik <josef@toxicpanda.com>
Subject: [linux-next:master 5435/7526] fs/btrfs/ordered-data.c:168: warning:
 expecting prototype for Add an ordered extent to the per(). Prototype was
 for btrfs_add_ordered_extent() instead
Message-ID: <202202241039.g8GKEE4O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   196d330d7fb1e7cc0d85641c89ce4602cb36f12e
commit: ba069f1fdae3d3d1e1cf25aa281c816d82bd4fe2 [5435/7526] btrfs: add ram_bytes and offset to btrfs_ordered_extent
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20220224/202202241039.g8GKEE4O-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ba069f1fdae3d3d1e1cf25aa281c816d82bd4fe2
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout ba069f1fdae3d3d1e1cf25aa281c816d82bd4fe2
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/btrfs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/btrfs/ordered-data.c:168: warning: expecting prototype for Add an ordered extent to the per(). Prototype was for btrfs_add_ordered_extent() instead


vim +168 fs/btrfs/ordered-data.c

dc17ff8f11d129 Chris Mason     2008-01-08  145  
ba069f1fdae3d3 Omar Sandoval   2019-11-06  146  /**
ba069f1fdae3d3 Omar Sandoval   2019-11-06  147   * Add an ordered extent to the per-inode tree.
ba069f1fdae3d3 Omar Sandoval   2019-11-06  148   *
ba069f1fdae3d3 Omar Sandoval   2019-11-06  149   * @inode:           Inode that this extent is for.
ba069f1fdae3d3 Omar Sandoval   2019-11-06  150   * @file_offset:     Logical offset in file where the extent starts.
ba069f1fdae3d3 Omar Sandoval   2019-11-06  151   * @num_bytes:       Logical length of extent in file.
ba069f1fdae3d3 Omar Sandoval   2019-11-06  152   * @ram_bytes:       Full length of unencoded data.
ba069f1fdae3d3 Omar Sandoval   2019-11-06  153   * @disk_bytenr:     Offset of extent on disk.
ba069f1fdae3d3 Omar Sandoval   2019-11-06  154   * @disk_num_bytes:  Size of extent on disk.
ba069f1fdae3d3 Omar Sandoval   2019-11-06  155   * @offset:          Offset into unencoded data where file data starts.
ba069f1fdae3d3 Omar Sandoval   2019-11-06  156   * @flags:           Flags specifying type of extent (1 << BTRFS_ORDERED_*).
ba069f1fdae3d3 Omar Sandoval   2019-11-06  157   * @compress_type:   Compression algorithm used for data.
ba069f1fdae3d3 Omar Sandoval   2019-11-06  158   *
ba069f1fdae3d3 Omar Sandoval   2019-11-06  159   * Most of these parameters correspond to &struct btrfs_file_extent_item. The
ba069f1fdae3d3 Omar Sandoval   2019-11-06  160   * tree is given a single reference on the ordered extent that was inserted.
eb84ae039e10f1 Chris Mason     2008-07-17  161   *
ba069f1fdae3d3 Omar Sandoval   2019-11-06  162   * Return: 0 or -ENOMEM.
eb84ae039e10f1 Chris Mason     2008-07-17  163   */
ba069f1fdae3d3 Omar Sandoval   2019-11-06  164  int btrfs_add_ordered_extent(struct btrfs_inode *inode, u64 file_offset,
ba069f1fdae3d3 Omar Sandoval   2019-11-06  165  			     u64 num_bytes, u64 ram_bytes, u64 disk_bytenr,
ba069f1fdae3d3 Omar Sandoval   2019-11-06  166  			     u64 disk_num_bytes, u64 offset, unsigned flags,
bffe633e00fb6b Omar Sandoval   2019-12-02  167  			     int compress_type)
dc17ff8f11d129 Chris Mason     2008-01-08 @168  {
da69fea9f785d8 Nikolay Borisov 2020-06-03  169  	struct btrfs_root *root = inode->root;
da69fea9f785d8 Nikolay Borisov 2020-06-03  170  	struct btrfs_fs_info *fs_info = root->fs_info;
da69fea9f785d8 Nikolay Borisov 2020-06-03  171  	struct btrfs_ordered_inode_tree *tree = &inode->ordered_tree;
e6dcd2dc9c4891 Chris Mason     2008-07-17  172  	struct rb_node *node;
e6dcd2dc9c4891 Chris Mason     2008-07-17  173  	struct btrfs_ordered_extent *entry;
7dbeaad0af7d0a Qu Wenruo       2020-06-10  174  	int ret;
dc17ff8f11d129 Chris Mason     2008-01-08  175  
ba069f1fdae3d3 Omar Sandoval   2019-11-06  176  	if (flags &
ba069f1fdae3d3 Omar Sandoval   2019-11-06  177  	    ((1 << BTRFS_ORDERED_NOCOW) | (1 << BTRFS_ORDERED_PREALLOC))) {
7dbeaad0af7d0a Qu Wenruo       2020-06-10  178  		/* For nocow write, we can release the qgroup rsv right now */
8b8a979f1fc690 Nikolay Borisov 2020-06-03  179  		ret = btrfs_qgroup_free_data(inode, NULL, file_offset, num_bytes);
7dbeaad0af7d0a Qu Wenruo       2020-06-10  180  		if (ret < 0)
7dbeaad0af7d0a Qu Wenruo       2020-06-10  181  			return ret;
7dbeaad0af7d0a Qu Wenruo       2020-06-10  182  		ret = 0;
7dbeaad0af7d0a Qu Wenruo       2020-06-10  183  	} else {
7dbeaad0af7d0a Qu Wenruo       2020-06-10  184  		/*
7dbeaad0af7d0a Qu Wenruo       2020-06-10  185  		 * The ordered extent has reserved qgroup space, release now
7dbeaad0af7d0a Qu Wenruo       2020-06-10  186  		 * and pass the reserved number for qgroup_record to free.
7dbeaad0af7d0a Qu Wenruo       2020-06-10  187  		 */
72b7d15bf1e1ee Nikolay Borisov 2020-06-03  188  		ret = btrfs_qgroup_release_data(inode, file_offset, num_bytes);
7dbeaad0af7d0a Qu Wenruo       2020-06-10  189  		if (ret < 0)
7dbeaad0af7d0a Qu Wenruo       2020-06-10  190  			return ret;
7dbeaad0af7d0a Qu Wenruo       2020-06-10  191  	}
6352b91da1a210 Miao Xie        2012-09-06  192  	entry = kmem_cache_zalloc(btrfs_ordered_extent_cache, GFP_NOFS);
dc17ff8f11d129 Chris Mason     2008-01-08  193  	if (!entry)
dc17ff8f11d129 Chris Mason     2008-01-08  194  		return -ENOMEM;
dc17ff8f11d129 Chris Mason     2008-01-08  195  
e6dcd2dc9c4891 Chris Mason     2008-07-17  196  	entry->file_offset = file_offset;
bffe633e00fb6b Omar Sandoval   2019-12-02  197  	entry->num_bytes = num_bytes;
ba069f1fdae3d3 Omar Sandoval   2019-11-06  198  	entry->ram_bytes = ram_bytes;
ba069f1fdae3d3 Omar Sandoval   2019-11-06  199  	entry->disk_bytenr = disk_bytenr;
bffe633e00fb6b Omar Sandoval   2019-12-02  200  	entry->disk_num_bytes = disk_num_bytes;
ba069f1fdae3d3 Omar Sandoval   2019-11-06  201  	entry->offset = offset;
bffe633e00fb6b Omar Sandoval   2019-12-02  202  	entry->bytes_left = num_bytes;
da69fea9f785d8 Nikolay Borisov 2020-06-03  203  	entry->inode = igrab(&inode->vfs_inode);
261507a02ccba9 Li Zefan        2010-12-17  204  	entry->compress_type = compress_type;
77cef2ec548456 Josef Bacik     2013-08-29  205  	entry->truncated_len = (u64)-1;
7dbeaad0af7d0a Qu Wenruo       2020-06-10  206  	entry->qgroup_rsv = ret;
d8e3fb106f3938 Naohiro Aota    2021-02-04  207  	entry->physical = (u64)-1;
3c198fe064491d Qu Wenruo       2021-01-21  208  
ba069f1fdae3d3 Omar Sandoval   2019-11-06  209  	ASSERT((flags & ~BTRFS_ORDERED_TYPE_FLAGS) == 0);
ba069f1fdae3d3 Omar Sandoval   2019-11-06  210  	entry->flags = flags;
3eaa2885276fd6 Chris Mason     2008-07-24  211  
5deb17e18e27a3 Josef Bacik     2020-10-09  212  	percpu_counter_add_batch(&fs_info->ordered_bytes, num_bytes,
4297ff84dc24d1 Josef Bacik     2019-04-10  213  				 fs_info->delalloc_batch);
5deb17e18e27a3 Josef Bacik     2020-10-09  214  
e6dcd2dc9c4891 Chris Mason     2008-07-17  215  	/* one ref for the tree */
e76edab7f059bc Elena Reshetova 2017-03-03  216  	refcount_set(&entry->refs, 1);
e6dcd2dc9c4891 Chris Mason     2008-07-17  217  	init_waitqueue_head(&entry->wait);
e6dcd2dc9c4891 Chris Mason     2008-07-17  218  	INIT_LIST_HEAD(&entry->list);
487781796d3022 Filipe Manana   2020-08-11  219  	INIT_LIST_HEAD(&entry->log_list);
3eaa2885276fd6 Chris Mason     2008-07-24  220  	INIT_LIST_HEAD(&entry->root_extent_list);
9afab8820bb8b5 Miao Xie        2012-10-25  221  	INIT_LIST_HEAD(&entry->work_list);
9afab8820bb8b5 Miao Xie        2012-10-25  222  	init_completion(&entry->completion);
dc17ff8f11d129 Chris Mason     2008-01-08  223  
acbf1dd0fcbd10 Nikolay Borisov 2020-08-31  224  	trace_btrfs_ordered_extent_add(inode, entry);
1abe9b8a138c99 liubo           2011-03-24  225  
5fd02043553b02 Josef Bacik     2012-05-02  226  	spin_lock_irq(&tree->lock);
e6dcd2dc9c4891 Chris Mason     2008-07-17  227  	node = tree_insert(&tree->tree, file_offset,
e6dcd2dc9c4891 Chris Mason     2008-07-17  228  			   &entry->rb_node);
43c04fb1b8c9f4 Jeff Mahoney    2011-10-03  229  	if (node)
511a32b5493f0d Nikolay Borisov 2019-11-29  230  		btrfs_panic(fs_info, -EEXIST,
511a32b5493f0d Nikolay Borisov 2019-11-29  231  				"inconsistency in ordered tree at offset %llu",
511a32b5493f0d Nikolay Borisov 2019-11-29  232  				file_offset);
5fd02043553b02 Josef Bacik     2012-05-02  233  	spin_unlock_irq(&tree->lock);
d397712bcc6a75 Chris Mason     2009-01-05  234  
199c2a9c3d1389 Miao Xie        2013-05-15  235  	spin_lock(&root->ordered_extent_lock);
3eaa2885276fd6 Chris Mason     2008-07-24  236  	list_add_tail(&entry->root_extent_list,
199c2a9c3d1389 Miao Xie        2013-05-15  237  		      &root->ordered_extents);
199c2a9c3d1389 Miao Xie        2013-05-15  238  	root->nr_ordered_extents++;
199c2a9c3d1389 Miao Xie        2013-05-15  239  	if (root->nr_ordered_extents == 1) {
0b246afa62b0cf Jeff Mahoney    2016-06-22  240  		spin_lock(&fs_info->ordered_root_lock);
199c2a9c3d1389 Miao Xie        2013-05-15  241  		BUG_ON(!list_empty(&root->ordered_root));
0b246afa62b0cf Jeff Mahoney    2016-06-22  242  		list_add_tail(&root->ordered_root, &fs_info->ordered_roots);
0b246afa62b0cf Jeff Mahoney    2016-06-22  243  		spin_unlock(&fs_info->ordered_root_lock);
199c2a9c3d1389 Miao Xie        2013-05-15  244  	}
199c2a9c3d1389 Miao Xie        2013-05-15  245  	spin_unlock(&root->ordered_extent_lock);
3eaa2885276fd6 Chris Mason     2008-07-24  246  
8b62f87bad9cf0 Josef Bacik     2017-10-19  247  	/*
8b62f87bad9cf0 Josef Bacik     2017-10-19  248  	 * We don't need the count_max_extents here, we can assume that all of
8b62f87bad9cf0 Josef Bacik     2017-10-19  249  	 * that work has been done at higher layers, so this is truly the
8b62f87bad9cf0 Josef Bacik     2017-10-19  250  	 * smallest the extent is going to get.
8b62f87bad9cf0 Josef Bacik     2017-10-19  251  	 */
da69fea9f785d8 Nikolay Borisov 2020-06-03  252  	spin_lock(&inode->lock);
da69fea9f785d8 Nikolay Borisov 2020-06-03  253  	btrfs_mod_outstanding_extents(inode, 1);
da69fea9f785d8 Nikolay Borisov 2020-06-03  254  	spin_unlock(&inode->lock);
8b62f87bad9cf0 Josef Bacik     2017-10-19  255  
dc17ff8f11d129 Chris Mason     2008-01-08  256  	return 0;
dc17ff8f11d129 Chris Mason     2008-01-08  257  }
dc17ff8f11d129 Chris Mason     2008-01-08  258  

:::::: The code at line 168 was first introduced by commit
:::::: dc17ff8f11d129db9e83ab7244769e4eae05e14d Btrfs: Add data=ordered support

:::::: TO: Chris Mason <chris.mason@oracle.com>
:::::: CC: Chris Mason <chris.mason@oracle.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
