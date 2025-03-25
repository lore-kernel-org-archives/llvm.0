Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3395F1A08A3;
	Tue, 25 Mar 2025 17:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742922297; cv=none; b=TInkDkAdVNvzxAS7NhHk4rm83MK3gYZ4JJinXDpd2pFth+MYbSYfE5hg2yyyJWmd3ARZjSqXAfmMnWIbGyWKxj+U1+a+Z64u9PTe7kDKlWUG882N4//4EBwG43tLVjqb11Rit3Z3zsqhnZlahSjIl5goR46RfjduUFZDrvw8SJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742922297; c=relaxed/simple;
	bh=nxl/DR/n2BRiTxyRSoamxb6SUvv4f0HearQUwR/JGd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SSrwEIX77pSmlXjbfnPTsIdTLURhoTpobZMa9eFR4c7LtfDV4SGAD00njrPjRJMjCYwQGrY9vD8rLpQfQBOtkC+Br6/uLUvtnRpu+SL+Zj+U/kZTXrUWynIuGEwyPMSTRrtZzYFx+HzgTeA8dAm+9CryiYRSiPxppVHNeNEoNoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C66cUdjA; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C66cUdjA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742922295; x=1774458295;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nxl/DR/n2BRiTxyRSoamxb6SUvv4f0HearQUwR/JGd4=;
  b=C66cUdjAEGO8kIObAQXSOp84s6GO7EivQQhaR8pWcj4kYTcLO+JgNj/q
   3e4MyJ0rPhcFfNHssDRfffGrFyJoX02DDAUjIfqXDuc6QazzCqxdEgzv4
   f1pmx7EMR4xjvU+NZ8EsV44ZKpTfY8P59SOsdg1PqVhy+jBFlw31lshP1
   GXtOgaqAXE8k32fdXzc/TBhh3+e3h/8zZDlNba7sp94BteaJ87ZYj25s4
   5vuu6x7dQDWacgZCt/mmjmWQMWV1czE7NxQIzTl722q/W4aPtga63SNfs
   LnoZLYnDaT5ikUowiChNTcVx8FYI/n2lLMUpDzZJVuO3d+F8mZwbKs2zE
   A==;
X-CSE-ConnectionGUID: umYOb0wURLmBNhlzqsU7hA==
X-CSE-MsgGUID: YnAi4oIwTCOIo35nJsdrBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44363867"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="44363867"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 10:04:54 -0700
X-CSE-ConnectionGUID: +5x37uMHSFyQ5KeROFmgEg==
X-CSE-MsgGUID: Mw57PB4NTRauBLnyUsszyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="125232771"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 25 Mar 2025 10:04:54 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tx7hr-00052V-1E;
	Tue, 25 Mar 2025 17:04:51 +0000
Date: Wed, 26 Mar 2025 01:04:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] nfs: add a refcount tracker for struct net as held by
 the nfs_client
Message-ID: <202503260032.8vbQDxxw-lkp@intel.com>
References: <20250325-nfs-net-nef-v1-1-0142cbd7e9ea@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325-nfs-net-nef-v1-1-0142cbd7e9ea@kernel.org>

Hi Jeff,

kernel test robot noticed the following build errors:

[auto build test ERROR on 38fec10eb60d687e30c8c6b5420d86e8149f7557]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeff-Layton/nfs-add-a-refcount-tracker-for-struct-net-as-held-by-the-nfs_client/20250325-194639
base:   38fec10eb60d687e30c8c6b5420d86e8149f7557
patch link:    https://lore.kernel.org/r/20250325-nfs-net-nef-v1-1-0142cbd7e9ea%40kernel.org
patch subject: [PATCH] nfs: add a refcount tracker for struct net as held by the nfs_client
config: hexagon-randconfig-002-20250325 (https://download.01.org/0day-ci/archive/20250326/202503260032.8vbQDxxw-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250326/202503260032.8vbQDxxw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503260032.8vbQDxxw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nfs/client.c:183:50: error: no member named 'cl_ns_tracker' in 'struct nfs_client'
     183 |         clp->cl_net = get_net_track(cl_init->net, &clp->cl_ns_tracker, GFP_KERNEL);
         |                                                    ~~~  ^
   fs/nfs/client.c:253:35: error: no member named 'cl_ns_track' in 'struct nfs_client'
     253 |         put_net_track(clp->cl_net, &clp->cl_ns_track);
         |                                     ~~~  ^
   2 errors generated.


vim +183 fs/nfs/client.c

   141	
   142	/*
   143	 * Allocate a shared client record
   144	 *
   145	 * Since these are allocated/deallocated very rarely, we don't
   146	 * bother putting them in a slab cache...
   147	 */
   148	struct nfs_client *nfs_alloc_client(const struct nfs_client_initdata *cl_init)
   149	{
   150		struct nfs_client *clp;
   151		int err = -ENOMEM;
   152	
   153		if ((clp = kzalloc(sizeof(*clp), GFP_KERNEL)) == NULL)
   154			goto error_0;
   155	
   156		clp->cl_minorversion = cl_init->minorversion;
   157		clp->cl_nfs_mod = cl_init->nfs_mod;
   158		if (!get_nfs_version(clp->cl_nfs_mod))
   159			goto error_dealloc;
   160	
   161		clp->rpc_ops = clp->cl_nfs_mod->rpc_ops;
   162	
   163		refcount_set(&clp->cl_count, 1);
   164		clp->cl_cons_state = NFS_CS_INITING;
   165	
   166		memcpy(&clp->cl_addr, cl_init->addr, cl_init->addrlen);
   167		clp->cl_addrlen = cl_init->addrlen;
   168	
   169		if (cl_init->hostname) {
   170			err = -ENOMEM;
   171			clp->cl_hostname = kstrdup(cl_init->hostname, GFP_KERNEL);
   172			if (!clp->cl_hostname)
   173				goto error_cleanup;
   174		}
   175	
   176		INIT_LIST_HEAD(&clp->cl_superblocks);
   177		clp->cl_rpcclient = ERR_PTR(-EINVAL);
   178	
   179		clp->cl_flags = cl_init->init_flags;
   180		clp->cl_proto = cl_init->proto;
   181		clp->cl_nconnect = cl_init->nconnect;
   182		clp->cl_max_connect = cl_init->max_connect ? cl_init->max_connect : 1;
 > 183		clp->cl_net = get_net_track(cl_init->net, &clp->cl_ns_tracker, GFP_KERNEL);
   184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
