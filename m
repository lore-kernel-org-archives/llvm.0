Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BC81F152E;
	Wed, 12 Mar 2025 23:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741822521; cv=none; b=tqIAWS3JS4M3f7ouO6MFm70GXnBkBBDEzqg5xgLcSoi165gLAYVJRM3nxpYD49lDvtURaejHcu1sTihI6L16xam1Z1rRsFR4M1HaWKc4x/WMr7D/dBkNcjABmxcHQL0OOCjzbP+qy60NeQnTuSG4gixkzPPI6RaIYV+jQGQWHPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741822521; c=relaxed/simple;
	bh=YYLNloYAyCecMVrB9L/DBflHRJbx9nzjDI1jsnGVp7w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VRvNbcCFmYAiBLfYK/E1qC+vPEP9+fBS/bLiH4GiJNEUbLnekVtJw7+qTG7oO3e0Ee4CYU57EIPMV0eSBydSvdCc7JDSgmWat/VuHv+ASfsDrQW9IIr1F+UqkyB60hogTsfir5pniinrJ8FQlmVxvwCJPTm6VCn9tX0i6Z3p9h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JfSJ0wb5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JfSJ0wb5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741822520; x=1773358520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YYLNloYAyCecMVrB9L/DBflHRJbx9nzjDI1jsnGVp7w=;
  b=JfSJ0wb5ds4vuaBUimbFdezY4e2Dkk5Ly2attP0EOw+0jcRZIQ37XKU6
   YEJfKW2zHJ3SNyWlCJmc0MkKmNtHS3tyoqRd9ZBGWvBtjqp3WiMPFhr1F
   z/Qa9ZdpOSLsaGMzBnxVAm3nVIlQAx7OBaCA70sY+lTFnE9mtmXfc9Pj7
   39t453rGO44MGzPwBQO3n1hzdI+eL0Mnz8QCN+1uTrPbph4sFJO/P/45Z
   A8jfJN/LVOIuGtMlb8U2eZgkb8RtAzKBD7lBvvtA/atFNmfum3uEyqFCC
   HtB5ZPCKdZUMjHRlVEhFYtxZmyiT2ddciKf213vY8JoTup5cLKkpgXcSB
   Q==;
X-CSE-ConnectionGUID: wQa7l50kR8C1Nq191pcgBg==
X-CSE-MsgGUID: GFBb0JZQQc+HzX5rovX3QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42092017"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="42092017"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 16:35:19 -0700
X-CSE-ConnectionGUID: +sDmKPOtRMGZMGRVQWrYyQ==
X-CSE-MsgGUID: MwP96Cm4Sq6n+GR61F+e/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="125404562"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 12 Mar 2025 16:35:18 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsVbU-0008yd-2S;
	Wed, 12 Mar 2025 23:35:13 +0000
Date: Thu, 13 Mar 2025 07:34:48 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 45/45] net/ceph/messenger_v2.c:3246:36:
 error: 'struct ceph_connection_v2_info' has no member named 'out_enc_pages';
 did you mean 'in_enc_pages'?
Message-ID: <202503130720.McQoB4iK-lkp@intel.com>
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
config: i386-buildonly-randconfig-001-20250313 (https://download.01.org/0day-ci/archive/20250313/202503130720.McQoB4iK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503130720.McQoB4iK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503130720.McQoB4iK-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/ceph/messenger_v2.c: In function 'queue_enc_page':
>> net/ceph/messenger_v2.c:3246:36: error: 'struct ceph_connection_v2_info' has no member named 'out_enc_pages'; did you mean 'in_enc_pages'?
    3246 |         bvec_set_page(&bv, con->v2.out_enc_pages[con->v2.out_enc_i],
         |                                    ^~~~~~~~~~~~~
         |                                    in_enc_pages
   In file included from arch/x86/include/asm/bug.h:99,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:6,
                    from include/linux/string.h:392,
                    from include/linux/ceph/ceph_debug.h:7,
                    from net/ceph/messenger_v2.c:8:
>> net/ceph/messenger_v2.c:3254:46: error: 'OUT_S_QUEUE_ENC_PAGE' undeclared (first use in this function); did you mean 'OUT_S_QUEUE_ENC_FOLIOQ'?
    3254 |                 WARN_ON(con->v2.out_state != OUT_S_QUEUE_ENC_PAGE);
         |                                              ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:171:32: note: in definition of macro 'WARN_ON'
     171 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   net/ceph/messenger_v2.c:3254:46: note: each undeclared identifier is reported only once for each function it appears in
    3254 |                 WARN_ON(con->v2.out_state != OUT_S_QUEUE_ENC_PAGE);
         |                                              ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:171:32: note: in definition of macro 'WARN_ON'
     171 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   net/ceph/messenger_v2.c: In function 'finish_message':
   net/ceph/messenger_v2.c:3292:21: error: 'struct ceph_connection_v2_info' has no member named 'out_enc_pages'; did you mean 'in_enc_pages'?
    3292 |         if (con->v2.out_enc_pages) {
         |                     ^~~~~~~~~~~~~
         |                     in_enc_pages
   net/ceph/messenger_v2.c:3294:50: error: 'struct ceph_connection_v2_info' has no member named 'out_enc_pages'; did you mean 'in_enc_pages'?
    3294 |                 ceph_release_page_vector(con->v2.out_enc_pages,
         |                                                  ^~~~~~~~~~~~~
         |                                                  in_enc_pages
   net/ceph/messenger_v2.c:3296:25: error: 'struct ceph_connection_v2_info' has no member named 'out_enc_pages'; did you mean 'in_enc_pages'?
    3296 |                 con->v2.out_enc_pages = NULL;
         |                         ^~~~~~~~~~~~~
         |                         in_enc_pages
   net/ceph/messenger_v2.c: In function 'populate_out_iter':
   net/ceph/messenger_v2.c:3331:14: error: 'OUT_S_QUEUE_ENC_PAGE' undeclared (first use in this function); did you mean 'OUT_S_QUEUE_ENC_FOLIOQ'?
    3331 |         case OUT_S_QUEUE_ENC_PAGE:
         |              ^~~~~~~~~~~~~~~~~~~~
         |              OUT_S_QUEUE_ENC_FOLIOQ
   net/ceph/messenger_v2.c: In function 'ceph_con_v2_revoke':
   net/ceph/messenger_v2.c:3650:46: error: 'OUT_S_QUEUE_ENC_PAGE' undeclared (first use in this function); did you mean 'OUT_S_QUEUE_ENC_FOLIOQ'?
    3650 |                 WARN_ON(con->v2.out_state != OUT_S_QUEUE_ENC_PAGE &&
         |                                              ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:171:32: note: in definition of macro 'WARN_ON'
     171 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   net/ceph/messenger_v2.c: In function 'ceph_con_v2_reset_protocol':
   net/ceph/messenger_v2.c:3818:21: error: 'struct ceph_connection_v2_info' has no member named 'out_enc_pages'; did you mean 'in_enc_pages'?
    3818 |         if (con->v2.out_enc_pages) {
         |                     ^~~~~~~~~~~~~
         |                     in_enc_pages
   net/ceph/messenger_v2.c:3820:50: error: 'struct ceph_connection_v2_info' has no member named 'out_enc_pages'; did you mean 'in_enc_pages'?
    3820 |                 ceph_release_page_vector(con->v2.out_enc_pages,
         |                                                  ^~~~~~~~~~~~~
         |                                                  in_enc_pages
   net/ceph/messenger_v2.c:3822:25: error: 'struct ceph_connection_v2_info' has no member named 'out_enc_pages'; did you mean 'in_enc_pages'?
    3822 |                 con->v2.out_enc_pages = NULL;
         |                         ^~~~~~~~~~~~~
         |                         in_enc_pages


vim +3246 net/ceph/messenger_v2.c

cd1a677cad99402 Ilya Dryomov      2020-11-19  3237  
cd1a677cad99402 Ilya Dryomov      2020-11-19  3238  static void queue_enc_page(struct ceph_connection *con)
cd1a677cad99402 Ilya Dryomov      2020-11-19  3239  {
cd1a677cad99402 Ilya Dryomov      2020-11-19  3240  	struct bio_vec bv;
cd1a677cad99402 Ilya Dryomov      2020-11-19  3241  
cd1a677cad99402 Ilya Dryomov      2020-11-19  3242  	dout("%s con %p i %d resid %d\n", __func__, con, con->v2.out_enc_i,
cd1a677cad99402 Ilya Dryomov      2020-11-19  3243  	     con->v2.out_enc_resid);
cd1a677cad99402 Ilya Dryomov      2020-11-19  3244  	WARN_ON(!con->v2.out_enc_resid);
cd1a677cad99402 Ilya Dryomov      2020-11-19  3245  
1eb9cd15004fa91 Christoph Hellwig 2023-02-03 @3246  	bvec_set_page(&bv, con->v2.out_enc_pages[con->v2.out_enc_i],
1eb9cd15004fa91 Christoph Hellwig 2023-02-03  3247  		      min(con->v2.out_enc_resid, (int)PAGE_SIZE), 0);
cd1a677cad99402 Ilya Dryomov      2020-11-19  3248  
cd1a677cad99402 Ilya Dryomov      2020-11-19  3249  	set_out_bvec(con, &bv, false);
cd1a677cad99402 Ilya Dryomov      2020-11-19  3250  	con->v2.out_enc_i++;
cd1a677cad99402 Ilya Dryomov      2020-11-19  3251  	con->v2.out_enc_resid -= bv.bv_len;
cd1a677cad99402 Ilya Dryomov      2020-11-19  3252  
cd1a677cad99402 Ilya Dryomov      2020-11-19  3253  	if (con->v2.out_enc_resid) {
cd1a677cad99402 Ilya Dryomov      2020-11-19 @3254  		WARN_ON(con->v2.out_state != OUT_S_QUEUE_ENC_PAGE);
cd1a677cad99402 Ilya Dryomov      2020-11-19  3255  		return;
cd1a677cad99402 Ilya Dryomov      2020-11-19  3256  	}
cd1a677cad99402 Ilya Dryomov      2020-11-19  3257  
cd1a677cad99402 Ilya Dryomov      2020-11-19  3258  	/*
cd1a677cad99402 Ilya Dryomov      2020-11-19  3259  	 * We've queued the last piece of ciphertext (ending with
cd1a677cad99402 Ilya Dryomov      2020-11-19  3260  	 * epilogue) + auth tag.  Once it's written, we are done.
cd1a677cad99402 Ilya Dryomov      2020-11-19  3261  	 */
cd1a677cad99402 Ilya Dryomov      2020-11-19  3262  	WARN_ON(con->v2.out_enc_i != con->v2.out_enc_page_cnt);
cd1a677cad99402 Ilya Dryomov      2020-11-19  3263  	con->v2.out_state = OUT_S_FINISH_MESSAGE;
cd1a677cad99402 Ilya Dryomov      2020-11-19  3264  }
cd1a677cad99402 Ilya Dryomov      2020-11-19  3265  

:::::: The code at line 3246 was first introduced by commit
:::::: 1eb9cd15004fa91b6d1911af9fbaff299d8e9e45 libceph: use bvec_set_page to initialize bvecs

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
