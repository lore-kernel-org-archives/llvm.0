Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB16143C7E;
	Fri,  1 Nov 2024 06:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730442619; cv=none; b=A0dnkOeX5GQYbGl1Ce8GgJGuQQJOJSqBLkxJzCFulu61uTCPvV3MvKnDIzqKrEHrIutbaoNS9NuArLgoqDrS2BWn/2zzeIVxp8Dijoqx8HQqRmYQVrkpV5kO75On3gnxRzLWRjLe+t9MRQtOUbtSjwDA64JYYEl9YYzm/73zm6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730442619; c=relaxed/simple;
	bh=KuYa/8PRXOVFBFQTEIySjZ4SyCDmLcX1fAyctT/KcqU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AaowNRD+xdpUlciukxDk5HqXS2o54Apu1JMXmAxCag7k3jtHFSCXY1Fd79A+hod3ek4CBz3SdkgKn2JW66tlMGwSHblpvxK8wxvJUfuc3Fa3MaadDe79w3x75ZQHfIQr+dyxFcXsQ1eAGti+uZLJO0qOpZcG7Ccf8r+l1VcpmPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UFVbQHAu; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UFVbQHAu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730442614; x=1761978614;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KuYa/8PRXOVFBFQTEIySjZ4SyCDmLcX1fAyctT/KcqU=;
  b=UFVbQHAu7N1DGllU4AV1YzXhKzFuSuquyPjeUeYqGXcncF68nvdkp22F
   szE1LqiDcoqsGnayLh6K0sJGIYZporSpimZqAHeIzfpQ2sIJHmvy9IcoZ
   60dyiE7E+J6j6sV+miIpgOzyKEqIm0iE64VEeficsRqL/hIwnw67yjD2L
   G45YZqi8IwfLT1Z/bmbazH0r1WBD/D+2VA28k4PcZAJPf1QBSdcW1MRz0
   MZdhksp1JJv05WHWFQLEF4EfqPPqL+gnEfZHoiWi6yCw3jg/U6k6f8qJv
   iYRn2AkMDnR0FSrKnADcUjx8bpfHMUst1AeYtzZ8WN5oZmWlFmnKdkvu0
   Q==;
X-CSE-ConnectionGUID: UN1VZ/CyRyGOijbadv8kFg==
X-CSE-MsgGUID: m8WgAa4iSaK7Xb8JA/c5mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="17839798"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="17839798"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 23:30:11 -0700
X-CSE-ConnectionGUID: xEgji2rCQmiBoNmriYIxLA==
X-CSE-MsgGUID: uvZcfqGNSUiMOmckZGGo/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="87470468"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 31 Oct 2024 23:30:10 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6lAe-000hDu-05;
	Fri, 01 Nov 2024 06:30:08 +0000
Date: Fri, 1 Nov 2024 14:30:02 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [snitzer:nfs-localio-for-next 22/23] fs/nfsd/filecache.c:842:3:
 error: call to undeclared function 'nfs_localio_invalidate_clients'; ISO C99
 and later do not support implicit function declarations
Message-ID: <202411011441.s36Lqszr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-next
head:   cdfa872ee25377e6ceb6e73f695e19c903b38608
commit: 27f81c6a85b36d6948b768cc1ec584b92fe7ee30 [22/23] nfs_common: track all open nfsd_files per nfs_client
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241101/202411011441.s36Lqszr-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411011441.s36Lqszr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411011441.s36Lqszr-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

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
>> include/linux/nfslocalio.h:89:46: warning: declaration of 'struct nfs_fh' will not be visible outside of this function [-Wvisibility]
      89 | static inline void nfs_close_local_fh(struct nfs_fh *fh)
         |                                              ^
>> fs/nfsd/filecache.c:842:3: error: call to undeclared function 'nfs_localio_invalidate_clients'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     842 |                 nfs_localio_invalidate_clients(&nn->local_clients);
         |                 ^
>> fs/nfsd/filecache.c:842:39: error: no member named 'local_clients' in 'struct nfsd_net'
     842 |                 nfs_localio_invalidate_clients(&nn->local_clients);
         |                                                 ~~  ^
   5 warnings and 2 errors generated.


vim +/nfs_localio_invalidate_clients +842 fs/nfsd/filecache.c

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
 > 842			nfs_localio_invalidate_clients(&nn->local_clients);
   843		}
   844	
   845		rhltable_walk_enter(&nfsd_file_rhltable, &iter);
   846		do {
   847			rhashtable_walk_start(&iter);
   848	
   849			nf = rhashtable_walk_next(&iter);
   850			while (!IS_ERR_OR_NULL(nf)) {
   851				if (!net || nf->nf_net == net)
   852					nfsd_file_cond_queue(nf, &dispose);
   853				nf = rhashtable_walk_next(&iter);
   854			}
   855	
   856			rhashtable_walk_stop(&iter);
   857		} while (nf == ERR_PTR(-EAGAIN));
   858		rhashtable_walk_exit(&iter);
   859	
   860		nfsd_file_dispose_list(&dispose);
   861	}
   862	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
