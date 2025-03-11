Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE11E264A83;
	Tue, 11 Mar 2025 22:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741731825; cv=none; b=BUJ6c505aFIckJqU5nyJOQ37coXN2RQkoeLdck2BooVKbve5BAjV0uvcB+kiFch+sr+i6UsDFRjjYjRsi37Lqvw6MgxXChx9Q7wNH8R6fElfOdFlp1kq0Lhxa/ntzj/wNsoSsdKXP/M27oAiCFTD8NPG60U+lr0DqQhcdSRd6Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741731825; c=relaxed/simple;
	bh=EqbDqtfVMJTwG/n5Bk1RmvX5+h+QhnymOUm1LlsP8r0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K2ffjXteE8CYTsVGV+uUqhV5ys+3vZ0ornp00ywmAFV5KSfj13ddUP4a15uSUHZqbdf+sUURNhUnAtxflcZSzeLPz49IFzdFNpsVfkhdgX84jEGvaH9ZKNV49B+owCG5k9/Gmc0ZT4dzmYu7V41rkExdI8nYkJvtwXAHR7tR6Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f3LgRa3y; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f3LgRa3y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741731824; x=1773267824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EqbDqtfVMJTwG/n5Bk1RmvX5+h+QhnymOUm1LlsP8r0=;
  b=f3LgRa3ycaUTejBe4ApMOEVqKYbsjZWBGg+LdEns0bXqhWfgziWs0RpI
   n2v3uysb1EFCMrP6wJe6HPLfyCMXifiry0mDiSxM0QgdpH3G9hnbWdmGk
   CvBvGXaVKasURLF095llatAQJw/Xjo7kCXTB1VdKH2/KFcq8H1DtM88pF
   cxjed8HfsbMBhrfRJ5RcqRmO9Yk774nODIHtYE6E3J2+3hA+eEOKGEuO2
   /uMEeKoLfLDN/8sVIMi0qVubbpNTksob6wsrAgQJwtJ35k3oM8zt3uksV
   ggI27zQv9HQMK0+NmOMBsDMOkrKL2sNFtxyXueZc4j9hGYTWRzCc8KyMJ
   Q==;
X-CSE-ConnectionGUID: HYj4Z1PTQ0u4HRY9ivc8iw==
X-CSE-MsgGUID: X8X+5B13Qbyug6v6f30ITg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42922534"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="42922534"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 15:23:42 -0700
X-CSE-ConnectionGUID: vIjh1dIPSIiZHktEmcSotQ==
X-CSE-MsgGUID: lMZklSaARN+Tb2MmHMEqxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="143649022"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 11 Mar 2025 15:23:41 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ts80h-0007su-0V;
	Tue, 11 Mar 2025 22:23:39 +0000
Date: Wed, 12 Mar 2025 06:22:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:nfsd-tracepoints 12/14] fs/nfsd/nfsproc.c:463:2: error:
 call to undeclared function 'trace_nfsd_proc_rename'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202503120613.HAepZgCr-lkp@intel.com>
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
commit: 734656d1441cc769a32a2473091c852809e45b6d [12/14] nfsd: add tracepoints to rename events
config: arm-randconfig-003-20250312 (https://download.01.org/0day-ci/archive/20250312/202503120613.HAepZgCr-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503120613.HAepZgCr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503120613.HAepZgCr-lkp@intel.com/

All errors (new ones prefixed by >>):

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
>> fs/nfsd/nfsproc.c:463:2: error: call to undeclared function 'trace_nfsd_proc_rename'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
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
   fs/nfsd/nfsproc.c:632:1: error: function definition is not allowed here
     632 | {
         | ^
   fs/nfsd/nfsproc.c:816:14: error: use of undeclared identifier 'nfsd_proc_mkdir'; did you mean '_proc_mkdir'?
     816 |                 .pc_func = nfsd_proc_mkdir,
         |                            ^~~~~~~~~~~~~~~
         |                            _proc_mkdir
   include/linux/proc_fs.h:85:24: note: '_proc_mkdir' declared here
      85 | struct proc_dir_entry *_proc_mkdir(const char *, umode_t, struct proc_dir_entry *, void *, bool);
         |                        ^
   fs/nfsd/nfsproc.c:828:14: error: use of undeclared identifier 'nfsd_proc_rmdir'
     828 |                 .pc_func = nfsd_proc_rmdir,
         |                            ^
   fs/nfsd/nfsproc.c:839:14: error: use of undeclared identifier 'nfsd_proc_readdir'
     839 |                 .pc_func = nfsd_proc_readdir,
         |                            ^
   fs/nfsd/nfsproc.c:849:14: error: use of undeclared identifier 'nfsd_proc_statfs'; did you mean 'nfsd_proc_setattr'?
     849 |                 .pc_func = nfsd_proc_statfs,
         |                            ^~~~~~~~~~~~~~~~
         |                            nfsd_proc_setattr
   fs/nfsd/nfsproc.c:75:1: note: 'nfsd_proc_setattr' declared here
      75 | nfsd_proc_setattr(struct svc_rqst *rqstp)
         | ^
   fs/nfsd/nfsproc.c:870:3: error: expected '}'
     870 | };
         |   ^
   fs/nfsd/nfsproc.c:492:1: note: to match this '{'
     492 | {
         | ^
   15 errors generated.


vim +/trace_nfsd_proc_rename +463 fs/nfsd/nfsproc.c

   456	
   457	static __be32
   458	nfsd_proc_rename(struct svc_rqst *rqstp)
   459	{
   460		struct nfsd_renameargs *argp = rqstp->rq_argp;
   461		struct nfsd_stat *resp = rqstp->rq_resp;
   462	
 > 463		trace_nfsd_proc_rename(rqstp, &argp->ffh, &argp->tfh, argp->fname,
   464				       argp->flen, argp->tname, argp->tlen);
   465	
   466		resp->status = nfsd_rename(rqstp, &argp->ffh, argp->fname, argp->flen,
   467					   &argp->tfh, argp->tname, argp->tlen);
   468		fh_put(&argp->ffh);
   469		fh_put(&argp->tfh);
   470		resp->status = nfsd_map_status(resp->status);
   471		return rpc_success;
   472	}
   473	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
