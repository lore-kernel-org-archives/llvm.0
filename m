Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED973D6479;
	Mon, 17 Aug 2026 13:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786974882; cv=none; b=c/E0U7SzHNP5WAqWl4dqmxcTNcA9YnDTZtNhM6aEqS7R9MO16EelWLwVtn1/GoRom6CahtYhpxv25DrCXt+N2aaQ7uDzac62U502BPmOm5L8rslX1NINWDGMJA7Bff+Wq1iTMmDsiJ5IB5Ct/mTNSUoL0sH2uocAOju+DgaY++w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786974882; c=relaxed/simple;
	bh=rUxrI6v76V8VYvL7bpSktsfwQ2QWSteGIzkFo8yUV+g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eK6E/GZPljLS63ewbIQKjUGOei5wGUgvTcPXd/ZIIkb0ZUPWAAX9NqJB5I2TXeX3w4Eg++fSIdGX319zKIBGsXte6FRFZ6em0SN07ldilcMB0BEJU/1r3+xnTliR1fKhbHtzX64K+LUu6ZwMeU2EFBAOZdP0F44+XTAEHVHBmbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K+qO408P; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K+qO408P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786974878; x=1818510878;
  h=date:from:to:cc:subject:message-id;
  bh=rUxrI6v76V8VYvL7bpSktsfwQ2QWSteGIzkFo8yUV+g=;
  b=K+qO408POcoZTug8WO4zG6ATLVUpiDhOzm/713Cidj+W/zHABg16fMQn
   pzGA4gNBQwSh5AOq1Ug3h1U6dSjf/c9HwLCD42mJXntOUXRG3xqrTiA56
   yrBb/pmngEV5wCPOdYwZ2TPyFKYB4YwdDTm+jZXdM4A45WXIlIZvq/uCp
   +Qv+JPQkA94TYRstbLQrHKdyJB74tFGXZh/GLvIxDUoAAlaJ7fY3swVcS
   Z+xMAV5U3OoSwXRA1zcFdDI0hIoDvNjm6sYKzbtmIxcF/X7nYUeT3C3hS
   z6H5xBFdHqBNR129A6hGlURF0O9pwjLSxasnDZu5IAOKaEn63MB3OKwku
   A==;
X-CSE-ConnectionGUID: BL5qQF6SQdKW2s+jsXiRYA==
X-CSE-MsgGUID: u/u21bnVS6CR3dEtxo+klQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87515980"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="87515980"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 06:54:36 -0700
X-CSE-ConnectionGUID: m/MgQolPS9Ohz/x4GRyb9Q==
X-CSE-MsgGUID: rrp/NBUYRkWaTye943i1tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="264462652"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 17 Aug 2026 06:54:34 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvxnL-000000006qL-3VHm;
	Mon, 17 Aug 2026 13:54:31 +0000
Date: Mon, 17 Aug 2026 15:53:54 +0200
From: kernel test robot <lkp@intel.com>
To: Artem Blagodarenko <artem.blagodarenko@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>, Andreas Dilger <adilger@dilger.ca>
Subject: fs/ext4/dir.c:240:7: error: call to undeclared function
 'ext4_dir_rec_len'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202608171543.EiHLViRG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Artem,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/intel-lab-lkp/linux/commits/Artem-Blagodarenko/ext4-validate-count-against-limit-in-ext4_dx_csum_verify-_set/20260814-134127
head:   bae9f01cc7326e2b81a0ffdd4b98e5a9e66074c5
commit: ffbfbb9d09c9f8aa4361c34cfbe94fd88326c24d ext4: rename ext4_dir_rec_len() and clarify dirdata usage
date:   3 days ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260817/202608171543.EiHLViRG-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608171543.EiHLViRG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608171543.EiHLViRG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/ext4/dir.c:240:7: error: call to undeclared function 'ext4_dir_rec_len'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     240 |                                   ext4_dir_rec_len(1, has_csum ? NULL : inode) &&
         |                                   ^
   fs/ext4/dir.c:240:7: note: did you mean 'ext4_dirent_rec_len'?
   fs/ext4/ext4.h:2636:28: note: 'ext4_dirent_rec_len' declared here
    2636 | static inline unsigned int ext4_dirent_rec_len(unsigned int name_len,
         |                            ^
   fs/ext4/dir.c:265:9: error: call to undeclared function 'ext4_dir_rec_len'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     265 |                              ext4_dir_rec_len(1, has_csum ? NULL : inode))) {
         |                              ^
   2 errors generated.
--
>> fs/ext4/inline.c:1466:12: error: call to undeclared function 'ext4_dir_rec_len'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1466 |                         if (i + ext4_dir_rec_len(1, NULL) > extra_size)
         |                                 ^
   fs/ext4/inline.c:1466:12: note: did you mean 'ext4_dirent_rec_len'?
   fs/ext4/ext4.h:2636:28: note: 'ext4_dirent_rec_len' declared here
    2636 | static inline unsigned int ext4_dirent_rec_len(unsigned int name_len,
         |                            ^
   fs/ext4/inline.c:1507:18: error: call to undeclared function 'ext4_dir_rec_len'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1507 |                 if (ctx->pos + ext4_dir_rec_len(1, NULL) > extra_size)
         |                                ^
   2 errors generated.
--
>> fs/ext4/namei.c:1495:21: error: call to undeclared function 'ext4_dir_rec_len'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1495 |                      (char *)de + ext4_dir_rec_len(de->name_len, dir) <= dlimit) &&
         |                                   ^
   fs/ext4/namei.c:1495:21: note: did you mean 'ext4_dirent_rec_len'?
   fs/ext4/ext4.h:2636:28: note: 'ext4_dirent_rec_len' declared here
    2636 | static inline unsigned int ext4_dirent_rec_len(unsigned int name_len,
         |                            ^
   1 error generated.


vim +/ext4_dir_rec_len +240 fs/ext4/dir.c

ac27a0ec112a089 Dave Kleikamp      2006-10-11  128  
725bebb27882ae6 Al Viro            2013-05-17  129  static int ext4_readdir(struct file *file, struct dir_context *ctx)
ac27a0ec112a089 Dave Kleikamp      2006-10-11  130  {
498e5f24158da7b Theodore Ts'o      2008-11-05  131  	unsigned int offset;
aa13d5f67c6f5f7 Giedrius Rekasius  2014-05-27  132  	int i;
617ba13b31fbf50 Mingming Cao       2006-10-11  133  	struct ext4_dir_entry_2 *de;
ac27a0ec112a089 Dave Kleikamp      2006-10-11  134  	int err;
725bebb27882ae6 Al Viro            2013-05-17  135  	struct inode *inode = file_inode(file);
d1f5273e9adb407 Fan Yong           2012-03-18  136  	struct super_block *sb = inode->i_sb;
4461471107b79be Michael Halcrow    2015-04-12  137  	struct buffer_head *bh = NULL;
a7550b30ab709ff Jaegeuk Kim        2016-07-10  138  	struct fscrypt_str fstr = FSTR_INIT(NULL, 0);
4f05ee2f82b470c Christian Brauner  2024-08-30  139  	struct dir_private_info *info = file->private_data;
bc4b7b0414c33b2 Yao Kai            2026-07-06  140  	bool has_csum = ext4_has_feature_metadata_csum(sb);
ac27a0ec112a089 Dave Kleikamp      2006-10-11  141  
ec0caa974cd0925 Eric Biggers       2020-12-02  142  	err = fscrypt_prepare_readdir(inode);
3b1ada55b905f30 Eric Biggers       2019-12-09  143  	if (err)
28b4c263961c47d Theodore Ts'o      2016-02-07  144  		return err;
28b4c263961c47d Theodore Ts'o      2016-02-07  145  
d1f5273e9adb407 Fan Yong           2012-03-18  146  	if (is_dx_dir(inode)) {
725bebb27882ae6 Al Viro            2013-05-17  147  		err = ext4_dx_readdir(file, ctx);
400086d7c11327c Milan Djurovic     2021-03-15  148  		if (err != ERR_BAD_DX_DIR)
725bebb27882ae6 Al Viro            2013-05-17  149  			return err;
400086d7c11327c Milan Djurovic     2021-03-15  150  
48a34311953d921 Jan Kara           2020-02-10  151  		/* Can we just clear INDEX flag to ignore htree information? */
bc4b7b0414c33b2 Yao Kai            2026-07-06  152  		if (!has_csum) {
ac27a0ec112a089 Dave Kleikamp      2006-10-11  153  			/*
ac27a0ec112a089 Dave Kleikamp      2006-10-11  154  			 * We don't set the inode dirty flag since it's not
48a34311953d921 Jan Kara           2020-02-10  155  			 * critical that it gets flushed back to the disk.
ac27a0ec112a089 Dave Kleikamp      2006-10-11  156  			 */
48a34311953d921 Jan Kara           2020-02-10  157  			ext4_clear_inode_flag(inode, EXT4_INODE_INDEX);
48a34311953d921 Jan Kara           2020-02-10  158  		}
ac27a0ec112a089 Dave Kleikamp      2006-10-11  159  	}
8af0f0822797707 Tao Ma             2013-04-19  160  
8af0f0822797707 Tao Ma             2013-04-19  161  	if (ext4_has_inline_data(inode)) {
8af0f0822797707 Tao Ma             2013-04-19  162  		int has_inline_data = 1;
4461471107b79be Michael Halcrow    2015-04-12  163  		err = ext4_read_inline_dir(file, ctx,
8af0f0822797707 Tao Ma             2013-04-19  164  					   &has_inline_data);
8af0f0822797707 Tao Ma             2013-04-19  165  		if (has_inline_data)
4461471107b79be Michael Halcrow    2015-04-12  166  			return err;
4461471107b79be Michael Halcrow    2015-04-12  167  	}
4461471107b79be Michael Halcrow    2015-04-12  168  
592ddec7578a33f Chandan Rajendra   2018-12-12  169  	if (IS_ENCRYPTED(inode)) {
8b10fe68985278d Jeff Layton        2020-08-10  170  		err = fscrypt_fname_alloc_buffer(EXT4_NAME_LEN, &fstr);
b7236e21d55ff90 Theodore Ts'o      2015-05-18  171  		if (err < 0)
4461471107b79be Michael Halcrow    2015-04-12  172  			return err;
4461471107b79be Michael Halcrow    2015-04-12  173  	}
8af0f0822797707 Tao Ma             2013-04-19  174  
725bebb27882ae6 Al Viro            2013-05-17  175  	while (ctx->pos < inode->i_size) {
2ed886852adfcb0 Theodore Ts'o      2010-05-16  176  		struct ext4_map_blocks map;
ac27a0ec112a089 Dave Kleikamp      2006-10-11  177  
1f60fbe7274918a Theodore Ts'o      2016-04-23  178  		if (fatal_signal_pending(current)) {
1f60fbe7274918a Theodore Ts'o      2016-04-23  179  			err = -ERESTARTSYS;
1f60fbe7274918a Theodore Ts'o      2016-04-23  180  			goto errout;
1f60fbe7274918a Theodore Ts'o      2016-04-23  181  		}
1f60fbe7274918a Theodore Ts'o      2016-04-23  182  		cond_resched();
4e19d6b65fb4fc4 Theodore Ts'o      2019-06-20  183  		offset = ctx->pos & (sb->s_blocksize - 1);
725bebb27882ae6 Al Viro            2013-05-17  184  		map.m_lblk = ctx->pos >> EXT4_BLOCK_SIZE_BITS(sb);
2ed886852adfcb0 Theodore Ts'o      2010-05-16  185  		map.m_len = 1;
2ed886852adfcb0 Theodore Ts'o      2010-05-16  186  		err = ext4_map_blocks(NULL, inode, &map, 0);
4e19d6b65fb4fc4 Theodore Ts'o      2019-06-20  187  		if (err == 0) {
4e19d6b65fb4fc4 Theodore Ts'o      2019-06-20  188  			/* m_len should never be zero but let's avoid
4e19d6b65fb4fc4 Theodore Ts'o      2019-06-20  189  			 * an infinite loop if it somehow is */
4e19d6b65fb4fc4 Theodore Ts'o      2019-06-20  190  			if (map.m_len == 0)
4e19d6b65fb4fc4 Theodore Ts'o      2019-06-20  191  				map.m_len = 1;
4e19d6b65fb4fc4 Theodore Ts'o      2019-06-20  192  			ctx->pos += map.m_len * sb->s_blocksize;
4e19d6b65fb4fc4 Theodore Ts'o      2019-06-20  193  			continue;
4e19d6b65fb4fc4 Theodore Ts'o      2019-06-20  194  		}
ac27a0ec112a089 Dave Kleikamp      2006-10-11  195  		if (err > 0) {
609c5e0081b432c Baokun Li          2025-11-21  196  			pgoff_t index = map.m_pblk << inode->i_blkbits >>
609c5e0081b432c Baokun Li          2025-11-21  197  					PAGE_SHIFT;
725bebb27882ae6 Al Viro            2013-05-17  198  			if (!ra_has_index(&file->f_ra, index))
cf914a7d656e62b Rusty Russell      2007-07-19  199  				page_cache_sync_readahead(
224941e8379a0de Al Viro            2024-04-11  200  					sb->s_bdev->bd_mapping,
609c5e0081b432c Baokun Li          2025-11-21  201  					&file->f_ra, file, index,
609c5e0081b432c Baokun Li          2025-11-21  202  					1 << EXT4_SB(sb)->s_min_folio_order);
09cbfeaf1a5a67b Kiryl Shutsemau    2016-04-01  203  			file->f_ra.prev_pos = (loff_t)index << PAGE_SHIFT;
1c2150283cae895 Theodore Ts'o      2014-08-29  204  			bh = ext4_bread(NULL, inode, map.m_lblk, 0);
c906f38e8853cfd Kirill Tkhai       2016-02-16  205  			if (IS_ERR(bh)) {
c906f38e8853cfd Kirill Tkhai       2016-02-16  206  				err = PTR_ERR(bh);
c906f38e8853cfd Kirill Tkhai       2016-02-16  207  				bh = NULL;
c906f38e8853cfd Kirill Tkhai       2016-02-16  208  				goto errout;
c906f38e8853cfd Kirill Tkhai       2016-02-16  209  			}
ac27a0ec112a089 Dave Kleikamp      2006-10-11  210  		}
ac27a0ec112a089 Dave Kleikamp      2006-10-11  211  
ac27a0ec112a089 Dave Kleikamp      2006-10-11  212  		if (!bh) {
e6c4021190c828d Eric Sandeen       2006-12-06  213  			/* corrupt size?  Maybe no more blocks to read */
725bebb27882ae6 Al Viro            2013-05-17  214  			if (ctx->pos > inode->i_blocks << 9)
e6c4021190c828d Eric Sandeen       2006-12-06  215  				break;
725bebb27882ae6 Al Viro            2013-05-17  216  			ctx->pos += sb->s_blocksize - offset;
ac27a0ec112a089 Dave Kleikamp      2006-10-11  217  			continue;
ac27a0ec112a089 Dave Kleikamp      2006-10-11  218  		}
ac27a0ec112a089 Dave Kleikamp      2006-10-11  219  
b0336e8d2108e63 Darrick J. Wong    2012-04-29  220  		/* Check the checksum */
b0336e8d2108e63 Darrick J. Wong    2012-04-29  221  		if (!buffer_verified(bh) &&
f036adb39976467 Theodore Ts'o      2019-06-21  222  		    !ext4_dirblock_csum_verify(inode, bh)) {
725bebb27882ae6 Al Viro            2013-05-17  223  			EXT4_ERROR_FILE(file, 0, "directory fails checksum "
b0336e8d2108e63 Darrick J. Wong    2012-04-29  224  					"at offset %llu",
725bebb27882ae6 Al Viro            2013-05-17  225  					(unsigned long long)ctx->pos);
725bebb27882ae6 Al Viro            2013-05-17  226  			ctx->pos += sb->s_blocksize - offset;
d5ac77730516028 Guo Chao           2013-01-28  227  			brelse(bh);
4461471107b79be Michael Halcrow    2015-04-12  228  			bh = NULL;
b0336e8d2108e63 Darrick J. Wong    2012-04-29  229  			continue;
b0336e8d2108e63 Darrick J. Wong    2012-04-29  230  		}
b0336e8d2108e63 Darrick J. Wong    2012-04-29  231  		set_buffer_verified(bh);
b0336e8d2108e63 Darrick J. Wong    2012-04-29  232  
ac27a0ec112a089 Dave Kleikamp      2006-10-11  233  		/* If the dir block has changed since the last call to
ac27a0ec112a089 Dave Kleikamp      2006-10-11  234  		 * readdir(2), then we might be pointing to an invalid
ac27a0ec112a089 Dave Kleikamp      2006-10-11  235  		 * dirent right now.  Scan from the start of the block
ac27a0ec112a089 Dave Kleikamp      2006-10-11  236  		 * to make sure. */
4f05ee2f82b470c Christian Brauner  2024-08-30  237  		if (!inode_eq_iversion(inode, info->cookie)) {
bc4b7b0414c33b2 Yao Kai            2026-07-06  238  			for (i = 0;
bc4b7b0414c33b2 Yao Kai            2026-07-06  239  			     i <= sb->s_blocksize -
bc4b7b0414c33b2 Yao Kai            2026-07-06 @240  				  ext4_dir_rec_len(1, has_csum ? NULL : inode) &&
bc4b7b0414c33b2 Yao Kai            2026-07-06  241  			     i < offset;) {
617ba13b31fbf50 Mingming Cao       2006-10-11  242  				de = (struct ext4_dir_entry_2 *)
ac27a0ec112a089 Dave Kleikamp      2006-10-11  243  					(bh->b_data + i);
ac27a0ec112a089 Dave Kleikamp      2006-10-11  244  				/* It's too expensive to do a full
ac27a0ec112a089 Dave Kleikamp      2006-10-11  245  				 * dirent test each time round this
ac27a0ec112a089 Dave Kleikamp      2006-10-11  246  				 * loop, but we do have to test at
ac27a0ec112a089 Dave Kleikamp      2006-10-11  247  				 * least that it is non-zero.  A
ac27a0ec112a089 Dave Kleikamp      2006-10-11  248  				 * failure will be detected in the
ac27a0ec112a089 Dave Kleikamp      2006-10-11  249  				 * dirent test below. */
3d0518f4758eca4 Wei Yongjun        2009-02-14  250  				if (ext4_rec_len_from_disk(de->rec_len,
ffbfbb9d09c9f8a Artem Blagodarenko 2026-06-24  251  					sb->s_blocksize) < ext4_dirent_rec_len(1,
471fbbea7ff7061 Daniel Rosenberg   2021-03-19  252  									inode))
ac27a0ec112a089 Dave Kleikamp      2006-10-11  253  					break;
3d0518f4758eca4 Wei Yongjun        2009-02-14  254  				i += ext4_rec_len_from_disk(de->rec_len,
3d0518f4758eca4 Wei Yongjun        2009-02-14  255  							    sb->s_blocksize);
ac27a0ec112a089 Dave Kleikamp      2006-10-11  256  			}
ac27a0ec112a089 Dave Kleikamp      2006-10-11  257  			offset = i;
725bebb27882ae6 Al Viro            2013-05-17  258  			ctx->pos = (ctx->pos & ~(sb->s_blocksize - 1))
ac27a0ec112a089 Dave Kleikamp      2006-10-11  259  				| offset;
4f05ee2f82b470c Christian Brauner  2024-08-30  260  			info->cookie = inode_query_iversion(inode);
ac27a0ec112a089 Dave Kleikamp      2006-10-11  261  		}
ac27a0ec112a089 Dave Kleikamp      2006-10-11  262  
bc4b7b0414c33b2 Yao Kai            2026-07-06  263  		if (unlikely(offset < sb->s_blocksize &&
bc4b7b0414c33b2 Yao Kai            2026-07-06  264  			     offset > sb->s_blocksize -
bc4b7b0414c33b2 Yao Kai            2026-07-06  265  			     ext4_dir_rec_len(1, has_csum ? NULL : inode))) {
bc4b7b0414c33b2 Yao Kai            2026-07-06  266  			EXT4_ERROR_FILE(file, bh->b_blocknr,
bc4b7b0414c33b2 Yao Kai            2026-07-06  267  					"bad entry in directory: %s - offset=%u, size=%lu",
bc4b7b0414c33b2 Yao Kai            2026-07-06  268  					"directory entry too close to block end",
bc4b7b0414c33b2 Yao Kai            2026-07-06  269  					offset, sb->s_blocksize);
bc4b7b0414c33b2 Yao Kai            2026-07-06  270  			ctx->pos = round_up(ctx->pos, sb->s_blocksize);
bc4b7b0414c33b2 Yao Kai            2026-07-06  271  			goto next_block;
bc4b7b0414c33b2 Yao Kai            2026-07-06  272  		}
bc4b7b0414c33b2 Yao Kai            2026-07-06  273  
725bebb27882ae6 Al Viro            2013-05-17  274  		while (ctx->pos < inode->i_size
ac27a0ec112a089 Dave Kleikamp      2006-10-11  275  		       && offset < sb->s_blocksize) {
617ba13b31fbf50 Mingming Cao       2006-10-11  276  			de = (struct ext4_dir_entry_2 *) (bh->b_data + offset);
725bebb27882ae6 Al Viro            2013-05-17  277  			if (ext4_check_dir_entry(inode, file, de, bh,
226ba972b086378 Tao Ma             2012-12-10  278  						 bh->b_data, bh->b_size,
226ba972b086378 Tao Ma             2012-12-10  279  						 offset)) {
63f5793351d8217 Andrew Morton      2006-10-11  280  				/*
725bebb27882ae6 Al Viro            2013-05-17  281  				 * On error, skip to the next block
63f5793351d8217 Andrew Morton      2006-10-11  282  				 */
725bebb27882ae6 Al Viro            2013-05-17  283  				ctx->pos = (ctx->pos |
ac27a0ec112a089 Dave Kleikamp      2006-10-11  284  						(sb->s_blocksize - 1)) + 1;
725bebb27882ae6 Al Viro            2013-05-17  285  				break;
ac27a0ec112a089 Dave Kleikamp      2006-10-11  286  			}
3d0518f4758eca4 Wei Yongjun        2009-02-14  287  			offset += ext4_rec_len_from_disk(de->rec_len,
3d0518f4758eca4 Wei Yongjun        2009-02-14  288  					sb->s_blocksize);
ac27a0ec112a089 Dave Kleikamp      2006-10-11  289  			if (le32_to_cpu(de->inode)) {
592ddec7578a33f Chandan Rajendra   2018-12-12  290  				if (!IS_ENCRYPTED(inode)) {
725bebb27882ae6 Al Viro            2013-05-17  291  					if (!dir_emit(ctx, de->name,
ac27a0ec112a089 Dave Kleikamp      2006-10-11  292  					    de->name_len,
ac27a0ec112a089 Dave Kleikamp      2006-10-11  293  					    le32_to_cpu(de->inode),
4461471107b79be Michael Halcrow    2015-04-12  294  					    get_dtype(sb, de->file_type)))
4461471107b79be Michael Halcrow    2015-04-12  295  						goto done;
4461471107b79be Michael Halcrow    2015-04-12  296  				} else {
a7550b30ab709ff Jaegeuk Kim        2016-07-10  297  					int save_len = fstr.len;
a7550b30ab709ff Jaegeuk Kim        2016-07-10  298  					struct fscrypt_str de_name =
a7550b30ab709ff Jaegeuk Kim        2016-07-10  299  							FSTR_INIT(de->name,
a7550b30ab709ff Jaegeuk Kim        2016-07-10  300  								de->name_len);
70dd7b573afeba9 yao.ly             2024-07-01  301  					u32 hash;
70dd7b573afeba9 yao.ly             2024-07-01  302  					u32 minor_hash;
70dd7b573afeba9 yao.ly             2024-07-01  303  
70dd7b573afeba9 yao.ly             2024-07-01  304  					if (IS_CASEFOLDED(inode)) {
70dd7b573afeba9 yao.ly             2024-07-01  305  						hash = EXT4_DIRENT_HASH(de);
70dd7b573afeba9 yao.ly             2024-07-01  306  						minor_hash = EXT4_DIRENT_MINOR_HASH(de);
70dd7b573afeba9 yao.ly             2024-07-01  307  					} else {
70dd7b573afeba9 yao.ly             2024-07-01  308  						hash = 0;
70dd7b573afeba9 yao.ly             2024-07-01  309  						minor_hash = 0;
70dd7b573afeba9 yao.ly             2024-07-01  310  					}
d229959072eba40 Theodore Ts'o      2015-05-18  311  
4461471107b79be Michael Halcrow    2015-04-12  312  					/* Directory is encrypted */
a7550b30ab709ff Jaegeuk Kim        2016-07-10  313  					err = fscrypt_fname_disk_to_usr(inode,
70dd7b573afeba9 yao.ly             2024-07-01  314  						hash, minor_hash, &de_name, &fstr);
ef1eb3aa50930f0 Eric Biggers       2016-09-15  315  					de_name = fstr;
a7550b30ab709ff Jaegeuk Kim        2016-07-10  316  					fstr.len = save_len;
ef1eb3aa50930f0 Eric Biggers       2016-09-15  317  					if (err)
4461471107b79be Michael Halcrow    2015-04-12  318  						goto errout;
4461471107b79be Michael Halcrow    2015-04-12  319  					if (!dir_emit(ctx,
ef1eb3aa50930f0 Eric Biggers       2016-09-15  320  					    de_name.name, de_name.len,
4461471107b79be Michael Halcrow    2015-04-12  321  					    le32_to_cpu(de->inode),
4461471107b79be Michael Halcrow    2015-04-12  322  					    get_dtype(sb, de->file_type)))
4461471107b79be Michael Halcrow    2015-04-12  323  						goto done;
725bebb27882ae6 Al Viro            2013-05-17  324  				}
ac27a0ec112a089 Dave Kleikamp      2006-10-11  325  			}
725bebb27882ae6 Al Viro            2013-05-17  326  			ctx->pos += ext4_rec_len_from_disk(de->rec_len,
3d0518f4758eca4 Wei Yongjun        2009-02-14  327  						sb->s_blocksize);
ac27a0ec112a089 Dave Kleikamp      2006-10-11  328  		}
bc4b7b0414c33b2 Yao Kai            2026-07-06  329  next_block:
ae05327a00fd47c Al Viro            2016-05-12  330  		if ((ctx->pos < inode->i_size) && !dir_relax_shared(inode))
4461471107b79be Michael Halcrow    2015-04-12  331  			goto done;
ac27a0ec112a089 Dave Kleikamp      2006-10-11  332  		brelse(bh);
4461471107b79be Michael Halcrow    2015-04-12  333  		bh = NULL;
725bebb27882ae6 Al Viro            2013-05-17  334  	}
4461471107b79be Michael Halcrow    2015-04-12  335  done:
4461471107b79be Michael Halcrow    2015-04-12  336  	err = 0;
4461471107b79be Michael Halcrow    2015-04-12  337  errout:
a7550b30ab709ff Jaegeuk Kim        2016-07-10  338  	fscrypt_fname_free_buffer(&fstr);
4461471107b79be Michael Halcrow    2015-04-12  339  	brelse(bh);
4461471107b79be Michael Halcrow    2015-04-12  340  	return err;
ac27a0ec112a089 Dave Kleikamp      2006-10-11  341  }
ac27a0ec112a089 Dave Kleikamp      2006-10-11  342  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
