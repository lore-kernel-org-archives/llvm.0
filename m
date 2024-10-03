Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E1B1B85EB;
	Thu,  3 Oct 2024 22:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727995560; cv=none; b=gCvzNCe6PQjsV4YF4Wa7G31gOTqY9uj8a4Zw2qT5sO9mIbIxNSdA3mY/6l+h9L8wSF0IjqoDQTOZ4SCVWWaGnEPDQR234xx6HfQHF6cJkAB/ObshhrKRhdFNYRo8eNkNztg3kCngb8PspXxANG1R/AzXh0NgSy53WY+ICJpLo5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727995560; c=relaxed/simple;
	bh=iWp6hCe8ByCdxsvEcl1vAJjnu/xVbNh5vxSiYXtVRGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UL1GuNpT8wCvn6jSFbFQwJcalawCgIoxH2trWPP8O9IZWluW2C0jK3wi45ocTo5xNINdw/vaQG0ePirqVA6+mcJq7PQHgVkCGD9xeHSUYAzsk+r30/CtxTHprEuKGMEXqdSMMUqUZNZdQYsH7nKE2hIJ72k5f2Xco3QpvNFBGms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FxjGoGc8; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FxjGoGc8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727995559; x=1759531559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iWp6hCe8ByCdxsvEcl1vAJjnu/xVbNh5vxSiYXtVRGQ=;
  b=FxjGoGc8mSM2OsYKsAMLLQu0Qy2X4ZPA5vdwmYOAWzfMFIyvaDOLfn8k
   c/O1bgN2XObRQa/nerNcx1VjTWsL+7CR+eNzsSdzt3bPkEAhomWCkO5UG
   jHjxKjCkBC51kpAEd6q/U7U0jgUPmu7m8gt7NGXVb+vZT2Rk5MbnNdPP0
   iEc32AViDY9X5csbzDyZuj5aKloUgAUK3bCeLUs+bwc0QWciR//ogFmHY
   Qzkw6w1RuyQMqokwtJ3yNtj2i6CLe/ljqsrDUaZn1XNFIl5Q5tS8WWi9/
   DM84JqbyEHppRmNfaQ4sx7vQWD9BMugge6NH0vdBaaWv/riPhmyu4vxrE
   g==;
X-CSE-ConnectionGUID: j0QQ6izeQBOQN+5jE9fGYQ==
X-CSE-MsgGUID: MEav0aoVTamzTYewoCSIIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27343065"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="27343065"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 15:45:58 -0700
X-CSE-ConnectionGUID: k2y25oaURNuZdKGfB6J3Ew==
X-CSE-MsgGUID: 1P4XIPCOQRyeaUurDJT/yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="74624155"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Oct 2024 15:45:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swUa0-0000zG-2f;
	Thu, 03 Oct 2024 22:45:52 +0000
Date: Fri, 4 Oct 2024 06:45:27 +0800
From: kernel test robot <lkp@intel.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [namhyung-perf:bpf/slab-iter-v4 2/3] mm/slab_common.c:1334:23:
 error: incompatible integer to pointer conversion passing 'u64' (aka
 'unsigned long long') to parameter of type 'const void *'
Message-ID: <202410040606.o9Sk5WgC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/namhyung/linux-perf.git bpf/slab-iter-v4
head:   2941faf08c4c0c782881cfe9e8b7e1b6432a6212
commit: 96ce888c02ed7cf7278c4d4d14bab67c1db4b673 [2/3] mm/bpf: Add bpf_get_kmem_cache() kfunc
config: arm-randconfig-002-20241004 (https://download.01.org/0day-ci/archive/20241004/202410040606.o9Sk5WgC-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410040606.o9Sk5WgC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410040606.o9Sk5WgC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/slab_common.c:9:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/slab_common.c:32:
   In file included from mm/internal.h:13:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/slab_common.c:1334:23: error: incompatible integer to pointer conversion passing 'u64' (aka 'unsigned long long') to parameter of type 'const void *' [-Wint-conversion]
    1334 |         if (!virt_addr_valid(addr))
         |                              ^~~~
   arch/arm/include/asm/memory.h:392:31: note: expanded from macro 'virt_addr_valid'
     392 |                                         && pfn_valid(virt_to_pfn(kaddr)))
         |                                                                  ^~~~~
   arch/arm/include/asm/memory.h:296:53: note: passing argument to parameter 'p' here
     296 | static inline unsigned long virt_to_pfn(const void *p)
         |                                                     ^
   3 warnings and 1 error generated.


vim +1334 mm/slab_common.c

  1329	
  1330	__bpf_kfunc struct kmem_cache *bpf_get_kmem_cache(u64 addr)
  1331	{
  1332		struct slab *slab;
  1333	
> 1334		if (!virt_addr_valid(addr))
  1335			return NULL;
  1336	
  1337		slab = virt_to_slab((void *)(long)addr);
  1338		return slab ? slab->slab_cache : NULL;
  1339	}
  1340	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
