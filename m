Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F6A7FBD6;
	Sat,  1 Mar 2025 04:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740804120; cv=none; b=Oj8XqPPLsvgVsyS53HEMURYHNPuGaVtwFMjW/yZ3RdxPMZvmFJGy0JZNCSFA5Qdg+Nx78TVw6KhpEZKvuoZaJio8Vp7OQhI0uT6H7/wLTllJ3+5WHlskkHYjCiSYXP4H2eYW8yI7hTlML2f2oRFuBQNqwogH7TFY6a12M4eAh1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740804120; c=relaxed/simple;
	bh=H2KwK73hOzF9RzcJ6yMz4T+nBbU+MNjkeB1fA+Zd2gw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O7uw0QG3UjwgrsVF4nShwQ945sVEb4oGrPbc8ZBXZSoTt381NEHD66vZbb+OuX4caZXL6FrT0elJTjrlgN3ZOD1bAwkLW+GUcVwXSzGQzFfqtkMCMpMIO+Qd1qZJBBM5kh1U7rdWz7kVnHESNbamTkARtK57ej5W/GioNykGFoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QrzbMBu7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QrzbMBu7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740804118; x=1772340118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H2KwK73hOzF9RzcJ6yMz4T+nBbU+MNjkeB1fA+Zd2gw=;
  b=QrzbMBu72daSr0kCcrZSlfNR7eOQ6gWkpKNxiOSGfiphWOVpmvD5FCBJ
   VMrFsYwMr/3FJ0EApGoQS1guzMNJj+SdhliUlKx074MK5adzVORhPQvaa
   clZ4lFl0zRbYeOKu5IB9sTdWzYKauNccexBMIru5faPVKyFqrmirnsvb3
   nKnCNFzToMAk/YCBt/GD4MmbD9JurwjmDkg0IUrMPX92Hj07d6xdEsvjV
   4XIN2ViQIm06U+aVgySMKFnoYLhurruwjuqEnsFegnnb1mj2vi4/OFAJ4
   OAGBmJ9OP1P042QSxZSGHu0VIZQrS3wCq6oXH9QrfjvaEwxnEfR9cnhpa
   Q==;
X-CSE-ConnectionGUID: x8qnyRZaSQuVlBVIIcBPBQ==
X-CSE-MsgGUID: dNs6W0ZBQ7OPMGDUy/gNFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41862490"
X-IronPort-AV: E=Sophos;i="6.13,324,1732608000"; 
   d="scan'208";a="41862490"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 20:41:58 -0800
X-CSE-ConnectionGUID: 1rKT9+rqRyqLTiDe2L2alw==
X-CSE-MsgGUID: UpW9I5NDSvGUmfOohrsmYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,324,1732608000"; 
   d="scan'208";a="117499959"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 28 Feb 2025 20:41:57 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toEff-000Frx-0W;
	Sat, 01 Mar 2025 04:41:51 +0000
Date: Sat, 1 Mar 2025 12:41:15 +0800
From: kernel test robot <lkp@intel.com>
To: Brendan Jackman <jackmanb@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 328/329] mm/page_alloc.c:421:3: error: call to
 undeclared function 'in_mem_hotplug'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202503011224.Gak85jxJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   5f089a9aa987ccf72df0c6955e168e865f280603
commit: b4cfcc26f507ecef2861ccfb883698933083fce6 [328/329] mm/page_alloc: add lockdep assertion for pageblock type change
config: arm64-randconfig-003-20250301 (https://download.01.org/0day-ci/archive/20250301/202503011224.Gak85jxJ-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250301/202503011224.Gak85jxJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503011224.Gak85jxJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/page_alloc.c:421:3: error: call to undeclared function 'in_mem_hotplug'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   in_mem_hotplug() ||
                   ^
   1 error generated.


vim +/in_mem_hotplug +421 mm/page_alloc.c

   417	
   418	void set_pageblock_migratetype(struct page *page, int migratetype)
   419	{
   420		lockdep_assert_once(system_state == SYSTEM_BOOTING ||
 > 421			in_mem_hotplug() ||
   422			lockdep_is_held(&page_zone(page)->lock));
   423	
   424		if (unlikely(page_group_by_mobility_disabled &&
   425			     migratetype < MIGRATE_PCPTYPES))
   426			migratetype = MIGRATE_UNMOVABLE;
   427	
   428		set_pfnblock_flags_mask(page, (unsigned long)migratetype,
   429					page_to_pfn(page), MIGRATETYPE_MASK);
   430	}
   431	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
