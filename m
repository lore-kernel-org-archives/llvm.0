Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB5136920F;
	Sat,  5 Sep 2026 01:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788570116; cv=none; b=eOV66hjcxmvL/16r6Zo1xX8UuQgmLl+4xQsK0DhPZRFrCIOUlVTGmMQDTzU7v/Aiz72pZUFwcpuQ5jJKrpbZSu9OK5L4azjLwQEz2PJP4xnYuhGDrZkRixJQ3R+PBCvowXyWBieFs2KEgWQ9xU1UzZmHcfVYDo4GVYlggcqP8EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788570116; c=relaxed/simple;
	bh=JbN0prdg6H6ZaBqJCc/Iv2Vf2bJ1Sd65GeTbNzgxIdo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HDet3FKbEneBqRYRaqe2EsyUJ1XlquHWsmXKrOrhKLjmAC9UjcM1EwBQ5CnXRqsfAX2xBwLwkeaq16AALtjxulYOyJrNXRA+aY0OmVChhghNiIsKZFGTW5iNPqQw7Uq8In8hsr5C0D4zk1VkY9/qHcUazzIuliFJNBkcHCpwVzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kpml+2cf; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kpml+2cf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788570112; x=1820106112;
  h=date:from:to:cc:subject:message-id;
  bh=JbN0prdg6H6ZaBqJCc/Iv2Vf2bJ1Sd65GeTbNzgxIdo=;
  b=Kpml+2cfkO0S3vAyS9nKYgeqcZJqiLiC0e4KrXsPyTb30LNAdcjyH9Mn
   ilNMN6avJXsqrA9n2OXa3kyyDa/meJkYmtkQnxJq84woCRp7NLGnSSdSJ
   DBI9DGn6uEGeoyGIWtUM5W79+jSUC29GABHexOx/UbtAVR1LlzzdWjS21
   8wXxZm5nRp8jcmj3+huhCjL90s3Pgn92n+TRi2vorDCuGDdHp+vNcBQaI
   x1c1JEhuPQOLPC7Te3smePvRXVN4oac2Eq/7zzF4hI1qR8o0wpe2A4QJG
   TPTTlJDk4Tpg5bXviimUPgQ/2LSOdGbpbIvLfb9JtvWCXMPmYIbsFlank
   Q==;
X-CSE-ConnectionGUID: BZWeWUnbSNmNGTXqBOKP5Q==
X-CSE-MsgGUID: mBUeL7GdRjWjBSzb/+aBtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="100593981"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="100593981"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 18:01:42 -0700
X-CSE-ConnectionGUID: rRq4Ah1kScGWSIJPl/0FUA==
X-CSE-MsgGUID: DatbMAZfTbiSN4YN28Bl+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="268872234"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Sep 2026 18:01:40 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2emo-00000000AZY-0wg5;
	Sat, 05 Sep 2026 01:01:38 +0000
Date: Sat, 05 Sep 2026 09:01:10 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 52/87] fs/ceph/inode.c:2492:6:
 warning: variable 'header' is used uninitialized whenever 'if' condition is
 true
Message-ID: <202609050828.0xehUxgg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   376ad9d4942bf11500931178bbeb965348f01057
commit: e52f99c9eea903bf2dc1fb18fae2bc0c49875445 [52/87] ceph: Convert ceph_mds_request::r_pagelist to a databuf
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260905/202609050828.0xehUxgg-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 0edd1b088cc36b4faee80358c925a91e16006258)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609050828.0xehUxgg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609050828.0xehUxgg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ceph/inode.c:2492:6: warning: variable 'header' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    2492 |         if (ret < 0)
         |             ^~~~~~~
   fs/ceph/inode.c:2552:15: note: uninitialized use occurs here
    2552 |         kunmap_local(header);
         |                      ^~~~~~
   fs/ceph/inode.c:2492:2: note: remove the 'if' if its condition is always false
    2492 |         if (ret < 0)
         |         ^~~~~~~~~~~~
    2493 |                 goto out;
         |                 ~~~~~~~~
   fs/ceph/inode.c:2484:6: warning: variable 'header' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    2484 |         if (ceph_bvecq_insert_frag(dbuf, 0, sizeof(*header), GFP_KERNEL) < 0 ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2485 |             ceph_bvecq_insert_frag(dbuf, 1, PAGE_SIZE, GFP_KERNEL) < 0)
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/inode.c:2552:15: note: uninitialized use occurs here
    2552 |         kunmap_local(header);
         |                      ^~~~~~
   fs/ceph/inode.c:2484:2: note: remove the 'if' if its condition is always false
    2484 |         if (ceph_bvecq_insert_frag(dbuf, 0, sizeof(*header), GFP_KERNEL) < 0 ||
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2485 |             ceph_bvecq_insert_frag(dbuf, 1, PAGE_SIZE, GFP_KERNEL) < 0)
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2486 |                 goto out;
         |                 ~~~~~~~~
>> fs/ceph/inode.c:2484:6: warning: variable 'header' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
    2484 |         if (ceph_bvecq_insert_frag(dbuf, 0, sizeof(*header), GFP_KERNEL) < 0 ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/inode.c:2552:15: note: uninitialized use occurs here
    2552 |         kunmap_local(header);
         |                      ^~~~~~
   fs/ceph/inode.c:2484:6: note: remove the '||' if its condition is always false
    2484 |         if (ceph_bvecq_insert_frag(dbuf, 0, sizeof(*header), GFP_KERNEL) < 0 ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/inode.c:2481:6: warning: variable 'header' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    2481 |         if (!dbuf)
         |             ^~~~~
   fs/ceph/inode.c:2552:15: note: uninitialized use occurs here
    2552 |         kunmap_local(header);
         |                      ^~~~~~
   fs/ceph/inode.c:2481:2: note: remove the 'if' if its condition is always false
    2481 |         if (!dbuf)
         |         ^~~~~~~~~~
    2482 |                 goto out;
         |                 ~~~~~~~~
   fs/ceph/inode.c:2475:7: warning: variable 'header' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    2475 |                 if (ret < 0)
         |                     ^~~~~~~
   fs/ceph/inode.c:2552:15: note: uninitialized use occurs here
    2552 |         kunmap_local(header);
         |                      ^~~~~~
   fs/ceph/inode.c:2475:3: note: remove the 'if' if its condition is always false
    2475 |                 if (ret < 0)
         |                 ^~~~~~~~~~~~
    2476 |                         goto out;
         |                         ~~~~~~~~
   fs/ceph/inode.c:2451:50: note: initialize the variable 'header' to silence this warning
    2451 |         struct ceph_fscrypt_truncate_size_header *header;
         |                                                         ^
         |                                                          = NULL
   5 warnings generated.


vim +2492 fs/ceph/inode.c

79f2f6ad878c1f Jeff Layton   2020-09-03  2431  
5c64737d253683 Xiubo Li      2022-08-25  2432  /*
5c64737d253683 Xiubo Li      2022-08-25  2433   * Transfer the encrypted last block to the MDS and the MDS
5c64737d253683 Xiubo Li      2022-08-25  2434   * will help update it when truncating a smaller size.
5c64737d253683 Xiubo Li      2022-08-25  2435   *
5c64737d253683 Xiubo Li      2022-08-25  2436   * We don't support a PAGE_SIZE that is smaller than the
5c64737d253683 Xiubo Li      2022-08-25  2437   * CEPH_FSCRYPT_BLOCK_SIZE.
5c64737d253683 Xiubo Li      2022-08-25  2438   */
5c64737d253683 Xiubo Li      2022-08-25  2439  static int fill_fscrypt_truncate(struct inode *inode,
5c64737d253683 Xiubo Li      2022-08-25  2440  				 struct ceph_mds_request *req,
5c64737d253683 Xiubo Li      2022-08-25  2441  				 struct iattr *attr)
5c64737d253683 Xiubo Li      2022-08-25  2442  {
38d46409c4639a Xiubo Li      2023-06-12  2443  	struct ceph_client *cl = ceph_inode_to_client(inode);
5c64737d253683 Xiubo Li      2022-08-25  2444  	struct ceph_inode_info *ci = ceph_inode(inode);
5c64737d253683 Xiubo Li      2022-08-25  2445  	int boff = attr->ia_size % CEPH_FSCRYPT_BLOCK_SIZE;
5c64737d253683 Xiubo Li      2022-08-25  2446  	loff_t pos, orig_pos = round_down(attr->ia_size,
5c64737d253683 Xiubo Li      2022-08-25  2447  					  CEPH_FSCRYPT_BLOCK_SIZE);
5c64737d253683 Xiubo Li      2022-08-25  2448  	u64 block = orig_pos >> CEPH_FSCRYPT_BLOCK_SHIFT;
e52f99c9eea903 David Howells 2023-08-03  2449  	struct bvecq *dbuf = NULL;
5c64737d253683 Xiubo Li      2022-08-25  2450  	struct iov_iter iter;
e52f99c9eea903 David Howells 2023-08-03  2451  	struct ceph_fscrypt_truncate_size_header *header;
e52f99c9eea903 David Howells 2023-08-03  2452  	void *p;
5c64737d253683 Xiubo Li      2022-08-25  2453  	int retry_op = 0;
5c64737d253683 Xiubo Li      2022-08-25  2454  	int len = CEPH_FSCRYPT_BLOCK_SIZE;
5c64737d253683 Xiubo Li      2022-08-25  2455  	loff_t i_size = i_size_read(inode);
5c64737d253683 Xiubo Li      2022-08-25  2456  	int got, ret, issued;
5c64737d253683 Xiubo Li      2022-08-25  2457  	u64 objver;
5c64737d253683 Xiubo Li      2022-08-25  2458  
5c64737d253683 Xiubo Li      2022-08-25  2459  	ret = __ceph_get_caps(inode, NULL, CEPH_CAP_FILE_RD, 0, -1, &got);
5c64737d253683 Xiubo Li      2022-08-25  2460  	if (ret < 0)
5c64737d253683 Xiubo Li      2022-08-25  2461  		return ret;
5c64737d253683 Xiubo Li      2022-08-25  2462  
5c64737d253683 Xiubo Li      2022-08-25  2463  	issued = __ceph_caps_issued(ci, NULL);
5c64737d253683 Xiubo Li      2022-08-25  2464  
38d46409c4639a Xiubo Li      2023-06-12  2465  	doutc(cl, "size %lld -> %lld got cap refs on %s, issued %s\n",
5c64737d253683 Xiubo Li      2022-08-25  2466  	      i_size, attr->ia_size, ceph_cap_string(got),
5c64737d253683 Xiubo Li      2022-08-25  2467  	      ceph_cap_string(issued));
5c64737d253683 Xiubo Li      2022-08-25  2468  
5c64737d253683 Xiubo Li      2022-08-25  2469  	/* Try to writeback the dirty pagecaches */
5c64737d253683 Xiubo Li      2022-08-25  2470  	if (issued & (CEPH_CAP_FILE_BUFFER)) {
f452a2204614fc David Howells 2025-03-12  2471  		loff_t lend = orig_pos + CEPH_FSCRYPT_BLOCK_SIZE - 1;
5c64737d253683 Xiubo Li      2022-08-25  2472  
5c64737d253683 Xiubo Li      2022-08-25  2473  		ret = filemap_write_and_wait_range(inode->i_mapping,
5c64737d253683 Xiubo Li      2022-08-25  2474  						   orig_pos, lend);
5c64737d253683 Xiubo Li      2022-08-25  2475  		if (ret < 0)
5c64737d253683 Xiubo Li      2022-08-25  2476  			goto out;
5c64737d253683 Xiubo Li      2022-08-25  2477  	}
5c64737d253683 Xiubo Li      2022-08-25  2478  
5c64737d253683 Xiubo Li      2022-08-25  2479  	ret = -ENOMEM;
e52f99c9eea903 David Howells 2023-08-03  2480  	dbuf = bvecq_alloc_chain(2, GFP_KERNEL, false);
e52f99c9eea903 David Howells 2023-08-03  2481  	if (!dbuf)
5c64737d253683 Xiubo Li      2022-08-25  2482  		goto out;
5c64737d253683 Xiubo Li      2022-08-25  2483  
e52f99c9eea903 David Howells 2023-08-03 @2484  	if (ceph_bvecq_insert_frag(dbuf, 0, sizeof(*header), GFP_KERNEL) < 0 ||
e52f99c9eea903 David Howells 2023-08-03  2485  	    ceph_bvecq_insert_frag(dbuf, 1, PAGE_SIZE, GFP_KERNEL) < 0)
5c64737d253683 Xiubo Li      2022-08-25  2486  		goto out;
5c64737d253683 Xiubo Li      2022-08-25  2487  
e52f99c9eea903 David Howells 2023-08-03  2488  	iov_iter_bvec_queue(&iter, ITER_DEST, dbuf, 1, 0, len);
5c64737d253683 Xiubo Li      2022-08-25  2489  
5c64737d253683 Xiubo Li      2022-08-25  2490  	pos = orig_pos;
5c64737d253683 Xiubo Li      2022-08-25  2491  	ret = __ceph_sync_read(inode, &pos, &iter, &retry_op, &objver);
5c64737d253683 Xiubo Li      2022-08-25 @2492  	if (ret < 0)
5c64737d253683 Xiubo Li      2022-08-25  2493  		goto out;
5c64737d253683 Xiubo Li      2022-08-25  2494  
e52f99c9eea903 David Howells 2023-08-03  2495  	header = kmap_local_bvecq(dbuf, 0);
e52f99c9eea903 David Howells 2023-08-03  2496  
5c64737d253683 Xiubo Li      2022-08-25  2497  	/* Insert the header first */
e52f99c9eea903 David Howells 2023-08-03  2498  	header->ver = 1;
e52f99c9eea903 David Howells 2023-08-03  2499  	header->compat = 1;
e52f99c9eea903 David Howells 2023-08-03  2500  	header->change_attr = cpu_to_le64(inode_peek_iversion_raw(inode));
5c64737d253683 Xiubo Li      2022-08-25  2501  
5c64737d253683 Xiubo Li      2022-08-25  2502  	/*
5c64737d253683 Xiubo Li      2022-08-25  2503  	 * Always set the block_size to CEPH_FSCRYPT_BLOCK_SIZE,
5c64737d253683 Xiubo Li      2022-08-25  2504  	 * because in MDS it may need this to do the truncate.
5c64737d253683 Xiubo Li      2022-08-25  2505  	 */
e52f99c9eea903 David Howells 2023-08-03  2506  	header->block_size = cpu_to_le32(CEPH_FSCRYPT_BLOCK_SIZE);
5c64737d253683 Xiubo Li      2022-08-25  2507  
5c64737d253683 Xiubo Li      2022-08-25  2508  	/*
5c64737d253683 Xiubo Li      2022-08-25  2509  	 * If we hit a hole here, we should just skip filling
5c64737d253683 Xiubo Li      2022-08-25  2510  	 * the fscrypt for the request, because once the fscrypt
5c64737d253683 Xiubo Li      2022-08-25  2511  	 * is enabled, the file will be split into many blocks
5c64737d253683 Xiubo Li      2022-08-25  2512  	 * with the size of CEPH_FSCRYPT_BLOCK_SIZE, if there
5c64737d253683 Xiubo Li      2022-08-25  2513  	 * has a hole, the hole size should be multiple of block
5c64737d253683 Xiubo Li      2022-08-25  2514  	 * size.
5c64737d253683 Xiubo Li      2022-08-25  2515  	 *
5c64737d253683 Xiubo Li      2022-08-25  2516  	 * If the Rados object doesn't exist, it will be set to 0.
5c64737d253683 Xiubo Li      2022-08-25  2517  	 */
5c64737d253683 Xiubo Li      2022-08-25  2518  	if (!objver) {
38d46409c4639a Xiubo Li      2023-06-12  2519  		doutc(cl, "hit hole, ppos %lld < size %lld\n", pos, i_size);
5c64737d253683 Xiubo Li      2022-08-25  2520  
e52f99c9eea903 David Howells 2023-08-03  2521  		header->data_len = cpu_to_le32(8 + 8 + 4);
e52f99c9eea903 David Howells 2023-08-03  2522  		header->file_offset = 0;
5c64737d253683 Xiubo Li      2022-08-25  2523  		ret = 0;
5c64737d253683 Xiubo Li      2022-08-25  2524  	} else {
e52f99c9eea903 David Howells 2023-08-03  2525  		header->data_len = cpu_to_le32(8 + 8 + 4 + CEPH_FSCRYPT_BLOCK_SIZE);
e52f99c9eea903 David Howells 2023-08-03  2526  		header->file_offset = cpu_to_le64(orig_pos);
5c64737d253683 Xiubo Li      2022-08-25  2527  
38d46409c4639a Xiubo Li      2023-06-12  2528  		doutc(cl, "encrypt block boff/bsize %d/%lu\n", boff,
38d46409c4639a Xiubo Li      2023-06-12  2529  		      CEPH_FSCRYPT_BLOCK_SIZE);
295fc4aa7de4b7 Xiubo Li      2023-03-06  2530  
5c64737d253683 Xiubo Li      2022-08-25  2531  		/* truncate and zero out the extra contents for the last block */
e52f99c9eea903 David Howells 2023-08-03  2532  		p = kmap_local_bvecq(dbuf, 1);
e52f99c9eea903 David Howells 2023-08-03  2533  		memset(p + boff, 0, PAGE_SIZE - boff);
e52f99c9eea903 David Howells 2023-08-03  2534  		kunmap_local(p);
5c64737d253683 Xiubo Li      2022-08-25  2535  
5c64737d253683 Xiubo Li      2022-08-25  2536  		/* encrypt the last block */
e52f99c9eea903 David Howells 2023-08-03  2537  		ret = ceph_fscrypt_encrypt_block_inplace(inode, dbuf->bv[0].bv_page,
5c64737d253683 Xiubo Li      2022-08-25  2538  							 CEPH_FSCRYPT_BLOCK_SIZE,
fa65058063cbab Eric Biggers  2025-07-09  2539  							 0, block);
5c64737d253683 Xiubo Li      2022-08-25  2540  		if (ret)
5c64737d253683 Xiubo Li      2022-08-25  2541  			goto out;
5c64737d253683 Xiubo Li      2022-08-25  2542  	}
5c64737d253683 Xiubo Li      2022-08-25  2543  
e52f99c9eea903 David Howells 2023-08-03  2544  	req->r_dbuf = dbuf;
e52f99c9eea903 David Howells 2023-08-03  2545  	req->r_dbuf_len = sizeof(*header);
e52f99c9eea903 David Howells 2023-08-03  2546  	if (header->block_size)
e52f99c9eea903 David Howells 2023-08-03  2547  		req->r_dbuf_len += CEPH_FSCRYPT_BLOCK_SIZE;
5c64737d253683 Xiubo Li      2022-08-25  2548  out:
38d46409c4639a Xiubo Li      2023-06-12  2549  	doutc(cl, "%p %llx.%llx size dropping cap refs on %s\n", inode,
38d46409c4639a Xiubo Li      2023-06-12  2550  	      ceph_vinop(inode), ceph_cap_string(got));
5c64737d253683 Xiubo Li      2022-08-25  2551  	ceph_put_cap_refs(ci, got);
e52f99c9eea903 David Howells 2023-08-03  2552  	kunmap_local(header);
e52f99c9eea903 David Howells 2023-08-03  2553  	if (ret)
e52f99c9eea903 David Howells 2023-08-03  2554  		bvecq_put(dbuf);
5c64737d253683 Xiubo Li      2022-08-25  2555  	return ret;
5c64737d253683 Xiubo Li      2022-08-25  2556  }
5c64737d253683 Xiubo Li      2022-08-25  2557  

:::::: The code at line 2492 was first introduced by commit
:::::: 5c64737d253683b7d138dde0da513a9ade16a170 ceph: add truncate size handling support for fscrypt

:::::: TO: Xiubo Li <xiubli@redhat.com>
:::::: CC: Ilya Dryomov <idryomov@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
