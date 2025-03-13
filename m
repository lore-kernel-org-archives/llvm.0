Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C85110E3;
	Thu, 13 Mar 2025 00:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741826480; cv=none; b=s3E2GqTXmLxbd3lzKyIA9+B+xO9OdwD6Y5SYNCOY4dxDec0El1BdaeKih3vHmkly0NXuc4blC+8PBsfI/TxtWbbgqqJaubPNzHE/QKG07pwiD9uOa4/uubjKA+2Gl4UeixsN2CN46un621ktgwIPDedYut15kxY3dZ2oOgSmYno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741826480; c=relaxed/simple;
	bh=qg4wkcrZqdQahc+sBAwx21I9SGHYFcxuktnWsZUwsEg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OJEIpEaaEU7LxOlC+qamj5/mGQCG/Ujp11Nmxy7oaYySktF6IGRRQ40uU77C/JHaDI6+E+KNJRxGiCpUSq05TzzvsaR7Fo508576NIYFAz6EEpreFJu8jSLKdbNurCzq1qFdRRCJSKzaQz6zwM+N07G8/dqtNjl1xsoW33ATMgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iJmsWW9I; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iJmsWW9I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741826478; x=1773362478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qg4wkcrZqdQahc+sBAwx21I9SGHYFcxuktnWsZUwsEg=;
  b=iJmsWW9IPdQ1HovBIAYKbkYn3llVtRUw3U5x68lBDbPRlDyE+IO8JrJL
   fJQnNUxee3vYxUQLqT00GlQG0ImAhN9vCEHHigk1h7t8jflWNn2nUoC2s
   z5T/P4LpEgLOP03dSRmS8zSvsXbh2AU2oA6r2frXAXJfcreFPJeGY4+t6
   AWFX+gvgi//I7BSm/XFdeI6ifkHWxA2QnIZC47ohkZwzsvISo51FtzI8m
   10Jo+Sxi7oQ97gB38fofkc8FU70xet48A9HUEvnbAO+9gCuLZdJx8Yhl2
   1pTNxZmntJ6vOhjmmPzD/9C6tMl4x4eze7zvPske89oQry5jCk3zks63y
   g==;
X-CSE-ConnectionGUID: o12QYmSxTMqTr5xCqWoQyA==
X-CSE-MsgGUID: Jof6ID3KTLOQJPOyOV7qgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="46836119"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="46836119"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 17:41:18 -0700
X-CSE-ConnectionGUID: 3nO+JddHSnKIyH/21LSluw==
X-CSE-MsgGUID: TJX4JyxWRh6p8sSYOhk/jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="121026618"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 12 Mar 2025 17:41:16 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsWdN-000912-2w;
	Thu, 13 Mar 2025 00:41:13 +0000
Date: Thu, 13 Mar 2025 08:40:42 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 45/45] net/ceph/messenger_v2.c:1718:29:
 warning: variable 'enc_page_cnt' is uninitialized when used here
Message-ID: <202503130859.hiq9p5zB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   0ce16824859c4d7209abe27da17e23679b6c7c69
commit: 0ce16824859c4d7209abe27da17e23679b6c7c69 [45/45] ceph: Don't use data_pages
config: i386-buildonly-randconfig-003-20250313 (https://download.01.org/0day-ci/archive/20250313/202503130859.hiq9p5zB-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503130859.hiq9p5zB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503130859.hiq9p5zB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ceph/messenger_v2.c:1718:29: warning: variable 'enc_page_cnt' is uninitialized when used here [-Wuninitialized]
    1718 |         con->v2.out_enc_page_cnt = enc_page_cnt;
         |                                    ^~~~~~~~~~~~
   net/ceph/messenger_v2.c:1672:18: note: initialize the variable 'enc_page_cnt' to silence this warning
    1672 |         int enc_page_cnt;
         |                         ^
         |                          = 0
   net/ceph/messenger_v2.c:3246:29: error: no member named 'out_enc_pages' in 'struct ceph_connection_v2_info'; did you mean 'in_enc_pages'?
    3246 |         bvec_set_page(&bv, con->v2.out_enc_pages[con->v2.out_enc_i],
         |                                    ^~~~~~~~~~~~~
         |                                    in_enc_pages
   include/linux/ceph/messenger.h:305:16: note: 'in_enc_pages' declared here
     305 |         struct page **in_enc_pages;
         |                       ^
   net/ceph/messenger_v2.c:3254:32: error: use of undeclared identifier 'OUT_S_QUEUE_ENC_PAGE'
    3254 |                 WARN_ON(con->v2.out_state != OUT_S_QUEUE_ENC_PAGE);
         |                                              ^
   net/ceph/messenger_v2.c:3292:14: error: no member named 'out_enc_pages' in 'struct ceph_connection_v2_info'; did you mean 'in_enc_pages'?
    3292 |         if (con->v2.out_enc_pages) {
         |                     ^~~~~~~~~~~~~
         |                     in_enc_pages
   include/linux/ceph/messenger.h:305:16: note: 'in_enc_pages' declared here
     305 |         struct page **in_enc_pages;
         |                       ^
   net/ceph/messenger_v2.c:3294:36: error: no member named 'out_enc_pages' in 'struct ceph_connection_v2_info'; did you mean 'in_enc_pages'?
    3294 |                 ceph_release_page_vector(con->v2.out_enc_pages,
         |                                                  ^~~~~~~~~~~~~
         |                                                  in_enc_pages
   include/linux/ceph/messenger.h:305:16: note: 'in_enc_pages' declared here
     305 |         struct page **in_enc_pages;
         |                       ^
   net/ceph/messenger_v2.c:3296:11: error: no member named 'out_enc_pages' in 'struct ceph_connection_v2_info'; did you mean 'in_enc_pages'?
    3296 |                 con->v2.out_enc_pages = NULL;
         |                         ^~~~~~~~~~~~~
         |                         in_enc_pages
   include/linux/ceph/messenger.h:305:16: note: 'in_enc_pages' declared here
     305 |         struct page **in_enc_pages;
         |                       ^
   net/ceph/messenger_v2.c:3331:7: error: use of undeclared identifier 'OUT_S_QUEUE_ENC_PAGE'
    3331 |         case OUT_S_QUEUE_ENC_PAGE:
         |              ^
   net/ceph/messenger_v2.c:3650:32: error: use of undeclared identifier 'OUT_S_QUEUE_ENC_PAGE'
    3650 |                 WARN_ON(con->v2.out_state != OUT_S_QUEUE_ENC_PAGE &&
         |                                              ^
   net/ceph/messenger_v2.c:3818:14: error: no member named 'out_enc_pages' in 'struct ceph_connection_v2_info'; did you mean 'in_enc_pages'?
    3818 |         if (con->v2.out_enc_pages) {
         |                     ^~~~~~~~~~~~~
         |                     in_enc_pages
   include/linux/ceph/messenger.h:305:16: note: 'in_enc_pages' declared here
     305 |         struct page **in_enc_pages;
         |                       ^
   net/ceph/messenger_v2.c:3820:36: error: no member named 'out_enc_pages' in 'struct ceph_connection_v2_info'; did you mean 'in_enc_pages'?
    3820 |                 ceph_release_page_vector(con->v2.out_enc_pages,
         |                                                  ^~~~~~~~~~~~~
         |                                                  in_enc_pages
   include/linux/ceph/messenger.h:305:16: note: 'in_enc_pages' declared here
     305 |         struct page **in_enc_pages;
         |                       ^
   net/ceph/messenger_v2.c:3822:11: error: no member named 'out_enc_pages' in 'struct ceph_connection_v2_info'; did you mean 'in_enc_pages'?
    3822 |                 con->v2.out_enc_pages = NULL;
         |                         ^~~~~~~~~~~~~
         |                         in_enc_pages
   include/linux/ceph/messenger.h:305:16: note: 'in_enc_pages' declared here
     305 |         struct page **in_enc_pages;
         |                       ^
   1 warning and 10 errors generated.


vim +/enc_page_cnt +1718 net/ceph/messenger_v2.c

cd1a677cad99402 Ilya Dryomov  2020-11-19  1654  
cd1a677cad99402 Ilya Dryomov  2020-11-19  1655  /*
cd1a677cad99402 Ilya Dryomov  2020-11-19  1656   * Unfortunately the kernel crypto API doesn't support streaming
cd1a677cad99402 Ilya Dryomov  2020-11-19  1657   * (piecewise) operation for AEAD algorithms, so we can't get away
cd1a677cad99402 Ilya Dryomov  2020-11-19  1658   * with a fixed size buffer and a couple sgs.  Instead, we have to
cd1a677cad99402 Ilya Dryomov  2020-11-19  1659   * allocate pages for the entire tail of the message (currently up
cd1a677cad99402 Ilya Dryomov  2020-11-19  1660   * to ~32M) and two sgs arrays (up to ~256K each)...
cd1a677cad99402 Ilya Dryomov  2020-11-19  1661   */
cd1a677cad99402 Ilya Dryomov  2020-11-19  1662  static int prepare_message_secure(struct ceph_connection *con)
cd1a677cad99402 Ilya Dryomov  2020-11-19  1663  {
cd1a677cad99402 Ilya Dryomov  2020-11-19  1664  	void *zerop = page_address(ceph_zero_page);
0ce16824859c4d7 David Howells 2023-07-31  1665  	struct folio_queue *enc_buffer = NULL, *fq;
0ce16824859c4d7 David Howells 2023-07-31  1666  	struct iov_iter enc_iter;
cd1a677cad99402 Ilya Dryomov  2020-11-19  1667  	struct sg_table enc_sgt = {};
cd1a677cad99402 Ilya Dryomov  2020-11-19  1668  	struct sg_table sgt = {};
0ce16824859c4d7 David Howells 2023-07-31  1669  	unsigned int nr_segs = 0;
0ce16824859c4d7 David Howells 2023-07-31  1670  	ssize_t xsize;
0ce16824859c4d7 David Howells 2023-07-31  1671  	size_t buf_size = 0;
cd1a677cad99402 Ilya Dryomov  2020-11-19  1672  	int enc_page_cnt;
cd1a677cad99402 Ilya Dryomov  2020-11-19  1673  	int tail_len;
cd1a677cad99402 Ilya Dryomov  2020-11-19  1674  	int ret;
cd1a677cad99402 Ilya Dryomov  2020-11-19  1675  
cd1a677cad99402 Ilya Dryomov  2020-11-19  1676  	ret = prepare_head_secure_small(con, con->v2.out_buf,
cd1a677cad99402 Ilya Dryomov  2020-11-19  1677  					sizeof(struct ceph_msg_header2));
cd1a677cad99402 Ilya Dryomov  2020-11-19  1678  	if (ret)
cd1a677cad99402 Ilya Dryomov  2020-11-19  1679  		return ret;
cd1a677cad99402 Ilya Dryomov  2020-11-19  1680  
cd1a677cad99402 Ilya Dryomov  2020-11-19  1681  	tail_len = tail_onwire_len(con->out_msg, true);
cd1a677cad99402 Ilya Dryomov  2020-11-19  1682  	if (!tail_len) {
cd1a677cad99402 Ilya Dryomov  2020-11-19  1683  		/*
cd1a677cad99402 Ilya Dryomov  2020-11-19  1684  		 * Empty message: once the head is written,
cd1a677cad99402 Ilya Dryomov  2020-11-19  1685  		 * we are done -- there is no epilogue.
cd1a677cad99402 Ilya Dryomov  2020-11-19  1686  		 */
cd1a677cad99402 Ilya Dryomov  2020-11-19  1687  		con->v2.out_state = OUT_S_FINISH_MESSAGE;
cd1a677cad99402 Ilya Dryomov  2020-11-19  1688  		return 0;
cd1a677cad99402 Ilya Dryomov  2020-11-19  1689  	}
cd1a677cad99402 Ilya Dryomov  2020-11-19  1690  
cd1a677cad99402 Ilya Dryomov  2020-11-19  1691  	encode_epilogue_secure(con, false);
cd1a677cad99402 Ilya Dryomov  2020-11-19  1692  	ret = setup_message_sgs(&sgt, con->out_msg, zerop, zerop, zerop,
f36217e35ce13fe Jeff Layton   2022-03-23  1693  				&con->v2.out_epil, NULL, 0, false);
cd1a677cad99402 Ilya Dryomov  2020-11-19  1694  	if (ret)
cd1a677cad99402 Ilya Dryomov  2020-11-19  1695  		goto out;
cd1a677cad99402 Ilya Dryomov  2020-11-19  1696  
0ce16824859c4d7 David Howells 2023-07-31  1697  	ret = netfs_alloc_folioq_buffer(NULL, &enc_buffer, &buf_size, tail_len,
0ce16824859c4d7 David Howells 2023-07-31  1698  					GFP_NOIO);
0ce16824859c4d7 David Howells 2023-07-31  1699  	if (ret < 0)
0ce16824859c4d7 David Howells 2023-07-31  1700  		goto out;
0ce16824859c4d7 David Howells 2023-07-31  1701  
0ce16824859c4d7 David Howells 2023-07-31  1702  	for (fq = enc_buffer; fq; fq = fq->next)
0ce16824859c4d7 David Howells 2023-07-31  1703  		nr_segs += folioq_count(fq);
0ce16824859c4d7 David Howells 2023-07-31  1704  
0ce16824859c4d7 David Howells 2023-07-31  1705  	ret = sg_alloc_table(&enc_sgt, nr_segs, GFP_NOIO);
0ce16824859c4d7 David Howells 2023-07-31  1706  	if (ret)
0ce16824859c4d7 David Howells 2023-07-31  1707  		goto out;
0ce16824859c4d7 David Howells 2023-07-31  1708  
0ce16824859c4d7 David Howells 2023-07-31  1709  	iov_iter_folio_queue(&enc_iter, READ, enc_buffer, 0, 0, tail_len);
0ce16824859c4d7 David Howells 2023-07-31  1710  	xsize = extract_iter_to_sg(&enc_iter, tail_len, &enc_sgt, nr_segs, 0);
0ce16824859c4d7 David Howells 2023-07-31  1711  	if (WARN_ON(xsize != tail_len)) {
0ce16824859c4d7 David Howells 2023-07-31  1712  		ret = -EIO;
cd1a677cad99402 Ilya Dryomov  2020-11-19  1713  		goto out;
cd1a677cad99402 Ilya Dryomov  2020-11-19  1714  	}
cd1a677cad99402 Ilya Dryomov  2020-11-19  1715  
0ce16824859c4d7 David Howells 2023-07-31  1716  	WARN_ON(con->v2.out_enc_buffer || con->v2.out_enc_page_cnt);
0ce16824859c4d7 David Howells 2023-07-31  1717  	con->v2.out_enc_buffer = enc_buffer;
cd1a677cad99402 Ilya Dryomov  2020-11-19 @1718  	con->v2.out_enc_page_cnt = enc_page_cnt;
cd1a677cad99402 Ilya Dryomov  2020-11-19  1719  	con->v2.out_enc_resid = tail_len;
cd1a677cad99402 Ilya Dryomov  2020-11-19  1720  	con->v2.out_enc_i = 0;
0ce16824859c4d7 David Howells 2023-07-31  1721  	enc_buffer = NULL;
cd1a677cad99402 Ilya Dryomov  2020-11-19  1722  
cd1a677cad99402 Ilya Dryomov  2020-11-19  1723  	ret = gcm_crypt(con, true, sgt.sgl, enc_sgt.sgl,
cd1a677cad99402 Ilya Dryomov  2020-11-19  1724  			tail_len - CEPH_GCM_TAG_LEN);
cd1a677cad99402 Ilya Dryomov  2020-11-19  1725  	if (ret)
cd1a677cad99402 Ilya Dryomov  2020-11-19  1726  		goto out;
cd1a677cad99402 Ilya Dryomov  2020-11-19  1727  
cd1a677cad99402 Ilya Dryomov  2020-11-19  1728  	dout("%s con %p msg %p sg_cnt %d enc_page_cnt %d\n", __func__, con,
cd1a677cad99402 Ilya Dryomov  2020-11-19  1729  	     con->out_msg, sgt.orig_nents, enc_page_cnt);
0ce16824859c4d7 David Howells 2023-07-31  1730  	con->v2.out_state = OUT_S_QUEUE_ENC_FOLIOQ;
cd1a677cad99402 Ilya Dryomov  2020-11-19  1731  
cd1a677cad99402 Ilya Dryomov  2020-11-19  1732  out:
cd1a677cad99402 Ilya Dryomov  2020-11-19  1733  	sg_free_table(&sgt);
cd1a677cad99402 Ilya Dryomov  2020-11-19  1734  	sg_free_table(&enc_sgt);
0ce16824859c4d7 David Howells 2023-07-31  1735  	netfs_free_folioq_buffer(enc_buffer);
cd1a677cad99402 Ilya Dryomov  2020-11-19  1736  	return ret;
cd1a677cad99402 Ilya Dryomov  2020-11-19  1737  }
cd1a677cad99402 Ilya Dryomov  2020-11-19  1738  

:::::: The code at line 1718 was first introduced by commit
:::::: cd1a677cad994021b19665ed476aea63f5d54f31 libceph, ceph: implement msgr2.1 protocol (crc and secure modes)

:::::: TO: Ilya Dryomov <idryomov@gmail.com>
:::::: CC: Ilya Dryomov <idryomov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
