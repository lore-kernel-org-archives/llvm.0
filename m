Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB17CA55;
	Fri,  4 Aug 2023 18:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691174687; x=1722710687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LyrfTNWfvpXrheDpsHtjeqsN3kPWxkCd2wTdo6sMte4=;
  b=V5ZuEVp3/FrjkovsEEEadZjpvvr2PYBl6KxoXoP2eWe6aPVp+bWFiKOQ
   6ynzsEWs0Zi1K7K3sp2bBGFzsf+ESLUKkuCNMe/5UVQgsU2SGfU7it6Ik
   /yY5XMpo+pu4V94BnKtbZWgLpV5IQ5rzipRXO/YYnI3r38XD+IdgovoBC
   aMV2lKI1a1fgRR6nud/gpuXqQ271E0R3BFOSLcgDZ+/7mhU9oQu+YslLm
   zcGY+wXMLbmhor9tqOB11PUSs8dI0rc1dTXWHPIx/NbRcoGNpbCaaDK0i
   PXbnDlLXUuniUVLRUTomBHia/4twkRt32ieXg4iSLXczfRKQQxv0D3fwA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="401180610"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="401180610"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 11:44:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="707112904"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="707112904"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 Aug 2023 11:44:44 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRzn1-00032t-2k;
	Fri, 04 Aug 2023 18:44:43 +0000
Date: Sat, 5 Aug 2023 02:43:56 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 16/18] fs/ceph/addr.c:272:56: error: no
 member named 'pages' in 'struct ceph_osd_data'
Message-ID: <202308050225.bCENdGNg-lkp@intel.com>
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
commit: 173db2e634dcd7df7e5d6cac4e83ff496f1845bd [16/18] ceph: Remove CEPH_OS_DATA_TYPE_PAGES and its attendant helpers
config: i386-randconfig-i013-20230801 (https://download.01.org/0day-ci/archive/20230805/202308050225.bCENdGNg-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050225.bCENdGNg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308050225.bCENdGNg-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ceph/addr.c:255:36: error: no member named 'length' in 'struct ceph_osd_data'
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


vim +272 fs/ceph/addr.c

f0702876e152f0 Jeff Layton   2020-06-01  242  
f0702876e152f0 Jeff Layton   2020-06-01  243  static void finish_netfs_read(struct ceph_osd_request *req)
f0702876e152f0 Jeff Layton   2020-06-01  244  {
48d1edf47c2a8d Jeff Layton   2023-01-02  245  	struct inode *inode = req->r_inode;
6e6d7e6a04e774 Xiubo Li      2023-06-12  246  	struct ceph_fs_client *fsc = ceph_inode_to_fs_client(inode);
eba6420eb72b5f Xiubo Li      2023-06-12  247  	struct ceph_client *cl = fsc->client;
f0702876e152f0 Jeff Layton   2020-06-01  248  	struct ceph_osd_data *osd_data = osd_req_op_extent_osd_data(req, 0);
6a19114b8e7f1e David Howells 2022-02-17  249  	struct netfs_io_subrequest *subreq = req->r_priv;
5bc241e020562d Jeff Layton   2022-02-26  250  	struct ceph_osd_req_op *op = &req->r_ops[0];
f0702876e152f0 Jeff Layton   2020-06-01  251  	int err = req->r_result;
5bc241e020562d Jeff Layton   2022-02-26  252  	bool sparse = (op->op == CEPH_OSD_OP_SPARSE_READ);
f0702876e152f0 Jeff Layton   2020-06-01  253  
8ae99ae2b40766 Xiubo Li      2021-03-22  254  	ceph_update_read_metrics(&fsc->mdsc->metric, req->r_start_latency,
903f4fec78dd05 Xiubo Li      2021-05-13  255  				 req->r_end_latency, osd_data->length, err);
f0702876e152f0 Jeff Layton   2020-06-01  256  
eba6420eb72b5f Xiubo Li      2023-06-12  257  	doutc(cl, "result %d subreq->len=%zu i_size=%lld\n", req->r_result,
f0702876e152f0 Jeff Layton   2020-06-01  258  	      subreq->len, i_size_read(req->r_inode));
f0702876e152f0 Jeff Layton   2020-06-01  259  
f0702876e152f0 Jeff Layton   2020-06-01  260  	/* no object means success but no data */
48d1edf47c2a8d Jeff Layton   2023-01-02  261  	if (err == -ENOENT)
f0702876e152f0 Jeff Layton   2020-06-01  262  		err = 0;
f0702876e152f0 Jeff Layton   2020-06-01  263  	else if (err == -EBLOCKLISTED)
f0702876e152f0 Jeff Layton   2020-06-01  264  		fsc->blocklisted = true;
f0702876e152f0 Jeff Layton   2020-06-01  265  
48d1edf47c2a8d Jeff Layton   2023-01-02  266  	if (err >= 0) {
48d1edf47c2a8d Jeff Layton   2023-01-02  267  		if (sparse && err > 0)
48d1edf47c2a8d Jeff Layton   2023-01-02  268  			err = ceph_sparse_ext_map_end(op);
48d1edf47c2a8d Jeff Layton   2023-01-02  269  		if (err < subreq->len)
f0702876e152f0 Jeff Layton   2020-06-01  270  			__set_bit(NETFS_SREQ_CLEAR_TAIL, &subreq->flags);
48d1edf47c2a8d Jeff Layton   2023-01-02  271  		if (IS_ENCRYPTED(inode) && err > 0) {
48d1edf47c2a8d Jeff Layton   2023-01-02 @272  			err = ceph_fscrypt_decrypt_extents(inode, osd_data->pages,
48d1edf47c2a8d Jeff Layton   2023-01-02  273  					subreq->start, op->extent.sparse_ext,
48d1edf47c2a8d Jeff Layton   2023-01-02  274  					op->extent.sparse_ext_cnt);
48d1edf47c2a8d Jeff Layton   2023-01-02  275  			if (err > subreq->len)
48d1edf47c2a8d Jeff Layton   2023-01-02  276  				err = subreq->len;
48d1edf47c2a8d Jeff Layton   2023-01-02  277  		}
48d1edf47c2a8d Jeff Layton   2023-01-02  278  	}
f0702876e152f0 Jeff Layton   2020-06-01  279  
48d1edf47c2a8d Jeff Layton   2023-01-02 @280  	if (osd_data->type == CEPH_OSD_DATA_TYPE_PAGES) {
48d1edf47c2a8d Jeff Layton   2023-01-02  281  		ceph_put_page_vector(osd_data->pages,
73acbd205528e5 David Howells 2023-04-20 @282  				     calc_pages_for(osd_data->offset,
48d1edf47c2a8d Jeff Layton   2023-01-02  283  					osd_data->length), false);
48d1edf47c2a8d Jeff Layton   2023-01-02  284  	}
7467b04418d929 Jeff Layton   2022-06-07  285  	netfs_subreq_terminated(subreq, err, false);
f0702876e152f0 Jeff Layton   2020-06-01  286  	iput(req->r_inode);
ca50971bd0093c Xiubo Li      2023-05-09  287  	ceph_dec_osd_stopping_blocker(fsc->mdsc);
f0702876e152f0 Jeff Layton   2020-06-01  288  }
f0702876e152f0 Jeff Layton   2020-06-01  289  

:::::: The code at line 272 was first introduced by commit
:::::: 48d1edf47c2a8d9117eab1e1476741f56979510a ceph: add fscrypt decryption support to ceph_netfs_issue_op

:::::: TO: Jeff Layton <jlayton@kernel.org>
:::::: CC: Ilya Dryomov <idryomov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
