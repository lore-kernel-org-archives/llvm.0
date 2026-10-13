Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7732A36B937;
	Tue, 13 Oct 2026 04:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791865015; cv=none; b=WHYsUwJUrjH/mtUal2iiQv5FAVmTemwxl3Sq81oEcRLLR8hJe0dduWXtWwCp8GXUhkEcbLRP/DiQrOBOYBlyq2SEDe61SrRjb7Mjan5s0D5RE1aQQ7yVHg88kehZ7udm3YrZYKtuVIew727lK1/3cajwgVzDy8i6dqSD4xlAh4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791865015; c=relaxed/simple;
	bh=UNuQ1wXXaCTD5Rsn3HvAQr3+kIfCr35r/HmqEF0zOfc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ljdjTxAkljDCCWmEdAqkAcztu9PuTWiYpZnRIkt+Vrxk6uuxumunTmG6ygEqddlitmKLNwYT06pfFGRzg3Cb1qPdqggE+U67zmlZGmz17nG0uPw9dCjikwHQKKypGFISGbPQ1BpS9KneK+oUMCF7bf9vzGQzPId9HDqJw2hhHxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GcSDIKUI; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GcSDIKUI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791865012; x=1823401012;
  h=date:from:to:cc:subject:message-id;
  bh=UNuQ1wXXaCTD5Rsn3HvAQr3+kIfCr35r/HmqEF0zOfc=;
  b=GcSDIKUInFjegRJJbY4Tocj9FbtdylZ4v0ODZLP4F0Js5627Opp/14gb
   5gZ1w9LTiiMe6OuB4i3ygT5tpR9qIIxQhujk+0Y00vjrKCAOWbfJPhMrl
   dvsPCuNGQ1FMjHSbwLtvIH3qKReqctpFplHVHgW5w1j4sXDgYn5Uo4nBA
   NhMzU7EcZqmZe6il3tIi2brETMSP896bySYdkrATnnw69vogsY87tdML1
   e4m84yB04TqIoM9yRf/Q7OoLpYe7lh2u6X3+GsKzAkZ8Eu/S+7fMPC30a
   OQ3nPoH6AJf20gOXCirDZwZbc+aaJFWZ4K/L3AIU4WeJEmXFVgunk3kiP
   Q==;
X-CSE-ConnectionGUID: epmgLjTlRpyHTGkDK+IPJQ==
X-CSE-MsgGUID: l2YBvQKFQyu2V4YEZCHkXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="481248"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="481248"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 21:16:50 -0700
X-CSE-ConnectionGUID: jmfBzqeVShe/HfUlbUqYNw==
X-CSE-MsgGUID: XO3n+n7HQJaLj3mVmEh2jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="989711"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Oct 2026 21:16:48 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGTwU-00000000CWG-2FGP;
	Tue, 13 Oct 2026 04:16:46 +0000
Date: Tue, 13 Oct 2026 12:16:25 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 33/68] fs/ceph/inode.c:2493:6:
 warning: variable 'header' is used uninitialized whenever 'if' condition is
 true
Message-ID: <202610131232.qyd8a6E3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   c67464ec28da31de31fe4358eb13c2771a280cb7
commit: b30563b69a83b543a31e61c7c1624c9b4f69f088 [33/68] ceph: Convert ceph_mds_request::r_pagelist to a databuf
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20261013/202610131232.qyd8a6E3-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6719b9e31d6a93099612c474eec76d9f41d0275a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610131232.qyd8a6E3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610131232.qyd8a6E3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ceph/inode.c:2493:6: warning: variable 'header' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    2493 |         if (ret < 0)
         |             ^~~~~~~
   fs/ceph/inode.c:2553:15: note: uninitialized use occurs here
    2553 |         kunmap_local(header);
         |                      ^~~~~~
   fs/ceph/inode.c:2493:2: note: remove the 'if' if its condition is always false
    2493 |         if (ret < 0)
         |         ^~~~~~~~~~~~
    2494 |                 goto out;
         |                 ~~~~~~~~
   fs/ceph/inode.c:2485:6: warning: variable 'header' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    2485 |         if (ceph_bvecq_insert_frag(dbuf, 0, sizeof(*header), GFP_KERNEL) < 0 ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2486 |             ceph_bvecq_insert_frag(dbuf, 1, PAGE_SIZE, GFP_KERNEL) < 0)
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/inode.c:2553:15: note: uninitialized use occurs here
    2553 |         kunmap_local(header);
         |                      ^~~~~~
   fs/ceph/inode.c:2485:2: note: remove the 'if' if its condition is always false
    2485 |         if (ceph_bvecq_insert_frag(dbuf, 0, sizeof(*header), GFP_KERNEL) < 0 ||
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2486 |             ceph_bvecq_insert_frag(dbuf, 1, PAGE_SIZE, GFP_KERNEL) < 0)
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2487 |                 goto out;
         |                 ~~~~~~~~
>> fs/ceph/inode.c:2485:6: warning: variable 'header' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
    2485 |         if (ceph_bvecq_insert_frag(dbuf, 0, sizeof(*header), GFP_KERNEL) < 0 ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/inode.c:2553:15: note: uninitialized use occurs here
    2553 |         kunmap_local(header);
         |                      ^~~~~~
   fs/ceph/inode.c:2485:6: note: remove the '||' if its condition is always false
    2485 |         if (ceph_bvecq_insert_frag(dbuf, 0, sizeof(*header), GFP_KERNEL) < 0 ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/inode.c:2482:6: warning: variable 'header' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    2482 |         if (!dbuf)
         |             ^~~~~
   fs/ceph/inode.c:2553:15: note: uninitialized use occurs here
    2553 |         kunmap_local(header);
         |                      ^~~~~~
   fs/ceph/inode.c:2482:2: note: remove the 'if' if its condition is always false
    2482 |         if (!dbuf)
         |         ^~~~~~~~~~
    2483 |                 goto out;
         |                 ~~~~~~~~
   fs/ceph/inode.c:2476:7: warning: variable 'header' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    2476 |                 if (ret < 0)
         |                     ^~~~~~~
   fs/ceph/inode.c:2553:15: note: uninitialized use occurs here
    2553 |         kunmap_local(header);
         |                      ^~~~~~
   fs/ceph/inode.c:2476:3: note: remove the 'if' if its condition is always false
    2476 |                 if (ret < 0)
         |                 ^~~~~~~~~~~~
    2477 |                         goto out;
         |                         ~~~~~~~~
   fs/ceph/inode.c:2452:50: note: initialize the variable 'header' to silence this warning
    2452 |         struct ceph_fscrypt_truncate_size_header *header;
         |                                                         ^
         |                                                          = NULL
   5 warnings generated.


vim +2493 fs/ceph/inode.c

79f2f6ad878c1f2 Jeff Layton   2020-09-03  2432  
5c64737d253683b Xiubo Li      2022-08-25  2433  /*
5c64737d253683b Xiubo Li      2022-08-25  2434   * Transfer the encrypted last block to the MDS and the MDS
5c64737d253683b Xiubo Li      2022-08-25  2435   * will help update it when truncating a smaller size.
5c64737d253683b Xiubo Li      2022-08-25  2436   *
5c64737d253683b Xiubo Li      2022-08-25  2437   * We don't support a PAGE_SIZE that is smaller than the
5c64737d253683b Xiubo Li      2022-08-25  2438   * CEPH_FSCRYPT_BLOCK_SIZE.
5c64737d253683b Xiubo Li      2022-08-25  2439   */
5c64737d253683b Xiubo Li      2022-08-25  2440  static int fill_fscrypt_truncate(struct inode *inode,
5c64737d253683b Xiubo Li      2022-08-25  2441  				 struct ceph_mds_request *req,
5c64737d253683b Xiubo Li      2022-08-25  2442  				 struct iattr *attr)
5c64737d253683b Xiubo Li      2022-08-25  2443  {
38d46409c4639a1 Xiubo Li      2023-06-12  2444  	struct ceph_client *cl = ceph_inode_to_client(inode);
5c64737d253683b Xiubo Li      2022-08-25  2445  	struct ceph_inode_info *ci = ceph_inode(inode);
5c64737d253683b Xiubo Li      2022-08-25  2446  	int boff = attr->ia_size % CEPH_FSCRYPT_BLOCK_SIZE;
5c64737d253683b Xiubo Li      2022-08-25  2447  	loff_t pos, orig_pos = round_down(attr->ia_size,
5c64737d253683b Xiubo Li      2022-08-25  2448  					  CEPH_FSCRYPT_BLOCK_SIZE);
5c64737d253683b Xiubo Li      2022-08-25  2449  	u64 block = orig_pos >> CEPH_FSCRYPT_BLOCK_SHIFT;
b30563b69a83b54 David Howells 2023-08-03  2450  	struct bvecq *dbuf = NULL;
5c64737d253683b Xiubo Li      2022-08-25  2451  	struct iov_iter iter;
b30563b69a83b54 David Howells 2023-08-03  2452  	struct ceph_fscrypt_truncate_size_header *header;
b30563b69a83b54 David Howells 2023-08-03  2453  	void *p;
5c64737d253683b Xiubo Li      2022-08-25  2454  	int retry_op = 0;
5c64737d253683b Xiubo Li      2022-08-25  2455  	int len = CEPH_FSCRYPT_BLOCK_SIZE;
5c64737d253683b Xiubo Li      2022-08-25  2456  	loff_t i_size = i_size_read(inode);
5c64737d253683b Xiubo Li      2022-08-25  2457  	int got, ret, issued;
5c64737d253683b Xiubo Li      2022-08-25  2458  	u64 objver;
5c64737d253683b Xiubo Li      2022-08-25  2459  
5c64737d253683b Xiubo Li      2022-08-25  2460  	ret = __ceph_get_caps(inode, NULL, CEPH_CAP_FILE_RD, 0, -1, &got);
5c64737d253683b Xiubo Li      2022-08-25  2461  	if (ret < 0)
5c64737d253683b Xiubo Li      2022-08-25  2462  		return ret;
5c64737d253683b Xiubo Li      2022-08-25  2463  
5c64737d253683b Xiubo Li      2022-08-25  2464  	issued = __ceph_caps_issued(ci, NULL);
5c64737d253683b Xiubo Li      2022-08-25  2465  
38d46409c4639a1 Xiubo Li      2023-06-12  2466  	doutc(cl, "size %lld -> %lld got cap refs on %s, issued %s\n",
5c64737d253683b Xiubo Li      2022-08-25  2467  	      i_size, attr->ia_size, ceph_cap_string(got),
5c64737d253683b Xiubo Li      2022-08-25  2468  	      ceph_cap_string(issued));
5c64737d253683b Xiubo Li      2022-08-25  2469  
5c64737d253683b Xiubo Li      2022-08-25  2470  	/* Try to writeback the dirty pagecaches */
5c64737d253683b Xiubo Li      2022-08-25  2471  	if (issued & (CEPH_CAP_FILE_BUFFER)) {
f452a2204614fc1 David Howells 2025-03-12  2472  		loff_t lend = orig_pos + CEPH_FSCRYPT_BLOCK_SIZE - 1;
5c64737d253683b Xiubo Li      2022-08-25  2473  
5c64737d253683b Xiubo Li      2022-08-25  2474  		ret = filemap_write_and_wait_range(inode->i_mapping,
5c64737d253683b Xiubo Li      2022-08-25  2475  						   orig_pos, lend);
5c64737d253683b Xiubo Li      2022-08-25  2476  		if (ret < 0)
5c64737d253683b Xiubo Li      2022-08-25  2477  			goto out;
5c64737d253683b Xiubo Li      2022-08-25  2478  	}
5c64737d253683b Xiubo Li      2022-08-25  2479  
5c64737d253683b Xiubo Li      2022-08-25  2480  	ret = -ENOMEM;
b30563b69a83b54 David Howells 2023-08-03  2481  	dbuf = bvecq_alloc_chain(2, GFP_KERNEL, false);
b30563b69a83b54 David Howells 2023-08-03  2482  	if (!dbuf)
5c64737d253683b Xiubo Li      2022-08-25  2483  		goto out;
5c64737d253683b Xiubo Li      2022-08-25  2484  
b30563b69a83b54 David Howells 2023-08-03 @2485  	if (ceph_bvecq_insert_frag(dbuf, 0, sizeof(*header), GFP_KERNEL) < 0 ||
b30563b69a83b54 David Howells 2023-08-03  2486  	    ceph_bvecq_insert_frag(dbuf, 1, PAGE_SIZE, GFP_KERNEL) < 0)
5c64737d253683b Xiubo Li      2022-08-25  2487  		goto out;
5c64737d253683b Xiubo Li      2022-08-25  2488  
b30563b69a83b54 David Howells 2023-08-03  2489  	iov_iter_bvec_queue(&iter, ITER_DEST, dbuf, 1, 0, len);
5c64737d253683b Xiubo Li      2022-08-25  2490  
5c64737d253683b Xiubo Li      2022-08-25  2491  	pos = orig_pos;
5c64737d253683b Xiubo Li      2022-08-25  2492  	ret = __ceph_sync_read(inode, &pos, &iter, &retry_op, &objver);
5c64737d253683b Xiubo Li      2022-08-25 @2493  	if (ret < 0)
5c64737d253683b Xiubo Li      2022-08-25  2494  		goto out;
5c64737d253683b Xiubo Li      2022-08-25  2495  
b30563b69a83b54 David Howells 2023-08-03  2496  	header = kmap_local_bvecq(dbuf, 0);
b30563b69a83b54 David Howells 2023-08-03  2497  
5c64737d253683b Xiubo Li      2022-08-25  2498  	/* Insert the header first */
b30563b69a83b54 David Howells 2023-08-03  2499  	header->ver = 1;
b30563b69a83b54 David Howells 2023-08-03  2500  	header->compat = 1;
b30563b69a83b54 David Howells 2023-08-03  2501  	header->change_attr = cpu_to_le64(inode_peek_iversion_raw(inode));
5c64737d253683b Xiubo Li      2022-08-25  2502  
5c64737d253683b Xiubo Li      2022-08-25  2503  	/*
5c64737d253683b Xiubo Li      2022-08-25  2504  	 * Always set the block_size to CEPH_FSCRYPT_BLOCK_SIZE,
5c64737d253683b Xiubo Li      2022-08-25  2505  	 * because in MDS it may need this to do the truncate.
5c64737d253683b Xiubo Li      2022-08-25  2506  	 */
b30563b69a83b54 David Howells 2023-08-03  2507  	header->block_size = cpu_to_le32(CEPH_FSCRYPT_BLOCK_SIZE);
5c64737d253683b Xiubo Li      2022-08-25  2508  
5c64737d253683b Xiubo Li      2022-08-25  2509  	/*
5c64737d253683b Xiubo Li      2022-08-25  2510  	 * If we hit a hole here, we should just skip filling
5c64737d253683b Xiubo Li      2022-08-25  2511  	 * the fscrypt for the request, because once the fscrypt
5c64737d253683b Xiubo Li      2022-08-25  2512  	 * is enabled, the file will be split into many blocks
5c64737d253683b Xiubo Li      2022-08-25  2513  	 * with the size of CEPH_FSCRYPT_BLOCK_SIZE, if there
5c64737d253683b Xiubo Li      2022-08-25  2514  	 * has a hole, the hole size should be multiple of block
5c64737d253683b Xiubo Li      2022-08-25  2515  	 * size.
5c64737d253683b Xiubo Li      2022-08-25  2516  	 *
5c64737d253683b Xiubo Li      2022-08-25  2517  	 * If the Rados object doesn't exist, it will be set to 0.
5c64737d253683b Xiubo Li      2022-08-25  2518  	 */
5c64737d253683b Xiubo Li      2022-08-25  2519  	if (!objver) {
38d46409c4639a1 Xiubo Li      2023-06-12  2520  		doutc(cl, "hit hole, ppos %lld < size %lld\n", pos, i_size);
5c64737d253683b Xiubo Li      2022-08-25  2521  
b30563b69a83b54 David Howells 2023-08-03  2522  		header->data_len = cpu_to_le32(8 + 8 + 4);
b30563b69a83b54 David Howells 2023-08-03  2523  		header->file_offset = 0;
5c64737d253683b Xiubo Li      2022-08-25  2524  		ret = 0;
5c64737d253683b Xiubo Li      2022-08-25  2525  	} else {
b30563b69a83b54 David Howells 2023-08-03  2526  		header->data_len = cpu_to_le32(8 + 8 + 4 + CEPH_FSCRYPT_BLOCK_SIZE);
b30563b69a83b54 David Howells 2023-08-03  2527  		header->file_offset = cpu_to_le64(orig_pos);
5c64737d253683b Xiubo Li      2022-08-25  2528  
38d46409c4639a1 Xiubo Li      2023-06-12  2529  		doutc(cl, "encrypt block boff/bsize %d/%lu\n", boff,
38d46409c4639a1 Xiubo Li      2023-06-12  2530  		      CEPH_FSCRYPT_BLOCK_SIZE);
295fc4aa7de4b72 Xiubo Li      2023-03-06  2531  
5c64737d253683b Xiubo Li      2022-08-25  2532  		/* truncate and zero out the extra contents for the last block */
b30563b69a83b54 David Howells 2023-08-03  2533  		p = kmap_local_bvecq(dbuf, 1);
b30563b69a83b54 David Howells 2023-08-03  2534  		memset(p + boff, 0, PAGE_SIZE - boff);
b30563b69a83b54 David Howells 2023-08-03  2535  		kunmap_local(p);
5c64737d253683b Xiubo Li      2022-08-25  2536  
5c64737d253683b Xiubo Li      2022-08-25  2537  		/* encrypt the last block */
b30563b69a83b54 David Howells 2023-08-03  2538  		ret = ceph_fscrypt_encrypt_block_inplace(inode, dbuf->bv[0].bv_page,
5c64737d253683b Xiubo Li      2022-08-25  2539  							 CEPH_FSCRYPT_BLOCK_SIZE,
fa65058063cbaba Eric Biggers  2025-07-09  2540  							 0, block);
5c64737d253683b Xiubo Li      2022-08-25  2541  		if (ret)
5c64737d253683b Xiubo Li      2022-08-25  2542  			goto out;
5c64737d253683b Xiubo Li      2022-08-25  2543  	}
5c64737d253683b Xiubo Li      2022-08-25  2544  
b30563b69a83b54 David Howells 2023-08-03  2545  	req->r_dbuf = dbuf;
b30563b69a83b54 David Howells 2023-08-03  2546  	req->r_dbuf_len = sizeof(*header);
b30563b69a83b54 David Howells 2023-08-03  2547  	if (header->block_size)
b30563b69a83b54 David Howells 2023-08-03  2548  		req->r_dbuf_len += CEPH_FSCRYPT_BLOCK_SIZE;
5c64737d253683b Xiubo Li      2022-08-25  2549  out:
38d46409c4639a1 Xiubo Li      2023-06-12  2550  	doutc(cl, "%p %llx.%llx size dropping cap refs on %s\n", inode,
38d46409c4639a1 Xiubo Li      2023-06-12  2551  	      ceph_vinop(inode), ceph_cap_string(got));
5c64737d253683b Xiubo Li      2022-08-25  2552  	ceph_put_cap_refs(ci, got);
b30563b69a83b54 David Howells 2023-08-03  2553  	kunmap_local(header);
b30563b69a83b54 David Howells 2023-08-03  2554  	if (ret)
b30563b69a83b54 David Howells 2023-08-03  2555  		bvecq_put(dbuf);
5c64737d253683b Xiubo Li      2022-08-25  2556  	return ret;
5c64737d253683b Xiubo Li      2022-08-25  2557  }
5c64737d253683b Xiubo Li      2022-08-25  2558  

:::::: The code at line 2493 was first introduced by commit
:::::: 5c64737d253683b7d138dde0da513a9ade16a170 ceph: add truncate size handling support for fscrypt

:::::: TO: Xiubo Li <xiubli@redhat.com>
:::::: CC: Ilya Dryomov <idryomov@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
