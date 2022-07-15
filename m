Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628DF179
	for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 16:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657902665; x=1689438665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s03CUPHYKCoRdjy8uP3NGHt/qLnJi/3ehlE3QYMjTes=;
  b=dG3nrlbZ9OVtbx/EN1MvOT5UUNcriDoM6CF5O12RqqeK7WIpI9icztQL
   FLNfiF5+2ZqHfz4pkVxTqzyQd5r/9GWF6tUq230XUqIXVqgKMFwGNfC7F
   eqgnqdBNLIrEEs8DhHlguKz2m5VRYjEiRb65cH0rBBM/uorRqxIguxASX
   XpU2zZOUhb3fAFgPLqpY1hBp3ycxSrG/qU9JemJ05RMxy0jeydAMjLNrJ
   t+YmYCJ3io6dyZeR8xG4/T2bneY15OdyNE5v7gYv081//gJJtXObMlCdi
   NJ+Kk5LnPDe9hXGUZamZJHr+o+8QRy9IhtGe2rK/4Up27OcWGBCvyRNO2
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10409"; a="286973113"
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; 
   d="scan'208";a="286973113"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2022 09:30:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; 
   d="scan'208";a="923566705"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Jul 2022 09:30:35 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oCOD4-0000RQ-Ly;
	Fri, 15 Jul 2022 16:30:34 +0000
Date: Sat, 16 Jul 2022 00:29:41 +0800
From: kernel test robot <lkp@intel.com>
To: Dai Ngo <dai.ngo@oracle.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Chuck Lever <chuck.lever@oracle.com>
Subject: [linux-next:master 10517/10906] fs/nfsd/nfsctl.c:1504:17: error: use
 of undeclared identifier 'NFS4_CLIENTS_PER_GB'
Message-ID: <202207160039.bfW3l3uk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6014cfa5bf32cf8c5c58b3cfd5ee0e1542c8a825
commit: 05eaba9bd8c0658004f71e781568f55263da8a64 [10517/10906] NFSD: limit the number of v4 clients to 1024 per 1GB of system memory
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20220716/202207160039.bfW3l3uk-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 2da550140aa98cf6a3e96417c87f1e89e3a26047)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=05eaba9bd8c0658004f71e781568f55263da8a64
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 05eaba9bd8c0658004f71e781568f55263da8a64
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/nfsd/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   fs/nfsd/nfsctl.c:1392:18: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
                   /* last one */ {""}
                                  ^~~~
   fs/nfsd/nfsctl.c:1382:22: note: previous initialization is here
                   [NFSD_Filecache] = {"filecache", &filecache_ops, S_IRUGO},
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/nfsd/nfsctl.c:1504:17: error: use of undeclared identifier 'NFS4_CLIENTS_PER_GB'
           max_clients *= NFS4_CLIENTS_PER_GB;
                          ^
   fs/nfsd/nfsctl.c:1505:49: error: use of undeclared identifier 'NFS4_CLIENTS_PER_GB'
           nn->nfs4_max_clients = max_t(int, max_clients, NFS4_CLIENTS_PER_GB);
                                                          ^
   fs/nfsd/nfsctl.c:1505:49: error: use of undeclared identifier 'NFS4_CLIENTS_PER_GB'
   1 warning and 3 errors generated.


vim +/NFS4_CLIENTS_PER_GB +1504 fs/nfsd/nfsctl.c

  1470	
  1471	static __net_init int nfsd_init_net(struct net *net)
  1472	{
  1473		int retval;
  1474		struct nfsd_net *nn = net_generic(net, nfsd_net_id);
  1475		struct sysinfo si;
  1476		u64 max_clients;
  1477	
  1478		retval = nfsd_export_init(net);
  1479		if (retval)
  1480			goto out_export_error;
  1481		retval = nfsd_idmap_init(net);
  1482		if (retval)
  1483			goto out_idmap_error;
  1484		nn->nfsd_versions = NULL;
  1485		nn->nfsd4_minorversions = NULL;
  1486		retval = nfsd_reply_cache_init(nn);
  1487		if (retval)
  1488			goto out_drc_error;
  1489		nn->nfsd4_lease = 90;	/* default lease time */
  1490		nn->nfsd4_grace = 90;
  1491		nn->somebody_reclaimed = false;
  1492		nn->track_reclaim_completes = false;
  1493		nn->clverifier_counter = prandom_u32();
  1494		nn->clientid_base = prandom_u32();
  1495		nn->clientid_counter = nn->clientid_base + 1;
  1496		nn->s2s_cp_cl_id = nn->clientid_counter++;
  1497	
  1498		get_random_bytes(&nn->siphash_key, sizeof(nn->siphash_key));
  1499		seqlock_init(&nn->writeverf_lock);
  1500	
  1501		atomic_set(&nn->nfs4_client_count, 0);
  1502		si_meminfo(&si);
  1503		max_clients = (u64)si.totalram * si.mem_unit / (1024 * 1024 * 1024);
> 1504		max_clients *= NFS4_CLIENTS_PER_GB;
  1505		nn->nfs4_max_clients = max_t(int, max_clients, NFS4_CLIENTS_PER_GB);
  1506	
  1507		return 0;
  1508	
  1509	out_drc_error:
  1510		nfsd_idmap_shutdown(net);
  1511	out_idmap_error:
  1512		nfsd_export_shutdown(net);
  1513	out_export_error:
  1514		return retval;
  1515	}
  1516	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
