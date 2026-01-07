Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F47622FDE6;
	Wed,  7 Jan 2026 04:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767760465; cv=none; b=DSL/GM+7hhuqE3UDOCOsXJxdr+JIATOE5sgN+s5xGlqJTFY9La3bmVkZKFgG4HI4hqtsXbCG4nqwxyQVK94Qjv8AO6LMKszhmuMFLsIR+7k8g0yX7GEteSpQ8Zz/+DD2NdwEXlfPCLE7OJltBIQIyKpzutZlQI2g5d6vxwbV7Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767760465; c=relaxed/simple;
	bh=VjB3xlr1PNDefiFEG/McopEaQKUyV+EQU86Bw5DSy6s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rwmoO/Cy7305Itnqta4fq8KWquBfgGBFXqqE/qq+7P2Q5GBTnV79P2C9uG14yu+nA3CgVb3oKP8cd3zSQa1Gg0R+C445NVdV34yZhV137X65Bh3bzw6Xs9BlZZUUSfw+RRWZV6p2g9ke9JrKfCUyAslgWwxmorxU2KlAChT+JXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=acoXtRbB; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="acoXtRbB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767760463; x=1799296463;
  h=date:from:to:cc:subject:message-id;
  bh=VjB3xlr1PNDefiFEG/McopEaQKUyV+EQU86Bw5DSy6s=;
  b=acoXtRbBk8YtUK4CwfVvXZ4D/hdNELHeBoKvYmTdsq2aUMK7ZZ4/kYsW
   kqb5VAcL2wXDoi+9sYZlCAH2nvHj/DB6OmZwgMxgO0wshaBrd6rLIoCov
   UcIneg1bFcEHtcrV86LwI1tgP9ozAkF3EPNJ7ufYgfjCrrOTKZWCSgQeS
   DZQmPQE4fjUlS26UUgO4jDX5XfB5RaP3cDMbUBleLeRkSG1CRthFMPEeW
   43Q1AauX4pEwKnFjvVqA/bYW3YYcCYjWRSwOSSbgWYrf5FEnI7R9ZbkUi
   cKxtAWU8uBGPzdviobaKn7xZv6fRhC0CEAoyOmFy6C4sOStpTvJ0fq2v0
   Q==;
X-CSE-ConnectionGUID: vo926D0jS4+vh7N8TTVt7A==
X-CSE-MsgGUID: jahe/8p2Rv2QAmwtQ8daPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69107841"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="69107841"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 20:34:22 -0800
X-CSE-ConnectionGUID: bRpu+VD7QRmK2icF+/WRwQ==
X-CSE-MsgGUID: IBumKINQR1WwkNGWpTCjpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="203081058"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Jan 2026 20:34:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdLFS-000000003Si-0ZlK;
	Wed, 07 Jan 2026 04:34:18 +0000
Date: Wed, 07 Jan 2026 12:34:12 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 jpsollie <janpieter.sollie@edpnet.be>
Subject: [koverstreet-bcachefs:pr/992 2/2]
 fs/bcachefs/data/read.c:979:24: error: use of undeclared identifier
 'nofs_flags'; did you mean 'iocb_flags'?
Message-ID: <202601071203.u4xtKSXq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs pr/992
head:   a2ed7a4e3724ad977f40d2918d5366e22065d940
commit: a2ed7a4e3724ad977f40d2918d5366e22065d940 [2/2] Merge branch 'master' of https://github.com/koverstreet/bcachefs into HEAD
config: i386-buildonly-randconfig-003-20260107 (https://download.01.org/0day-ci/archive/20260107/202601071203.u4xtKSXq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260107/202601071203.u4xtKSXq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601071203.u4xtKSXq-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/bcachefs/data/read.c:977:1: error: version control conflict marker in file
     977 | <<<<<<< HEAD:fs/bcachefs/io_read.c
         | ^
>> fs/bcachefs/data/read.c:979:24: error: use of undeclared identifier 'nofs_flags'; did you mean 'iocb_flags'?
     979 |         memalloc_nofs_restore(nofs_flags);
         |                               ^~~~~~~~~~
         |                               iocb_flags
   include/linux/fs.h:3815:19: note: 'iocb_flags' declared here
    3815 | static inline int iocb_flags(struct file *file)
         |                   ^
>> fs/bcachefs/data/read.c:982:59: error: too many arguments to function call, expected 2, have 3
     982 |         bch2_rbio_error(rbio, -BCH_ERR_data_read_retry_csum_err, BLK_STS_IOERR);
         |         ~~~~~~~~~~~~~~~                                          ^~~~~~~~~~~~~
   include/linux/blk_types.h:108:24: note: expanded from macro 'BLK_STS_IOERR'
     108 | #define BLK_STS_IOERR           ((__force blk_status_t)10)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/data/read.c:753:13: note: 'bch2_rbio_error' declared here
     753 | static void bch2_rbio_error(struct bch_read_bio *rbio, int ret)
         |             ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/bcachefs/data/read.c:985:23: error: use of undeclared identifier 'bch2_read_decompress_err'
     985 |         bch2_rbio_punt(rbio, bch2_read_decompress_err, RBIO_CONTEXT_UNBOUND, system_dfl_wq);
         |                              ^
>> fs/bcachefs/data/read.c:988:23: error: use of undeclared identifier 'bch2_read_decrypt_err'
     988 |         bch2_rbio_punt(rbio, bch2_read_decrypt_err, RBIO_CONTEXT_UNBOUND, system_dfl_wq);
         |                              ^
   5 errors generated.


vim +979 fs/bcachefs/data/read.c

6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  836  
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  837  /* Inner part that may run in process context */
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  838  static void __bch2_read_endio(struct work_struct *work)
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  839  {
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  840  	struct bch_read_bio *rbio =
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  841  		container_of(work, struct bch_read_bio, work);
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  842  	struct bch_fs *c	= rbio->c;
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  843  	struct bch_dev *ca = rbio->have_ioref ? bch2_dev_have_ref(c, rbio->pick.ptr.dev) : NULL;
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  844  	struct bch_read_bio *parent	= bch2_rbio_parent(rbio);
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  845  	struct bio *src			= &rbio->bio;
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  846  	struct bio *dst			= &parent->bio;
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  847  	struct bvec_iter dst_iter	= rbio->bvec_iter;
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  848  	struct bch_extent_crc_unpacked crc = rbio->pick.crc;
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  849  	struct nonce nonce = extent_nonce(rbio->version, crc);
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  850  	struct bch_csum csum;
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  851  	int ret;
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  852  
f60e31d6861576 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  853  	guard(memalloc_flags)(PF_MEMALLOC_NOFS);
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  854  
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  855  	/* Reset iterator for checksumming and copying bounced data: */
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  856  	if (rbio->bounce) {
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  857  		src->bi_iter.bi_size		= crc.compressed_size << 9;
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  858  		src->bi_iter.bi_idx		= 0;
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  859  		src->bi_iter.bi_bvec_done	= 0;
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  860  	} else {
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  861  		src->bi_iter			= rbio->bvec_iter;
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  862  	}
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  863  
e2fab373a468f7 fs/bcachefs/io_read.c   Kent Overstreet 2025-09-14  864  	if (bch2_read_corrupt_device == rbio->pick.ptr.dev ||
e2fab373a468f7 fs/bcachefs/io_read.c   Kent Overstreet 2025-09-14  865  	    bch2_read_corrupt_device < 0)
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  866  		bch2_maybe_corrupt_bio(src, bch2_read_corrupt_ratio);
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  867  
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  868  	csum = bch2_checksum_bio(c, crc.csum_type, nonce, src);
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  869  	bool csum_good = !bch2_crc_cmp(csum, rbio->pick.crc.csum) || c->opts.no_data_io;
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  870  
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  871  	/*
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  872  	 * Checksum error: if the bio wasn't bounced, we may have been
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  873  	 * reading into buffers owned by userspace (that userspace can
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  874  	 * scribble over) - retry the read, bouncing it this time:
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  875  	 */
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  876  	if (!csum_good && !rbio->bounce && (rbio->flags & BCH_READ_user_mapped)) {
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  877  		rbio->flags |= BCH_READ_must_bounce;
a87e7d26cb7538 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  878  		bch2_rbio_error(rbio, bch_err_throw(c, data_read_retry_csum_err_maybe_userspace));
f60e31d6861576 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  879  		return;
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  880  	}
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  881  
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  882  	bch2_account_io_completion(ca, BCH_MEMBER_ERROR_checksum, 0, csum_good);
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  883  
f60e31d6861576 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  884  	if (!csum_good) {
a87e7d26cb7538 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  885  		bch2_rbio_error(rbio, bch_err_throw(c, data_read_retry_csum_err));
f60e31d6861576 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  886  		return;
f60e31d6861576 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  887  	}
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  888  
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  889  	/*
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  890  	 * XXX
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  891  	 * We need to rework the narrow_crcs path to deliver the read completion
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  892  	 * first, and then punt to a different workqueue, otherwise we're
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  893  	 * holding up reads while doing btree updates which is bad for memory
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  894  	 * reclaim.
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  895  	 */
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  896  	if (unlikely(rbio->narrow_crcs))
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  897  		bch2_rbio_narrow_crcs(rbio);
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  898  
95e7fbbbe20796 fs/bcachefs/data/read.c Kent Overstreet 2025-12-22  899  	if (likely(!parent->data_update) ||
95e7fbbbe20796 fs/bcachefs/data/read.c Kent Overstreet 2025-12-22  900  	    parent->data_update_verify_decompress) {
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  901  		/* Adjust crc to point to subset of data we want: */
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  902  		crc.offset     += rbio->offset_into_extent;
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  903  		crc.live_size	= bvec_iter_sectors(rbio->bvec_iter);
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  904  
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  905  		if (crc_is_compressed(crc)) {
95e7fbbbe20796 fs/bcachefs/data/read.c Kent Overstreet 2025-12-22  906  			BUG_ON(!rbio->bounce);
95e7fbbbe20796 fs/bcachefs/data/read.c Kent Overstreet 2025-12-22  907  
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  908  			ret = bch2_encrypt_bio(c, crc.csum_type, nonce, src);
f60e31d6861576 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  909  			if (ret) {
a87e7d26cb7538 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  910  				bch2_rbio_error(rbio, bch_err_throw(c, data_read_decrypt_err));
f60e31d6861576 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  911  				return;
f60e31d6861576 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  912  			}
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  913  
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  914  			if (bch2_bio_uncompress(c, src, dst, dst_iter, crc) &&
f60e31d6861576 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  915  			    !c->opts.no_data_io) {
a87e7d26cb7538 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  916  				bch2_rbio_error(rbio, bch_err_throw(c, data_read_decompress_err));
f60e31d6861576 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  917  				return;
f60e31d6861576 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  918  			}
95e7fbbbe20796 fs/bcachefs/data/read.c Kent Overstreet 2025-12-22  919  
95e7fbbbe20796 fs/bcachefs/data/read.c Kent Overstreet 2025-12-22  920  			if (unlikely(parent->data_update)) {
95e7fbbbe20796 fs/bcachefs/data/read.c Kent Overstreet 2025-12-22  921  				/* We decrypted to decompress; re-encrypt: */
95e7fbbbe20796 fs/bcachefs/data/read.c Kent Overstreet 2025-12-22  922  				ret = bch2_encrypt_bio(c, crc.csum_type, nonce, src);
95e7fbbbe20796 fs/bcachefs/data/read.c Kent Overstreet 2025-12-22  923  				if (ret) {
95e7fbbbe20796 fs/bcachefs/data/read.c Kent Overstreet 2025-12-22  924  					bch2_rbio_error(rbio, bch_err_throw(c, data_read_decrypt_err));
95e7fbbbe20796 fs/bcachefs/data/read.c Kent Overstreet 2025-12-22  925  					return;
95e7fbbbe20796 fs/bcachefs/data/read.c Kent Overstreet 2025-12-22  926  				}
95e7fbbbe20796 fs/bcachefs/data/read.c Kent Overstreet 2025-12-22  927  			}
95e7fbbbe20796 fs/bcachefs/data/read.c Kent Overstreet 2025-12-22  928  		} else if (likely(!parent->data_update)) {
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  929  			/* don't need to decrypt the entire bio: */
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  930  			nonce = nonce_add(nonce, crc.offset << 9);
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  931  			bio_advance(src, crc.offset << 9);
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  932  
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  933  			BUG_ON(src->bi_iter.bi_size < dst_iter.bi_size);
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  934  			src->bi_iter.bi_size = dst_iter.bi_size;
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  935  
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  936  			ret = bch2_encrypt_bio(c, crc.csum_type, nonce, src);
f60e31d6861576 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  937  			if (ret) {
a87e7d26cb7538 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  938  				bch2_rbio_error(rbio, bch_err_throw(c, data_read_decrypt_err));
f60e31d6861576 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  939  				return;
f60e31d6861576 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  940  			}
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  941  
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  942  			if (rbio->bounce) {
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  943  				struct bvec_iter src_iter = src->bi_iter;
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  944  
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  945  				bio_copy_data_iter(dst, &dst_iter, src, &src_iter);
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  946  			}
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  947  		}
95e7fbbbe20796 fs/bcachefs/data/read.c Kent Overstreet 2025-12-22  948  	}
95e7fbbbe20796 fs/bcachefs/data/read.c Kent Overstreet 2025-12-22  949  
95e7fbbbe20796 fs/bcachefs/data/read.c Kent Overstreet 2025-12-22  950  	if (unlikely(parent->data_update)) {
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  951  		if (rbio->split)
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  952  			rbio->parent->pick = rbio->pick;
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  953  
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  954  		if (rbio->bounce) {
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  955  			struct bvec_iter src_iter = src->bi_iter;
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  956  
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  957  			bio_copy_data_iter(dst, &dst_iter, src, &src_iter);
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  958  		}
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  959  	}
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  960  
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  961  	if (rbio->promote) {
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  962  		/*
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  963  		 * Re encrypt data we decrypted, so it's consistent with
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  964  		 * rbio->crc:
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  965  		 */
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  966  		ret = bch2_encrypt_bio(c, crc.csum_type, nonce, src);
f60e31d6861576 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  967  		if (ret) {
a87e7d26cb7538 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  968  			bch2_rbio_error(rbio, bch_err_throw(c, data_read_decrypt_err));
f60e31d6861576 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  969  			return;
f60e31d6861576 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  970  		}
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  971  	}
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  972  
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  973  	if (likely(!(rbio->flags & BCH_READ_in_retry))) {
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  974  		rbio = bch2_rbio_free(rbio);
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  975  		bch2_rbio_done(rbio);
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  976  	}
a2ed7a4e3724ad fs/bcachefs/data/read.c jpsollie        2026-01-06  977  <<<<<<< HEAD:fs/bcachefs/io_read.c
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  978  out:
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12 @979  	memalloc_nofs_restore(nofs_flags);
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  980  	return;
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  981  csum_err:
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12 @982  	bch2_rbio_error(rbio, -BCH_ERR_data_read_retry_csum_err, BLK_STS_IOERR);
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  983  	goto out;
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  984  decompression_err:
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12 @985  	bch2_rbio_punt(rbio, bch2_read_decompress_err, RBIO_CONTEXT_UNBOUND, system_dfl_wq);
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  986  	goto out;
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  987  decrypt_err:
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12 @988  	bch2_rbio_punt(rbio, bch2_read_decrypt_err, RBIO_CONTEXT_UNBOUND, system_dfl_wq);
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  989  	goto out;
a2ed7a4e3724ad fs/bcachefs/data/read.c jpsollie        2026-01-06  990  =======
a2ed7a4e3724ad fs/bcachefs/data/read.c jpsollie        2026-01-06  991  >>>>>>> ba7b8f9521228d51c4ab46bf7723fb25cefc9a46:fs/bcachefs/data/read.c
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  992  }
6f6721b00a2463 fs/bcachefs/io_read.c   jpsollie        2025-12-12  993  

:::::: The code at line 979 was first introduced by commit
:::::: 6f6721b00a2463efc3e5386a9e6b18cb34df1146 Revert "Remove bcachefs core code"

:::::: TO: jpsollie <janpieter.sollie@edpnet.be>
:::::: CC: jpsollie <janpieter.sollie@edpnet.be>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
