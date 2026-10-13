Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB994718D3;
	Tue, 13 Oct 2026 04:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791866453; cv=none; b=ix9l1KJGpoNhJ8fwGF+LtqRJUHJqMAaYUE2+4KO2v7Nqq0sYVq7erHFQAdWbD36bAKam3LJeNRrej8M5OJXPwRMG1EyKaOx4tN983VmusCwyIcnIwea07ME8+nKikwPU4gplQ9mm2y+E+64a7gGGnR9D3CR6+RC6mxRixJ2A28A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791866453; c=relaxed/simple;
	bh=yjQWymrqkMyoMb6InyL7dEFMkmfoCmnRxzxmPR7TjzQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C3A2wjc15+qdELqT5SfYGYu16nnXHs9TxzYd/HIaEG2MvCYjLkbjeyrXh0aGS6XZ+bZV32F56OXPL+7GZWHeL5Sy8DyCYb/OJcjHh/CG4GcqRQVGW9xBEq8ALRIRkusETJ8J37vA72xfhjhP6e5OQZSUOSrxGe98YoM7viOXWZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hn8yTW55; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hn8yTW55"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791866452; x=1823402452;
  h=date:from:to:cc:subject:message-id;
  bh=yjQWymrqkMyoMb6InyL7dEFMkmfoCmnRxzxmPR7TjzQ=;
  b=hn8yTW555RCfh9e0GXahVpiKaiKl4+pSbTR7aOH4mRr3GBCJ/lQbj/il
   uU4STfVdtyQBVk6JVbH02jPrEL7oWkQAQMAnmSc88P9JjFy9Sr3B6Y+rA
   sQqGLTGGDSAZX722Jmx70ifjlL/+80+6E61Phk7WKfik2oDkIfskuhbQi
   UmfqAuFuKj3qpVejfPs12SvPdm8UiARStKE/uhOaxfzYnd3tuQG5Wf+BE
   t0Ury/mqQ343P2Fz0iAhtX1FHdSMvLdF7E5aesFBjT9G+d/2DKCFkLyfP
   QmqY5HQjFWNijZ8ju63XmLiR5/KLl3YVc62VIpl22Qyd/8JR0k/9qjYBn
   Q==;
X-CSE-ConnectionGUID: GsPaalaMQRqZAq0SfOTIbA==
X-CSE-MsgGUID: QoAiXZ0wTEew6rSFfmrK2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="468775"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="468775"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 21:40:52 -0700
X-CSE-ConnectionGUID: f3dua1QkSoWG2grjG63CsA==
X-CSE-MsgGUID: zobN2xqOS3Wd9GohfD2g/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1117356"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Oct 2026 21:40:50 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGUJj-00000000CWm-0hIv;
	Tue, 13 Oct 2026 04:40:47 +0000
Date: Tue, 13 Oct 2026 12:40:40 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 62/68] fs/ceph/inode.c:2504:50:
 warning: variable 'pos' is uninitialized when used here
Message-ID: <202610131231.YeMkksn0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   c67464ec28da31de31fe4358eb13c2771a280cb7
commit: ed86caec995f4071e6a31678ec9a78ab0947c856 [62/68] ceph: Use netfslib [INCOMPLETE]
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20261013/202610131231.YeMkksn0-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610131231.YeMkksn0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610131231.YeMkksn0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ceph/inode.c:2504:50: warning: variable 'pos' is uninitialized when used here [-Wuninitialized]
    2504 |                 doutc(cl, "hit hole, ppos %lld < size %lld\n", pos, i_size);
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
   fs/ceph/inode.c:2447:12: note: initialize the variable 'pos' to silence this warning
    2447 |         loff_t pos, orig_pos = round_down(attr->ia_size,
         |                   ^
         |                    = 0
   1 warning generated.


vim +/pos +2504 fs/ceph/inode.c

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
5c64737d253683b Xiubo Li      2022-08-25  2454  	int len = CEPH_FSCRYPT_BLOCK_SIZE;
5c64737d253683b Xiubo Li      2022-08-25  2455  	loff_t i_size = i_size_read(inode);
5c64737d253683b Xiubo Li      2022-08-25  2456  	int got, ret, issued;
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
5c64737d253683b Xiubo Li      2022-08-25  2468  	ret = -ENOMEM;
b30563b69a83b54 David Howells 2023-08-03  2469  	dbuf = bvecq_alloc_chain(2, GFP_KERNEL, false);
b30563b69a83b54 David Howells 2023-08-03  2470  	if (!dbuf)
5c64737d253683b Xiubo Li      2022-08-25  2471  		goto out;
5c64737d253683b Xiubo Li      2022-08-25  2472  
b30563b69a83b54 David Howells 2023-08-03  2473  	if (ceph_bvecq_insert_frag(dbuf, 0, sizeof(*header), GFP_KERNEL) < 0 ||
b30563b69a83b54 David Howells 2023-08-03  2474  	    ceph_bvecq_insert_frag(dbuf, 1, PAGE_SIZE, GFP_KERNEL) < 0)
5c64737d253683b Xiubo Li      2022-08-25  2475  		goto out;
5c64737d253683b Xiubo Li      2022-08-25  2476  
b30563b69a83b54 David Howells 2023-08-03  2477  	iov_iter_bvec_queue(&iter, ITER_DEST, dbuf, 1, 0, len);
ed86caec995f407 David Howells 2024-12-05  2478  	ret = netfs_unbuffered_read_from_inode(inode, orig_pos, dbuf, len, true);
ed86caec995f407 David Howells 2024-12-05  2479  	if (ret < 0 && ret != -ENODATA)
5c64737d253683b Xiubo Li      2022-08-25  2480  		goto out;
5c64737d253683b Xiubo Li      2022-08-25  2481  
b30563b69a83b54 David Howells 2023-08-03  2482  	header = kmap_local_bvecq(dbuf, 0);
b30563b69a83b54 David Howells 2023-08-03  2483  
5c64737d253683b Xiubo Li      2022-08-25  2484  	/* Insert the header first */
b30563b69a83b54 David Howells 2023-08-03  2485  	header->ver = 1;
b30563b69a83b54 David Howells 2023-08-03  2486  	header->compat = 1;
b30563b69a83b54 David Howells 2023-08-03  2487  	header->change_attr = cpu_to_le64(inode_peek_iversion_raw(inode));
5c64737d253683b Xiubo Li      2022-08-25  2488  
5c64737d253683b Xiubo Li      2022-08-25  2489  	/*
5c64737d253683b Xiubo Li      2022-08-25  2490  	 * Always set the block_size to CEPH_FSCRYPT_BLOCK_SIZE,
5c64737d253683b Xiubo Li      2022-08-25  2491  	 * because in MDS it may need this to do the truncate.
5c64737d253683b Xiubo Li      2022-08-25  2492  	 */
b30563b69a83b54 David Howells 2023-08-03  2493  	header->block_size = cpu_to_le32(CEPH_FSCRYPT_BLOCK_SIZE);
5c64737d253683b Xiubo Li      2022-08-25  2494  
5c64737d253683b Xiubo Li      2022-08-25  2495  	/*
ed86caec995f407 David Howells 2024-12-05  2496  	 * If we hit a hole here, we should just skip filling the fscrypt for
ed86caec995f407 David Howells 2024-12-05  2497  	 * the request, because once the fscrypt is enabled, the file will be
ed86caec995f407 David Howells 2024-12-05  2498  	 * split into many blocks with the size of CEPH_FSCRYPT_BLOCK_SIZE.  If
ed86caec995f407 David Howells 2024-12-05  2499  	 * there was a hole, the hole size should be multiple of block size.
5c64737d253683b Xiubo Li      2022-08-25  2500  	 *
5c64737d253683b Xiubo Li      2022-08-25  2501  	 * If the Rados object doesn't exist, it will be set to 0.
5c64737d253683b Xiubo Li      2022-08-25  2502  	 */
ed86caec995f407 David Howells 2024-12-05  2503  	if (ret != -ENODATA) {
38d46409c4639a1 Xiubo Li      2023-06-12 @2504  		doutc(cl, "hit hole, ppos %lld < size %lld\n", pos, i_size);
5c64737d253683b Xiubo Li      2022-08-25  2505  
b30563b69a83b54 David Howells 2023-08-03  2506  		header->data_len = cpu_to_le32(8 + 8 + 4);
b30563b69a83b54 David Howells 2023-08-03  2507  		header->file_offset = 0;
5c64737d253683b Xiubo Li      2022-08-25  2508  		ret = 0;
5c64737d253683b Xiubo Li      2022-08-25  2509  	} else {
b30563b69a83b54 David Howells 2023-08-03  2510  		header->data_len = cpu_to_le32(8 + 8 + 4 + CEPH_FSCRYPT_BLOCK_SIZE);
b30563b69a83b54 David Howells 2023-08-03  2511  		header->file_offset = cpu_to_le64(orig_pos);
5c64737d253683b Xiubo Li      2022-08-25  2512  
38d46409c4639a1 Xiubo Li      2023-06-12  2513  		doutc(cl, "encrypt block boff/bsize %d/%lu\n", boff,
38d46409c4639a1 Xiubo Li      2023-06-12  2514  		      CEPH_FSCRYPT_BLOCK_SIZE);
295fc4aa7de4b72 Xiubo Li      2023-03-06  2515  
5c64737d253683b Xiubo Li      2022-08-25  2516  		/* truncate and zero out the extra contents for the last block */
b30563b69a83b54 David Howells 2023-08-03  2517  		p = kmap_local_bvecq(dbuf, 1);
b30563b69a83b54 David Howells 2023-08-03  2518  		memset(p + boff, 0, PAGE_SIZE - boff);
b30563b69a83b54 David Howells 2023-08-03  2519  		kunmap_local(p);
5c64737d253683b Xiubo Li      2022-08-25  2520  
5c64737d253683b Xiubo Li      2022-08-25  2521  		/* encrypt the last block */
b30563b69a83b54 David Howells 2023-08-03  2522  		ret = ceph_fscrypt_encrypt_block_inplace(inode, dbuf->bv[0].bv_page,
5c64737d253683b Xiubo Li      2022-08-25  2523  							 CEPH_FSCRYPT_BLOCK_SIZE,
fa65058063cbaba Eric Biggers  2025-07-09  2524  							 0, block);
5c64737d253683b Xiubo Li      2022-08-25  2525  		if (ret)
5c64737d253683b Xiubo Li      2022-08-25  2526  			goto out;
5c64737d253683b Xiubo Li      2022-08-25  2527  	}
5c64737d253683b Xiubo Li      2022-08-25  2528  
b30563b69a83b54 David Howells 2023-08-03  2529  	req->r_dbuf = dbuf;
b30563b69a83b54 David Howells 2023-08-03  2530  	req->r_dbuf_len = sizeof(*header);
b30563b69a83b54 David Howells 2023-08-03  2531  	if (header->block_size)
b30563b69a83b54 David Howells 2023-08-03  2532  		req->r_dbuf_len += CEPH_FSCRYPT_BLOCK_SIZE;
5c64737d253683b Xiubo Li      2022-08-25  2533  out:
38d46409c4639a1 Xiubo Li      2023-06-12  2534  	doutc(cl, "%p %llx.%llx size dropping cap refs on %s\n", inode,
38d46409c4639a1 Xiubo Li      2023-06-12  2535  	      ceph_vinop(inode), ceph_cap_string(got));
5c64737d253683b Xiubo Li      2022-08-25  2536  	ceph_put_cap_refs(ci, got);
b30563b69a83b54 David Howells 2023-08-03  2537  	kunmap_local(header);
b30563b69a83b54 David Howells 2023-08-03  2538  	if (ret)
b30563b69a83b54 David Howells 2023-08-03  2539  		bvecq_put(dbuf);
5c64737d253683b Xiubo Li      2022-08-25  2540  	return ret;
5c64737d253683b Xiubo Li      2022-08-25  2541  }
5c64737d253683b Xiubo Li      2022-08-25  2542  

:::::: The code at line 2504 was first introduced by commit
:::::: 38d46409c4639a1d659ebfa70e27a8bed6b8ee1d ceph: print cluster fsid and client global_id in all debug logs

:::::: TO: Xiubo Li <xiubli@redhat.com>
:::::: CC: Ilya Dryomov <idryomov@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
