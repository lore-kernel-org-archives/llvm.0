Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5523750BF;
	Tue,  3 Mar 2026 14:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772548596; cv=none; b=W/r/vuEqlBVFjVne2eIeV0f+whLuC7h9+MvIavt3tuI/YH8igqw3NoSI2ClusaplJCN7gpAuT0iDe7h7pC95j3CYcr9F3lXf+DRzjx+ARgc8cfLDUo6T1YH089njlOa2qnXVWd/s46o9pX1qtZrfrMuP2Mmjzjx2Drnr1iuid54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772548596; c=relaxed/simple;
	bh=TFAYok/uSxTftnY4iRR8BDgmoJLr8cnzqOmL9P2X4I4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qV+xKCGP1pEqAgHVN1l7RHQgnSML9l14jW+d9ZN98ImvEbJpVvHPNd682G70Em+uP2XZI1F8b+pxGD/Wvakxy/M2HPbtVSZRKmsw4RagYELpJe0SKBGaFM2m2WubRHu8aFMeIqq4ujdy5r6I+AKJDBUo0L8d3E3fMnQj4H7gfHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C8Di55Gu; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C8Di55Gu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772548591; x=1804084591;
  h=date:from:to:cc:subject:message-id;
  bh=TFAYok/uSxTftnY4iRR8BDgmoJLr8cnzqOmL9P2X4I4=;
  b=C8Di55GucD8zRY5n6kd0kPZgQui/KSME1C0M1dyg7dEI3PLe63o6og3g
   q0rV+fyFm0rO42FZ7ZbZ0EXHIn1mKmCQKhM3g+DytHQLI7gWERyDRi8MP
   tpj/H/38wl57Ed4jibsQkNbJCqTHgVh0dpD3cxzUKbxnEHnT+yZdYqsRU
   G8dgc98I6/YOQF06NeLP8JFNdZpCNn3WqO2eZ5PeuT6mLC27PbZl+OsXK
   FwlQVrMiDpq1oWIxBcPEZ4C0OijnCyJZL43VeB+2VKdTt2bimdaBZs02Q
   eDLTvw9fLdbGNRgj7YtIIzICL3v0U7cpGwQD/bLinUK2gmE1KAyMtnlr1
   Q==;
X-CSE-ConnectionGUID: LeiSUMqPQTmPk9SoZnAQRQ==
X-CSE-MsgGUID: WpA8waNKQ92kHxf/DpV5wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="77429825"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="77429825"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 06:35:21 -0800
X-CSE-ConnectionGUID: YNx8+aILSuuWqG2Ulhj9ow==
X-CSE-MsgGUID: CiqOGEm/Q+myb/PsNL1KUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="217258010"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 03 Mar 2026 06:35:19 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxQqC-000000001Tp-09B6;
	Tue, 03 Mar 2026 14:35:16 +0000
Date: Tue, 03 Mar 2026 15:34:44 +0100
From: kernel test robot <lkp@intel.com>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 fuse-devel@lists.sourceforge.net, Miklos Szeredi <mszeredi@redhat.com>,
 Jingbo Xu <jefflexu@linux.alibaba.com>,
 "Darrick J. Wong" <djwong@kernel.org>
Subject: [mszeredi-fuse:for-next 9/12] fs/fuse/dev.c:1818:43:
 warning: variable 'folio_offset' is uninitialized when used here
Message-ID: <202603031522.e4lroM3J-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git for-next
head:   16c09ed4c4502027cdd1c9d285cc02657e9e2b72
commit: db64b9107f146940606d512f1d6214323b905565 [9/12] fuse: simplify logic in fuse_notify_store() and fuse_retrieve()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260303/202603031522.e4lroM3J-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260303/202603031522.e4lroM3J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603031522.e4lroM3J-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fuse/dev.c:1818:43: warning: variable 'folio_offset' is uninitialized when used here [-Wuninitialized]
    1818 |                 nr_bytes = min(num, folio_size(folio) - folio_offset);
         |                                                         ^~~~~~~~~~~~
   include/linux/minmax.h:105:41: note: expanded from macro 'min'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                                               ^
   include/linux/minmax.h:98:28: note: expanded from macro '__careful_cmp'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                   ^
   include/linux/minmax.h:92:28: note: expanded from macro '__careful_cmp_once'
      92 |         auto ux = (x); auto uy = (y);                   \
         |                                   ^
   fs/fuse/dev.c:1809:28: note: initialize the variable 'folio_offset' to silence this warning
    1809 |                 unsigned int folio_offset;
         |                                          ^
         |                                           = 0
   1 warning generated.


vim +/folio_offset +1818 fs/fuse/dev.c

3b463ae0c6264f John Muir      2009-05-31  1761  
a1d75f258230b7 Miklos Szeredi 2010-07-12  1762  static int fuse_notify_store(struct fuse_conn *fc, unsigned int size,
a1d75f258230b7 Miklos Szeredi 2010-07-12  1763  			     struct fuse_copy_state *cs)
a1d75f258230b7 Miklos Szeredi 2010-07-12  1764  {
a1d75f258230b7 Miklos Szeredi 2010-07-12  1765  	struct fuse_notify_store_out outarg;
a1d75f258230b7 Miklos Szeredi 2010-07-12  1766  	struct inode *inode;
a1d75f258230b7 Miklos Szeredi 2010-07-12  1767  	struct address_space *mapping;
a1d75f258230b7 Miklos Szeredi 2010-07-12  1768  	u64 nodeid;
a1d75f258230b7 Miklos Szeredi 2010-07-12  1769  	int err;
a1d75f258230b7 Miklos Szeredi 2010-07-12  1770  	unsigned int num;
a1d75f258230b7 Miklos Szeredi 2010-07-12  1771  	loff_t file_size;
db64b9107f1469 Joanne Koong   2026-01-20  1772  	loff_t pos;
a1d75f258230b7 Miklos Szeredi 2010-07-12  1773  	loff_t end;
a1d75f258230b7 Miklos Szeredi 2010-07-12  1774  
a1d75f258230b7 Miklos Szeredi 2010-07-12  1775  	if (size < sizeof(outarg))
60e1579a0dcf2c Miklos Szeredi 2025-09-01  1776  		return -EINVAL;
a1d75f258230b7 Miklos Szeredi 2010-07-12  1777  
a1d75f258230b7 Miklos Szeredi 2010-07-12  1778  	err = fuse_copy_one(cs, &outarg, sizeof(outarg));
a1d75f258230b7 Miklos Szeredi 2010-07-12  1779  	if (err)
60e1579a0dcf2c Miklos Szeredi 2025-09-01  1780  		return err;
a1d75f258230b7 Miklos Szeredi 2010-07-12  1781  
a1d75f258230b7 Miklos Szeredi 2010-07-12  1782  	if (size - sizeof(outarg) != outarg.size)
60e1579a0dcf2c Miklos Szeredi 2025-09-01  1783  		return -EINVAL;
a1d75f258230b7 Miklos Szeredi 2010-07-12  1784  
65161470f95bb5 Joanne Koong   2026-01-20  1785  	if (outarg.offset >= MAX_LFS_FILESIZE)
65161470f95bb5 Joanne Koong   2026-01-20  1786  		return -EINVAL;
65161470f95bb5 Joanne Koong   2026-01-20  1787  
a1d75f258230b7 Miklos Szeredi 2010-07-12  1788  	nodeid = outarg.nodeid;
db64b9107f1469 Joanne Koong   2026-01-20  1789  	pos = outarg.offset;
db64b9107f1469 Joanne Koong   2026-01-20  1790  	num = min(outarg.size, MAX_LFS_FILESIZE - pos);
a1d75f258230b7 Miklos Szeredi 2010-07-12  1791  
a1d75f258230b7 Miklos Szeredi 2010-07-12  1792  	down_read(&fc->killsb);
a1d75f258230b7 Miklos Szeredi 2010-07-12  1793  
a1d75f258230b7 Miklos Szeredi 2010-07-12  1794  	err = -ENOENT;
fcee216beb9c15 Max Reitz      2020-05-06  1795  	inode = fuse_ilookup(fc, nodeid,  NULL);
a1d75f258230b7 Miklos Szeredi 2010-07-12  1796  	if (!inode)
a1d75f258230b7 Miklos Szeredi 2010-07-12  1797  		goto out_up_killsb;
a1d75f258230b7 Miklos Szeredi 2010-07-12  1798  
a1d75f258230b7 Miklos Szeredi 2010-07-12  1799  	mapping = inode->i_mapping;
a1d75f258230b7 Miklos Szeredi 2010-07-12  1800  	file_size = i_size_read(inode);
db64b9107f1469 Joanne Koong   2026-01-20  1801  	end = pos + num;
a1d75f258230b7 Miklos Szeredi 2010-07-12  1802  	if (end > file_size) {
a1d75f258230b7 Miklos Szeredi 2010-07-12  1803  		file_size = end;
65161470f95bb5 Joanne Koong   2026-01-20  1804  		fuse_write_update_attr(inode, file_size, num);
a1d75f258230b7 Miklos Szeredi 2010-07-12  1805  	}
a1d75f258230b7 Miklos Szeredi 2010-07-12  1806  
a1d75f258230b7 Miklos Szeredi 2010-07-12  1807  	while (num) {
8807f117be9d15 Josef Bacik    2024-09-30  1808  		struct folio *folio;
c91440c89fbd9d Joanne Koong   2025-05-12  1809  		unsigned int folio_offset;
c91440c89fbd9d Joanne Koong   2025-05-12  1810  		unsigned int nr_bytes;
db64b9107f1469 Joanne Koong   2026-01-20  1811  		pgoff_t index = pos >> PAGE_SHIFT;
a1d75f258230b7 Miklos Szeredi 2010-07-12  1812  
8807f117be9d15 Josef Bacik    2024-09-30  1813  		folio = filemap_grab_folio(mapping, index);
8807f117be9d15 Josef Bacik    2024-09-30  1814  		err = PTR_ERR(folio);
8807f117be9d15 Josef Bacik    2024-09-30  1815  		if (IS_ERR(folio))
a1d75f258230b7 Miklos Szeredi 2010-07-12  1816  			goto out_iput;
a1d75f258230b7 Miklos Szeredi 2010-07-12  1817  
0f5bb0cfb0b40a David Laight   2025-11-19 @1818  		nr_bytes = min(num, folio_size(folio) - folio_offset);
db64b9107f1469 Joanne Koong   2026-01-20  1819  		folio_offset = offset_in_folio(folio, pos);
c91440c89fbd9d Joanne Koong   2025-05-12  1820  
c91440c89fbd9d Joanne Koong   2025-05-12  1821  		err = fuse_copy_folio(cs, &folio, folio_offset, nr_bytes, 0);
db64b9107f1469 Joanne Koong   2026-01-20  1822  		if (!folio_test_uptodate(folio) && !err && folio_offset == 0 &&
c91440c89fbd9d Joanne Koong   2025-05-12  1823  		    (nr_bytes == folio_size(folio) || file_size == end)) {
c91440c89fbd9d Joanne Koong   2025-05-12  1824  			folio_zero_segment(folio, nr_bytes, folio_size(folio));
8807f117be9d15 Josef Bacik    2024-09-30  1825  			folio_mark_uptodate(folio);
3c0da3d163eb32 Jann Horn      2024-08-06  1826  		}
8807f117be9d15 Josef Bacik    2024-09-30  1827  		folio_unlock(folio);
8807f117be9d15 Josef Bacik    2024-09-30  1828  		folio_put(folio);
a1d75f258230b7 Miklos Szeredi 2010-07-12  1829  
a1d75f258230b7 Miklos Szeredi 2010-07-12  1830  		if (err)
a1d75f258230b7 Miklos Szeredi 2010-07-12  1831  			goto out_iput;
a1d75f258230b7 Miklos Szeredi 2010-07-12  1832  
db64b9107f1469 Joanne Koong   2026-01-20  1833  		pos += nr_bytes;
c91440c89fbd9d Joanne Koong   2025-05-12  1834  		num -= nr_bytes;
a1d75f258230b7 Miklos Szeredi 2010-07-12  1835  	}
a1d75f258230b7 Miklos Szeredi 2010-07-12  1836  
a1d75f258230b7 Miklos Szeredi 2010-07-12  1837  	err = 0;
a1d75f258230b7 Miklos Szeredi 2010-07-12  1838  
a1d75f258230b7 Miklos Szeredi 2010-07-12  1839  out_iput:
a1d75f258230b7 Miklos Szeredi 2010-07-12  1840  	iput(inode);
a1d75f258230b7 Miklos Szeredi 2010-07-12  1841  out_up_killsb:
a1d75f258230b7 Miklos Szeredi 2010-07-12  1842  	up_read(&fc->killsb);
a1d75f258230b7 Miklos Szeredi 2010-07-12  1843  	return err;
a1d75f258230b7 Miklos Szeredi 2010-07-12  1844  }
a1d75f258230b7 Miklos Szeredi 2010-07-12  1845  

:::::: The code at line 1818 was first introduced by commit
:::::: 0f5bb0cfb0b40a31d2fe146ecbef5727690fa547 fs: use min() or umin() instead of min_t()

:::::: TO: David Laight <david.laight.linux@gmail.com>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
