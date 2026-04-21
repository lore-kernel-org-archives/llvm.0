Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AA7126C03;
	Tue, 21 Apr 2026 23:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776815159; cv=none; b=r3OBY3P3rw4ocOj7gNm/txjNCL47EGBtFx/opJFzlHtbRvOBGTiYoM78sx9R6f34zWBo9giAhoho2cghiI8O0zS8R46z8yD3D7QDp2FHmsgO7odV0RMFUrFVdZz1XeO5f808I+4yQwK/DfibYEx5oJMQ40zzb0nLCha+QXC4crs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776815159; c=relaxed/simple;
	bh=o3DKlon8CsCcGDGewW4cokmm2zbTOw0o0g1F4kT9e90=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FpLqO86mKUaPDeoGSz0KlTe4tb3FKQoWPh2GlW1jB9fXpkdVP3lCctsEYoZXay5Ax+85yHBqr7JGKCO/sjpQ41RsV4Xkex0BME/LRfJmRofRzM80mf2E8k7rAcSNDI6myfzFFBJ4+XxwivVL3huU8bHT/5nywi49rM/aJDgRQl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nBu6tDJ5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nBu6tDJ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776815157; x=1808351157;
  h=date:from:to:cc:subject:message-id;
  bh=o3DKlon8CsCcGDGewW4cokmm2zbTOw0o0g1F4kT9e90=;
  b=nBu6tDJ5vuEUkeyFe13d8JJba4W+UXI7oU/QtEFyUe3RyDa4U8Hj6AVK
   DrhyWnBmob5rjzsOQzravu5Gf8Tt/M6Cv2gyxnmGJdiKVryJgzXUJeIsw
   7OKAnQ7qWQsK22EhNl/B004VZtQamGzzJ57N0rp043PRx3/3wYcMRac/1
   E3F4OgIaWKanIIjLIm7xEehKUHEM5uKDJKlLDOf4JlW9fZ5xvHykxneH6
   X3Cg/PyW5dN2fbr8Ml92oRJJMCXDjWQMdhdm6m7JjsQVjlgU5E2E47/mq
   qTDWBfe4neISAUM7oryGMBOhxF2lE9/PLnxWjjnav7AH+rDit47PRkCvD
   w==;
X-CSE-ConnectionGUID: 12XSALpXTIGYNly8/+0nLQ==
X-CSE-MsgGUID: SvtiF4MoQsme4X8XIZ6plg==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="76795944"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="76795944"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 16:45:56 -0700
X-CSE-ConnectionGUID: MC9yB7JSTf6EBQQtFLtyDA==
X-CSE-MsgGUID: CSihvgSXRda/UrR8jIegew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="270277523"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Apr 2026 16:45:55 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFKmu-0000000043g-12ao;
	Tue, 21 Apr 2026 23:45:52 +0000
Date: Wed, 22 Apr 2026 07:44:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 3/4]
 fs/bcachefs/vfs/direct.c:141:3: warning: label followed by a declaration is a
 C23 extension
Message-ID: <202604220740.bjX3D5oN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs master
head:   cae96c4c2d98eba2e03a88b131406da23c213fe6
commit: 92b3d152fe07e1f2a7060adb3f06afcae6135437 [3/4] bcachefs: fix __bch2_direct_IO_read() error path
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260422/202604220740.bjX3D5oN-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260422/202604220740.bjX3D5oN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604220740.bjX3D5oN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/vfs/direct.c:141:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     141 |                 struct bch_read_bio *rbio =
         |                 ^
   1 warning generated.


vim +141 fs/bcachefs/vfs/direct.c

dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   64  
1fd72aa451b8bb fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-03-24   65  static int __bch2_direct_IO_read(struct kiocb *req, struct iov_iter *iter,
39fe245ff806f1 fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-03-24   66  				enum bch_read_flags flags,
39fe245ff806f1 fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-03-24   67  				struct bch_read_err_report *err_report)
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   68  {
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   69  	struct file *file = req->ki_filp;
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   70  	struct bch_inode_info *inode = file_bch_inode(file);
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   71  	struct bch_fs *c = inode->v.i_sb->s_fs_info;
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   72  	struct dio_read *dio;
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   73  	struct bio *bio;
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   74  	loff_t offset = req->ki_pos;
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   75  	bool sync = is_sync_kiocb(req);
dfa204b169ed29 fs/bcachefs/fs-io-direct.c Kent Overstreet 2025-01-15   76  	bool split = false;
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   77  	size_t shorten;
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   78  	ssize_t ret;
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   79  
e6479021dea40b fs/bcachefs/fs-io-direct.c Kent Overstreet 2025-08-23   80  	struct bch_inode_opts opts;
e6479021dea40b fs/bcachefs/fs-io-direct.c Kent Overstreet 2025-08-23   81  	bch2_inode_opts_get_inode(c, &inode->ei_inode, &opts);
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   82  
00fff4dd586619 fs/bcachefs/fs-io-direct.c Kent Overstreet 2024-01-16   83  	/* bios must be 512 byte aligned: */
00fff4dd586619 fs/bcachefs/fs-io-direct.c Kent Overstreet 2024-01-16   84  	if ((offset|iter->count) & (SECTOR_SIZE - 1))
15be180f2638ee fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-03-03   85  		return bch_err_throw(c, EINVAL_unaligned_io);
00fff4dd586619 fs/bcachefs/fs-io-direct.c Kent Overstreet 2024-01-16   86  
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   87  	ret = min_t(loff_t, iter->count,
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   88  		    max_t(loff_t, 0, i_size_read(&inode->v) - offset));
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   89  
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   90  	if (!ret)
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   91  		return ret;
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   92  
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   93  	shorten = iov_iter_count(iter) - round_up(ret, block_bytes(c));
b58b1b883b9b70 fs/bcachefs/fs-io-direct.c Brian Foster    2024-02-15   94  	if (shorten >= iter->count)
b58b1b883b9b70 fs/bcachefs/fs-io-direct.c Brian Foster    2024-02-15   95  		shorten = 0;
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   96  	iter->count -= shorten;
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   97  
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   98  	bio = bio_alloc_bioset(NULL,
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03   99  			       bio_iov_vecs_to_alloc(iter, BIO_MAX_VECS),
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  100  			       REQ_OP_READ,
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  101  			       GFP_KERNEL,
52d279ad5f3e4c fs/bcachefs/vfs/direct.c   Kent Overstreet 2025-11-30  102  			       &c->vfs.dio_read_bioset);
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  103  
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  104  	dio = container_of(bio, struct dio_read, rbio.bio);
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  105  	closure_init(&dio->cl, NULL);
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  106  
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  107  	/*
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  108  	 * this is a _really_ horrible hack just to avoid an atomic sub at the
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  109  	 * end:
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  110  	 */
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  111  	if (!sync) {
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  112  		set_closure_fn(&dio->cl, bch2_dio_read_complete, NULL);
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  113  		atomic_set(&dio->cl.remaining,
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  114  			   CLOSURE_REMAINING_INITIALIZER -
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  115  			   CLOSURE_RUNNING +
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  116  			   CLOSURE_DESTRUCTOR);
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  117  	} else {
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  118  		atomic_set(&dio->cl.remaining,
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  119  			   CLOSURE_REMAINING_INITIALIZER + 1);
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  120  	}
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  121  
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  122  	dio->req	= req;
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  123  	dio->ret	= ret;
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  124  	/*
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  125  	 * This is one of the sketchier things I've encountered: we have to skip
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  126  	 * the dirtying of requests that are internal from the kernel (i.e. from
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  127  	 * loopback), because we'll deadlock on page_lock.
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  128  	 */
8838999ccf4f6f fs/bcachefs/fs-io-direct.c Alan Huang      2025-07-19  129  	dio->should_dirty = user_backed_iter(iter);
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  130  
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  131  	goto start;
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  132  	while (iter->count) {
dfa204b169ed29 fs/bcachefs/fs-io-direct.c Kent Overstreet 2025-01-15  133  		split = true;
dfa204b169ed29 fs/bcachefs/fs-io-direct.c Kent Overstreet 2025-01-15  134  
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  135  		bio = bio_alloc_bioset(NULL,
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  136  				       bio_iov_vecs_to_alloc(iter, BIO_MAX_VECS),
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  137  				       REQ_OP_READ,
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  138  				       GFP_KERNEL,
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  139  				       &c->bio_read);
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  140  start:
dfa204b169ed29 fs/bcachefs/fs-io-direct.c Kent Overstreet 2025-01-15 @141  		struct bch_read_bio *rbio =
dfa204b169ed29 fs/bcachefs/fs-io-direct.c Kent Overstreet 2025-01-15  142  			rbio_init(bio,
dfa204b169ed29 fs/bcachefs/fs-io-direct.c Kent Overstreet 2025-01-15  143  				  c,
dfa204b169ed29 fs/bcachefs/fs-io-direct.c Kent Overstreet 2025-01-15  144  				  opts,
dfa204b169ed29 fs/bcachefs/fs-io-direct.c Kent Overstreet 2025-01-15  145  				  split
dfa204b169ed29 fs/bcachefs/fs-io-direct.c Kent Overstreet 2025-01-15  146  				  ? bch2_direct_IO_read_split_endio
dfa204b169ed29 fs/bcachefs/fs-io-direct.c Kent Overstreet 2025-01-15  147  				  : bch2_direct_IO_read_endio);
dfa204b169ed29 fs/bcachefs/fs-io-direct.c Kent Overstreet 2025-01-15  148  
1fd72aa451b8bb fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-03-24  149  		BUG_ON(rbio->_state);
39fe245ff806f1 fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-03-24  150  		rbio->err_report		= err_report;
1fd72aa451b8bb fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-03-24  151  		rbio->subvol			= inode_inum(inode).subvol;
92b3d152fe07e1 fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  152  		rbio->bio.bi_opf		= REQ_OP_READ|REQ_SYNC;
92b3d152fe07e1 fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  153  		rbio->bio.bi_iter.bi_sector	= offset >> 9;
92b3d152fe07e1 fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  154  		rbio->bio.bi_private		= dio;
92b3d152fe07e1 fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  155  
92b3d152fe07e1 fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  156  		ret = bch2_bio_iov_iter_get_pages(&rbio->bio, iter, 0);
92b3d152fe07e1 fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  157  		if (ret < 0) {
92b3d152fe07e1 fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  158  			/* XXX: fault inject this path */
92b3d152fe07e1 fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  159  			rbio->ret = ret;
92b3d152fe07e1 fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  160  			bio_endio(&rbio->bio);
92b3d152fe07e1 fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  161  			break;
92b3d152fe07e1 fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  162  		}
92b3d152fe07e1 fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  163  
92b3d152fe07e1 fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  164  		offset += rbio->bio.bi_iter.bi_size;
92b3d152fe07e1 fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  165  
92b3d152fe07e1 fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  166  		if (dio->should_dirty)
92b3d152fe07e1 fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  167  			bio_set_pages_dirty(&rbio->bio);
92b3d152fe07e1 fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  168  
92b3d152fe07e1 fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  169  		if (iter->count)
92b3d152fe07e1 fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-04-21  170  			closure_get(&dio->cl);
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  171  
1fd72aa451b8bb fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-03-24  172  		CLASS(btree_trans, trans)(c);
1fd72aa451b8bb fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-03-24  173  		bch2_read(trans, rbio, rbio->bio.bi_iter, inode_inum(inode),
1fd72aa451b8bb fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-03-24  174  			  NULL, NULL,
1fd72aa451b8bb fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-03-24  175  			  BCH_READ_retry_if_stale|
1fd72aa451b8bb fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-03-24  176  			  BCH_READ_may_promote|
1fd72aa451b8bb fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-03-24  177  			  BCH_READ_user_mapped|
1fd72aa451b8bb fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-03-24  178  			  flags);
1fd72aa451b8bb fs/bcachefs/vfs/direct.c   Kent Overstreet 2026-03-24  179  	}
27de0ee39f810d fs/bcachefs/fs-io-direct.c Kent Overstreet 2024-10-14  180  
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  181  	iter->count += shorten;
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  182  
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  183  	if (sync) {
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  184  		closure_sync(&dio->cl);
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  185  		closure_debug_destroy(&dio->cl);
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  186  		ret = dio->ret;
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  187  		bio_check_or_release(&dio->rbio.bio, dio->should_dirty);
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  188  		return ret;
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  189  	} else {
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  190  		return -EIOCBQUEUED;
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  191  	}
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  192  }
dbbfca9f41e869 fs/bcachefs/fs-io-direct.c Kent Overstreet 2023-08-03  193  

:::::: The code at line 141 was first introduced by commit
:::::: dfa204b169ed29e4cdcb5a20d4cba2f579235543 bcachefs: rbio_init() cleanup

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
