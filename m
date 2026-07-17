Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859973033D6;
	Fri, 17 Jul 2026 05:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784266690; cv=none; b=B8m3TuqB0WZpiktH5yeSQOxcm3mbCdosuPCtxECHJlRdrexjTgr8wM2PW5Q+yol3hc20vtMoYEwdjNFOyVZE5MnW+uJB2/5cYRlwmvLDjegxtUAjkrwi+aaPokojVsDWe28ZH2h1DebT6iSPcsdWqxT75H21+nRiX+gK/2pMOn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784266690; c=relaxed/simple;
	bh=PE4vS6zSU95sYpHJzroYSeqp5Nz8k8xnoQam5rhTL2M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EFLU6TGg8cKJIeX/OMjn229F5+D0sIyUeYad0fWY0XUEdVyw3vflhayZOJmb/a+Zm9Z4K2vr9Ua01PgsO5z9aSDgTkqPvHp76fcNWD+jNeqGvD5/+ztiJ0h0PSP1OEv2QUpSwjjaTUr1qPMFk9qErrmox4dyy2yHd9FtqsKg12k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dk1avG1P; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dk1avG1P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784266689; x=1815802689;
  h=date:from:to:cc:subject:message-id;
  bh=PE4vS6zSU95sYpHJzroYSeqp5Nz8k8xnoQam5rhTL2M=;
  b=dk1avG1PUzrcEyHaZqy6lHhWjoInOfc3jc3a5D0dbONxumSS8elNzHU9
   coZ2durSqVFfUurFZmFaOwZhQJKNmGwSGjnn+1G1vYeYsP5sKVEHKOJMM
   ZGpJ/FsOZUyrxcqUBhxYxHFMmkyLbkntAZFY7eRXeKdImK+TAOQrWbTq5
   pV7owWh2T2IFnajrOL33YmVvw37bvXjuGs32YHdKGGzGmIEBBTziMRO95
   8CfbUjmTPih32PJ/dHYiVQwcecLTT7MMB9IiLIWnKLDvc4J3XJFN0mk33
   I6ng7iLPdVy982waz2OCfgp/9yMYHufqhWgH6H5DUlZCmY0sJAH3pinSQ
   g==;
X-CSE-ConnectionGUID: aSOlzjO0To6FDvyf+mA0sg==
X-CSE-MsgGUID: miQaM+RsSV+zz3tI2PrDiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="102359534"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="102359534"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 22:38:08 -0700
X-CSE-ConnectionGUID: 18J/e9eeRL2RN2Qd9nVz0g==
X-CSE-MsgGUID: kKEJWvhdT6quZP91DTnjmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="294898077"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 16 Jul 2026 22:38:07 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkbGt-00000000SSS-3wN8;
	Fri, 17 Jul 2026 05:38:03 +0000
Date: Fri, 17 Jul 2026 13:37:51 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/qemu_boot 47/70] mm/mm_init.c:936:18: error: no
 member named 'pageblock_flags' in 'struct zone'
Message-ID: <202607171342.75yRUr3x-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/qemu_boot
head:   a8a4b998ba937d19200cfad69da3029fd54a8f5a
commit: 8d43a66fdb5007eb7f368b20a2ca44395e8e47d9 [47/70] mm: guard pageblock init against missing pageblock_flags
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260717/202607171342.75yRUr3x-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0dfced1adc55429e32b1db08570abd3a219d85)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607171342.75yRUr3x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607171342.75yRUr3x-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/mm_init.c:936:18: error: no member named 'pageblock_flags' in 'struct zone'
     936 |                         if (likely(z->pageblock_flags)) {
         |                                    ~  ^
   1 error generated.


vim +936 mm/mm_init.c

   903	
   904		for (pfn = start_pfn; pfn < end_pfn; ) {
   905			/*
   906			 * There can be holes in boot-time mem_map[]s handed to this
   907			 * function.  They do not exist on hotplugged memory.
   908			 */
   909			if (context == MEMINIT_EARLY) {
   910				if (overlap_memmap_init(zone, &pfn))
   911					continue;
   912				if (defer_init(nid, pfn, zone_end_pfn)) {
   913					deferred_struct_pages = true;
   914					break;
   915				}
   916			}
   917	
   918			page = pfn_to_page(pfn);
   919			__init_single_page(page, pfn, zone, nid);
   920			if (context == MEMINIT_HOTPLUG) {
   921	#ifdef CONFIG_ZONE_DEVICE
   922				if (zone == ZONE_DEVICE)
   923					__SetPageReserved(page);
   924				else
   925	#endif
   926					__SetPageOffline(page);
   927			}
   928	
   929			/*
   930			 * Usually, we want to mark the pageblock MIGRATE_MOVABLE,
   931			 * such that unmovable allocations won't be scattered all
   932			 * over the place during system boot.
   933			 */
   934			if (pageblock_aligned(pfn)) {
   935				struct zone *z = page_zone(page);
 > 936				if (likely(z->pageblock_flags)) {
   937					init_pageblock_migratetype(page, migratetype,
   938							isolate_pageblock);
   939				} else {
   940					pr_warn_once("memmap_init_range: skipping pageblock init for pfn 0x%lx (zone %s has no pageblock_flags)\n",
   941						     pfn, z->name);
   942				}
   943				cond_resched();
   944			}
   945			pfn++;
   946		}
   947	}
   948	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
