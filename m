Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20D65383;
	Wed, 30 Aug 2023 16:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693414323; x=1724950323;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xqIWo3a2oelyvJmChaexHGCYMT7L4u1I+Mxq1qgqn+Y=;
  b=KwYsCSTXUDlnVgUFu4SzD8eGG+GNfC6ibjTU/p16+bdscjaK+lTYPdJ9
   39hg8+pjOA7VnOC7naq1a8XuTF627Ai8aNGD8lyRkEnQGtHWe7cLunqsP
   /ZP25HryZfL9RUJN5hZfASZCJc4HIzMDWEL/NV8UzNmWsMvbzZJHGPydx
   AoRgUyVsIF/ARtp0kbLc7l4SPofIcv8xHEWSeRo6DsVkFMz+8mnNHcPjS
   WU4+POuolThEankK7fl2XVHfn0+MBUa3o7xZd4e9Obmnt7nbrdTKJHgeG
   5j8Y2cSiGyHowHHity9ZrdW5eK3N4ihg8IwabsIfCjXHzAPdxYdCiQB/1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="375649893"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="375649893"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 09:52:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="912891577"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="912891577"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 30 Aug 2023 09:51:57 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbOQ9-000A1v-0h;
	Wed, 30 Aug 2023 16:51:57 +0000
Date: Thu, 31 Aug 2023 00:50:58 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 34/36] fs/ceph/file.c:1775:9: error: use of
 undeclared identifier 'pages'
Message-ID: <202308310016.Yim3lWR2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   d9c2320ef61eb3f02f0f9cbb4b8811c9991160ac
commit: f8a351bc221199c2fd754da13015cbdb37bfe5c0 [34/36] ceph: Don't use data_pages
config: x86_64-randconfig-011-20230830 (https://download.01.org/0day-ci/archive/20230831/202308310016.Yim3lWR2-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308310016.Yim3lWR2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308310016.Yim3lWR2-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ceph/file.c:1093:47: warning: variable 'pages' is uninitialized when used here [-Wuninitialized]
                           fret = ceph_fscrypt_decrypt_extents(inode, pages, read_off,
                                                                      ^~~~~
   fs/ceph/file.c:1016:22: note: initialize the variable 'pages' to silence this warning
                   struct page **pages;
                                      ^
                                       = NULL
>> fs/ceph/file.c:1775:9: error: use of undeclared identifier 'pages'
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


vim +/pages +1775 fs/ceph/file.c

e8344e668915a7 majianpeng     2013-09-12  1614  
e8344e668915a7 majianpeng     2013-09-12  1615  /*
e8344e668915a7 majianpeng     2013-09-12  1616   * Synchronous write, straight from __user pointer or user pages.
e8344e668915a7 majianpeng     2013-09-12  1617   *
e8344e668915a7 majianpeng     2013-09-12  1618   * If write spans object boundary, just do multiple writes.  (For a
e8344e668915a7 majianpeng     2013-09-12  1619   * correct atomic write, we should e.g. take write locks on all
e8344e668915a7 majianpeng     2013-09-12  1620   * objects, rollback on failure, etc.)
e8344e668915a7 majianpeng     2013-09-12  1621   */
06fee30f6a31f1 Yan, Zheng     2014-07-28  1622  static ssize_t
5dda377cf0a6bd Yan, Zheng     2015-04-30  1623  ceph_sync_write(struct kiocb *iocb, struct iov_iter *from, loff_t pos,
5dda377cf0a6bd Yan, Zheng     2015-04-30  1624  		struct ceph_snap_context *snapc)
e8344e668915a7 majianpeng     2013-09-12  1625  {
e8344e668915a7 majianpeng     2013-09-12  1626  	struct file *file = iocb->ki_filp;
e8344e668915a7 majianpeng     2013-09-12  1627  	struct inode *inode = file_inode(file);
e8344e668915a7 majianpeng     2013-09-12  1628  	struct ceph_inode_info *ci = ceph_inode(inode);
8cc5ed1b046309 Xiubo Li       2023-06-12  1629  	struct ceph_fs_client *fsc = ceph_inode_to_fs_client(inode);
a62395e8e6ec3f Xiubo Li       2023-06-12  1630  	struct ceph_client *cl = fsc->client;
c8ac917a46c2ea Jeff Layton    2022-08-25  1631  	struct ceph_osd_client *osdc = &fsc->client->osdc;
e8344e668915a7 majianpeng     2013-09-12  1632  	struct ceph_osd_request *req;
f8a351bc221199 David Howells  2023-07-31  1633  	struct ceph_databuf *dbuf = NULL;
e8344e668915a7 majianpeng     2013-09-12  1634  	u64 len;
e8344e668915a7 majianpeng     2013-09-12  1635  	int num_pages;
e8344e668915a7 majianpeng     2013-09-12  1636  	int written = 0;
e8344e668915a7 majianpeng     2013-09-12  1637  	int ret;
efb0ca765ac6f4 Yan, Zheng     2017-05-22  1638  	bool check_caps = false;
fac02ddf910814 Arnd Bergmann  2018-07-13  1639  	struct timespec64 mtime = current_time(inode);
4908b822b300d2 Al Viro        2014-04-03  1640  	size_t count = iov_iter_count(from);
e8344e668915a7 majianpeng     2013-09-12  1641  
e8344e668915a7 majianpeng     2013-09-12  1642  	if (ceph_snap(file_inode(file)) != CEPH_NOSNAP)
e8344e668915a7 majianpeng     2013-09-12  1643  		return -EROFS;
e8344e668915a7 majianpeng     2013-09-12  1644  
a62395e8e6ec3f Xiubo Li       2023-06-12  1645  	doutc(cl, "on file %p %lld~%u snapc %p seq %lld\n", file, pos,
a62395e8e6ec3f Xiubo Li       2023-06-12  1646  	      (unsigned)count, snapc, snapc->seq);
e8344e668915a7 majianpeng     2013-09-12  1647  
e450f4d1a5d633 zhengbin       2019-02-01  1648  	ret = filemap_write_and_wait_range(inode->i_mapping,
e450f4d1a5d633 zhengbin       2019-02-01  1649  					   pos, pos + count - 1);
e8344e668915a7 majianpeng     2013-09-12  1650  	if (ret < 0)
e8344e668915a7 majianpeng     2013-09-12  1651  		return ret;
e8344e668915a7 majianpeng     2013-09-12  1652  
400e1286c0ec3f Jeff Layton    2021-12-07  1653  	ceph_fscache_invalidate(inode, false);
e8344e668915a7 majianpeng     2013-09-12  1654  
4908b822b300d2 Al Viro        2014-04-03  1655  	while ((len = iov_iter_count(from)) > 0) {
e8344e668915a7 majianpeng     2013-09-12  1656  		size_t left;
e8344e668915a7 majianpeng     2013-09-12  1657  		int n;
c8ac917a46c2ea Jeff Layton    2022-08-25  1658  		u64 write_pos = pos;
c8ac917a46c2ea Jeff Layton    2022-08-25  1659  		u64 write_len = len;
c8ac917a46c2ea Jeff Layton    2022-08-25  1660  		u64 objnum, objoff;
c8ac917a46c2ea Jeff Layton    2022-08-25  1661  		u32 xlen;
c8ac917a46c2ea Jeff Layton    2022-08-25  1662  		u64 assert_ver = 0;
c8ac917a46c2ea Jeff Layton    2022-08-25  1663  		bool rmw;
c8ac917a46c2ea Jeff Layton    2022-08-25  1664  		bool first, last;
c8ac917a46c2ea Jeff Layton    2022-08-25  1665  		struct iov_iter saved_iter = *from;
c8ac917a46c2ea Jeff Layton    2022-08-25  1666  		size_t off;
e8344e668915a7 majianpeng     2013-09-12  1667  
c8ac917a46c2ea Jeff Layton    2022-08-25  1668  		ceph_fscrypt_adjust_off_and_len(inode, &write_pos, &write_len);
c8ac917a46c2ea Jeff Layton    2022-08-25  1669  
c8ac917a46c2ea Jeff Layton    2022-08-25  1670  		/* clamp the length to the end of first object */
c8ac917a46c2ea Jeff Layton    2022-08-25  1671  		ceph_calc_file_object_mapping(&ci->i_layout, write_pos,
c8ac917a46c2ea Jeff Layton    2022-08-25  1672  						write_len, &objnum, &objoff,
c8ac917a46c2ea Jeff Layton    2022-08-25  1673  						&xlen);
c8ac917a46c2ea Jeff Layton    2022-08-25  1674  		write_len = xlen;
c8ac917a46c2ea Jeff Layton    2022-08-25  1675  
c8ac917a46c2ea Jeff Layton    2022-08-25  1676  		/* adjust len downward if it goes beyond current object */
c8ac917a46c2ea Jeff Layton    2022-08-25  1677  		if (pos + len > write_pos + write_len)
c8ac917a46c2ea Jeff Layton    2022-08-25  1678  			len = write_pos + write_len - pos;
c8ac917a46c2ea Jeff Layton    2022-08-25  1679  
c8ac917a46c2ea Jeff Layton    2022-08-25  1680  		/*
c8ac917a46c2ea Jeff Layton    2022-08-25  1681  		 * If we had to adjust the length or position to align with a
c8ac917a46c2ea Jeff Layton    2022-08-25  1682  		 * crypto block, then we must do a read/modify/write cycle. We
c8ac917a46c2ea Jeff Layton    2022-08-25  1683  		 * use a version assertion to redrive the thing if something
c8ac917a46c2ea Jeff Layton    2022-08-25  1684  		 * changes in between.
c8ac917a46c2ea Jeff Layton    2022-08-25  1685  		 */
c8ac917a46c2ea Jeff Layton    2022-08-25  1686  		first = pos != write_pos;
c8ac917a46c2ea Jeff Layton    2022-08-25  1687  		last = (pos + len) != (write_pos + write_len);
c8ac917a46c2ea Jeff Layton    2022-08-25  1688  		rmw = first || last;
c8ac917a46c2ea Jeff Layton    2022-08-25  1689  
a62395e8e6ec3f Xiubo Li       2023-06-12  1690  		doutc(cl, "ino %llx %lld~%llu adjusted %lld~%llu -- %srmw\n",
a62395e8e6ec3f Xiubo Li       2023-06-12  1691  		      ci->i_vino.ino, pos, len, write_pos, write_len,
a62395e8e6ec3f Xiubo Li       2023-06-12  1692  		      rmw ? "" : "no ");
c8ac917a46c2ea Jeff Layton    2022-08-25  1693  
c8ac917a46c2ea Jeff Layton    2022-08-25  1694  		/*
c8ac917a46c2ea Jeff Layton    2022-08-25  1695  		 * The data is emplaced into the page as it would be if it were in
c8ac917a46c2ea Jeff Layton    2022-08-25  1696  		 * an array of pagecache pages.
c8ac917a46c2ea Jeff Layton    2022-08-25  1697  		 */
c8ac917a46c2ea Jeff Layton    2022-08-25  1698  		num_pages = calc_pages_for(write_pos, write_len);
f8a351bc221199 David Howells  2023-07-31  1699  		dbuf = ceph_databuf_req_alloc(num_pages, num_pages * PAGE_SIZE, GFP_KERNEL);
f8a351bc221199 David Howells  2023-07-31  1700  		if (!dbuf) {
f8a351bc221199 David Howells  2023-07-31  1701  			ret = -ENOMEM;
c8ac917a46c2ea Jeff Layton    2022-08-25  1702  			break;
c8ac917a46c2ea Jeff Layton    2022-08-25  1703  		}
c8ac917a46c2ea Jeff Layton    2022-08-25  1704  
c8ac917a46c2ea Jeff Layton    2022-08-25  1705  		/* Do we need to preload the pages? */
c8ac917a46c2ea Jeff Layton    2022-08-25  1706  		if (rmw) {
c8ac917a46c2ea Jeff Layton    2022-08-25  1707  			u64 first_pos = write_pos;
c8ac917a46c2ea Jeff Layton    2022-08-25  1708  			u64 last_pos = (write_pos + write_len) - CEPH_FSCRYPT_BLOCK_SIZE;
c8ac917a46c2ea Jeff Layton    2022-08-25  1709  			u64 read_len = CEPH_FSCRYPT_BLOCK_SIZE;
c8ac917a46c2ea Jeff Layton    2022-08-25  1710  			struct ceph_osd_req_op *op;
c8ac917a46c2ea Jeff Layton    2022-08-25  1711  
c8ac917a46c2ea Jeff Layton    2022-08-25  1712  			/* We should only need to do this for encrypted inodes */
c8ac917a46c2ea Jeff Layton    2022-08-25  1713  			WARN_ON_ONCE(!IS_ENCRYPTED(inode));
c8ac917a46c2ea Jeff Layton    2022-08-25  1714  
c8ac917a46c2ea Jeff Layton    2022-08-25  1715  			/* No need to do two reads if first and last blocks are same */
c8ac917a46c2ea Jeff Layton    2022-08-25  1716  			if (first && last_pos == first_pos)
c8ac917a46c2ea Jeff Layton    2022-08-25  1717  				last = false;
c8ac917a46c2ea Jeff Layton    2022-08-25  1718  
c8ac917a46c2ea Jeff Layton    2022-08-25  1719  			/*
c8ac917a46c2ea Jeff Layton    2022-08-25  1720  			 * Allocate a read request for one or two extents, depending
c8ac917a46c2ea Jeff Layton    2022-08-25  1721  			 * on how the request was aligned.
c8ac917a46c2ea Jeff Layton    2022-08-25  1722  			 */
c8ac917a46c2ea Jeff Layton    2022-08-25  1723  			req = ceph_osdc_new_request(osdc, &ci->i_layout,
c8ac917a46c2ea Jeff Layton    2022-08-25  1724  					ci->i_vino, first ? first_pos : last_pos,
c8ac917a46c2ea Jeff Layton    2022-08-25  1725  					&read_len, 0, (first && last) ? 2 : 1,
c8ac917a46c2ea Jeff Layton    2022-08-25  1726  					CEPH_OSD_OP_SPARSE_READ, CEPH_OSD_FLAG_READ,
c8ac917a46c2ea Jeff Layton    2022-08-25  1727  					NULL, ci->i_truncate_seq,
c8ac917a46c2ea Jeff Layton    2022-08-25  1728  					ci->i_truncate_size, false);
e8344e668915a7 majianpeng     2013-09-12  1729  			if (IS_ERR(req)) {
e8344e668915a7 majianpeng     2013-09-12  1730  				ret = PTR_ERR(req);
eab87235c0f597 Al Viro        2014-04-03  1731  				break;
e8344e668915a7 majianpeng     2013-09-12  1732  			}
e8344e668915a7 majianpeng     2013-09-12  1733  
c8ac917a46c2ea Jeff Layton    2022-08-25  1734  			/* Something is misaligned! */
c8ac917a46c2ea Jeff Layton    2022-08-25  1735  			if (read_len != CEPH_FSCRYPT_BLOCK_SIZE) {
c8ac917a46c2ea Jeff Layton    2022-08-25  1736  				ceph_osdc_put_request(req);
c8ac917a46c2ea Jeff Layton    2022-08-25  1737  				ret = -EIO;
c8ac917a46c2ea Jeff Layton    2022-08-25  1738  				break;
c8ac917a46c2ea Jeff Layton    2022-08-25  1739  			}
c8ac917a46c2ea Jeff Layton    2022-08-25  1740  
c8ac917a46c2ea Jeff Layton    2022-08-25  1741  			/* Add extent for first block? */
c8ac917a46c2ea Jeff Layton    2022-08-25  1742  			op = &req->r_ops[0];
c8ac917a46c2ea Jeff Layton    2022-08-25  1743  
c8ac917a46c2ea Jeff Layton    2022-08-25  1744  			if (first) {
f8a351bc221199 David Howells  2023-07-31  1745  				iov_iter_advance(&dbuf->iter, offset_in_page(first_pos));
f8a351bc221199 David Howells  2023-07-31  1746  				iov_iter_truncate(&dbuf->iter, CEPH_FSCRYPT_BLOCK_SIZE);
f8a351bc221199 David Howells  2023-07-31  1747  				osd_req_op_extent_osd_databuf(req, 0, dbuf);
f8a351bc221199 David Howells  2023-07-31  1748  				dbuf = NULL;
c8ac917a46c2ea Jeff Layton    2022-08-25  1749  				/* We only expect a single extent here */
c8ac917a46c2ea Jeff Layton    2022-08-25  1750  				ret = __ceph_alloc_sparse_ext_map(op, 1);
c8ac917a46c2ea Jeff Layton    2022-08-25  1751  				if (ret) {
c8ac917a46c2ea Jeff Layton    2022-08-25  1752  					ceph_osdc_put_request(req);
c8ac917a46c2ea Jeff Layton    2022-08-25  1753  					break;
c8ac917a46c2ea Jeff Layton    2022-08-25  1754  				}
c8ac917a46c2ea Jeff Layton    2022-08-25  1755  			}
c8ac917a46c2ea Jeff Layton    2022-08-25  1756  
c8ac917a46c2ea Jeff Layton    2022-08-25  1757  			/* Add extent for last block */
c8ac917a46c2ea Jeff Layton    2022-08-25  1758  			if (last) {
c8ac917a46c2ea Jeff Layton    2022-08-25  1759  				/* Init the other extent if first extent has been used */
c8ac917a46c2ea Jeff Layton    2022-08-25  1760  				if (first) {
c8ac917a46c2ea Jeff Layton    2022-08-25  1761  					op = &req->r_ops[1];
c8ac917a46c2ea Jeff Layton    2022-08-25  1762  					osd_req_op_extent_init(req, 1, CEPH_OSD_OP_SPARSE_READ,
c8ac917a46c2ea Jeff Layton    2022-08-25  1763  							last_pos, CEPH_FSCRYPT_BLOCK_SIZE,
c8ac917a46c2ea Jeff Layton    2022-08-25  1764  							ci->i_truncate_size,
c8ac917a46c2ea Jeff Layton    2022-08-25  1765  							ci->i_truncate_seq);
c8ac917a46c2ea Jeff Layton    2022-08-25  1766  				}
c8ac917a46c2ea Jeff Layton    2022-08-25  1767  
c8ac917a46c2ea Jeff Layton    2022-08-25  1768  				ret = __ceph_alloc_sparse_ext_map(op, 1);
c8ac917a46c2ea Jeff Layton    2022-08-25  1769  				if (ret) {
c8ac917a46c2ea Jeff Layton    2022-08-25  1770  					ceph_osdc_put_request(req);
c8ac917a46c2ea Jeff Layton    2022-08-25  1771  					break;
c8ac917a46c2ea Jeff Layton    2022-08-25  1772  				}
c8ac917a46c2ea Jeff Layton    2022-08-25  1773  
c8ac917a46c2ea Jeff Layton    2022-08-25  1774  				osd_req_op_extent_osd_data_pages(req, first ? 1 : 0,
c8ac917a46c2ea Jeff Layton    2022-08-25 @1775  							&pages[num_pages - 1],
c8ac917a46c2ea Jeff Layton    2022-08-25  1776  							CEPH_FSCRYPT_BLOCK_SIZE,
c8ac917a46c2ea Jeff Layton    2022-08-25  1777  							offset_in_page(last_pos),
c8ac917a46c2ea Jeff Layton    2022-08-25  1778  							false, false);
c8ac917a46c2ea Jeff Layton    2022-08-25  1779  			}
c8ac917a46c2ea Jeff Layton    2022-08-25  1780  
c8ac917a46c2ea Jeff Layton    2022-08-25  1781  			ceph_osdc_start_request(osdc, req);
c8ac917a46c2ea Jeff Layton    2022-08-25  1782  			ret = ceph_osdc_wait_request(osdc, req);
c8ac917a46c2ea Jeff Layton    2022-08-25  1783  
c8ac917a46c2ea Jeff Layton    2022-08-25  1784  			/* FIXME: length field is wrong if there are 2 extents */
c8ac917a46c2ea Jeff Layton    2022-08-25  1785  			ceph_update_read_metrics(&fsc->mdsc->metric,
c8ac917a46c2ea Jeff Layton    2022-08-25  1786  						 req->r_start_latency,
c8ac917a46c2ea Jeff Layton    2022-08-25  1787  						 req->r_end_latency,
c8ac917a46c2ea Jeff Layton    2022-08-25  1788  						 read_len, ret);
c8ac917a46c2ea Jeff Layton    2022-08-25  1789  
c8ac917a46c2ea Jeff Layton    2022-08-25  1790  			/* Ok if object is not already present */
c8ac917a46c2ea Jeff Layton    2022-08-25  1791  			if (ret == -ENOENT) {
c8ac917a46c2ea Jeff Layton    2022-08-25  1792  				/*
c8ac917a46c2ea Jeff Layton    2022-08-25  1793  				 * If there is no object, then we can't assert
c8ac917a46c2ea Jeff Layton    2022-08-25  1794  				 * on its version. Set it to 0, and we'll use an
c8ac917a46c2ea Jeff Layton    2022-08-25  1795  				 * exclusive create instead.
c8ac917a46c2ea Jeff Layton    2022-08-25  1796  				 */
c8ac917a46c2ea Jeff Layton    2022-08-25  1797  				ceph_osdc_put_request(req);
c8ac917a46c2ea Jeff Layton    2022-08-25  1798  				ret = 0;
c8ac917a46c2ea Jeff Layton    2022-08-25  1799  
c8ac917a46c2ea Jeff Layton    2022-08-25  1800  				/*
c8ac917a46c2ea Jeff Layton    2022-08-25  1801  				 * zero out the soon-to-be uncopied parts of the
c8ac917a46c2ea Jeff Layton    2022-08-25  1802  				 * first and last pages.
c8ac917a46c2ea Jeff Layton    2022-08-25  1803  				 */
c8ac917a46c2ea Jeff Layton    2022-08-25  1804  				if (first)
c8ac917a46c2ea Jeff Layton    2022-08-25  1805  					zero_user_segment(pages[0], 0,
c8ac917a46c2ea Jeff Layton    2022-08-25  1806  							  offset_in_page(first_pos));
c8ac917a46c2ea Jeff Layton    2022-08-25  1807  				if (last)
c8ac917a46c2ea Jeff Layton    2022-08-25  1808  					zero_user_segment(pages[num_pages - 1],
c8ac917a46c2ea Jeff Layton    2022-08-25  1809  							  offset_in_page(last_pos),
c8ac917a46c2ea Jeff Layton    2022-08-25  1810  							  PAGE_SIZE);
c8ac917a46c2ea Jeff Layton    2022-08-25  1811  			} else {
c8ac917a46c2ea Jeff Layton    2022-08-25  1812  				if (ret < 0) {
c8ac917a46c2ea Jeff Layton    2022-08-25  1813  					ceph_osdc_put_request(req);
c8ac917a46c2ea Jeff Layton    2022-08-25  1814  					ceph_release_page_vector(pages, num_pages);
c8ac917a46c2ea Jeff Layton    2022-08-25  1815  					break;
c8ac917a46c2ea Jeff Layton    2022-08-25  1816  				}
c8ac917a46c2ea Jeff Layton    2022-08-25  1817  
c8ac917a46c2ea Jeff Layton    2022-08-25  1818  				op = &req->r_ops[0];
c8ac917a46c2ea Jeff Layton    2022-08-25  1819  				if (op->extent.sparse_ext_cnt == 0) {
c8ac917a46c2ea Jeff Layton    2022-08-25  1820  					if (first)
c8ac917a46c2ea Jeff Layton    2022-08-25  1821  						zero_user_segment(pages[0], 0,
c8ac917a46c2ea Jeff Layton    2022-08-25  1822  								  offset_in_page(first_pos));
c8ac917a46c2ea Jeff Layton    2022-08-25  1823  					else
c8ac917a46c2ea Jeff Layton    2022-08-25  1824  						zero_user_segment(pages[num_pages - 1],
c8ac917a46c2ea Jeff Layton    2022-08-25  1825  								  offset_in_page(last_pos),
c8ac917a46c2ea Jeff Layton    2022-08-25  1826  								  PAGE_SIZE);
c8ac917a46c2ea Jeff Layton    2022-08-25  1827  				} else if (op->extent.sparse_ext_cnt != 1 ||
c8ac917a46c2ea Jeff Layton    2022-08-25  1828  					   ceph_sparse_ext_map_end(op) !=
c8ac917a46c2ea Jeff Layton    2022-08-25  1829  						CEPH_FSCRYPT_BLOCK_SIZE) {
c8ac917a46c2ea Jeff Layton    2022-08-25  1830  					ret = -EIO;
c8ac917a46c2ea Jeff Layton    2022-08-25  1831  					ceph_osdc_put_request(req);
c8ac917a46c2ea Jeff Layton    2022-08-25  1832  					ceph_release_page_vector(pages, num_pages);
c8ac917a46c2ea Jeff Layton    2022-08-25  1833  					break;
c8ac917a46c2ea Jeff Layton    2022-08-25  1834  				}
c8ac917a46c2ea Jeff Layton    2022-08-25  1835  
c8ac917a46c2ea Jeff Layton    2022-08-25  1836  				if (first && last) {
c8ac917a46c2ea Jeff Layton    2022-08-25  1837  					op = &req->r_ops[1];
c8ac917a46c2ea Jeff Layton    2022-08-25  1838  					if (op->extent.sparse_ext_cnt == 0) {
c8ac917a46c2ea Jeff Layton    2022-08-25  1839  						zero_user_segment(pages[num_pages - 1],
c8ac917a46c2ea Jeff Layton    2022-08-25  1840  								  offset_in_page(last_pos),
c8ac917a46c2ea Jeff Layton    2022-08-25  1841  								  PAGE_SIZE);
c8ac917a46c2ea Jeff Layton    2022-08-25  1842  					} else if (op->extent.sparse_ext_cnt != 1 ||
c8ac917a46c2ea Jeff Layton    2022-08-25  1843  						   ceph_sparse_ext_map_end(op) !=
c8ac917a46c2ea Jeff Layton    2022-08-25  1844  							CEPH_FSCRYPT_BLOCK_SIZE) {
c8ac917a46c2ea Jeff Layton    2022-08-25  1845  						ret = -EIO;
c8ac917a46c2ea Jeff Layton    2022-08-25  1846  						ceph_osdc_put_request(req);
c8ac917a46c2ea Jeff Layton    2022-08-25  1847  						ceph_release_page_vector(pages, num_pages);
c8ac917a46c2ea Jeff Layton    2022-08-25  1848  						break;
c8ac917a46c2ea Jeff Layton    2022-08-25  1849  					}
c8ac917a46c2ea Jeff Layton    2022-08-25  1850  				}
c8ac917a46c2ea Jeff Layton    2022-08-25  1851  
c8ac917a46c2ea Jeff Layton    2022-08-25  1852  				/* Grab assert version. It must be non-zero. */
c8ac917a46c2ea Jeff Layton    2022-08-25  1853  				assert_ver = req->r_version;
c8ac917a46c2ea Jeff Layton    2022-08-25  1854  				WARN_ON_ONCE(ret > 0 && assert_ver == 0);
c8ac917a46c2ea Jeff Layton    2022-08-25  1855  
c8ac917a46c2ea Jeff Layton    2022-08-25  1856  				ceph_osdc_put_request(req);
c8ac917a46c2ea Jeff Layton    2022-08-25  1857  				if (first) {
c8ac917a46c2ea Jeff Layton    2022-08-25  1858  					ret = ceph_fscrypt_decrypt_block_inplace(inode,
c8ac917a46c2ea Jeff Layton    2022-08-25  1859  							pages[0],
c8ac917a46c2ea Jeff Layton    2022-08-25  1860  							CEPH_FSCRYPT_BLOCK_SIZE,
c8ac917a46c2ea Jeff Layton    2022-08-25  1861  							offset_in_page(first_pos),
c8ac917a46c2ea Jeff Layton    2022-08-25  1862  							first_pos >> CEPH_FSCRYPT_BLOCK_SHIFT);
c8ac917a46c2ea Jeff Layton    2022-08-25  1863  					if (ret < 0) {
c8ac917a46c2ea Jeff Layton    2022-08-25  1864  						ceph_release_page_vector(pages, num_pages);
c8ac917a46c2ea Jeff Layton    2022-08-25  1865  						break;
c8ac917a46c2ea Jeff Layton    2022-08-25  1866  					}
c8ac917a46c2ea Jeff Layton    2022-08-25  1867  				}
c8ac917a46c2ea Jeff Layton    2022-08-25  1868  				if (last) {
c8ac917a46c2ea Jeff Layton    2022-08-25  1869  					ret = ceph_fscrypt_decrypt_block_inplace(inode,
c8ac917a46c2ea Jeff Layton    2022-08-25  1870  							pages[num_pages - 1],
c8ac917a46c2ea Jeff Layton    2022-08-25  1871  							CEPH_FSCRYPT_BLOCK_SIZE,
c8ac917a46c2ea Jeff Layton    2022-08-25  1872  							offset_in_page(last_pos),
c8ac917a46c2ea Jeff Layton    2022-08-25  1873  							last_pos >> CEPH_FSCRYPT_BLOCK_SHIFT);
c8ac917a46c2ea Jeff Layton    2022-08-25  1874  					if (ret < 0) {
c8ac917a46c2ea Jeff Layton    2022-08-25  1875  						ceph_release_page_vector(pages, num_pages);
c8ac917a46c2ea Jeff Layton    2022-08-25  1876  						break;
c8ac917a46c2ea Jeff Layton    2022-08-25  1877  					}
c8ac917a46c2ea Jeff Layton    2022-08-25  1878  				}
c8ac917a46c2ea Jeff Layton    2022-08-25  1879  			}
124e68e7409909 Sage Weil      2009-10-06  1880  		}
e8344e668915a7 majianpeng     2013-09-12  1881  
e8344e668915a7 majianpeng     2013-09-12  1882  		left = len;
0d08b28be08889 Jeff Layton    2022-08-25  1883  		off = offset_in_page(pos);
e8344e668915a7 majianpeng     2013-09-12  1884  		for (n = 0; n < num_pages; n++) {
0d08b28be08889 Jeff Layton    2022-08-25  1885  			size_t plen = min_t(size_t, left, PAGE_SIZE - off);
0d08b28be08889 Jeff Layton    2022-08-25  1886  
c8ac917a46c2ea Jeff Layton    2022-08-25  1887  			/* copy the data */
0d08b28be08889 Jeff Layton    2022-08-25  1888  			ret = copy_page_from_iter(pages[n], off, plen, from);
e8344e668915a7 majianpeng     2013-09-12  1889  			if (ret != plen) {
e8344e668915a7 majianpeng     2013-09-12  1890  				ret = -EFAULT;
e8344e668915a7 majianpeng     2013-09-12  1891  				break;
e8344e668915a7 majianpeng     2013-09-12  1892  			}
c8ac917a46c2ea Jeff Layton    2022-08-25  1893  			off = 0;
e8344e668915a7 majianpeng     2013-09-12  1894  			left -= ret;
e8344e668915a7 majianpeng     2013-09-12  1895  		}
c8ac917a46c2ea Jeff Layton    2022-08-25  1896  		if (ret < 0) {
a62395e8e6ec3f Xiubo Li       2023-06-12  1897  			doutc(cl, "write failed with %d\n", ret);
c8ac917a46c2ea Jeff Layton    2022-08-25  1898  			ceph_release_page_vector(pages, num_pages);
c8ac917a46c2ea Jeff Layton    2022-08-25  1899  			break;
c8ac917a46c2ea Jeff Layton    2022-08-25  1900  		}
e8344e668915a7 majianpeng     2013-09-12  1901  
c8ac917a46c2ea Jeff Layton    2022-08-25  1902  		if (IS_ENCRYPTED(inode)) {
c8ac917a46c2ea Jeff Layton    2022-08-25  1903  			ret = ceph_fscrypt_encrypt_pages(inode, pages,
c8ac917a46c2ea Jeff Layton    2022-08-25  1904  							 write_pos, write_len,
c8ac917a46c2ea Jeff Layton    2022-08-25  1905  							 GFP_KERNEL);
124e68e7409909 Sage Weil      2009-10-06  1906  			if (ret < 0) {
a62395e8e6ec3f Xiubo Li       2023-06-12  1907  				doutc(cl, "encryption failed with %d\n", ret);
124e68e7409909 Sage Weil      2009-10-06  1908  				ceph_release_page_vector(pages, num_pages);
c8ac917a46c2ea Jeff Layton    2022-08-25  1909  				break;
c8ac917a46c2ea Jeff Layton    2022-08-25  1910  			}
124e68e7409909 Sage Weil      2009-10-06  1911  		}
124e68e7409909 Sage Weil      2009-10-06  1912  
c8ac917a46c2ea Jeff Layton    2022-08-25  1913  		req = ceph_osdc_new_request(osdc, &ci->i_layout,
c8ac917a46c2ea Jeff Layton    2022-08-25  1914  					    ci->i_vino, write_pos, &write_len,
c8ac917a46c2ea Jeff Layton    2022-08-25  1915  					    rmw ? 1 : 0, rmw ? 2 : 1,
c8ac917a46c2ea Jeff Layton    2022-08-25  1916  					    CEPH_OSD_OP_WRITE,
c8ac917a46c2ea Jeff Layton    2022-08-25  1917  					    CEPH_OSD_FLAG_WRITE,
c8ac917a46c2ea Jeff Layton    2022-08-25  1918  					    snapc, ci->i_truncate_seq,
c8ac917a46c2ea Jeff Layton    2022-08-25  1919  					    ci->i_truncate_size, false);
c8ac917a46c2ea Jeff Layton    2022-08-25  1920  		if (IS_ERR(req)) {
c8ac917a46c2ea Jeff Layton    2022-08-25  1921  			ret = PTR_ERR(req);
c8ac917a46c2ea Jeff Layton    2022-08-25  1922  			ceph_release_page_vector(pages, num_pages);
c8ac917a46c2ea Jeff Layton    2022-08-25  1923  			break;
c8ac917a46c2ea Jeff Layton    2022-08-25  1924  		}
c8ac917a46c2ea Jeff Layton    2022-08-25  1925  
a62395e8e6ec3f Xiubo Li       2023-06-12  1926  		doutc(cl, "write op %lld~%llu\n", write_pos, write_len);
c8ac917a46c2ea Jeff Layton    2022-08-25  1927  		osd_req_op_extent_osd_data_pages(req, rmw ? 1 : 0, pages, write_len,
c8ac917a46c2ea Jeff Layton    2022-08-25  1928  						 offset_in_page(write_pos), false,
c8ac917a46c2ea Jeff Layton    2022-08-25  1929  						 true);
26be88087ae8a0 Alex Elder     2013-04-15  1930  		req->r_inode = inode;
c8ac917a46c2ea Jeff Layton    2022-08-25  1931  		req->r_mtime = mtime;
e8344e668915a7 majianpeng     2013-09-12  1932  
c8ac917a46c2ea Jeff Layton    2022-08-25  1933  		/* Set up the assertion */
c8ac917a46c2ea Jeff Layton    2022-08-25  1934  		if (rmw) {
c8ac917a46c2ea Jeff Layton    2022-08-25  1935  			/*
c8ac917a46c2ea Jeff Layton    2022-08-25  1936  			 * Set up the assertion. If we don't have a version number,
c8ac917a46c2ea Jeff Layton    2022-08-25  1937  			 * then the object doesn't exist yet. Use an exclusive create
c8ac917a46c2ea Jeff Layton    2022-08-25  1938  			 * instead of a version assertion in that case.
c8ac917a46c2ea Jeff Layton    2022-08-25  1939  			 */
c8ac917a46c2ea Jeff Layton    2022-08-25  1940  			if (assert_ver) {
c8ac917a46c2ea Jeff Layton    2022-08-25  1941  				osd_req_op_init(req, 0, CEPH_OSD_OP_ASSERT_VER, 0);
c8ac917a46c2ea Jeff Layton    2022-08-25  1942  				req->r_ops[0].assert_ver.ver = assert_ver;
c8ac917a46c2ea Jeff Layton    2022-08-25  1943  			} else {
c8ac917a46c2ea Jeff Layton    2022-08-25  1944  				osd_req_op_init(req, 0, CEPH_OSD_OP_CREATE,
c8ac917a46c2ea Jeff Layton    2022-08-25  1945  						CEPH_OSD_OP_FLAG_EXCL);
c8ac917a46c2ea Jeff Layton    2022-08-25  1946  			}
c8ac917a46c2ea Jeff Layton    2022-08-25  1947  		}
124e68e7409909 Sage Weil      2009-10-06  1948  
c8ac917a46c2ea Jeff Layton    2022-08-25  1949  		ceph_osdc_start_request(osdc, req);
c8ac917a46c2ea Jeff Layton    2022-08-25  1950  		ret = ceph_osdc_wait_request(osdc, req);
124e68e7409909 Sage Weil      2009-10-06  1951  
8ae99ae2b40766 Xiubo Li       2021-03-22  1952  		ceph_update_write_metrics(&fsc->mdsc->metric, req->r_start_latency,
903f4fec78dd05 Xiubo Li       2021-05-13  1953  					  req->r_end_latency, len, ret);
124e68e7409909 Sage Weil      2009-10-06  1954  		ceph_osdc_put_request(req);
26544c623e741a Jeff Layton    2017-04-04  1955  		if (ret != 0) {
a62395e8e6ec3f Xiubo Li       2023-06-12  1956  			doutc(cl, "osd write returned %d\n", ret);
c8ac917a46c2ea Jeff Layton    2022-08-25  1957  			/* Version changed! Must re-do the rmw cycle */
c8ac917a46c2ea Jeff Layton    2022-08-25  1958  			if ((assert_ver && (ret == -ERANGE || ret == -EOVERFLOW)) ||
c8ac917a46c2ea Jeff Layton    2022-08-25  1959  			     (!assert_ver && ret == -EEXIST)) {
c8ac917a46c2ea Jeff Layton    2022-08-25  1960  				/* We should only ever see this on a rmw */
c8ac917a46c2ea Jeff Layton    2022-08-25  1961  				WARN_ON_ONCE(!rmw);
c8ac917a46c2ea Jeff Layton    2022-08-25  1962  
c8ac917a46c2ea Jeff Layton    2022-08-25  1963  				/* The version should never go backward */
c8ac917a46c2ea Jeff Layton    2022-08-25  1964  				WARN_ON_ONCE(ret == -EOVERFLOW);
c8ac917a46c2ea Jeff Layton    2022-08-25  1965  
c8ac917a46c2ea Jeff Layton    2022-08-25  1966  				*from = saved_iter;
c8ac917a46c2ea Jeff Layton    2022-08-25  1967  
c8ac917a46c2ea Jeff Layton    2022-08-25  1968  				/* FIXME: limit number of times we loop? */
c8ac917a46c2ea Jeff Layton    2022-08-25  1969  				continue;
c8ac917a46c2ea Jeff Layton    2022-08-25  1970  			}
26544c623e741a Jeff Layton    2017-04-04  1971  			ceph_set_error_write(ci);
26544c623e741a Jeff Layton    2017-04-04  1972  			break;
26544c623e741a Jeff Layton    2017-04-04  1973  		}
26544c623e741a Jeff Layton    2017-04-04  1974  
26544c623e741a Jeff Layton    2017-04-04  1975  		ceph_clear_error_write(ci);
c697a9dac2a323 Luís Henriques 2022-08-25  1976  
c697a9dac2a323 Luís Henriques 2022-08-25  1977  		/*
c697a9dac2a323 Luís Henriques 2022-08-25  1978  		 * We successfully wrote to a range of the file. Declare
c697a9dac2a323 Luís Henriques 2022-08-25  1979  		 * that region of the pagecache invalid.
c697a9dac2a323 Luís Henriques 2022-08-25  1980  		 */
c697a9dac2a323 Luís Henriques 2022-08-25  1981  		ret = invalidate_inode_pages2_range(
c697a9dac2a323 Luís Henriques 2022-08-25  1982  				inode->i_mapping,
c697a9dac2a323 Luís Henriques 2022-08-25  1983  				pos >> PAGE_SHIFT,
c697a9dac2a323 Luís Henriques 2022-08-25  1984  				(pos + len - 1) >> PAGE_SHIFT);
c697a9dac2a323 Luís Henriques 2022-08-25  1985  		if (ret < 0) {
a62395e8e6ec3f Xiubo Li       2023-06-12  1986  			doutc(cl, "invalidate_inode_pages2_range returned %d\n",
c697a9dac2a323 Luís Henriques 2022-08-25  1987  			      ret);
c697a9dac2a323 Luís Henriques 2022-08-25  1988  			ret = 0;
c697a9dac2a323 Luís Henriques 2022-08-25  1989  		}
124e68e7409909 Sage Weil      2009-10-06  1990  		pos += len;
124e68e7409909 Sage Weil      2009-10-06  1991  		written += len;
a62395e8e6ec3f Xiubo Li       2023-06-12  1992  		doutc(cl, "written %d\n", written);
e8344e668915a7 majianpeng     2013-09-12  1993  		if (pos > i_size_read(inode)) {
124e68e7409909 Sage Weil      2009-10-06  1994  			check_caps = ceph_inode_set_size(inode, pos);
124e68e7409909 Sage Weil      2009-10-06  1995  			if (check_caps)
e8344e668915a7 majianpeng     2013-09-12  1996  				ceph_check_caps(ceph_inode(inode),
e4b731ccb0975f Xiubo Li       2022-10-18  1997  						CHECK_CAPS_AUTHONLY);
e8344e668915a7 majianpeng     2013-09-12  1998  		}
26544c623e741a Jeff Layton    2017-04-04  1999  
e8344e668915a7 majianpeng     2013-09-12  2000  	}
e8344e668915a7 majianpeng     2013-09-12  2001  
f8a351bc221199 David Howells  2023-07-31  2002  	ceph_databuf_release(dbuf);
e8344e668915a7 majianpeng     2013-09-12  2003  	if (ret != -EOLDSNAPC && written > 0) {
ee7289bfadda5f majianpeng     2013-08-21  2004  		ret = written;
e8344e668915a7 majianpeng     2013-09-12  2005  		iocb->ki_pos = pos;
124e68e7409909 Sage Weil      2009-10-06  2006  	}
a62395e8e6ec3f Xiubo Li       2023-06-12  2007  	doutc(cl, "returning %d\n", ret);
124e68e7409909 Sage Weil      2009-10-06  2008  	return ret;
124e68e7409909 Sage Weil      2009-10-06  2009  }
124e68e7409909 Sage Weil      2009-10-06  2010  

:::::: The code at line 1775 was first introduced by commit
:::::: c8ac917a46c2ea77edc18da4ea80762d36489ac6 ceph: add read/modify/write to ceph_sync_write

:::::: TO: Jeff Layton <jlayton@kernel.org>
:::::: CC: Xiubo Li <xiubli@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
