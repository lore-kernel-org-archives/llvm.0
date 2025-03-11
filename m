Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047F92620ED;
	Tue, 11 Mar 2025 17:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741714132; cv=none; b=D16rvJgWjTwgI+zNMVzT8Z+GFeXqiR9fzkeWGrGHEcm37Zelb2z976ETxK2wdztD9aKVE2UCQO+I2cdQNaVuFCv1fvpB06J3Qxq86t4/Pm9tRKNJcl8lxINkrG4/YFUFMuU7U2kAnrQU8Z5pHC6T0EZ6FBVeThTAn5sRcQEN6DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741714132; c=relaxed/simple;
	bh=qksm7vKFWSXmoo8z8Dy+oNnEBIujGEUMzz9Tn5C2hS8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u0BCIfm/dAg6HH++7z3cHzdlOd3YFlvfdTyF1q1OwrxnD8i5vPbqyJwDXT5hAqfZPt0tDJOAM69wcKGHWHvwUc9AsBnfuD3ofFX9TZDDgBaA77cuZ+wtL/3b3l/a4VUp+se30IHSOaQA/FOF+GcJJYyN+HMTGMM+tZOYa3XcN+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TAbDUYdH; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TAbDUYdH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741714131; x=1773250131;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qksm7vKFWSXmoo8z8Dy+oNnEBIujGEUMzz9Tn5C2hS8=;
  b=TAbDUYdHsQkrDkZVFSynIkSZ03BBas3+qWd1Zn1JRNy/Z4k9GhzVaDJZ
   94Cw6cU/u3X+BFN1wNVbQhVhG7dFCBK4nMbC8plunvKMgNuKz1pXlak0F
   P1G98a8wpdvix47wdJopZqba9t6iQK0TTDX8Co1IYETuDXIa4A+6joB4l
   9/e9zRb8LesCNIXt81snjIlxa7WcFEDZBQ5Kyvn1fQ7ZN7fyfMzdSNA0v
   RhxcoL1e82kM+upbkiE4QNfWpoPth/ExURmQdmLi5SwRd7OhjZFho2pOT
   gUFQBZqyV/cYc/ac3BMyKHATaiuwQ5uZTk9GRkwdh0By/ZRuZFsyi8YyC
   w==;
X-CSE-ConnectionGUID: zjF7z7afT0+z9qxD3hrJGw==
X-CSE-MsgGUID: 0wUMj/PATfOtWEbpTgTgMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="45550125"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="45550125"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 10:28:50 -0700
X-CSE-ConnectionGUID: cEqVlkNaQ5amO2a00V7EBw==
X-CSE-MsgGUID: Ds0B9fxYQbOvmh/SZ8dSow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="120898387"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 11 Mar 2025 10:28:49 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ts3PK-0007gS-2P;
	Tue, 11 Mar 2025 17:28:46 +0000
Date: Wed, 12 Mar 2025 01:28:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 74/81] fs/nfsd/nfsproc.c:483:9: error: implicit
 declaration of function 'trace_nfsd_proc_link'; did you mean
 'nfsd_proc_link'?
Message-ID: <202503120154.ctwnAOLZ-lkp@intel.com>
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
commit: c35bc37489cde3283951cb26a56b8b6aa77c151b [74/81] nfsd: add tracepoints for hardlink events
config: sparc-randconfig-001-20250311 (https://download.01.org/0day-ci/archive/20250312/202503120154.ctwnAOLZ-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503120154.ctwnAOLZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503120154.ctwnAOLZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfsd/nfsproc.c: In function 'nfsd_proc_create':
   fs/nfsd/nfsproc.c:295:9: error: implicit declaration of function 'trace_nfsd_proc_create'; did you mean 'nfsd_proc_create'? [-Wimplicit-function-declaration]
     295 |         trace_nfsd_proc_create(rqstp, dirfhp, S_IFREG, argp->name, argp->len);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_create
   fs/nfsd/nfsproc.c: In function 'nfsd_proc_link':
>> fs/nfsd/nfsproc.c:483:9: error: implicit declaration of function 'trace_nfsd_proc_link'; did you mean 'nfsd_proc_link'? [-Wimplicit-function-declaration]
     483 |         trace_nfsd_proc_link(rqstp, &argp->ffh, &argp->tfh, argp->tname, argp->tlen);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_link
   fs/nfsd/nfsproc.c: In function 'nfsd_proc_symlink':
   fs/nfsd/nfsproc.c:503:9: error: implicit declaration of function 'trace_nfsd_proc_symlink'; did you mean 'nfsd_proc_symlink'? [-Wimplicit-function-declaration]
     503 |         trace_nfsd_proc_symlink(rqstp, &argp->ffh, argp->fname, argp->flen,
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_symlink
   fs/nfsd/nfsproc.c:537:1: error: invalid storage class for function 'nfsd_proc_mkdir'
     537 | nfsd_proc_mkdir(struct svc_rqst *rqstp)
         | ^~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c: In function 'nfsd_proc_mkdir':
   fs/nfsd/nfsproc.c:545:9: error: implicit declaration of function 'trace_nfsd_proc_mkdir'; did you mean 'nfsd_proc_mkdir'? [-Wimplicit-function-declaration]
     545 |         trace_nfsd_proc_mkdir(rqstp, &argp->fh, S_IFDIR, argp->name, argp->len);
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_mkdir
   fs/nfsd/nfsproc.c: In function 'nfsd_proc_symlink':
   fs/nfsd/nfsproc.c:570:1: error: invalid storage class for function 'nfsd_proc_rmdir'
     570 | nfsd_proc_rmdir(struct svc_rqst *rqstp)
         | ^~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:584:13: error: invalid storage class for function 'nfsd_init_dirlist_pages'
     584 | static void nfsd_init_dirlist_pages(struct svc_rqst *rqstp,
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:606:1: error: invalid storage class for function 'nfsd_proc_readdir'
     606 | nfsd_proc_readdir(struct svc_rqst *rqstp)
         | ^~~~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:634:1: error: invalid storage class for function 'nfsd_proc_statfs'
     634 | nfsd_proc_statfs(struct svc_rqst *rqstp)
         | ^~~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:819:28: error: initializer element is not constant
     819 |                 .pc_func = nfsd_proc_mkdir,
         |                            ^~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:819:28: note: (near initialization for 'nfsd_procedures2[14].pc_func')
   fs/nfsd/nfsproc.c:831:28: error: initializer element is not constant
     831 |                 .pc_func = nfsd_proc_rmdir,
         |                            ^~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:831:28: note: (near initialization for 'nfsd_procedures2[15].pc_func')
   fs/nfsd/nfsproc.c:842:28: error: initializer element is not constant
     842 |                 .pc_func = nfsd_proc_readdir,
         |                            ^~~~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:842:28: note: (near initialization for 'nfsd_procedures2[16].pc_func')
   fs/nfsd/nfsproc.c:852:28: error: initializer element is not constant
     852 |                 .pc_func = nfsd_proc_statfs,
         |                            ^~~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:852:28: note: (near initialization for 'nfsd_procedures2[17].pc_func')
   fs/nfsd/nfsproc.c:873:1: error: expected declaration or statement at end of input
     873 | };
         | ^
   fs/nfsd/nfsproc.c:866:26: warning: unused variable 'nfsd_version2' [-Wunused-variable]
     866 | const struct svc_version nfsd_version2 = {
         |                          ^~~~~~~~~~~~~
   fs/nfsd/nfsproc.c: At top level:
   fs/nfsd/nfsproc.c:494:1: warning: 'nfsd_proc_symlink' defined but not used [-Wunused-function]
     494 | nfsd_proc_symlink(struct svc_rqst *rqstp)
         | ^~~~~~~~~~~~~~~~~


vim +483 fs/nfsd/nfsproc.c

   476	
   477	static __be32
   478	nfsd_proc_link(struct svc_rqst *rqstp)
   479	{
   480		struct nfsd_linkargs *argp = rqstp->rq_argp;
   481		struct nfsd_stat *resp = rqstp->rq_resp;
   482	
 > 483		trace_nfsd_proc_link(rqstp, &argp->ffh, &argp->tfh, argp->tname, argp->tlen);
   484	
   485		resp->status = nfsd_link(rqstp, &argp->tfh, argp->tname, argp->tlen,
   486					 &argp->ffh);
   487		fh_put(&argp->ffh);
   488		fh_put(&argp->tfh);
   489		resp->status = nfsd_map_status(resp->status);
   490		return rpc_success;
   491	}
   492	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
