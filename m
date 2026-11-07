Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794091701;
	b=BaAQOBoNCC8JHOj/Z9Jp63VAIXoX403KlYAIO4dpHEsIv9URuTMENmPyqDTmLvx/KMdv
	 yVooduiQlzuuUo7wNjI2lYiGSMEj/xiOO7BaxUM1W8tsZyEWIO27II//H+QJnODhIqKBD
	 HNJSCAFKd2Q3cvLH95S7UYqWRrdRjU3jmL7dHzr4yaLJJQZsinFBcNw8o62qi+1yR7Y9E
	 Pswec3MFsctfAsNT3GCoHPSpG8F2ZcusJMoKPOdWEvEXO3YGGGYC/qNzn0q0uP6ulcywf
	 PhbooSrpe42nUbR36VZnPvWnM/NkJxpaB3ueU6aN4zukK/EFnPXd3uAi044ns92Sc9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794091701;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=q9FsqwDgIKRAr3xdUwiP8URqa0syKiB5ZQobimFkwkQ=;
	b=mNjF0KeEJtJYzdzgkYh11Y/ZTN0Q4Ix/w+eB+scTjoCIMQ2oTVH9S9EelomA2e7EZNFE
	 M7bAOUyoMGD14t7PXt4pN0XCArgoiaPXfAkcCDuNz+7gHO+E57m/gY92dQW3kHpTOkYj8
	 e6lUZgtoeUgE9oJmDm2MejyKv840g7Y+pBAM6fG1WrrQzjRbjWuyJObfH/wo2fq/y62bo
	 ztH1O2ylP+R4leGSwAAMGAQf6LQk6TwTRj2MK023qAxEzSMjPHNR27H0Xr3xtjE6WlEfJ
	 3Urb7qjT1IKCGJRC9UXXb90ielgwCevcLyIrYNHENrrRb/dLF0nGXekLtgXfsgzgNVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FuGmyrvP;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929B7606A338;
	Sat,  7 Nov 2026 22:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 929B7606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FuGmyrvP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794091701; x=1825627701;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lv/6BaTZgrhVnUry7wM9diCF/i4Fn4o4op69pZw7BiQ=;
  b=FuGmyrvPywwo+mfNQ5jF91cIr0qMx6ZiEsevIywZyY3ZHu0kXVrdDrCZ
   QbWz2YM2LIXlZpEaHwJ1Qv8sCW9nbEJhYDui+kUW+bMzrvatMp7zB47SA
   1p4Cn0IkDHMl7PebIFuHXE78wjjnOsWXQ6s6xYyis4/9L0E0nEhrPC5pu
   DMhYlNYIAi0i2tITMn9vBn4PNtrDNp2i2vpqTwnMGI13BNEPwC7qxXfEX
   aLVq77whngdnKRg4jNryCOUAwOAEZUvV70sdb/hCAPWeoDgYATnyYIztp
   a7DibYA4iYUV9KHsfGXQZbxVT4FHb9MyS/SBjjHxKN2f88Y5SCZcTBAWJ
   Q==;
X-CSE-ConnectionGUID: TouWtNtsTLiNRXIBlUiPJQ==
X-CSE-MsgGUID: 9mNPH8ySQn+pkingY3ZbaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2767857"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2767857"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 14:48:20 -0800
X-CSE-ConnectionGUID: W3Bqz0gqRXCiEYTFfYxwgw==
X-CSE-MsgGUID: q6+oxHVuRVWlPVlROV+kQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7423318"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Nov 2026 14:48:18 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPpCq-00000000rgP-0aRt;
	Sat, 07 Nov 2026 22:48:16 +0000
Date: Sun, 8 Nov 2026 06:47:54 +0800
From: kernel test robot <lkp@intel.com>
To: Phillip Lougher <phillip@squashfs.org.uk>, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Phillip Lougher <phillip@squashfs.org.uk>
Subject: Re: [PATCH 09/18] Squashfs: sanity check inode metadata block
 location
Message-ID: <202611080635.7XPojc0A-lkp@intel.com>
References: <20261107052843.725239-10-phillip@squashfs.org.uk>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261107052843.725239-10-phillip@squashfs.org.uk>

Hi Phillip,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on linus/master v7.4-rc1]
[cannot apply to akpm-mm/mm-everything next-20261105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Phillip-Lougher/Squashfs-convert-SQUASHFS_COMPRESSED_-to-inline-functions/20261107-052826
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20261107052843.725239-10-phillip%40squashfs.org.uk
patch subject: [PATCH 09/18] Squashfs: sanity check inode metadata block location
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20261108/202611080635.7XPojc0A-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project fc9576e3b179738d99c5babe5cd9d6c1f883e0db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611080635.7XPojc0A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611080635.7XPojc0A-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/squashfs/inode.c:121:6: warning: variable 'err' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     121 |         if (block < 0)
         |             ^~~~~~~~~
   fs/squashfs/inode.c:454:9: note: uninitialized use occurs here
     454 |         return err;
         |                ^~~
   fs/squashfs/inode.c:121:2: note: remove the 'if' if its condition is always false
     121 |         if (block < 0)
         |         ^~~~~~~~~~~~~~
     122 |                 goto failed_read;
         |                 ~~~~~~~~~~~~~~~~
   fs/squashfs/inode.c:114:9: note: initialize the variable 'err' to silence this warning
     114 |         int err, type;
         |                ^
         |                 = 0
   1 warning generated.


vim +121 fs/squashfs/inode.c

   102	
   103	
   104	/*
   105	 * Initialise VFS inode by reading inode from inode table (compressed
   106	 * metadata).  The format and amount of data read depends on type.
   107	 */
   108	int squashfs_read_inode(struct inode *inode, long long ino)
   109	{
   110		struct super_block *sb = inode->i_sb;
   111		struct squashfs_sb_info *msblk = sb->s_fs_info;
   112		s64 block = squashfs_inode_start(msblk, ino), sblock = block;
   113		int offset = squashfs_inode_offset(ino), soffset = offset;
   114		int err, type;
   115		union squashfs_inode squashfs_ino;
   116		struct squashfs_base_inode *sqshb_ino = &squashfs_ino.base;
   117		int xattr_id = SQUASHFS_INVALID_XATTR;
   118	
   119		TRACE("Entered squashfs_read_inode\n");
   120	
 > 121		if (block < 0)
   122			goto failed_read;
   123		/*
   124		 * Read inode base common to all inode types.
   125		 */
   126		err = squashfs_read_metadata(sb, sqshb_ino, &sblock,
   127					&soffset, sizeof(*sqshb_ino));
   128		if (err < 0)
   129			goto failed_read;
   130	
   131		err = squashfs_new_inode(sb, inode, sqshb_ino);
   132		if (err)
   133			goto failed_read;
   134	
   135		type = le16_to_cpu(sqshb_ino->inode_type);
   136		switch (type) {
   137		case SQUASHFS_REG_TYPE: {
   138			unsigned int frag_offset, frag;
   139			int frag_size;
   140			u64 frag_blk;
   141			struct squashfs_reg_inode *sqsh_ino = &squashfs_ino.reg;
   142	
   143			err = squashfs_read_metadata(sb, sqsh_ino, &block, &offset,
   144								sizeof(*sqsh_ino));
   145			if (err < 0)
   146				goto failed_read;
   147	
   148			inode->i_size = le32_to_cpu(sqsh_ino->file_size);
   149			frag = le32_to_cpu(sqsh_ino->fragment);
   150			if (frag != SQUASHFS_INVALID_FRAG) {
   151				/*
   152				 * the file cannot have a fragment (tailend) and have a
   153				 * file size a multiple of the block size
   154				 */
   155				if ((inode->i_size & (msblk->block_size - 1)) == 0) {
   156					err = -EINVAL;
   157					goto failed_read;
   158				}
   159				frag_offset = le32_to_cpu(sqsh_ino->offset);
   160				frag_size = squashfs_frag_lookup(sb, frag, &frag_blk);
   161				if (frag_size < 0) {
   162					err = frag_size;
   163					goto failed_read;
   164				}
   165			} else {
   166				frag_blk = SQUASHFS_INVALID_BLK;
   167				frag_size = 0;
   168				frag_offset = 0;
   169			}
   170	
   171			set_nlink(inode, 1);
   172			inode->i_fop = &squashfs_file_operations;
   173			inode->i_mode |= S_IFREG;
   174			inode->i_blocks = ((inode->i_size - 1) >> 9) + 1;
   175			squashfs_i(inode)->fragment_block = frag_blk;
   176			squashfs_i(inode)->fragment_size = frag_size;
   177			squashfs_i(inode)->fragment_offset = frag_offset;
   178			squashfs_i(inode)->start = le32_to_cpu(sqsh_ino->start_block);
   179			squashfs_i(inode)->block_list_start = block;
   180			squashfs_i(inode)->offset = offset;
   181			squashfs_i(inode)->parent = 0;
   182			inode->i_data.a_ops = &squashfs_aops;
   183	
   184			TRACE("File inode %x:%x, start_block %llx, block_list_start "
   185				"%llx, offset %x\n", squashfs_inode_blk(ino),
   186				squashfs_inode_offset(ino), squashfs_i(inode)->start,
   187				block, offset);
   188			break;
   189		}
   190		case SQUASHFS_LREG_TYPE: {
   191			unsigned int frag_offset, frag;
   192			int frag_size;
   193			u64 frag_blk;
   194			struct squashfs_lreg_inode *sqsh_ino = &squashfs_ino.lreg;
   195	
   196			err = squashfs_read_metadata(sb, sqsh_ino, &block, &offset,
   197								sizeof(*sqsh_ino));
   198			if (err < 0)
   199				goto failed_read;
   200	
   201			inode->i_size = le64_to_cpu(sqsh_ino->file_size);
   202			if (inode->i_size < 0) {
   203				err = -EINVAL;
   204				goto failed_read;
   205			}
   206			frag = le32_to_cpu(sqsh_ino->fragment);
   207			if (frag != SQUASHFS_INVALID_FRAG) {
   208				/*
   209				 * the file cannot have a fragment (tailend) and have a
   210				 * file size a multiple of the block size
   211				 */
   212				if ((inode->i_size & (msblk->block_size - 1)) == 0) {
   213					err = -EINVAL;
   214					goto failed_read;
   215				}
   216				frag_offset = le32_to_cpu(sqsh_ino->offset);
   217				frag_size = squashfs_frag_lookup(sb, frag, &frag_blk);
   218				if (frag_size < 0) {
   219					err = frag_size;
   220					goto failed_read;
   221				}
   222			} else {
   223				frag_blk = SQUASHFS_INVALID_BLK;
   224				frag_size = 0;
   225				frag_offset = 0;
   226			}
   227	
   228			xattr_id = le32_to_cpu(sqsh_ino->xattr);
   229			set_nlink(inode, le32_to_cpu(sqsh_ino->nlink));
   230			inode->i_op = &squashfs_inode_ops;
   231			inode->i_fop = &squashfs_file_operations;
   232			inode->i_mode |= S_IFREG;
   233			inode->i_blocks = (inode->i_size -
   234					le64_to_cpu(sqsh_ino->sparse) + 511) >> 9;
   235	
   236			squashfs_i(inode)->fragment_block = frag_blk;
   237			squashfs_i(inode)->fragment_size = frag_size;
   238			squashfs_i(inode)->fragment_offset = frag_offset;
   239			squashfs_i(inode)->start = le64_to_cpu(sqsh_ino->start_block);
   240			squashfs_i(inode)->block_list_start = block;
   241			squashfs_i(inode)->offset = offset;
   242			squashfs_i(inode)->parent = 0;
   243			inode->i_data.a_ops = &squashfs_aops;
   244	
   245			TRACE("File inode %x:%x, start_block %llx, block_list_start "
   246				"%llx, offset %x\n", squashfs_inode_blk(ino),
   247				squashfs_inode_offset(ino), squashfs_i(inode)->start,
   248				block, offset);
   249			break;
   250		}
   251		case SQUASHFS_DIR_TYPE: {
   252			struct squashfs_dir_inode *sqsh_ino = &squashfs_ino.dir;
   253	
   254			err = squashfs_read_metadata(sb, sqsh_ino, &block, &offset,
   255					sizeof(*sqsh_ino));
   256			if (err < 0)
   257				goto failed_read;
   258	
   259			set_nlink(inode, le32_to_cpu(sqsh_ino->nlink));
   260			inode->i_size = le16_to_cpu(sqsh_ino->file_size);
   261			inode->i_op = &squashfs_dir_inode_ops;
   262			inode->i_fop = &squashfs_dir_ops;
   263			inode->i_mode |= S_IFDIR;
   264			squashfs_i(inode)->start = le32_to_cpu(sqsh_ino->start_block);
   265			squashfs_i(inode)->offset = le16_to_cpu(sqsh_ino->offset);
   266			squashfs_i(inode)->dir_idx_cnt = 0;
   267			squashfs_i(inode)->parent = le32_to_cpu(sqsh_ino->parent_inode);
   268	
   269			TRACE("Directory inode %x:%x, start_block %llx, offset %x\n",
   270					squashfs_inode_blk(ino), squashfs_inode_offset(ino),
   271					squashfs_i(inode)->start,
   272					le16_to_cpu(sqsh_ino->offset));
   273			break;
   274		}
   275		case SQUASHFS_LDIR_TYPE: {
   276			struct squashfs_ldir_inode *sqsh_ino = &squashfs_ino.ldir;
   277	
   278			err = squashfs_read_metadata(sb, sqsh_ino, &block, &offset,
   279					sizeof(*sqsh_ino));
   280			if (err < 0)
   281				goto failed_read;
   282	
   283			xattr_id = le32_to_cpu(sqsh_ino->xattr);
   284			set_nlink(inode, le32_to_cpu(sqsh_ino->nlink));
   285			inode->i_size = le32_to_cpu(sqsh_ino->file_size);
   286			inode->i_op = &squashfs_dir_inode_ops;
   287			inode->i_fop = &squashfs_dir_ops;
   288			inode->i_mode |= S_IFDIR;
   289			squashfs_i(inode)->start = le32_to_cpu(sqsh_ino->start_block);
   290			squashfs_i(inode)->offset = le16_to_cpu(sqsh_ino->offset);
   291			squashfs_i(inode)->dir_idx_start = block;
   292			squashfs_i(inode)->dir_idx_offset = offset;
   293			squashfs_i(inode)->dir_idx_cnt = le16_to_cpu(sqsh_ino->i_count);
   294			squashfs_i(inode)->parent = le32_to_cpu(sqsh_ino->parent_inode);
   295	
   296			TRACE("Long directory inode %x:%x, start_block %llx, offset "
   297					"%x\n", squashfs_inode_blk(ino),
   298					squashfs_inode_offset(ino),
   299					squashfs_i(inode)->start,
   300					le16_to_cpu(sqsh_ino->offset));
   301			break;
   302		}
   303		case SQUASHFS_SYMLINK_TYPE:
   304		case SQUASHFS_LSYMLINK_TYPE: {
   305			struct squashfs_symlink_inode *sqsh_ino = &squashfs_ino.symlink;
   306	
   307			err = squashfs_read_metadata(sb, sqsh_ino, &block, &offset,
   308					sizeof(*sqsh_ino));
   309			if (err < 0)
   310				goto failed_read;
   311	
   312			inode->i_size = le32_to_cpu(sqsh_ino->symlink_size);
   313			if (inode->i_size > PAGE_SIZE) {
   314				ERROR("Corrupted symlink\n");
   315				return -EINVAL;
   316			}
   317	
   318			set_nlink(inode, le32_to_cpu(sqsh_ino->nlink));
   319			inode->i_op = &squashfs_symlink_inode_ops;
   320			inode_nohighmem(inode);
   321			inode->i_data.a_ops = &squashfs_symlink_aops;
   322			inode->i_mode |= S_IFLNK;
   323			squashfs_i(inode)->start = block;
   324			squashfs_i(inode)->offset = offset;
   325			squashfs_i(inode)->parent = 0;
   326	
   327			if (type == SQUASHFS_LSYMLINK_TYPE) {
   328				__le32 xattr;
   329	
   330				err = squashfs_read_metadata(sb, NULL, &block,
   331							&offset, inode->i_size);
   332				if (err < 0)
   333					goto failed_read;
   334				err = squashfs_read_metadata(sb, &xattr, &block,
   335							&offset, sizeof(xattr));
   336				if (err < 0)
   337					goto failed_read;
   338				xattr_id = le32_to_cpu(xattr);
   339			}
   340	
   341			TRACE("Symbolic link inode %x:%x, start_block %llx, offset "
   342					"%x\n", squashfs_inode_blk(ino),
   343					squashfs_inode_offset(ino), block, offset);
   344			break;
   345		}
   346		case SQUASHFS_BLKDEV_TYPE:
   347		case SQUASHFS_CHRDEV_TYPE: {
   348			struct squashfs_dev_inode *sqsh_ino = &squashfs_ino.dev;
   349			unsigned int rdev;
   350	
   351			err = squashfs_read_metadata(sb, sqsh_ino, &block, &offset,
   352					sizeof(*sqsh_ino));
   353			if (err < 0)
   354				goto failed_read;
   355	
   356			if (type == SQUASHFS_CHRDEV_TYPE)
   357				inode->i_mode |= S_IFCHR;
   358			else
   359				inode->i_mode |= S_IFBLK;
   360			set_nlink(inode, le32_to_cpu(sqsh_ino->nlink));
   361			rdev = le32_to_cpu(sqsh_ino->rdev);
   362			init_special_inode(inode, inode->i_mode, new_decode_dev(rdev));
   363			squashfs_i(inode)->parent = 0;
   364	
   365			TRACE("Device inode %x:%x, rdev %x\n",
   366					squashfs_inode_blk(ino),
   367					squashfs_inode_offset(ino), rdev);
   368			break;
   369		}
   370		case SQUASHFS_LBLKDEV_TYPE:
   371		case SQUASHFS_LCHRDEV_TYPE: {
   372			struct squashfs_ldev_inode *sqsh_ino = &squashfs_ino.ldev;
   373			unsigned int rdev;
   374	
   375			err = squashfs_read_metadata(sb, sqsh_ino, &block, &offset,
   376					sizeof(*sqsh_ino));
   377			if (err < 0)
   378				goto failed_read;
   379	
   380			if (type == SQUASHFS_LCHRDEV_TYPE)
   381				inode->i_mode |= S_IFCHR;
   382			else
   383				inode->i_mode |= S_IFBLK;
   384			xattr_id = le32_to_cpu(sqsh_ino->xattr);
   385			inode->i_op = &squashfs_inode_ops;
   386			set_nlink(inode, le32_to_cpu(sqsh_ino->nlink));
   387			rdev = le32_to_cpu(sqsh_ino->rdev);
   388			init_special_inode(inode, inode->i_mode, new_decode_dev(rdev));
   389			squashfs_i(inode)->parent = 0;
   390	
   391			TRACE("Device inode %x:%x, rdev %x\n",
   392					squashfs_inode_blk(ino), offset, rdev);
   393			break;
   394		}
   395		case SQUASHFS_FIFO_TYPE:
   396		case SQUASHFS_SOCKET_TYPE: {
   397			struct squashfs_ipc_inode *sqsh_ino = &squashfs_ino.ipc;
   398	
   399			err = squashfs_read_metadata(sb, sqsh_ino, &block, &offset,
   400					sizeof(*sqsh_ino));
   401			if (err < 0)
   402				goto failed_read;
   403	
   404			if (type == SQUASHFS_FIFO_TYPE)
   405				inode->i_mode |= S_IFIFO;
   406			else
   407				inode->i_mode |= S_IFSOCK;
   408			set_nlink(inode, le32_to_cpu(sqsh_ino->nlink));
   409			init_special_inode(inode, inode->i_mode, 0);
   410			squashfs_i(inode)->parent = 0;
   411			break;
   412		}
   413		case SQUASHFS_LFIFO_TYPE:
   414		case SQUASHFS_LSOCKET_TYPE: {
   415			struct squashfs_lipc_inode *sqsh_ino = &squashfs_ino.lipc;
   416	
   417			err = squashfs_read_metadata(sb, sqsh_ino, &block, &offset,
   418					sizeof(*sqsh_ino));
   419			if (err < 0)
   420				goto failed_read;
   421	
   422			if (type == SQUASHFS_LFIFO_TYPE)
   423				inode->i_mode |= S_IFIFO;
   424			else
   425				inode->i_mode |= S_IFSOCK;
   426			xattr_id = le32_to_cpu(sqsh_ino->xattr);
   427			inode->i_op = &squashfs_inode_ops;
   428			set_nlink(inode, le32_to_cpu(sqsh_ino->nlink));
   429			init_special_inode(inode, inode->i_mode, 0);
   430			squashfs_i(inode)->parent = 0;
   431			break;
   432		}
   433		default:
   434			ERROR("Unknown inode type %d in squashfs_iget!\n", type);
   435			return -EINVAL;
   436		}
   437	
   438		if (xattr_id != SQUASHFS_INVALID_XATTR && msblk->xattr_id_table) {
   439			err = squashfs_xattr_lookup(sb, xattr_id,
   440						&squashfs_i(inode)->xattr_count,
   441						&squashfs_i(inode)->xattr_size,
   442						&squashfs_i(inode)->xattr);
   443			if (err < 0)
   444				goto failed_read;
   445			inode->i_blocks += ((squashfs_i(inode)->xattr_size - 1) >> 9)
   446					+ 1;
   447		} else
   448			squashfs_i(inode)->xattr_count = 0;
   449	
   450		return 0;
   451	
   452	failed_read:
   453		ERROR("Unable to read inode 0x%llx\n", ino);
   454		return err;
   455	}
   456	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
