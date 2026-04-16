Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D4DAD24;
	Thu, 16 Apr 2026 00:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776297870; cv=none; b=J9yapTDmFa8zZlcbYSKXQ0iqqQVm3ZM2jr2E0rj6wPMVg3ZytWH2PbldwHlQDYYcmv+M0dGwctWm2XpprU02qxKa65S9iRRFBKNXTEAQAyt76GnoAHWaE8B59xbIehcNfY4CzKeIqJTIYJ/e5WYakJxSxHqDBVBC0XxRJqRSXjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776297870; c=relaxed/simple;
	bh=FvxlXc3vhZxp3hDkvNzcNi5fSpd44SIr/sXNPDnZnQw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jCF7lEegdvGtMtoNy36P58LHVrsaKYdsj7fmh656mVmZS8Wk6JEArrotH636XhJWJhKfOqwLyYfyeGVtAX/fXOio7eRpOfmxjALxKHNJXx8Z74kcNg8Ie6uLdJ1ZfAMOLdVKfaaHzlST79JeZmy0ur9YApfmDS1c/ib548q2cq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R91O2n3C; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R91O2n3C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776297867; x=1807833867;
  h=date:from:to:cc:subject:message-id;
  bh=FvxlXc3vhZxp3hDkvNzcNi5fSpd44SIr/sXNPDnZnQw=;
  b=R91O2n3CbnXFNX1q6ROqDx75xA40JtKcB1HYCIZSpdIRHPUZgAg9EStu
   LbpyoasFdQUb1cj3zpYUCYgCBb8wSzV3nI5peF6wm60HIM0T0eV+NcUf9
   ceNnPbzNqguyLK2FAFeiChxBq5TQQB/6e2xm9C1O0v4pnUJUX4S5MsYaI
   fg/EGjAgtd1B6zfSNGLHKUXhvIXfBpSszP7Iyj0Jzc06EIPhol1dAPdRr
   ewGI+WdtUlGRi7UgeWpxZiW44eGRVYwUSqtF4ENt2fHnYmefRGDWO5zVM
   KpGb0XKCdSSmAT/6oBQ/oGKG7niRBbJWnBS8vAvow2tHn+UYlfzKJx9WV
   A==;
X-CSE-ConnectionGUID: 1KvyemYzToOZ7Yrfo0vRQQ==
X-CSE-MsgGUID: CF+tX+L6Qz69k46BztV6eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="76986991"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="76986991"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 17:04:27 -0700
X-CSE-ConnectionGUID: IdgaC2bMS0iV+KIStGalCg==
X-CSE-MsgGUID: MZmphOkDQ0mWnmCNaiKPkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="226248411"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 15 Apr 2026 17:04:25 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDADX-000000000rq-3dFG;
	Thu, 16 Apr 2026 00:04:23 +0000
Date: Thu, 16 Apr 2026 02:03:52 +0200
From: kernel test robot <lkp@intel.com>
To: Amery Hung <ameryhung@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: net/core/bpf_sk_storage.c:140:57: error: too many arguments
 to function call, expected 4, have 5
Message-ID: <202604160220.9glH3zwm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Amery-Hung/selftests-bpf-Remove-kmalloc-tracing-from-local-storage-create-bench/20260415-163526
head:   22bd953a5faeea8dd0780f885b234d987745e31b
commit: 22bd953a5faeea8dd0780f885b234d987745e31b bpf: Remove gfp_flags plumbing from bpf_local_storage_update()
date:   15 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260416/202604160220.9glH3zwm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604160220.9glH3zwm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604160220.9glH3zwm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/bpf_sk_storage.c:140:57: error: too many arguments to function call, expected 4, have 5
     140 |         copy_selem = bpf_selem_alloc(smap, newsk, NULL, false, GFP_ATOMIC);
         |                      ~~~~~~~~~~~~~~~                           ^~~~~~~~~~
   include/linux/gfp_types.h:376:20: note: expanded from macro 'GFP_ATOMIC'
     376 | #define GFP_ATOMIC      (__GFP_HIGH|__GFP_KSWAPD_RECLAIM)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bpf_local_storage.h:190:1: note: 'bpf_selem_alloc' declared here
     190 | bpf_selem_alloc(struct bpf_local_storage_map *smap, void *owner, void *value,
         | ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     191 |                 bool swap_uptrs);
         |                 ~~~~~~~~~~~~~~~
   net/core/bpf_sk_storage.c:205:59: error: too many arguments to function call, expected 3, have 4
     205 |                         ret = bpf_local_storage_alloc(newsk, smap, copy_selem, GFP_ATOMIC);
         |                               ~~~~~~~~~~~~~~~~~~~~~~~                          ^~~~~~~~~~
   include/linux/gfp_types.h:376:20: note: expanded from macro 'GFP_ATOMIC'
     376 | #define GFP_ATOMIC      (__GFP_HIGH|__GFP_KSWAPD_RECLAIM)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bpf_local_storage.h:197:1: note: 'bpf_local_storage_alloc' declared here
     197 | bpf_local_storage_alloc(void *owner,
         | ^                       ~~~~~~~~~~~~
     198 |                         struct bpf_local_storage_map *smap,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     199 |                         struct bpf_local_storage_elem *first_selem);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +140 net/core/bpf_sk_storage.c

6ac99e8f23d4b1 Martin KaFai Lau        2019-04-26  132  
1f00d375af84fb KP Singh                2020-08-25  133  static struct bpf_local_storage_elem *
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  134  bpf_sk_storage_clone_elem(struct sock *newsk,
1f00d375af84fb KP Singh                2020-08-25  135  			  struct bpf_local_storage_map *smap,
1f00d375af84fb KP Singh                2020-08-25  136  			  struct bpf_local_storage_elem *selem)
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  137  {
1f00d375af84fb KP Singh                2020-08-25  138  	struct bpf_local_storage_elem *copy_selem;
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  139  
0e854e55356908 Amery Hung              2025-11-14 @140  	copy_selem = bpf_selem_alloc(smap, newsk, NULL, false, GFP_ATOMIC);
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  141  	if (!copy_selem)
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  142  		return NULL;
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  143  
db559117828d24 Kumar Kartikeya Dwivedi 2022-11-04  144  	if (btf_record_has_field(smap->map.record, BPF_SPIN_LOCK))
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  145  		copy_map_value_locked(&smap->map, SDATA(copy_selem)->data,
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  146  				      SDATA(selem)->data, true);
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  147  	else
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  148  		copy_map_value(&smap->map, SDATA(copy_selem)->data,
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  149  			       SDATA(selem)->data);
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  150  
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  151  	return copy_selem;
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  152  }
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  153  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
