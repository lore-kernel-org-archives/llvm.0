Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D1814AD2D;
	Sat, 19 Apr 2025 07:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745048469; cv=none; b=MLQR6225zbeBhVeJeHhqx095PXnqvbHZPlomwheT5DicYHI/bu3DDAdZ29tQfne5CkrO7drWqE78mlnlywjGsj3uClTlw1bzo9gmSPe0q1q2P01UdAQTfBgaUa+y3kZPQGq6OS5TltWm1hSPiiAdoyQaNsRYAySgOJtlN1RgKtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745048469; c=relaxed/simple;
	bh=xElXsTOBLjT2shgx9rh3akx5c4P7q5t0ppS0fZbj4go=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N8xo6vIDoOFOfzSKjncIxnn0MAbYZ5lnjPXqFVaI4c45EfSd+m3pDM+SObyS3b2AOTnTSb5iRMvHi19qlIWosYrQe2+FCQqemMKWD3M62RIny9QpIeSv6D+EcK0+IwqPsPXjVys8cLi/tBkRT19dTwqkbx4H0Qt65nUipbJWOgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GpI8Kj29; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GpI8Kj29"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745048465; x=1776584465;
  h=date:from:cc:subject:message-id:mime-version;
  bh=xElXsTOBLjT2shgx9rh3akx5c4P7q5t0ppS0fZbj4go=;
  b=GpI8Kj29CKJjKXPskL9TdmsSjijwxXd3V9UNOuqEX92h0H440JwZpKzn
   eVHRNpvg20eA6DVTZeyiYTUa2PzEXz2aGEJ0L/rKrENp6XK7/+XxIPNPh
   Vws4ij6toG8ctWg5jmvOFGoGN/3V3rFUVxkk2+rP4IZSCnnEYJOZK1+Gz
   pfVnXoiNiX9/JLGMiiY4dxhiVqXbtt5KPa+CKqc7EoBPPbY2kXmSwMcs+
   SosY3gseqFKu8ywCKyxEfz2aspKdT+MplmHQLT1ahyjxHWEw2vAqXxw4x
   l+VeirvLP7gzv9M6eXBr01r+TwDp1pXyqTPYNXojeTaLL6HNh+YHFtj0J
   w==;
X-CSE-ConnectionGUID: 0oaRwrmvTc+MncuDn3hhDQ==
X-CSE-MsgGUID: dJlSbefZT0y4Y2NKFnWEqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="46768173"
X-IronPort-AV: E=Sophos;i="6.15,223,1739865600"; 
   d="scan'208";a="46768173"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 00:41:05 -0700
X-CSE-ConnectionGUID: VTtRMaBeQAGjNh9PRE+bkg==
X-CSE-MsgGUID: 04pRu9M/T1eQ345D5j64Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,223,1739865600"; 
   d="scan'208";a="136271141"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Apr 2025 00:41:04 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u62ov-0003gx-1Z;
	Sat, 19 Apr 2025 07:41:01 +0000
Date: Sat, 19 Apr 2025 15:40:26 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 114/114]
 fs/bcachefs/io_write.c:447:3: warning: conditional expression between
 different enumeration types ('enum bch_dev_read_ref' and 'enum
 bch_dev_write_ref')
Message-ID: <202504191501.GtkTzMIW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   6c7f339efe3350c9244dc1a6dc5a70a1fc06e8a3
commit: 6c7f339efe3350c9244dc1a6dc5a70a1fc06e8a3 [114/114] bcachefs: bch_dev.io_ref -> enumerated_ref
config: hexagon-randconfig-001-20250419 (https://download.01.org/0day-ci/archive/20250419/202504191501.GtkTzMIW-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250419/202504191501.GtkTzMIW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504191501.GtkTzMIW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/io_write.c:447:3: warning: conditional expression between different enumeration types ('enum bch_dev_read_ref' and 'enum bch_dev_write_ref') [-Wenum-compare-conditional]
     447 |                 ? BCH_DEV_READ_REF_btree_node_write
         |                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     448 |                 : BCH_DEV_WRITE_REF_io_write;
         |                   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
--
>> fs/bcachefs/ec.c:711:3: warning: conditional expression between different enumeration types ('enum bch_dev_read_ref' and 'enum bch_dev_write_ref') [-Wenum-compare-conditional]
     711 |                 ? BCH_DEV_READ_REF_ec_block
         |                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
     712 |                 : BCH_DEV_WRITE_REF_ec_block;
         |                   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/ec.c:749:3: warning: conditional expression between different enumeration types ('enum bch_dev_read_ref' and 'enum bch_dev_write_ref') [-Wenum-compare-conditional]
     749 |                 ? BCH_DEV_READ_REF_ec_block
         |                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
     750 |                 : BCH_DEV_WRITE_REF_ec_block;
         |                   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +447 fs/bcachefs/io_write.c

   437	
   438	void bch2_submit_wbio_replicas(struct bch_write_bio *wbio, struct bch_fs *c,
   439				       enum bch_data_type type,
   440				       const struct bkey_i *k,
   441				       bool nocow)
   442	{
   443		struct bkey_ptrs_c ptrs = bch2_bkey_ptrs_c(bkey_i_to_s_c(k));
   444		struct bch_write_bio *n;
   445		unsigned ref_rw  = type == BCH_DATA_btree ? READ : WRITE;
   446		unsigned ref_idx = type == BCH_DATA_btree
 > 447			? BCH_DEV_READ_REF_btree_node_write
   448			: BCH_DEV_WRITE_REF_io_write;
   449	
   450		BUG_ON(c->opts.nochanges);
   451	
   452		bkey_for_each_ptr(ptrs, ptr) {
   453			/*
   454			 * XXX: btree writes should be using io_ref[WRITE], but we
   455			 * aren't retrying failed btree writes yet (due to device
   456			 * removal/ro):
   457			 */
   458			struct bch_dev *ca = nocow
   459				? bch2_dev_have_ref(c, ptr->dev)
   460				: bch2_dev_get_ioref(c, ptr->dev, ref_rw, ref_idx);
   461	
   462			if (to_entry(ptr + 1) < ptrs.end) {
   463				n = to_wbio(bio_alloc_clone(NULL, &wbio->bio, GFP_NOFS, &c->replica_set));
   464	
   465				n->bio.bi_end_io	= wbio->bio.bi_end_io;
   466				n->bio.bi_private	= wbio->bio.bi_private;
   467				n->parent		= wbio;
   468				n->split		= true;
   469				n->bounce		= false;
   470				n->put_bio		= true;
   471				n->bio.bi_opf		= wbio->bio.bi_opf;
   472				bio_inc_remaining(&wbio->bio);
   473			} else {
   474				n = wbio;
   475				n->split		= false;
   476			}
   477	
   478			n->c			= c;
   479			n->dev			= ptr->dev;
   480			n->have_ioref		= ca != NULL;
   481			n->nocow		= nocow;
   482			n->submit_time		= local_clock();
   483			n->inode_offset		= bkey_start_offset(&k->k);
   484			if (nocow)
   485				n->nocow_bucket	= PTR_BUCKET_NR(ca, ptr);
   486			n->bio.bi_iter.bi_sector = ptr->offset;
   487	
   488			if (likely(n->have_ioref)) {
   489				this_cpu_add(ca->io_done->sectors[WRITE][type],
   490					     bio_sectors(&n->bio));
   491	
   492				bio_set_dev(&n->bio, ca->disk_sb.bdev);
   493	
   494				if (type != BCH_DATA_btree && unlikely(c->opts.no_data_io)) {
   495					bio_endio(&n->bio);
   496					continue;
   497				}
   498	
   499				submit_bio(&n->bio);
   500			} else {
   501				n->bio.bi_status	= BLK_STS_REMOVED;
   502				bio_endio(&n->bio);
   503			}
   504		}
   505	}
   506	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
