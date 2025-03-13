Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916E5250EC;
	Thu, 13 Mar 2025 01:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741830911; cv=none; b=WrRKvQYk6EYUmF+8u04Lc2gsNEH9/d77Vg/rvXblaV0zfAIENNsVeo0LAGlJ0KWKvAAxEkMu8LXA5wug3ze3P7gc7XTxVuCCkurx6/idlXCTK0y70lJvrMs8KuXCE4vhs0Xh3L/RsoEtrP7KZ/bDuXKoigDej6mBc7nqFAwXQJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741830911; c=relaxed/simple;
	bh=sdEWzgKY/ltuErd1lnafMDHBFQHAx3xhMJX33RelzQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U7GcIbaglbSvVPaIonYldthS2ttjkY86BEBct+2anX0Plrqiemiy13gVupHJKPjQvTxDAzHnWXkCyo4IRkSiFiNeDlsIYyUlSeU/gTnh/uUUm06aESgUNGf6dfZkKtGUYYWUzJ8zd0+l0jZgNTHS+WllK8bQQeGz5n/wWVJ6S2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YJxekCqu; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YJxekCqu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741830909; x=1773366909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sdEWzgKY/ltuErd1lnafMDHBFQHAx3xhMJX33RelzQM=;
  b=YJxekCquSYhx2MMSqabwWZvPCuNmPwgatRIyR/COeBnnM/cMg1rXMJmE
   zjCOf7VOs2+l4sbh8P4HIu34g1UDHFFAH6hoFfDYHtdz5mvitELLsiNBi
   vfT0YqdEH2jmdQm4X+mYgkTLxtMiN8hnKDkoJ4kZb39OY6XxtWN3lNNDC
   Z2RYizEj3BFHn8rvtoK1fEteKKwsGN0Lpw6HvN3rg/9VaMwHr9VUDELG4
   10fzRIuRJz4s/dvNqhQJ6lHi60Al5vq1x6l0IpdDs4zUZ41CIhIzYf9At
   ryA1gWsWxtwo4ne5y5CgXqrDJeJLgmqwcWxxK7+VdRRLvWJOQXByadqWI
   Q==;
X-CSE-ConnectionGUID: pj5Rd7DkSjui+az876qE7g==
X-CSE-MsgGUID: Z/9LGCO+RZmUH4Z3tjoMXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42963553"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="42963553"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 18:55:09 -0700
X-CSE-ConnectionGUID: VYQNlhuuRCurMiYaEsbQFw==
X-CSE-MsgGUID: RpuLrPsYSL66Bp1KdXd/Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="121300536"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 12 Mar 2025 18:55:08 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsXmi-00092q-10;
	Thu, 13 Mar 2025 01:54:59 +0000
Date: Thu, 13 Mar 2025 09:53:44 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 45/45] net/ceph/messenger_v2.c:3246:29:
 error: no member named 'out_enc_pages' in 'struct ceph_connection_v2_info';
 did you mean 'in_enc_pages'?
Message-ID: <202503130907.JF4OHYQM-lkp@intel.com>
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
config: i386-buildonly-randconfig-003-20250313 (https://download.01.org/0day-ci/archive/20250313/202503130907.JF4OHYQM-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503130907.JF4OHYQM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503130907.JF4OHYQM-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/ceph/messenger_v2.c:1718:29: warning: variable 'enc_page_cnt' is uninitialized when used here [-Wuninitialized]
    1718 |         con->v2.out_enc_page_cnt = enc_page_cnt;
         |                                    ^~~~~~~~~~~~
   net/ceph/messenger_v2.c:1672:18: note: initialize the variable 'enc_page_cnt' to silence this warning
    1672 |         int enc_page_cnt;
         |                         ^
         |                          = 0
>> net/ceph/messenger_v2.c:3246:29: error: no member named 'out_enc_pages' in 'struct ceph_connection_v2_info'; did you mean 'in_enc_pages'?
    3246 |         bvec_set_page(&bv, con->v2.out_enc_pages[con->v2.out_enc_i],
         |                                    ^~~~~~~~~~~~~
         |                                    in_enc_pages
   include/linux/ceph/messenger.h:305:16: note: 'in_enc_pages' declared here
     305 |         struct page **in_enc_pages;
         |                       ^
>> net/ceph/messenger_v2.c:3254:32: error: use of undeclared identifier 'OUT_S_QUEUE_ENC_PAGE'
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
