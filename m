Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFD216A395;
	Sat,  5 Sep 2026 03:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788577678; cv=none; b=Pvoylpm5WGoY4tebUUuStU7T0eMv202MdrdZIHlpIfdXkI1tS3IzG3r49dClQjRgGhV0BuPCoxDfFN6UMnR/bmPvmm2ffWqt7IihSlA8E8oIXsdL+CFPSL/GuamCiX6go29b3OvKVPooLwABYKdM9lV4+eTbnEd23vqMgy62m50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788577678; c=relaxed/simple;
	bh=2xacrsyVEhPYaEvYsk5+sJLbQKkd5v+tr5ymwLPfKcQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UToql5Fk5jSNgsThIjJ3t9fQk7CY05GDrz3NoCf7LG9zGcvKtkHOkaKRRPoRhAt/1lASHonXB+VnAqNOIO7AF//PRIMj4hbOVINrDfVTJxq64q+LetdT7uO4sxRVZ75FDivQzCE4lZB3GP3oNitl4YODQhppGXXCXutdOrSoygI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P5ta2XGP; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P5ta2XGP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788577676; x=1820113676;
  h=date:from:to:cc:subject:message-id;
  bh=2xacrsyVEhPYaEvYsk5+sJLbQKkd5v+tr5ymwLPfKcQ=;
  b=P5ta2XGPm/lPodKGr7hK73eUVVTX8p0AyDnD32RyceakyGvQ75caQk+L
   J2t83Onrh4flnWiLg0ZgBOVrI3Uo0HkjqFCrmyIaFUMshL8qJsrUfvXxW
   aXZvEGCVO9QuuFs1HtyMVNnKvQZKLgeg9tKRu7UHiDF8tVTb0iqn/HPFl
   sJlbptRpAdQ5zN5VgmhTzxVPlb4gzwNsA/VsxjUwX6QqCZrXE31uDjN6A
   TuU5qXsO+5Cs+uN5ONlG7P3/R5EIfCkLNxEjl9wzsHUXRszcyr06qZ4aQ
   hLtxvFgdbIKCFulujdmqsSUC6tdwn9fNqEhHLsum/rVAREg9L0CDCV0vC
   g==;
X-CSE-ConnectionGUID: ToyYMrw2QU6uH0wxbA+eGg==
X-CSE-MsgGUID: TmAMaSpsTC+hNP23rtQNqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="92777168"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="92777168"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 20:07:55 -0700
X-CSE-ConnectionGUID: ibAC4wUERdmgal67haNAzw==
X-CSE-MsgGUID: nXLDBKHbQ7S6oBaPuiemQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="273714630"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Sep 2026 20:07:53 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2gkx-00000000AeJ-0Fg5;
	Sat, 05 Sep 2026 03:07:51 +0000
Date: Sat, 05 Sep 2026 11:07:35 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 81/87] fs/ceph/inode.c:2503:50:
 warning: variable 'pos' is uninitialized when used here
Message-ID: <202609051157.fouhIIkr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   376ad9d4942bf11500931178bbeb965348f01057
commit: b761e790c5985b9648236697803fa145e76ee755 [81/87] ceph: Use netfslib [INCOMPLETE]
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260905/202609051157.fouhIIkr-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 0edd1b088cc36b4faee80358c925a91e16006258)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609051157.fouhIIkr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609051157.fouhIIkr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ceph/inode.c:2478:6: warning: variable 'header' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    2478 |         if (ret < 0 && ret != -ENODATA)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/inode.c:2536:15: note: uninitialized use occurs here
    2536 |         kunmap_local(header);
         |                      ^~~~~~
   fs/ceph/inode.c:2478:2: note: remove the 'if' if its condition is always false
    2478 |         if (ret < 0 && ret != -ENODATA)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2479 |                 goto out;
         |                 ~~~~~~~~
   fs/ceph/inode.c:2472:6: warning: variable 'header' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    2472 |         if (ceph_bvecq_insert_frag(dbuf, 0, sizeof(*header), GFP_KERNEL) < 0 ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2473 |             ceph_bvecq_insert_frag(dbuf, 1, PAGE_SIZE, GFP_KERNEL) < 0)
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/inode.c:2536:15: note: uninitialized use occurs here
    2536 |         kunmap_local(header);
         |                      ^~~~~~
   fs/ceph/inode.c:2472:2: note: remove the 'if' if its condition is always false
    2472 |         if (ceph_bvecq_insert_frag(dbuf, 0, sizeof(*header), GFP_KERNEL) < 0 ||
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2473 |             ceph_bvecq_insert_frag(dbuf, 1, PAGE_SIZE, GFP_KERNEL) < 0)
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2474 |                 goto out;
         |                 ~~~~~~~~
   fs/ceph/inode.c:2472:6: warning: variable 'header' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
    2472 |         if (ceph_bvecq_insert_frag(dbuf, 0, sizeof(*header), GFP_KERNEL) < 0 ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/inode.c:2536:15: note: uninitialized use occurs here
    2536 |         kunmap_local(header);
         |                      ^~~~~~
   fs/ceph/inode.c:2472:6: note: remove the '||' if its condition is always false
    2472 |         if (ceph_bvecq_insert_frag(dbuf, 0, sizeof(*header), GFP_KERNEL) < 0 ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/inode.c:2469:6: warning: variable 'header' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    2469 |         if (!dbuf)
         |             ^~~~~
   fs/ceph/inode.c:2536:15: note: uninitialized use occurs here
    2536 |         kunmap_local(header);
         |                      ^~~~~~
   fs/ceph/inode.c:2469:2: note: remove the 'if' if its condition is always false
    2469 |         if (!dbuf)
         |         ^~~~~~~~~~
    2470 |                 goto out;
         |                 ~~~~~~~~
   fs/ceph/inode.c:2451:50: note: initialize the variable 'header' to silence this warning
    2451 |         struct ceph_fscrypt_truncate_size_header *header;
         |                                                         ^
         |                                                          = NULL
>> fs/ceph/inode.c:2503:50: warning: variable 'pos' is uninitialized when used here [-Wuninitialized]
    2503 |                 doutc(cl, "hit hole, ppos %lld < size %lld\n", pos, i_size);
         |                                                                ^~~
   fs/ceph/inode.c:2446:12: note: initialize the variable 'pos' to silence this warning
    2446 |         loff_t pos, orig_pos = round_down(attr->ia_size,
         |                   ^
         |                    = 0
   5 warnings generated.


vim +/pos +2503 fs/ceph/inode.c

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
5c64737d253683 Xiubo Li      2022-08-25  2453  	int len = CEPH_FSCRYPT_BLOCK_SIZE;
5c64737d253683 Xiubo Li      2022-08-25  2454  	loff_t i_size = i_size_read(inode);
5c64737d253683 Xiubo Li      2022-08-25  2455  	int got, ret, issued;
5c64737d253683 Xiubo Li      2022-08-25  2456  
5c64737d253683 Xiubo Li      2022-08-25  2457  	ret = __ceph_get_caps(inode, NULL, CEPH_CAP_FILE_RD, 0, -1, &got);
5c64737d253683 Xiubo Li      2022-08-25  2458  	if (ret < 0)
5c64737d253683 Xiubo Li      2022-08-25  2459  		return ret;
5c64737d253683 Xiubo Li      2022-08-25  2460  
5c64737d253683 Xiubo Li      2022-08-25  2461  	issued = __ceph_caps_issued(ci, NULL);
5c64737d253683 Xiubo Li      2022-08-25  2462  
38d46409c4639a Xiubo Li      2023-06-12  2463  	doutc(cl, "size %lld -> %lld got cap refs on %s, issued %s\n",
5c64737d253683 Xiubo Li      2022-08-25  2464  	      i_size, attr->ia_size, ceph_cap_string(got),
5c64737d253683 Xiubo Li      2022-08-25  2465  	      ceph_cap_string(issued));
5c64737d253683 Xiubo Li      2022-08-25  2466  
5c64737d253683 Xiubo Li      2022-08-25  2467  	ret = -ENOMEM;
e52f99c9eea903 David Howells 2023-08-03  2468  	dbuf = bvecq_alloc_chain(2, GFP_KERNEL, false);
e52f99c9eea903 David Howells 2023-08-03 @2469  	if (!dbuf)
5c64737d253683 Xiubo Li      2022-08-25  2470  		goto out;
5c64737d253683 Xiubo Li      2022-08-25  2471  
e52f99c9eea903 David Howells 2023-08-03  2472  	if (ceph_bvecq_insert_frag(dbuf, 0, sizeof(*header), GFP_KERNEL) < 0 ||
e52f99c9eea903 David Howells 2023-08-03  2473  	    ceph_bvecq_insert_frag(dbuf, 1, PAGE_SIZE, GFP_KERNEL) < 0)
5c64737d253683 Xiubo Li      2022-08-25  2474  		goto out;
5c64737d253683 Xiubo Li      2022-08-25  2475  
e52f99c9eea903 David Howells 2023-08-03  2476  	iov_iter_bvec_queue(&iter, ITER_DEST, dbuf, 1, 0, len);
b761e790c5985b David Howells 2024-12-05  2477  	ret = netfs_unbuffered_read_from_inode(inode, orig_pos, dbuf, len, true);
b761e790c5985b David Howells 2024-12-05  2478  	if (ret < 0 && ret != -ENODATA)
5c64737d253683 Xiubo Li      2022-08-25  2479  		goto out;
5c64737d253683 Xiubo Li      2022-08-25  2480  
e52f99c9eea903 David Howells 2023-08-03  2481  	header = kmap_local_bvecq(dbuf, 0);
e52f99c9eea903 David Howells 2023-08-03  2482  
5c64737d253683 Xiubo Li      2022-08-25  2483  	/* Insert the header first */
e52f99c9eea903 David Howells 2023-08-03  2484  	header->ver = 1;
e52f99c9eea903 David Howells 2023-08-03  2485  	header->compat = 1;
e52f99c9eea903 David Howells 2023-08-03  2486  	header->change_attr = cpu_to_le64(inode_peek_iversion_raw(inode));
5c64737d253683 Xiubo Li      2022-08-25  2487  
5c64737d253683 Xiubo Li      2022-08-25  2488  	/*
5c64737d253683 Xiubo Li      2022-08-25  2489  	 * Always set the block_size to CEPH_FSCRYPT_BLOCK_SIZE,
5c64737d253683 Xiubo Li      2022-08-25  2490  	 * because in MDS it may need this to do the truncate.
5c64737d253683 Xiubo Li      2022-08-25  2491  	 */
e52f99c9eea903 David Howells 2023-08-03  2492  	header->block_size = cpu_to_le32(CEPH_FSCRYPT_BLOCK_SIZE);
5c64737d253683 Xiubo Li      2022-08-25  2493  
5c64737d253683 Xiubo Li      2022-08-25  2494  	/*
b761e790c5985b David Howells 2024-12-05  2495  	 * If we hit a hole here, we should just skip filling the fscrypt for
b761e790c5985b David Howells 2024-12-05  2496  	 * the request, because once the fscrypt is enabled, the file will be
b761e790c5985b David Howells 2024-12-05  2497  	 * split into many blocks with the size of CEPH_FSCRYPT_BLOCK_SIZE.  If
b761e790c5985b David Howells 2024-12-05  2498  	 * there was a hole, the hole size should be multiple of block size.
5c64737d253683 Xiubo Li      2022-08-25  2499  	 *
5c64737d253683 Xiubo Li      2022-08-25  2500  	 * If the Rados object doesn't exist, it will be set to 0.
5c64737d253683 Xiubo Li      2022-08-25  2501  	 */
b761e790c5985b David Howells 2024-12-05  2502  	if (ret != -ENODATA) {
38d46409c4639a Xiubo Li      2023-06-12 @2503  		doutc(cl, "hit hole, ppos %lld < size %lld\n", pos, i_size);
5c64737d253683 Xiubo Li      2022-08-25  2504  
e52f99c9eea903 David Howells 2023-08-03  2505  		header->data_len = cpu_to_le32(8 + 8 + 4);
e52f99c9eea903 David Howells 2023-08-03  2506  		header->file_offset = 0;
5c64737d253683 Xiubo Li      2022-08-25  2507  		ret = 0;
5c64737d253683 Xiubo Li      2022-08-25  2508  	} else {
e52f99c9eea903 David Howells 2023-08-03  2509  		header->data_len = cpu_to_le32(8 + 8 + 4 + CEPH_FSCRYPT_BLOCK_SIZE);
e52f99c9eea903 David Howells 2023-08-03  2510  		header->file_offset = cpu_to_le64(orig_pos);
5c64737d253683 Xiubo Li      2022-08-25  2511  
38d46409c4639a Xiubo Li      2023-06-12  2512  		doutc(cl, "encrypt block boff/bsize %d/%lu\n", boff,
38d46409c4639a Xiubo Li      2023-06-12  2513  		      CEPH_FSCRYPT_BLOCK_SIZE);
295fc4aa7de4b7 Xiubo Li      2023-03-06  2514  
5c64737d253683 Xiubo Li      2022-08-25  2515  		/* truncate and zero out the extra contents for the last block */
e52f99c9eea903 David Howells 2023-08-03  2516  		p = kmap_local_bvecq(dbuf, 1);
e52f99c9eea903 David Howells 2023-08-03  2517  		memset(p + boff, 0, PAGE_SIZE - boff);
e52f99c9eea903 David Howells 2023-08-03  2518  		kunmap_local(p);
5c64737d253683 Xiubo Li      2022-08-25  2519  
5c64737d253683 Xiubo Li      2022-08-25  2520  		/* encrypt the last block */
e52f99c9eea903 David Howells 2023-08-03  2521  		ret = ceph_fscrypt_encrypt_block_inplace(inode, dbuf->bv[0].bv_page,
5c64737d253683 Xiubo Li      2022-08-25  2522  							 CEPH_FSCRYPT_BLOCK_SIZE,
fa65058063cbab Eric Biggers  2025-07-09  2523  							 0, block);
5c64737d253683 Xiubo Li      2022-08-25  2524  		if (ret)
5c64737d253683 Xiubo Li      2022-08-25  2525  			goto out;
5c64737d253683 Xiubo Li      2022-08-25  2526  	}
5c64737d253683 Xiubo Li      2022-08-25  2527  
e52f99c9eea903 David Howells 2023-08-03  2528  	req->r_dbuf = dbuf;
e52f99c9eea903 David Howells 2023-08-03  2529  	req->r_dbuf_len = sizeof(*header);
e52f99c9eea903 David Howells 2023-08-03  2530  	if (header->block_size)
e52f99c9eea903 David Howells 2023-08-03  2531  		req->r_dbuf_len += CEPH_FSCRYPT_BLOCK_SIZE;
5c64737d253683 Xiubo Li      2022-08-25  2532  out:
38d46409c4639a Xiubo Li      2023-06-12  2533  	doutc(cl, "%p %llx.%llx size dropping cap refs on %s\n", inode,
38d46409c4639a Xiubo Li      2023-06-12  2534  	      ceph_vinop(inode), ceph_cap_string(got));
5c64737d253683 Xiubo Li      2022-08-25  2535  	ceph_put_cap_refs(ci, got);
e52f99c9eea903 David Howells 2023-08-03  2536  	kunmap_local(header);
e52f99c9eea903 David Howells 2023-08-03  2537  	if (ret)
e52f99c9eea903 David Howells 2023-08-03  2538  		bvecq_put(dbuf);
5c64737d253683 Xiubo Li      2022-08-25  2539  	return ret;
5c64737d253683 Xiubo Li      2022-08-25  2540  }
5c64737d253683 Xiubo Li      2022-08-25  2541  

:::::: The code at line 2503 was first introduced by commit
:::::: 38d46409c4639a1d659ebfa70e27a8bed6b8ee1d ceph: print cluster fsid and client global_id in all debug logs

:::::: TO: Xiubo Li <xiubli@redhat.com>
:::::: CC: Ilya Dryomov <idryomov@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
