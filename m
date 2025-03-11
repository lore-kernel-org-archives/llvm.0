Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391D822FF21;
	Tue, 11 Mar 2025 23:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741736846; cv=none; b=tQV49Dt3yDDiAiuadmSmgRgrkEm0k5g6NesjVr68fce3KD4xYGw+oMyRrbgVbp/6G5tp9nsz+r2DhAN+RMomLwBVJ70+Fp25Udx2+Y9XZ9XuwKbcsQ7RUms65OTrI+mmz1KDfJkllh+0Wmt0oVi/8r7AJrTJCJnn8/9KPYPI/Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741736846; c=relaxed/simple;
	bh=/lEdIXbI/VJtmkUzwdF68fmABwXOBzciQgEQa6XAc4M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fvnkzHVObMjDESGsBdtgIdT7LsWy5ClVz/BdHVrVbSufpnKrS5IWG95fHSEeVimD5PWRExPugHysIBfhxWLonAvqOOadPqbTKd+dOARXJeuxhqnsfwa0ofSW5rulPqJkS8ujU/GtubXZL5e0tigq1KOGvSA0ybYZjEvXsakGdlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bEiEh0ID; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bEiEh0ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741736844; x=1773272844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/lEdIXbI/VJtmkUzwdF68fmABwXOBzciQgEQa6XAc4M=;
  b=bEiEh0IDveoyzrUFQa2TxRCVW9ZM0tw0Oq84jDH1HRyrVq0JVj21en/L
   UypI/zqKc4pdXzNkxwgy1xP6vG3jZf7fk1ivlTvR+TxkRr4uV1dsVfCoj
   C6drMReNaKYX2KD3a2ReUeLTAUBuSLsd4wg5fsdxRgttJduzIszd9yGY0
   OOgma67qEAVp9+3P6xM14jwEdih9roLf0ztpO0n17embCH9Di359kdazQ
   ozQhI2pI+g+ehE7wjPYKq9l6r/JClFoHlNo6vDXST6TVFvEnkkC7GbxzL
   +ZpmO/rCJYeeVN2u21vjRhVLIgioV5a053v5gJ0ARMsOCSvpD6ga5EG2+
   g==;
X-CSE-ConnectionGUID: G0ItK5UxRx2R943Bo/b9MA==
X-CSE-MsgGUID: Pl9FuI2LRH+qZQlLLSTLsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="54170936"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="54170936"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 16:47:21 -0700
X-CSE-ConnectionGUID: P1dTs0MyQhWF3zPHswrf+g==
X-CSE-MsgGUID: RnmQ39ZvSeWBq0NcoaySIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="124633697"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 11 Mar 2025 16:47:14 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ts9JV-0007xA-14;
	Tue, 11 Mar 2025 23:47:09 +0000
Date: Wed, 12 Mar 2025 07:46:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:nfsd-tracepoints 14/14] fs/nfsd/nfsproc.c:57:2: error: call
 to undeclared function 'trace_nfsd_proc_getattr'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202503120709.9Bvf9RNI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git nfsd-tracepoints
head:   406b15fe7fc917eb20c0cfe48d441442adad9918
commit: 406b15fe7fc917eb20c0cfe48d441442adad9918 [14/14] nfsd: add tracepoint for GETATTR events
config: arm-randconfig-003-20250312 (https://download.01.org/0day-ci/archive/20250312/202503120709.9Bvf9RNI-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503120709.9Bvf9RNI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503120709.9Bvf9RNI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nfsd/nfsproc.c:57:2: error: call to undeclared function 'trace_nfsd_proc_getattr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      57 |         trace_nfsd_proc_getattr(rqstp, &argp->fh);
         |         ^
   fs/nfsd/nfsproc.c:57:2: note: did you mean 'nfsd_proc_getattr'?
   fs/nfsd/nfsproc.c:52:1: note: 'nfsd_proc_getattr' declared here
      52 | nfsd_proc_getattr(struct svc_rqst *rqstp)
         | ^
      53 | {
      54 |         struct nfsd_fhandle *argp = rqstp->rq_argp;
      55 |         struct nfsd_attrstat *resp = rqstp->rq_resp;
      56 | 
      57 |         trace_nfsd_proc_getattr(rqstp, &argp->fh);
         |         ~~~~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_getattr
   fs/nfsd/nfsproc.c:295:2: error: call to undeclared function 'trace_nfsd_proc_create'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     295 |         trace_nfsd_proc_create(rqstp, dirfhp, S_IFREG, argp->name, argp->len);
         |         ^
   fs/nfsd/nfsproc.c:295:2: note: did you mean 'nfsd_proc_create'?
   fs/nfsd/nfsproc.c:279:1: note: 'nfsd_proc_create' declared here
     279 | nfsd_proc_create(struct svc_rqst *rqstp)
         | ^
   fs/nfsd/nfsproc.c:447:2: error: call to undeclared function 'trace_nfsd_proc_remove'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     447 |         trace_nfsd_proc_remove(rqstp, &argp->fh, argp->name, argp->len);
         |         ^
   fs/nfsd/nfsproc.c:447:2: note: did you mean 'nfsd_proc_remove'?
   fs/nfsd/nfsproc.c:442:1: note: 'nfsd_proc_remove' declared here
     442 | nfsd_proc_remove(struct svc_rqst *rqstp)
         | ^
     443 | {
     444 |         struct nfsd_diropargs *argp = rqstp->rq_argp;
     445 |         struct nfsd_stat *resp = rqstp->rq_resp;
     446 | 
     447 |         trace_nfsd_proc_remove(rqstp, &argp->fh, argp->name, argp->len);
         |         ~~~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_remove
   fs/nfsd/nfsproc.c:463:2: error: call to undeclared function 'trace_nfsd_proc_rename'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     463 |         trace_nfsd_proc_rename(rqstp, &argp->ffh, &argp->tfh, argp->fname,
         |         ^
   fs/nfsd/nfsproc.c:463:2: note: did you mean 'nfsd_proc_rename'?
   fs/nfsd/nfsproc.c:458:1: note: 'nfsd_proc_rename' declared here
     458 | nfsd_proc_rename(struct svc_rqst *rqstp)
         | ^
     459 | {
     460 |         struct nfsd_renameargs *argp = rqstp->rq_argp;
     461 |         struct nfsd_stat *resp = rqstp->rq_resp;
     462 | 
     463 |         trace_nfsd_proc_rename(rqstp, &argp->ffh, &argp->tfh, argp->fname,
         |         ~~~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_rename
   fs/nfsd/nfsproc.c:480:2: error: call to undeclared function 'trace_nfsd_proc_link'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     480 |         trace_nfsd_proc_link(rqstp, &argp->ffh, &argp->tfh, argp->tname, argp->tlen);
         |         ^
   fs/nfsd/nfsproc.c:480:2: note: did you mean 'nfsd_proc_link'?
   fs/nfsd/nfsproc.c:475:1: note: 'nfsd_proc_link' declared here
     475 | nfsd_proc_link(struct svc_rqst *rqstp)
         | ^
     476 | {
     477 |         struct nfsd_linkargs *argp = rqstp->rq_argp;
     478 |         struct nfsd_stat *resp = rqstp->rq_resp;
     479 | 
     480 |         trace_nfsd_proc_link(rqstp, &argp->ffh, &argp->tfh, argp->tname, argp->tlen);
         |         ~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_link
   fs/nfsd/nfsproc.c:500:2: error: call to undeclared function 'trace_nfsd_proc_symlink'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     500 |         trace_nfsd_proc_symlink(rqstp, &argp->ffh, argp->fname, argp->flen,
         |         ^
   fs/nfsd/nfsproc.c:500:2: note: did you mean 'nfsd_proc_symlink'?
   fs/nfsd/nfsproc.c:491:1: note: 'nfsd_proc_symlink' declared here
     491 | nfsd_proc_symlink(struct svc_rqst *rqstp)
         | ^
     492 | {
     493 |         struct nfsd_symlinkargs *argp = rqstp->rq_argp;
     494 |         struct nfsd_stat *resp = rqstp->rq_resp;
     495 |         struct nfsd_attrs attrs = {
     496 |                 .na_iattr       = &argp->attrs,
     497 |         };
     498 |         struct svc_fh   newfh;
     499 | 
     500 |         trace_nfsd_proc_symlink(rqstp, &argp->ffh, argp->fname, argp->flen,
         |         ~~~~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_symlink
   fs/nfsd/nfsproc.c:535:1: error: function definition is not allowed here
     535 | {
         | ^
   fs/nfsd/nfsproc.c:568:1: error: function definition is not allowed here
     568 | {
         | ^
   fs/nfsd/nfsproc.c:584:1: error: function definition is not allowed here
     584 | {
         | ^
   fs/nfsd/nfsproc.c:604:1: error: function definition is not allowed here
     604 | {
         | ^
   fs/nfsd/nfsproc.c:630:1: error: function definition is not allowed here
     630 | {
         | ^
   fs/nfsd/nfsproc.c:814:14: error: use of undeclared identifier 'nfsd_proc_mkdir'; did you mean '_proc_mkdir'?
     814 |                 .pc_func = nfsd_proc_mkdir,
         |                            ^~~~~~~~~~~~~~~
         |                            _proc_mkdir
   include/linux/proc_fs.h:85:24: note: '_proc_mkdir' declared here


vim +/trace_nfsd_proc_getattr +57 fs/nfsd/nfsproc.c

    46	
    47	/*
    48	 * Get a file's attributes
    49	 * N.B. After this call resp->fh needs an fh_put
    50	 */
    51	static __be32
    52	nfsd_proc_getattr(struct svc_rqst *rqstp)
    53	{
    54		struct nfsd_fhandle *argp = rqstp->rq_argp;
    55		struct nfsd_attrstat *resp = rqstp->rq_resp;
    56	
  > 57		trace_nfsd_proc_getattr(rqstp, &argp->fh);
    58	
    59		fh_copy(&resp->fh, &argp->fh);
    60		resp->status = fh_verify(rqstp, &resp->fh, 0,
    61					 NFSD_MAY_NOP | NFSD_MAY_BYPASS_GSS_ON_ROOT);
    62		if (resp->status != nfs_ok)
    63			goto out;
    64		resp->status = fh_getattr(&resp->fh, &resp->stat);
    65	out:
    66		resp->status = nfsd_map_status(resp->status);
    67		return rpc_success;
    68	}
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
