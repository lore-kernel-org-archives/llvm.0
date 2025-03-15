Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448631E1020;
	Sat, 15 Mar 2025 08:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742026433; cv=none; b=WasSRHj6F8KCIDlsBiSHNbbUfgjrDwpFA3ElzxWqfvKWEcsPd22iUHpRD3qLsAe0s13Lp95QTcVN1iATia1wF6WMtTRNo5fFwrZiQlcXlIvoe80u+ltT29MOhOhTNXbpa+yxpsH4Z5EgSyOfP5GFNdT46wzXp1B8yT34TVlVKlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742026433; c=relaxed/simple;
	bh=0VpqOXRE1Sat0P3XtoqSfJL7cq/3vpMy8U+CPrIylfg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mabxoaYGslIiRtawcF3WsBflhRfKhWwNjkQ61sqge67oHKzltXT2/uG+T8BtxTWZqSfv9xTFL+OavKjnbYx8SbIHL5rcWgawvcL7jtOz61hRbSgUGKc/1lBoeFR4hebsb+fLz1zEQj9Ip6xyTU78HvJmQnK2HVvEv8QHcLcJ7sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b5VWMY/C; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b5VWMY/C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742026431; x=1773562431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0VpqOXRE1Sat0P3XtoqSfJL7cq/3vpMy8U+CPrIylfg=;
  b=b5VWMY/Cy+jLF0OcKQoLSzr3EZS9YT8wHr9GeOUSLJpP0dmpe2yz+Oll
   ufcqQdy7xkBY6S483sdGvBuUHFh4t91Z72bDxmio9qPZLu4NAxuORvmco
   sqepxxiKEgDvTByMxN/OdmVPV/HjSt5PedAq8qozKd0kLgn1XR3+6bX5x
   +wxLoeExniHgvi+WE0XPfa/HJln75e5Or3EA0vrXeYMjAraS725wZmhjY
   9RB47sX8+t8yvLqGKUdZNaV8MoNKFfKPzZdk4xkXrgYT9ncz/1/MIVxXG
   jBCcySwFbD7PtgHtUlyDUvNqqmtZXeyUwH5GCC6Rn4MMmY6DD8NWyT4SI
   g==;
X-CSE-ConnectionGUID: 02QYBMliQA6hHKsh97c5Zg==
X-CSE-MsgGUID: Idh0BjMMQ1u+UBeDIzI9AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="47079745"
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="47079745"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 01:13:50 -0700
X-CSE-ConnectionGUID: 4mJCDjFeSGyFv1KnlIMl8w==
X-CSE-MsgGUID: 1dK+MnlhTVSZuW4wTQJYzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="122434859"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 15 Mar 2025 01:13:50 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttMeR-000B9n-07;
	Sat, 15 Mar 2025 08:13:47 +0000
Date: Sat, 15 Mar 2025 16:13:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:rpc-shutdown 6/6] fs/nfs/client.c:253:35: error: no member
 named 'cl_ns_track' in 'struct nfs_client'; did you mean 'cl_ns_tracker'?
Message-ID: <202503151606.NmxUS6Ck-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git rpc-shutdown
head:   90f3e7c66179087ea6f82f20f4e4220007bd9628
commit: 90f3e7c66179087ea6f82f20f4e4220007bd9628 [6/6] nfs: add a refcount tracker for struct net as held by the nfs_client
config: x86_64-randconfig-005-20250315 (https://download.01.org/0day-ci/archive/20250315/202503151606.NmxUS6Ck-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503151606.NmxUS6Ck-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503151606.NmxUS6Ck-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nfs/client.c:253:35: error: no member named 'cl_ns_track' in 'struct nfs_client'; did you mean 'cl_ns_tracker'?
     253 |         put_net_track(clp->cl_net, &clp->cl_ns_track);
         |                                          ^~~~~~~~~~~
         |                                          cl_ns_tracker
   include/linux/nfs_fs_sb.h:127:17: note: 'cl_ns_tracker' declared here
     127 |         netns_tracker           cl_ns_tracker;
         |                                 ^
   1 error generated.


vim +253 fs/nfs/client.c

   241	
   242	/*
   243	 * Destroy a shared client record
   244	 */
   245	void nfs_free_client(struct nfs_client *clp)
   246	{
   247		nfs_localio_disable_client(clp);
   248	
   249		/* -EIO all pending I/O */
   250		if (!IS_ERR(clp->cl_rpcclient))
   251			rpc_shutdown_client(clp->cl_rpcclient);
   252	
 > 253		put_net_track(clp->cl_net, &clp->cl_ns_track);
   254		put_nfs_version(clp->cl_nfs_mod);
   255		kfree(clp->cl_hostname);
   256		kfree(clp->cl_acceptor);
   257		kfree_rcu(clp, rcu);
   258	}
   259	EXPORT_SYMBOL_GPL(nfs_free_client);
   260	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
