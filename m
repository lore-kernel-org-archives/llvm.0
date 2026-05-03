Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECAF25228C;
	Sun,  3 May 2026 18:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777831903; cv=none; b=TVt7+7F1q4izoZ4wRAKAn8k6/t7RVBPwoCpnT2MQOwJVRKDgla6SeU7Ks+dMykffLFDCtAaQ+cxwWbcYkmra2CeIrNhlWeLymgx82ans6EN7AQCRUsB1iOq5nNFa0qvkqR6UTBbqZAxh9PX/WI7e1MExeAAApSttoji5KirspAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777831903; c=relaxed/simple;
	bh=ikoFG8ZUQCVgPso0NU9d9kR6oOA4Ea9iJgaR7uH7f0I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Nxdhe/yQwFY0LV9zj35T8A+VJFh+zHFouqU3n7EoRuD8OjDSPWpyGLMBq/1EyQH16SnfTZcQ5nbuddeT3dcoxgCMv9Lcmuz0hKxlc2gqCSBzBSANICSCi7w2+YT+KTN6845HyfG9cbZyPu+cKIc85IzdTMKItKndE6RgtqvTNZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XnLUHmKv; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XnLUHmKv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777831902; x=1809367902;
  h=date:from:to:cc:subject:message-id;
  bh=ikoFG8ZUQCVgPso0NU9d9kR6oOA4Ea9iJgaR7uH7f0I=;
  b=XnLUHmKvHtxT8v0eG+SsqcPX3ezkl9M7iECXkG+lqpyzE01wZoIGzzq0
   4hSHukyxwaNi13cN8g1wC7Y/8KCX1N5BNIYIhLneCLMSf0PfgS9fdUgAS
   cZYg+2KjLpKN6rpT1S9STqw8xA9dvdzfDlJt3vNSivraOxr0fAi34+O6Y
   fiNyDNe/xunfIjG4p265pR/RG0AOfLcYEXnWXjWLXbtl6kUwF1+WPfHaq
   PF3r0dtqRshac3VBlEyz0W1A34gotp9YUkP/L0208h8YnUXyFTYo8fCTq
   RszeZIXnuuhkyfE3T+0ackdn/5WNxV4UnkqUJ1lOh1IFJsQT2/f/UX33f
   w==;
X-CSE-ConnectionGUID: 83nFm95RTv+eC9gkhBLpDA==
X-CSE-MsgGUID: cyr3PJxBS1CkA0C0H72a6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78606268"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="78606268"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 11:11:41 -0700
X-CSE-ConnectionGUID: xiQ7VHwETGuOgZzJVERjng==
X-CSE-MsgGUID: 5rU1MOF/SUiAOE8yLLEUuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="265677436"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 May 2026 11:11:37 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJbHm-000000002qx-0Xgm;
	Sun, 03 May 2026 18:11:23 +0000
Date: Mon, 04 May 2026 02:10:28 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 71/103] fs/ceph/inode.c:2491:6:
 warning: variable 'header' is used uninitialized whenever 'if' condition is
 true
Message-ID: <202605040220.qfk8klE7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   62509662bb514752f7ae58e3c60ed040bd2bafaf
commit: 3233a4eba55cbb603629ea91719ef996af3687a3 [71/103] ceph: Convert ceph_mds_request::r_pagelist to a databuf
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260504/202605040220.qfk8klE7-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605040220.qfk8klE7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605040220.qfk8klE7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ceph/inode.c:2491:6: warning: variable 'header' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    2491 |         if (ret < 0)
         |             ^~~~~~~
   fs/ceph/inode.c:2551:15: note: uninitialized use occurs here
    2551 |         kunmap_local(header);
         |                      ^~~~~~
   fs/ceph/inode.c:2491:2: note: remove the 'if' if its condition is always false
    2491 |         if (ret < 0)
         |         ^~~~~~~~~~~~
    2492 |                 goto out;
         |                 ~~~~~~~~
   fs/ceph/inode.c:2483:6: warning: variable 'header' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    2483 |         if (ceph_bvecq_insert_frag(dbuf, 0, sizeof(*header), GFP_KERNEL) < 0 ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2484 |             ceph_bvecq_insert_frag(dbuf, 1, PAGE_SIZE, GFP_KERNEL) < 0)
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/inode.c:2551:15: note: uninitialized use occurs here
    2551 |         kunmap_local(header);
         |                      ^~~~~~
   fs/ceph/inode.c:2483:2: note: remove the 'if' if its condition is always false
    2483 |         if (ceph_bvecq_insert_frag(dbuf, 0, sizeof(*header), GFP_KERNEL) < 0 ||
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2484 |             ceph_bvecq_insert_frag(dbuf, 1, PAGE_SIZE, GFP_KERNEL) < 0)
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2485 |                 goto out;
         |                 ~~~~~~~~
>> fs/ceph/inode.c:2483:6: warning: variable 'header' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
    2483 |         if (ceph_bvecq_insert_frag(dbuf, 0, sizeof(*header), GFP_KERNEL) < 0 ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/inode.c:2551:15: note: uninitialized use occurs here
    2551 |         kunmap_local(header);
         |                      ^~~~~~
   fs/ceph/inode.c:2483:6: note: remove the '||' if its condition is always false
    2483 |         if (ceph_bvecq_insert_frag(dbuf, 0, sizeof(*header), GFP_KERNEL) < 0 ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/inode.c:2480:6: warning: variable 'header' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    2480 |         if (!dbuf)
         |             ^~~~~
   fs/ceph/inode.c:2551:15: note: uninitialized use occurs here
    2551 |         kunmap_local(header);
         |                      ^~~~~~
   fs/ceph/inode.c:2480:2: note: remove the 'if' if its condition is always false
    2480 |         if (!dbuf)
         |         ^~~~~~~~~~
    2481 |                 goto out;
         |                 ~~~~~~~~
   fs/ceph/inode.c:2474:7: warning: variable 'header' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    2474 |                 if (ret < 0)
         |                     ^~~~~~~
   fs/ceph/inode.c:2551:15: note: uninitialized use occurs here
    2551 |         kunmap_local(header);
         |                      ^~~~~~
   fs/ceph/inode.c:2474:3: note: remove the 'if' if its condition is always false
    2474 |                 if (ret < 0)
         |                 ^~~~~~~~~~~~
    2475 |                         goto out;
         |                         ~~~~~~~~
   fs/ceph/inode.c:2450:50: note: initialize the variable 'header' to silence this warning
    2450 |         struct ceph_fscrypt_truncate_size_header *header;
         |                                                         ^
         |                                                          = NULL
   5 warnings generated.


vim +2491 fs/ceph/inode.c

79f2f6ad878c1f2 Jeff Layton   2020-09-03  2430  
5c64737d253683b Xiubo Li      2022-08-25  2431  /*
5c64737d253683b Xiubo Li      2022-08-25  2432   * Transfer the encrypted last block to the MDS and the MDS
5c64737d253683b Xiubo Li      2022-08-25  2433   * will help update it when truncating a smaller size.
5c64737d253683b Xiubo Li      2022-08-25  2434   *
5c64737d253683b Xiubo Li      2022-08-25  2435   * We don't support a PAGE_SIZE that is smaller than the
5c64737d253683b Xiubo Li      2022-08-25  2436   * CEPH_FSCRYPT_BLOCK_SIZE.
5c64737d253683b Xiubo Li      2022-08-25  2437   */
5c64737d253683b Xiubo Li      2022-08-25  2438  static int fill_fscrypt_truncate(struct inode *inode,
5c64737d253683b Xiubo Li      2022-08-25  2439  				 struct ceph_mds_request *req,
5c64737d253683b Xiubo Li      2022-08-25  2440  				 struct iattr *attr)
5c64737d253683b Xiubo Li      2022-08-25  2441  {
38d46409c4639a1 Xiubo Li      2023-06-12  2442  	struct ceph_client *cl = ceph_inode_to_client(inode);
5c64737d253683b Xiubo Li      2022-08-25  2443  	struct ceph_inode_info *ci = ceph_inode(inode);
5c64737d253683b Xiubo Li      2022-08-25  2444  	int boff = attr->ia_size % CEPH_FSCRYPT_BLOCK_SIZE;
5c64737d253683b Xiubo Li      2022-08-25  2445  	loff_t pos, orig_pos = round_down(attr->ia_size,
5c64737d253683b Xiubo Li      2022-08-25  2446  					  CEPH_FSCRYPT_BLOCK_SIZE);
5c64737d253683b Xiubo Li      2022-08-25  2447  	u64 block = orig_pos >> CEPH_FSCRYPT_BLOCK_SHIFT;
3233a4eba55cbb6 David Howells 2023-08-03  2448  	struct bvecq *dbuf = NULL;
5c64737d253683b Xiubo Li      2022-08-25  2449  	struct iov_iter iter;
3233a4eba55cbb6 David Howells 2023-08-03  2450  	struct ceph_fscrypt_truncate_size_header *header;
3233a4eba55cbb6 David Howells 2023-08-03  2451  	void *p;
5c64737d253683b Xiubo Li      2022-08-25  2452  	int retry_op = 0;
5c64737d253683b Xiubo Li      2022-08-25  2453  	int len = CEPH_FSCRYPT_BLOCK_SIZE;
5c64737d253683b Xiubo Li      2022-08-25  2454  	loff_t i_size = i_size_read(inode);
5c64737d253683b Xiubo Li      2022-08-25  2455  	int got, ret, issued;
5c64737d253683b Xiubo Li      2022-08-25  2456  	u64 objver;
5c64737d253683b Xiubo Li      2022-08-25  2457  
5c64737d253683b Xiubo Li      2022-08-25  2458  	ret = __ceph_get_caps(inode, NULL, CEPH_CAP_FILE_RD, 0, -1, &got);
5c64737d253683b Xiubo Li      2022-08-25  2459  	if (ret < 0)
5c64737d253683b Xiubo Li      2022-08-25  2460  		return ret;
5c64737d253683b Xiubo Li      2022-08-25  2461  
5c64737d253683b Xiubo Li      2022-08-25  2462  	issued = __ceph_caps_issued(ci, NULL);
5c64737d253683b Xiubo Li      2022-08-25  2463  
38d46409c4639a1 Xiubo Li      2023-06-12  2464  	doutc(cl, "size %lld -> %lld got cap refs on %s, issued %s\n",
5c64737d253683b Xiubo Li      2022-08-25  2465  	      i_size, attr->ia_size, ceph_cap_string(got),
5c64737d253683b Xiubo Li      2022-08-25  2466  	      ceph_cap_string(issued));
5c64737d253683b Xiubo Li      2022-08-25  2467  
5c64737d253683b Xiubo Li      2022-08-25  2468  	/* Try to writeback the dirty pagecaches */
5c64737d253683b Xiubo Li      2022-08-25  2469  	if (issued & (CEPH_CAP_FILE_BUFFER)) {
f452a2204614fc1 David Howells 2025-03-12  2470  		loff_t lend = orig_pos + CEPH_FSCRYPT_BLOCK_SIZE - 1;
5c64737d253683b Xiubo Li      2022-08-25  2471  
5c64737d253683b Xiubo Li      2022-08-25  2472  		ret = filemap_write_and_wait_range(inode->i_mapping,
5c64737d253683b Xiubo Li      2022-08-25  2473  						   orig_pos, lend);
5c64737d253683b Xiubo Li      2022-08-25  2474  		if (ret < 0)
5c64737d253683b Xiubo Li      2022-08-25  2475  			goto out;
5c64737d253683b Xiubo Li      2022-08-25  2476  	}
5c64737d253683b Xiubo Li      2022-08-25  2477  
5c64737d253683b Xiubo Li      2022-08-25  2478  	ret = -ENOMEM;
3233a4eba55cbb6 David Howells 2023-08-03  2479  	dbuf = bvecq_alloc_chain(2, GFP_KERNEL);
3233a4eba55cbb6 David Howells 2023-08-03  2480  	if (!dbuf)
5c64737d253683b Xiubo Li      2022-08-25  2481  		goto out;
5c64737d253683b Xiubo Li      2022-08-25  2482  
3233a4eba55cbb6 David Howells 2023-08-03 @2483  	if (ceph_bvecq_insert_frag(dbuf, 0, sizeof(*header), GFP_KERNEL) < 0 ||
3233a4eba55cbb6 David Howells 2023-08-03  2484  	    ceph_bvecq_insert_frag(dbuf, 1, PAGE_SIZE, GFP_KERNEL) < 0)
5c64737d253683b Xiubo Li      2022-08-25  2485  		goto out;
5c64737d253683b Xiubo Li      2022-08-25  2486  
3233a4eba55cbb6 David Howells 2023-08-03  2487  	iov_iter_bvec_queue(&iter, ITER_DEST, dbuf, 1, 0, len);
5c64737d253683b Xiubo Li      2022-08-25  2488  
5c64737d253683b Xiubo Li      2022-08-25  2489  	pos = orig_pos;
5c64737d253683b Xiubo Li      2022-08-25  2490  	ret = __ceph_sync_read(inode, &pos, &iter, &retry_op, &objver);
5c64737d253683b Xiubo Li      2022-08-25 @2491  	if (ret < 0)
5c64737d253683b Xiubo Li      2022-08-25  2492  		goto out;
5c64737d253683b Xiubo Li      2022-08-25  2493  
3233a4eba55cbb6 David Howells 2023-08-03  2494  	header = kmap_local_bvecq(dbuf, 0);
3233a4eba55cbb6 David Howells 2023-08-03  2495  
5c64737d253683b Xiubo Li      2022-08-25  2496  	/* Insert the header first */
3233a4eba55cbb6 David Howells 2023-08-03  2497  	header->ver = 1;
3233a4eba55cbb6 David Howells 2023-08-03  2498  	header->compat = 1;
3233a4eba55cbb6 David Howells 2023-08-03  2499  	header->change_attr = cpu_to_le64(inode_peek_iversion_raw(inode));
5c64737d253683b Xiubo Li      2022-08-25  2500  
5c64737d253683b Xiubo Li      2022-08-25  2501  	/*
5c64737d253683b Xiubo Li      2022-08-25  2502  	 * Always set the block_size to CEPH_FSCRYPT_BLOCK_SIZE,
5c64737d253683b Xiubo Li      2022-08-25  2503  	 * because in MDS it may need this to do the truncate.
5c64737d253683b Xiubo Li      2022-08-25  2504  	 */
3233a4eba55cbb6 David Howells 2023-08-03  2505  	header->block_size = cpu_to_le32(CEPH_FSCRYPT_BLOCK_SIZE);
5c64737d253683b Xiubo Li      2022-08-25  2506  
5c64737d253683b Xiubo Li      2022-08-25  2507  	/*
5c64737d253683b Xiubo Li      2022-08-25  2508  	 * If we hit a hole here, we should just skip filling
5c64737d253683b Xiubo Li      2022-08-25  2509  	 * the fscrypt for the request, because once the fscrypt
5c64737d253683b Xiubo Li      2022-08-25  2510  	 * is enabled, the file will be split into many blocks
5c64737d253683b Xiubo Li      2022-08-25  2511  	 * with the size of CEPH_FSCRYPT_BLOCK_SIZE, if there
5c64737d253683b Xiubo Li      2022-08-25  2512  	 * has a hole, the hole size should be multiple of block
5c64737d253683b Xiubo Li      2022-08-25  2513  	 * size.
5c64737d253683b Xiubo Li      2022-08-25  2514  	 *
5c64737d253683b Xiubo Li      2022-08-25  2515  	 * If the Rados object doesn't exist, it will be set to 0.
5c64737d253683b Xiubo Li      2022-08-25  2516  	 */
5c64737d253683b Xiubo Li      2022-08-25  2517  	if (!objver) {
38d46409c4639a1 Xiubo Li      2023-06-12  2518  		doutc(cl, "hit hole, ppos %lld < size %lld\n", pos, i_size);
5c64737d253683b Xiubo Li      2022-08-25  2519  
3233a4eba55cbb6 David Howells 2023-08-03  2520  		header->data_len = cpu_to_le32(8 + 8 + 4);
3233a4eba55cbb6 David Howells 2023-08-03  2521  		header->file_offset = 0;
5c64737d253683b Xiubo Li      2022-08-25  2522  		ret = 0;
5c64737d253683b Xiubo Li      2022-08-25  2523  	} else {
3233a4eba55cbb6 David Howells 2023-08-03  2524  		header->data_len = cpu_to_le32(8 + 8 + 4 + CEPH_FSCRYPT_BLOCK_SIZE);
3233a4eba55cbb6 David Howells 2023-08-03  2525  		header->file_offset = cpu_to_le64(orig_pos);
5c64737d253683b Xiubo Li      2022-08-25  2526  
38d46409c4639a1 Xiubo Li      2023-06-12  2527  		doutc(cl, "encrypt block boff/bsize %d/%lu\n", boff,
38d46409c4639a1 Xiubo Li      2023-06-12  2528  		      CEPH_FSCRYPT_BLOCK_SIZE);
295fc4aa7de4b72 Xiubo Li      2023-03-06  2529  
5c64737d253683b Xiubo Li      2022-08-25  2530  		/* truncate and zero out the extra contents for the last block */
3233a4eba55cbb6 David Howells 2023-08-03  2531  		p = kmap_local_bvecq(dbuf, 1);
3233a4eba55cbb6 David Howells 2023-08-03  2532  		memset(p + boff, 0, PAGE_SIZE - boff);
3233a4eba55cbb6 David Howells 2023-08-03  2533  		kunmap_local(p);
5c64737d253683b Xiubo Li      2022-08-25  2534  
5c64737d253683b Xiubo Li      2022-08-25  2535  		/* encrypt the last block */
3233a4eba55cbb6 David Howells 2023-08-03  2536  		ret = ceph_fscrypt_encrypt_block_inplace(inode, dbuf->bv[0].bv_page,
5c64737d253683b Xiubo Li      2022-08-25  2537  							 CEPH_FSCRYPT_BLOCK_SIZE,
fa65058063cbaba Eric Biggers  2025-07-09  2538  							 0, block);
5c64737d253683b Xiubo Li      2022-08-25  2539  		if (ret)
5c64737d253683b Xiubo Li      2022-08-25  2540  			goto out;
5c64737d253683b Xiubo Li      2022-08-25  2541  	}
5c64737d253683b Xiubo Li      2022-08-25  2542  
3233a4eba55cbb6 David Howells 2023-08-03  2543  	req->r_dbuf = dbuf;
3233a4eba55cbb6 David Howells 2023-08-03  2544  	req->r_dbuf_len = sizeof(*header);
3233a4eba55cbb6 David Howells 2023-08-03  2545  	if (header->block_size)
3233a4eba55cbb6 David Howells 2023-08-03  2546  		req->r_dbuf_len += CEPH_FSCRYPT_BLOCK_SIZE;
5c64737d253683b Xiubo Li      2022-08-25  2547  out:
38d46409c4639a1 Xiubo Li      2023-06-12  2548  	doutc(cl, "%p %llx.%llx size dropping cap refs on %s\n", inode,
38d46409c4639a1 Xiubo Li      2023-06-12  2549  	      ceph_vinop(inode), ceph_cap_string(got));
5c64737d253683b Xiubo Li      2022-08-25  2550  	ceph_put_cap_refs(ci, got);
3233a4eba55cbb6 David Howells 2023-08-03  2551  	kunmap_local(header);
3233a4eba55cbb6 David Howells 2023-08-03  2552  	if (ret)
3233a4eba55cbb6 David Howells 2023-08-03  2553  		bvecq_put(dbuf);
5c64737d253683b Xiubo Li      2022-08-25  2554  	return ret;
5c64737d253683b Xiubo Li      2022-08-25  2555  }
5c64737d253683b Xiubo Li      2022-08-25  2556  

:::::: The code at line 2491 was first introduced by commit
:::::: 5c64737d253683b7d138dde0da513a9ade16a170 ceph: add truncate size handling support for fscrypt

:::::: TO: Xiubo Li <xiubli@redhat.com>
:::::: CC: Ilya Dryomov <idryomov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
