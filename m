Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B78F199FB0;
	Sat,  7 Feb 2026 01:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770427496; cv=none; b=oZi4emsgr0DIIvk12UDVFRaValFSvgZVTm0BTPTyr8yCs6Zxj1Vz23i0XS6a0aAS7lQ4wLy/opWIR+vlJH0DqVOMkVnpnGxnG2VG5iq4OTSxVaFTORPV2xnBD5+QZxVd54q7QKA8HpiUDXa8VkSbrzo5o+y6GjRvw0rRg/3jLTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770427496; c=relaxed/simple;
	bh=UV2CbUZlxksTUJZFXxCJmuPK9FANc5/pG+zvA6ZHauE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PL3bZUtGZLvo7gNfYjE3NREXh0uUCIY5Tr+QXD3447iHmGwHKMWwInVzvPOOLL95BLOk9znVsaXj6Bllrw2crJK20G9WAtOzzVziW7+NRJwRGTjGy2bN4s4DoSDV8lD588RhUxOhYi+UkjuJ6AzcQYkt3N95kY4ptoBnzysY1Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wv3Ow/qX; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wv3Ow/qX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770427496; x=1801963496;
  h=date:from:to:cc:subject:message-id;
  bh=UV2CbUZlxksTUJZFXxCJmuPK9FANc5/pG+zvA6ZHauE=;
  b=Wv3Ow/qXKWjmxvyghwNtVvj786Opf9R1chBKAGtR0cuEJ0oJy0KDlO2i
   kB7cg1QgWh4InB5Lp06EgZuy33zpZvFEXHtdXbiyxESdYU23U8iXjGa/B
   Ab7brdoe9PKPuB1VZeEPEUxVINnnSk70peyMc7U0YNlPquEHkoknmzasw
   Z4/cxPjGiIhGgh2d253bHBOb11oLROnZfhJCEo75L/l/XttUSFHx//EYE
   lZvCFw14m7TfMRP285eev61oAyMcNiZu2uMSCT+6savDRonhTfwPuC9QL
   0r96BC5QWBgthuNCACG/a3/+1YBF5zwcfpnzxaCPOG5z25qCqpuVz7GV+
   g==;
X-CSE-ConnectionGUID: ETnCtZ+8RLaTYfDy+2QPpA==
X-CSE-MsgGUID: knowTbZuTVmbPrvJdHkReQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="75488589"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="75488589"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 17:24:55 -0800
X-CSE-ConnectionGUID: hDXRMR16RhuxKJ7ULW0Frw==
X-CSE-MsgGUID: vXKGNptVTFe0PnVsaY0Ztw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="210783982"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 06 Feb 2026 17:24:54 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voX47-000000004ld-3mrt;
	Sat, 07 Feb 2026 01:24:51 +0000
Date: Sat, 07 Feb 2026 02:24:34 +0100
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:exportd-netlink 2/3] fs/nfsd/nfsctl.c:2270:33:
 error: use of undeclared identifier 'exportd_nl_family'; did you mean
 'nfsd_nl_family'?
Message-ID: <202602070201.brMUyB8k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git exportd-netlink
head:   aef82be579c01a1995f0e0c98313f23e7e4893a0
commit: c282986480c6eb27e2330e62a435fdba93b42f32 [2/3] nfsd: register new netlink family for exportd
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260207/202602070201.brMUyB8k-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070201.brMUyB8k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602070201.brMUyB8k-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nfsd/nfsctl.c:2270:33: error: use of undeclared identifier 'exportd_nl_family'; did you mean 'nfsd_nl_family'?
    2270 |         retval = genl_register_family(&exportd_nl_family);
         |                                        ^~~~~~~~~~~~~~~~~
         |                                        nfsd_nl_family
   fs/nfsd/netlink.h:30:27: note: 'nfsd_nl_family' declared here
      30 | extern struct genl_family nfsd_nl_family;
         |                           ^
   fs/nfsd/nfsctl.c:2280:26: error: use of undeclared identifier 'exportd_nl_family'; did you mean 'nfsd_nl_family'?
    2280 |         genl_unregister_family(&exportd_nl_family);
         |                                 ^~~~~~~~~~~~~~~~~
         |                                 nfsd_nl_family
   fs/nfsd/netlink.h:30:27: note: 'nfsd_nl_family' declared here
      30 | extern struct genl_family nfsd_nl_family;
         |                           ^
   fs/nfsd/nfsctl.c:2306:26: error: use of undeclared identifier 'exportd_nl_family'; did you mean 'nfsd_nl_family'?
    2306 |         genl_unregister_family(&exportd_nl_family);
         |                                 ^~~~~~~~~~~~~~~~~
         |                                 nfsd_nl_family
   fs/nfsd/netlink.h:30:27: note: 'nfsd_nl_family' declared here
      30 | extern struct genl_family nfsd_nl_family;
         |                           ^
   3 errors generated.


vim +2270 fs/nfsd/nfsctl.c

  2238	
  2239	static int __init init_nfsd(void)
  2240	{
  2241		int retval;
  2242	
  2243		nfsd_debugfs_init();
  2244	
  2245		retval = nfsd4_init_slabs();
  2246		if (retval)
  2247			return retval;
  2248		retval = nfsd4_init_pnfs();
  2249		if (retval)
  2250			goto out_free_slabs;
  2251		retval = nfsd_drc_slab_create();
  2252		if (retval)
  2253			goto out_free_pnfs;
  2254		nfsd_lockd_init();	/* lockd->nfsd callbacks */
  2255		retval = register_pernet_subsys(&nfsd_net_ops);
  2256		if (retval < 0)
  2257			goto out_free_lockd;
  2258		retval = register_cld_notifier();
  2259		if (retval)
  2260			goto out_free_subsys;
  2261		retval = nfsd4_create_laundry_wq();
  2262		if (retval)
  2263			goto out_free_cld;
  2264		retval = register_filesystem(&nfsd_fs_type);
  2265		if (retval)
  2266			goto out_free_nfsd4;
  2267		retval = genl_register_family(&nfsd_nl_family);
  2268		if (retval)
  2269			goto out_free_filesystem;
> 2270		retval = genl_register_family(&exportd_nl_family);
  2271		if (retval)
  2272			goto out_free_nfsd_nl;
  2273		retval = create_proc_exports_entry();
  2274		if (retval)
  2275			goto out_free_all;
  2276		nfsd_localio_ops_init();
  2277	
  2278		return 0;
  2279	out_free_all:
  2280		genl_unregister_family(&exportd_nl_family);
  2281	out_free_nfsd_nl:
  2282		genl_unregister_family(&nfsd_nl_family);
  2283	out_free_filesystem:
  2284		unregister_filesystem(&nfsd_fs_type);
  2285	out_free_nfsd4:
  2286		nfsd4_destroy_laundry_wq();
  2287	out_free_cld:
  2288		unregister_cld_notifier();
  2289	out_free_subsys:
  2290		unregister_pernet_subsys(&nfsd_net_ops);
  2291	out_free_lockd:
  2292		nfsd_lockd_shutdown();
  2293		nfsd_drc_slab_free();
  2294	out_free_pnfs:
  2295		nfsd4_exit_pnfs();
  2296	out_free_slabs:
  2297		nfsd4_free_slabs();
  2298		nfsd_debugfs_exit();
  2299		return retval;
  2300	}
  2301	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
