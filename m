Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31E315698B;
	Mon, 15 Apr 2024 21:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713215284; cv=none; b=IcLodz7bRR35c/z/uQ1Lm1f0vA+rWyWI4yh8jVLAYecg31e3gKYIo07vkZyM6lWEFMl8LmrGyrKbzVz9qAN2W5GRZdJNTGsp/XDpabw/kG4iFcHEpcIaBjtcB5d5+3XwgPBDKpTGkZ6XgF3W7yKIBuSVyoYKCYaen8uFQCrKB4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713215284; c=relaxed/simple;
	bh=sGUaLQNiHaIuJBqy0evj/F00yQC9Asyibds83hQ2UcE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qs6oEdkrrLwvCsVGwT8Wosj7ivjS/PQ8y3JZyALelF5AR6gIm3g00jXk5PMMFttjvxafMwyHkATLh7vMAU8ZzJLIh7En2hMRRIrigvs2NiizbeC3N9Dl590aFNQvYkz37QeeERMn9w959gQ/daCGuguZ6+JR/vOVRHDPQgun9M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XrpIZDB1; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XrpIZDB1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713215282; x=1744751282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sGUaLQNiHaIuJBqy0evj/F00yQC9Asyibds83hQ2UcE=;
  b=XrpIZDB16iLgEqxIAJHPhxL1Rbz+jS7OytsWyWKeNNdfUFs0Uch9BsDu
   xxRKUgIu2wMw1nzZ3+XXepM9Ha7jmKW+e28bBxI7ljEShxS9laPZNFRO8
   3Tgd+xk1ERwKOGthkAEQ8rXvH96LhHL7v8jpIMgqhV18R9cw6eS0OwiBR
   p1LTK/lAytH3NJxo5Iql/mQoH35BO9ZTFhLoZnH8Y7NUc5r++0HVMM4QW
   0ECUnD9DZhU0AbkqeOTMWbWSiBhkoCIjuY7AbYszHItXSbmd7X8lYXcnP
   vtriUsgxYVOQhRuBh9VEf9VUiwzYrZuG95euyr4t9mbkX4fpxqnxWuROm
   Q==;
X-CSE-ConnectionGUID: z0nBpA8eSnS/ekX/+ve83g==
X-CSE-MsgGUID: PTGxkemBRV6QfVD58wgbrg==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="12404593"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="12404593"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 14:07:59 -0700
X-CSE-ConnectionGUID: tUSD01c8SSSQYe2bWFzt7Q==
X-CSE-MsgGUID: FnVSQ6eoTyWD0o398n9dJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="26834183"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 15 Apr 2024 14:07:57 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwTYQ-0004eW-2V;
	Mon, 15 Apr 2024 21:07:54 +0000
Date: Tue, 16 Apr 2024 05:07:02 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-mb-sha256 18/20] drivers/md/dm-verity-target.c:803:9:
 warning: variable 'r' is used uninitialized whenever 'if' condition is true
Message-ID: <202404160522.eOqRu05e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-mb-sha256
head:   7b88a871fae1c10ec0b6bc1ff1ac064550e9347a
commit: 91c6d0dda4eecd7baf73048993b1fb8ed1448138 [18/20] dm-verity: improve performance by using multibuffer hashing
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240416/202404160522.eOqRu05e-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404160522.eOqRu05e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404160522.eOqRu05e-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/md/dm-verity-target.c:16:
   In file included from drivers/md/dm-verity.h:14:
   In file included from include/linux/dm-io.h:17:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/md/dm-verity-target.c:22:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/md/dm-verity-target.c:22:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/md/dm-verity-target.c:22:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/md/dm-verity-target.c:803:9: warning: variable 'r' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     803 |                                 if (unlikely(r))
         |                                     ^~~~~~~~~~~
   include/linux/compiler.h:77:22: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-verity-target.c:842:9: note: uninitialized use occurs here
     842 |         return r;
         |                ^
   drivers/md/dm-verity-target.c:803:5: note: remove the 'if' if its condition is always false
     803 |                                 if (unlikely(r))
         |                                 ^~~~~~~~~~~~~~~~
     804 |                                         goto error;
         |                                         ~~~~~~~~~~
   drivers/md/dm-verity-target.c:798:9: warning: variable 'r' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     798 |                                 if (unlikely(r))
         |                                     ^~~~~~~~~~~
   include/linux/compiler.h:77:22: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-verity-target.c:842:9: note: uninitialized use occurs here
     842 |         return r;
         |                ^
   drivers/md/dm-verity-target.c:798:5: note: remove the 'if' if its condition is always false
     798 |                                 if (unlikely(r))
         |                                 ^~~~~~~~~~~~~~~~
     799 |                                         goto hash_error;
         |                                         ~~~~~~~~~~~~~~~
   drivers/md/dm-verity-target.c:780:10: warning: variable 'r' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     780 |                                         if (unlikely(r))
         |                                             ^~~~~~~~~~~
   include/linux/compiler.h:77:22: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-verity-target.c:842:9: note: uninitialized use occurs here
     842 |         return r;
         |                ^
   drivers/md/dm-verity-target.c:780:6: note: remove the 'if' if its condition is always false
     780 |                                         if (unlikely(r))
         |                                         ^~~~~~~~~~~~~~~~
     781 |                                                 goto error;
         |                                                 ~~~~~~~~~~
   drivers/md/dm-verity-target.c:772:10: warning: variable 'r' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     772 |                                         if (unlikely(r))
         |                                             ^~~~~~~~~~~
   include/linux/compiler.h:77:22: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-verity-target.c:842:9: note: uninitialized use occurs here
     842 |         return r;
         |                ^
   drivers/md/dm-verity-target.c:772:6: note: remove the 'if' if its condition is always false
     772 |                                         if (unlikely(r))
         |                                         ^~~~~~~~~~~~~~~~
     773 |                                                 goto error;
         |                                                 ~~~~~~~~~~
   drivers/md/dm-verity-target.c:764:10: warning: variable 'r' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     764 |                                         if (unlikely(r))
         |                                             ^~~~~~~~~~~
   include/linux/compiler.h:77:22: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-verity-target.c:842:9: note: uninitialized use occurs here
     842 |         return r;
         |                ^
   drivers/md/dm-verity-target.c:764:6: note: remove the 'if' if its condition is always false
     764 |                                         if (unlikely(r))
         |                                         ^~~~~~~~~~~~~~~~
     765 |                                                 goto hash_error;
         |                                                 ~~~~~~~~~~~~~~~
   drivers/md/dm-verity-target.c:733:8: warning: variable 'r' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     733 |                         if (unlikely(bv.bv_len < block_size)) {
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:22: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-verity-target.c:842:9: note: uninitialized use occurs here
     842 |         return r;
         |                ^
   drivers/md/dm-verity-target.c:733:4: note: remove the 'if' if its condition is always false
     733 |                         if (unlikely(bv.bv_len < block_size)) {
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     734 |                                 /*
         |                                 ~~
     735 |                                  * Data block spans pages.  This should not
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     736 |                                  * happen, since this code path is not used if
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     737 |                                  * the data block size is greater than the page
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     738 |                                  * size, and all I/O should be data block
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     739 |                                  * aligned because dm-verity sets
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     740 |                                  * logical_block_size to the data block size.
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     741 |                                  */
         |                                  ~~
     742 |                                 DMERR_LIMIT("unaligned io (data block spans pages)");
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     743 |                                 r = -EIO;


vim +803 drivers/md/dm-verity-target.c

   638	
   639	/*
   640	 * Verify one "dm_verity_io" structure.
   641	 */
   642	static int verity_verify_io(struct dm_verity_io *io)
   643	{
   644		struct dm_verity *v = io->v;
   645		const unsigned int block_size = 1 << v->data_dev_block_bits;
   646		struct bio *bio = dm_bio_from_per_bio_data(io, v->ti->per_io_data_size);
   647		u8 want_digest[HASH_MAX_DIGESTSIZE];
   648		u8 real_digest[HASH_MAX_DIGESTSIZE];
   649		struct bvec_iter start;
   650		struct bvec_iter iter_copy;
   651		struct bvec_iter *iter;
   652		/*
   653		 * The pending_* variables are used when the selected hash algorithm
   654		 * supports multibuffer hashing.  They're used to temporarily store the
   655		 * virtual address and position of a mapped data block that needs to be
   656		 * verified.  If we then see another data block, we hash the two blocks
   657		 * simultaneously using the fast multibuffer hashing method.
   658		 */
   659		const void *pending_data = NULL;
   660		sector_t pending_blkno;
   661		struct bvec_iter pending_start;
   662		u8 pending_want_digest[HASH_MAX_DIGESTSIZE];
   663		u8 pending_real_digest[HASH_MAX_DIGESTSIZE];
   664		unsigned int b;
   665		int r;
   666	
   667		if (static_branch_unlikely(&use_bh_wq_enabled) && io->in_bh) {
   668			/*
   669			 * Copy the iterator in case we need to restart
   670			 * verification in a work-queue.
   671			 */
   672			iter_copy = io->iter;
   673			iter = &iter_copy;
   674		} else
   675			iter = &io->iter;
   676	
   677		for (b = 0; b < io->n_blocks; b++) {
   678			int r;
   679			sector_t blkno = io->block + b;
   680			bool is_zero;
   681	
   682			if (v->validated_blocks && bio->bi_status == BLK_STS_OK &&
   683			    likely(test_bit(blkno, v->validated_blocks))) {
   684				verity_bv_skip_block(v, io, iter);
   685				continue;
   686			}
   687	
   688			r = verity_hash_for_block(v, io, blkno, want_digest, &is_zero);
   689			if (unlikely(r < 0))
   690				goto error;
   691	
   692			if (is_zero) {
   693				/*
   694				 * If we expect a zero block, don't validate, just
   695				 * return zeros.
   696				 */
   697				r = verity_for_bv_block(v, io, iter,
   698							verity_bv_zero);
   699				if (unlikely(r < 0))
   700					goto error;
   701	
   702				continue;
   703			}
   704	
   705			start = *iter;
   706			if (static_branch_unlikely(&ahash_enabled) && !v->shash_tfm) {
   707				/* Hash and verify one data block using ahash. */
   708				struct ahash_request *req = verity_io_hash_req(v, io);
   709				struct crypto_wait wait;
   710	
   711				r = verity_ahash_init(v, req, &wait, !io->in_bh);
   712				if (unlikely(r))
   713					goto hash_error;
   714	
   715				r = verity_ahash_update_block(v, io, iter, &wait);
   716				if (unlikely(r))
   717					goto hash_error;
   718	
   719				r = verity_ahash_final(v, req, real_digest, &wait);
   720				if (unlikely(r))
   721					goto hash_error;
   722	
   723				r = verity_check_data_block_hash(v, io, bio, &start,
   724								 blkno, real_digest,
   725								 want_digest);
   726				if (unlikely(r))
   727					goto error;
   728			} else {
   729				struct shash_desc *desc = verity_io_hash_req(v, io);
   730				struct bio_vec bv = bio_iter_iovec(bio, *iter);
   731				const void *data;
   732	
   733				if (unlikely(bv.bv_len < block_size)) {
   734					/*
   735					 * Data block spans pages.  This should not
   736					 * happen, since this code path is not used if
   737					 * the data block size is greater than the page
   738					 * size, and all I/O should be data block
   739					 * aligned because dm-verity sets
   740					 * logical_block_size to the data block size.
   741					 */
   742					DMERR_LIMIT("unaligned io (data block spans pages)");
   743					r = -EIO;
   744					goto error;
   745				}
   746	
   747				data = bvec_kmap_local(&bv);
   748	
   749				if (v->use_finup2x) {
   750					if (pending_data) {
   751						/* Hash and verify two data blocks. */
   752						desc->tfm = v->shash_tfm;
   753						r = crypto_shash_import(desc,
   754									v->initial_hashstate) ?:
   755						    crypto_shash_finup2x(desc,
   756									 pending_data,
   757									 data,
   758									 block_size,
   759									 pending_real_digest,
   760									 real_digest);
   761						kunmap_local(data);
   762						kunmap_local(pending_data);
   763						pending_data = NULL;
   764						if (unlikely(r))
   765							goto hash_error;
   766						r = verity_check_data_block_hash(
   767								v, io, bio,
   768								&pending_start,
   769								pending_blkno,
   770								pending_real_digest,
   771								pending_want_digest);
   772						if (unlikely(r))
   773							goto error;
   774						r = verity_check_data_block_hash(
   775								v, io, bio,
   776								&start,
   777								blkno,
   778								real_digest,
   779								want_digest);
   780						if (unlikely(r))
   781							goto error;
   782					} else {
   783						/* Wait and see if there's another block. */
   784						pending_data = data;
   785						pending_blkno = blkno;
   786						pending_start = start;
   787						memcpy(pending_want_digest, want_digest,
   788						       v->digest_size);
   789					}
   790				} else {
   791					/* Hash and verify one data block. */
   792					desc->tfm = v->shash_tfm;
   793					r = crypto_shash_import(desc,
   794								v->initial_hashstate) ?:
   795					    crypto_shash_finup(desc, data, block_size,
   796							       real_digest);
   797					kunmap_local(data);
   798					if (unlikely(r))
   799						goto hash_error;
   800					r = verity_check_data_block_hash(
   801							v, io, bio, &start, blkno,
   802							real_digest, want_digest);
 > 803					if (unlikely(r))
   804						goto error;
   805				}
   806	
   807				bio_advance_iter(bio, iter, block_size);
   808			}
   809		}
   810	
   811		if (pending_data) {
   812			/*
   813			 * Multibuffer hashing is enabled but there was an odd number of
   814			 * data blocks.  Hash and verify the last block by itself.
   815			 */
   816			struct shash_desc *desc = verity_io_hash_req(v, io);
   817	
   818			desc->tfm = v->shash_tfm;
   819			r = crypto_shash_import(desc, v->initial_hashstate) ?:
   820			    crypto_shash_finup(desc, pending_data, block_size,
   821					       pending_real_digest);
   822			kunmap_local(pending_data);
   823			pending_data = NULL;
   824			if (unlikely(r))
   825				goto hash_error;
   826			r = verity_check_data_block_hash(v, io, bio,
   827							 &pending_start,
   828							 pending_blkno,
   829							 pending_real_digest,
   830							 pending_want_digest);
   831			if (unlikely(r))
   832				goto error;
   833		}
   834	
   835		return 0;
   836	
   837	hash_error:
   838		DMERR("Error hashing block from bio iter: %d", r);
   839	error:
   840		if (pending_data)
   841			kunmap_local(pending_data);
   842		return r;
   843	}
   844	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
