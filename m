Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99F317B500;
	Fri, 10 Jan 2025 06:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736490307; cv=none; b=kIrGkElgwtY+4yK2GCJHtCL+Sf8WDxwYESft7LVKdfa2JKVkNpJjr4wo2Sy61j+O66eNZc7U0pAjqPEbaDP7dckXu4q8kiC0BC3wtyB+AXg64FXheeJMINmfg5YoNzLW2WC6GKsPpSz0CrBW9pZmmn+ehHpvT9owTO6MuZzcqGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736490307; c=relaxed/simple;
	bh=G9uvnRFMuhoAo14vVQa/Tv9kv9GoagX6PyHav1yNgqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mla+ahZksKpc+dIKz7oVi9OUBinh+oShoddTFqThL3Sk+VsJaHcYozFmqpqlwifMNBUdxmFsMeJ8DP2BvDdAyyLOxX5rX6PIQukq17B5cmXqVV178Fqn5KroRQ0+xKbTFbsfXXtmPLdPZOl8h/VEUL8eAKIuwlJpsJQc4womD5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VUUqiEZW; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VUUqiEZW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736490305; x=1768026305;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G9uvnRFMuhoAo14vVQa/Tv9kv9GoagX6PyHav1yNgqU=;
  b=VUUqiEZWab8LJGiwwQkUy+v425UrmX1btcp6ahdE20v6vKb42XNUQI39
   ASNQUhpZBDW83dZ/C0IwmrsCrqLVAWXxAHmmhF4ev1S3GblcP9HQCZNwH
   Q6THzRStlC8Xsyp5Kgo5n59TbffpAR2a7G2u4V3/HYJYjoUZLJBgxzfag
   4+uuumtKWr+rfgazi84AYJlBPLqLok599faNpw41CI0Bba0n5Ztc0BsF8
   Pa16wsKN3h/jNBJAo6CiIPkcCv7W1QorpiX4/Brx9VZ1131bjaDfS60K9
   W+UMltub+NCPz69W7ElgRR00ChC+toYezP0o/qwrZ4F0I+AG5kO1TUWk6
   Q==;
X-CSE-ConnectionGUID: EFOWzvGGSvW0ZVblWIY1mw==
X-CSE-MsgGUID: LOfoYCDjQn6w2V4D0cAPFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36935785"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="36935785"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 22:25:04 -0800
X-CSE-ConnectionGUID: msyrf1VWQNyEB7kyDFUdMw==
X-CSE-MsgGUID: c44VkyVnSiOmtnn/jI20HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104162426"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Jan 2025 22:25:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tW8S3-000IdX-31;
	Fri, 10 Jan 2025 06:24:59 +0000
Date: Fri, 10 Jan 2025 14:24:02 +0800
From: kernel test robot <lkp@intel.com>
To: Lizhi Xu <lizhi.xu@windriver.com>,
	syzbot+80e60df48923e1b7691d@syzkaller.appspotmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	aivazian.tigran@gmail.com, linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] bfs: put a inode if link count is 0
Message-ID: <202501101459.tVj2wd8p-lkp@intel.com>
References: <20250109034946.1386748-1-lizhi.xu@windriver.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109034946.1386748-1-lizhi.xu@windriver.com>

Hi Lizhi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on linus/master v6.13-rc6 next-20250109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lizhi-Xu/bfs-put-a-inode-if-link-count-is-0/20250109-123423
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20250109034946.1386748-1-lizhi.xu%40windriver.com
patch subject: [PATCH] bfs: put a inode if link count is 0
config: x86_64-buildonly-randconfig-005-20250110 (https://download.01.org/0day-ci/archive/20250110/202501101459.tVj2wd8p-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501101459.tVj2wd8p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501101459.tVj2wd8p-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bfs/dir.c:12:
   In file included from include/linux/buffer_head.h:12:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> fs/bfs/dir.c:225:6: warning: variable 'new_inode' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     225 |         if (!old_bh || (le16_to_cpu(old_de->ino) != old_inode->i_ino))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bfs/dir.c:254:6: note: uninitialized use occurs here
     254 |         if (new_inode && !new_inode->i_nlink)
         |             ^~~~~~~~~
   fs/bfs/dir.c:225:2: note: remove the 'if' if its condition is always false
     225 |         if (!old_bh || (le16_to_cpu(old_de->ino) != old_inode->i_ino))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     226 |                 goto end_rename;
         |                 ~~~~~~~~~~~~~~~
>> fs/bfs/dir.c:225:6: warning: variable 'new_inode' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
     225 |         if (!old_bh || (le16_to_cpu(old_de->ino) != old_inode->i_ino))
         |             ^~~~~~~
   fs/bfs/dir.c:254:6: note: uninitialized use occurs here
     254 |         if (new_inode && !new_inode->i_nlink)
         |             ^~~~~~~~~
   fs/bfs/dir.c:225:6: note: remove the '||' if its condition is always false
     225 |         if (!old_bh || (le16_to_cpu(old_de->ino) != old_inode->i_ino))
         |             ^~~~~~~~~~
   fs/bfs/dir.c:206:37: note: initialize the variable 'new_inode' to silence this warning
     206 |         struct inode *old_inode, *new_inode;
         |                                            ^
         |                                             = NULL
   6 warnings generated.


vim +225 fs/bfs/dir.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  201  
e18275ae55e07a Christian Brauner 2023-01-13  202  static int bfs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
549c7297717c32 Christian Brauner 2021-01-21  203  		      struct dentry *old_dentry, struct inode *new_dir,
549c7297717c32 Christian Brauner 2021-01-21  204  		      struct dentry *new_dentry, unsigned int flags)
^1da177e4c3f41 Linus Torvalds    2005-04-16  205  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  206  	struct inode *old_inode, *new_inode;
^1da177e4c3f41 Linus Torvalds    2005-04-16  207  	struct buffer_head *old_bh, *new_bh;
^1da177e4c3f41 Linus Torvalds    2005-04-16  208  	struct bfs_dirent *old_de, *new_de;
3f165e4cf2af04 Dmitri Vorobiev   2008-07-25  209  	struct bfs_sb_info *info;
^1da177e4c3f41 Linus Torvalds    2005-04-16  210  	int error = -ENOENT;
^1da177e4c3f41 Linus Torvalds    2005-04-16  211  
f03b8ad8d38634 Miklos Szeredi    2016-09-27  212  	if (flags & ~RENAME_NOREPLACE)
f03b8ad8d38634 Miklos Szeredi    2016-09-27  213  		return -EINVAL;
f03b8ad8d38634 Miklos Szeredi    2016-09-27  214  
^1da177e4c3f41 Linus Torvalds    2005-04-16  215  	old_bh = new_bh = NULL;
2b0143b5c986be David Howells     2015-03-17  216  	old_inode = d_inode(old_dentry);
^1da177e4c3f41 Linus Torvalds    2005-04-16  217  	if (S_ISDIR(old_inode->i_mode))
^1da177e4c3f41 Linus Torvalds    2005-04-16  218  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  219  
3f165e4cf2af04 Dmitri Vorobiev   2008-07-25  220  	info = BFS_SB(old_inode->i_sb);
3f165e4cf2af04 Dmitri Vorobiev   2008-07-25  221  
3f165e4cf2af04 Dmitri Vorobiev   2008-07-25  222  	mutex_lock(&info->bfs_lock);
33ebdebece6d5d Al Viro           2018-04-30  223  	old_bh = bfs_find_entry(old_dir, &old_dentry->d_name, &old_de);
^1da177e4c3f41 Linus Torvalds    2005-04-16  224  
f433dc56344cb7 Dmitri Vorobiev   2007-11-14 @225  	if (!old_bh || (le16_to_cpu(old_de->ino) != old_inode->i_ino))
^1da177e4c3f41 Linus Torvalds    2005-04-16  226  		goto end_rename;
^1da177e4c3f41 Linus Torvalds    2005-04-16  227  
^1da177e4c3f41 Linus Torvalds    2005-04-16  228  	error = -EPERM;
2b0143b5c986be David Howells     2015-03-17  229  	new_inode = d_inode(new_dentry);
33ebdebece6d5d Al Viro           2018-04-30  230  	new_bh = bfs_find_entry(new_dir, &new_dentry->d_name, &new_de);
^1da177e4c3f41 Linus Torvalds    2005-04-16  231  
^1da177e4c3f41 Linus Torvalds    2005-04-16  232  	if (new_bh && !new_inode) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  233  		brelse(new_bh);
^1da177e4c3f41 Linus Torvalds    2005-04-16  234  		new_bh = NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  235  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  236  	if (!new_bh) {
b455ecd4bb4db1 Al Viro           2018-04-30  237  		error = bfs_add_entry(new_dir, &new_dentry->d_name,
f433dc56344cb7 Dmitri Vorobiev   2007-11-14  238  					old_inode->i_ino);
^1da177e4c3f41 Linus Torvalds    2005-04-16  239  		if (error)
^1da177e4c3f41 Linus Torvalds    2005-04-16  240  			goto end_rename;
^1da177e4c3f41 Linus Torvalds    2005-04-16  241  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  242  	old_de->ino = 0;
ce17a80c388cd1 Jeff Layton       2023-10-04  243  	inode_set_mtime_to_ts(old_dir, inode_set_ctime_current(old_dir));
^1da177e4c3f41 Linus Torvalds    2005-04-16  244  	mark_inode_dirty(old_dir);
^1da177e4c3f41 Linus Torvalds    2005-04-16  245  	if (new_inode) {
73d9b9d028176b Jeff Layton       2023-07-05  246  		inode_set_ctime_current(new_inode);
9a53c3a783c2fa Dave Hansen       2006-09-30  247  		inode_dec_link_count(new_inode);
^1da177e4c3f41 Linus Torvalds    2005-04-16  248  	}
4427f0c36e22e2 Al Viro           2009-06-08  249  	mark_buffer_dirty_inode(old_bh, old_dir);
^1da177e4c3f41 Linus Torvalds    2005-04-16  250  	error = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  251  
^1da177e4c3f41 Linus Torvalds    2005-04-16  252  end_rename:
3f165e4cf2af04 Dmitri Vorobiev   2008-07-25  253  	mutex_unlock(&info->bfs_lock);
56423717549f8d Lizhi Xu          2025-01-09 @254  	if (new_inode && !new_inode->i_nlink)
56423717549f8d Lizhi Xu          2025-01-09  255  		iput(new_inode);
^1da177e4c3f41 Linus Torvalds    2005-04-16  256  	brelse(old_bh);
^1da177e4c3f41 Linus Torvalds    2005-04-16  257  	brelse(new_bh);
^1da177e4c3f41 Linus Torvalds    2005-04-16  258  	return error;
^1da177e4c3f41 Linus Torvalds    2005-04-16  259  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  260  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
