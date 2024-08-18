Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D046F2114;
	Sun, 18 Aug 2024 00:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723941900; cv=none; b=bs8XcbXn4hGQcdAnBin8OBGzZktKk2gYzzPA8ijflYKxINADtD6+GaKWWjcUtDDooUE2mIfjFYqXOcuIUu6VgC6izc1VJc/6iWvJ1VEJZBvwUkNVt5DJm3w4ryVx/UoKJVTX6j+NZPxON+qEhXGMsSVX0sU0Ho5uX5q+L3Acxgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723941900; c=relaxed/simple;
	bh=/UhXsh26DfOqKj7tIUUWALex5zoG73EYpI5mN1wQxWA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p4odIf96EVX0ADTlJhpMc+/AUgx/l3G2+FBXmDwaLIs4Kg9WKtMniBDkG9VOUAYOvkXKiVWL1auyREgpUhPq9ix4+sxQLKStL6tSvDUg2OFd+1wIPxc0CUM+QT0O58RMVx2OolfRlY1+KCPMDXemvmsSg3SXT0OOjSVu47JWyxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cl8ObTCG; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cl8ObTCG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723941899; x=1755477899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/UhXsh26DfOqKj7tIUUWALex5zoG73EYpI5mN1wQxWA=;
  b=cl8ObTCG1qb+k9/TsKL/Wx2sjN9oDcHcYMWx6mm5e8qRwqlXq/eRhQLx
   nOLL0l16p/4Yd4NO468W3UfhRy1ntNazq7y+4unY2WXN1MQHN2/sTHt2E
   eUU7XdcPeXgL3oa2N54KSRCZioc5rN/GJHi4VpiU8xcg3XdeIAAT3rk6U
   MNIEC3LqEO/+qZHFevtSZZlrCucqg/nk1hB5nPABpBi2fYP7Aj088swvI
   CiHHh7kyGXbnaCFL0xYWZ5t7SunbIA6u9f3JAwwPtPPOXHEB/BJlt3q8N
   bCemDjpZcxgA+vt1tORcvS/TAwKj1215mPADdFJIJZVIVK/m8fgCTYSkR
   A==;
X-CSE-ConnectionGUID: qDwNxT0nS4WpNQ0lElBXWg==
X-CSE-MsgGUID: t/dUz3QbQV6hfUTn9j5a4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="22353974"
X-IronPort-AV: E=Sophos;i="6.10,156,1719903600"; 
   d="scan'208";a="22353974"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2024 17:44:58 -0700
X-CSE-ConnectionGUID: rSSiLEdxToabBwHUxXWDUA==
X-CSE-MsgGUID: j21WO0ULS+2tLJLOHu3o5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,156,1719903600"; 
   d="scan'208";a="64916000"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Aug 2024 17:44:57 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfU2Q-0007v4-1b;
	Sun, 18 Aug 2024 00:44:54 +0000
Date: Sun, 18 Aug 2024 08:44:53 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [snitzer:nfs-localio-for-next-6.11-rc3 26/26]
 fs/nfs/flexfilelayout/flexfilelayout.c:202:7: error: incompatible pointer
 types assigning to 'struct nfsd_file *' from 'struct file *'
Message-ID: <202408180855.uqubJxcG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-next-6.11-rc3
head:   d185b803ff9694a70f39b5e1cf3ea404782ef6dd
commit: d185b803ff9694a70f39b5e1cf3ea404782ef6dd [26/26] nfs: switch client to use nfsd_file for localio
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240818/202408180855.uqubJxcG-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240818/202408180855.uqubJxcG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408180855.uqubJxcG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nfs/flexfilelayout/flexfilelayout.c:202:7: error: incompatible pointer types assigning to 'struct nfsd_file *' from 'struct file *' [-Werror,-Wincompatible-pointer-types]
     202 |                 new = nfs_local_open_fh(clp, cred, fh, mode);
         |                     ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/nfs/flexfilelayout/flexfilelayout.c:213:12: error: no member named 'nfsd_file_get' in 'struct nfs_client'
     213 |         nf = clp->nfsd_file_get(nf);
         |              ~~~  ^
>> fs/nfs/flexfilelayout/flexfilelayout.c:216:8: error: no member named 'nfsd_file_put' in 'struct nfs_client'
     216 |                 clp->nfsd_file_put(new);
         |                 ~~~  ^
   fs/nfs/flexfilelayout/flexfilelayout.c:301:8: error: no member named 'nfsd_file_put' in 'struct nfs_client'
     301 |                 clp->nfsd_file_put(nf);
         |                 ~~~  ^
   fs/nfs/flexfilelayout/flexfilelayout.c:304:8: error: no member named 'nfsd_file_put' in 'struct nfs_client'
     304 |                 clp->nfsd_file_put(nf);
         |                 ~~~  ^
   fs/nfs/flexfilelayout/flexfilelayout.c:590:38: error: no member named 'nfsd_file_put' in 'struct nfs_client'
     590 |                                                 mirror->mirror_ds->ds->ds_clp->nfsd_file_put(nf);
         |                                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ^
   fs/nfs/flexfilelayout/flexfilelayout.c:598:38: error: no member named 'nfsd_file_put' in 'struct nfs_client'
     598 |                                                 mirror->mirror_ds->ds->ds_clp->nfsd_file_put(nf);
         |                                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ^
   fs/nfs/flexfilelayout/flexfilelayout.c:1299:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    1299 |         int err;
         |             ^
   1 warning and 7 errors generated.


vim +202 fs/nfs/flexfilelayout/flexfilelayout.c

d185b803ff9694 Mike Snitzer    2024-08-14  173  
d185b803ff9694 Mike Snitzer    2024-08-14  174  static struct nfsd_file *
341000a1f1d534 Trond Myklebust 2019-11-03  175  ff_local_open_fh(struct pnfs_layout_segment *lseg,
341000a1f1d534 Trond Myklebust 2019-11-03  176  		 u32 ds_idx,
341000a1f1d534 Trond Myklebust 2019-11-03  177  		 struct nfs_client *clp,
341000a1f1d534 Trond Myklebust 2019-11-03  178  		 const struct cred *cred,
341000a1f1d534 Trond Myklebust 2019-11-03  179  		 struct nfs_fh *fh,
341000a1f1d534 Trond Myklebust 2019-11-03  180  		 fmode_t mode)
341000a1f1d534 Trond Myklebust 2019-11-03  181  {
341000a1f1d534 Trond Myklebust 2019-11-03  182  	struct nfs4_ff_layout_mirror *mirror = FF_LAYOUT_COMP(lseg, ds_idx);
d185b803ff9694 Mike Snitzer    2024-08-14  183  	struct nfsd_file *nf, *new, __rcu **pnf;
341000a1f1d534 Trond Myklebust 2019-11-03  184  
341000a1f1d534 Trond Myklebust 2019-11-03  185  	if (!nfs_server_is_local(clp))
341000a1f1d534 Trond Myklebust 2019-11-03  186  		return NULL;
341000a1f1d534 Trond Myklebust 2019-11-03  187  	if (mode & FMODE_WRITE) {
341000a1f1d534 Trond Myklebust 2019-11-03  188  		/*
341000a1f1d534 Trond Myklebust 2019-11-03  189  		 * Always request read and write access since this corresponds
341000a1f1d534 Trond Myklebust 2019-11-03  190  		 * to a rw layout.
341000a1f1d534 Trond Myklebust 2019-11-03  191  		 */
341000a1f1d534 Trond Myklebust 2019-11-03  192  		mode |= FMODE_READ;
d185b803ff9694 Mike Snitzer    2024-08-14  193  		pnf = &mirror->rw_file;
341000a1f1d534 Trond Myklebust 2019-11-03  194  	} else
d185b803ff9694 Mike Snitzer    2024-08-14  195  		pnf = &mirror->ro_file;
341000a1f1d534 Trond Myklebust 2019-11-03  196  
341000a1f1d534 Trond Myklebust 2019-11-03  197  	new = NULL;
341000a1f1d534 Trond Myklebust 2019-11-03  198  	rcu_read_lock();
d185b803ff9694 Mike Snitzer    2024-08-14  199  	nf = rcu_dereference(*pnf);
d185b803ff9694 Mike Snitzer    2024-08-14  200  	if (!nf) {
341000a1f1d534 Trond Myklebust 2019-11-03  201  		rcu_read_unlock();
341000a1f1d534 Trond Myklebust 2019-11-03 @202  		new = nfs_local_open_fh(clp, cred, fh, mode);
341000a1f1d534 Trond Myklebust 2019-11-03  203  		if (IS_ERR(new))
341000a1f1d534 Trond Myklebust 2019-11-03  204  			return NULL;
341000a1f1d534 Trond Myklebust 2019-11-03  205  		rcu_read_lock();
341000a1f1d534 Trond Myklebust 2019-11-03  206  		/* try to swap in the pointer */
d185b803ff9694 Mike Snitzer    2024-08-14  207  		nf = cmpxchg(pnf, NULL, new);
d185b803ff9694 Mike Snitzer    2024-08-14  208  		if (!nf) {
d185b803ff9694 Mike Snitzer    2024-08-14  209  			nf = new;
341000a1f1d534 Trond Myklebust 2019-11-03  210  			new = NULL;
341000a1f1d534 Trond Myklebust 2019-11-03  211  		}
341000a1f1d534 Trond Myklebust 2019-11-03  212  	}
d185b803ff9694 Mike Snitzer    2024-08-14 @213  	nf = clp->nfsd_file_get(nf);
341000a1f1d534 Trond Myklebust 2019-11-03  214  	rcu_read_unlock();
341000a1f1d534 Trond Myklebust 2019-11-03  215  	if (new)
d185b803ff9694 Mike Snitzer    2024-08-14 @216  		clp->nfsd_file_put(new);
d185b803ff9694 Mike Snitzer    2024-08-14  217  	return nf;
341000a1f1d534 Trond Myklebust 2019-11-03  218  }
341000a1f1d534 Trond Myklebust 2019-11-03  219  

:::::: The code at line 202 was first introduced by commit
:::::: 341000a1f1d534755829800b27ffd46890e4fa9e pnfs/flexfiles: enable localio support

:::::: TO: Trond Myklebust <trond.myklebust@hammerspace.com>
:::::: CC: Mike Snitzer <snitzer@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
