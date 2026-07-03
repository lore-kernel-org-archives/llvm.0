Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB44266EE9;
	Fri,  3 Jul 2026 03:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783050112; cv=none; b=JYhZbqm0OOCTbQF6IQi1JriuAePhb+T7x/ojvsbeal8Dv/p0vhtDl/JDtu7PAeV07yWWS6f8UP1GPvXUFxjdOg4XpQpWdmB4Olp0PXfQ3UiPUtVkXB38B3P1dtAssoqdHivPMc7UeN7EIysCb7hbH3nsYfWJp+lmDqpqajGsz2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783050112; c=relaxed/simple;
	bh=BkBHPAF+XjBfwcHRCLHoWQTOeh2ri+kdT2WWLfM70yQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K1JrBBEibPPF351L/Y2i0Q79p84RSkiOPMAiAXRc34Z4Z5WN8WfGRaG/d+EaTx0BEUSTIGBcXpqG79e7Yx15x1xJctnEk0yLy5cg6xNasvk7Rg6AraWRHNe5mHqPQDN1CiWmMYfPvBd862Stw9RRuve5xbFFRuGTgutMsZMs11o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V0mO3dtQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V0mO3dtQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783050104; x=1814586104;
  h=date:from:to:cc:subject:message-id;
  bh=BkBHPAF+XjBfwcHRCLHoWQTOeh2ri+kdT2WWLfM70yQ=;
  b=V0mO3dtQhK3v3i/YOOMqQ8vLIbZsZTt3P3PbtCQrVl+oHeMhwGZll6hj
   ukZjBkzSu3dGLgMr7Ojf1EgUFC5mef6mMl3c2hVnp/75Ef/pj8EXawdgN
   aO3QMx/g51XGuEhNijg4irko+60IXl0BlKqhRG2f8qmuEdKBbNGKEKVfc
   56Kd78RHzzQvX/wmsPWxEFHpUYDKXc5Mvd1vFLHg0aYSsjv8V17t2px5Q
   pNjUoQh9zhzkpMK3o2BUq1GnnD3gO1s/exZ7aGdj88hfGO55sHQaI2Jxl
   soN61jFFW9hKcy6hBgtsNfLAtYdAGDn7/YH03066jjX1QazK9WxTDBqH8
   Q==;
X-CSE-ConnectionGUID: kIvcoD9ARsSFz5XMLoxm6Q==
X-CSE-MsgGUID: nRLR72GQR9etCpneYGpUOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="94159150"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="94159150"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 20:41:42 -0700
X-CSE-ConnectionGUID: mjMfAfA6T1ue1G0WPPYaPw==
X-CSE-MsgGUID: k133mtpMTti+HEKhLeNUGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="252555752"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 02 Jul 2026 20:41:41 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfUmY-00000000Bcl-1oo8;
	Fri, 03 Jul 2026 03:41:38 +0000
Date: Fri, 03 Jul 2026 11:41:17 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/qemu_boot 47/62] mm/mm_init.c:920:18: error: no
 member named 'pageblock_flags' in 'struct zone'
Message-ID: <202607031132.GVODI6ZB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/qemu_boot
head:   a74f943885b7a0e655c7c47d4d02f852c12c1ce1
commit: 944d16e25477c831c7a6708bb81667dcb5acc6a6 [47/62] mm: guard pageblock init against missing pageblock_flags
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20260703/202607031132.GVODI6ZB-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260703/202607031132.GVODI6ZB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607031132.GVODI6ZB-lkp@intel.com/

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
