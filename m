Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16DCEEA8;
	Wed, 16 Sep 2026 00:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789517246; cv=none; b=j102/lClKrHh1PgRQj9qBIP3EzaidMnqX1/e7IdziGGfcAkLdxIVxS5HYCH2KcGSN9yemX35V6NHOU9OfFHQoIiODtW6KJ8opqu4qxLcujO37JD0fpXnfVJHbYAPeo4fT9CeVBzpkg4RO3GgBKGdJ2t5vknl2vh8i5FVV1FEP54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789517246; c=relaxed/simple;
	bh=WRmUOi9iBdvSZcsLOiT2AQTlpyWLhd0On19VR9xLC54=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VIvhzkSSyZkI0J+nZ3SVY7vqbseW9KMv3xinvGbW/CYHPMq2IPVTJIFCaGbcqyhFR6i7DT55eS+6IMsAKPMrlWNbxzFzVGRWmt9f3AxMWmuPh8ZbidR0AFa/Tvp54PzbsI6FoAzrDk8DcE0bCetyJZLudB4XROsmRgcS9lkLUfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V5iscinX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V5iscinX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789517244; x=1821053244;
  h=date:from:to:cc:subject:message-id;
  bh=WRmUOi9iBdvSZcsLOiT2AQTlpyWLhd0On19VR9xLC54=;
  b=V5iscinXw25f3yLP5GjFvgX5k8+9YDFVM/j5pz6Eu9bJlLhAYnzF5ikj
   fGAX5k2Z3ponUNixPyJPmmczhGq3uCVFRx6CE0DBGCBh8qiMufLxE9UxH
   CzEZOev8KXaMcLlpS4IXLFbwKDsbdjqhJCPsyI/mIDtBxYfC9cWBgKMBg
   N7JKhgFK+9J+VPBopE4KpwHfK3YA0CwACDCO5TWG/CrlL6tvFvVgc/iaN
   2r8xwC7jb/iseyxos04ASk/4igSPk+tgafFfym08XVDpu/OB1fUBi5EGO
   dfx8j/uZl5iJ8BgFczEcT3+36BH9GPLAr4qRHkMFI14/UaKcawl1Cximz
   A==;
X-CSE-ConnectionGUID: NK13oUuFTuKqEgryKBre4g==
X-CSE-MsgGUID: 8Yh59z5PTxyJULr75X3wlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92400236"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="92400236"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 17:07:22 -0700
X-CSE-ConnectionGUID: bpggktAiSUOB9DxFcrylTA==
X-CSE-MsgGUID: cclvw02ASxmJvagUiqeFBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1571431"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 15 Sep 2026 17:07:21 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6dBF-000000005Cx-3Jvk;
	Wed, 16 Sep 2026 00:07:17 +0000
Date: Wed, 16 Sep 2026 08:06:52 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/managed_nodes/rfc6-complete
 8/67] mm/page_alloc.c:7386:3: error: call to undeclared function
 'folio_test_clear_young'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202609160844.l63z35ra-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/rfc6-complete
head:   0423df59f3f085592c3ff59834eeae067ee75158
commit: 4af770f6b4623768abd534b154c6d8136f601cac [8/67] mm/page_alloc: let alloc_contig_range() try harder
config: hexagon-randconfig-002-20260916 (https://download.01.org/0day-ci/archive/20260916/202609160844.l63z35ra-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260916/202609160844.l63z35ra-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609160844.l63z35ra-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/page_alloc.c:7386:3: error: call to undeclared function 'folio_test_clear_young'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    7386 |                 folio_test_clear_young(folio);
         |                 ^
   mm/page_alloc.c:7386:3: note: did you mean 'folio_test_clear_lru'?
   include/linux/page-flags.h:548:2: note: 'folio_test_clear_lru' declared here
     548 |         TESTCLEARFLAG(LRU, lru, PF_HEAD)
         |         ^
   include/linux/page-flags.h:468:48: note: expanded from macro 'TESTCLEARFLAG'
     468 | #define TESTCLEARFLAG(uname, lname, policy)                             \
         |                                                                         ^
   include/linux/page-flags.h:430:29: note: expanded from macro '\
   FOLIO_TEST_CLEAR_FLAG'
     430 | static __always_inline bool folio_test_clear_##name(struct folio *folio) \
         |                             ^
   <scratch space>:116:1: note: expanded from here
     116 | folio_test_clear_lru
         | ^
   1 error generated.


vim +/folio_test_clear_young +7386 mm/page_alloc.c

  7363	
  7364	/*
  7365	 * ACR_FLAGS_RECLAIM: evict the folios in [@start, @end) that migration could
  7366	 * not move.  Ages them down first so reclaim does not decline on the strength
  7367	 * of a recent reference -- the caller is not asking for a hint.
  7368	 *
  7369	 * Return: pages reclaimed.
  7370	 */
  7371	static unsigned long contig_range_reclaim(unsigned long start, unsigned long end)
  7372	{
  7373		unsigned long pfn = start, reclaimed = 0, isolated = 0;
  7374		LIST_HEAD(folio_list);
  7375	
  7376		while (pfn < end) {
  7377			struct folio *folio = contig_get_lru_folio(pfn);
  7378	
  7379			if (!folio) {
  7380				pfn++;
  7381				continue;
  7382			}
  7383			pfn += folio_nr_pages(folio);
  7384	
  7385			folio_clear_referenced(folio);
> 7386			folio_test_clear_young(folio);
  7387			if (!folio_isolate_lru(folio))
  7388				goto put;
  7389			if (folio_test_unevictable(folio)) {
  7390				folio_putback_lru(folio);
  7391			} else {
  7392				list_add(&folio->lru, &folio_list);
  7393				isolated += folio_nr_pages(folio);
  7394			}
  7395	put:
  7396			/* isolation took its own reference; drop the lookup's */
  7397			folio_put(folio);
  7398	
  7399			if (isolated >= CONTIG_RECLAIM_BATCH) {
  7400				reclaimed += reclaim_pages(&folio_list);
  7401				isolated = 0;
  7402				cond_resched();
  7403				if (fatal_signal_pending(current))
  7404					break;
  7405			}
  7406		}
  7407		reclaimed += reclaim_pages(&folio_list);
  7408	
  7409		return reclaimed;
  7410	}
  7411	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
