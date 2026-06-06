Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CB245039;
	Sat,  6 Jun 2026 08:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780734098; cv=none; b=f50KZmzSD9OIip48Hrmv0YWkFlS2tVdLopm0ENUW2p/MR0FBBSyIF0htfzAIV7oTfbqLDFmbSyqLcBefxC2BzVjP0RXhiOhvSnT/setnPtri6eQpU33g2SI6eyN/Ayeh+IBv0vc43UTxlC4tomx9OvbYknAWFVtulalUpH7huuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780734098; c=relaxed/simple;
	bh=aYEi/qqWBd6TN/TGIsL+LMdhPj0T3z09U46ylZNvSZQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FFb14oChek5+wB/PeZSvn8brJ3k416NGz918qg/31i2AK7ONOusT1Md21qYFRtmvX49SJzZOnKRijBmKbAk/hMzzhqA5eGyjTZN4yLG6yLKrGUG/BqXOLAc42RhoNlRaW6ZNxqx8VDfVWzPqIgyaSrOIzZ2xUntTnOrk5OJ2LlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IRBFyrOh; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IRBFyrOh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780734095; x=1812270095;
  h=date:from:to:cc:subject:message-id;
  bh=aYEi/qqWBd6TN/TGIsL+LMdhPj0T3z09U46ylZNvSZQ=;
  b=IRBFyrOhrSqzNMIHtb+Wky8y621M1UkR1W1HWf8j7kbf4rT4QJqCmhrx
   +HUBEj3i6iEKrJF9Z+KJGeYUIbdTrk1BWzHN/ikKWId+gZq9G7KpbTANs
   N6LMZqHIUf30cDWrP1Neg9EG2ksEqYfJX4mz38nVngur3nunQYzHUtsUf
   VlWe9cm8mmV/n2vklGTRB4KrQ7uKF37nnHUreq/nS15vkhM5xIaHy4yi2
   ybbM+XwUsyEx8cmxnW+J9sV7MchIqVuAZODmKoRdWAudfVOA2AGoizYIy
   HBwtlj2jh32UjiHVSyx9o0VLgVyjVEqrHptIIpqVvzaDIUhBSHQkYidC0
   g==;
X-CSE-ConnectionGUID: OiFwwzJ/SmOTAo1levuy6g==
X-CSE-MsgGUID: 6iGCEnADTV2zJYPGWRhZdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="81463561"
X-IronPort-AV: E=Sophos;i="6.24,190,1774335600"; 
   d="scan'208";a="81463561"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2026 01:21:35 -0700
X-CSE-ConnectionGUID: n2nZ78hcTUexJNSV7VBw3g==
X-CSE-MsgGUID: y1YmUAcBRyWKtjdnZvfznA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,190,1774335600"; 
   d="scan'208";a="268998761"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 06 Jun 2026 01:21:33 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVmHb-000000002nt-0bEk;
	Sat, 06 Jun 2026 08:21:31 +0000
Date: Sat, 06 Jun 2026 10:20:43 +0200
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/boot_qemu 47/51] mm/mm_init.c:920:18: error: no
 member named 'pageblock_flags' in 'struct zone'
Message-ID: <202606061035.2mg8Zuju-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   c850792455fb50ac41c7100e7d6f5f834d3141ee
commit: bdd721ef7955b07ea40dbb3babd1b9e7beae2c01 [47/51] mm: guard pageblock init against missing pageblock_flags
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260606/202606061035.2mg8Zuju-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260606/202606061035.2mg8Zuju-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606061035.2mg8Zuju-lkp@intel.com/

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
