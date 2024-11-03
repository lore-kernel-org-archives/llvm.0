Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4A613AD38;
	Sun,  3 Nov 2024 05:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730612180; cv=none; b=iRFjmOyVhEZgpQGAc7bRLwIBn+/IWhFy269cTTruCiHgNQaicIjxni/2XecD8FJSTEf3S6dKfxxuZ8c6FaHfKfMxjxKMp74xO30JGrGZpAuowpbCjV4G1GAGXZko1YBqaSFEIaJVkTiHL7gmIdVj5JigmtFaZHGmUX9667MAwYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730612180; c=relaxed/simple;
	bh=0plndJ7lTmZVio7U2C5jBod33oY8Aq5nqvqk94QV5ao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lo1JMOFgcLoFQqSSDIKpKqaToki11mjnBfIoHCqmiQZ4hGuFu2mStidk+AadINEdiL1C64YVip5n1OlkCOEL89pLwffofhBWCf4ezy3pnhbn9q5rt12xtvpjus/jLskopcVDfrJi+RCZKzKrhflPTtsVOFxqFwK4l2vvBjM4u8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XorFf9lK; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XorFf9lK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730612179; x=1762148179;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0plndJ7lTmZVio7U2C5jBod33oY8Aq5nqvqk94QV5ao=;
  b=XorFf9lKqGB5NY312C5mjN9m3vANyQ3lMHrIc7zGX94l7bpboho2vM2m
   5DuvwUFhK76yprW/JeGx4mXVbBnA/VreXTnhmUlAdfhqX5u2b4WwRnIbQ
   sKjPyzoFF/1RWh16V7tbbK2PIDIDFrsbN0lkK6MNvi96WVg0ax16E8RAF
   u6tC1JVmd5pHzsluG3cIfNzUxU5PakLtr9mtiLLtfUHQ9bEhY02P0VVCv
   ydd/SNfLIFsYKbtxryPINkzYJl3x4R00e2GWIdOdBA8w1cxjUtLHqf2pi
   JX5vFRUozUC6llAFWEl3z15sXIm+5AYRTmfH07l4mbG3a/3f2eqPqo7K5
   A==;
X-CSE-ConnectionGUID: J/CXoc2CTKGU/15UJ0UJXA==
X-CSE-MsgGUID: OwAMbiKIS7qukxBRsN8b9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11244"; a="34116951"
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="34116951"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 22:36:17 -0700
X-CSE-ConnectionGUID: rExsGu9wSRiaLLpZura8oA==
X-CSE-MsgGUID: PMyt6+PLSUCb3JoKJ9jhDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="106667130"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Nov 2024 22:36:15 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7THY-000jjD-2J;
	Sun, 03 Nov 2024 05:36:12 +0000
Date: Sun, 3 Nov 2024 13:35:34 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [snitzer:nfs-localio-for-next 25/26] fs/nfsd/filecache.c:843:18:
 error: no member named 'local_clients_lock' in 'struct nfsd_net'
Message-ID: <202411031358.E7Kd2yiu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-next
head:   1a750ba15bb3f764f22fcc9731f8991cba0b084b
commit: 987bb33e11a334f6b224f92ab1f1f6c694eb96ee [25/26] nfs_common: split localio global nfs_uuids_lock
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241103/202411031358.E7Kd2yiu-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411031358.E7Kd2yiu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411031358.E7Kd2yiu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/nfsd/filecache.c:35:
   In file included from include/linux/pagemap.h:8:
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
   In file included from fs/nfsd/filecache.c:42:
   include/linux/nfslocalio.h:105:46: warning: declaration of 'struct nfs_fh' will not be visible outside of this function [-Wvisibility]
     105 | static inline void nfs_close_local_fh(struct nfs_fh *fh)
         |                                              ^
   fs/nfsd/filecache.c:842:3: error: call to undeclared function 'nfs_localio_invalidate_clients'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     842 |                 nfs_localio_invalidate_clients(&nn->local_clients,
         |                 ^
   fs/nfsd/filecache.c:842:39: error: no member named 'local_clients' in 'struct nfsd_net'
     842 |                 nfs_localio_invalidate_clients(&nn->local_clients,
         |                                                 ~~  ^
>> fs/nfsd/filecache.c:843:18: error: no member named 'local_clients_lock' in 'struct nfsd_net'
     843 |                                                &nn->local_clients_lock);
         |                                                 ~~  ^
   5 warnings and 3 errors generated.


vim +843 fs/nfsd/filecache.c

   824	
   825	/**
   826	 * __nfsd_file_cache_purge: clean out the cache for shutdown
   827	 * @net: net-namespace to shut down the cache (may be NULL)
   828	 *
   829	 * Walk the nfsd_file cache and close out any that match @net. If @net is NULL,
   830	 * then close out everything. Called when an nfsd instance is being shut down,
   831	 * and when the exports table is flushed.
   832	 */
   833	static void
   834	__nfsd_file_cache_purge(struct net *net)
   835	{
   836		struct rhashtable_iter iter;
   837		struct nfsd_file *nf;
   838		LIST_HEAD(dispose);
   839	
   840		if (net) {
   841			struct nfsd_net *nn = net_generic(net, nfsd_net_id);
   842			nfs_localio_invalidate_clients(&nn->local_clients,
 > 843						       &nn->local_clients_lock);
   844		}
   845	
   846		rhltable_walk_enter(&nfsd_file_rhltable, &iter);
   847		do {
   848			rhashtable_walk_start(&iter);
   849	
   850			nf = rhashtable_walk_next(&iter);
   851			while (!IS_ERR_OR_NULL(nf)) {
   852				if (!net || nf->nf_net == net)
   853					nfsd_file_cond_queue(nf, &dispose);
   854				nf = rhashtable_walk_next(&iter);
   855			}
   856	
   857			rhashtable_walk_stop(&iter);
   858		} while (nf == ERR_PTR(-EAGAIN));
   859		rhashtable_walk_exit(&iter);
   860	
   861		nfsd_file_dispose_list(&dispose);
   862	}
   863	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
