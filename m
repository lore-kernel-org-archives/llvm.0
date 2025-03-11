Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B362326461A;
	Tue, 11 Mar 2025 18:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741718487; cv=none; b=AsqPStcsRJP4VVvNRP2imu++QQerL/x3+dJvv8y/pymiRkDjQZC2Ilrm0P3iaAmZpgEP87/Gw1ppd3rrOfbfjbZ/cUPROoMjLtmA6Q7jmjrASgvZntXYhuOd+vvWDTEJvS4G3HnvuEtXw8rAF0V6UMaqLqgXo/5NIcjUFLd8sbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741718487; c=relaxed/simple;
	bh=Oo3+DSJS+GEqpeP+JySy6cB+ydfTdgWYneyZ2LYJm+s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JVRgwwObmM+GGRxWidXpXHhk4nxvp7ehsp2491vLLNmPKkVEM9ST0X/TUvEr1zd8srUxAiUOAWlr4tHRWX5+9bdVpjCUdRzJkEAHl+0AMxHCAcwLbV9ilTI+PNK8nrgeFsVFDlAZcW6MrQUEvlSaSPb7RqojHVkN9BzAOcl+W6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mNgPb9I+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mNgPb9I+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741718486; x=1773254486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Oo3+DSJS+GEqpeP+JySy6cB+ydfTdgWYneyZ2LYJm+s=;
  b=mNgPb9I+eXeqsywHJcK2XVi18/XDVKDbJbSnoWej5dNhC2PTtCQ3JMlK
   LUwtoERuHCRJgFT92+5UY2WkScnjS1CwC+qKz7egtfT6MAMFfcb16nhuO
   j/wh+oyHvtNMA0xcSMRBPEhubIMO/Tf5q3RPVKGCkKzVxcvjrHlyjwm2n
   /JreEasxzxhEnHpAMchfnSI4rL0ocBkj3W6dUah+B//sJZDHnmjNccDbg
   PIPUujvkgHz/o08stc9xdgofKbA0ys2kks29qk5LiLcS8Tymzr8r7FusN
   DbnHB4/VLqbsBYBquqD6b8Fz/wBv2Fy093Gd9GtGFfWyGUIw7nRePsjUt
   A==;
X-CSE-ConnectionGUID: nfOvj7prQKeaCi79AZacoQ==
X-CSE-MsgGUID: NBc5s59YT1G4v78Ib2G9Ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="41941905"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="41941905"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 11:41:25 -0700
X-CSE-ConnectionGUID: NlbXqsT3S0q0hASlXPvPAQ==
X-CSE-MsgGUID: NC3RptFFQrKbCr5YXWssxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="121093665"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 11 Mar 2025 11:41:23 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ts4XY-0007jE-0v;
	Tue, 11 Mar 2025 18:41:20 +0000
Date: Wed, 12 Mar 2025 02:40:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 75/81] fs/nfsd/nfsproc.c:447:9: error: implicit
 declaration of function 'trace_nfsd_proc_remove'; did you mean
 'nfsd_proc_remove'?
Message-ID: <202503120209.pV3QBDxN-lkp@intel.com>
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
commit: 7874515959533baab57e883272ac73bd8ec21b9c [75/81] nfsd: add tracepoints for unlink events
config: sparc-randconfig-001-20250311 (https://download.01.org/0day-ci/archive/20250312/202503120209.pV3QBDxN-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503120209.pV3QBDxN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503120209.pV3QBDxN-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfsd/nfsproc.c: In function 'nfsd_proc_create':
   fs/nfsd/nfsproc.c:295:9: error: implicit declaration of function 'trace_nfsd_proc_create'; did you mean 'nfsd_proc_create'? [-Wimplicit-function-declaration]
     295 |         trace_nfsd_proc_create(rqstp, dirfhp, S_IFREG, argp->name, argp->len);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_create
   fs/nfsd/nfsproc.c: In function 'nfsd_proc_remove':
>> fs/nfsd/nfsproc.c:447:9: error: implicit declaration of function 'trace_nfsd_proc_remove'; did you mean 'nfsd_proc_remove'? [-Wimplicit-function-declaration]
     447 |         trace_nfsd_proc_remove(rqstp, &argp->fh, argp->name, argp->len);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_remove
   fs/nfsd/nfsproc.c: In function 'nfsd_proc_link':
   fs/nfsd/nfsproc.c:482:9: error: implicit declaration of function 'trace_nfsd_proc_link'; did you mean 'nfsd_proc_link'? [-Wimplicit-function-declaration]
     482 |         trace_nfsd_proc_link(rqstp, &argp->ffh, &argp->tfh, argp->tname, argp->tlen);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_link
   fs/nfsd/nfsproc.c: In function 'nfsd_proc_symlink':
   fs/nfsd/nfsproc.c:502:9: error: implicit declaration of function 'trace_nfsd_proc_symlink'; did you mean 'nfsd_proc_symlink'? [-Wimplicit-function-declaration]
     502 |         trace_nfsd_proc_symlink(rqstp, &argp->ffh, argp->fname, argp->flen,
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_symlink
   fs/nfsd/nfsproc.c:536:1: error: invalid storage class for function 'nfsd_proc_mkdir'
     536 | nfsd_proc_mkdir(struct svc_rqst *rqstp)
         | ^~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c: In function 'nfsd_proc_mkdir':
   fs/nfsd/nfsproc.c:544:9: error: implicit declaration of function 'trace_nfsd_proc_mkdir'; did you mean 'nfsd_proc_mkdir'? [-Wimplicit-function-declaration]
     544 |         trace_nfsd_proc_mkdir(rqstp, &argp->fh, S_IFDIR, argp->name, argp->len);
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_mkdir
   fs/nfsd/nfsproc.c: In function 'nfsd_proc_symlink':
   fs/nfsd/nfsproc.c:569:1: error: invalid storage class for function 'nfsd_proc_rmdir'
     569 | nfsd_proc_rmdir(struct svc_rqst *rqstp)
         | ^~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c: In function 'nfsd_proc_rmdir':
>> fs/nfsd/nfsproc.c:574:9: error: implicit declaration of function 'trace_nfsd_proc_rmdir'; did you mean 'nfsd_proc_rmdir'? [-Wimplicit-function-declaration]
     574 |         trace_nfsd_proc_rmdir(rqstp, &argp->fh, argp->name, argp->len);
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_rmdir
   fs/nfsd/nfsproc.c: In function 'nfsd_proc_symlink':
   fs/nfsd/nfsproc.c:583:13: error: invalid storage class for function 'nfsd_init_dirlist_pages'
     583 | static void nfsd_init_dirlist_pages(struct svc_rqst *rqstp,
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:605:1: error: invalid storage class for function 'nfsd_proc_readdir'
     605 | nfsd_proc_readdir(struct svc_rqst *rqstp)
         | ^~~~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:633:1: error: invalid storage class for function 'nfsd_proc_statfs'
     633 | nfsd_proc_statfs(struct svc_rqst *rqstp)
         | ^~~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:818:28: error: initializer element is not constant
     818 |                 .pc_func = nfsd_proc_mkdir,
         |                            ^~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:818:28: note: (near initialization for 'nfsd_procedures2[14].pc_func')
   fs/nfsd/nfsproc.c:830:28: error: initializer element is not constant
     830 |                 .pc_func = nfsd_proc_rmdir,
         |                            ^~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:830:28: note: (near initialization for 'nfsd_procedures2[15].pc_func')
   fs/nfsd/nfsproc.c:841:28: error: initializer element is not constant
     841 |                 .pc_func = nfsd_proc_readdir,
         |                            ^~~~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:841:28: note: (near initialization for 'nfsd_procedures2[16].pc_func')
   fs/nfsd/nfsproc.c:851:28: error: initializer element is not constant
     851 |                 .pc_func = nfsd_proc_statfs,
         |                            ^~~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:851:28: note: (near initialization for 'nfsd_procedures2[17].pc_func')
   fs/nfsd/nfsproc.c:872:1: error: expected declaration or statement at end of input
     872 | };
         | ^
   fs/nfsd/nfsproc.c:865:26: warning: unused variable 'nfsd_version2' [-Wunused-variable]
     865 | const struct svc_version nfsd_version2 = {
         |                          ^~~~~~~~~~~~~
   fs/nfsd/nfsproc.c: At top level:
   fs/nfsd/nfsproc.c:493:1: warning: 'nfsd_proc_symlink' defined but not used [-Wunused-function]
     493 | nfsd_proc_symlink(struct svc_rqst *rqstp)
         | ^~~~~~~~~~~~~~~~~


vim +447 fs/nfsd/nfsproc.c

   440	
   441	static __be32
   442	nfsd_proc_remove(struct svc_rqst *rqstp)
   443	{
   444		struct nfsd_diropargs *argp = rqstp->rq_argp;
   445		struct nfsd_stat *resp = rqstp->rq_resp;
   446	
 > 447		trace_nfsd_proc_remove(rqstp, &argp->fh, argp->name, argp->len);
   448	
   449		/* Unlink. -SIFDIR means file must not be a directory */
   450		resp->status = nfsd_unlink(rqstp, &argp->fh, -S_IFDIR,
   451					   argp->name, argp->len);
   452		fh_put(&argp->fh);
   453		resp->status = nfsd_map_status(resp->status);
   454		return rpc_success;
   455	}
   456	
   457	static __be32
   458	nfsd_proc_rename(struct svc_rqst *rqstp)
   459	{
   460		struct nfsd_renameargs *argp = rqstp->rq_argp;
   461		struct nfsd_stat *resp = rqstp->rq_resp;
   462	
   463		dprintk("nfsd: RENAME   %s %.*s -> \n",
   464			SVCFH_fmt(&argp->ffh), argp->flen, argp->fname);
   465		dprintk("nfsd:        ->  %s %.*s\n",
   466			SVCFH_fmt(&argp->tfh), argp->tlen, argp->tname);
   467	
   468		resp->status = nfsd_rename(rqstp, &argp->ffh, argp->fname, argp->flen,
   469					   &argp->tfh, argp->tname, argp->tlen);
   470		fh_put(&argp->ffh);
   471		fh_put(&argp->tfh);
   472		resp->status = nfsd_map_status(resp->status);
   473		return rpc_success;
   474	}
   475	
   476	static __be32
   477	nfsd_proc_link(struct svc_rqst *rqstp)
   478	{
   479		struct nfsd_linkargs *argp = rqstp->rq_argp;
   480		struct nfsd_stat *resp = rqstp->rq_resp;
   481	
   482		trace_nfsd_proc_link(rqstp, &argp->ffh, &argp->tfh, argp->tname, argp->tlen);
   483	
   484		resp->status = nfsd_link(rqstp, &argp->tfh, argp->tname, argp->tlen,
   485					 &argp->ffh);
   486		fh_put(&argp->ffh);
   487		fh_put(&argp->tfh);
   488		resp->status = nfsd_map_status(resp->status);
   489		return rpc_success;
   490	}
   491	
   492	static __be32
   493	nfsd_proc_symlink(struct svc_rqst *rqstp)
   494	{
   495		struct nfsd_symlinkargs *argp = rqstp->rq_argp;
   496		struct nfsd_stat *resp = rqstp->rq_resp;
   497		struct nfsd_attrs attrs = {
   498			.na_iattr	= &argp->attrs,
   499		};
   500		struct svc_fh	newfh;
   501	
   502		trace_nfsd_proc_symlink(rqstp, &argp->ffh, argp->fname, argp->flen,
   503					argp->tname, argp->tlen);
   504	
   505		if (argp->tlen == 0) {
   506		if (argp->tlen > NFS_MAXPATHLEN) {
   507			resp->status = nfserr_nametoolong;
   508			goto out;
   509		}
   510	
   511		argp->tname = svc_fill_symlink_pathname(rqstp, &argp->first,
   512							page_address(rqstp->rq_arg.pages[0]),
   513							argp->tlen);
   514		if (IS_ERR(argp->tname)) {
   515			resp->status = nfserrno(PTR_ERR(argp->tname));
   516			goto out;
   517		}
   518	
   519		fh_init(&newfh, NFS_FHSIZE);
   520		resp->status = nfsd_symlink(rqstp, &argp->ffh, argp->fname, argp->flen,
   521					    argp->tname, &attrs, &newfh);
   522	
   523		kfree(argp->tname);
   524		fh_put(&argp->ffh);
   525		fh_put(&newfh);
   526	out:
   527		resp->status = nfsd_map_status(resp->status);
   528		return rpc_success;
   529	}
   530	
   531	/*
   532	 * Make directory. This operation is not idempotent.
   533	 * N.B. After this call resp->fh needs an fh_put
   534	 */
   535	static __be32
   536	nfsd_proc_mkdir(struct svc_rqst *rqstp)
   537	{
   538		struct nfsd_createargs *argp = rqstp->rq_argp;
   539		struct nfsd_diropres *resp = rqstp->rq_resp;
   540		struct nfsd_attrs attrs = {
   541			.na_iattr	= &argp->attrs,
   542		};
   543	
   544		trace_nfsd_proc_mkdir(rqstp, &argp->fh, S_IFDIR, argp->name, argp->len);
   545	
   546		if (resp->fh.fh_dentry) {
   547			printk(KERN_WARNING
   548				"nfsd_proc_mkdir: response already verified??\n");
   549		}
   550	
   551		argp->attrs.ia_valid &= ~ATTR_SIZE;
   552		fh_init(&resp->fh, NFS_FHSIZE);
   553		resp->status = nfsd_create(rqstp, &argp->fh, argp->name, argp->len,
   554					   &attrs, S_IFDIR, 0, &resp->fh);
   555		fh_put(&argp->fh);
   556		if (resp->status != nfs_ok)
   557			goto out;
   558	
   559		resp->status = fh_getattr(&resp->fh, &resp->stat);
   560	out:
   561		resp->status = nfsd_map_status(resp->status);
   562		return rpc_success;
   563	}
   564	
   565	/*
   566	 * Remove a directory
   567	 */
   568	static __be32
   569	nfsd_proc_rmdir(struct svc_rqst *rqstp)
   570	{
   571		struct nfsd_diropargs *argp = rqstp->rq_argp;
   572		struct nfsd_stat *resp = rqstp->rq_resp;
   573	
 > 574		trace_nfsd_proc_rmdir(rqstp, &argp->fh, argp->name, argp->len);
   575	
   576		resp->status = nfsd_unlink(rqstp, &argp->fh, S_IFDIR,
   577					   argp->name, argp->len);
   578		fh_put(&argp->fh);
   579		resp->status = nfsd_map_status(resp->status);
   580		return rpc_success;
   581	}
   582	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
