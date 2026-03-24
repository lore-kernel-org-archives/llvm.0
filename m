Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5963A3808;
	Tue, 24 Mar 2026 03:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774324618; cv=none; b=dt14Vd4DFQ+HkfNef+Tc2xG0mc0sa4Uw7zml3LYB2oY2WOFKygLuD3fQUddsfEeP44vAVTc75+tCQJMceEA7fMwMj0Dv38j0dXM+bAvEaxJnT/NfPIDcb2G6R/nvdC3Z1hgjOfdwD2Ygqu+GOfxc/SXtJDuGUgsBdvpD7tiGMPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774324618; c=relaxed/simple;
	bh=WwVZz3NgDZaGZUGRW+YlV0lIOfLFbXHhI0EdasgTXEU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=thywq+wtXqsZZKBjw2QXnc6AupJmnwQkc2TAaBZVmw+0li6GP9fgkiWKUgfVD6L63AUOR36gN1pY5BsF/5hi9ohUGBr953qZnfSkcdhWMQ1P2wTQybVjs45/U0lG5ZARYfgzcBN7wT9alrrQLaCldoGBPraFK2y6gtOuICHxvgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RLcyqWyA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RLcyqWyA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774324615; x=1805860615;
  h=date:from:to:cc:subject:message-id;
  bh=WwVZz3NgDZaGZUGRW+YlV0lIOfLFbXHhI0EdasgTXEU=;
  b=RLcyqWyA4/XLZBB0FhYxb2Xc4rGBIKgtOFi4YVe3uNX4DE2OR1qsKv8S
   yY5F2j/6aJLGn/dvySUf7gNADPSUZp6UtkFsTPM4uVRwRfbT+Y648e9h8
   bEEA0ZF4dDgD8nFdBBHxH/stqFPN5dk2XaDcj4G5oYVs9ZCMswwEgc/fk
   dCK9c3y93zN/HABTjr2xvEqe24oBDAjPe7EVTk6SDnWLa/OjCEwhe+owm
   6sUQELn35J8Mzzgv7w6CLBtqrl17u90szK5/OYSWIRgljYUi9Hsn/GLAj
   XGVoFeLqBtINBsWnnBZXoUg9wQydX7yQ7Zb8FXx8uPBrWEGuCq1cpIw0p
   g==;
X-CSE-ConnectionGUID: vHIy0sg4T36yHBWgJUeukw==
X-CSE-MsgGUID: XVpNED3ETCG4txvpPkA7yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="74354649"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="74354649"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 20:56:52 -0700
X-CSE-ConnectionGUID: dRtSxtxHSJ6GIKQj4qR7Fg==
X-CSE-MsgGUID: sG8pHMwUSjOqtW8oreRe7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="223304106"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Mar 2026 20:56:50 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4sso-000000003kR-3kwj;
	Tue, 24 Mar 2026 03:56:46 +0000
Date: Tue, 24 Mar 2026 11:56:25 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 44/77] fs/ceph/inode.c:2450:6:
 warning: variable 'header' is used uninitialized whenever 'if' condition is
 true
Message-ID: <202603241146.5mfqiOUc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   05d546a07e9a570d280344cff29c354b67fda562
commit: 46123cb68a649df7d94a5e2e2d199ee7c86c13ef [44/77] ceph: Convert ceph_mds_request::r_pagelist to a databuf
config: riscv-randconfig-002-20260324 (https://download.01.org/0day-ci/archive/20260324/202603241146.5mfqiOUc-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603241146.5mfqiOUc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241146.5mfqiOUc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ceph/inode.c:2450:6: warning: variable 'header' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    2450 |         if (ret < 0)
         |             ^~~~~~~
   fs/ceph/inode.c:2510:15: note: uninitialized use occurs here
    2510 |         kunmap_local(header);
         |                      ^~~~~~
   fs/ceph/inode.c:2450:2: note: remove the 'if' if its condition is always false
    2450 |         if (ret < 0)
         |         ^~~~~~~~~~~~
    2451 |                 goto out;
         |                 ~~~~~~~~
   fs/ceph/inode.c:2442:6: warning: variable 'header' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    2442 |         if (ceph_bvecq_insert_frag(dbuf, 0, sizeof(*header), GFP_KERNEL) < 0 ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2443 |             ceph_bvecq_insert_frag(dbuf, 1, PAGE_SIZE, GFP_KERNEL) < 0)
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/inode.c:2510:15: note: uninitialized use occurs here
    2510 |         kunmap_local(header);
         |                      ^~~~~~
   fs/ceph/inode.c:2442:2: note: remove the 'if' if its condition is always false
    2442 |         if (ceph_bvecq_insert_frag(dbuf, 0, sizeof(*header), GFP_KERNEL) < 0 ||
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2443 |             ceph_bvecq_insert_frag(dbuf, 1, PAGE_SIZE, GFP_KERNEL) < 0)
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2444 |                 goto out;
         |                 ~~~~~~~~
>> fs/ceph/inode.c:2442:6: warning: variable 'header' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
    2442 |         if (ceph_bvecq_insert_frag(dbuf, 0, sizeof(*header), GFP_KERNEL) < 0 ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/inode.c:2510:15: note: uninitialized use occurs here
    2510 |         kunmap_local(header);
         |                      ^~~~~~
   fs/ceph/inode.c:2442:6: note: remove the '||' if its condition is always false
    2442 |         if (ceph_bvecq_insert_frag(dbuf, 0, sizeof(*header), GFP_KERNEL) < 0 ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/inode.c:2439:6: warning: variable 'header' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    2439 |         if (!dbuf)
         |             ^~~~~
   fs/ceph/inode.c:2510:15: note: uninitialized use occurs here
    2510 |         kunmap_local(header);
         |                      ^~~~~~
   fs/ceph/inode.c:2439:2: note: remove the 'if' if its condition is always false
    2439 |         if (!dbuf)
         |         ^~~~~~~~~~
    2440 |                 goto out;
         |                 ~~~~~~~~
   fs/ceph/inode.c:2433:7: warning: variable 'header' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    2433 |                 if (ret < 0)
         |                     ^~~~~~~
   fs/ceph/inode.c:2510:15: note: uninitialized use occurs here
    2510 |         kunmap_local(header);
         |                      ^~~~~~
   fs/ceph/inode.c:2433:3: note: remove the 'if' if its condition is always false
    2433 |                 if (ret < 0)
         |                 ^~~~~~~~~~~~
    2434 |                         goto out;
         |                         ~~~~~~~~
   fs/ceph/inode.c:2409:50: note: initialize the variable 'header' to silence this warning
    2409 |         struct ceph_fscrypt_truncate_size_header *header;
         |                                                         ^
         |                                                          = NULL
   5 warnings generated.


vim +2450 fs/ceph/inode.c

79f2f6ad878c1f Jeff Layton   2020-09-03  2389  
5c64737d253683 Xiubo Li      2022-08-25  2390  /*
5c64737d253683 Xiubo Li      2022-08-25  2391   * Transfer the encrypted last block to the MDS and the MDS
5c64737d253683 Xiubo Li      2022-08-25  2392   * will help update it when truncating a smaller size.
5c64737d253683 Xiubo Li      2022-08-25  2393   *
5c64737d253683 Xiubo Li      2022-08-25  2394   * We don't support a PAGE_SIZE that is smaller than the
5c64737d253683 Xiubo Li      2022-08-25  2395   * CEPH_FSCRYPT_BLOCK_SIZE.
5c64737d253683 Xiubo Li      2022-08-25  2396   */
5c64737d253683 Xiubo Li      2022-08-25  2397  static int fill_fscrypt_truncate(struct inode *inode,
5c64737d253683 Xiubo Li      2022-08-25  2398  				 struct ceph_mds_request *req,
5c64737d253683 Xiubo Li      2022-08-25  2399  				 struct iattr *attr)
5c64737d253683 Xiubo Li      2022-08-25  2400  {
38d46409c4639a Xiubo Li      2023-06-12  2401  	struct ceph_client *cl = ceph_inode_to_client(inode);
5c64737d253683 Xiubo Li      2022-08-25  2402  	struct ceph_inode_info *ci = ceph_inode(inode);
5c64737d253683 Xiubo Li      2022-08-25  2403  	int boff = attr->ia_size % CEPH_FSCRYPT_BLOCK_SIZE;
5c64737d253683 Xiubo Li      2022-08-25  2404  	loff_t pos, orig_pos = round_down(attr->ia_size,
5c64737d253683 Xiubo Li      2022-08-25  2405  					  CEPH_FSCRYPT_BLOCK_SIZE);
5c64737d253683 Xiubo Li      2022-08-25  2406  	u64 block = orig_pos >> CEPH_FSCRYPT_BLOCK_SHIFT;
46123cb68a649d David Howells 2023-08-03  2407  	struct bvecq *dbuf = NULL;
5c64737d253683 Xiubo Li      2022-08-25  2408  	struct iov_iter iter;
46123cb68a649d David Howells 2023-08-03  2409  	struct ceph_fscrypt_truncate_size_header *header;
46123cb68a649d David Howells 2023-08-03  2410  	void *p;
5c64737d253683 Xiubo Li      2022-08-25  2411  	int retry_op = 0;
5c64737d253683 Xiubo Li      2022-08-25  2412  	int len = CEPH_FSCRYPT_BLOCK_SIZE;
5c64737d253683 Xiubo Li      2022-08-25  2413  	loff_t i_size = i_size_read(inode);
5c64737d253683 Xiubo Li      2022-08-25  2414  	int got, ret, issued;
5c64737d253683 Xiubo Li      2022-08-25  2415  	u64 objver;
5c64737d253683 Xiubo Li      2022-08-25  2416  
5c64737d253683 Xiubo Li      2022-08-25  2417  	ret = __ceph_get_caps(inode, NULL, CEPH_CAP_FILE_RD, 0, -1, &got);
5c64737d253683 Xiubo Li      2022-08-25  2418  	if (ret < 0)
5c64737d253683 Xiubo Li      2022-08-25  2419  		return ret;
5c64737d253683 Xiubo Li      2022-08-25  2420  
5c64737d253683 Xiubo Li      2022-08-25  2421  	issued = __ceph_caps_issued(ci, NULL);
5c64737d253683 Xiubo Li      2022-08-25  2422  
38d46409c4639a Xiubo Li      2023-06-12  2423  	doutc(cl, "size %lld -> %lld got cap refs on %s, issued %s\n",
5c64737d253683 Xiubo Li      2022-08-25  2424  	      i_size, attr->ia_size, ceph_cap_string(got),
5c64737d253683 Xiubo Li      2022-08-25  2425  	      ceph_cap_string(issued));
5c64737d253683 Xiubo Li      2022-08-25  2426  
5c64737d253683 Xiubo Li      2022-08-25  2427  	/* Try to writeback the dirty pagecaches */
5c64737d253683 Xiubo Li      2022-08-25  2428  	if (issued & (CEPH_CAP_FILE_BUFFER)) {
f452a2204614fc David Howells 2025-03-12  2429  		loff_t lend = orig_pos + CEPH_FSCRYPT_BLOCK_SIZE - 1;
5c64737d253683 Xiubo Li      2022-08-25  2430  
5c64737d253683 Xiubo Li      2022-08-25  2431  		ret = filemap_write_and_wait_range(inode->i_mapping,
5c64737d253683 Xiubo Li      2022-08-25  2432  						   orig_pos, lend);
5c64737d253683 Xiubo Li      2022-08-25  2433  		if (ret < 0)
5c64737d253683 Xiubo Li      2022-08-25  2434  			goto out;
5c64737d253683 Xiubo Li      2022-08-25  2435  	}
5c64737d253683 Xiubo Li      2022-08-25  2436  
5c64737d253683 Xiubo Li      2022-08-25  2437  	ret = -ENOMEM;
46123cb68a649d David Howells 2023-08-03  2438  	dbuf = bvecq_alloc_chain(2, GFP_KERNEL);
46123cb68a649d David Howells 2023-08-03  2439  	if (!dbuf)
5c64737d253683 Xiubo Li      2022-08-25  2440  		goto out;
5c64737d253683 Xiubo Li      2022-08-25  2441  
46123cb68a649d David Howells 2023-08-03 @2442  	if (ceph_bvecq_insert_frag(dbuf, 0, sizeof(*header), GFP_KERNEL) < 0 ||
46123cb68a649d David Howells 2023-08-03  2443  	    ceph_bvecq_insert_frag(dbuf, 1, PAGE_SIZE, GFP_KERNEL) < 0)
5c64737d253683 Xiubo Li      2022-08-25  2444  		goto out;
5c64737d253683 Xiubo Li      2022-08-25  2445  
46123cb68a649d David Howells 2023-08-03  2446  	iov_iter_bvec_queue(&iter, ITER_DEST, dbuf, 1, 0, len);
5c64737d253683 Xiubo Li      2022-08-25  2447  
5c64737d253683 Xiubo Li      2022-08-25  2448  	pos = orig_pos;
5c64737d253683 Xiubo Li      2022-08-25  2449  	ret = __ceph_sync_read(inode, &pos, &iter, &retry_op, &objver);
5c64737d253683 Xiubo Li      2022-08-25 @2450  	if (ret < 0)
5c64737d253683 Xiubo Li      2022-08-25  2451  		goto out;
5c64737d253683 Xiubo Li      2022-08-25  2452  
46123cb68a649d David Howells 2023-08-03  2453  	header = kmap_local_bvecq(dbuf, 0);
46123cb68a649d David Howells 2023-08-03  2454  
5c64737d253683 Xiubo Li      2022-08-25  2455  	/* Insert the header first */
46123cb68a649d David Howells 2023-08-03  2456  	header->ver = 1;
46123cb68a649d David Howells 2023-08-03  2457  	header->compat = 1;
46123cb68a649d David Howells 2023-08-03  2458  	header->change_attr = cpu_to_le64(inode_peek_iversion_raw(inode));
5c64737d253683 Xiubo Li      2022-08-25  2459  
5c64737d253683 Xiubo Li      2022-08-25  2460  	/*
5c64737d253683 Xiubo Li      2022-08-25  2461  	 * Always set the block_size to CEPH_FSCRYPT_BLOCK_SIZE,
5c64737d253683 Xiubo Li      2022-08-25  2462  	 * because in MDS it may need this to do the truncate.
5c64737d253683 Xiubo Li      2022-08-25  2463  	 */
46123cb68a649d David Howells 2023-08-03  2464  	header->block_size = cpu_to_le32(CEPH_FSCRYPT_BLOCK_SIZE);
5c64737d253683 Xiubo Li      2022-08-25  2465  
5c64737d253683 Xiubo Li      2022-08-25  2466  	/*
5c64737d253683 Xiubo Li      2022-08-25  2467  	 * If we hit a hole here, we should just skip filling
5c64737d253683 Xiubo Li      2022-08-25  2468  	 * the fscrypt for the request, because once the fscrypt
5c64737d253683 Xiubo Li      2022-08-25  2469  	 * is enabled, the file will be split into many blocks
5c64737d253683 Xiubo Li      2022-08-25  2470  	 * with the size of CEPH_FSCRYPT_BLOCK_SIZE, if there
5c64737d253683 Xiubo Li      2022-08-25  2471  	 * has a hole, the hole size should be multiple of block
5c64737d253683 Xiubo Li      2022-08-25  2472  	 * size.
5c64737d253683 Xiubo Li      2022-08-25  2473  	 *
5c64737d253683 Xiubo Li      2022-08-25  2474  	 * If the Rados object doesn't exist, it will be set to 0.
5c64737d253683 Xiubo Li      2022-08-25  2475  	 */
5c64737d253683 Xiubo Li      2022-08-25  2476  	if (!objver) {
38d46409c4639a Xiubo Li      2023-06-12  2477  		doutc(cl, "hit hole, ppos %lld < size %lld\n", pos, i_size);
5c64737d253683 Xiubo Li      2022-08-25  2478  
46123cb68a649d David Howells 2023-08-03  2479  		header->data_len = cpu_to_le32(8 + 8 + 4);
46123cb68a649d David Howells 2023-08-03  2480  		header->file_offset = 0;
5c64737d253683 Xiubo Li      2022-08-25  2481  		ret = 0;
5c64737d253683 Xiubo Li      2022-08-25  2482  	} else {
46123cb68a649d David Howells 2023-08-03  2483  		header->data_len = cpu_to_le32(8 + 8 + 4 + CEPH_FSCRYPT_BLOCK_SIZE);
46123cb68a649d David Howells 2023-08-03  2484  		header->file_offset = cpu_to_le64(orig_pos);
5c64737d253683 Xiubo Li      2022-08-25  2485  
38d46409c4639a Xiubo Li      2023-06-12  2486  		doutc(cl, "encrypt block boff/bsize %d/%lu\n", boff,
38d46409c4639a Xiubo Li      2023-06-12  2487  		      CEPH_FSCRYPT_BLOCK_SIZE);
295fc4aa7de4b7 Xiubo Li      2023-03-06  2488  
5c64737d253683 Xiubo Li      2022-08-25  2489  		/* truncate and zero out the extra contents for the last block */
46123cb68a649d David Howells 2023-08-03  2490  		p = kmap_local_bvecq(dbuf, 1);
46123cb68a649d David Howells 2023-08-03  2491  		memset(p + boff, 0, PAGE_SIZE - boff);
46123cb68a649d David Howells 2023-08-03  2492  		kunmap_local(p);
5c64737d253683 Xiubo Li      2022-08-25  2493  
5c64737d253683 Xiubo Li      2022-08-25  2494  		/* encrypt the last block */
46123cb68a649d David Howells 2023-08-03  2495  		ret = ceph_fscrypt_encrypt_block_inplace(inode, dbuf->bv[0].bv_page,
5c64737d253683 Xiubo Li      2022-08-25  2496  							 CEPH_FSCRYPT_BLOCK_SIZE,
fa65058063cbab Eric Biggers  2025-07-09  2497  							 0, block);
5c64737d253683 Xiubo Li      2022-08-25  2498  		if (ret)
5c64737d253683 Xiubo Li      2022-08-25  2499  			goto out;
5c64737d253683 Xiubo Li      2022-08-25  2500  	}
5c64737d253683 Xiubo Li      2022-08-25  2501  
46123cb68a649d David Howells 2023-08-03  2502  	req->r_dbuf = dbuf;
46123cb68a649d David Howells 2023-08-03  2503  	req->r_dbuf_len = sizeof(*header);
46123cb68a649d David Howells 2023-08-03  2504  	if (header->block_size)
46123cb68a649d David Howells 2023-08-03  2505  		req->r_dbuf_len += CEPH_FSCRYPT_BLOCK_SIZE;
5c64737d253683 Xiubo Li      2022-08-25  2506  out:
38d46409c4639a Xiubo Li      2023-06-12  2507  	doutc(cl, "%p %llx.%llx size dropping cap refs on %s\n", inode,
38d46409c4639a Xiubo Li      2023-06-12  2508  	      ceph_vinop(inode), ceph_cap_string(got));
5c64737d253683 Xiubo Li      2022-08-25  2509  	ceph_put_cap_refs(ci, got);
46123cb68a649d David Howells 2023-08-03  2510  	kunmap_local(header);
46123cb68a649d David Howells 2023-08-03  2511  	if (ret)
46123cb68a649d David Howells 2023-08-03  2512  		bvecq_put(dbuf);
5c64737d253683 Xiubo Li      2022-08-25  2513  	return ret;
5c64737d253683 Xiubo Li      2022-08-25  2514  }
5c64737d253683 Xiubo Li      2022-08-25  2515  

:::::: The code at line 2450 was first introduced by commit
:::::: 5c64737d253683b7d138dde0da513a9ade16a170 ceph: add truncate size handling support for fscrypt

:::::: TO: Xiubo Li <xiubli@redhat.com>
:::::: CC: Ilya Dryomov <idryomov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
