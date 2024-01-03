Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4091C1DA23;
	Wed,  3 Jan 2024 21:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IsfKbTda"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704316513; x=1735852513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wc5l9cR+E8aV/EHRuWdrFq04FltKzeV7o/T1vd2vnO4=;
  b=IsfKbTda52pKrv3x7uQ4butySLa5PiWqygoMrL+cRUXSuy4P+EJ8dRiw
   B+cs0CfQGlh6HyZk18M0VivsbkDdHAiybERUVjLy9Fq1GdLkAqoz605VZ
   gj5vhKxef9t1ulmT+F5xVekRgidzHz8xqKxQYD3ujrnSNJL7gppv4l54y
   +zGuio0mSuf4y4D4P19n7jVLOpy8JhnGKbrnI/p8Yym8HcWFP5hS0t/tC
   xXs8Lh9Sm5VimPcGSu2arnwdgzcndWD8NoGH9BzxbfSVqAPr3M2Rhu+ev
   Q6AULyMRcdAnEbKvzCYejzNkU2QTqv2o6Ke432xc9mn3x03ft3zo2qGi6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="428239822"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; 
   d="scan'208";a="428239822"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 13:15:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="756332136"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; 
   d="scan'208";a="756332136"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 03 Jan 2024 13:15:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rL8Zv-000MZm-1Q;
	Wed, 03 Jan 2024 21:15:07 +0000
Date: Thu, 4 Jan 2024 05:14:46 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:b4/vfs-bdev-file 41/42] fs/nilfs2/mdt.c:93:21: error:
 no member named 'f_s_bdev' in 'struct super_block'
Message-ID: <202401040559.LWerfZTh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git b4/vfs-bdev-file
head:   81a0b5d317a5188e7e8aaf68adf070d44c7a3eea
commit: 6d26064a464a6f8ace90a2176a17bd6f853825e0 [41/42] [DRAFT] buffer: port block device access to files and get rid of bd_inode access
config: i386-buildonly-randconfig-001-20240103 (https://download.01.org/0day-ci/archive/20240104/202401040559.LWerfZTh-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240104/202401040559.LWerfZTh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401040559.LWerfZTh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nilfs2/mdt.c:93:21: error: no member named 'f_s_bdev' in 'struct super_block'
      93 |         bh->f_b_bdev = sb->f_s_bdev;
         |                        ~~  ^
   1 error generated.
--
>> fs/nilfs2/btnode.c:63:30: error: no member named 'f_s_bdev' in 'struct super_block'
      63 |         bh->f_b_bdev = inode->i_sb->f_s_bdev;
         |                        ~~~~~~~~~~~  ^
   fs/nilfs2/btnode.c:123:30: error: no member named 'f_s_bdev' in 'struct super_block'
     123 |         bh->f_b_bdev = inode->i_sb->f_s_bdev;
         |                        ~~~~~~~~~~~  ^
   2 errors generated.
--
>> fs/nilfs2/the_nilfs.c:66:9: error: no member named 'ns_f_bdev' in 'struct the_nilfs'; did you mean 'ns_bdev'?
      66 |         nilfs->ns_f_bdev = sb->s_f_bdev;
         |                ^~~~~~~~~
         |                ns_bdev
   fs/nilfs2/the_nilfs.h:100:26: note: 'ns_bdev' declared here
     100 |         struct block_device    *ns_bdev;
         |                                 ^
   1 error generated.
--
>> fs/nilfs2/recovery.c:110:24: error: no member named 'ns_f_bdev' in 'struct the_nilfs'; did you mean 'ns_bdev'?
     110 |                         bh = __bread(nilfs->ns_f_bdev, ++start, blocksize);
         |                                             ^~~~~~~~~
         |                                             ns_bdev
   fs/nilfs2/the_nilfs.h:100:26: note: 'ns_bdev' declared here
     100 |         struct block_device    *ns_bdev;
         |                                 ^
   fs/nilfs2/recovery.c:139:25: error: no member named 'ns_f_bdev' in 'struct the_nilfs'; did you mean 'ns_bdev'?
     139 |         bh_sr = __bread(nilfs->ns_f_bdev, sr_block, nilfs->ns_blocksize);
         |                                ^~~~~~~~~
         |                                ns_bdev
   fs/nilfs2/the_nilfs.h:100:26: note: 'ns_bdev' declared here
     100 |         struct block_device    *ns_bdev;
         |                                 ^
   fs/nilfs2/recovery.c:186:26: error: no member named 'ns_f_bdev' in 'struct the_nilfs'; did you mean 'ns_bdev'?
     186 |         bh_sum = __bread(nilfs->ns_f_bdev, start_blocknr, nilfs->ns_blocksize);
         |                                 ^~~~~~~~~
         |                                 ns_bdev
   fs/nilfs2/the_nilfs.h:100:26: note: 'ns_bdev' declared here
     100 |         struct block_device    *ns_bdev;
         |                                 ^
   fs/nilfs2/recovery.c:253:25: error: no member named 'ns_f_bdev' in 'struct the_nilfs'; did you mean 'ns_bdev'?
     253 |                 *pbh = __bread(nilfs->ns_f_bdev, blocknr + 1,
         |                                       ^~~~~~~~~
         |                                       ns_bdev
   fs/nilfs2/the_nilfs.h:100:26: note: 'ns_bdev' declared here
     100 |         struct block_device    *ns_bdev;
         |                                 ^
   fs/nilfs2/recovery.c:292:25: error: no member named 'ns_f_bdev' in 'struct the_nilfs'; did you mean 'ns_bdev'?
     292 |                 *pbh = __bread(nilfs->ns_f_bdev, blocknr + bcnt,
         |                                       ^~~~~~~~~
         |                                       ns_bdev
   fs/nilfs2/the_nilfs.h:100:26: note: 'ns_bdev' declared here
     100 |         struct block_device    *ns_bdev;
         |                                 ^
   fs/nilfs2/recovery.c:321:22: error: no member named 'ns_f_bdev' in 'struct the_nilfs'; did you mean 'ns_bdev'?
     321 |         bh = __bread(nilfs->ns_f_bdev, start_blocknr, nilfs->ns_blocksize);
         |                             ^~~~~~~~~
         |                             ns_bdev
   fs/nilfs2/the_nilfs.h:100:26: note: 'ns_bdev' declared here
     100 |         struct block_device    *ns_bdev;
         |                                 ^
   fs/nilfs2/recovery.c:480:26: error: no member named 'ns_f_bdev' in 'struct the_nilfs'; did you mean 'ns_bdev'?
     480 |         bh_org = __bread(nilfs->ns_f_bdev, rb->blocknr, nilfs->ns_blocksize);
         |                                 ^~~~~~~~~
         |                                 ns_bdev
   fs/nilfs2/the_nilfs.h:100:26: note: 'ns_bdev' declared here
     100 |         struct block_device    *ns_bdev;
         |                                 ^
   fs/nilfs2/recovery.c:699:23: error: no member named 'ns_f_bdev' in 'struct the_nilfs'; did you mean 'ns_bdev'?
     699 |         bh = __getblk(nilfs->ns_f_bdev, ri->ri_lsegs_start, nilfs->ns_blocksize);
         |                              ^~~~~~~~~
         |                              ns_bdev
   fs/nilfs2/the_nilfs.h:100:26: note: 'ns_bdev' declared here
     100 |         struct block_device    *ns_bdev;
         |                                 ^
   fs/nilfs2/recovery.c:825:23: error: no member named 'ns_f_bdev' in 'struct the_nilfs'; did you mean 'ns_bdev'?
     825 |                 __breadahead(nilfs->ns_f_bdev, b++, nilfs->ns_blocksize);
         |                                     ^~~~~~~~~
         |                                     ns_bdev
   fs/nilfs2/the_nilfs.h:100:26: note: 'ns_bdev' declared here
     100 |         struct block_device    *ns_bdev;
         |                                 ^
   fs/nilfs2/recovery.c:871:25: error: no member named 'ns_f_bdev' in 'struct the_nilfs'; did you mean 'ns_bdev'?
     871 |                                 __breadahead(nilfs->ns_f_bdev, b++,
         |                                                     ^~~~~~~~~
         |                                                     ns_bdev
   fs/nilfs2/the_nilfs.h:100:26: note: 'ns_bdev' declared here
     100 |         struct block_device    *ns_bdev;
         |                                 ^
   10 errors generated.
--
>> fs/nilfs2/gcinode.c:88:31: error: no member named 'f_s_bdev' in 'struct super_block'
      88 |                 bh->f_b_bdev = inode->i_sb->f_s_bdev;
         |                                ~~~~~~~~~~~  ^
   1 error generated.


vim +93 fs/nilfs2/mdt.c

    65	
    66	static int nilfs_mdt_create_block(struct inode *inode, unsigned long block,
    67					  struct buffer_head **out_bh,
    68					  void (*init_block)(struct inode *,
    69							     struct buffer_head *,
    70							     void *))
    71	{
    72		struct super_block *sb = inode->i_sb;
    73		struct nilfs_transaction_info ti;
    74		struct buffer_head *bh;
    75		int err;
    76	
    77		nilfs_transaction_begin(sb, &ti, 0);
    78	
    79		err = -ENOMEM;
    80		bh = nilfs_grab_buffer(inode, inode->i_mapping, block, 0);
    81		if (unlikely(!bh))
    82			goto failed_unlock;
    83	
    84		err = -EEXIST;
    85		if (buffer_uptodate(bh))
    86			goto failed_bh;
    87	
    88		wait_on_buffer(bh);
    89		if (buffer_uptodate(bh))
    90			goto failed_bh;
    91	
    92		bh->b_bdev = sb->s_bdev;
  > 93		bh->f_b_bdev = sb->f_s_bdev;
    94		err = nilfs_mdt_insert_new_block(inode, block, bh, init_block);
    95		if (likely(!err)) {
    96			get_bh(bh);
    97			*out_bh = bh;
    98		}
    99	
   100	 failed_bh:
   101		unlock_page(bh->b_page);
   102		put_page(bh->b_page);
   103		brelse(bh);
   104	
   105	 failed_unlock:
   106		if (likely(!err))
   107			err = nilfs_transaction_commit(sb);
   108		else
   109			nilfs_transaction_abort(sb);
   110	
   111		return err;
   112	}
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
