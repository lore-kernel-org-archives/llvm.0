Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429DC2264C0;
	Tue,  2 Jun 2026 01:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780363826; cv=none; b=JJIDu3SSQ/viWHHGqbVibKWWfqXUE3JSTv1+uj7eQfkLSTddJaqYrg4k/jh9vqH7XGUMcD/7zDIgz5mO7LKaljC4abGXLXiOXOYkzj0mId37El+ICiHBBDvb4Du6V1P3WCc/qaarszChq+F/qkXWVVCzZK1fDFRO0JEimBUONRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780363826; c=relaxed/simple;
	bh=NgbIr4t02nBOh+jixaSPzNjAniOPBRsW1iZKd2pOfNU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ORLqeDlgh9sAGo75KlZ5Pan7WxrwhbwXMeSCTTpGlhcLcQ+P3aYVS8dnfad7tZ+3+ETPoESDApePTilMCaR9ulLJwkxEKZIGOVu92zv9pp76urhPWvRnceDbQoSfB2gdr85I+KMIRUwTpgZHExM4E6dKZWHZAgpjsCThuNuGyvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=giyIAjfV; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="giyIAjfV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780363825; x=1811899825;
  h=date:from:to:cc:subject:message-id;
  bh=NgbIr4t02nBOh+jixaSPzNjAniOPBRsW1iZKd2pOfNU=;
  b=giyIAjfVTEBDtYF00gqnoHU9Hk7MKKV+jMnm/0WzuQurxPP49oh3raSu
   bddY2lJPmH2gO1wYK7w3o99yj6RBwzrWxsMbMrSIYLyI6d5Qprw5+02b2
   ylWcrglmBTYpMAO6oW3IX3HsofDbXdtP2bLhL48ec/+Gf48M63Qq/7f/P
   Q/vVV9PCR/LXDGnhZrFs1TgxNrH7yx2GglmoSfjF2zdd1aN6KdF/4C00P
   dF5/P1/mQrKBxHD9bte6SkGBfW346GajCuHhDfq1i7YeJo4Qb+2wPBd0R
   keTydeDIHwdubD/iKzJjEOi29FqAGgO9C14E5tRU4sfB3OMQv0hlDvsoJ
   g==;
X-CSE-ConnectionGUID: hgoryE57QP6z+TlRLwX4Qw==
X-CSE-MsgGUID: BmTWQxjUQsumxGK7SfgCQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="91443640"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="91443640"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 18:30:24 -0700
X-CSE-ConnectionGUID: 5Yhdw4sJQoCsODMFIsbGbA==
X-CSE-MsgGUID: 38RPf7kXSRCzbSD7+eaXyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="248011703"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 01 Jun 2026 18:30:23 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUDxT-000000001i9-3fbu;
	Tue, 02 Jun 2026 01:30:19 +0000
Date: Tue, 02 Jun 2026 03:30:01 +0200
From: kernel test robot <lkp@intel.com>
To: Danila Chernetsov <listdansp@mail.ru>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jan Kara <jack@suse.cz>
Subject: [jack-fs:for_next 8/9] fs/ext2/file.c:171:14: error:
 expected ';' after expression
Message-ID: <202606020355.ZAAq7frB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git for_next
head:   97740c736bff8331fa4e6e33604a2c8b4229d70d
commit: d40e3cdfc2d0911712def016967103b37475c01e [8/9] ext2: fix ignored return value of generic_write_sync()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260602/202606020355.ZAAq7frB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606020355.ZAAq7frB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606020355.ZAAq7frB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/ext2/file.c:171:14: error: expected ';' after expression
     171 |                         ret = ret2
         |                                   ^
         |                                   ;
   1 error generated.


vim +171 fs/ext2/file.c

   110	
   111	static ssize_t ext2_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
   112	{
   113		struct file *file = iocb->ki_filp;
   114		struct inode *inode = file->f_mapping->host;
   115		ssize_t ret;
   116		unsigned int flags = 0;
   117		unsigned long blocksize = inode->i_sb->s_blocksize;
   118		loff_t offset = iocb->ki_pos;
   119		loff_t count = iov_iter_count(from);
   120		ssize_t status = 0;
   121	
   122		trace_ext2_dio_write_begin(iocb, from, 0);
   123		inode_lock(inode);
   124		ret = generic_write_checks(iocb, from);
   125		if (ret <= 0)
   126			goto out_unlock;
   127	
   128		ret = kiocb_modified(iocb);
   129		if (ret)
   130			goto out_unlock;
   131	
   132		/* use IOMAP_DIO_FORCE_WAIT for unaligned or extending writes */
   133		if (iocb->ki_pos + iov_iter_count(from) > i_size_read(inode) ||
   134		   (!IS_ALIGNED(iocb->ki_pos | iov_iter_alignment(from), blocksize)))
   135			flags |= IOMAP_DIO_FORCE_WAIT;
   136	
   137		ret = iomap_dio_rw(iocb, from, &ext2_iomap_ops, &ext2_dio_write_ops,
   138				   flags, NULL, 0);
   139	
   140		/* ENOTBLK is magic return value for fallback to buffered-io */
   141		if (ret == -ENOTBLK)
   142			ret = 0;
   143	
   144		if (ret < 0 && ret != -EIOCBQUEUED)
   145			ext2_write_failed(inode->i_mapping, offset + count);
   146	
   147		/* handle case for partial write and for fallback to buffered write */
   148		if (ret >= 0 && iov_iter_count(from)) {
   149			loff_t pos, endbyte;
   150			int ret2;
   151	
   152			iocb->ki_flags &= ~IOCB_DIRECT;
   153			pos = iocb->ki_pos;
   154			status = generic_perform_write(iocb, from);
   155			if (unlikely(status < 0)) {
   156				ret = status;
   157				goto out_unlock;
   158			}
   159	
   160			ret += status;
   161			endbyte = pos + status - 1;
   162			ret2 = filemap_write_and_wait_range(inode->i_mapping, pos,
   163							    endbyte);
   164			if (!ret2) {
   165				invalidate_mapping_pages(inode->i_mapping,
   166							 pos >> PAGE_SHIFT,
   167							 endbyte >> PAGE_SHIFT);
   168				if (ret > 0)
   169					ret = generic_write_sync(iocb, ret);
   170			} else {
 > 171				ret = ret2
   172			}
   173		}
   174	
   175	out_unlock:
   176		inode_unlock(inode);
   177		if (status)
   178			trace_ext2_dio_write_buff_end(iocb, from, status);
   179		trace_ext2_dio_write_end(iocb, from, ret);
   180		return ret;
   181	}
   182	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
