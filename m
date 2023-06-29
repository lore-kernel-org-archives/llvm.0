Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF299C8C9;
	Thu, 29 Jun 2023 20:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688070171; x=1719606171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IBoq+wxZaZhsxFDQQV/5TfkQ1wEzXmDXzokRppTBrTI=;
  b=K1Wlx95fVJpcBOEz3jdfP+DgWve28/eZXBZi33o6a8sxx5FDsNyvWK4n
   fqFeO89i2Rbn+uLvAS8Qomb5JL1ulDS0NZreNCF5isUzJwF0zrOu/ho87
   7ambMBlC9NWpHFxrINrfI29JheHsuLDUQdyqBmFtoiAIJvQUsCKGlUOZ5
   j4ONKUFfgWUU2LyFV2Yl1FgRZtr9DdccBJeDNe4gGWBiwFr3YZt+paDxY
   TLn76ne+h+dBhwKwfmmQQ+8Lxqm7idmzx+19bwwiAgwG7oq3TzC6Lyxp2
   H78IUt2WMDgHmJdkRAVWHCyVptQRqY4jrtQ1R9NfJFvd+3JL6/zUQS0u+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="425907936"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="425907936"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 13:22:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="964120015"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="964120015"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 29 Jun 2023 13:22:46 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEyAA-000ENQ-12;
	Thu, 29 Jun 2023 20:22:46 +0000
Date: Fri, 30 Jun 2023 04:22:26 +0800
From: kernel test robot <lkp@intel.com>
To: Bob Peterson <rpeterso@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	cluster-devel@redhat.com
Subject: [gfs2:bobquota 24/29] fs/gfs2/quota.c:879:12: warning: stack frame
 size (2264) exceeds limit (1024) in 'do_sync'
Message-ID: <202306300453.38BmME05-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git bobquota
head:   670b010e49bb40adcf05c9158f0268f36cd03a97
commit: 47c1e6b4deaebd090dd8143710d159e948b52122 [24/29] gfs2: Only allocate blocks necessary in do_sync
config: arm-randconfig-r004-20230629 (https://download.01.org/0day-ci/archive/20230630/202306300453.38BmME05-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306300453.38BmME05-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306300453.38BmME05-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/gfs2/quota.c:879:12: warning: stack frame size (2264) exceeds limit (1024) in 'do_sync' [-Wframe-larger-than]
     879 | static int do_sync(unsigned int num_qd, struct gfs2_quota_data **qda)
         |            ^
   1 warning generated.


vim +/do_sync +879 fs/gfs2/quota.c

18ec7d5c3f434a Steven Whitehouse 2006-02-08   878  
b3b94faa5fe596 David Teigland    2006-01-16  @879  static int do_sync(unsigned int num_qd, struct gfs2_quota_data **qda)
b3b94faa5fe596 David Teigland    2006-01-16   880  {
22e0429e4d1715 Bob Peterson      2023-06-16   881  	struct gfs2_sbd *sdp = (*qda)->qd_sbd;
feaa7bba026c18 Steven Whitehouse 2006-06-14   882  	struct gfs2_inode *ip = GFS2_I(sdp->sd_quota_inode);
7b9cff467144c8 Steven Whitehouse 2013-10-02   883  	struct gfs2_alloc_parms ap = { .aflags = 0, };
b3b94faa5fe596 David Teigland    2006-01-16   884  	unsigned int data_blocks, ind_blocks;
b3b94faa5fe596 David Teigland    2006-01-16   885  	struct gfs2_holder *ghs, i_gh;
b3b94faa5fe596 David Teigland    2006-01-16   886  	unsigned int qx, x;
b3b94faa5fe596 David Teigland    2006-01-16   887  	struct gfs2_quota_data *qd;
71f890f7f758f3 Steven Whitehouse 2012-07-30   888  	unsigned reserved;
f42faf4fa4eaf7 Steven Whitehouse 2006-01-30   889  	loff_t offset;
47c1e6b4deaebd Bob Peterson      2023-06-23   890  	unsigned int nalloc = 0, blocks, b4 = 0;
47c1e6b4deaebd Bob Peterson      2023-06-23   891  	u64 qblk[MAX_QD] = {0, }, qlen[MAX_QD] = {0, };
b3b94faa5fe596 David Teigland    2006-01-16   892  	int error;
b3b94faa5fe596 David Teigland    2006-01-16   893  
b3b94faa5fe596 David Teigland    2006-01-16   894  	gfs2_write_calc_reserv(ip, sizeof(struct gfs2_quota),
b3b94faa5fe596 David Teigland    2006-01-16   895  			      &data_blocks, &ind_blocks);
b3b94faa5fe596 David Teigland    2006-01-16   896  
6da2ec56059c3c Kees Cook         2018-06-12   897  	ghs = kmalloc_array(num_qd, sizeof(struct gfs2_holder), GFP_NOFS);
2fba46a04c383f Bob Peterson      2020-02-27   898  	if (!ghs) {
2fba46a04c383f Bob Peterson      2020-02-27   899  		error = -ENOMEM;
c972972e772a77 Bob Peterson      2023-06-22   900  		goto out_qa_put;
2fba46a04c383f Bob Peterson      2020-02-27   901  	}
b3b94faa5fe596 David Teigland    2006-01-16   902  
b3b94faa5fe596 David Teigland    2006-01-16   903  	sort(qda, num_qd, sizeof(struct gfs2_quota_data *), sort_qd, NULL);
5955102c9984fa Al Viro           2016-01-22   904  	inode_lock(&ip->i_inode);
b3b94faa5fe596 David Teigland    2006-01-16   905  	for (qx = 0; qx < num_qd; qx++) {
1e72c0f7c40e66 Steven Whitehouse 2009-09-15   906  		error = gfs2_glock_nq_init(qda[qx]->qd_gl, LM_ST_EXCLUSIVE,
b3b94faa5fe596 David Teigland    2006-01-16   907  					   GL_NOCACHE, &ghs[qx]);
b3b94faa5fe596 David Teigland    2006-01-16   908  		if (error)
2fba46a04c383f Bob Peterson      2020-02-27   909  			goto out_dq;
b3b94faa5fe596 David Teigland    2006-01-16   910  	}
b3b94faa5fe596 David Teigland    2006-01-16   911  
b3b94faa5fe596 David Teigland    2006-01-16   912  	error = gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, 0, &i_gh);
b3b94faa5fe596 David Teigland    2006-01-16   913  	if (error)
2fba46a04c383f Bob Peterson      2020-02-27   914  		goto out_dq;
b3b94faa5fe596 David Teigland    2006-01-16   915  
b3b94faa5fe596 David Teigland    2006-01-16   916  	for (x = 0; x < num_qd; x++) {
47c1e6b4deaebd Bob Peterson      2023-06-23   917  		u64 l_blk1, l_blk2, l_len;
47c1e6b4deaebd Bob Peterson      2023-06-23   918  		int i;
47c1e6b4deaebd Bob Peterson      2023-06-23   919  
b3b94faa5fe596 David Teigland    2006-01-16   920  		offset = qd2offset(qda[x]);
47c1e6b4deaebd Bob Peterson      2023-06-23   921  		/*
47c1e6b4deaebd Bob Peterson      2023-06-23   922  		 * Check to see if we already need to allocate this block
47c1e6b4deaebd Bob Peterson      2023-06-23   923  		 */
47c1e6b4deaebd Bob Peterson      2023-06-23   924  		l_blk1 = offset >> ip->i_inode.i_blkbits;
47c1e6b4deaebd Bob Peterson      2023-06-23   925  		l_blk2 = (offset + sizeof(struct gfs2_quota)) >>
47c1e6b4deaebd Bob Peterson      2023-06-23   926  			 ip->i_inode.i_blkbits;
47c1e6b4deaebd Bob Peterson      2023-06-23   927  		l_len = (l_blk2 - l_blk1) + 1;
47c1e6b4deaebd Bob Peterson      2023-06-23   928  		/* Check all previous block/len combinations */
47c1e6b4deaebd Bob Peterson      2023-06-23   929  		for (i = 0; i < nalloc; i++)
47c1e6b4deaebd Bob Peterson      2023-06-23   930  			if (l_blk1 == qblk[i] && l_len <= qlen[i])
47c1e6b4deaebd Bob Peterson      2023-06-23   931  				break;
47c1e6b4deaebd Bob Peterson      2023-06-23   932  		/* If we stopped short we found a match: we're already planning
47c1e6b4deaebd Bob Peterson      2023-06-23   933  		 * to allocate the required block. */
47c1e6b4deaebd Bob Peterson      2023-06-23   934  		if (i < nalloc) {
47c1e6b4deaebd Bob Peterson      2023-06-23   935  			/* debug, remove this: */
461cb419f074aa Bob Peterson      2010-06-24   936  			if (gfs2_write_alloc_required(ip, offset,
461cb419f074aa Bob Peterson      2010-06-24   937  					sizeof(struct gfs2_quota)))
47c1e6b4deaebd Bob Peterson      2023-06-23   938  				b4++;
47c1e6b4deaebd Bob Peterson      2023-06-23   939  			continue;
47c1e6b4deaebd Bob Peterson      2023-06-23   940  		}
47c1e6b4deaebd Bob Peterson      2023-06-23   941  		if (gfs2_write_alloc_required(ip, offset,
47c1e6b4deaebd Bob Peterson      2023-06-23   942  					      sizeof(struct gfs2_quota))) {
47c1e6b4deaebd Bob Peterson      2023-06-23   943  			qblk[nalloc] = l_blk1;
47c1e6b4deaebd Bob Peterson      2023-06-23   944  			qlen[nalloc] = l_len;
b3b94faa5fe596 David Teigland    2006-01-16   945  			nalloc++;
b3b94faa5fe596 David Teigland    2006-01-16   946  		}
47c1e6b4deaebd Bob Peterson      2023-06-23   947  	}
47c1e6b4deaebd Bob Peterson      2023-06-23   948  	if (nalloc || b4)
47c1e6b4deaebd Bob Peterson      2023-06-23   949  		fs_err(sdp, "nalloc: %u, before: %u\n", nalloc, b4);
b3b94faa5fe596 David Teigland    2006-01-16   950  
20b95bf2c4c5c2 Abhijith Das      2008-03-06   951  	/* 
20b95bf2c4c5c2 Abhijith Das      2008-03-06   952  	 * 1 blk for unstuffing inode if stuffed. We add this extra
20b95bf2c4c5c2 Abhijith Das      2008-03-06   953  	 * block to the reservation unconditionally. If the inode
20b95bf2c4c5c2 Abhijith Das      2008-03-06   954  	 * doesn't need unstuffing, the block will be released to the 
20b95bf2c4c5c2 Abhijith Das      2008-03-06   955  	 * rgrp since it won't be allocated during the transaction
20b95bf2c4c5c2 Abhijith Das      2008-03-06   956  	 */
7e619bc3e6252d Abhijith Das      2010-05-07   957  	/* +3 in the end for unstuffing block, inode size update block
7e619bc3e6252d Abhijith Das      2010-05-07   958  	 * and another block in case quota straddles page boundary and 
7e619bc3e6252d Abhijith Das      2010-05-07   959  	 * two blocks need to be updated instead of 1 */
7e619bc3e6252d Abhijith Das      2010-05-07   960  	blocks = num_qd * data_blocks + RES_DINODE + num_qd + 3;
b3b94faa5fe596 David Teigland    2006-01-16   961  
71f890f7f758f3 Steven Whitehouse 2012-07-30   962  	reserved = 1 + (nalloc * (data_blocks + ind_blocks));
7b9cff467144c8 Steven Whitehouse 2013-10-02   963  	ap.target = reserved;
7b9cff467144c8 Steven Whitehouse 2013-10-02   964  	error = gfs2_inplace_reserve(ip, &ap);
b3b94faa5fe596 David Teigland    2006-01-16   965  	if (error)
b3b94faa5fe596 David Teigland    2006-01-16   966  		goto out_alloc;
b3b94faa5fe596 David Teigland    2006-01-16   967  
20b95bf2c4c5c2 Abhijith Das      2008-03-06   968  	if (nalloc)
71f890f7f758f3 Steven Whitehouse 2012-07-30   969  		blocks += gfs2_rg_blocks(ip, reserved) + nalloc * ind_blocks + RES_STATFS;
20b95bf2c4c5c2 Abhijith Das      2008-03-06   970  
20b95bf2c4c5c2 Abhijith Das      2008-03-06   971  	error = gfs2_trans_begin(sdp, blocks, 0);
b3b94faa5fe596 David Teigland    2006-01-16   972  	if (error)
b3b94faa5fe596 David Teigland    2006-01-16   973  		goto out_ipres;
b3b94faa5fe596 David Teigland    2006-01-16   974  
b3b94faa5fe596 David Teigland    2006-01-16   975  	for (x = 0; x < num_qd; x++) {
b3b94faa5fe596 David Teigland    2006-01-16   976  		qd = qda[x];
b3b94faa5fe596 David Teigland    2006-01-16   977  		offset = qd2offset(qd);
7be3bcce6e2e7c Bob Peterson      2023-05-31   978  		error = gfs2_adjust_quota(sdp, offset, qd->qd_change_sync, qd,
7be3bcce6e2e7c Bob Peterson      2023-05-31   979  							NULL);
18ec7d5c3f434a Steven Whitehouse 2006-02-08   980  		if (error)
b3b94faa5fe596 David Teigland    2006-01-16   981  			goto out_end_trans;
b3b94faa5fe596 David Teigland    2006-01-16   982  
e1654954525e23 Bob Peterson      2023-06-28   983  		do_qc(qd, -qd->qd_change_sync, QC_SYNC);
662e3a551b468c Abhijith Das      2011-03-08   984  		set_bit(QDF_REFRESH, &qd->qd_flags);
b3b94faa5fe596 David Teigland    2006-01-16   985  	}
b3b94faa5fe596 David Teigland    2006-01-16   986  
b3b94faa5fe596 David Teigland    2006-01-16   987  	error = 0;
b3b94faa5fe596 David Teigland    2006-01-16   988  
b3b94faa5fe596 David Teigland    2006-01-16   989  out_end_trans:
b3b94faa5fe596 David Teigland    2006-01-16   990  	gfs2_trans_end(sdp);
b3b94faa5fe596 David Teigland    2006-01-16   991  out_ipres:
b3b94faa5fe596 David Teigland    2006-01-16   992  	gfs2_inplace_release(ip);
b3b94faa5fe596 David Teigland    2006-01-16   993  out_alloc:
b3b94faa5fe596 David Teigland    2006-01-16   994  	gfs2_glock_dq_uninit(&i_gh);
2fba46a04c383f Bob Peterson      2020-02-27   995  out_dq:
b3b94faa5fe596 David Teigland    2006-01-16   996  	while (qx--)
b3b94faa5fe596 David Teigland    2006-01-16   997  		gfs2_glock_dq_uninit(&ghs[qx]);
5955102c9984fa Al Viro           2016-01-22   998  	inode_unlock(&ip->i_inode);
b3b94faa5fe596 David Teigland    2006-01-16   999  	kfree(ghs);
c1696fb85d3319 Bob Peterson      2018-01-17  1000  	gfs2_log_flush(ip->i_gl->gl_name.ln_sbd, ip->i_gl,
805c090750a315 Bob Peterson      2018-01-08  1001  		       GFS2_LOG_HEAD_FLUSH_NORMAL | GFS2_LFC_DO_SYNC);
c972972e772a77 Bob Peterson      2023-06-22  1002  out_qa_put:
c972972e772a77 Bob Peterson      2023-06-22  1003  	for (x = 0; x < num_qd; x++) {
6fd568bc1f3432 Bob Peterson      2023-06-23  1004  		qd = qda[x];
c972972e772a77 Bob Peterson      2023-06-22  1005  		if (!error)
6fd568bc1f3432 Bob Peterson      2023-06-23  1006  			qd->qd_sync_gen = sdp->sd_quota_sync_gen;
6fd568bc1f3432 Bob Peterson      2023-06-23  1007  		gfs2_assert_warn(qd->qd_sbd,
6fd568bc1f3432 Bob Peterson      2023-06-23  1008  				 test_bit(QDF_LOCKED, &qd->qd_flags));
6fd568bc1f3432 Bob Peterson      2023-06-23  1009  		clear_bit(QDF_LOCKED, &qd->qd_flags);
6fd568bc1f3432 Bob Peterson      2023-06-23  1010  		qdsb_put(qd);
c972972e772a77 Bob Peterson      2023-06-22  1011  	}
b3b94faa5fe596 David Teigland    2006-01-16  1012  	return error;
b3b94faa5fe596 David Teigland    2006-01-16  1013  }
b3b94faa5fe596 David Teigland    2006-01-16  1014  

:::::: The code at line 879 was first introduced by commit
:::::: b3b94faa5fe5968827ba0640ee9fba4b3e7f736e [GFS2] The core of GFS2

:::::: TO: David Teigland <teigland@redhat.com>
:::::: CC: Steven Whitehouse <swhiteho@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
