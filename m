Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA7E269AE6;
	Thu, 13 Mar 2025 14:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741876372; cv=none; b=arMAE/RqEC4ZdxspUdSeir+MZnjm7JSYvz5PoMll669pRxTlCl5eOYLBDUlzqqlp+fvZWZH0WS4EsrrlI8aI6zOyDJLzg0svwkNtZbYmkOX2MMF9mmIw2HqP6I147NVRy3zVUQ5tQyP8JF5U/Cm/lzNl7RtfgeKMoH5TmKlxf9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741876372; c=relaxed/simple;
	bh=WO29Igs6zIzW9miuwSHyeYHYSHvQrA7d9ttp4Ak/hmg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WBEtfIQ7oKPFdTWkkam4Cd+cdcipVipt4CPI0MsCS4fcsrznFEfBW0jlk1bzw7M4msLBlR5Kk4/MoPV+hx4784q3qrc3SdVTP1ntC1XQbsFOZNYzWXSIvC1OruNtTj8cR6RMmkDMpMuCK7KK7Qq/PsT/R1NT+uXYl5pSmL0OAyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fDHNlzTP; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fDHNlzTP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741876371; x=1773412371;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WO29Igs6zIzW9miuwSHyeYHYSHvQrA7d9ttp4Ak/hmg=;
  b=fDHNlzTPzHPVfDbET9oAvaRt7vbdVIcvQsBLQvvhMgdDFCL3/6qm66YX
   XqF5LT6SMdQzqQW6RMiQ4d8eZqpX9ojl4nLR3UOLW4Zj8XKMF5M/leONY
   81Dr9L5BOFREfgJuzKjJlVdlo9/CQVjlNqdO/73gbLaV20fgVjjSpdP3l
   VuL0nArEt8RC/NEPK7V6FaxOgDlo6FDa5zEITv2wxRQIoMViehwkvzkBT
   8Y/EGlVy8b2PFT9FtltaWtDIJrcNLN+cTjyipSzJkCq23BrRfh7c042yK
   nKpw2TOH8Ce8nN050Rtg/Uv9R6iKbJhgSmX111cuC5q0KUX/L94tKSNJO
   w==;
X-CSE-ConnectionGUID: f+h9zXstQEaNyNmNNJfDMg==
X-CSE-MsgGUID: r3m+1cNkRQKliQofBGjEwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="68353259"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="68353259"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 07:32:50 -0700
X-CSE-ConnectionGUID: NmYsIyOwSFarMaH8WFFwbw==
X-CSE-MsgGUID: gArllwrLTOiOt1sGPZuWMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="121677900"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 13 Mar 2025 07:32:49 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsjc6-0009Wk-0N;
	Thu, 13 Mar 2025 14:32:46 +0000
Date: Thu, 13 Mar 2025 22:32:23 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 43/44] fs/ceph/addr.c:539:2: error: call to
 undeclared function 'osd_req_op_raw_data_in_pages'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202503140022.dvUPW8MU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   d96beacafbc048781a87c7188237957ed09d0df0
commit: 6e6fbe816f6feac19872bb2f900cdff82c31e668 [43/44] libceph: Remove CEPH_OS_DATA_TYPE_PAGES and its attendant helpers
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250314/202503140022.dvUPW8MU-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503140022.dvUPW8MU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503140022.dvUPW8MU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/ceph/addr.c:539:2: error: call to undeclared function 'osd_req_op_raw_data_in_pages'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     539 |         osd_req_op_raw_data_in_pages(rd_req, 0, pages, PAGE_SIZE,
         |         ^
   fs/ceph/addr.c:539:2: note: did you mean 'osd_req_op_raw_data_in_databuf'?
   include/linux/ceph/osd_client.h:465:6: note: 'osd_req_op_raw_data_in_databuf' declared here
     465 | void osd_req_op_raw_data_in_databuf(struct ceph_osd_request *osd_req,
         |      ^
   1 error generated.


vim +/osd_req_op_raw_data_in_pages +539 fs/ceph/addr.c

10183a69551f767 Yan, Zheng    2015-04-27  423  
779fe0fb8e1883d Yan, Zheng    2016-03-07  424  static int __ceph_pool_perm_get(struct ceph_inode_info *ci,
779fe0fb8e1883d Yan, Zheng    2016-03-07  425  				s64 pool, struct ceph_string *pool_ns)
10183a69551f767 Yan, Zheng    2015-04-27  426  {
5995d90d2d19f33 Xiubo Li      2023-06-12  427  	struct ceph_fs_client *fsc = ceph_inode_to_fs_client(&ci->netfs.inode);
10183a69551f767 Yan, Zheng    2015-04-27  428  	struct ceph_mds_client *mdsc = fsc->mdsc;
38d46409c4639a1 Xiubo Li      2023-06-12  429  	struct ceph_client *cl = fsc->client;
10183a69551f767 Yan, Zheng    2015-04-27  430  	struct ceph_osd_request *rd_req = NULL, *wr_req = NULL;
10183a69551f767 Yan, Zheng    2015-04-27  431  	struct rb_node **p, *parent;
10183a69551f767 Yan, Zheng    2015-04-27  432  	struct ceph_pool_perm *perm;
10183a69551f767 Yan, Zheng    2015-04-27  433  	struct page **pages;
779fe0fb8e1883d Yan, Zheng    2016-03-07  434  	size_t pool_ns_len;
10183a69551f767 Yan, Zheng    2015-04-27  435  	int err = 0, err2 = 0, have = 0;
10183a69551f767 Yan, Zheng    2015-04-27  436  
10183a69551f767 Yan, Zheng    2015-04-27  437  	down_read(&mdsc->pool_perm_rwsem);
10183a69551f767 Yan, Zheng    2015-04-27  438  	p = &mdsc->pool_perm_tree.rb_node;
10183a69551f767 Yan, Zheng    2015-04-27  439  	while (*p) {
10183a69551f767 Yan, Zheng    2015-04-27  440  		perm = rb_entry(*p, struct ceph_pool_perm, node);
10183a69551f767 Yan, Zheng    2015-04-27  441  		if (pool < perm->pool)
10183a69551f767 Yan, Zheng    2015-04-27  442  			p = &(*p)->rb_left;
10183a69551f767 Yan, Zheng    2015-04-27  443  		else if (pool > perm->pool)
10183a69551f767 Yan, Zheng    2015-04-27  444  			p = &(*p)->rb_right;
779fe0fb8e1883d Yan, Zheng    2016-03-07  445  		else {
779fe0fb8e1883d Yan, Zheng    2016-03-07  446  			int ret = ceph_compare_string(pool_ns,
779fe0fb8e1883d Yan, Zheng    2016-03-07  447  						perm->pool_ns,
779fe0fb8e1883d Yan, Zheng    2016-03-07  448  						perm->pool_ns_len);
779fe0fb8e1883d Yan, Zheng    2016-03-07  449  			if (ret < 0)
779fe0fb8e1883d Yan, Zheng    2016-03-07  450  				p = &(*p)->rb_left;
779fe0fb8e1883d Yan, Zheng    2016-03-07  451  			else if (ret > 0)
779fe0fb8e1883d Yan, Zheng    2016-03-07  452  				p = &(*p)->rb_right;
10183a69551f767 Yan, Zheng    2015-04-27  453  			else {
10183a69551f767 Yan, Zheng    2015-04-27  454  				have = perm->perm;
10183a69551f767 Yan, Zheng    2015-04-27  455  				break;
10183a69551f767 Yan, Zheng    2015-04-27  456  			}
10183a69551f767 Yan, Zheng    2015-04-27  457  		}
779fe0fb8e1883d Yan, Zheng    2016-03-07  458  	}
10183a69551f767 Yan, Zheng    2015-04-27  459  	up_read(&mdsc->pool_perm_rwsem);
10183a69551f767 Yan, Zheng    2015-04-27  460  	if (*p)
10183a69551f767 Yan, Zheng    2015-04-27  461  		goto out;
10183a69551f767 Yan, Zheng    2015-04-27  462  
779fe0fb8e1883d Yan, Zheng    2016-03-07  463  	if (pool_ns)
38d46409c4639a1 Xiubo Li      2023-06-12  464  		doutc(cl, "pool %lld ns %.*s no perm cached\n", pool,
38d46409c4639a1 Xiubo Li      2023-06-12  465  		      (int)pool_ns->len, pool_ns->str);
779fe0fb8e1883d Yan, Zheng    2016-03-07  466  	else
38d46409c4639a1 Xiubo Li      2023-06-12  467  		doutc(cl, "pool %lld no perm cached\n", pool);
10183a69551f767 Yan, Zheng    2015-04-27  468  
10183a69551f767 Yan, Zheng    2015-04-27  469  	down_write(&mdsc->pool_perm_rwsem);
779fe0fb8e1883d Yan, Zheng    2016-03-07  470  	p = &mdsc->pool_perm_tree.rb_node;
10183a69551f767 Yan, Zheng    2015-04-27  471  	parent = NULL;
10183a69551f767 Yan, Zheng    2015-04-27  472  	while (*p) {
10183a69551f767 Yan, Zheng    2015-04-27  473  		parent = *p;
10183a69551f767 Yan, Zheng    2015-04-27  474  		perm = rb_entry(parent, struct ceph_pool_perm, node);
10183a69551f767 Yan, Zheng    2015-04-27  475  		if (pool < perm->pool)
10183a69551f767 Yan, Zheng    2015-04-27  476  			p = &(*p)->rb_left;
10183a69551f767 Yan, Zheng    2015-04-27  477  		else if (pool > perm->pool)
10183a69551f767 Yan, Zheng    2015-04-27  478  			p = &(*p)->rb_right;
779fe0fb8e1883d Yan, Zheng    2016-03-07  479  		else {
779fe0fb8e1883d Yan, Zheng    2016-03-07  480  			int ret = ceph_compare_string(pool_ns,
779fe0fb8e1883d Yan, Zheng    2016-03-07  481  						perm->pool_ns,
779fe0fb8e1883d Yan, Zheng    2016-03-07  482  						perm->pool_ns_len);
779fe0fb8e1883d Yan, Zheng    2016-03-07  483  			if (ret < 0)
779fe0fb8e1883d Yan, Zheng    2016-03-07  484  				p = &(*p)->rb_left;
779fe0fb8e1883d Yan, Zheng    2016-03-07  485  			else if (ret > 0)
779fe0fb8e1883d Yan, Zheng    2016-03-07  486  				p = &(*p)->rb_right;
10183a69551f767 Yan, Zheng    2015-04-27  487  			else {
10183a69551f767 Yan, Zheng    2015-04-27  488  				have = perm->perm;
10183a69551f767 Yan, Zheng    2015-04-27  489  				break;
10183a69551f767 Yan, Zheng    2015-04-27  490  			}
10183a69551f767 Yan, Zheng    2015-04-27  491  		}
779fe0fb8e1883d Yan, Zheng    2016-03-07  492  	}
10183a69551f767 Yan, Zheng    2015-04-27  493  	if (*p) {
10183a69551f767 Yan, Zheng    2015-04-27  494  		up_write(&mdsc->pool_perm_rwsem);
10183a69551f767 Yan, Zheng    2015-04-27  495  		goto out;
10183a69551f767 Yan, Zheng    2015-04-27  496  	}
10183a69551f767 Yan, Zheng    2015-04-27  497  
34b759b4a22b0ac Ilya Dryomov  2016-02-16  498  	rd_req = ceph_osdc_alloc_request(&fsc->client->osdc, NULL,
10183a69551f767 Yan, Zheng    2015-04-27  499  					 1, false, GFP_NOFS);
10183a69551f767 Yan, Zheng    2015-04-27  500  	if (!rd_req) {
10183a69551f767 Yan, Zheng    2015-04-27  501  		err = -ENOMEM;
10183a69551f767 Yan, Zheng    2015-04-27  502  		goto out_unlock;
10183a69551f767 Yan, Zheng    2015-04-27  503  	}
10183a69551f767 Yan, Zheng    2015-04-27  504  
10183a69551f767 Yan, Zheng    2015-04-27  505  	rd_req->r_flags = CEPH_OSD_FLAG_READ;
10183a69551f767 Yan, Zheng    2015-04-27  506  	osd_req_op_init(rd_req, 0, CEPH_OSD_OP_STAT, 0);
10183a69551f767 Yan, Zheng    2015-04-27  507  	rd_req->r_base_oloc.pool = pool;
779fe0fb8e1883d Yan, Zheng    2016-03-07  508  	if (pool_ns)
779fe0fb8e1883d Yan, Zheng    2016-03-07  509  		rd_req->r_base_oloc.pool_ns = ceph_get_string(pool_ns);
d30291b985d1854 Ilya Dryomov  2016-04-29  510  	ceph_oid_printf(&rd_req->r_base_oid, "%llx.00000000", ci->i_vino.ino);
10183a69551f767 Yan, Zheng    2015-04-27  511  
13d1ad16d05eebb Ilya Dryomov  2016-04-27  512  	err = ceph_osdc_alloc_messages(rd_req, GFP_NOFS);
13d1ad16d05eebb Ilya Dryomov  2016-04-27  513  	if (err)
13d1ad16d05eebb Ilya Dryomov  2016-04-27  514  		goto out_unlock;
10183a69551f767 Yan, Zheng    2015-04-27  515  
34b759b4a22b0ac Ilya Dryomov  2016-02-16  516  	wr_req = ceph_osdc_alloc_request(&fsc->client->osdc, NULL,
10183a69551f767 Yan, Zheng    2015-04-27  517  					 1, false, GFP_NOFS);
10183a69551f767 Yan, Zheng    2015-04-27  518  	if (!wr_req) {
10183a69551f767 Yan, Zheng    2015-04-27  519  		err = -ENOMEM;
10183a69551f767 Yan, Zheng    2015-04-27  520  		goto out_unlock;
10183a69551f767 Yan, Zheng    2015-04-27  521  	}
10183a69551f767 Yan, Zheng    2015-04-27  522  
54ea0046b6fe36e Ilya Dryomov  2017-02-11  523  	wr_req->r_flags = CEPH_OSD_FLAG_WRITE;
10183a69551f767 Yan, Zheng    2015-04-27  524  	osd_req_op_init(wr_req, 0, CEPH_OSD_OP_CREATE, CEPH_OSD_OP_FLAG_EXCL);
63244fa123a755e Ilya Dryomov  2016-04-28  525  	ceph_oloc_copy(&wr_req->r_base_oloc, &rd_req->r_base_oloc);
d30291b985d1854 Ilya Dryomov  2016-04-29  526  	ceph_oid_copy(&wr_req->r_base_oid, &rd_req->r_base_oid);
10183a69551f767 Yan, Zheng    2015-04-27  527  
13d1ad16d05eebb Ilya Dryomov  2016-04-27  528  	err = ceph_osdc_alloc_messages(wr_req, GFP_NOFS);
13d1ad16d05eebb Ilya Dryomov  2016-04-27  529  	if (err)
13d1ad16d05eebb Ilya Dryomov  2016-04-27  530  		goto out_unlock;
10183a69551f767 Yan, Zheng    2015-04-27  531  
10183a69551f767 Yan, Zheng    2015-04-27  532  	/* one page should be large enough for STAT data */
10183a69551f767 Yan, Zheng    2015-04-27  533  	pages = ceph_alloc_page_vector(1, GFP_KERNEL);
10183a69551f767 Yan, Zheng    2015-04-27  534  	if (IS_ERR(pages)) {
10183a69551f767 Yan, Zheng    2015-04-27  535  		err = PTR_ERR(pages);
10183a69551f767 Yan, Zheng    2015-04-27  536  		goto out_unlock;
10183a69551f767 Yan, Zheng    2015-04-27  537  	}
10183a69551f767 Yan, Zheng    2015-04-27  538  
10183a69551f767 Yan, Zheng    2015-04-27 @539  	osd_req_op_raw_data_in_pages(rd_req, 0, pages, PAGE_SIZE,
10183a69551f767 Yan, Zheng    2015-04-27  540  				     0, false, true);
a8af0d682ae0c9c Jeff Layton   2022-06-30  541  	ceph_osdc_start_request(&fsc->client->osdc, rd_req);
10183a69551f767 Yan, Zheng    2015-04-27  542  
c453bdb535341b5 Jeff Layton   2023-10-04  543  	wr_req->r_mtime = inode_get_mtime(&ci->netfs.inode);
a8af0d682ae0c9c Jeff Layton   2022-06-30  544  	ceph_osdc_start_request(&fsc->client->osdc, wr_req);
10183a69551f767 Yan, Zheng    2015-04-27  545  
10183a69551f767 Yan, Zheng    2015-04-27  546  	err = ceph_osdc_wait_request(&fsc->client->osdc, rd_req);
10183a69551f767 Yan, Zheng    2015-04-27  547  	err2 = ceph_osdc_wait_request(&fsc->client->osdc, wr_req);
10183a69551f767 Yan, Zheng    2015-04-27  548  
10183a69551f767 Yan, Zheng    2015-04-27  549  	if (err >= 0 || err == -ENOENT)
10183a69551f767 Yan, Zheng    2015-04-27  550  		have |= POOL_READ;
131d7eb4faa1fc0 Yan, Zheng    2019-07-25  551  	else if (err != -EPERM) {
0b98acd61883093 Ilya Dryomov  2020-09-14  552  		if (err == -EBLOCKLISTED)
0b98acd61883093 Ilya Dryomov  2020-09-14  553  			fsc->blocklisted = true;
10183a69551f767 Yan, Zheng    2015-04-27  554  		goto out_unlock;
131d7eb4faa1fc0 Yan, Zheng    2019-07-25  555  	}
10183a69551f767 Yan, Zheng    2015-04-27  556  
10183a69551f767 Yan, Zheng    2015-04-27  557  	if (err2 == 0 || err2 == -EEXIST)
10183a69551f767 Yan, Zheng    2015-04-27  558  		have |= POOL_WRITE;
10183a69551f767 Yan, Zheng    2015-04-27  559  	else if (err2 != -EPERM) {
0b98acd61883093 Ilya Dryomov  2020-09-14  560  		if (err2 == -EBLOCKLISTED)
0b98acd61883093 Ilya Dryomov  2020-09-14  561  			fsc->blocklisted = true;
10183a69551f767 Yan, Zheng    2015-04-27  562  		err = err2;
10183a69551f767 Yan, Zheng    2015-04-27  563  		goto out_unlock;
10183a69551f767 Yan, Zheng    2015-04-27  564  	}
10183a69551f767 Yan, Zheng    2015-04-27  565  
779fe0fb8e1883d Yan, Zheng    2016-03-07  566  	pool_ns_len = pool_ns ? pool_ns->len : 0;
7264745d55422db Thorsten Blum 2024-09-12  567  	perm = kmalloc(struct_size(perm, pool_ns, pool_ns_len + 1), GFP_NOFS);
10183a69551f767 Yan, Zheng    2015-04-27  568  	if (!perm) {
10183a69551f767 Yan, Zheng    2015-04-27  569  		err = -ENOMEM;
10183a69551f767 Yan, Zheng    2015-04-27  570  		goto out_unlock;
10183a69551f767 Yan, Zheng    2015-04-27  571  	}
10183a69551f767 Yan, Zheng    2015-04-27  572  
10183a69551f767 Yan, Zheng    2015-04-27  573  	perm->pool = pool;
10183a69551f767 Yan, Zheng    2015-04-27  574  	perm->perm = have;
779fe0fb8e1883d Yan, Zheng    2016-03-07  575  	perm->pool_ns_len = pool_ns_len;
779fe0fb8e1883d Yan, Zheng    2016-03-07  576  	if (pool_ns_len > 0)
779fe0fb8e1883d Yan, Zheng    2016-03-07  577  		memcpy(perm->pool_ns, pool_ns->str, pool_ns_len);
779fe0fb8e1883d Yan, Zheng    2016-03-07  578  	perm->pool_ns[pool_ns_len] = 0;
779fe0fb8e1883d Yan, Zheng    2016-03-07  579  
10183a69551f767 Yan, Zheng    2015-04-27  580  	rb_link_node(&perm->node, parent, p);
10183a69551f767 Yan, Zheng    2015-04-27  581  	rb_insert_color(&perm->node, &mdsc->pool_perm_tree);
10183a69551f767 Yan, Zheng    2015-04-27  582  	err = 0;
10183a69551f767 Yan, Zheng    2015-04-27  583  out_unlock:
10183a69551f767 Yan, Zheng    2015-04-27  584  	up_write(&mdsc->pool_perm_rwsem);
10183a69551f767 Yan, Zheng    2015-04-27  585  
10183a69551f767 Yan, Zheng    2015-04-27  586  	ceph_osdc_put_request(rd_req);
10183a69551f767 Yan, Zheng    2015-04-27  587  	ceph_osdc_put_request(wr_req);
10183a69551f767 Yan, Zheng    2015-04-27  588  out:
10183a69551f767 Yan, Zheng    2015-04-27  589  	if (!err)
10183a69551f767 Yan, Zheng    2015-04-27  590  		err = have;
779fe0fb8e1883d Yan, Zheng    2016-03-07  591  	if (pool_ns)
38d46409c4639a1 Xiubo Li      2023-06-12  592  		doutc(cl, "pool %lld ns %.*s result = %d\n", pool,
38d46409c4639a1 Xiubo Li      2023-06-12  593  		      (int)pool_ns->len, pool_ns->str, err);
779fe0fb8e1883d Yan, Zheng    2016-03-07  594  	else
38d46409c4639a1 Xiubo Li      2023-06-12  595  		doutc(cl, "pool %lld result = %d\n", pool, err);
10183a69551f767 Yan, Zheng    2015-04-27  596  	return err;
10183a69551f767 Yan, Zheng    2015-04-27  597  }
10183a69551f767 Yan, Zheng    2015-04-27  598  

:::::: The code at line 539 was first introduced by commit
:::::: 10183a69551f76702ac68bc74a437b25419c6de0 ceph: check OSD caps before read/write

:::::: TO: Yan, Zheng <zyan@redhat.com>
:::::: CC: Ilya Dryomov <idryomov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
