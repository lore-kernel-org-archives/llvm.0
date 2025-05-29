Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F44A1E4AE;
	Thu, 29 May 2025 01:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748482459; cv=none; b=pJ75JsigE9gZQA2Ko1DUgHhp9AN0Yxjvt2t/JPKl5xKuNzcDeKjvbnqdO8yM8HdFUabRZD5GC7QEac1OvETHaxlE0QrYGTcz/2sUPQRL0pO/WqGXEWsFQO5AFeYDdvOWW8o4/qD7FLr/IhpW0xNgrpi5uMciacdEL8HESDeUH3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748482459; c=relaxed/simple;
	bh=SgksimvIH6IgWYVnP1z+45sHRMo3RLhe0qAvEqymGQg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k6uC/uRepOg72HhIlIkh1br53hTe+LbM2hUxrq2zFEv1Vtj/dlVreOwZN1DYtlfWtgXfm9NAWFgcqianAhCQz9xGmwIQIH+oSYYMEaTeqiM87UW5Sg1oIGMlCYnFfPIfndCvnRYHeBZZzmmBxM9r8puB0dt36XJ1Sh14sMQyK5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VBMxL/ST; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VBMxL/ST"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748482457; x=1780018457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SgksimvIH6IgWYVnP1z+45sHRMo3RLhe0qAvEqymGQg=;
  b=VBMxL/STToXjBTcnnXIB61kk8CQo5KDudQc3sQA2IA2Z8aVJeO9t+psv
   /VTiQP46ovhds9CP6zksiOZHXPvC8q8iP9t4tLai4ILArYq8gsnLbUMpe
   GslcrNWFLncVIAQVXVVGQ2DphOLO35RQbIZC7xQkhlXpLnn2ZRz5G01Xf
   FXlubUYlfpHae+tR5kiMCdXxKDY2Y/7Dhx2EiSp/DGo96UcnHWX3mUck8
   l10zjTOZDZMFZyXJ9K4CQDpcCOj57ANI4ycELmV7HvE8g1Ulf4AQQX196
   V7y9+bYSTkIU29PWXHafMwVnqXY4j9R+4T044NCZpCsWkH6UhNptduvvK
   w==;
X-CSE-ConnectionGUID: uZDmD7yzSPC42zTYuyXnrg==
X-CSE-MsgGUID: s14cSyibTyqgL1XIm3NP8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="49644094"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="49644094"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 18:34:14 -0700
X-CSE-ConnectionGUID: HN9etenJRCKJn1HHO1JR7A==
X-CSE-MsgGUID: PHeTpjfjScivypcUXuUJbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="148268388"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 May 2025 18:34:12 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKS9q-000WDM-1g;
	Thu, 29 May 2025 01:34:10 +0000
Date: Thu, 29 May 2025 09:34:01 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neil@brown.name>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Anna Schumaker <anna.schumaker@oracle.com>
Subject: [anna-nfs:linux-next 29/30] fs/nfsd/localio.c:51: warning: Function
 parameter or struct member 'pnf' not described in 'nfsd_open_local_fh'
Message-ID: <202505290944.9JSrE1CN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.linux-nfs.org/projects/anna/linux-nfs.git linux-next
head:   e3e3775392f3f0f3e3044f8c162bf47858e01759
commit: c25a89770d1f216dcedfc2d25d56b604f62ce0bd [29/30] nfs_localio: change nfsd_file_put_local() to take a pointer to __rcu pointer
config: i386-buildonly-randconfig-006-20250529 (https://download.01.org/0day-ci/archive/20250529/202505290944.9JSrE1CN-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505290944.9JSrE1CN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505290944.9JSrE1CN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfsd/localio.c:51: warning: Function parameter or struct member 'pnf' not described in 'nfsd_open_local_fh'
>> fs/nfsd/localio.c:51: warning: Excess function parameter 'nfp' description in 'nfsd_open_local_fh'


vim +51 fs/nfsd/localio.c

fa4983862e506d Weston Andros Adamson 2024-09-05   26  
fa4983862e506d Weston Andros Adamson 2024-09-05   27  /**
fa4983862e506d Weston Andros Adamson 2024-09-05   28   * nfsd_open_local_fh - lookup a local filehandle @nfs_fh and map to nfsd_file
fa4983862e506d Weston Andros Adamson 2024-09-05   29   *
fa4983862e506d Weston Andros Adamson 2024-09-05   30   * @net: 'struct net' to get the proper nfsd_net required for LOCALIO access
fa4983862e506d Weston Andros Adamson 2024-09-05   31   * @dom: 'struct auth_domain' required for LOCALIO access
fa4983862e506d Weston Andros Adamson 2024-09-05   32   * @rpc_clnt: rpc_clnt that the client established
fa4983862e506d Weston Andros Adamson 2024-09-05   33   * @cred: cred that the client established
fa4983862e506d Weston Andros Adamson 2024-09-05   34   * @nfs_fh: filehandle to lookup
e6f7e1487ab528 NeilBrown             2025-05-09   35   * @nfp: place to find the nfsd_file, or store it if it was non-NULL
fa4983862e506d Weston Andros Adamson 2024-09-05   36   * @fmode: fmode_t to use for open
fa4983862e506d Weston Andros Adamson 2024-09-05   37   *
fa4983862e506d Weston Andros Adamson 2024-09-05   38   * This function maps a local fh to a path on a local filesystem.
fa4983862e506d Weston Andros Adamson 2024-09-05   39   * This is useful when the nfs client has the local server mounted - it can
fa4983862e506d Weston Andros Adamson 2024-09-05   40   * avoid all the NFS overhead with reads, writes and commits.
fa4983862e506d Weston Andros Adamson 2024-09-05   41   *
fa4983862e506d Weston Andros Adamson 2024-09-05   42   * On successful return, returned nfsd_file will have its nf_net member
e1943f4eb8d531 Mike Snitzer          2024-11-15   43   * set. Caller (NFS client) is responsible for calling nfsd_net_put and
65f2a5c366353d Mike Snitzer          2024-10-03   44   * nfsd_file_put (via nfs_to_nfsd_file_put_local).
fa4983862e506d Weston Andros Adamson 2024-09-05   45   */
e6f7e1487ab528 NeilBrown             2025-05-09   46  static struct nfsd_file *
fa4983862e506d Weston Andros Adamson 2024-09-05   47  nfsd_open_local_fh(struct net *net, struct auth_domain *dom,
fa4983862e506d Weston Andros Adamson 2024-09-05   48  		   struct rpc_clnt *rpc_clnt, const struct cred *cred,
e6f7e1487ab528 NeilBrown             2025-05-09   49  		   const struct nfs_fh *nfs_fh, struct nfsd_file __rcu **pnf,
e6f7e1487ab528 NeilBrown             2025-05-09   50  		   const fmode_t fmode)
fa4983862e506d Weston Andros Adamson 2024-09-05  @51  {
fa4983862e506d Weston Andros Adamson 2024-09-05   52  	int mayflags = NFSD_MAY_LOCALIO;
fa4983862e506d Weston Andros Adamson 2024-09-05   53  	struct svc_cred rq_cred;
fa4983862e506d Weston Andros Adamson 2024-09-05   54  	struct svc_fh fh;
fa4983862e506d Weston Andros Adamson 2024-09-05   55  	struct nfsd_file *localio;
fa4983862e506d Weston Andros Adamson 2024-09-05   56  	__be32 beres;
fa4983862e506d Weston Andros Adamson 2024-09-05   57  
fa4983862e506d Weston Andros Adamson 2024-09-05   58  	if (nfs_fh->size > NFS4_FHSIZE)
fa4983862e506d Weston Andros Adamson 2024-09-05   59  		return ERR_PTR(-EINVAL);
fa4983862e506d Weston Andros Adamson 2024-09-05   60  
77e82fb2c6c27c NeilBrown             2025-05-09   61  	if (!nfsd_net_try_get(net))
77e82fb2c6c27c NeilBrown             2025-05-09   62  		return ERR_PTR(-ENXIO);
77e82fb2c6c27c NeilBrown             2025-05-09   63  
e6f7e1487ab528 NeilBrown             2025-05-09   64  	rcu_read_lock();
e6f7e1487ab528 NeilBrown             2025-05-09   65  	localio = nfsd_file_get(rcu_dereference(*pnf));
e6f7e1487ab528 NeilBrown             2025-05-09   66  	rcu_read_unlock();
e6f7e1487ab528 NeilBrown             2025-05-09   67  	if (localio)
e6f7e1487ab528 NeilBrown             2025-05-09   68  		return localio;
e6f7e1487ab528 NeilBrown             2025-05-09   69  
fa4983862e506d Weston Andros Adamson 2024-09-05   70  	/* nfs_fh -> svc_fh */
fa4983862e506d Weston Andros Adamson 2024-09-05   71  	fh_init(&fh, NFS4_FHSIZE);
fa4983862e506d Weston Andros Adamson 2024-09-05   72  	fh.fh_handle.fh_size = nfs_fh->size;
fa4983862e506d Weston Andros Adamson 2024-09-05   73  	memcpy(fh.fh_handle.fh_raw, nfs_fh->data, nfs_fh->size);
fa4983862e506d Weston Andros Adamson 2024-09-05   74  
fa4983862e506d Weston Andros Adamson 2024-09-05   75  	if (fmode & FMODE_READ)
fa4983862e506d Weston Andros Adamson 2024-09-05   76  		mayflags |= NFSD_MAY_READ;
fa4983862e506d Weston Andros Adamson 2024-09-05   77  	if (fmode & FMODE_WRITE)
fa4983862e506d Weston Andros Adamson 2024-09-05   78  		mayflags |= NFSD_MAY_WRITE;
fa4983862e506d Weston Andros Adamson 2024-09-05   79  
fa4983862e506d Weston Andros Adamson 2024-09-05   80  	svcauth_map_clnt_to_svc_cred_local(rpc_clnt, cred, &rq_cred);
fa4983862e506d Weston Andros Adamson 2024-09-05   81  
fa4983862e506d Weston Andros Adamson 2024-09-05   82  	beres = nfsd_file_acquire_local(net, &rq_cred, dom,
fa4983862e506d Weston Andros Adamson 2024-09-05   83  					&fh, mayflags, &localio);
fa4983862e506d Weston Andros Adamson 2024-09-05   84  	if (beres)
fa4983862e506d Weston Andros Adamson 2024-09-05   85  		localio = ERR_PTR(nfs_stat_to_errno(be32_to_cpu(beres)));
fa4983862e506d Weston Andros Adamson 2024-09-05   86  
fa4983862e506d Weston Andros Adamson 2024-09-05   87  	fh_put(&fh);
fa4983862e506d Weston Andros Adamson 2024-09-05   88  	if (rq_cred.cr_group_info)
fa4983862e506d Weston Andros Adamson 2024-09-05   89  		put_group_info(rq_cred.cr_group_info);
fa4983862e506d Weston Andros Adamson 2024-09-05   90  
e6f7e1487ab528 NeilBrown             2025-05-09   91  	if (!IS_ERR(localio)) {
e6f7e1487ab528 NeilBrown             2025-05-09   92  		struct nfsd_file *new;
e6f7e1487ab528 NeilBrown             2025-05-09   93  		if (!nfsd_net_try_get(net)) {
e6f7e1487ab528 NeilBrown             2025-05-09   94  			nfsd_file_put(localio);
e6f7e1487ab528 NeilBrown             2025-05-09   95  			nfsd_net_put(net);
e6f7e1487ab528 NeilBrown             2025-05-09   96  			return ERR_PTR(-ENXIO);
e6f7e1487ab528 NeilBrown             2025-05-09   97  		}
e6f7e1487ab528 NeilBrown             2025-05-09   98  		nfsd_file_get(localio);
e6f7e1487ab528 NeilBrown             2025-05-09   99  	again:
e6f7e1487ab528 NeilBrown             2025-05-09  100  		new = unrcu_pointer(cmpxchg(pnf, NULL, RCU_INITIALIZER(localio)));
e6f7e1487ab528 NeilBrown             2025-05-09  101  		if (new) {
e6f7e1487ab528 NeilBrown             2025-05-09  102  			/* Some other thread installed an nfsd_file */
e6f7e1487ab528 NeilBrown             2025-05-09  103  			if (nfsd_file_get(new) == NULL)
e6f7e1487ab528 NeilBrown             2025-05-09  104  				goto again;
e6f7e1487ab528 NeilBrown             2025-05-09  105  			/*
e6f7e1487ab528 NeilBrown             2025-05-09  106  			 * Drop the ref we were going to install and the
e6f7e1487ab528 NeilBrown             2025-05-09  107  			 * one we were going to return.
e6f7e1487ab528 NeilBrown             2025-05-09  108  			 */
e6f7e1487ab528 NeilBrown             2025-05-09  109  			nfsd_file_put(localio);
e6f7e1487ab528 NeilBrown             2025-05-09  110  			nfsd_file_put(localio);
e6f7e1487ab528 NeilBrown             2025-05-09  111  			localio = new;
e6f7e1487ab528 NeilBrown             2025-05-09  112  		}
e6f7e1487ab528 NeilBrown             2025-05-09  113  	} else
77e82fb2c6c27c NeilBrown             2025-05-09  114  		nfsd_net_put(net);
77e82fb2c6c27c NeilBrown             2025-05-09  115  
fa4983862e506d Weston Andros Adamson 2024-09-05  116  	return localio;
fa4983862e506d Weston Andros Adamson 2024-09-05  117  }
e6f7e1487ab528 NeilBrown             2025-05-09  118  

:::::: The code at line 51 was first introduced by commit
:::::: fa4983862e506d395acc1b8d14dbebf63acc2e82 nfsd: add LOCALIO support

:::::: TO: Weston Andros Adamson <dros@primarydata.com>
:::::: CC: Anna Schumaker <anna.schumaker@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
