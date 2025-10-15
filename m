Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6681F2F90C4;
	Wed, 15 Oct 2025 21:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760563793; cv=none; b=nxhJJBUmzJUMF3AoiAUMA53UqowfAZxbv7bADqfYUygDXFkv+ljjona+KmZN9OrFjNifFwROA0/zFpsvWHTBm3TAnq/2+q4WLZHpFOR8zGxGqPXesTn34mLtKGo8MImXVeyaNQW+yiuWI8nrEFe31MGCLuQjexmFFbz4uyfH1Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760563793; c=relaxed/simple;
	bh=Nkmo1RoC9dEgwJBIlTnvRz7B3zyertWUN6+Wcb6BTRw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XxRgG5nccjE50yvfieSa8akF41QRjK1gWUIeLWu5AD4Li9VhwttW+czFVdnTS14Q/RcS1j85i1sKqIEzW190gc6vlKJej1UEYuECDE6+8K6RFlM+no6hiHcjYRHbViqFEKJGLYgQUxhRriokk9GdfBQLgIySzJNkXwLxfEvlgVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EMb6AeVK; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EMb6AeVK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760563792; x=1792099792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nkmo1RoC9dEgwJBIlTnvRz7B3zyertWUN6+Wcb6BTRw=;
  b=EMb6AeVKjks/loygfTpk+BQ3zk0EthSnqV9//sg4cpl0Z7sAcJ+K4TuE
   E8SwURHGqBgHZGZJVnWxV5O68szW8Z7sMIt8D1jOGLAZ0MP8tCH2llgrJ
   Q8JEf4x59RjNdXjGMORtqKx1n3I+7rvr8O60L4DXCh1xPKzwZxVf6syOv
   p2wW6rwbNuvO8lEhXl91ILhcLtjZBzNTwiaOtnXaw1FeYUxi/ciHZ8PW3
   reUFdrRa4RK+m/6tq0FkvrPIm7SCoXpFtVos94+PWvjF+EFYJewRjmZii
   lYMh03euI/BtConluhE9b1hCbhmx324qmlszfe3IEIFpJxNRvPEPwdQrl
   g==;
X-CSE-ConnectionGUID: OIRg7AxzSOe8oTtrYhTyyQ==
X-CSE-MsgGUID: /e53bVNgQ0OorF+mmc8xhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="80190417"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="80190417"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 14:29:51 -0700
X-CSE-ConnectionGUID: dSsrKI4DT9i3XqTB4IMMEA==
X-CSE-MsgGUID: 3CgWN4CZQqyC0oB5lymRLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="182267178"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 15 Oct 2025 14:29:49 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9947-0004F9-0v;
	Wed, 15 Oct 2025 21:29:47 +0000
Date: Thu, 16 Oct 2025 05:29:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:master /575] fs/bcachefs/sb/io.c:238:23: error: call to
 undeclared function 'bio_inline_vecs'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202510160526.gaQGq4Nb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   bb35ade3e8bb7af67734b746f416598002822df8
commit: caffe5f36f39ef62d58383b77dfdce931104f8c2 [/575] bcachefs: Compatibility with v6.18
config: x86_64-buildonly-randconfig-001-20251016 (https://download.01.org/0day-ci/archive/20251016/202510160526.gaQGq4Nb-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510160526.gaQGq4Nb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510160526.gaQGq4Nb-lkp@intel.com/

Note: the bcachefs/master HEAD bb35ade3e8bb7af67734b746f416598002822df8 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> fs/bcachefs/sb/io.c:238:23: error: call to undeclared function 'bio_inline_vecs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     238 |                 bio_init(bio, NULL, bio_inline_vecs(bio), nr_bvecs, 0);
         |                                     ^
>> fs/bcachefs/sb/io.c:238:23: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct bio_vec *' [-Wint-conversion]
     238 |                 bio_init(bio, NULL, bio_inline_vecs(bio), nr_bvecs, 0);
         |                                     ^~~~~~~~~~~~~~~~~~~~
   include/linux/bio.h:406:75: note: passing argument to parameter 'table' here
     406 | void bio_init(struct bio *bio, struct block_device *bdev, struct bio_vec *table,
         |                                                                           ^
   2 errors generated.
--
>> fs/bcachefs/journal/read.c:1083:36: error: call to undeclared function 'bio_inline_vecs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1083 |                         bio_init(bio, ca->disk_sb.bdev, bio_inline_vecs(bio), nr_bvecs, REQ_OP_READ);
         |                                                         ^
>> fs/bcachefs/journal/read.c:1083:36: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct bio_vec *' [-Wint-conversion]
    1083 |                         bio_init(bio, ca->disk_sb.bdev, bio_inline_vecs(bio), nr_bvecs, REQ_OP_READ);
         |                                                         ^~~~~~~~~~~~~~~~~~~~
   include/linux/bio.h:406:75: note: passing argument to parameter 'table' here
     406 | void bio_init(struct bio *bio, struct block_device *bdev, struct bio_vec *table,
         |                                                                           ^
   2 errors generated.
--
>> fs/bcachefs/journal/init.c:543:36: error: call to undeclared function 'bio_inline_vecs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     543 |                 bio_init(&ja->bio[i]->bio, NULL, bio_inline_vecs(&ja->bio[i]->bio), nr_bvecs, 0);
         |                                                  ^
>> fs/bcachefs/journal/init.c:543:36: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct bio_vec *' [-Wint-conversion]
     543 |                 bio_init(&ja->bio[i]->bio, NULL, bio_inline_vecs(&ja->bio[i]->bio), nr_bvecs, 0);
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bio.h:406:75: note: passing argument to parameter 'table' here
     406 | void bio_init(struct bio *bio, struct block_device *bdev, struct bio_vec *table,
         |                                                                           ^
   2 errors generated.


vim +/bio_inline_vecs +238 fs/bcachefs/sb/io.c

   190	
   191	int bch2_sb_realloc(struct bch_sb_handle *sb, unsigned u64s)
   192	{
   193		size_t new_bytes = __vstruct_bytes(struct bch_sb, u64s);
   194		size_t new_buffer_size;
   195		struct bch_sb *new_sb;
   196		struct bio *bio;
   197	
   198		if (sb->bdev)
   199			new_bytes = max_t(size_t, new_bytes, bdev_logical_block_size(sb->bdev));
   200	
   201		new_buffer_size = roundup_pow_of_two(new_bytes);
   202	
   203		if (sb->sb && sb->buffer_size >= new_buffer_size)
   204			return 0;
   205	
   206		if (sb->sb && sb->have_layout) {
   207			u64 max_bytes = 512 << sb->sb->layout.sb_max_size_bits;
   208	
   209			if (new_bytes > max_bytes) {
   210				CLASS(printbuf, buf)();
   211	
   212				prt_bdevname(&buf, sb->bdev);
   213				prt_printf(&buf, ": superblock too big: want %zu but have %llu", new_bytes, max_bytes);
   214				pr_err("%s", buf.buf);
   215				return -BCH_ERR_ENOSPC_sb;
   216			}
   217		}
   218	
   219		if (sb->buffer_size >= new_buffer_size && sb->sb)
   220			return 0;
   221	
   222		if (dynamic_fault("bcachefs:add:super_realloc"))
   223			return -BCH_ERR_ENOMEM_sb_realloc_injected;
   224	
   225		new_sb = krealloc(sb->sb, new_buffer_size, GFP_NOFS|__GFP_ZERO);
   226		if (!new_sb)
   227			return -BCH_ERR_ENOMEM_sb_buf_realloc;
   228	
   229		sb->sb = new_sb;
   230	
   231		if (sb->have_bio) {
   232			unsigned nr_bvecs = buf_pages(sb->sb, new_buffer_size);
   233	
   234			bio = bio_kmalloc(nr_bvecs, GFP_KERNEL);
   235			if (!bio)
   236				return -BCH_ERR_ENOMEM_sb_bio_realloc;
   237	
 > 238			bio_init(bio, NULL, bio_inline_vecs(bio), nr_bvecs, 0);
   239	
   240			kfree(sb->bio);
   241			sb->bio = bio;
   242		}
   243	
   244		sb->buffer_size = new_buffer_size;
   245	
   246		return 0;
   247	}
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
