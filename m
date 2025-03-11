Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325852F28;
	Tue, 11 Mar 2025 22:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741731765; cv=none; b=QW+IH+B6TnBd/yPma/hr4tWXmV3G5l9b54TXIr6OyRpKcmm+/ssT/azMFPVd60nBh7k88vp8tetLf/B0AnMtCoHkQB8BYY4kqotdnbzb/u/80QDfd2UThtaLBcgRRjYlg2kHROi2wjzsr72vKPfz7r6tKAsGTA1hQDOcbEpVuLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741731765; c=relaxed/simple;
	bh=u/uRz6vvMwGMXX0HyMnm3A9od3J2DezUs/Fmg0Isx4M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Slx8FGje5vkCWFRkM7qfYUDfpVhGU2R/jrmNNEOGluhjhLc+2JIWQdtITfQ2AZSJsaMLKeTwmPyym3K/++nXSCpgVppm27/wWoArM84pP0zh2w+xFHmP+Pvi+K4Bnf1/WPPZI6q7ODbuUPp06usJvc7DH1nsw5yjMBatqxb7zWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F1m6vVRI; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F1m6vVRI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741731764; x=1773267764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u/uRz6vvMwGMXX0HyMnm3A9od3J2DezUs/Fmg0Isx4M=;
  b=F1m6vVRI+mn45GvNh3PlI4tJ/jz9iJvL9OAdz6TQ32xNauNqFsc57vPR
   ieuoMqA4aaObyeTNMtSUx/04xrEnDidVrDb6sbE45qeFgEsKZ8OifQ1Ht
   7zXr5EGKJKoGdAAVwDDzu/tvnLAPvKb6RIdvTowV+zjMH+ojGSoAR/stu
   s6MFxZ7EdDySBALzrJb02ARFQY4Z3IDt5GUwiTVkV24EtyLfufQwl65of
   f8beR/lTvaU2nRXmpnTtERSidpF8OyknrEpC8NA1P56W/jIvdRzCmvXJu
   AxVl6cOTAAApa3pIBr3imbS+nI6/726P4eLC6oUKtQ0RYc55jwy7kCH5D
   g==;
X-CSE-ConnectionGUID: Leh0TAbwR9+VEo1fKifZbw==
X-CSE-MsgGUID: 9uTVu1MlRo++WAeY6cHEkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42701567"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="42701567"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 15:22:43 -0700
X-CSE-ConnectionGUID: vVhmWsRoTmK23EwDnRnBEg==
X-CSE-MsgGUID: P6piaV9+ToWH3ErrlO1xLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="125348385"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 11 Mar 2025 15:22:42 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ts7zj-0007sq-0E;
	Tue, 11 Mar 2025 22:22:39 +0000
Date: Wed, 12 Mar 2025 06:22:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 78/81] fs/nfsd/nfsproc.c:57:9: error: implicit
 declaration of function 'trace_nfsd_proc_getattr'; did you mean
 'nfsd_proc_getattr'?
Message-ID: <202503120603.hgrmWqsE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   86deeee9a2bdf8ba09cfd0ab66dbf448d2e8b82b
commit: a063a124db1791568dce722fe7898f375060c76f [78/81] nfsd: add tracepoint for GETATTR events
config: sparc-randconfig-001-20250311 (https://download.01.org/0day-ci/archive/20250312/202503120603.hgrmWqsE-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503120603.hgrmWqsE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503120603.hgrmWqsE-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfsd/nfsproc.c: In function 'nfsd_proc_getattr':
>> fs/nfsd/nfsproc.c:57:9: error: implicit declaration of function 'trace_nfsd_proc_getattr'; did you mean 'nfsd_proc_getattr'? [-Wimplicit-function-declaration]
      57 |         trace_nfsd_proc_getattr(rqstp, &argp->fh);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_getattr
   fs/nfsd/nfsproc.c: In function 'nfsd_proc_create':
   fs/nfsd/nfsproc.c:295:9: error: implicit declaration of function 'trace_nfsd_proc_create'; did you mean 'nfsd_proc_create'? [-Wimplicit-function-declaration]
     295 |         trace_nfsd_proc_create(rqstp, dirfhp, S_IFREG, argp->name, argp->len);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_create
   fs/nfsd/nfsproc.c: In function 'nfsd_proc_remove':
   fs/nfsd/nfsproc.c:447:9: error: implicit declaration of function 'trace_nfsd_proc_remove'; did you mean 'nfsd_proc_remove'? [-Wimplicit-function-declaration]
     447 |         trace_nfsd_proc_remove(rqstp, &argp->fh, argp->name, argp->len);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_remove
   fs/nfsd/nfsproc.c: In function 'nfsd_proc_rename':
   fs/nfsd/nfsproc.c:463:9: error: implicit declaration of function 'trace_nfsd_proc_rename'; did you mean 'nfsd_proc_rename'? [-Wimplicit-function-declaration]
     463 |         trace_nfsd_proc_rename(rqstp, &argp->ffh, &argp->tfh, argp->fname,
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_rename
   fs/nfsd/nfsproc.c: In function 'nfsd_proc_link':
   fs/nfsd/nfsproc.c:480:9: error: implicit declaration of function 'trace_nfsd_proc_link'; did you mean 'nfsd_proc_link'? [-Wimplicit-function-declaration]
     480 |         trace_nfsd_proc_link(rqstp, &argp->ffh, &argp->tfh, argp->tname, argp->tlen);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_link
   fs/nfsd/nfsproc.c: In function 'nfsd_proc_symlink':
   fs/nfsd/nfsproc.c:500:9: error: implicit declaration of function 'trace_nfsd_proc_symlink'; did you mean 'nfsd_proc_symlink'? [-Wimplicit-function-declaration]
     500 |         trace_nfsd_proc_symlink(rqstp, &argp->ffh, argp->fname, argp->flen,
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_symlink
   fs/nfsd/nfsproc.c:534:1: error: invalid storage class for function 'nfsd_proc_mkdir'
     534 | nfsd_proc_mkdir(struct svc_rqst *rqstp)
         | ^~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c: In function 'nfsd_proc_mkdir':
   fs/nfsd/nfsproc.c:542:9: error: implicit declaration of function 'trace_nfsd_proc_mkdir'; did you mean 'nfsd_proc_mkdir'? [-Wimplicit-function-declaration]
     542 |         trace_nfsd_proc_mkdir(rqstp, &argp->fh, S_IFDIR, argp->name, argp->len);
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_mkdir
   fs/nfsd/nfsproc.c: In function 'nfsd_proc_symlink':
   fs/nfsd/nfsproc.c:567:1: error: invalid storage class for function 'nfsd_proc_rmdir'
     567 | nfsd_proc_rmdir(struct svc_rqst *rqstp)
         | ^~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c: In function 'nfsd_proc_rmdir':
   fs/nfsd/nfsproc.c:572:9: error: implicit declaration of function 'trace_nfsd_proc_rmdir'; did you mean 'nfsd_proc_rmdir'? [-Wimplicit-function-declaration]
     572 |         trace_nfsd_proc_rmdir(rqstp, &argp->fh, argp->name, argp->len);
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_rmdir
   fs/nfsd/nfsproc.c: In function 'nfsd_proc_symlink':
   fs/nfsd/nfsproc.c:581:13: error: invalid storage class for function 'nfsd_init_dirlist_pages'
     581 | static void nfsd_init_dirlist_pages(struct svc_rqst *rqstp,
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:603:1: error: invalid storage class for function 'nfsd_proc_readdir'
     603 | nfsd_proc_readdir(struct svc_rqst *rqstp)
         | ^~~~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c: In function 'nfsd_proc_readdir':
   fs/nfsd/nfsproc.c:609:9: error: implicit declaration of function 'trace_nfsd_proc_readdir'; did you mean 'nfsd_proc_readdir'? [-Wimplicit-function-declaration]
     609 |         trace_nfsd_proc_readdir(rqstp, &argp->fh, argp->cookie, argp->count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_readdir
   fs/nfsd/nfsproc.c: In function 'nfsd_proc_symlink':
   fs/nfsd/nfsproc.c:629:1: error: invalid storage class for function 'nfsd_proc_statfs'
     629 | nfsd_proc_statfs(struct svc_rqst *rqstp)
         | ^~~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c: In function 'nfsd_proc_statfs':
>> fs/nfsd/nfsproc.c:634:9: error: implicit declaration of function 'trace_nfsd_proc_statfs'; did you mean 'nfsd_proc_statfs'? [-Wimplicit-function-declaration]
     634 |         trace_nfsd_proc_statfs(rqstp, &argp->fh);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_statfs
   fs/nfsd/nfsproc.c: In function 'nfsd_proc_symlink':
   fs/nfsd/nfsproc.c:814:28: error: initializer element is not constant
     814 |                 .pc_func = nfsd_proc_mkdir,
         |                            ^~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:814:28: note: (near initialization for 'nfsd_procedures2[14].pc_func')
   fs/nfsd/nfsproc.c:826:28: error: initializer element is not constant
     826 |                 .pc_func = nfsd_proc_rmdir,
         |                            ^~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:826:28: note: (near initialization for 'nfsd_procedures2[15].pc_func')
   fs/nfsd/nfsproc.c:837:28: error: initializer element is not constant
     837 |                 .pc_func = nfsd_proc_readdir,
         |                            ^~~~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:837:28: note: (near initialization for 'nfsd_procedures2[16].pc_func')
   fs/nfsd/nfsproc.c:847:28: error: initializer element is not constant
     847 |                 .pc_func = nfsd_proc_statfs,
         |                            ^~~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:847:28: note: (near initialization for 'nfsd_procedures2[17].pc_func')
   fs/nfsd/nfsproc.c:868:1: error: expected declaration or statement at end of input
     868 | };
         | ^
   fs/nfsd/nfsproc.c:861:26: warning: unused variable 'nfsd_version2' [-Wunused-variable]
     861 | const struct svc_version nfsd_version2 = {
         |                          ^~~~~~~~~~~~~
   fs/nfsd/nfsproc.c: At top level:
   fs/nfsd/nfsproc.c:491:1: warning: 'nfsd_proc_symlink' defined but not used [-Wunused-function]
     491 | nfsd_proc_symlink(struct svc_rqst *rqstp)
         | ^~~~~~~~~~~~~~~~~


vim +57 fs/nfsd/nfsproc.c

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
