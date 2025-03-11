Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2329263C90;
	Tue, 11 Mar 2025 20:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741726138; cv=none; b=hnON3ASXJQ1biPYKzPwB6IvgRYkT0GI/JQuaE/28qiBpUNc0nI1j8Jo1GqWAsCp9dPXP5b8hx1eAGjSjuahHOUUSwrcp7H7hp5t3qiQ6XBeAcBa4CAQB89W8gJe1dK9Tuvsh1KRjTe/gzbsZbr7R2Jyp2EoqbmwNRvHjY98CatM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741726138; c=relaxed/simple;
	bh=Gv8OdVk281yWEK4gH2tR0XZTbRLp4JKZGF5Aw8j9Thw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UKIBdygBPsre0D9du+unXcOEbi9W2LA0VACroGWsMYiYJt6AaB6xszwCf2evWpXV6KcEwAsLLsDFyShNbwUDbvZz891iL4QsIY64uot/WZQ9ojvW5Q3I1t/NWsCsLWGx7TepQS0zOqeRURruhrnQ3t5RZ+rfkfiEfxAU2Rid+H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EtEa5Bl5; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EtEa5Bl5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741726137; x=1773262137;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gv8OdVk281yWEK4gH2tR0XZTbRLp4JKZGF5Aw8j9Thw=;
  b=EtEa5Bl5tX2fGI+lRd4lw0x/26KoJk4SjEwbJucow/17XERH+9jaMaGT
   4ctef/QWYWvlMAreUUcQrGSoYjf8xyJvdwcocaxCcyUT5d9+W4JPcghZe
   AjktnSIjVGBNhRfxPL8oMUHvhUHuWVZ4icoMPhw5Yqmc70QOr8sc+LXL2
   oujHNXYpSlza3joPT0OEo9WbxBHCHqrN+NyCINjZfNBzQH78dO473OAD1
   H3GIroJgJNDr/wxy0HFyyDxS0ahaDdDDcnXQE8qwjcOyMqZgyENrW4gnp
   eTLhh6VEIqwHO2oW/Ozs+SHSHBZp3360rCYaRV7h3xA7B1asWJH/hwmq8
   A==;
X-CSE-ConnectionGUID: VdrxTSqNRjKiZsoRYceo/Q==
X-CSE-MsgGUID: 0A6CJopvQSCVznwmM8LCwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="45565686"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="45565686"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 13:48:56 -0700
X-CSE-ConnectionGUID: KAiNspcjTzWgKYziKLsGlA==
X-CSE-MsgGUID: 3X5zP5oJSL6lSb9B5HT44Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="157629588"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 11 Mar 2025 13:48:55 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ts6Wy-0007pn-1c;
	Tue, 11 Mar 2025 20:48:52 +0000
Date: Wed, 12 Mar 2025 04:48:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 77/81] fs/nfsd/nfsproc.c:609:9: error: implicit
 declaration of function 'trace_nfsd_proc_readdir'; did you mean
 'nfsd_proc_readdir'?
Message-ID: <202503120409.qVw45sG2-lkp@intel.com>
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
commit: ff1419b2601aa54042da81c8dec9361011dafc84 [77/81] nfsd: add tracepoints for readdir events
config: sparc-randconfig-001-20250311 (https://download.01.org/0day-ci/archive/20250312/202503120409.qVw45sG2-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503120409.qVw45sG2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503120409.qVw45sG2-lkp@intel.com/

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
>> fs/nfsd/nfsproc.c:609:9: error: implicit declaration of function 'trace_nfsd_proc_readdir'; did you mean 'nfsd_proc_readdir'? [-Wimplicit-function-declaration]
     609 |         trace_nfsd_proc_readdir(rqstp, &argp->fh, argp->cookie, argp->count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_readdir
   fs/nfsd/nfsproc.c: In function 'nfsd_proc_symlink':
   fs/nfsd/nfsproc.c:629:1: error: invalid storage class for function 'nfsd_proc_statfs'
     629 | nfsd_proc_statfs(struct svc_rqst *rqstp)
         | ^~~~~~~~~~~~~~~~
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


vim +609 fs/nfsd/nfsproc.c

   598	
   599	/*
   600	 * Read a portion of a directory.
   601	 */
   602	static __be32
   603	nfsd_proc_readdir(struct svc_rqst *rqstp)
   604	{
   605		struct nfsd_readdirargs *argp = rqstp->rq_argp;
   606		struct nfsd_readdirres *resp = rqstp->rq_resp;
   607		loff_t		offset;
   608	
 > 609		trace_nfsd_proc_readdir(rqstp, &argp->fh, argp->cookie, argp->count);
   610	
   611		nfsd_init_dirlist_pages(rqstp, resp, argp->count);
   612	
   613		resp->common.err = nfs_ok;
   614		resp->cookie_offset = 0;
   615		offset = argp->cookie;
   616		resp->status = nfsd_readdir(rqstp, &argp->fh, &offset,
   617					    &resp->common, nfssvc_encode_entry);
   618		nfssvc_encode_nfscookie(resp, offset);
   619	
   620		fh_put(&argp->fh);
   621		resp->status = nfsd_map_status(resp->status);
   622		return rpc_success;
   623	}
   624	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
