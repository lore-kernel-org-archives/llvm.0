Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA44C222562;
	Tue, 11 Mar 2025 19:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741722952; cv=none; b=nJNCEcN5YUf/Hfg+2Pjp6d1eLNcf2wyeZyMvyJLkyAmEi/lAv2ozruRamKHDwEk1pr1GLgMNyyla4gibRKZio8LEVe4ZnNurPFGa6KTtKGOGkHrjL34/6Bcn/E0yWelG7Nkqnb7ezgExGWFwzsJh7ZkbLCOysMSvlNjTjdrw04Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741722952; c=relaxed/simple;
	bh=6l7aLhgUJZEcR1yU1AbHmZ2RpFWiAB7ugEq3wzx9EFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N8fV1SR1sbTEzpytBqM2cvTuoQEOAp2ORwcCy0T7Utb6wDAQdYckeaGpH5BOvQUQrJpxWyCKmh7gxjZCC+Ko52Z8rDd9XnhHL2XgA+i96BUXt47UAbkH7ZQq3gRFM+8MEpoMCHEZVFIWKa3iRHOhTFEwkkYG49QRg2A2l9KQ7lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ig7kz5/s; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ig7kz5/s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741722951; x=1773258951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6l7aLhgUJZEcR1yU1AbHmZ2RpFWiAB7ugEq3wzx9EFk=;
  b=ig7kz5/scHy3H2gxRNJRvjMrh8picpIwpSzBG3HpERpZok7Nh6u/S1Qo
   R+J6ry7dCHhN+e3dLsIhCdtrmputmWhuC4hrFV5h1VIlVfsW5bnbp+Xcc
   0ld4DYogvjKwykJRS1iNbzf/c7h7w0ifWfblX39CzEvQ6FM/9o9B85JKE
   3vs4rwECgJjMQJRq7jybVL8zLCqgv3e7v/8bNsyLKautbGaxkEPjXmgu5
   NyYXFp4DrevpyUabtlz+nDPPmHOIHnWUHrizoruBfXTQtgD23Gsof5cQh
   w5Q7sus3FDtFIxzV6ALMIUAvJHaPzOq7Q9lnx6p/2cbz4t6OGbvmAqFIv
   A==;
X-CSE-ConnectionGUID: pv6NdgRIRPOodFn7zktDdw==
X-CSE-MsgGUID: 8hCeaToeRTyPe/9WtX5pdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="52987798"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="52987798"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 12:55:50 -0700
X-CSE-ConnectionGUID: s3ZCruFRT121270NmZuPAw==
X-CSE-MsgGUID: BpZ7TPdNQTyZ4Gc5FcQQ9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="125040127"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 11 Mar 2025 12:55:49 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ts5ha-0007nU-2V;
	Tue, 11 Mar 2025 19:55:46 +0000
Date: Wed, 12 Mar 2025 03:55:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 76/81] fs/nfsd/nfsproc.c:463:9: error: implicit
 declaration of function 'trace_nfsd_proc_rename'; did you mean
 'nfsd_proc_rename'?
Message-ID: <202503120304.2Flcobhs-lkp@intel.com>
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
commit: 6f74ab2f92f7bac5ff498f008ba91c31cc2ebc10 [76/81] nfsd: add tracepoints to rename events
config: sparc-randconfig-001-20250311 (https://download.01.org/0day-ci/archive/20250312/202503120304.2Flcobhs-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503120304.2Flcobhs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503120304.2Flcobhs-lkp@intel.com/

All errors (new ones prefixed by >>):

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
>> fs/nfsd/nfsproc.c:463:9: error: implicit declaration of function 'trace_nfsd_proc_rename'; did you mean 'nfsd_proc_rename'? [-Wimplicit-function-declaration]
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
   fs/nfsd/nfsproc.c:631:1: error: invalid storage class for function 'nfsd_proc_statfs'
     631 | nfsd_proc_statfs(struct svc_rqst *rqstp)
         | ^~~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:816:28: error: initializer element is not constant
     816 |                 .pc_func = nfsd_proc_mkdir,
         |                            ^~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:816:28: note: (near initialization for 'nfsd_procedures2[14].pc_func')
   fs/nfsd/nfsproc.c:828:28: error: initializer element is not constant
     828 |                 .pc_func = nfsd_proc_rmdir,
         |                            ^~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:828:28: note: (near initialization for 'nfsd_procedures2[15].pc_func')
   fs/nfsd/nfsproc.c:839:28: error: initializer element is not constant
     839 |                 .pc_func = nfsd_proc_readdir,
         |                            ^~~~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:839:28: note: (near initialization for 'nfsd_procedures2[16].pc_func')
   fs/nfsd/nfsproc.c:849:28: error: initializer element is not constant
     849 |                 .pc_func = nfsd_proc_statfs,
         |                            ^~~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:849:28: note: (near initialization for 'nfsd_procedures2[17].pc_func')
   fs/nfsd/nfsproc.c:870:1: error: expected declaration or statement at end of input
     870 | };
         | ^
   fs/nfsd/nfsproc.c:863:26: warning: unused variable 'nfsd_version2' [-Wunused-variable]
     863 | const struct svc_version nfsd_version2 = {
         |                          ^~~~~~~~~~~~~
   fs/nfsd/nfsproc.c: At top level:
   fs/nfsd/nfsproc.c:491:1: warning: 'nfsd_proc_symlink' defined but not used [-Wunused-function]
     491 | nfsd_proc_symlink(struct svc_rqst *rqstp)
         | ^~~~~~~~~~~~~~~~~


vim +463 fs/nfsd/nfsproc.c

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
