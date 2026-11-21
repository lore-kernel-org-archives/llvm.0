Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795249099;
	b=kjopLFg2QgwTxlASQkhwS0NKDgPmCnirBGmHR77omrj4r4D+u/sQ0Pat1uXCU3Xrbdqj
	 XZp7CuSq2yLu0IRSjx91bszOEonDDdIWyLSdsEY/TQN1G2joME8FSrMkEF278lLK6g1uP
	 tpYcdPw8z8tt5sgNDkmPBSuTPLStMiVd9UgRMBAEYfrrtXVyAUd/PpQa0Eq0HEIGwTkEb
	 Wyk06MGbqe/Tbl1Ohdnbtqzj3quOT3SVomwMR3bhMh6fBpg5fxqZYstKKYghFKlhuPHKV
	 NzJPhdriPGzDU9kcVDpCYELZzcpELc4SEeHANHG84rTghFW4R8NCRgKayoN+Q22sIKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795249099;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=wCYPhItWmnp0/5nxKzmcWIir9eopxc4FlvC5rliCc3Q=;
	b=3CEpdqxPVl+KYcMJp6Ze0A+WoK+7wq7L+FGfVn1ESjKMJY8Y5HlptdhRnW+s+C/xLe4i
	 WLUTaeJOBqD6qA1A06zDOopwVkQ+lC9NzHwIEviJKpm/HN8LIH5N/bV6XRcdmn2AD5u4l
	 /xFbpQEPb2Oc1S/Jmzl6jbJddfmp3x3+yim00FQZfQt8AP9wjxSSiX1PZE9/YDs052Bf0
	 6BaWEdp9Ubr8IAgtFhOmixqRTZvpzGT1EocAc1E/Kchtn6FgTJSFjPJOm3K3x33zwPk6T
	 P2Uplhi1/Yu4MovoW0LPvMV/3IqZJlZ8mVwG6LemMOa6jh3Ah/LwSDIQN/UlWln4a6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a7BCuG49;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99311606A320;
	Sat, 21 Nov 2026 08:18:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99311606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a7BCuG49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795249099; x=1826785099;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pO0cciCz4qBsH+lwwoCOo6yiJg2x8jY4K93217h6gAw=;
  b=a7BCuG49l++B9bS9D2HtL1DF+nBZZigWWrXbd4TaopSENvLcFrfWJoQK
   QX3fWdrwBo8ureSdmkjzOupb0yY/Ghm0793jVzL2l+LV9lfjnmrC7iBU1
   OTsYsw05xycmf3zvrTNKnBjbBCmK4ZHwKgk2wNBxSUJa4MKqdDJGXkRki
   Hstx2vIEw+GVODwkU30BXvyvrzArZQm9tu5lCEOWsL/qpMX8j0wSrn475
   ZkFlv/I+yka1KMLGeVm7BGMEB/q4uVoWY9MyqLIVopVZRHwmsH5ATcWhT
   L1jPcoFW8OTarvqrjHPJ/tqQzN6joYItoEFyaxKKrAHsO46W9t0CgFlFz
   A==;
X-CSE-ConnectionGUID: 4O3SDwYARFus+IHxGYXcaw==
X-CSE-MsgGUID: 0xobKn6UQmK1I33hkbM74Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4016235"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4016235"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 00:18:18 -0800
X-CSE-ConnectionGUID: PWrLIszdQNecO3b3uFVshg==
X-CSE-MsgGUID: OqtUL30ETRu4ekM85ukBbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="12709521"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 21 Nov 2026 00:18:11 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUgIR-00000001Jln-0CGj;
	Sat, 21 Nov 2026 08:18:07 +0000
Date: Sat, 21 Nov 2026 16:17:22 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price via B4 Relay <devnull+gourry.gourry.net@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	David Hildenbrand <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Byungchul Park <byungchul@sk.com>,
	Alistair Popple <apopple@nvidia.com>, SJ Park <sj@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH 54/60] mm/migrate: route explicit NUMA migration to
 private nodes
Message-ID: <202611211538.vaJ4R864-lkp@intel.com>
References: <20261120-private_nodes_v6-v1-54-74f5f9a115c2@gourry.net>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-private_nodes_v6-v1-54-74f5f9a115c2@gourry.net>

Hi Gregory,

kernel test robot noticed the following build errors:

[auto build test ERROR on 15f114dac9a7bde1796f0e54e22726fd31cfa8a5]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price-via-B4-Relay/nodemask-add-node-state-iterators/20261120-130852
base:   15f114dac9a7bde1796f0e54e22726fd31cfa8a5
patch link:    https://lore.kernel.org/r/20261120-private_nodes_v6-v1-54-74f5f9a115c2%40gourry.net
patch subject: [PATCH 54/60] mm/migrate: route explicit NUMA migration to private nodes
config: arm-jornada720_defconfig (https://download.01.org/0day-ci/archive/20261121/202611211538.vaJ4R864-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 3b14d7c370558b46e5f0c6494a05c492e59bf32c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/202611211538.vaJ4R864-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611211538.vaJ4R864-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/migrate.c:2254:10: error: call to undeclared function '__folio_alloc_flags'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2254 |                 return __folio_alloc_flags(gfp_mask, order, nid, mtc->nmask,
         |                        ^
>> mm/migrate.c:2254:10: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct folio *' [-Wint-conversion]
    2254 |                 return __folio_alloc_flags(gfp_mask, order, nid, mtc->nmask,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2255 |                                            mtc->alloc_flags);
         |                                            ~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/__folio_alloc_flags +2254 mm/migrate.c

  2216	
  2217	struct folio *alloc_migration_target(struct folio *src, unsigned long private)
  2218	{
  2219		struct migration_target_control *mtc;
  2220		gfp_t gfp_mask;
  2221		unsigned int order = 0;
  2222		int nid;
  2223		enum zone_type zidx;
  2224	
  2225		mtc = (struct migration_target_control *)private;
  2226		gfp_mask = mtc->gfp_mask;
  2227		nid = mtc->nid;
  2228		if (nid == NUMA_NO_NODE)
  2229			nid = folio_nid(src);
  2230	
  2231		if (folio_test_hugetlb(src)) {
  2232			struct hstate *h = folio_hstate(src);
  2233	
  2234			gfp_mask = htlb_modify_alloc_mask(h, gfp_mask);
  2235			return alloc_hugetlb_folio_nodemask(h, nid,
  2236							mtc->nmask, gfp_mask,
  2237							htlb_allow_alloc_fallback(mtc->reason));
  2238		}
  2239	
  2240		if (folio_test_large(src)) {
  2241			/*
  2242			 * clear __GFP_RECLAIM to make the migration callback
  2243			 * consistent with regular THP allocations.
  2244			 */
  2245			gfp_mask &= ~__GFP_RECLAIM;
  2246			gfp_mask |= GFP_TRANSHUGE;
  2247			order = folio_order(src);
  2248		}
  2249		zidx = folio_zonenum(src);
  2250		if (is_highmem_idx(zidx) || zidx == ZONE_MOVABLE)
  2251			gfp_mask |= __GFP_HIGHMEM;
  2252	
  2253		if (mtc->alloc_flags)
> 2254			return __folio_alloc_flags(gfp_mask, order, nid, mtc->nmask,
  2255						   mtc->alloc_flags);
  2256		return __folio_alloc(gfp_mask, order, nid, mtc->nmask);
  2257	}
  2258	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
