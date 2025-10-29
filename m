Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B564299A8F;
	Wed, 29 Oct 2025 19:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761765999; cv=none; b=iKKpzhRpmK1aR8yGgUOgem7fI9KqMNpV8CZROxmP3xJcMoBwEKmHo3hebq8G3W/3jeKXxQ0ZhoyyAJC1yNCOH4ph1VtbiiJXf7KDqrd4iyCDdHEYbsdyRNFTLhMfnVJ909erXk8s02Gqr0H8CHyPLFPib119eNS76G5bHarGF+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761765999; c=relaxed/simple;
	bh=Uy+drdtVdosduK/AJC4iAB2kc+vSCfEplarqfnqelgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lf8fyB3aTWrQwawtUiTRb7q3/0OktoJ6i9iQX83Sn9l00QTjtiuD7iA6ACfeOwmP6GX91vexnOSg8mZjctVgAbHuVJvjXLWvLGOef8axwM8fWwZKoTjASyI3aXSs2sR2APdrRrcBCq7v8vJ+zfgTSMGPRCAPYgfwbeztFekEtro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aZytxH5j; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aZytxH5j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761765997; x=1793301997;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Uy+drdtVdosduK/AJC4iAB2kc+vSCfEplarqfnqelgI=;
  b=aZytxH5jsNzvwDSr1X0evDVxPCOBK/FyvkpLJElnYlvXLDuOVO2/GhtX
   G2TTmNo1moTMXDU4VrA+yU69xLHAn9nEhwG6fCYMrSw29F33wm8ZrtQUo
   R7DEdBZpxlxJu8zzsoghUOrLLv2Xipy0/2tWDkh9l488HS1HSUP5pj/1u
   AtDVAiYPl6eSpHTvbChr+IgupK8MoQpuleZftVb89Gnj8d+hTI6jlZyW0
   a3BxdKlbKOgxpR5IaVy95bLtxCBgoJx5u/S5fScS/vig7nWcHSB0mrKHi
   JqiqX6Px43u5PckPEsHeooWOLnKdhGoREo0Tvknu7H+bU2H1Ftr/HWJeJ
   g==;
X-CSE-ConnectionGUID: eX79waU8S2ui/NtVorsfrA==
X-CSE-MsgGUID: PArnM1VNRACsmGIUbpAE3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63994241"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="63994241"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 12:26:37 -0700
X-CSE-ConnectionGUID: Jg+onkHIRu2k5UjUCoLZ4Q==
X-CSE-MsgGUID: CblukQ1NQKq4m7sq0hXFtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="184998754"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 29 Oct 2025 12:26:32 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEBoT-000L5w-2l;
	Wed, 29 Oct 2025 19:26:29 +0000
Date: Thu, 30 Oct 2025 03:25:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song <ryncsn@gmail.com>, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>,
	Chris Li <chrisl@kernel.org>, Nhat Pham <nphamcs@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	David Hildenbrand <david@redhat.com>,
	Youngjun Park <youngjun.park@lge.com>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-kernel@vger.kernel.org, Kairui Song <kasong@tencent.com>
Subject: Re: [PATCH 12/19] mm, swap: use swap cache as the swap in
 synchronize layer
Message-ID: <202510300338.GvcdaiCz-lkp@intel.com>
References: <20251029-swap-table-p2-v1-12-3d43f3b6ec32@tencent.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-swap-table-p2-v1-12-3d43f3b6ec32@tencent.com>

Hi Kairui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f30d294530d939fa4b77d61bc60f25c4284841fa]

url:    https://github.com/intel-lab-lkp/linux/commits/Kairui-Song/mm-swap-rename-__read_swap_cache_async-to-swap_cache_alloc_folio/20251030-000506
base:   f30d294530d939fa4b77d61bc60f25c4284841fa
patch link:    https://lore.kernel.org/r/20251029-swap-table-p2-v1-12-3d43f3b6ec32%40tencent.com
patch subject: [PATCH 12/19] mm, swap: use swap cache as the swap in synchronize layer
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20251030/202510300338.GvcdaiCz-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510300338.GvcdaiCz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510300338.GvcdaiCz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/filemap.c:66:
>> mm/swap.h:428:1: warning: non-void function does not return a value [-Wreturn-type]
     428 | }
         | ^
   1 warning generated.
--
   In file included from mm/gup.c:29:
>> mm/swap.h:428:1: warning: non-void function does not return a value [-Wreturn-type]
     428 | }
         | ^
   mm/gup.c:74:29: warning: unused function 'try_get_folio' [-Wunused-function]
      74 | static inline struct folio *try_get_folio(struct page *page, int refs)
         |                             ^~~~~~~~~~~~~
   2 warnings generated.


vim +428 mm/swap.h

014bb1de4fc17d5 NeilBrown   2022-05-09  424  
2eaa2d7ed6e0caa Kairui Song 2025-10-29  425  static inline int swap_cache_add_folio(struct folio *folio, swp_entry_t entry,
2eaa2d7ed6e0caa Kairui Song 2025-10-29  426  				       void **shadow, bool alloc)
014bb1de4fc17d5 NeilBrown   2022-05-09  427  {
014bb1de4fc17d5 NeilBrown   2022-05-09 @428  }
014bb1de4fc17d5 NeilBrown   2022-05-09  429  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
