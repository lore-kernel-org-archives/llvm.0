Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634A98BF8;
	Tue, 11 Mar 2025 21:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741726860; cv=none; b=qlEaROi5L+rg1nDepb9KpFn/7rDBDuQEDgRWomValCGl1noDOvMx6hnHW8JSPwkNTRkKzZueMG5+srv4zkZT7pth8YJN4UBymYKzXKiryeUiemitvzvuWQoIkmhplUxYoIeVYQ4OPtSXJHFA9txrlUUzksHvNln5eN7nwZS8bHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741726860; c=relaxed/simple;
	bh=Jmo1DMzmW8UJT4UMH+aDJIV0xPYuNdqjkfkNVLljz3A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fPRaASX4KY7qK6dY9IJFs0GgJLVCqCFCwh/a8Gkk2bHYiRjiKxyu+Y6ieHz8zT4Qes5Z38V220E2EIix1+kzzkMyvUZGNfcLnGpIalYWbRjcBngK56rmliknLUwlM73i46Dh4LcIfvUNw3uHE0+GMqmk+htPIbtJ9VYacqWPOcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BrW1GaYU; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BrW1GaYU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741726858; x=1773262858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jmo1DMzmW8UJT4UMH+aDJIV0xPYuNdqjkfkNVLljz3A=;
  b=BrW1GaYUMeQeeLBPwVPkXCBQdgmTp0yLOOUe/MWOtdq4wvzLi0clBb/1
   IJ2u5oYrgxU/ZUaUcEKPWVE8hxj8/3tMERoNuoUvDQjZyMKsgLSDdceI1
   KK8NvGUlkeStrufSNmHWUQVvx0KgI3MT7oKPM0qxuNW7U7yr1AUFkohLs
   Ko0ZHZVFArsV4Ox8hmgi2RZizes/epabgg0K1EsEBAPDIGjF9o+DAv3v0
   Wi6lJTqOTARS5nbqzzskADuIvGkvyM3NAgo3nTeAlzcwHv8n1XUJSQtHb
   CBrZ9Eb1KTQ5crJSA9grkz0abvFz/bE/7Z1X+xp5M/mN0LkC0FvxbYxwk
   A==;
X-CSE-ConnectionGUID: 5h0AlwhjQeCyz7LEUSB7Yw==
X-CSE-MsgGUID: kRjbgWATS/6vvvHlb8La4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42504484"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="42504484"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 14:00:58 -0700
X-CSE-ConnectionGUID: xXNkCGe/QPyUJKRxezE2vA==
X-CSE-MsgGUID: M3XavAknSMWiaGt27oJtUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="120260306"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 11 Mar 2025 14:00:56 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ts6ic-0007qM-0R;
	Tue, 11 Mar 2025 21:00:54 +0000
Date: Wed, 12 Mar 2025 05:00:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:nfsd-tracepoints 11/14] fs/nfsd/nfsproc.c:447:2: error:
 call to undeclared function 'trace_nfsd_proc_remove'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202503120410.wHiLMZKk-lkp@intel.com>
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
commit: 63bb30539b448feb4eeb0d98b3b5cc0975c2c18c [11/14] nfsd: add tracepoints for unlink events
config: arm-randconfig-003-20250312 (https://download.01.org/0day-ci/archive/20250312/202503120410.wHiLMZKk-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503120410.wHiLMZKk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503120410.wHiLMZKk-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfsd/nfsproc.c:295:2: error: call to undeclared function 'trace_nfsd_proc_create'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     295 |         trace_nfsd_proc_create(rqstp, dirfhp, S_IFREG, argp->name, argp->len);
         |         ^
   fs/nfsd/nfsproc.c:295:2: note: did you mean 'nfsd_proc_create'?
   fs/nfsd/nfsproc.c:279:1: note: 'nfsd_proc_create' declared here
     279 | nfsd_proc_create(struct svc_rqst *rqstp)
         | ^
>> fs/nfsd/nfsproc.c:447:2: error: call to undeclared function 'trace_nfsd_proc_remove'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
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
   fs/nfsd/nfsproc.c:482:2: error: call to undeclared function 'trace_nfsd_proc_link'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     482 |         trace_nfsd_proc_link(rqstp, &argp->ffh, &argp->tfh, argp->tname, argp->tlen);
         |         ^
   fs/nfsd/nfsproc.c:482:2: note: did you mean 'nfsd_proc_link'?
   fs/nfsd/nfsproc.c:477:1: note: 'nfsd_proc_link' declared here
     477 | nfsd_proc_link(struct svc_rqst *rqstp)
         | ^
     478 | {
     479 |         struct nfsd_linkargs *argp = rqstp->rq_argp;
     480 |         struct nfsd_stat *resp = rqstp->rq_resp;
     481 | 
     482 |         trace_nfsd_proc_link(rqstp, &argp->ffh, &argp->tfh, argp->tname, argp->tlen);
         |         ~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_link
   fs/nfsd/nfsproc.c:502:2: error: call to undeclared function 'trace_nfsd_proc_symlink'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     502 |         trace_nfsd_proc_symlink(rqstp, &argp->ffh, argp->fname, argp->flen,
         |         ^
   fs/nfsd/nfsproc.c:502:2: note: did you mean 'nfsd_proc_symlink'?
   fs/nfsd/nfsproc.c:493:1: note: 'nfsd_proc_symlink' declared here
     493 | nfsd_proc_symlink(struct svc_rqst *rqstp)
         | ^
     494 | {
     495 |         struct nfsd_symlinkargs *argp = rqstp->rq_argp;
     496 |         struct nfsd_stat *resp = rqstp->rq_resp;
     497 |         struct nfsd_attrs attrs = {
     498 |                 .na_iattr       = &argp->attrs,
     499 |         };
     500 |         struct svc_fh   newfh;
     501 | 
     502 |         trace_nfsd_proc_symlink(rqstp, &argp->ffh, argp->fname, argp->flen,
         |         ~~~~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_symlink
   fs/nfsd/nfsproc.c:537:1: error: function definition is not allowed here
     537 | {
         | ^
   fs/nfsd/nfsproc.c:570:1: error: function definition is not allowed here
     570 | {
         | ^
   fs/nfsd/nfsproc.c:586:1: error: function definition is not allowed here
     586 | {
         | ^
   fs/nfsd/nfsproc.c:606:1: error: function definition is not allowed here
     606 | {
         | ^
   fs/nfsd/nfsproc.c:634:1: error: function definition is not allowed here
     634 | {
         | ^
   fs/nfsd/nfsproc.c:818:14: error: use of undeclared identifier 'nfsd_proc_mkdir'; did you mean '_proc_mkdir'?
     818 |                 .pc_func = nfsd_proc_mkdir,
         |                            ^~~~~~~~~~~~~~~
         |                            _proc_mkdir
   include/linux/proc_fs.h:85:24: note: '_proc_mkdir' declared here
      85 | struct proc_dir_entry *_proc_mkdir(const char *, umode_t, struct proc_dir_entry *, void *, bool);
         |                        ^
   fs/nfsd/nfsproc.c:830:14: error: use of undeclared identifier 'nfsd_proc_rmdir'
     830 |                 .pc_func = nfsd_proc_rmdir,
         |                            ^
   fs/nfsd/nfsproc.c:841:14: error: use of undeclared identifier 'nfsd_proc_readdir'
     841 |                 .pc_func = nfsd_proc_readdir,
         |                            ^
   fs/nfsd/nfsproc.c:851:14: error: use of undeclared identifier 'nfsd_proc_statfs'; did you mean 'nfsd_proc_setattr'?
     851 |                 .pc_func = nfsd_proc_statfs,
         |                            ^~~~~~~~~~~~~~~~
         |                            nfsd_proc_setattr
   fs/nfsd/nfsproc.c:75:1: note: 'nfsd_proc_setattr' declared here
      75 | nfsd_proc_setattr(struct svc_rqst *rqstp)
         | ^
   fs/nfsd/nfsproc.c:872:3: error: expected '}'
     872 | };
         |   ^
   fs/nfsd/nfsproc.c:494:1: note: to match this '{'
     494 | {
         | ^
   14 errors generated.


vim +/trace_nfsd_proc_remove +447 fs/nfsd/nfsproc.c

   271	
   272	/*
   273	 * CREATE processing is complicated. The keyword here is `overloaded.'
   274	 * The parent directory is kept locked between the check for existence
   275	 * and the actual create() call in compliance with VFS protocols.
   276	 * N.B. After this call _both_ argp->fh and resp->fh need an fh_put
   277	 */
   278	static __be32
   279	nfsd_proc_create(struct svc_rqst *rqstp)
   280	{
   281		struct nfsd_createargs *argp = rqstp->rq_argp;
   282		struct nfsd_diropres *resp = rqstp->rq_resp;
   283		svc_fh		*dirfhp = &argp->fh;
   284		svc_fh		*newfhp = &resp->fh;
   285		struct iattr	*attr = &argp->attrs;
   286		struct nfsd_attrs attrs = {
   287			.na_iattr	= attr,
   288		};
   289		struct inode	*inode;
   290		struct dentry	*dchild;
   291		int		type, mode;
   292		int		hosterr;
   293		dev_t		rdev = 0, wanted = new_decode_dev(attr->ia_size);
   294	
 > 295		trace_nfsd_proc_create(rqstp, dirfhp, S_IFREG, argp->name, argp->len);
   296	
   297		/* First verify the parent file handle */
   298		resp->status = fh_verify(rqstp, dirfhp, S_IFDIR, NFSD_MAY_EXEC);
   299		if (resp->status != nfs_ok)
   300			goto done; /* must fh_put dirfhp even on error */
   301	
   302		/* Check for NFSD_MAY_WRITE in nfsd_create if necessary */
   303	
   304		resp->status = nfserr_exist;
   305		if (isdotent(argp->name, argp->len))
   306			goto done;
   307		hosterr = fh_want_write(dirfhp);
   308		if (hosterr) {
   309			resp->status = nfserrno(hosterr);
   310			goto done;
   311		}
   312	
   313		inode_lock_nested(dirfhp->fh_dentry->d_inode, I_MUTEX_PARENT);
   314		dchild = lookup_one_len(argp->name, dirfhp->fh_dentry, argp->len);
   315		if (IS_ERR(dchild)) {
   316			resp->status = nfserrno(PTR_ERR(dchild));
   317			goto out_unlock;
   318		}
   319		fh_init(newfhp, NFS_FHSIZE);
   320		resp->status = fh_compose(newfhp, dirfhp->fh_export, dchild, dirfhp);
   321		if (!resp->status && d_really_is_negative(dchild))
   322			resp->status = nfserr_noent;
   323		dput(dchild);
   324		if (resp->status) {
   325			if (resp->status != nfserr_noent)
   326				goto out_unlock;
   327			/*
   328			 * If the new file handle wasn't verified, we can't tell
   329			 * whether the file exists or not. Time to bail ...
   330			 */
   331			resp->status = nfserr_acces;
   332			if (!newfhp->fh_dentry) {
   333				printk(KERN_WARNING 
   334					"nfsd_proc_create: file handle not verified\n");
   335				goto out_unlock;
   336			}
   337		}
   338	
   339		inode = d_inode(newfhp->fh_dentry);
   340	
   341		/* Unfudge the mode bits */
   342		if (attr->ia_valid & ATTR_MODE) {
   343			type = attr->ia_mode & S_IFMT;
   344			mode = attr->ia_mode & ~S_IFMT;
   345			if (!type) {
   346				/* no type, so if target exists, assume same as that,
   347				 * else assume a file */
   348				if (inode) {
   349					type = inode->i_mode & S_IFMT;
   350					switch(type) {
   351					case S_IFCHR:
   352					case S_IFBLK:
   353						/* reserve rdev for later checking */
   354						rdev = inode->i_rdev;
   355						attr->ia_valid |= ATTR_SIZE;
   356	
   357						fallthrough;
   358					case S_IFIFO:
   359						/* this is probably a permission check..
   360						 * at least IRIX implements perm checking on
   361						 *   echo thing > device-special-file-or-pipe
   362						 * by doing a CREATE with type==0
   363						 */
   364						resp->status = nfsd_permission(
   365							&rqstp->rq_cred,
   366							newfhp->fh_export,
   367							newfhp->fh_dentry,
   368							NFSD_MAY_WRITE|NFSD_MAY_LOCAL_ACCESS);
   369						if (resp->status && resp->status != nfserr_rofs)
   370							goto out_unlock;
   371					}
   372				} else
   373					type = S_IFREG;
   374			}
   375		} else if (inode) {
   376			type = inode->i_mode & S_IFMT;
   377			mode = inode->i_mode & ~S_IFMT;
   378		} else {
   379			type = S_IFREG;
   380			mode = 0;	/* ??? */
   381		}
   382	
   383		attr->ia_valid |= ATTR_MODE;
   384		attr->ia_mode = mode;
   385	
   386		/* Special treatment for non-regular files according to the
   387		 * gospel of sun micro
   388		 */
   389		if (type != S_IFREG) {
   390			if (type != S_IFBLK && type != S_IFCHR) {
   391				rdev = 0;
   392			} else if (type == S_IFCHR && !(attr->ia_valid & ATTR_SIZE)) {
   393				/* If you think you've seen the worst, grok this. */
   394				type = S_IFIFO;
   395			} else {
   396				/* Okay, char or block special */
   397				if (!rdev)
   398					rdev = wanted;
   399			}
   400	
   401			/* we've used the SIZE information, so discard it */
   402			attr->ia_valid &= ~ATTR_SIZE;
   403	
   404			/* Make sure the type and device matches */
   405			resp->status = nfserr_exist;
   406			if (inode && inode_wrong_type(inode, type))
   407				goto out_unlock;
   408		}
   409	
   410		resp->status = nfs_ok;
   411		if (!inode) {
   412			/* File doesn't exist. Create it and set attrs */
   413			resp->status = nfsd_create_locked(rqstp, dirfhp, &attrs, type,
   414							  rdev, newfhp);
   415		} else if (type == S_IFREG) {
   416			dprintk("nfsd:   existing %s, valid=%x, size=%ld\n",
   417				argp->name, attr->ia_valid, (long) attr->ia_size);
   418			/* File already exists. We ignore all attributes except
   419			 * size, so that creat() behaves exactly like
   420			 * open(..., O_CREAT|O_TRUNC|O_WRONLY).
   421			 */
   422			attr->ia_valid &= ATTR_SIZE;
   423			if (attr->ia_valid)
   424				resp->status = nfsd_setattr(rqstp, newfhp, &attrs,
   425							    NULL);
   426		}
   427	
   428	out_unlock:
   429		inode_unlock(dirfhp->fh_dentry->d_inode);
   430		fh_drop_write(dirfhp);
   431	done:
   432		fh_put(dirfhp);
   433		if (resp->status != nfs_ok)
   434			goto out;
   435		resp->status = fh_getattr(&resp->fh, &resp->stat);
   436	out:
   437		resp->status = nfsd_map_status(resp->status);
   438		return rpc_success;
   439	}
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
