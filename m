Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C69B13173A;
	Tue, 16 Jan 2024 19:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705434693; cv=none; b=J2YMsoK5yo2RdOvVyTQ7RlxrKvY9C3umMDhjW3YnrEcu3KjUG+VP2Zo9JRAOZeQyo5j3wKYOJ+hP1CPogsVnr8D6lWmq2+sq6pfv0FY6j0476VQlhRCmvU1mVOLvpOgWheFG6WeNbxIPq4GHe+rVKYC5xydH4mnVlsdYBa3+krs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705434693; c=relaxed/simple;
	bh=kFdx2c4F1vHFnZF0iIxp6p0xGG6cA4vTi7SjqbKZA7U=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	b=HgMALAye0ooq40pFQ4jCPAnflEBw6BwD1ZLGT66QcuV7maMTOoOkXLbRnEst9UStx1xMkWku0USmJD4OfCBJT9ML3Q64wRUc1BR+M9HWlCdo80OWTFrcw91ihBeEStsf87CDet5BXeI3uWZscUc1dFCcQ7LGJz2TrivBHe3ZXkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fc+yZUks; arc=none smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fc+yZUks"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705434691; x=1736970691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kFdx2c4F1vHFnZF0iIxp6p0xGG6cA4vTi7SjqbKZA7U=;
  b=fc+yZUksOlReLifF/7KB3UQoNPuyXIC+sl+rjuRSTXORJiKq2glTWvrm
   aVEJeResLxelgqAMWZSeonbhgQ7GcmmEsDd79XgJCxv9wv+CJb6QncB96
   syurVTEs/5UZ4Z2ix755MzVA78+hHy2FLNWiX3+l0mCtZEBwREkQvwoZX
   filfpD+QG+9CUnW9gW15RmxJvlDNowfupyAI3qPSJYLOMbm4cLKZajNED
   E4ES+wnZw4pWMtSrCGkAVRqNllntJyWpjphZAZhekqurkXqpWsN6BNGoj
   EncBq+Q5f6TnazzlbHSWaRP3irhbEzrWmDMSCbrMF6kwTbijQkkwRUpaD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="403718836"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="403718836"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 11:51:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="760298487"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="760298487"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 16 Jan 2024 11:51:28 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPpT4-0001AI-0u;
	Tue, 16 Jan 2024 19:51:26 +0000
Date: Wed, 17 Jan 2024 03:51:20 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 101/105] fs/ceph/file.c:1095:47: warning:
 variable 'pages' is uninitialized when used here
Message-ID: <202401170319.8ukfAzek-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   2cf82c6e7baf6d3a2adc0692707028da395f1553
commit: 965a1375ea469bee4bbe77c7a60e7e351148a8b4 [101/105] ceph: Don't use data_pages
config: i386-buildonly-randconfig-002-20240116 (https://download.01.org/0day-ci/archive/20240117/202401170319.8ukfAzek-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240117/202401170319.8ukfAzek-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401170319.8ukfAzek-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ceph/file.c:1095:47: warning: variable 'pages' is uninitialized when used here [-Wuninitialized]
    1095 |                         fret = ceph_fscrypt_decrypt_extents(inode, pages,
         |                                                                    ^~~~~
   fs/ceph/file.c:1018:22: note: initialize the variable 'pages' to silence this warning
    1018 |                 struct page **pages;
         |                                    ^
         |                                     = NULL
   fs/ceph/file.c:1778:9: error: use of undeclared identifier 'pages'
    1778 |                                                         &pages[num_pages - 1],
         |                                                          ^
   fs/ceph/file.c:1808:24: error: use of undeclared identifier 'pages'
    1808 |                                         zero_user_segment(pages[0], 0,
         |                                                           ^
   fs/ceph/file.c:1811:24: error: use of undeclared identifier 'pages'
    1811 |                                         zero_user_segment(pages[num_pages - 1],
         |                                                           ^
   fs/ceph/file.c:1817:31: error: use of undeclared identifier 'pages'
    1817 |                                         ceph_release_page_vector(pages, num_pages);
         |                                                                  ^
   fs/ceph/file.c:1824:25: error: use of undeclared identifier 'pages'
    1824 |                                                 zero_user_segment(pages[0], 0,
         |                                                                   ^
   fs/ceph/file.c:1827:25: error: use of undeclared identifier 'pages'
    1827 |                                                 zero_user_segment(pages[num_pages - 1],
         |                                                                   ^
   fs/ceph/file.c:1835:31: error: use of undeclared identifier 'pages'
    1835 |                                         ceph_release_page_vector(pages, num_pages);
         |                                                                  ^
   fs/ceph/file.c:1842:25: error: use of undeclared identifier 'pages'
    1842 |                                                 zero_user_segment(pages[num_pages - 1],
         |                                                                   ^
   fs/ceph/file.c:1850:32: error: use of undeclared identifier 'pages'
    1850 |                                                 ceph_release_page_vector(pages, num_pages);
         |                                                                          ^
   fs/ceph/file.c:1862:8: error: use of undeclared identifier 'pages'
    1862 |                                                         pages[0], CEPH_FSCRYPT_BLOCK_SIZE,
         |                                                         ^
   fs/ceph/file.c:1866:32: error: use of undeclared identifier 'pages'
    1866 |                                                 ceph_release_page_vector(pages, num_pages);
         |                                                                          ^
   fs/ceph/file.c:1872:8: error: use of undeclared identifier 'pages'
    1872 |                                                         pages[num_pages - 1],
         |                                                         ^
   fs/ceph/file.c:1877:32: error: use of undeclared identifier 'pages'
    1877 |                                                 ceph_release_page_vector(pages, num_pages);
         |                                                                          ^
   fs/ceph/file.c:1890:30: error: use of undeclared identifier 'pages'
    1890 |                         ret = copy_page_from_iter(pages[n], off, plen, from);
         |                                                   ^
   fs/ceph/file.c:1900:29: error: use of undeclared identifier 'pages'
    1900 |                         ceph_release_page_vector(pages, num_pages);
         |                                                  ^
   fs/ceph/file.c:1905:44: error: use of undeclared identifier 'pages'
    1905 |                         ret = ceph_fscrypt_encrypt_pages(inode, pages,
         |                                                                 ^
   fs/ceph/file.c:1910:30: error: use of undeclared identifier 'pages'
    1910 |                                 ceph_release_page_vector(pages, num_pages);
         |                                                          ^
   fs/ceph/file.c:1924:29: error: use of undeclared identifier 'pages'
    1924 |                         ceph_release_page_vector(pages, num_pages);
         |                                                  ^
   fs/ceph/file.c:1929:54: error: use of undeclared identifier 'pages'
    1929 |                 osd_req_op_extent_osd_data_pages(req, rmw ? 1 : 0, pages, write_len,
         |                                                                    ^
   1 warning and 19 errors generated.


vim +/pages +1095 fs/ceph/file.c

83701246aee8f8 Yan, Zheng    2014-11-14   969  
124e68e7409909 Sage Weil     2009-10-06   970  /*
124e68e7409909 Sage Weil     2009-10-06   971   * Completely synchronous read and write methods.  Direct from __user
124e68e7409909 Sage Weil     2009-10-06   972   * buffer to osd, or directly to user pages (if O_DIRECT).
124e68e7409909 Sage Weil     2009-10-06   973   *
fce7a9744bdf3b Yan, Zheng    2018-09-29   974   * If the read spans object boundary, just do multiple reads.  (That's not
fce7a9744bdf3b Yan, Zheng    2018-09-29   975   * atomic, but good enough for now.)
fce7a9744bdf3b Yan, Zheng    2018-09-29   976   *
fce7a9744bdf3b Yan, Zheng    2018-09-29   977   * If we get a short result from the OSD, check against i_size; we need to
fce7a9744bdf3b Yan, Zheng    2018-09-29   978   * only return a short read to the caller if we hit EOF.
124e68e7409909 Sage Weil     2009-10-06   979   */
d4d518871574eb Xiubo Li      2022-08-25   980  ssize_t __ceph_sync_read(struct inode *inode, loff_t *ki_pos,
d4d518871574eb Xiubo Li      2022-08-25   981  			 struct iov_iter *to, int *retry_op,
d4d518871574eb Xiubo Li      2022-08-25   982  			 u64 *last_objver)
124e68e7409909 Sage Weil     2009-10-06   983  {
fce7a9744bdf3b Yan, Zheng    2018-09-29   984  	struct ceph_inode_info *ci = ceph_inode(inode);
5995d90d2d19f3 Xiubo Li      2023-06-12   985  	struct ceph_fs_client *fsc = ceph_inode_to_fs_client(inode);
38d46409c4639a Xiubo Li      2023-06-12   986  	struct ceph_client *cl = fsc->client;
fce7a9744bdf3b Yan, Zheng    2018-09-29   987  	struct ceph_osd_client *osdc = &fsc->client->osdc;
965a1375ea469b David Howells 2023-07-31   988  	struct ceph_databuf *dbuf;
7ce469a53e7106 Yan, Zheng    2016-11-08   989  	ssize_t ret;
d4d518871574eb Xiubo Li      2022-08-25   990  	u64 off = *ki_pos;
fce7a9744bdf3b Yan, Zheng    2018-09-29   991  	u64 len = iov_iter_count(to);
e485d028bb1075 Jeff Layton   2021-11-23   992  	u64 i_size = i_size_read(inode);
f0fe1e54cfcf52 Jeff Layton   2022-08-25   993  	bool sparse = IS_ENCRYPTED(inode) || ceph_test_mount_opt(fsc, SPARSEREAD);
d4d518871574eb Xiubo Li      2022-08-25   994  	u64 objver = 0;
124e68e7409909 Sage Weil     2009-10-06   995  
38d46409c4639a Xiubo Li      2023-06-12   996  	doutc(cl, "on inode %p %llx.%llx %llx~%llx\n", inode,
38d46409c4639a Xiubo Li      2023-06-12   997  	      ceph_vinop(inode), *ki_pos, len);
d4d518871574eb Xiubo Li      2022-08-25   998  
d4d518871574eb Xiubo Li      2022-08-25   999  	if (ceph_inode_is_shutdown(inode))
d4d518871574eb Xiubo Li      2022-08-25  1000  		return -EIO;
d0d0db2268cc34 Yan, Zheng    2014-07-21  1001  
d0d0db2268cc34 Yan, Zheng    2014-07-21  1002  	if (!len)
d0d0db2268cc34 Yan, Zheng    2014-07-21  1003  		return 0;
124e68e7409909 Sage Weil     2009-10-06  1004  	/*
124e68e7409909 Sage Weil     2009-10-06  1005  	 * flush any page cache pages in this range.  this
e98b6fed84d0f0 Sage Weil     2010-11-09  1006  	 * will make concurrent normal and sync io slow,
124e68e7409909 Sage Weil     2009-10-06  1007  	 * but it will at least behave sensibly when they are
124e68e7409909 Sage Weil     2009-10-06  1008  	 * in sequence.
124e68e7409909 Sage Weil     2009-10-06  1009  	 */
e450f4d1a5d633 zhengbin      2019-02-01  1010  	ret = filemap_write_and_wait_range(inode->i_mapping,
e450f4d1a5d633 zhengbin      2019-02-01  1011  					   off, off + len - 1);
29065a513aa4c7 Yehuda Sadeh  2010-02-09  1012  	if (ret < 0)
8eb4efb091c8d8 majianpeng    2013-09-26  1013  		return ret;
29065a513aa4c7 Yehuda Sadeh  2010-02-09  1014  
fce7a9744bdf3b Yan, Zheng    2018-09-29  1015  	ret = 0;
fce7a9744bdf3b Yan, Zheng    2018-09-29  1016  	while ((len = iov_iter_count(to)) > 0) {
fce7a9744bdf3b Yan, Zheng    2018-09-29  1017  		struct ceph_osd_request *req;
fce7a9744bdf3b Yan, Zheng    2018-09-29  1018  		struct page **pages;
fce7a9744bdf3b Yan, Zheng    2018-09-29  1019  		int num_pages;
7ce469a53e7106 Yan, Zheng    2016-11-08  1020  		size_t page_off;
fce7a9744bdf3b Yan, Zheng    2018-09-29  1021  		bool more;
c5f575ed08c38d Jeff Layton   2020-08-21  1022  		int idx;
c5f575ed08c38d Jeff Layton   2020-08-21  1023  		size_t left;
03bc06c7b0bd8d Jeff Layton   2022-02-26  1024  		struct ceph_osd_req_op *op;
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1025  		u64 read_off = off;
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1026  		u64 read_len = len;
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1027  
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1028  		/* determine new offset/length if encrypted */
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1029  		ceph_fscrypt_adjust_off_and_len(inode, &read_off, &read_len);
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1030  
38d46409c4639a Xiubo Li      2023-06-12  1031  		doutc(cl, "orig %llu~%llu reading %llu~%llu", off, len,
38d46409c4639a Xiubo Li      2023-06-12  1032  		      read_off, read_len);
fce7a9744bdf3b Yan, Zheng    2018-09-29  1033  
fce7a9744bdf3b Yan, Zheng    2018-09-29  1034  		req = ceph_osdc_new_request(osdc, &ci->i_layout,
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1035  					ci->i_vino, read_off, &read_len, 0, 1,
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1036  					sparse ? CEPH_OSD_OP_SPARSE_READ :
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1037  						 CEPH_OSD_OP_READ,
03bc06c7b0bd8d Jeff Layton   2022-02-26  1038  					CEPH_OSD_FLAG_READ,
fce7a9744bdf3b Yan, Zheng    2018-09-29  1039  					NULL, ci->i_truncate_seq,
fce7a9744bdf3b Yan, Zheng    2018-09-29  1040  					ci->i_truncate_size, false);
fce7a9744bdf3b Yan, Zheng    2018-09-29  1041  		if (IS_ERR(req)) {
fce7a9744bdf3b Yan, Zheng    2018-09-29  1042  			ret = PTR_ERR(req);
fce7a9744bdf3b Yan, Zheng    2018-09-29  1043  			break;
fce7a9744bdf3b Yan, Zheng    2018-09-29  1044  		}
fce7a9744bdf3b Yan, Zheng    2018-09-29  1045  
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1046  		/* adjust len downward if the request truncated the len */
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1047  		if (off + len > read_off + read_len)
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1048  			len = read_off + read_len - off;
fce7a9744bdf3b Yan, Zheng    2018-09-29  1049  		more = len < iov_iter_count(to);
fce7a9744bdf3b Yan, Zheng    2018-09-29  1050  
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1051  		num_pages = calc_pages_for(read_off, read_len);
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1052  		page_off = offset_in_page(off);
965a1375ea469b David Howells 2023-07-31  1053  		dbuf = ceph_databuf_req_alloc(num_pages, read_len, GFP_KERNEL);
965a1375ea469b David Howells 2023-07-31  1054  		if (!dbuf) {
fce7a9744bdf3b Yan, Zheng    2018-09-29  1055  			ceph_osdc_put_request(req);
965a1375ea469b David Howells 2023-07-31  1056  			ret = -ENOMEM;
fce7a9744bdf3b Yan, Zheng    2018-09-29  1057  			break;
fce7a9744bdf3b Yan, Zheng    2018-09-29  1058  		}
7ce469a53e7106 Yan, Zheng    2016-11-08  1059  
965a1375ea469b David Howells 2023-07-31  1060  		osd_req_op_extent_osd_databuf(req, 0, dbuf);
03bc06c7b0bd8d Jeff Layton   2022-02-26  1061  
03bc06c7b0bd8d Jeff Layton   2022-02-26  1062  		op = &req->r_ops[0];
03bc06c7b0bd8d Jeff Layton   2022-02-26  1063  		if (sparse) {
03bc06c7b0bd8d Jeff Layton   2022-02-26  1064  			ret = ceph_alloc_sparse_ext_map(op);
03bc06c7b0bd8d Jeff Layton   2022-02-26  1065  			if (ret) {
03bc06c7b0bd8d Jeff Layton   2022-02-26  1066  				ceph_osdc_put_request(req);
03bc06c7b0bd8d Jeff Layton   2022-02-26  1067  				break;
03bc06c7b0bd8d Jeff Layton   2022-02-26  1068  			}
03bc06c7b0bd8d Jeff Layton   2022-02-26  1069  		}
03bc06c7b0bd8d Jeff Layton   2022-02-26  1070  
a8af0d682ae0c9 Jeff Layton   2022-06-30  1071  		ceph_osdc_start_request(osdc, req);
fce7a9744bdf3b Yan, Zheng    2018-09-29  1072  		ret = ceph_osdc_wait_request(osdc, req);
97e27aaa9a2cbd Xiubo Li      2020-03-19  1073  
8ae99ae2b40766 Xiubo Li      2021-03-22  1074  		ceph_update_read_metrics(&fsc->mdsc->metric,
97e27aaa9a2cbd Xiubo Li      2020-03-19  1075  					 req->r_start_latency,
97e27aaa9a2cbd Xiubo Li      2020-03-19  1076  					 req->r_end_latency,
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1077  					 read_len, ret);
97e27aaa9a2cbd Xiubo Li      2020-03-19  1078  
d4d518871574eb Xiubo Li      2022-08-25  1079  		if (ret > 0)
d4d518871574eb Xiubo Li      2022-08-25  1080  			objver = req->r_version;
d4d518871574eb Xiubo Li      2022-08-25  1081  
fce7a9744bdf3b Yan, Zheng    2018-09-29  1082  		i_size = i_size_read(inode);
38d46409c4639a Xiubo Li      2023-06-12  1083  		doutc(cl, "%llu~%llu got %zd i_size %llu%s\n", off, len,
38d46409c4639a Xiubo Li      2023-06-12  1084  		      ret, i_size, (more ? " MORE" : ""));
fce7a9744bdf3b Yan, Zheng    2018-09-29  1085  
03bc06c7b0bd8d Jeff Layton   2022-02-26  1086  		/* Fix it to go to end of extent map */
03bc06c7b0bd8d Jeff Layton   2022-02-26  1087  		if (sparse && ret >= 0)
03bc06c7b0bd8d Jeff Layton   2022-02-26  1088  			ret = ceph_sparse_ext_map_end(op);
03bc06c7b0bd8d Jeff Layton   2022-02-26  1089  		else if (ret == -ENOENT)
fce7a9744bdf3b Yan, Zheng    2018-09-29  1090  			ret = 0;
03bc06c7b0bd8d Jeff Layton   2022-02-26  1091  
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1092  		if (ret > 0 && IS_ENCRYPTED(inode)) {
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1093  			int fret;
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1094  
f0fe1e54cfcf52 Jeff Layton   2022-08-25 @1095  			fret = ceph_fscrypt_decrypt_extents(inode, pages,
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1096  					read_off, op->extent.sparse_ext,
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1097  					op->extent.sparse_ext_cnt);
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1098  			if (fret < 0) {
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1099  				ret = fret;
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1100  				ceph_osdc_put_request(req);
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1101  				break;
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1102  			}
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1103  
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1104  			/* account for any partial block at the beginning */
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1105  			fret -= (off - read_off);
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1106  
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1107  			/*
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1108  			 * Short read after big offset adjustment?
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1109  			 * Nothing is usable, just call it a zero
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1110  			 * len read.
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1111  			 */
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1112  			fret = max(fret, 0);
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1113  
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1114  			/* account for partial block at the end */
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1115  			ret = min_t(ssize_t, fret, len);
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1116  		}
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1117  
03bc06c7b0bd8d Jeff Layton   2022-02-26  1118  		ceph_osdc_put_request(req);
03bc06c7b0bd8d Jeff Layton   2022-02-26  1119  
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1120  		/* Short read but not EOF? Zero out the remainder. */
fce7a9744bdf3b Yan, Zheng    2018-09-29  1121  		if (ret >= 0 && ret < len && (off + ret < i_size)) {
fce7a9744bdf3b Yan, Zheng    2018-09-29  1122  			int zlen = min(len - ret, i_size - off - ret);
fce7a9744bdf3b Yan, Zheng    2018-09-29  1123  			int zoff = page_off + ret;
03bc06c7b0bd8d Jeff Layton   2022-02-26  1124  
38d46409c4639a Xiubo Li      2023-06-12  1125  			doutc(cl, "zero gap %llu~%llu\n", off + ret,
38d46409c4639a Xiubo Li      2023-06-12  1126  			      off + ret + zlen);
fce7a9744bdf3b Yan, Zheng    2018-09-29  1127  			ceph_zero_page_vector_range(zoff, zlen, pages);
fce7a9744bdf3b Yan, Zheng    2018-09-29  1128  			ret += zlen;
fce7a9744bdf3b Yan, Zheng    2018-09-29  1129  		}
fce7a9744bdf3b Yan, Zheng    2018-09-29  1130  
c5f575ed08c38d Jeff Layton   2020-08-21  1131  		idx = 0;
c5f575ed08c38d Jeff Layton   2020-08-21  1132  		left = ret > 0 ? ret : 0;
fce7a9744bdf3b Yan, Zheng    2018-09-29  1133  		while (left > 0) {
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1134  			size_t plen, copied;
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1135  
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1136  			plen = min_t(size_t, left, PAGE_SIZE - page_off);
c5f575ed08c38d Jeff Layton   2020-08-21  1137  			SetPageUptodate(pages[idx]);
fce7a9744bdf3b Yan, Zheng    2018-09-29  1138  			copied = copy_page_to_iter(pages[idx++],
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1139  						   page_off, plen, to);
fce7a9744bdf3b Yan, Zheng    2018-09-29  1140  			off += copied;
fce7a9744bdf3b Yan, Zheng    2018-09-29  1141  			left -= copied;
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1142  			page_off = 0;
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1143  			if (copied < plen) {
fce7a9744bdf3b Yan, Zheng    2018-09-29  1144  				ret = -EFAULT;
8eb4efb091c8d8 majianpeng    2013-09-26  1145  				break;
8eb4efb091c8d8 majianpeng    2013-09-26  1146  			}
8eb4efb091c8d8 majianpeng    2013-09-26  1147  		}
965a1375ea469b David Howells 2023-07-31  1148  		ceph_databuf_release(dbuf);
8eb4efb091c8d8 majianpeng    2013-09-26  1149  
131d7eb4faa1fc Yan, Zheng    2019-07-25  1150  		if (ret < 0) {
0b98acd6188309 Ilya Dryomov  2020-09-14  1151  			if (ret == -EBLOCKLISTED)
0b98acd6188309 Ilya Dryomov  2020-09-14  1152  				fsc->blocklisted = true;
131d7eb4faa1fc Yan, Zheng    2019-07-25  1153  			break;
131d7eb4faa1fc Yan, Zheng    2019-07-25  1154  		}
131d7eb4faa1fc Yan, Zheng    2019-07-25  1155  
131d7eb4faa1fc Yan, Zheng    2019-07-25  1156  		if (off >= i_size || !more)
fce7a9744bdf3b Yan, Zheng    2018-09-29  1157  			break;
fce7a9744bdf3b Yan, Zheng    2018-09-29  1158  	}
fce7a9744bdf3b Yan, Zheng    2018-09-29  1159  
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1160  	if (ret > 0) {
d4d518871574eb Xiubo Li      2022-08-25  1161  		if (off > *ki_pos) {
c3d8e0b5de487a Xiubo Li      2021-10-30  1162  			if (off >= i_size) {
fce7a9744bdf3b Yan, Zheng    2018-09-29  1163  				*retry_op = CHECK_EOF;
d4d518871574eb Xiubo Li      2022-08-25  1164  				ret = i_size - *ki_pos;
d4d518871574eb Xiubo Li      2022-08-25  1165  				*ki_pos = i_size;
c3d8e0b5de487a Xiubo Li      2021-10-30  1166  			} else {
d4d518871574eb Xiubo Li      2022-08-25  1167  				ret = off - *ki_pos;
d4d518871574eb Xiubo Li      2022-08-25  1168  				*ki_pos = off;
8eb4efb091c8d8 majianpeng    2013-09-26  1169  			}
c3d8e0b5de487a Xiubo Li      2021-10-30  1170  		}
8eb4efb091c8d8 majianpeng    2013-09-26  1171  
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1172  		if (last_objver)
d4d518871574eb Xiubo Li      2022-08-25  1173  			*last_objver = objver;
f0fe1e54cfcf52 Jeff Layton   2022-08-25  1174  	}
38d46409c4639a Xiubo Li      2023-06-12  1175  	doutc(cl, "result %zd retry_op %d\n", ret, *retry_op);
124e68e7409909 Sage Weil     2009-10-06  1176  	return ret;
124e68e7409909 Sage Weil     2009-10-06  1177  }
124e68e7409909 Sage Weil     2009-10-06  1178  

:::::: The code at line 1095 was first introduced by commit
:::::: f0fe1e54cfcf5209a88d720671dc6637774b8757 ceph: plumb in decryption during reads

:::::: TO: Jeff Layton <jlayton@kernel.org>
:::::: CC: Ilya Dryomov <idryomov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
