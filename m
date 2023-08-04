Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E831AA8B;
	Fri,  4 Aug 2023 21:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691186394; x=1722722394;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6TV0GzWscAPQ2zmMaHc4wF8p7LqqLZYg1UOIw8PNBio=;
  b=YV/uO6jywl5DbeCpWL5hLigm9ijGUJBCoj+zO+gHONwt0M2X6kEBQlmq
   Hi0ioKRY1MG4lorBM463ucgYrBy5haNONP6cbR8ti8tCWqQ/x8JrHR2BP
   QkDJSbK8rlWt/ffrqVBtaTj6xfY1hj4jS0ie6QWZE42fQHIj7UalIo1R/
   5+H3Aw5WFGpYBu/Zz9GIdJRfH97UPOXt8z+4CvQbYa1aFP/cD+G4X2A/U
   Fk8PgmQ1Vbuzyll/y+Phyv7fo6XNdRXfGNxRPPHSXkgf/qjd16E85uQfs
   hD0Rbthk80xVMps5Xg6qcGnjziXKQMGbEw2bVNnZw0Xt+4xmYkaumWOhB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="456634559"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="456634559"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 14:59:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="904039112"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="904039112"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 04 Aug 2023 14:59:47 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qS2pn-00038J-0I;
	Fri, 04 Aug 2023 21:59:47 +0000
Date: Sat, 5 Aug 2023 05:59:21 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 18/18] fs/ceph/file.c:1741:9: error: too many
 arguments to function call, expected 3, have 4
Message-ID: <202308050513.Gi45WWxu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   672499b5bfaeda1769d9eab9c9a08f4c2b2e4bf5
commit: 672499b5bfaeda1769d9eab9c9a08f4c2b2e4bf5 [18/18] ceph: Don't use data_pages
config: i386-randconfig-i013-20230801 (https://download.01.org/0day-ci/archive/20230805/202308050513.Gi45WWxu-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050513.Gi45WWxu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308050513.Gi45WWxu-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ceph/file.c:1087:47: warning: variable 'pages' is uninitialized when used here [-Wuninitialized]
                           fret = ceph_fscrypt_decrypt_extents(inode, pages, read_off,
                                                                      ^~~~~
   fs/ceph/file.c:1010:22: note: initialize the variable 'pages' to silence this warning
                   struct page **pages;
                                      ^
                                       = NULL
>> fs/ceph/file.c:1741:9: error: too many arguments to function call, expected 3, have 4
                                                            CEPH_FSCRYPT_BLOCK_SIZE);
                                                            ^~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/crypto.h:13:36: note: expanded from macro 'CEPH_FSCRYPT_BLOCK_SIZE'
   #define CEPH_FSCRYPT_BLOCK_SIZE    (_AC(1, UL) << CEPH_FSCRYPT_BLOCK_SHIFT)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ceph/osd_client.h:458:13: note: 'osd_req_op_extent_osd_databuf' declared here
   extern void osd_req_op_extent_osd_databuf(struct ceph_osd_request *req,
               ^
>> fs/ceph/file.c:1769:9: error: use of undeclared identifier 'pages'
                                                           &pages[num_pages - 1],
                                                            ^
   fs/ceph/file.c:1799:24: error: use of undeclared identifier 'pages'
                                           zero_user_segment(pages[0], 0,
                                                             ^
   fs/ceph/file.c:1802:24: error: use of undeclared identifier 'pages'
                                           zero_user_segment(pages[num_pages - 1],
                                                             ^
   fs/ceph/file.c:1808:31: error: use of undeclared identifier 'pages'
                                           ceph_release_page_vector(pages, num_pages);
                                                                    ^
   fs/ceph/file.c:1815:25: error: use of undeclared identifier 'pages'
                                                   zero_user_segment(pages[0], 0,
                                                                     ^
   fs/ceph/file.c:1818:25: error: use of undeclared identifier 'pages'
                                                   zero_user_segment(pages[num_pages - 1],
                                                                     ^
   fs/ceph/file.c:1826:31: error: use of undeclared identifier 'pages'
                                           ceph_release_page_vector(pages, num_pages);
                                                                    ^
   fs/ceph/file.c:1833:25: error: use of undeclared identifier 'pages'
                                                   zero_user_segment(pages[num_pages - 1],
                                                                     ^
   fs/ceph/file.c:1841:32: error: use of undeclared identifier 'pages'
                                                   ceph_release_page_vector(pages, num_pages);
                                                                            ^
   fs/ceph/file.c:1853:8: error: use of undeclared identifier 'pages'
                                                           pages[0],
                                                           ^
   fs/ceph/file.c:1858:32: error: use of undeclared identifier 'pages'
                                                   ceph_release_page_vector(pages, num_pages);
                                                                            ^
   fs/ceph/file.c:1864:8: error: use of undeclared identifier 'pages'
                                                           pages[num_pages - 1],
                                                           ^
   fs/ceph/file.c:1869:32: error: use of undeclared identifier 'pages'
                                                   ceph_release_page_vector(pages, num_pages);
                                                                            ^
   fs/ceph/file.c:1882:30: error: use of undeclared identifier 'pages'
                           ret = copy_page_from_iter(pages[n], off, plen, from);
                                                     ^
   fs/ceph/file.c:1892:29: error: use of undeclared identifier 'pages'
                           ceph_release_page_vector(pages, num_pages);
                                                    ^
   fs/ceph/file.c:1897:44: error: use of undeclared identifier 'pages'
                           ret = ceph_fscrypt_encrypt_pages(inode, pages,
                                                                   ^
   fs/ceph/file.c:1902:30: error: use of undeclared identifier 'pages'
                                   ceph_release_page_vector(pages, num_pages);
                                                            ^
   fs/ceph/file.c:1916:29: error: use of undeclared identifier 'pages'
                           ceph_release_page_vector(pages, num_pages);
                                                    ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   1 warning and 20 errors generated.


vim +1741 fs/ceph/file.c

  1608	
  1609	/*
  1610	 * Synchronous write, straight from __user pointer or user pages.
  1611	 *
  1612	 * If write spans object boundary, just do multiple writes.  (For a
  1613	 * correct atomic write, we should e.g. take write locks on all
  1614	 * objects, rollback on failure, etc.)
  1615	 */
  1616	static ssize_t
  1617	ceph_sync_write(struct kiocb *iocb, struct iov_iter *from, loff_t pos,
  1618			struct ceph_snap_context *snapc)
  1619	{
  1620		struct file *file = iocb->ki_filp;
  1621		struct inode *inode = file_inode(file);
  1622		struct ceph_inode_info *ci = ceph_inode(inode);
  1623		struct ceph_fs_client *fsc = ceph_inode_to_fs_client(inode);
  1624		struct ceph_client *cl = fsc->client;
  1625		struct ceph_osd_client *osdc = &fsc->client->osdc;
  1626		struct ceph_osd_request *req;
  1627		struct ceph_databuf *dbuf = NULL;
  1628		u64 len;
  1629		int num_pages;
  1630		int written = 0;
  1631		int ret;
  1632		bool check_caps = false;
  1633		struct timespec64 mtime = current_time(inode);
  1634		size_t count = iov_iter_count(from);
  1635	
  1636		if (ceph_snap(file_inode(file)) != CEPH_NOSNAP)
  1637			return -EROFS;
  1638	
  1639		doutc(cl, "on file %p %lld~%u snapc %p seq %lld\n", file, pos,
  1640		      (unsigned)count, snapc, snapc->seq);
  1641	
  1642		ret = filemap_write_and_wait_range(inode->i_mapping,
  1643						   pos, pos + count - 1);
  1644		if (ret < 0)
  1645			return ret;
  1646	
  1647		ceph_fscache_invalidate(inode, false);
  1648	
  1649		while ((len = iov_iter_count(from)) > 0) {
  1650			size_t left;
  1651			int n;
  1652			u64 write_pos = pos;
  1653			u64 write_len = len;
  1654			u64 objnum, objoff;
  1655			u32 xlen;
  1656			u64 assert_ver = 0;
  1657			bool rmw;
  1658			bool first, last;
  1659			struct iov_iter saved_iter = *from;
  1660			size_t off;
  1661	
  1662			ceph_fscrypt_adjust_off_and_len(inode, &write_pos, &write_len);
  1663	
  1664			/* clamp the length to the end of first object */
  1665			ceph_calc_file_object_mapping(&ci->i_layout, write_pos,
  1666							write_len, &objnum, &objoff,
  1667							&xlen);
  1668			write_len = xlen;
  1669	
  1670			/* adjust len downward if it goes beyond current object */
  1671			if (pos + len > write_pos + write_len)
  1672				len = write_pos + write_len - pos;
  1673	
  1674			/*
  1675			 * If we had to adjust the length or position to align with a
  1676			 * crypto block, then we must do a read/modify/write cycle. We
  1677			 * use a version assertion to redrive the thing if something
  1678			 * changes in between.
  1679			 */
  1680			first = pos != write_pos;
  1681			last = (pos + len) != (write_pos + write_len);
  1682			rmw = first || last;
  1683	
  1684			doutc(cl, "ino %llx %lld~%llu adjusted %lld~%llu -- %srmw\n",
  1685			      ci->i_vino.ino, pos, len, write_pos, write_len,
  1686			      rmw ? "" : "no ");
  1687	
  1688			/*
  1689			 * The data is emplaced into the page as it would be if it were in
  1690			 * an array of pagecache pages.
  1691			 */
  1692			num_pages = calc_pages_for(write_pos, write_len);
  1693			dbuf = ceph_databuf_alloc(num_pages, num_pages * PAGE_SIZE, GFP_KERNEL);
  1694			if (!dbuf) {
  1695				ret = -ENOMEM;
  1696				break;
  1697			}
  1698	
  1699			/* Do we need to preload the pages? */
  1700			if (rmw) {
  1701				u64 first_pos = write_pos;
  1702				u64 last_pos = (write_pos + write_len) - CEPH_FSCRYPT_BLOCK_SIZE;
  1703				u64 read_len = CEPH_FSCRYPT_BLOCK_SIZE;
  1704				struct ceph_osd_req_op *op;
  1705	
  1706				/* We should only need to do this for encrypted inodes */
  1707				WARN_ON_ONCE(!IS_ENCRYPTED(inode));
  1708	
  1709				/* No need to do two reads if first and last blocks are same */
  1710				if (first && last_pos == first_pos)
  1711					last = false;
  1712	
  1713				/*
  1714				 * Allocate a read request for one or two extents, depending
  1715				 * on how the request was aligned.
  1716				 */
  1717				req = ceph_osdc_new_request(osdc, &ci->i_layout,
  1718						ci->i_vino, first ? first_pos : last_pos,
  1719						&read_len, 0, (first && last) ? 2 : 1,
  1720						CEPH_OSD_OP_SPARSE_READ, CEPH_OSD_FLAG_READ,
  1721						NULL, ci->i_truncate_seq,
  1722						ci->i_truncate_size, false);
  1723				if (IS_ERR(req)) {
  1724					ret = PTR_ERR(req);
  1725					break;
  1726				}
  1727	
  1728				/* Something is misaligned! */
  1729				if (read_len != CEPH_FSCRYPT_BLOCK_SIZE) {
  1730					ceph_osdc_put_request(req);
  1731					ret = -EIO;
  1732					break;
  1733				}
  1734	
  1735				/* Add extent for first block? */
  1736				op = &req->r_ops[0];
  1737	
  1738				if (first) {
  1739					iov_iter_advance(&dbuf->iter, offset_in_page(first_pos));
  1740					osd_req_op_extent_osd_databuf(req, 0, dbuf,
> 1741								 CEPH_FSCRYPT_BLOCK_SIZE);
  1742					dbuf = NULL;
  1743					/* We only expect a single extent here */
  1744					ret = __ceph_alloc_sparse_ext_map(op, 1);
  1745					if (ret) {
  1746						ceph_osdc_put_request(req);
  1747						break;
  1748					}
  1749				}
  1750	
  1751				/* Add extent for last block */
  1752				if (last) {
  1753					/* Init the other extent if first extent has been used */
  1754					if (first) {
  1755						op = &req->r_ops[1];
  1756						osd_req_op_extent_init(req, 1, CEPH_OSD_OP_SPARSE_READ,
  1757								last_pos, CEPH_FSCRYPT_BLOCK_SIZE,
  1758								ci->i_truncate_size,
  1759								ci->i_truncate_seq);
  1760					}
  1761	
  1762					ret = __ceph_alloc_sparse_ext_map(op, 1);
  1763					if (ret) {
  1764						ceph_osdc_put_request(req);
  1765						break;
  1766					}
  1767	
  1768					osd_req_op_extent_osd_data_pages(req, first ? 1 : 0,
> 1769								&pages[num_pages - 1],
  1770								CEPH_FSCRYPT_BLOCK_SIZE,
  1771								offset_in_page(last_pos),
  1772								false, false);
  1773				}
  1774	
  1775				ceph_osdc_start_request(osdc, req);
  1776				ret = ceph_osdc_wait_request(osdc, req);
  1777	
  1778				/* FIXME: length field is wrong if there are 2 extents */
  1779				ceph_update_read_metrics(&fsc->mdsc->metric,
  1780							 req->r_start_latency,
  1781							 req->r_end_latency,
  1782							 read_len, ret);
  1783	
  1784				/* Ok if object is not already present */
  1785				if (ret == -ENOENT) {
  1786					/*
  1787					 * If there is no object, then we can't assert
  1788					 * on its version. Set it to 0, and we'll use an
  1789					 * exclusive create instead.
  1790					 */
  1791					ceph_osdc_put_request(req);
  1792					ret = 0;
  1793	
  1794					/*
  1795					 * zero out the soon-to-be uncopied parts of the
  1796					 * first and last pages.
  1797					 */
  1798					if (first)
  1799						zero_user_segment(pages[0], 0,
  1800								  offset_in_page(first_pos));
  1801					if (last)
  1802						zero_user_segment(pages[num_pages - 1],
  1803								  offset_in_page(last_pos),
  1804								  PAGE_SIZE);
  1805				} else {
  1806					if (ret < 0) {
  1807						ceph_osdc_put_request(req);
  1808						ceph_release_page_vector(pages, num_pages);
  1809						break;
  1810					}
  1811	
  1812					op = &req->r_ops[0];
  1813					if (op->extent.sparse_ext_cnt == 0) {
  1814						if (first)
  1815							zero_user_segment(pages[0], 0,
  1816									  offset_in_page(first_pos));
  1817						else
  1818							zero_user_segment(pages[num_pages - 1],
  1819									  offset_in_page(last_pos),
  1820									  PAGE_SIZE);
  1821					} else if (op->extent.sparse_ext_cnt != 1 ||
  1822						   ceph_sparse_ext_map_end(op) !=
  1823							CEPH_FSCRYPT_BLOCK_SIZE) {
  1824						ret = -EIO;
  1825						ceph_osdc_put_request(req);
  1826						ceph_release_page_vector(pages, num_pages);
  1827						break;
  1828					}
  1829	
  1830					if (first && last) {
  1831						op = &req->r_ops[1];
  1832						if (op->extent.sparse_ext_cnt == 0) {
  1833							zero_user_segment(pages[num_pages - 1],
  1834									  offset_in_page(last_pos),
  1835									  PAGE_SIZE);
  1836						} else if (op->extent.sparse_ext_cnt != 1 ||
  1837							   ceph_sparse_ext_map_end(op) !=
  1838								CEPH_FSCRYPT_BLOCK_SIZE) {
  1839							ret = -EIO;
  1840							ceph_osdc_put_request(req);
  1841							ceph_release_page_vector(pages, num_pages);
  1842							break;
  1843						}
  1844					}
  1845	
  1846					/* Grab assert version. It must be non-zero. */
  1847					assert_ver = req->r_version;
  1848					WARN_ON_ONCE(ret > 0 && assert_ver == 0);
  1849	
  1850					ceph_osdc_put_request(req);
  1851					if (first) {
  1852						ret = ceph_fscrypt_decrypt_block_inplace(inode,
  1853								pages[0],
  1854								CEPH_FSCRYPT_BLOCK_SIZE,
  1855								offset_in_page(first_pos),
  1856								first_pos >> CEPH_FSCRYPT_BLOCK_SHIFT);
  1857						if (ret < 0) {
  1858							ceph_release_page_vector(pages, num_pages);
  1859							break;
  1860						}
  1861					}
  1862					if (last) {
  1863						ret = ceph_fscrypt_decrypt_block_inplace(inode,
  1864								pages[num_pages - 1],
  1865								CEPH_FSCRYPT_BLOCK_SIZE,
  1866								offset_in_page(last_pos),
  1867								last_pos >> CEPH_FSCRYPT_BLOCK_SHIFT);
  1868						if (ret < 0) {
  1869							ceph_release_page_vector(pages, num_pages);
  1870							break;
  1871						}
  1872					}
  1873				}
  1874			}
  1875	
  1876			left = len;
  1877			off = offset_in_page(pos);
  1878			for (n = 0; n < num_pages; n++) {
  1879				size_t plen = min_t(size_t, left, PAGE_SIZE - off);
  1880	
  1881				/* copy the data */
  1882				ret = copy_page_from_iter(pages[n], off, plen, from);
  1883				if (ret != plen) {
  1884					ret = -EFAULT;
  1885					break;
  1886				}
  1887				off = 0;
  1888				left -= ret;
  1889			}
  1890			if (ret < 0) {
  1891				doutc(cl, "write failed with %d\n", ret);
  1892				ceph_release_page_vector(pages, num_pages);
  1893				break;
  1894			}
  1895	
  1896			if (IS_ENCRYPTED(inode)) {
  1897				ret = ceph_fscrypt_encrypt_pages(inode, pages,
  1898								 write_pos, write_len,
  1899								 GFP_KERNEL);
  1900				if (ret < 0) {
  1901					doutc(cl, "encryption failed with %d\n", ret);
  1902					ceph_release_page_vector(pages, num_pages);
  1903					break;
  1904				}
  1905			}
  1906	
  1907			req = ceph_osdc_new_request(osdc, &ci->i_layout,
  1908						    ci->i_vino, write_pos, &write_len,
  1909						    rmw ? 1 : 0, rmw ? 2 : 1,
  1910						    CEPH_OSD_OP_WRITE,
  1911						    CEPH_OSD_FLAG_WRITE,
  1912						    snapc, ci->i_truncate_seq,
  1913						    ci->i_truncate_size, false);
  1914			if (IS_ERR(req)) {
  1915				ret = PTR_ERR(req);
  1916				ceph_release_page_vector(pages, num_pages);
  1917				break;
  1918			}
  1919	
  1920			doutc(cl, "write op %lld~%llu\n", write_pos, write_len);
  1921			osd_req_op_extent_osd_data_pages(req, rmw ? 1 : 0, pages, write_len,
  1922							 offset_in_page(write_pos), false,
  1923							 true);
  1924			req->r_inode = inode;
  1925			req->r_mtime = mtime;
  1926	
  1927			/* Set up the assertion */
  1928			if (rmw) {
  1929				/*
  1930				 * Set up the assertion. If we don't have a version number,
  1931				 * then the object doesn't exist yet. Use an exclusive create
  1932				 * instead of a version assertion in that case.
  1933				 */
  1934				if (assert_ver) {
  1935					osd_req_op_init(req, 0, CEPH_OSD_OP_ASSERT_VER, 0);
  1936					req->r_ops[0].assert_ver.ver = assert_ver;
  1937				} else {
  1938					osd_req_op_init(req, 0, CEPH_OSD_OP_CREATE,
  1939							CEPH_OSD_OP_FLAG_EXCL);
  1940				}
  1941			}
  1942	
  1943			ceph_osdc_start_request(osdc, req);
  1944			ret = ceph_osdc_wait_request(osdc, req);
  1945	
  1946			ceph_update_write_metrics(&fsc->mdsc->metric, req->r_start_latency,
  1947						  req->r_end_latency, len, ret);
  1948			ceph_osdc_put_request(req);
  1949			if (ret != 0) {
  1950				doutc(cl, "osd write returned %d\n", ret);
  1951				/* Version changed! Must re-do the rmw cycle */
  1952				if ((assert_ver && (ret == -ERANGE || ret == -EOVERFLOW)) ||
  1953				     (!assert_ver && ret == -EEXIST)) {
  1954					/* We should only ever see this on a rmw */
  1955					WARN_ON_ONCE(!rmw);
  1956	
  1957					/* The version should never go backward */
  1958					WARN_ON_ONCE(ret == -EOVERFLOW);
  1959	
  1960					*from = saved_iter;
  1961	
  1962					/* FIXME: limit number of times we loop? */
  1963					continue;
  1964				}
  1965				ceph_set_error_write(ci);
  1966				break;
  1967			}
  1968	
  1969			ceph_clear_error_write(ci);
  1970	
  1971			/*
  1972			 * We successfully wrote to a range of the file. Declare
  1973			 * that region of the pagecache invalid.
  1974			 */
  1975			ret = invalidate_inode_pages2_range(
  1976					inode->i_mapping,
  1977					pos >> PAGE_SHIFT,
  1978					(pos + len - 1) >> PAGE_SHIFT);
  1979			if (ret < 0) {
  1980				doutc(cl, "invalidate_inode_pages2_range returned %d\n",
  1981				      ret);
  1982				ret = 0;
  1983			}
  1984			pos += len;
  1985			written += len;
  1986			doutc(cl, "written %d\n", written);
  1987			if (pos > i_size_read(inode)) {
  1988				check_caps = ceph_inode_set_size(inode, pos);
  1989				if (check_caps)
  1990					ceph_check_caps(ceph_inode(inode),
  1991							CHECK_CAPS_AUTHONLY);
  1992			}
  1993	
  1994		}
  1995	
  1996		ceph_databuf_release(dbuf);
  1997		if (ret != -EOLDSNAPC && written > 0) {
  1998			ret = written;
  1999			iocb->ki_pos = pos;
  2000		}
  2001		doutc(cl, "returning %d\n", ret);
  2002		return ret;
  2003	}
  2004	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
