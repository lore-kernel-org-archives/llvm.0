Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6421871;
	Wed, 30 Aug 2023 08:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693383124; x=1724919124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NLA577Vbz9l1Z7rb4/Ush7mC1wsa+w2D3P685aR9pSc=;
  b=CQspWy7s5+YjFBCl61egX3Cc0ugOui+gdLzDFVBQMNLM9pRwY6mcZ4gj
   89WLSJCnAfGIPNglPXWonIji+L0xiAkn1ZXB1LSRlTd0ARkPUNjrfSl4o
   SNQe6v8tSxowVvDSZV8d2Fp5t+5xQ7clm5xagtPez6PrYV8OpY/O07qNr
   t01lKSSss1Wd4jife8UPsQ3DLCYHUyknHasJSkAX1abPseci4nakp/zSB
   srSDHQZe2w7cV7+w7LBIdskpoGGb7c5lyi59rpG6jSEyCLpbquuc1u8EE
   u4BBZbzw3JaHCZaupTIWD304Lu8Z7SBTJ08NuKruLeI6xbKwNpZ+5NdFT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441941425"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="scan'208";a="441941425"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 01:12:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="804429518"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="scan'208";a="804429518"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 30 Aug 2023 01:12:00 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbGIx-0009bP-1U;
	Wed, 30 Aug 2023 08:11:59 +0000
Date: Wed, 30 Aug 2023 16:11:39 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 32/36] fs/ceph/addr.c:255:36: error: no
 member named 'length' in 'struct ceph_osd_data'
Message-ID: <202308301622.0KJv3351-lkp@intel.com>
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
commit: 12c2f80c4fdfc960bf346b28229c9257010864b9 [32/36] ceph: Remove CEPH_OS_DATA_TYPE_PAGES and its attendant helpers
config: x86_64-randconfig-011-20230830 (https://download.01.org/0day-ci/archive/20230830/202308301622.0KJv3351-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308301622.0KJv3351-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308301622.0KJv3351-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/ceph/addr.c:255:36: error: no member named 'length' in 'struct ceph_osd_data'
                                    req->r_end_latency, osd_data->length, err);
                                                        ~~~~~~~~  ^
>> fs/ceph/addr.c:272:56: error: no member named 'pages' in 'struct ceph_osd_data'
                           err = ceph_fscrypt_decrypt_extents(inode, osd_data->pages,
                                                                     ~~~~~~~~  ^
>> fs/ceph/addr.c:280:24: error: use of undeclared identifier 'CEPH_OSD_DATA_TYPE_PAGES'
           if (osd_data->type == CEPH_OSD_DATA_TYPE_PAGES) {
                                 ^
   fs/ceph/addr.c:281:34: error: no member named 'pages' in 'struct ceph_osd_data'
                   ceph_put_page_vector(osd_data->pages,
                                        ~~~~~~~~  ^
>> fs/ceph/addr.c:282:35: error: no member named 'offset' in 'struct ceph_osd_data'
                                        calc_pages_for(osd_data->offset,
                                                       ~~~~~~~~  ^
   fs/ceph/addr.c:283:16: error: no member named 'length' in 'struct ceph_osd_data'
                                           osd_data->length), false);
                                           ~~~~~~~~  ^
   fs/ceph/addr.c:882:28: error: use of undeclared identifier 'CEPH_OSD_DATA_TYPE_PAGES'
                   BUG_ON(osd_data->type != CEPH_OSD_DATA_TYPE_PAGES);
                                            ^
   fs/ceph/addr.c:883:20: error: no member named 'length' in 'struct ceph_osd_data'
                   len += osd_data->length;
                          ~~~~~~~~  ^
   fs/ceph/addr.c:884:45: error: no member named 'offset' in 'struct ceph_osd_data'
                   num_pages = calc_pages_for((u64)osd_data->offset,
                                                   ~~~~~~~~  ^
   fs/ceph/addr.c:885:24: error: no member named 'length' in 'struct ceph_osd_data'
                                              (u64)osd_data->length);
                                                   ~~~~~~~~  ^
   fs/ceph/addr.c:888:21: error: no member named 'pages' in 'struct ceph_osd_data'
                           page = osd_data->pages[j];
                                  ~~~~~~~~  ^
   fs/ceph/addr.c:891:40: error: no member named 'pages' in 'struct ceph_osd_data'
                                   fscrypt_free_bounce_page(osd_data->pages[j]);
                                                            ~~~~~~~~  ^
   fs/ceph/addr.c:892:15: error: no member named 'pages' in 'struct ceph_osd_data'
                                   osd_data->pages[j] = page;
                                   ~~~~~~~~  ^
   fs/ceph/addr.c:913:38: error: no member named 'length' in 'struct ceph_osd_data'
                         ceph_vinop(inode), osd_data->length,
                                            ~~~~~~~~  ^
   include/linux/ceph/ceph_debug.h:39:6: note: expanded from macro 'doutc'
                           ##__VA_ARGS__);                         \
                             ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   fs/ceph/addr.c:916:27: error: no member named 'pages' in 'struct ceph_osd_data'
                   release_pages(osd_data->pages, num_pages);
                                 ~~~~~~~~  ^
>> fs/ceph/addr.c:925:16: error: no member named 'pages_from_pool' in 'struct ceph_osd_data'
           if (osd_data->pages_from_pool)
               ~~~~~~~~  ^
   fs/ceph/addr.c:926:26: error: no member named 'pages' in 'struct ceph_osd_data'
                   mempool_free(osd_data->pages, ceph_wb_pagevec_pool);
                                ~~~~~~~~  ^
   fs/ceph/addr.c:928:19: error: no member named 'pages' in 'struct ceph_osd_data'
                   kfree(osd_data->pages);
                         ~~~~~~~~  ^
   fs/ceph/addr.c:2116:2: error: call to undeclared function 'osd_req_op_raw_data_in_pages'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           osd_req_op_raw_data_in_pages(rd_req, 0, pages, PAGE_SIZE,
           ^
   fs/ceph/addr.c:2116:2: note: did you mean 'osd_req_op_raw_data_in_databuf'?
   include/linux/ceph/osd_client.h:465:6: note: 'osd_req_op_raw_data_in_databuf' declared here
   void osd_req_op_raw_data_in_databuf(struct ceph_osd_request *osd_req,
        ^
   19 errors generated.


vim +255 fs/ceph/addr.c

f0702876e152f0 Jeff Layton   2020-06-01  242  
f0702876e152f0 Jeff Layton   2020-06-01  243  static void finish_netfs_read(struct ceph_osd_request *req)
f0702876e152f0 Jeff Layton   2020-06-01  244  {
eb8405d4debe40 Jeff Layton   2023-01-02  245  	struct inode *inode = req->r_inode;
8cc5ed1b046309 Xiubo Li      2023-06-12  246  	struct ceph_fs_client *fsc = ceph_inode_to_fs_client(inode);
a62395e8e6ec3f Xiubo Li      2023-06-12  247  	struct ceph_client *cl = fsc->client;
f0702876e152f0 Jeff Layton   2020-06-01  248  	struct ceph_osd_data *osd_data = osd_req_op_extent_osd_data(req, 0);
6a19114b8e7f1e David Howells 2022-02-17  249  	struct netfs_io_subrequest *subreq = req->r_priv;
773e261d0fe08f Jeff Layton   2022-02-26  250  	struct ceph_osd_req_op *op = &req->r_ops[0];
f0702876e152f0 Jeff Layton   2020-06-01  251  	int err = req->r_result;
773e261d0fe08f Jeff Layton   2022-02-26  252  	bool sparse = (op->op == CEPH_OSD_OP_SPARSE_READ);
f0702876e152f0 Jeff Layton   2020-06-01  253  
8ae99ae2b40766 Xiubo Li      2021-03-22  254  	ceph_update_read_metrics(&fsc->mdsc->metric, req->r_start_latency,
903f4fec78dd05 Xiubo Li      2021-05-13 @255  				 req->r_end_latency, osd_data->length, err);
f0702876e152f0 Jeff Layton   2020-06-01  256  
a62395e8e6ec3f Xiubo Li      2023-06-12  257  	doutc(cl, "result %d subreq->len=%zu i_size=%lld\n", req->r_result,
f0702876e152f0 Jeff Layton   2020-06-01  258  	      subreq->len, i_size_read(req->r_inode));
f0702876e152f0 Jeff Layton   2020-06-01  259  
f0702876e152f0 Jeff Layton   2020-06-01  260  	/* no object means success but no data */
eb8405d4debe40 Jeff Layton   2023-01-02  261  	if (err == -ENOENT)
f0702876e152f0 Jeff Layton   2020-06-01  262  		err = 0;
f0702876e152f0 Jeff Layton   2020-06-01  263  	else if (err == -EBLOCKLISTED)
f0702876e152f0 Jeff Layton   2020-06-01  264  		fsc->blocklisted = true;
f0702876e152f0 Jeff Layton   2020-06-01  265  
eb8405d4debe40 Jeff Layton   2023-01-02  266  	if (err >= 0) {
eb8405d4debe40 Jeff Layton   2023-01-02  267  		if (sparse && err > 0)
eb8405d4debe40 Jeff Layton   2023-01-02  268  			err = ceph_sparse_ext_map_end(op);
eb8405d4debe40 Jeff Layton   2023-01-02  269  		if (err < subreq->len)
f0702876e152f0 Jeff Layton   2020-06-01  270  			__set_bit(NETFS_SREQ_CLEAR_TAIL, &subreq->flags);
eb8405d4debe40 Jeff Layton   2023-01-02  271  		if (IS_ENCRYPTED(inode) && err > 0) {
eb8405d4debe40 Jeff Layton   2023-01-02 @272  			err = ceph_fscrypt_decrypt_extents(inode, osd_data->pages,
eb8405d4debe40 Jeff Layton   2023-01-02  273  					subreq->start, op->extent.sparse_ext,
eb8405d4debe40 Jeff Layton   2023-01-02  274  					op->extent.sparse_ext_cnt);
eb8405d4debe40 Jeff Layton   2023-01-02  275  			if (err > subreq->len)
eb8405d4debe40 Jeff Layton   2023-01-02  276  				err = subreq->len;
eb8405d4debe40 Jeff Layton   2023-01-02  277  		}
eb8405d4debe40 Jeff Layton   2023-01-02  278  	}
f0702876e152f0 Jeff Layton   2020-06-01  279  
eb8405d4debe40 Jeff Layton   2023-01-02 @280  	if (osd_data->type == CEPH_OSD_DATA_TYPE_PAGES) {
eb8405d4debe40 Jeff Layton   2023-01-02  281  		ceph_put_page_vector(osd_data->pages,
1477e5b1f22848 David Howells 2023-04-20 @282  				     calc_pages_for(osd_data->offset,
eb8405d4debe40 Jeff Layton   2023-01-02  283  					osd_data->length), false);
eb8405d4debe40 Jeff Layton   2023-01-02  284  	}
7467b04418d929 Jeff Layton   2022-06-07  285  	netfs_subreq_terminated(subreq, err, false);
f0702876e152f0 Jeff Layton   2020-06-01  286  	iput(req->r_inode);
c94d5671d6e1a4 Xiubo Li      2023-05-09  287  	ceph_dec_osd_stopping_blocker(fsc->mdsc);
f0702876e152f0 Jeff Layton   2020-06-01  288  }
f0702876e152f0 Jeff Layton   2020-06-01  289  

:::::: The code at line 255 was first introduced by commit
:::::: 903f4fec78dd05a48fdccdf4539c040fb2d5bbf4 ceph: add IO size metrics support

:::::: TO: Xiubo Li <xiubli@redhat.com>
:::::: CC: Ilya Dryomov <idryomov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
