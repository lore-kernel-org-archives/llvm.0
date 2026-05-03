Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC58399374;
	Sun,  3 May 2026 17:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777831128; cv=none; b=K2HuaLDkkO9k6A4TV1B6jI4W7XyWbpAcAkKsfLL3cRES5uAAw7/Mrsen3SdVWFt8TjBvFbT5nys8EqO4iZxotNbreDb/y+oWaONUSeVyY+5XF4pl+2AeGT0uc9g87OuCzmegLp9hMm4fTHEesSfaKF64Y3qwkWsJls+fVSj4DcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777831128; c=relaxed/simple;
	bh=9F3U7SNHEHzmz8NNlx082nk+afFFhmBJHdIZHw4MP38=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dsg3o7p4OQaKlXm9QwgyPtXrggpQTO/vzpvOuCxuerc87Iob0Vt0xqrWv4Bv48hZg5m5ft+apFwWjja02/VRJwtDgrxAfmT1klVI6TpWmp8IzCiAZWR4LgA+Y8M1zXbNih1sVta48pP/V6+tMMTKKs9cvEyn8Eb+IzCx2q+8SSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cvRyZZdS; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cvRyZZdS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777831127; x=1809367127;
  h=date:from:to:cc:subject:message-id;
  bh=9F3U7SNHEHzmz8NNlx082nk+afFFhmBJHdIZHw4MP38=;
  b=cvRyZZdSROUyS0OAN8oHJ+adUg3JQTaOyneQ9J/Ogsi5NTEAYx2OQcfg
   /ghU9kAwJyziuQCLVgSrJxWL3vQGWzbbpI0wPhOyj2xWTASVDiDyd5CSO
   9iOb3Sfy+vjjNcxrw5r2Ej6YB0veiyxPV/ARn2MkYGuX/ZMdEI4tj67Dd
   KVZpy9hmmZOQp4FPk9gLlt6Wf42R+xbG1QmSsa3HoY/ItnywAizxUss5r
   h15I4grh7Bi67KGT8HoA9WFbJ4czIja/ZirbnFe5qykn+PR13lcmYfFtg
   YGXZSzXJpfo/ifWl/n6xhRDd7Xw8GTrrHxOKAirJXTrsMGONm5EOPy9UB
   A==;
X-CSE-ConnectionGUID: bQYI3zNsTc2jidjPmp4u/Q==
X-CSE-MsgGUID: Tb/IJdYOTi2fcqaU6TY7gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78605925"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="78605925"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 10:58:46 -0700
X-CSE-ConnectionGUID: 63bToY+4QFibek5cgm54iA==
X-CSE-MsgGUID: 0+U0sagjSWG6ZlCBHCD8Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="265676090"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 May 2026 10:58:44 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJb5N-000000002qT-0QAG;
	Sun, 03 May 2026 17:58:34 +0000
Date: Mon, 04 May 2026 01:58:06 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 98/103] fs/ceph/inode.c:2502:50:
 warning: variable 'pos' is uninitialized when used here
Message-ID: <202605040125.TvvMETPu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   62509662bb514752f7ae58e3c60ed040bd2bafaf
commit: 4a435e6fadf480f11ee22349cd7be8357ad0ff21 [98/103] ceph: Use netfslib [INCOMPLETE]
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260504/202605040125.TvvMETPu-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605040125.TvvMETPu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605040125.TvvMETPu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ceph/inode.c:2502:50: warning: variable 'pos' is uninitialized when used here [-Wuninitialized]
    2502 |                 doutc(cl, "hit hole, ppos %lld < size %lld\n", pos, i_size);
         |                                                                ^~~
   include/linux/ceph/ceph_debug.h:27:6: note: expanded from macro 'doutc'
      27 |                  ##__VA_ARGS__)
         |                    ^~~~~~~~~~~
   include/linux/printk.h:635:26: note: expanded from macro 'pr_debug'
     635 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~
   include/linux/dynamic_debug.h:281:22: note: expanded from macro 'dynamic_pr_debug'
     281 |                            pr_fmt(fmt), ##__VA_ARGS__)
         |                                           ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   fs/ceph/inode.c:2445:12: note: initialize the variable 'pos' to silence this warning
    2445 |         loff_t pos, orig_pos = round_down(attr->ia_size,
         |                   ^
         |                    = 0
   1 warning generated.


vim +/pos +2502 fs/ceph/inode.c

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
5c64737d253683b Xiubo Li      2022-08-25  2452  	int len = CEPH_FSCRYPT_BLOCK_SIZE;
5c64737d253683b Xiubo Li      2022-08-25  2453  	loff_t i_size = i_size_read(inode);
5c64737d253683b Xiubo Li      2022-08-25  2454  	int got, ret, issued;
5c64737d253683b Xiubo Li      2022-08-25  2455  
5c64737d253683b Xiubo Li      2022-08-25  2456  	ret = __ceph_get_caps(inode, NULL, CEPH_CAP_FILE_RD, 0, -1, &got);
5c64737d253683b Xiubo Li      2022-08-25  2457  	if (ret < 0)
5c64737d253683b Xiubo Li      2022-08-25  2458  		return ret;
5c64737d253683b Xiubo Li      2022-08-25  2459  
5c64737d253683b Xiubo Li      2022-08-25  2460  	issued = __ceph_caps_issued(ci, NULL);
5c64737d253683b Xiubo Li      2022-08-25  2461  
38d46409c4639a1 Xiubo Li      2023-06-12  2462  	doutc(cl, "size %lld -> %lld got cap refs on %s, issued %s\n",
5c64737d253683b Xiubo Li      2022-08-25  2463  	      i_size, attr->ia_size, ceph_cap_string(got),
5c64737d253683b Xiubo Li      2022-08-25  2464  	      ceph_cap_string(issued));
5c64737d253683b Xiubo Li      2022-08-25  2465  
5c64737d253683b Xiubo Li      2022-08-25  2466  	ret = -ENOMEM;
3233a4eba55cbb6 David Howells 2023-08-03  2467  	dbuf = bvecq_alloc_chain(2, GFP_KERNEL);
3233a4eba55cbb6 David Howells 2023-08-03  2468  	if (!dbuf)
5c64737d253683b Xiubo Li      2022-08-25  2469  		goto out;
5c64737d253683b Xiubo Li      2022-08-25  2470  
3233a4eba55cbb6 David Howells 2023-08-03  2471  	if (ceph_bvecq_insert_frag(dbuf, 0, sizeof(*header), GFP_KERNEL) < 0 ||
3233a4eba55cbb6 David Howells 2023-08-03  2472  	    ceph_bvecq_insert_frag(dbuf, 1, PAGE_SIZE, GFP_KERNEL) < 0)
5c64737d253683b Xiubo Li      2022-08-25  2473  		goto out;
5c64737d253683b Xiubo Li      2022-08-25  2474  
3233a4eba55cbb6 David Howells 2023-08-03  2475  	iov_iter_bvec_queue(&iter, ITER_DEST, dbuf, 1, 0, len);
4a435e6fadf480f David Howells 2024-12-05  2476  	ret = netfs_unbuffered_read_from_inode(inode, orig_pos, dbuf, len, true);
4a435e6fadf480f David Howells 2024-12-05  2477  	if (ret < 0 && ret != -ENODATA)
5c64737d253683b Xiubo Li      2022-08-25  2478  		goto out;
5c64737d253683b Xiubo Li      2022-08-25  2479  
3233a4eba55cbb6 David Howells 2023-08-03  2480  	header = kmap_local_bvecq(dbuf, 0);
3233a4eba55cbb6 David Howells 2023-08-03  2481  
5c64737d253683b Xiubo Li      2022-08-25  2482  	/* Insert the header first */
3233a4eba55cbb6 David Howells 2023-08-03  2483  	header->ver = 1;
3233a4eba55cbb6 David Howells 2023-08-03  2484  	header->compat = 1;
3233a4eba55cbb6 David Howells 2023-08-03  2485  	header->change_attr = cpu_to_le64(inode_peek_iversion_raw(inode));
5c64737d253683b Xiubo Li      2022-08-25  2486  
5c64737d253683b Xiubo Li      2022-08-25  2487  	/*
5c64737d253683b Xiubo Li      2022-08-25  2488  	 * Always set the block_size to CEPH_FSCRYPT_BLOCK_SIZE,
5c64737d253683b Xiubo Li      2022-08-25  2489  	 * because in MDS it may need this to do the truncate.
5c64737d253683b Xiubo Li      2022-08-25  2490  	 */
3233a4eba55cbb6 David Howells 2023-08-03  2491  	header->block_size = cpu_to_le32(CEPH_FSCRYPT_BLOCK_SIZE);
5c64737d253683b Xiubo Li      2022-08-25  2492  
5c64737d253683b Xiubo Li      2022-08-25  2493  	/*
4a435e6fadf480f David Howells 2024-12-05  2494  	 * If we hit a hole here, we should just skip filling the fscrypt for
4a435e6fadf480f David Howells 2024-12-05  2495  	 * the request, because once the fscrypt is enabled, the file will be
4a435e6fadf480f David Howells 2024-12-05  2496  	 * split into many blocks with the size of CEPH_FSCRYPT_BLOCK_SIZE.  If
4a435e6fadf480f David Howells 2024-12-05  2497  	 * there was a hole, the hole size should be multiple of block size.
5c64737d253683b Xiubo Li      2022-08-25  2498  	 *
5c64737d253683b Xiubo Li      2022-08-25  2499  	 * If the Rados object doesn't exist, it will be set to 0.
5c64737d253683b Xiubo Li      2022-08-25  2500  	 */
4a435e6fadf480f David Howells 2024-12-05  2501  	if (ret != -ENODATA) {
38d46409c4639a1 Xiubo Li      2023-06-12 @2502  		doutc(cl, "hit hole, ppos %lld < size %lld\n", pos, i_size);
5c64737d253683b Xiubo Li      2022-08-25  2503  
3233a4eba55cbb6 David Howells 2023-08-03  2504  		header->data_len = cpu_to_le32(8 + 8 + 4);
3233a4eba55cbb6 David Howells 2023-08-03  2505  		header->file_offset = 0;
5c64737d253683b Xiubo Li      2022-08-25  2506  		ret = 0;
5c64737d253683b Xiubo Li      2022-08-25  2507  	} else {
3233a4eba55cbb6 David Howells 2023-08-03  2508  		header->data_len = cpu_to_le32(8 + 8 + 4 + CEPH_FSCRYPT_BLOCK_SIZE);
3233a4eba55cbb6 David Howells 2023-08-03  2509  		header->file_offset = cpu_to_le64(orig_pos);
5c64737d253683b Xiubo Li      2022-08-25  2510  
38d46409c4639a1 Xiubo Li      2023-06-12  2511  		doutc(cl, "encrypt block boff/bsize %d/%lu\n", boff,
38d46409c4639a1 Xiubo Li      2023-06-12  2512  		      CEPH_FSCRYPT_BLOCK_SIZE);
295fc4aa7de4b72 Xiubo Li      2023-03-06  2513  
5c64737d253683b Xiubo Li      2022-08-25  2514  		/* truncate and zero out the extra contents for the last block */
3233a4eba55cbb6 David Howells 2023-08-03  2515  		p = kmap_local_bvecq(dbuf, 1);
3233a4eba55cbb6 David Howells 2023-08-03  2516  		memset(p + boff, 0, PAGE_SIZE - boff);
3233a4eba55cbb6 David Howells 2023-08-03  2517  		kunmap_local(p);
5c64737d253683b Xiubo Li      2022-08-25  2518  
5c64737d253683b Xiubo Li      2022-08-25  2519  		/* encrypt the last block */
3233a4eba55cbb6 David Howells 2023-08-03  2520  		ret = ceph_fscrypt_encrypt_block_inplace(inode, dbuf->bv[0].bv_page,
5c64737d253683b Xiubo Li      2022-08-25  2521  							 CEPH_FSCRYPT_BLOCK_SIZE,
fa65058063cbaba Eric Biggers  2025-07-09  2522  							 0, block);
5c64737d253683b Xiubo Li      2022-08-25  2523  		if (ret)
5c64737d253683b Xiubo Li      2022-08-25  2524  			goto out;
5c64737d253683b Xiubo Li      2022-08-25  2525  	}
5c64737d253683b Xiubo Li      2022-08-25  2526  
3233a4eba55cbb6 David Howells 2023-08-03  2527  	req->r_dbuf = dbuf;
3233a4eba55cbb6 David Howells 2023-08-03  2528  	req->r_dbuf_len = sizeof(*header);
3233a4eba55cbb6 David Howells 2023-08-03  2529  	if (header->block_size)
3233a4eba55cbb6 David Howells 2023-08-03  2530  		req->r_dbuf_len += CEPH_FSCRYPT_BLOCK_SIZE;
5c64737d253683b Xiubo Li      2022-08-25  2531  out:
38d46409c4639a1 Xiubo Li      2023-06-12  2532  	doutc(cl, "%p %llx.%llx size dropping cap refs on %s\n", inode,
38d46409c4639a1 Xiubo Li      2023-06-12  2533  	      ceph_vinop(inode), ceph_cap_string(got));
5c64737d253683b Xiubo Li      2022-08-25  2534  	ceph_put_cap_refs(ci, got);
3233a4eba55cbb6 David Howells 2023-08-03  2535  	kunmap_local(header);
3233a4eba55cbb6 David Howells 2023-08-03  2536  	if (ret)
3233a4eba55cbb6 David Howells 2023-08-03  2537  		bvecq_put(dbuf);
5c64737d253683b Xiubo Li      2022-08-25  2538  	return ret;
5c64737d253683b Xiubo Li      2022-08-25  2539  }
5c64737d253683b Xiubo Li      2022-08-25  2540  

:::::: The code at line 2502 was first introduced by commit
:::::: 38d46409c4639a1d659ebfa70e27a8bed6b8ee1d ceph: print cluster fsid and client global_id in all debug logs

:::::: TO: Xiubo Li <xiubli@redhat.com>
:::::: CC: Ilya Dryomov <idryomov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
