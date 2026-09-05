Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E3636195E;
	Sat,  5 Sep 2026 04:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788583435; cv=none; b=dtWio+FNoiqCe7ilEY6MTmmg0iA7nW5Ri3tIesDv6/YLAWbuz39bDo8n9DCyurQM0xgpqbLYyvtNplxrr0t+18TFFnO+qfvMRB/ovnOfAG5O0t2Yhd34dbeugk6ip+RT/M9BsUu+vX9dUuNPSEBmIomH6FA5jku2ZS8IMmvBUVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788583435; c=relaxed/simple;
	bh=rmCyqMKJ879cFYs/h+M4B17LJGufh30sJW5cs3g/VPU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CUyGnRGLj28f6VLXclLTc4/OwbAG5Z4z3lyxFTlyXF4otPLKi3fVLxdPaaRcNpw7tcqalbe0E6Pg7zfHUMadu/s2Va/QXvpQG77lCcG1etdOftjpDtXY7wS8gXRXxDjvBhPbLoJBCY+xt5595wze/VRZ+iGg6Z0DXgCur3iCVWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KMNDwQrQ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KMNDwQrQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788583434; x=1820119434;
  h=date:from:to:cc:subject:message-id;
  bh=rmCyqMKJ879cFYs/h+M4B17LJGufh30sJW5cs3g/VPU=;
  b=KMNDwQrQ8WD7w7RQ3z1TU+6FTyQMIq7uYncJrtU9xC16FmwqqVjocTMk
   sUMzuVUILMlXHIstC8+eQ4CGgJE7j8IRUDFQpgFmk/ELQ7YLvdGCE82BD
   2IXjxOYqHnMTIVjPcRVdTDTk+BrOiMQDSDQLivJl6++yqCFQJXuofEvTP
   E8hB+5hogqEmglO/kGxEc0SCkbc94CmSNa3EiSLDu4H3y+hMmj5+uFc3N
   jjHdAnaJqTtqxPoBXE6Wrxig4zAnBo6tSM0w+8I0YTQCZJPBWef1eG6Gc
   ASd128H4J/EG1drYGLDqZDN2Ejl7UmIwQ6JE7gepBjI1l2fC/4Z1iTdb/
   Q==;
X-CSE-ConnectionGUID: tEGlyW02QWS6LVSOHFE4Lw==
X-CSE-MsgGUID: fAWnn3LyTM+PXmrlg6Npxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="88928904"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="88928904"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 21:43:53 -0700
X-CSE-ConnectionGUID: sser5l21TsyyyLqJkD4nFw==
X-CSE-MsgGUID: mFMFXa/rQ9CaFEReqxtF5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="268903893"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Sep 2026 21:43:51 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2iFo-0000000001v-3ZiL;
	Sat, 05 Sep 2026 04:43:48 +0000
Date: Sat, 05 Sep 2026 12:43:25 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 87/87]
 net/ceph/messenger_v2.c:3224:29: error: no member named 'out_enc_pages' in
 'struct ceph_connection_v2_info'
Message-ID: <202609051259.dQVMG4oz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   376ad9d4942bf11500931178bbeb965348f01057
commit: 376ad9d4942bf11500931178bbeb965348f01057 [87/87] ceph: Don't use data_pages
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260905/202609051259.dQVMG4oz-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 0edd1b088cc36b4faee80358c925a91e16006258)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609051259.dQVMG4oz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609051259.dQVMG4oz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/ceph/messenger_v2.c:3224:29: error: no member named 'out_enc_pages' in 'struct ceph_connection_v2_info'
    3224 |         bvec_set_page(&bv, con->v2.out_enc_pages[con->v2.out_enc_i],
         |                            ~~~~~~~ ^
>> net/ceph/messenger_v2.c:3232:32: error: use of undeclared identifier 'OUT_S_QUEUE_ENC_PAGE'
    3232 |                 WARN_ON(con->v2.out_state != OUT_S_QUEUE_ENC_PAGE);
         |                                              ^~~~~~~~~~~~~~~~~~~~
   net/ceph/messenger_v2.c:3270:14: error: no member named 'out_enc_pages' in 'struct ceph_connection_v2_info'
    3270 |         if (con->v2.out_enc_pages) {
         |             ~~~~~~~ ^
   net/ceph/messenger_v2.c:3272:36: error: no member named 'out_enc_pages' in 'struct ceph_connection_v2_info'
    3272 |                 ceph_release_page_vector(con->v2.out_enc_pages,
         |                                          ~~~~~~~ ^
   net/ceph/messenger_v2.c:3274:11: error: no member named 'out_enc_pages' in 'struct ceph_connection_v2_info'
    3274 |                 con->v2.out_enc_pages = NULL;
         |                 ~~~~~~~ ^
   net/ceph/messenger_v2.c:3310:7: error: use of undeclared identifier 'OUT_S_QUEUE_ENC_PAGE'
    3310 |         case OUT_S_QUEUE_ENC_PAGE:
         |              ^~~~~~~~~~~~~~~~~~~~
   net/ceph/messenger_v2.c:3634:32: error: use of undeclared identifier 'OUT_S_QUEUE_ENC_PAGE'
    3634 |                 WARN_ON(con->v2.out_state != OUT_S_QUEUE_ENC_PAGE &&
         |                                              ^~~~~~~~~~~~~~~~~~~~
   net/ceph/messenger_v2.c:3802:14: error: no member named 'out_enc_pages' in 'struct ceph_connection_v2_info'
    3802 |         if (con->v2.out_enc_pages) {
         |             ~~~~~~~ ^
   net/ceph/messenger_v2.c:3804:36: error: no member named 'out_enc_pages' in 'struct ceph_connection_v2_info'
    3804 |                 ceph_release_page_vector(con->v2.out_enc_pages,
         |                                          ~~~~~~~ ^
   net/ceph/messenger_v2.c:3806:11: error: no member named 'out_enc_pages' in 'struct ceph_connection_v2_info'
    3806 |                 con->v2.out_enc_pages = NULL;
         |                 ~~~~~~~ ^
   10 errors generated.


vim +3224 net/ceph/messenger_v2.c

cd1a677cad9940 Ilya Dryomov      2020-11-19  3215  
cd1a677cad9940 Ilya Dryomov      2020-11-19  3216  static void queue_enc_page(struct ceph_connection *con)
cd1a677cad9940 Ilya Dryomov      2020-11-19  3217  {
cd1a677cad9940 Ilya Dryomov      2020-11-19  3218  	struct bio_vec bv;
cd1a677cad9940 Ilya Dryomov      2020-11-19  3219  
cd1a677cad9940 Ilya Dryomov      2020-11-19  3220  	dout("%s con %p i %d resid %d\n", __func__, con, con->v2.out_enc_i,
cd1a677cad9940 Ilya Dryomov      2020-11-19  3221  	     con->v2.out_enc_resid);
cd1a677cad9940 Ilya Dryomov      2020-11-19  3222  	WARN_ON(!con->v2.out_enc_resid);
cd1a677cad9940 Ilya Dryomov      2020-11-19  3223  
1eb9cd15004fa9 Christoph Hellwig 2023-02-03 @3224  	bvec_set_page(&bv, con->v2.out_enc_pages[con->v2.out_enc_i],
1eb9cd15004fa9 Christoph Hellwig 2023-02-03  3225  		      min(con->v2.out_enc_resid, (int)PAGE_SIZE), 0);
cd1a677cad9940 Ilya Dryomov      2020-11-19  3226  
cd1a677cad9940 Ilya Dryomov      2020-11-19  3227  	set_out_bvec(con, &bv, false);
cd1a677cad9940 Ilya Dryomov      2020-11-19  3228  	con->v2.out_enc_i++;
cd1a677cad9940 Ilya Dryomov      2020-11-19  3229  	con->v2.out_enc_resid -= bv.bv_len;
cd1a677cad9940 Ilya Dryomov      2020-11-19  3230  
cd1a677cad9940 Ilya Dryomov      2020-11-19  3231  	if (con->v2.out_enc_resid) {
cd1a677cad9940 Ilya Dryomov      2020-11-19 @3232  		WARN_ON(con->v2.out_state != OUT_S_QUEUE_ENC_PAGE);
cd1a677cad9940 Ilya Dryomov      2020-11-19  3233  		return;
cd1a677cad9940 Ilya Dryomov      2020-11-19  3234  	}
cd1a677cad9940 Ilya Dryomov      2020-11-19  3235  
cd1a677cad9940 Ilya Dryomov      2020-11-19  3236  	/*
cd1a677cad9940 Ilya Dryomov      2020-11-19  3237  	 * We've queued the last piece of ciphertext (ending with
cd1a677cad9940 Ilya Dryomov      2020-11-19  3238  	 * epilogue) + auth tag.  Once it's written, we are done.
cd1a677cad9940 Ilya Dryomov      2020-11-19  3239  	 */
cd1a677cad9940 Ilya Dryomov      2020-11-19  3240  	WARN_ON(con->v2.out_enc_i != con->v2.out_enc_page_cnt);
cd1a677cad9940 Ilya Dryomov      2020-11-19  3241  	con->v2.out_state = OUT_S_FINISH_MESSAGE;
cd1a677cad9940 Ilya Dryomov      2020-11-19  3242  }
cd1a677cad9940 Ilya Dryomov      2020-11-19  3243  

:::::: The code at line 3224 was first introduced by commit
:::::: 1eb9cd15004fa91b6d1911af9fbaff299d8e9e45 libceph: use bvec_set_page to initialize bvecs

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Jens Axboe <axboe@kernel.dk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
