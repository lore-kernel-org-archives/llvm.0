Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934DA313283;
	Tue, 24 Mar 2026 05:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774330569; cv=none; b=fGIqAWvt0on4FapsHRM8Z6VcOyv28CpIQv7gp6GqBKYLWIl6HGqYbHGR9gqQhFNyvb7ha9bunv/sTXCdPPLHEE0XE0pW/C97NdRfg3dtNMK0TKBhgMh8+whpCarofUU0oGs9EyrgMfmi979YTkh3u0nFC4rn9n2xycWCcjE0aOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774330569; c=relaxed/simple;
	bh=q88KLh5UhfejvER/y+5M95nvGoORV9OcqfA8/9SFkRw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SlDPTVAB2FO6BiOY5TuMDnMpV3sHjVGifnbITJcINOh3rIGHcDgyjK/Ly28XVwAziGmuWDXsRC2uZQXD33by7GciwNihg12IpZpi9GDbyClAWwa3wk18BzSJs7klxrqYjyNQgULomek1rag2ojBb7sllwAC8v2jrOm5eKU6gUUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W9+iQ9HZ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W9+iQ9HZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774330568; x=1805866568;
  h=date:from:to:cc:subject:message-id;
  bh=q88KLh5UhfejvER/y+5M95nvGoORV9OcqfA8/9SFkRw=;
  b=W9+iQ9HZ2RVUPZT1rOKzisgbn1oq0iH4MOe8BYN+n67J6H7V+JQnE0NR
   596NzQXCC2ncXt6iEVMWr0Sb1nFYoImp20UUtG4+gKAHY1uHqNHVIkqGX
   wYQFiT+kEdztkEA29Zys3FzNG4hNqUNkBchUDNSALH9tXbjLGhhJtd0gW
   aPeVYCBqeSYyY7DAh2PfzF5ekfxodtKXfBLj3ipps8E4DAhcfDSUppeqe
   YcrmUMd4/sSZCURVI9w9iJeot6yizqVXVZvCWt1eOhwpm74B1ltz6kVBP
   kbMIpmQRMBo5kHL9KpwVCjrGsLjHWN7XeqZPijwhMlwmLP5m39jBQ1OHZ
   g==;
X-CSE-ConnectionGUID: FyYvtjNwRD2tIWcjMkQ87Q==
X-CSE-MsgGUID: dFfxCDP2Tkm+Ui/2LhY70g==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="85958702"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="85958702"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 22:36:07 -0700
X-CSE-ConnectionGUID: c7WwsnbsQ8arGrJK3yj83A==
X-CSE-MsgGUID: F4WluA6RTSmvouLBQEcPCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="247323731"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Mar 2026 22:36:05 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4uQs-000000003vT-3xoU;
	Tue, 24 Mar 2026 05:36:02 +0000
Date: Tue, 24 Mar 2026 13:35:39 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 71/77] fs/ceph/inode.c:2461:50:
 warning: variable 'pos' is uninitialized when used here
Message-ID: <202603241308.Fg5dyb2Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   05d546a07e9a570d280344cff29c354b67fda562
commit: 09897381d0511f67c818cf14d52baca9b5a941c1 [71/77] ceph: Use netfslib [INCOMPLETE]
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260324/202603241308.Fg5dyb2Z-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603241308.Fg5dyb2Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241308.Fg5dyb2Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ceph/inode.c:2461:50: warning: variable 'pos' is uninitialized when used here [-Wuninitialized]
    2461 |                 doutc(cl, "hit hole, ppos %lld < size %lld\n", pos, i_size);
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
   fs/ceph/inode.c:2404:12: note: initialize the variable 'pos' to silence this warning
    2404 |         loff_t pos, orig_pos = round_down(attr->ia_size,
         |                   ^
         |                    = 0
   1 warning generated.


vim +/pos +2461 fs/ceph/inode.c

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
5c64737d253683 Xiubo Li      2022-08-25  2411  	int len = CEPH_FSCRYPT_BLOCK_SIZE;
5c64737d253683 Xiubo Li      2022-08-25  2412  	loff_t i_size = i_size_read(inode);
5c64737d253683 Xiubo Li      2022-08-25  2413  	int got, ret, issued;
5c64737d253683 Xiubo Li      2022-08-25  2414  
5c64737d253683 Xiubo Li      2022-08-25  2415  	ret = __ceph_get_caps(inode, NULL, CEPH_CAP_FILE_RD, 0, -1, &got);
5c64737d253683 Xiubo Li      2022-08-25  2416  	if (ret < 0)
5c64737d253683 Xiubo Li      2022-08-25  2417  		return ret;
5c64737d253683 Xiubo Li      2022-08-25  2418  
5c64737d253683 Xiubo Li      2022-08-25  2419  	issued = __ceph_caps_issued(ci, NULL);
5c64737d253683 Xiubo Li      2022-08-25  2420  
38d46409c4639a Xiubo Li      2023-06-12  2421  	doutc(cl, "size %lld -> %lld got cap refs on %s, issued %s\n",
5c64737d253683 Xiubo Li      2022-08-25  2422  	      i_size, attr->ia_size, ceph_cap_string(got),
5c64737d253683 Xiubo Li      2022-08-25  2423  	      ceph_cap_string(issued));
5c64737d253683 Xiubo Li      2022-08-25  2424  
5c64737d253683 Xiubo Li      2022-08-25  2425  	ret = -ENOMEM;
46123cb68a649d David Howells 2023-08-03  2426  	dbuf = bvecq_alloc_chain(2, GFP_KERNEL);
46123cb68a649d David Howells 2023-08-03  2427  	if (!dbuf)
5c64737d253683 Xiubo Li      2022-08-25  2428  		goto out;
5c64737d253683 Xiubo Li      2022-08-25  2429  
46123cb68a649d David Howells 2023-08-03  2430  	if (ceph_bvecq_insert_frag(dbuf, 0, sizeof(*header), GFP_KERNEL) < 0 ||
46123cb68a649d David Howells 2023-08-03  2431  	    ceph_bvecq_insert_frag(dbuf, 1, PAGE_SIZE, GFP_KERNEL) < 0)
5c64737d253683 Xiubo Li      2022-08-25  2432  		goto out;
5c64737d253683 Xiubo Li      2022-08-25  2433  
46123cb68a649d David Howells 2023-08-03  2434  	iov_iter_bvec_queue(&iter, ITER_DEST, dbuf, 1, 0, len);
09897381d0511f David Howells 2024-12-05  2435  	ret = netfs_unbuffered_read_from_inode(inode, orig_pos, dbuf, len, true);
09897381d0511f David Howells 2024-12-05  2436  	if (ret < 0 && ret != -ENODATA)
5c64737d253683 Xiubo Li      2022-08-25  2437  		goto out;
5c64737d253683 Xiubo Li      2022-08-25  2438  
46123cb68a649d David Howells 2023-08-03  2439  	header = kmap_local_bvecq(dbuf, 0);
46123cb68a649d David Howells 2023-08-03  2440  
5c64737d253683 Xiubo Li      2022-08-25  2441  	/* Insert the header first */
46123cb68a649d David Howells 2023-08-03  2442  	header->ver = 1;
46123cb68a649d David Howells 2023-08-03  2443  	header->compat = 1;
46123cb68a649d David Howells 2023-08-03  2444  	header->change_attr = cpu_to_le64(inode_peek_iversion_raw(inode));
5c64737d253683 Xiubo Li      2022-08-25  2445  
5c64737d253683 Xiubo Li      2022-08-25  2446  	/*
5c64737d253683 Xiubo Li      2022-08-25  2447  	 * Always set the block_size to CEPH_FSCRYPT_BLOCK_SIZE,
5c64737d253683 Xiubo Li      2022-08-25  2448  	 * because in MDS it may need this to do the truncate.
5c64737d253683 Xiubo Li      2022-08-25  2449  	 */
46123cb68a649d David Howells 2023-08-03  2450  	header->block_size = cpu_to_le32(CEPH_FSCRYPT_BLOCK_SIZE);
5c64737d253683 Xiubo Li      2022-08-25  2451  
5c64737d253683 Xiubo Li      2022-08-25  2452  	/*
09897381d0511f David Howells 2024-12-05  2453  	 * If we hit a hole here, we should just skip filling the fscrypt for
09897381d0511f David Howells 2024-12-05  2454  	 * the request, because once the fscrypt is enabled, the file will be
09897381d0511f David Howells 2024-12-05  2455  	 * split into many blocks with the size of CEPH_FSCRYPT_BLOCK_SIZE.  If
09897381d0511f David Howells 2024-12-05  2456  	 * there was a hole, the hole size should be multiple of block size.
5c64737d253683 Xiubo Li      2022-08-25  2457  	 *
5c64737d253683 Xiubo Li      2022-08-25  2458  	 * If the Rados object doesn't exist, it will be set to 0.
5c64737d253683 Xiubo Li      2022-08-25  2459  	 */
09897381d0511f David Howells 2024-12-05  2460  	if (ret != -ENODATA) {
38d46409c4639a Xiubo Li      2023-06-12 @2461  		doutc(cl, "hit hole, ppos %lld < size %lld\n", pos, i_size);
5c64737d253683 Xiubo Li      2022-08-25  2462  
46123cb68a649d David Howells 2023-08-03  2463  		header->data_len = cpu_to_le32(8 + 8 + 4);
46123cb68a649d David Howells 2023-08-03  2464  		header->file_offset = 0;
5c64737d253683 Xiubo Li      2022-08-25  2465  		ret = 0;
5c64737d253683 Xiubo Li      2022-08-25  2466  	} else {
46123cb68a649d David Howells 2023-08-03  2467  		header->data_len = cpu_to_le32(8 + 8 + 4 + CEPH_FSCRYPT_BLOCK_SIZE);
46123cb68a649d David Howells 2023-08-03  2468  		header->file_offset = cpu_to_le64(orig_pos);
5c64737d253683 Xiubo Li      2022-08-25  2469  
38d46409c4639a Xiubo Li      2023-06-12  2470  		doutc(cl, "encrypt block boff/bsize %d/%lu\n", boff,
38d46409c4639a Xiubo Li      2023-06-12  2471  		      CEPH_FSCRYPT_BLOCK_SIZE);
295fc4aa7de4b7 Xiubo Li      2023-03-06  2472  
5c64737d253683 Xiubo Li      2022-08-25  2473  		/* truncate and zero out the extra contents for the last block */
46123cb68a649d David Howells 2023-08-03  2474  		p = kmap_local_bvecq(dbuf, 1);
46123cb68a649d David Howells 2023-08-03  2475  		memset(p + boff, 0, PAGE_SIZE - boff);
46123cb68a649d David Howells 2023-08-03  2476  		kunmap_local(p);
5c64737d253683 Xiubo Li      2022-08-25  2477  
5c64737d253683 Xiubo Li      2022-08-25  2478  		/* encrypt the last block */
46123cb68a649d David Howells 2023-08-03  2479  		ret = ceph_fscrypt_encrypt_block_inplace(inode, dbuf->bv[0].bv_page,
5c64737d253683 Xiubo Li      2022-08-25  2480  							 CEPH_FSCRYPT_BLOCK_SIZE,
fa65058063cbab Eric Biggers  2025-07-09  2481  							 0, block);
5c64737d253683 Xiubo Li      2022-08-25  2482  		if (ret)
5c64737d253683 Xiubo Li      2022-08-25  2483  			goto out;
5c64737d253683 Xiubo Li      2022-08-25  2484  	}
5c64737d253683 Xiubo Li      2022-08-25  2485  
46123cb68a649d David Howells 2023-08-03  2486  	req->r_dbuf = dbuf;
46123cb68a649d David Howells 2023-08-03  2487  	req->r_dbuf_len = sizeof(*header);
46123cb68a649d David Howells 2023-08-03  2488  	if (header->block_size)
46123cb68a649d David Howells 2023-08-03  2489  		req->r_dbuf_len += CEPH_FSCRYPT_BLOCK_SIZE;
5c64737d253683 Xiubo Li      2022-08-25  2490  out:
38d46409c4639a Xiubo Li      2023-06-12  2491  	doutc(cl, "%p %llx.%llx size dropping cap refs on %s\n", inode,
38d46409c4639a Xiubo Li      2023-06-12  2492  	      ceph_vinop(inode), ceph_cap_string(got));
5c64737d253683 Xiubo Li      2022-08-25  2493  	ceph_put_cap_refs(ci, got);
46123cb68a649d David Howells 2023-08-03  2494  	kunmap_local(header);
46123cb68a649d David Howells 2023-08-03  2495  	if (ret)
46123cb68a649d David Howells 2023-08-03  2496  		bvecq_put(dbuf);
5c64737d253683 Xiubo Li      2022-08-25  2497  	return ret;
5c64737d253683 Xiubo Li      2022-08-25  2498  }
5c64737d253683 Xiubo Li      2022-08-25  2499  

:::::: The code at line 2461 was first introduced by commit
:::::: 38d46409c4639a1d659ebfa70e27a8bed6b8ee1d ceph: print cluster fsid and client global_id in all debug logs

:::::: TO: Xiubo Li <xiubli@redhat.com>
:::::: CC: Ilya Dryomov <idryomov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
