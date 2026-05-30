Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFAF3A1E92;
	Sat, 30 May 2026 10:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780137640; cv=none; b=GJSck1Illg5G3hbUiyF5ZoutOo1gj8s6QUXAeSa6RkgRbLSp+d7kjvhU5u4IoiiPS1t8kAtToUf66nOLT/W7oACs5ZH1yRTu56fcbfcOlM5FNy4ElPVnyKrp2VYU6T/DfBjAO2J9gBfTBbaoM33f2OpjjQ2SEigXlUmM+AdrM30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780137640; c=relaxed/simple;
	bh=lJTtyxnXQA6faDJhJHS7O/yVW1sr0/ChXUgTte27mMg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q/lRcQhaLm8S7Gnkwz03xwgUCm26tpzk5gQjD9x2O05lEH3RvJepg7gU9DJuqPKkt445h2z0cGI26LibXKAReo9CF4jvcQKakrc37387gOw7wKFYsArqs8pHW/j83DsXBwNWUWE9s0RFIW8LWh4vByZwsZJGd8RMbSkH040UBDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L0coYrev; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L0coYrev"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780137638; x=1811673638;
  h=date:from:to:cc:subject:message-id;
  bh=lJTtyxnXQA6faDJhJHS7O/yVW1sr0/ChXUgTte27mMg=;
  b=L0coYrevjWk2zE2YtjDnoatB49hYG1smb495S5aGENcjRmxqxe239H+Q
   nc1zQi8JLoSY2imS5HEZGTEVvYEc7/tZ+rLM10V5mLRC2+CubArtkN57y
   UCsbvdVObbFFMcnwmNDJWU123h5msn+2uw7nxxEIkgMhG6XHc6uEaJb0k
   adfNjBg0j+mgF1DMY7cPca5hO4X2oY5GtA9GZhBmFna6lE04yw11jXLdx
   q9oLm0l7MM9bAY3rk2TAGH/kzdghf0iMfz1mNG+BkdpNqyeyXxIwcY3TJ
   nBwr2seclSJtIaTdIJH+VR3/2pOV6CYy7k7PRxX0YEua4DFOIFninMHxE
   Q==;
X-CSE-ConnectionGUID: YrhhAFpqQNeJi13XGuBJaA==
X-CSE-MsgGUID: orQeM1cSQ/Scz/xcSLkiZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="92087235"
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="92087235"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 03:40:35 -0700
X-CSE-ConnectionGUID: XX6AkW5cQkeZil3urwTHnw==
X-CSE-MsgGUID: NZE9/u1RSC+f9RwsIuAVgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="266715814"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 May 2026 03:40:33 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTH7H-000000008Kk-29as;
	Sat, 30 May 2026 10:40:31 +0000
Date: Sat, 30 May 2026 18:40:16 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/boot_qemu 42/43] mm/mm_init.c:920:18: error: no
 member named 'pageblock_flags' in 'struct zone'
Message-ID: <202605301801.LxwJTUEe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   dea73df6b6f456832390a9acd2c44cf235110d30
commit: a2a98cd08700b29ee25458e078d1c20cc3cb4131 [42/43] mm: guard pageblock init against missing pageblock_flags
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20260530/202605301801.LxwJTUEe-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605301801.LxwJTUEe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605301801.LxwJTUEe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/mm_init.c:920:18: error: no member named 'pageblock_flags' in 'struct zone'
     920 |                         if (likely(z->pageblock_flags)) {
         |                                    ~  ^
   1 error generated.


vim +920 mm/mm_init.c

   887	
   888		for (pfn = start_pfn; pfn < end_pfn; ) {
   889			/*
   890			 * There can be holes in boot-time mem_map[]s handed to this
   891			 * function.  They do not exist on hotplugged memory.
   892			 */
   893			if (context == MEMINIT_EARLY) {
   894				if (overlap_memmap_init(zone, &pfn))
   895					continue;
   896				if (defer_init(nid, pfn, zone_end_pfn)) {
   897					deferred_struct_pages = true;
   898					break;
   899				}
   900			}
   901	
   902			page = pfn_to_page(pfn);
   903			__init_single_page(page, pfn, zone, nid);
   904			if (context == MEMINIT_HOTPLUG) {
   905	#ifdef CONFIG_ZONE_DEVICE
   906				if (zone == ZONE_DEVICE)
   907					__SetPageReserved(page);
   908				else
   909	#endif
   910					__SetPageOffline(page);
   911			}
   912	
   913			/*
   914			 * Usually, we want to mark the pageblock MIGRATE_MOVABLE,
   915			 * such that unmovable allocations won't be scattered all
   916			 * over the place during system boot.
   917			 */
   918			if (pageblock_aligned(pfn)) {
   919				struct zone *z = page_zone(page);
 > 920				if (likely(z->pageblock_flags)) {
   921					init_pageblock_migratetype(page, migratetype,
   922							isolate_pageblock);
   923				} else {
   924					pr_warn_once("memmap_init_range: skipping pageblock init for pfn 0x%lx (zone %s has no pageblock_flags)\n",
   925						     pfn, z->name);
   926				}
   927				cond_resched();
   928			}
   929			pfn++;
   930		}
   931	}
   932	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
