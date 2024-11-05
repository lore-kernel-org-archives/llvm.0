Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C40EB667;
	Tue,  5 Nov 2024 12:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730809230; cv=none; b=ETkdsDwIXKMFoLzOghkMvTVFwzc41VSHC80Fvphxpk8d3Y7Xuk1WO2jIGDNLcVbF1VEiiiWy/FNyWK4syXIWHfLN4BEsEsYXaiGU9cX70YQs+ru3F85oQgYRvIMMhw3dfnkLMLt8igOKGQsUNVdJ1UjBzkcEpiSS6ZRbBsOZaAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730809230; c=relaxed/simple;
	bh=OkyMVrub7CO2OsJIoTInqu3RrHECFKCe0mL/dJBEQBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QucyrCxd52wvsAFxOavFv72fkceW/VGZEew95Rv2+bJoiCEUKfLHtZAMn0e8VhcKaXl5rQRcS/KCRum3u7P6UCXHVE/reYJ7dgG2aSnKoeb0BU7pn/wXHNz8Q5Pu3jTCdyu3v13nfyQbekn0xCdRTbTKjyrRmUFAhRxuUPRVYE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lUgnqgpC; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lUgnqgpC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730809229; x=1762345229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OkyMVrub7CO2OsJIoTInqu3RrHECFKCe0mL/dJBEQBQ=;
  b=lUgnqgpClZRL0gZi3JlzTXCcGa3wXPmIxyaPmbwIMsMdumbXaAT7UDLq
   FDrzbcf9uLYKhDt597QGDfwHaDsMDV9diFoPF5DWnwaYLMuUmKgIS9xVR
   mmkRc5hw7ThbfK+tuBwHgriTfARxPP9EWJdw2WvQ3ZW6JgK2RmXM1P2xO
   MEymEv0UYAHzLe3YfC15D7krzOvQSSSb8G4jpITyKNEH1CV1ZBZK1ymbg
   4kdBeLrWNBqOxD28Qo8SSmr32iuRB+VZ2i5N5jq5wLRc9JtZWxljzJQMy
   y1KPbM8mh+AHzxTjdVTS8sOG33YuF0y0/0cfTYZfhO8IFe9Ip4xRrcan8
   g==;
X-CSE-ConnectionGUID: uYTx+fi4R9+2ISfkoIAQ0g==
X-CSE-MsgGUID: eJ/9J2nYRH6o/5HgftvHCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="29974794"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="29974794"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 04:20:28 -0800
X-CSE-ConnectionGUID: W60+Z2hKSK6NPX4EELgZaw==
X-CSE-MsgGUID: cdNw6qwSTjCATOiXWsmkTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="83889340"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Nov 2024 04:20:27 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8IXo-000m27-1e;
	Tue, 05 Nov 2024 12:20:24 +0000
Date: Tue, 5 Nov 2024 20:19:58 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [snitzer:nfs-localio-for-next 18/25]
 fs/nfs/flexfilelayout/flexfilelayout.c:1820:28: warning: variable 'localio'
 is uninitialized when used here
Message-ID: <202411052024.sfvv6H5T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-next
head:   60327faea8241afe7f5f767875c53d24b3f18898
commit: b3cb8507b0e49dad538a558b09a2896b808f91ea [18/25] nfs: cache all open LOCALIO nfsd_file(s) in client
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241105/202411052024.sfvv6H5T-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411052024.sfvv6H5T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411052024.sfvv6H5T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/nfs/flexfilelayout/flexfilelayout.c:10:
   In file included from include/linux/nfs_fs.h:23:
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
   fs/nfs/flexfilelayout/flexfilelayout.c:1223:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    1223 |         int err;
         |             ^
>> fs/nfs/flexfilelayout/flexfilelayout.c:1820:28: warning: variable 'localio' is uninitialized when used here [-Wuninitialized]
    1820 |                           0, RPC_TASK_SOFTCONN, localio);
         |                                                 ^~~~~~~
   fs/nfs/flexfilelayout/flexfilelayout.c:1760:27: note: initialize the variable 'localio' to silence this warning
    1760 |         struct nfsd_file *localio;
         |                                  ^
         |                                   = NULL
   fs/nfs/flexfilelayout/flexfilelayout.c:1899:31: warning: variable 'localio' is uninitialized when used here [-Wuninitialized]
    1899 |                           sync, RPC_TASK_SOFTCONN, localio);
         |                                                    ^~~~~~~
   fs/nfs/flexfilelayout/flexfilelayout.c:1840:27: note: initialize the variable 'localio' to silence this warning
    1840 |         struct nfsd_file *localio;
         |                                  ^
         |                                   = NULL
   fs/nfs/flexfilelayout/flexfilelayout.c:1985:32: warning: variable 'localio' is uninitialized when used here [-Wuninitialized]
    1985 |                                    how, RPC_TASK_SOFTCONN, localio);
         |                                                            ^~~~~~~
   fs/nfs/flexfilelayout/flexfilelayout.c:1933:27: note: initialize the variable 'localio' to silence this warning
    1933 |         struct nfsd_file *localio;
         |                                  ^
         |                                   = NULL
   8 warnings generated.


vim +/localio +1820 fs/nfs/flexfilelayout/flexfilelayout.c

d488b9d01fbc2f Trond Myklebust 2024-09-05  1815  
d67ae825a59d63 Tom Haynes      2014-12-11  1816  	/* Perform an asynchronous read to ds */
d67ae825a59d63 Tom Haynes      2014-12-11  1817  	nfs_initiate_pgio(ds_clnt, hdr, ds_cred, ds->ds_clp->rpc_ops,
d67ae825a59d63 Tom Haynes      2014-12-11  1818  			  vers == 3 ? &ff_layout_read_call_ops_v3 :
d67ae825a59d63 Tom Haynes      2014-12-11  1819  				      &ff_layout_read_call_ops_v4,
d488b9d01fbc2f Trond Myklebust 2024-09-05 @1820  			  0, RPC_TASK_SOFTCONN, localio);
a52458b48af142 NeilBrown       2018-12-03  1821  	put_cred(ds_cred);
d67ae825a59d63 Tom Haynes      2014-12-11  1822  	return PNFS_ATTEMPTED;
d67ae825a59d63 Tom Haynes      2014-12-11  1823  
d67ae825a59d63 Tom Haynes      2014-12-11  1824  out_failed:
3b13b4b311a508 Tom Haynes      2016-05-17  1825  	if (ff_layout_avoid_mds_available_ds(lseg))
d67ae825a59d63 Tom Haynes      2014-12-11  1826  		return PNFS_TRY_AGAIN;
d5b9216fd5114b Trond Myklebust 2019-07-18  1827  	trace_pnfs_mds_fallback_read_pagelist(hdr->inode,
d5b9216fd5114b Trond Myklebust 2019-07-18  1828  			hdr->args.offset, hdr->args.count,
d5b9216fd5114b Trond Myklebust 2019-07-18  1829  			IOMODE_READ, NFS_I(hdr->inode)->layout, lseg);
d67ae825a59d63 Tom Haynes      2014-12-11  1830  	return PNFS_NOT_ATTEMPTED;
d67ae825a59d63 Tom Haynes      2014-12-11  1831  }
d67ae825a59d63 Tom Haynes      2014-12-11  1832  

:::::: The code at line 1820 was first introduced by commit
:::::: d488b9d01fbc2ff5ccf15bcd47422eb156726c0d pnfs/flexfiles: enable localio support

:::::: TO: Trond Myklebust <trond.myklebust@hammerspace.com>
:::::: CC: Anna Schumaker <anna.schumaker@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
