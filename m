Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890761F60A;
	Thu, 14 Nov 2024 14:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731594667; cv=none; b=diGcqvL3sm6T7JcT0xyXB4MSy7n+cgJ4TyxEOnOByMHEDsXDGXtsLgFFjGAiiFE9F9FOF4M3hP+R/DsgWaOFTfJ9l+qIiePo6Mv0hRU+DDanwIMaTaY8nj1t9rQdrR2TGGFyQYgYRAslbuY67/zhMUCG/kepIPyNtnCp1FAJL78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731594667; c=relaxed/simple;
	bh=Ulcj3z8+CNtxtG8DxV0Tf0tnfvjmqLGb7ESTmLUruFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NQnNG4Keb/iT4mAF0CJ93j+op3m0DinHYJLKtmXCUp5FKrKON3pMTlcDmoS2LlytBwqz0I3+4C+XyY8c6FYHbIoUC3Rk+Fm///vkEg1B7BsNsO3jLxp7W8ncseTNi7nJ3CCXRfVfxkXrRAqX1w+ux9EH98OX3qyeav7i4AhVOw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VjqILsy2; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VjqILsy2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731594665; x=1763130665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ulcj3z8+CNtxtG8DxV0Tf0tnfvjmqLGb7ESTmLUruFk=;
  b=VjqILsy2bY0kFgN4ZlbOQ8HI7N6pYSR/Pq1OG09nyZL99bLKEc8TgTze
   Re8FNWtGVBiUkiFSGNPI9+a2fHAQxU8Pnho7Nh8tIy+s7I8Zxw0a7T7qK
   o7CPvZhUPslMXhQr+FGI9kIKPg0T2XvMyJ1bTigagE7yMQk9ywf+G4AWz
   3ylyBsGOOH33YOum8ji2h1AmqClLMqV98oCaxggTurH/p0S4dxwBGpp3y
   GDYzsaENuOP6rVR/5EiMmU7wWXWUt94uWmbcwXEkdpJ2B0rsiZZYee++t
   g/c7slJV6/1CyVdDc9eUd0o8ai4kpvDUuWojnGnegLi1TlFShLkYfhOoQ
   g==;
X-CSE-ConnectionGUID: ckiAKUa9Q0K+8day0ZhnFA==
X-CSE-MsgGUID: bKLgftM9RUyzVDyx+fpPfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31439548"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="31439548"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 06:31:03 -0800
X-CSE-ConnectionGUID: 54Rrk5HbRFuSd04yV5Rulw==
X-CSE-MsgGUID: B4PWwqfIQMmmuLuKKicC2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="89000277"
Received: from lkp-server01.sh.intel.com (HELO c7bc087bbc55) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Nov 2024 06:31:02 -0800
Received: from kbuild by c7bc087bbc55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBas7-00005h-2b;
	Thu, 14 Nov 2024 14:30:59 +0000
Date: Thu, 14 Nov 2024 22:30:43 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [snitzer:nfs-localio-for-next 29/31] fs/nfs/client.c:246:2: error:
 call to undeclared function 'nfs_localio_disable_client'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202411142232.cZKw6Pvi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-next
head:   cfedadbf2d21c1e63694d79b40d00573aa80af75
commit: 528d24b1cf5cfdcbb711a1d5de98f94930527ecc [29/31] nfs/localio: remove redundant code and simplify LOCALIO enablement
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241114/202411142232.cZKw6Pvi-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411142232.cZKw6Pvi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411142232.cZKw6Pvi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/nfs/client.c:14:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> fs/nfs/client.c:246:2: error: call to undeclared function 'nfs_localio_disable_client'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     246 |         nfs_localio_disable_client(clp);
         |         ^
   fs/nfs/client.c:246:2: note: did you mean 'nfs_localio_file_init'?
   include/linux/nfs_fs.h:87:20: note: 'nfs_localio_file_init' declared here
      87 | static inline void nfs_localio_file_init(struct nfs_file_localio *nfl)
         |                    ^
   4 warnings and 1 error generated.


vim +/nfs_localio_disable_client +246 fs/nfs/client.c

   240	
   241	/*
   242	 * Destroy a shared client record
   243	 */
   244	void nfs_free_client(struct nfs_client *clp)
   245	{
 > 246		nfs_localio_disable_client(clp);
   247	
   248		/* -EIO all pending I/O */
   249		if (!IS_ERR(clp->cl_rpcclient))
   250			rpc_shutdown_client(clp->cl_rpcclient);
   251	
   252		put_net(clp->cl_net);
   253		put_nfs_version(clp->cl_nfs_mod);
   254		kfree(clp->cl_hostname);
   255		kfree(clp->cl_acceptor);
   256		kfree_rcu(clp, rcu);
   257	}
   258	EXPORT_SYMBOL_GPL(nfs_free_client);
   259	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
