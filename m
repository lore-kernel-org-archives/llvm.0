Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE6F387369;
	Sat, 30 May 2026 07:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780125710; cv=none; b=pCEeS756Qfkt8y9Ykl1Fm4psPi0Sh2HpxBhb+9azAhcdnsT/7AgQeySqdScUuJCGZ6hmUdyVT4w+eu4UYuTQkxN5KYxG1HuFIinJtz+OqcKPVbhWi5tVT3DmaskLX0Nw1DcuRG/V3VsXQRpMshDfOMKYVNyVFSZOmfjqiw1oHp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780125710; c=relaxed/simple;
	bh=SKtIHjcxbsa8b88YmfrKc376yFEcKAQ3wnPjdzv7THE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dsX1l9dPo16it4d82N6TAx6tTvOBx2aAwQ2dJM1iZ8ozMRZSK4ssHSfr/YYOwov1gKqFm0oGkpiL6swlHFYlK+j21xgwCHRfz605iMsCMcsWpGwFgb/OBSP19e+KAvOMRxL1F8NJqax6XKMi32xoJ806j3ZYoyLZGczYZax6FEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QN/Xj6II; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QN/Xj6II"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780125709; x=1811661709;
  h=date:from:to:cc:subject:message-id;
  bh=SKtIHjcxbsa8b88YmfrKc376yFEcKAQ3wnPjdzv7THE=;
  b=QN/Xj6IIlq1PvFtmJbWoR/jdwaAcGQJbcFCupUDsSZGz/gs4mvmvYimg
   tV0cv0AITwvimCj5vO9Sw2wws2n0spCXeA/7sNcwGy78SqIFQPS+e32FD
   CHMlFrlwL/Re9eEvygAbcaY5giZso8v/te3jsL9zu5Pm37nfEmpKfODIZ
   WZEsNz9Fs1NKYbb8lxbwkA++SnmoVSbVHN2fNjU2Wk+IbvSj/5BBg1I9B
   yrS6/qr0+vHUBAtoShhGG23mavsrh9EDMl0rOpEdpL+z/YpiRVZX0XuN0
   VftYlg6d58SR997MbgH4F3myhks45RzupTwI3XWxKQk5E2eDWCRucwMNc
   w==;
X-CSE-ConnectionGUID: DLucv1lTSh2gctNN709DxA==
X-CSE-MsgGUID: txdPI0nnQlemdodj7S6E8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="80820963"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="80820963"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 00:21:48 -0700
X-CSE-ConnectionGUID: h31a8cYER0KBsgSg3IIYOg==
X-CSE-MsgGUID: Hd+ExlLPQJ2ppiYTGVRGGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="243147384"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 30 May 2026 00:21:47 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTE0u-00000000153-1BRB;
	Sat, 30 May 2026 07:21:44 +0000
Date: Sat, 30 May 2026 09:21:26 +0200
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/boot_qemu 42/43] mm/mm_init.c:920:18: error: no
 member named 'pageblock_flags' in 'struct zone'
Message-ID: <202605300909.7HlejklT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   dea73df6b6f456832390a9acd2c44cf235110d30
commit: a2a98cd08700b29ee25458e078d1c20cc3cb4131 [42/43] mm: guard pageblock init against missing pageblock_flags
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260530/202605300909.7HlejklT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605300909.7HlejklT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605300909.7HlejklT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/mm_init.c:920:18: error: no member named 'pageblock_flags' in 'struct zone'
     920 |                         if (likely(z->pageblock_flags)) {
         |                                    ~  ^
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
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
