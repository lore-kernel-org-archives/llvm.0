Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8CA2105;
	Wed, 30 Aug 2023 10:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693390451; x=1724926451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vynbWZlwr/JT2pLXw6y16GVJ/dt66TS3jD9f0b++CoU=;
  b=QaG9vtOfjKG9c8RDlTirzIDUFPMzZxPbH03207XpXP29VRFHaeD+H++1
   MVCup2SPXu+oijRc84/eICzbkKrIqRoRh1Pdd/T1bm/JQ4eDOgA1xp41V
   bQQdHgnIMRu4VEcraRA6LU99uDXUlqAbZEYp8fkrBNmO+yAO2ktYW8VjG
   tUb1SBW/7ftDf7AVPkTheTSQP6bwcqaTe+qXg13Klw+Xb0KAYEqr2Gkvh
   KNFE+Irbxu3qY15I02/O3qh98lXvTfrW9DIwzAQ2DF5G2YS6KfxswH9lU
   UP9a3ZKekoIp5O44NjJJqc/cRUw53Usy3zuH9bXTX0swwWjRgQm8j3K4q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="375557848"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="scan'208";a="375557848"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 03:07:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="985690295"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="scan'208";a="985690295"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 30 Aug 2023 03:07:51 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbI73-0009hH-3C;
	Wed, 30 Aug 2023 10:07:49 +0000
Date: Wed, 30 Aug 2023 18:07:05 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 34/36] fs/ceph/file.c:1093:47: warning:
 variable 'pages' is uninitialized when used here
Message-ID: <202308301843.IrXAzePa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   d9c2320ef61eb3f02f0f9cbb4b8811c9991160ac
commit: f8a351bc221199c2fd754da13015cbdb37bfe5c0 [34/36] ceph: Don't use data_pages
config: x86_64-randconfig-011-20230830 (https://download.01.org/0day-ci/archive/20230830/202308301843.IrXAzePa-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308301843.IrXAzePa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308301843.IrXAzePa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ceph/file.c:1093:47: warning: variable 'pages' is uninitialized when used here [-Wuninitialized]
                           fret = ceph_fscrypt_decrypt_extents(inode, pages, read_off,
                                                                      ^~~~~
   fs/ceph/file.c:1016:22: note: initialize the variable 'pages' to silence this warning
                   struct page **pages;
                                      ^
                                       = NULL
   fs/ceph/file.c:1775:9: error: use of undeclared identifier 'pages'
                                                           &pages[num_pages - 1],
                                                            ^
   fs/ceph/file.c:1805:24: error: use of undeclared identifier 'pages'
                                           zero_user_segment(pages[0], 0,
                                                             ^
   fs/ceph/file.c:1808:24: error: use of undeclared identifier 'pages'
                                           zero_user_segment(pages[num_pages - 1],
                                                             ^
   fs/ceph/file.c:1814:31: error: use of undeclared identifier 'pages'
                                           ceph_release_page_vector(pages, num_pages);
                                                                    ^
   fs/ceph/file.c:1821:25: error: use of undeclared identifier 'pages'
                                                   zero_user_segment(pages[0], 0,
                                                                     ^
   fs/ceph/file.c:1824:25: error: use of undeclared identifier 'pages'
                                                   zero_user_segment(pages[num_pages - 1],
                                                                     ^
   fs/ceph/file.c:1832:31: error: use of undeclared identifier 'pages'
                                           ceph_release_page_vector(pages, num_pages);
                                                                    ^
   fs/ceph/file.c:1839:25: error: use of undeclared identifier 'pages'
                                                   zero_user_segment(pages[num_pages - 1],
                                                                     ^
   fs/ceph/file.c:1847:32: error: use of undeclared identifier 'pages'
                                                   ceph_release_page_vector(pages, num_pages);
                                                                            ^
   fs/ceph/file.c:1859:8: error: use of undeclared identifier 'pages'
                                                           pages[0],
                                                           ^
   fs/ceph/file.c:1864:32: error: use of undeclared identifier 'pages'
                                                   ceph_release_page_vector(pages, num_pages);
                                                                            ^
   fs/ceph/file.c:1870:8: error: use of undeclared identifier 'pages'
                                                           pages[num_pages - 1],
                                                           ^
   fs/ceph/file.c:1875:32: error: use of undeclared identifier 'pages'
                                                   ceph_release_page_vector(pages, num_pages);
                                                                            ^
   fs/ceph/file.c:1888:30: error: use of undeclared identifier 'pages'
                           ret = copy_page_from_iter(pages[n], off, plen, from);
                                                     ^
   fs/ceph/file.c:1898:29: error: use of undeclared identifier 'pages'
                           ceph_release_page_vector(pages, num_pages);
                                                    ^
   fs/ceph/file.c:1903:44: error: use of undeclared identifier 'pages'
                           ret = ceph_fscrypt_encrypt_pages(inode, pages,
                                                                   ^
   fs/ceph/file.c:1908:30: error: use of undeclared identifier 'pages'
                                   ceph_release_page_vector(pages, num_pages);
                                                            ^
   fs/ceph/file.c:1922:29: error: use of undeclared identifier 'pages'
                           ceph_release_page_vector(pages, num_pages);
                                                    ^
   fs/ceph/file.c:1927:54: error: use of undeclared identifier 'pages'
                   osd_req_op_extent_osd_data_pages(req, rmw ? 1 : 0, pages, write_len,
                                                                      ^
   1 warning and 19 errors generated.


vim +/pages +1093 fs/ceph/file.c

83701246aee8f8 Yan, Zheng    2014-11-14   967  
124e68e7409909 Sage Weil     2009-10-06   968  /*
124e68e7409909 Sage Weil     2009-10-06   969   * Completely synchronous read and write methods.  Direct from __user
124e68e7409909 Sage Weil     2009-10-06   970   * buffer to osd, or directly to user pages (if O_DIRECT).
124e68e7409909 Sage Weil     2009-10-06   971   *
fce7a9744bdf3b Yan, Zheng    2018-09-29   972   * If the read spans object boundary, just do multiple reads.  (That's not
fce7a9744bdf3b Yan, Zheng    2018-09-29   973   * atomic, but good enough for now.)
fce7a9744bdf3b Yan, Zheng    2018-09-29   974   *
fce7a9744bdf3b Yan, Zheng    2018-09-29   975   * If we get a short result from the OSD, check against i_size; we need to
fce7a9744bdf3b Yan, Zheng    2018-09-29   976   * only return a short read to the caller if we hit EOF.
124e68e7409909 Sage Weil     2009-10-06   977   */
b8bcecad77673d Xiubo Li      2022-08-25   978  ssize_t __ceph_sync_read(struct inode *inode, loff_t *ki_pos,
64d91d8e38e5e6 Xiubo Li      2022-08-25   979  			 struct iov_iter *to, int *retry_op,
64d91d8e38e5e6 Xiubo Li      2022-08-25   980  			 u64 *last_objver)
124e68e7409909 Sage Weil     2009-10-06   981  {
fce7a9744bdf3b Yan, Zheng    2018-09-29   982  	struct ceph_inode_info *ci = ceph_inode(inode);
8cc5ed1b046309 Xiubo Li      2023-06-12   983  	struct ceph_fs_client *fsc = ceph_inode_to_fs_client(inode);
a62395e8e6ec3f Xiubo Li      2023-06-12   984  	struct ceph_client *cl = fsc->client;
fce7a9744bdf3b Yan, Zheng    2018-09-29   985  	struct ceph_osd_client *osdc = &fsc->client->osdc;
f8a351bc221199 David Howells 2023-07-31   986  	struct ceph_databuf *dbuf;
7ce469a53e7106 Yan, Zheng    2016-11-08   987  	ssize_t ret;
b8bcecad77673d Xiubo Li      2022-08-25   988  	u64 off = *ki_pos;
fce7a9744bdf3b Yan, Zheng    2018-09-29   989  	u64 len = iov_iter_count(to);
e485d028bb1075 Jeff Layton   2021-11-23   990  	u64 i_size = i_size_read(inode);
ce6cca94223207 Jeff Layton   2022-08-25   991  	bool sparse = IS_ENCRYPTED(inode) || ceph_test_mount_opt(fsc, SPARSEREAD);
64d91d8e38e5e6 Xiubo Li      2022-08-25   992  	u64 objver = 0;
124e68e7409909 Sage Weil     2009-10-06   993  
a62395e8e6ec3f Xiubo Li      2023-06-12   994  	doutc(cl, "on inode %p %llx.%llx %llx~%llx\n", inode,
a62395e8e6ec3f Xiubo Li      2023-06-12   995  	      ceph_vinop(inode), *ki_pos, len);
b8bcecad77673d Xiubo Li      2022-08-25   996  
b8bcecad77673d Xiubo Li      2022-08-25   997  	if (ceph_inode_is_shutdown(inode))
b8bcecad77673d Xiubo Li      2022-08-25   998  		return -EIO;
d0d0db2268cc34 Yan, Zheng    2014-07-21   999  
d0d0db2268cc34 Yan, Zheng    2014-07-21  1000  	if (!len)
d0d0db2268cc34 Yan, Zheng    2014-07-21  1001  		return 0;
124e68e7409909 Sage Weil     2009-10-06  1002  	/*
124e68e7409909 Sage Weil     2009-10-06  1003  	 * flush any page cache pages in this range.  this
e98b6fed84d0f0 Sage Weil     2010-11-09  1004  	 * will make concurrent normal and sync io slow,
124e68e7409909 Sage Weil     2009-10-06  1005  	 * but it will at least behave sensibly when they are
124e68e7409909 Sage Weil     2009-10-06  1006  	 * in sequence.
124e68e7409909 Sage Weil     2009-10-06  1007  	 */
e450f4d1a5d633 zhengbin      2019-02-01  1008  	ret = filemap_write_and_wait_range(inode->i_mapping,
e450f4d1a5d633 zhengbin      2019-02-01  1009  					   off, off + len - 1);
29065a513aa4c7 Yehuda Sadeh  2010-02-09  1010  	if (ret < 0)
8eb4efb091c8d8 majianpeng    2013-09-26  1011  		return ret;
29065a513aa4c7 Yehuda Sadeh  2010-02-09  1012  
fce7a9744bdf3b Yan, Zheng    2018-09-29  1013  	ret = 0;
fce7a9744bdf3b Yan, Zheng    2018-09-29  1014  	while ((len = iov_iter_count(to)) > 0) {
fce7a9744bdf3b Yan, Zheng    2018-09-29  1015  		struct ceph_osd_request *req;
fce7a9744bdf3b Yan, Zheng    2018-09-29  1016  		struct page **pages;
fce7a9744bdf3b Yan, Zheng    2018-09-29  1017  		int num_pages;
7ce469a53e7106 Yan, Zheng    2016-11-08  1018  		size_t page_off;
fce7a9744bdf3b Yan, Zheng    2018-09-29  1019  		bool more;
c5f575ed08c38d Jeff Layton   2020-08-21  1020  		int idx;
c5f575ed08c38d Jeff Layton   2020-08-21  1021  		size_t left;
773e261d0fe08f Jeff Layton   2022-02-26  1022  		struct ceph_osd_req_op *op;
ce6cca94223207 Jeff Layton   2022-08-25  1023  		u64 read_off = off;
ce6cca94223207 Jeff Layton   2022-08-25  1024  		u64 read_len = len;
ce6cca94223207 Jeff Layton   2022-08-25  1025  
ce6cca94223207 Jeff Layton   2022-08-25  1026  		/* determine new offset/length if encrypted */
ce6cca94223207 Jeff Layton   2022-08-25  1027  		ceph_fscrypt_adjust_off_and_len(inode, &read_off, &read_len);
ce6cca94223207 Jeff Layton   2022-08-25  1028  
a62395e8e6ec3f Xiubo Li      2023-06-12  1029  		doutc(cl, "orig %llu~%llu reading %llu~%llu", off, len,
a62395e8e6ec3f Xiubo Li      2023-06-12  1030  		      read_off, read_len);
fce7a9744bdf3b Yan, Zheng    2018-09-29  1031  
fce7a9744bdf3b Yan, Zheng    2018-09-29  1032  		req = ceph_osdc_new_request(osdc, &ci->i_layout,
ce6cca94223207 Jeff Layton   2022-08-25  1033  					ci->i_vino, read_off, &read_len, 0, 1,
ce6cca94223207 Jeff Layton   2022-08-25  1034  					sparse ? CEPH_OSD_OP_SPARSE_READ :
ce6cca94223207 Jeff Layton   2022-08-25  1035  						 CEPH_OSD_OP_READ,
773e261d0fe08f Jeff Layton   2022-02-26  1036  					CEPH_OSD_FLAG_READ,
fce7a9744bdf3b Yan, Zheng    2018-09-29  1037  					NULL, ci->i_truncate_seq,
fce7a9744bdf3b Yan, Zheng    2018-09-29  1038  					ci->i_truncate_size, false);
fce7a9744bdf3b Yan, Zheng    2018-09-29  1039  		if (IS_ERR(req)) {
fce7a9744bdf3b Yan, Zheng    2018-09-29  1040  			ret = PTR_ERR(req);
fce7a9744bdf3b Yan, Zheng    2018-09-29  1041  			break;
fce7a9744bdf3b Yan, Zheng    2018-09-29  1042  		}
fce7a9744bdf3b Yan, Zheng    2018-09-29  1043  
ce6cca94223207 Jeff Layton   2022-08-25  1044  		/* adjust len downward if the request truncated the len */
ce6cca94223207 Jeff Layton   2022-08-25  1045  		if (off + len > read_off + read_len)
ce6cca94223207 Jeff Layton   2022-08-25  1046  			len = read_off + read_len - off;
fce7a9744bdf3b Yan, Zheng    2018-09-29  1047  		more = len < iov_iter_count(to);
fce7a9744bdf3b Yan, Zheng    2018-09-29  1048  
ce6cca94223207 Jeff Layton   2022-08-25  1049  		num_pages = calc_pages_for(read_off, read_len);
ce6cca94223207 Jeff Layton   2022-08-25  1050  		page_off = offset_in_page(off);
f8a351bc221199 David Howells 2023-07-31  1051  		dbuf = ceph_databuf_req_alloc(num_pages, read_len, GFP_KERNEL);
f8a351bc221199 David Howells 2023-07-31  1052  		if (!dbuf) {
fce7a9744bdf3b Yan, Zheng    2018-09-29  1053  			ceph_osdc_put_request(req);
f8a351bc221199 David Howells 2023-07-31  1054  			ret = -ENOMEM;
fce7a9744bdf3b Yan, Zheng    2018-09-29  1055  			break;
fce7a9744bdf3b Yan, Zheng    2018-09-29  1056  		}
7ce469a53e7106 Yan, Zheng    2016-11-08  1057  
f8a351bc221199 David Howells 2023-07-31  1058  		osd_req_op_extent_osd_databuf(req, 0, dbuf);
773e261d0fe08f Jeff Layton   2022-02-26  1059  
773e261d0fe08f Jeff Layton   2022-02-26  1060  		op = &req->r_ops[0];
773e261d0fe08f Jeff Layton   2022-02-26  1061  		if (sparse) {
773e261d0fe08f Jeff Layton   2022-02-26  1062  			ret = ceph_alloc_sparse_ext_map(op);
773e261d0fe08f Jeff Layton   2022-02-26  1063  			if (ret) {
773e261d0fe08f Jeff Layton   2022-02-26  1064  				ceph_osdc_put_request(req);
773e261d0fe08f Jeff Layton   2022-02-26  1065  				break;
773e261d0fe08f Jeff Layton   2022-02-26  1066  			}
773e261d0fe08f Jeff Layton   2022-02-26  1067  		}
773e261d0fe08f Jeff Layton   2022-02-26  1068  
a8af0d682ae0c9 Jeff Layton   2022-06-30  1069  		ceph_osdc_start_request(osdc, req);
fce7a9744bdf3b Yan, Zheng    2018-09-29  1070  		ret = ceph_osdc_wait_request(osdc, req);
97e27aaa9a2cbd Xiubo Li      2020-03-19  1071  
8ae99ae2b40766 Xiubo Li      2021-03-22  1072  		ceph_update_read_metrics(&fsc->mdsc->metric,
97e27aaa9a2cbd Xiubo Li      2020-03-19  1073  					 req->r_start_latency,
97e27aaa9a2cbd Xiubo Li      2020-03-19  1074  					 req->r_end_latency,
ce6cca94223207 Jeff Layton   2022-08-25  1075  					 read_len, ret);
97e27aaa9a2cbd Xiubo Li      2020-03-19  1076  
64d91d8e38e5e6 Xiubo Li      2022-08-25  1077  		if (ret > 0)
64d91d8e38e5e6 Xiubo Li      2022-08-25  1078  			objver = req->r_version;
64d91d8e38e5e6 Xiubo Li      2022-08-25  1079  
fce7a9744bdf3b Yan, Zheng    2018-09-29  1080  		i_size = i_size_read(inode);
a62395e8e6ec3f Xiubo Li      2023-06-12  1081  		doutc(cl, "%llu~%llu got %zd i_size %llu%s\n", off, len,
a62395e8e6ec3f Xiubo Li      2023-06-12  1082  		      ret, i_size, (more ? " MORE" : ""));
fce7a9744bdf3b Yan, Zheng    2018-09-29  1083  
773e261d0fe08f Jeff Layton   2022-02-26  1084  		/* Fix it to go to end of extent map */
773e261d0fe08f Jeff Layton   2022-02-26  1085  		if (sparse && ret >= 0)
773e261d0fe08f Jeff Layton   2022-02-26  1086  			ret = ceph_sparse_ext_map_end(op);
773e261d0fe08f Jeff Layton   2022-02-26  1087  		else if (ret == -ENOENT)
fce7a9744bdf3b Yan, Zheng    2018-09-29  1088  			ret = 0;
773e261d0fe08f Jeff Layton   2022-02-26  1089  
ce6cca94223207 Jeff Layton   2022-08-25  1090  		if (ret > 0 && IS_ENCRYPTED(inode)) {
ce6cca94223207 Jeff Layton   2022-08-25  1091  			int fret;
ce6cca94223207 Jeff Layton   2022-08-25  1092  
ce6cca94223207 Jeff Layton   2022-08-25 @1093  			fret = ceph_fscrypt_decrypt_extents(inode, pages, read_off,
ce6cca94223207 Jeff Layton   2022-08-25  1094  					op->extent.sparse_ext, op->extent.sparse_ext_cnt);
ce6cca94223207 Jeff Layton   2022-08-25  1095  			if (fret < 0) {
ce6cca94223207 Jeff Layton   2022-08-25  1096  				ret = fret;
ce6cca94223207 Jeff Layton   2022-08-25  1097  				ceph_osdc_put_request(req);
ce6cca94223207 Jeff Layton   2022-08-25  1098  				break;
ce6cca94223207 Jeff Layton   2022-08-25  1099  			}
ce6cca94223207 Jeff Layton   2022-08-25  1100  
ce6cca94223207 Jeff Layton   2022-08-25  1101  			/* account for any partial block at the beginning */
ce6cca94223207 Jeff Layton   2022-08-25  1102  			fret -= (off - read_off);
ce6cca94223207 Jeff Layton   2022-08-25  1103  
ce6cca94223207 Jeff Layton   2022-08-25  1104  			/*
ce6cca94223207 Jeff Layton   2022-08-25  1105  			 * Short read after big offset adjustment?
ce6cca94223207 Jeff Layton   2022-08-25  1106  			 * Nothing is usable, just call it a zero
ce6cca94223207 Jeff Layton   2022-08-25  1107  			 * len read.
ce6cca94223207 Jeff Layton   2022-08-25  1108  			 */
ce6cca94223207 Jeff Layton   2022-08-25  1109  			fret = max(fret, 0);
ce6cca94223207 Jeff Layton   2022-08-25  1110  
ce6cca94223207 Jeff Layton   2022-08-25  1111  			/* account for partial block at the end */
ce6cca94223207 Jeff Layton   2022-08-25  1112  			ret = min_t(ssize_t, fret, len);
ce6cca94223207 Jeff Layton   2022-08-25  1113  		}
ce6cca94223207 Jeff Layton   2022-08-25  1114  
773e261d0fe08f Jeff Layton   2022-02-26  1115  		ceph_osdc_put_request(req);
773e261d0fe08f Jeff Layton   2022-02-26  1116  
ce6cca94223207 Jeff Layton   2022-08-25  1117  		/* Short read but not EOF? Zero out the remainder. */
fce7a9744bdf3b Yan, Zheng    2018-09-29  1118  		if (ret >= 0 && ret < len && (off + ret < i_size)) {
fce7a9744bdf3b Yan, Zheng    2018-09-29  1119  			int zlen = min(len - ret, i_size - off - ret);
fce7a9744bdf3b Yan, Zheng    2018-09-29  1120  			int zoff = page_off + ret;
773e261d0fe08f Jeff Layton   2022-02-26  1121  
a62395e8e6ec3f Xiubo Li      2023-06-12  1122  			doutc(cl, "zero gap %llu~%llu\n", off + ret,
a62395e8e6ec3f Xiubo Li      2023-06-12  1123  			      off + ret + zlen);
fce7a9744bdf3b Yan, Zheng    2018-09-29  1124  			ceph_zero_page_vector_range(zoff, zlen, pages);
fce7a9744bdf3b Yan, Zheng    2018-09-29  1125  			ret += zlen;
fce7a9744bdf3b Yan, Zheng    2018-09-29  1126  		}
fce7a9744bdf3b Yan, Zheng    2018-09-29  1127  
c5f575ed08c38d Jeff Layton   2020-08-21  1128  		idx = 0;
c5f575ed08c38d Jeff Layton   2020-08-21  1129  		left = ret > 0 ? ret : 0;
fce7a9744bdf3b Yan, Zheng    2018-09-29  1130  		while (left > 0) {
ce6cca94223207 Jeff Layton   2022-08-25  1131  			size_t plen, copied;
ce6cca94223207 Jeff Layton   2022-08-25  1132  
ce6cca94223207 Jeff Layton   2022-08-25  1133  			plen = min_t(size_t, left, PAGE_SIZE - page_off);
c5f575ed08c38d Jeff Layton   2020-08-21  1134  			SetPageUptodate(pages[idx]);
fce7a9744bdf3b Yan, Zheng    2018-09-29  1135  			copied = copy_page_to_iter(pages[idx++],
ce6cca94223207 Jeff Layton   2022-08-25  1136  						   page_off, plen, to);
fce7a9744bdf3b Yan, Zheng    2018-09-29  1137  			off += copied;
fce7a9744bdf3b Yan, Zheng    2018-09-29  1138  			left -= copied;
ce6cca94223207 Jeff Layton   2022-08-25  1139  			page_off = 0;
ce6cca94223207 Jeff Layton   2022-08-25  1140  			if (copied < plen) {
fce7a9744bdf3b Yan, Zheng    2018-09-29  1141  				ret = -EFAULT;
8eb4efb091c8d8 majianpeng    2013-09-26  1142  				break;
8eb4efb091c8d8 majianpeng    2013-09-26  1143  			}
8eb4efb091c8d8 majianpeng    2013-09-26  1144  		}
f8a351bc221199 David Howells 2023-07-31  1145  		ceph_databuf_release(dbuf);
8eb4efb091c8d8 majianpeng    2013-09-26  1146  
131d7eb4faa1fc Yan, Zheng    2019-07-25  1147  		if (ret < 0) {
0b98acd6188309 Ilya Dryomov  2020-09-14  1148  			if (ret == -EBLOCKLISTED)
0b98acd6188309 Ilya Dryomov  2020-09-14  1149  				fsc->blocklisted = true;
131d7eb4faa1fc Yan, Zheng    2019-07-25  1150  			break;
131d7eb4faa1fc Yan, Zheng    2019-07-25  1151  		}
131d7eb4faa1fc Yan, Zheng    2019-07-25  1152  
131d7eb4faa1fc Yan, Zheng    2019-07-25  1153  		if (off >= i_size || !more)
fce7a9744bdf3b Yan, Zheng    2018-09-29  1154  			break;
fce7a9744bdf3b Yan, Zheng    2018-09-29  1155  	}
fce7a9744bdf3b Yan, Zheng    2018-09-29  1156  
ce6cca94223207 Jeff Layton   2022-08-25  1157  	if (ret > 0) {
b8bcecad77673d Xiubo Li      2022-08-25  1158  		if (off > *ki_pos) {
c3d8e0b5de487a Xiubo Li      2021-10-30  1159  			if (off >= i_size) {
fce7a9744bdf3b Yan, Zheng    2018-09-29  1160  				*retry_op = CHECK_EOF;
b8bcecad77673d Xiubo Li      2022-08-25  1161  				ret = i_size - *ki_pos;
b8bcecad77673d Xiubo Li      2022-08-25  1162  				*ki_pos = i_size;
c3d8e0b5de487a Xiubo Li      2021-10-30  1163  			} else {
b8bcecad77673d Xiubo Li      2022-08-25  1164  				ret = off - *ki_pos;
b8bcecad77673d Xiubo Li      2022-08-25  1165  				*ki_pos = off;
8eb4efb091c8d8 majianpeng    2013-09-26  1166  			}
c3d8e0b5de487a Xiubo Li      2021-10-30  1167  		}
8eb4efb091c8d8 majianpeng    2013-09-26  1168  
ce6cca94223207 Jeff Layton   2022-08-25  1169  		if (last_objver)
64d91d8e38e5e6 Xiubo Li      2022-08-25  1170  			*last_objver = objver;
ce6cca94223207 Jeff Layton   2022-08-25  1171  	}
a62395e8e6ec3f Xiubo Li      2023-06-12  1172  	doutc(cl, "result %zd retry_op %d\n", ret, *retry_op);
124e68e7409909 Sage Weil     2009-10-06  1173  	return ret;
124e68e7409909 Sage Weil     2009-10-06  1174  }
124e68e7409909 Sage Weil     2009-10-06  1175  

:::::: The code at line 1093 was first introduced by commit
:::::: ce6cca94223207b03743dbc451bd72b17a216474 ceph: plumb in decryption during sync reads

:::::: TO: Jeff Layton <jlayton@kernel.org>
:::::: CC: Xiubo Li <xiubli@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
