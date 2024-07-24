Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743A050269;
	Wed, 24 Jul 2024 07:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721805863; cv=none; b=utGoBP0EKPBTB38ndJEF6UuIPq2g01HllqjhF6f7Q5Rk7MoIaXU7D7mqojiN5jRYg+qUHhY/HND5H42Uhs+cWM8bL7ugL+WZeIf1096VEtlFX9hE5TiV5YpmVy1yd7zFWLn1w5nD7AS8FqqTMYLQHHgJbKWVgNCQ6+bLpTHpc+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721805863; c=relaxed/simple;
	bh=3/HtXcrqBEZ8GGDm6+Bdd2jSc73UsWB5s9JTwPYCgyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DSIl0/JXgojC831DwoRmYt4yWY+Vti7raMZXb8gewXj7ob0QWAwzTPIh9s1t55Lx7bKqg08hmBEGVJTAQocOHGPbPJGhoEK0JRWiD/xJtErSXL+mkOsXx6EyfPnhqgJC71DLjlGgIAroD4XtbDHQLNRLoJ/Y84q2LiEkkFfQy4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fc9yCihZ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fc9yCihZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721805862; x=1753341862;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3/HtXcrqBEZ8GGDm6+Bdd2jSc73UsWB5s9JTwPYCgyw=;
  b=Fc9yCihZnysQqnnzc/1bF2E1HU2omI506Cz3YDDgqrepS2DhUjHGJJyM
   5aes39yoQSOZ+D9k7OoQgiGyQaYIF17hf3135hTcnJDjOqybbU+aUOAe6
   P+M845DuPs218mUNShsLsJGnf2wX8yHLknErdYqk12dqJ8orIGk+JxXDk
   ExNre2nUnAMza5RE5cBJoFaAoSUnFcHINecvmEWvie1f1CcOttAjGRw/e
   R1VyH9AkPKAcgH7iOgH9ZTjxAwhYuLbMLTpmAlwMOgysTlyTACyADBky7
   EYfg1Cm8Xmb2v08XKztpxQMSp1XbNsAxEY0ew7TyqCCZIMKXcB0VYspg7
   A==;
X-CSE-ConnectionGUID: UHxzs7p5RGiFvWb+FlSqMA==
X-CSE-MsgGUID: QEi4l2OAQ5Oh1HCgRUwBqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="41993539"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="41993539"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 00:24:12 -0700
X-CSE-ConnectionGUID: S/tEA5FNQLO52w0IhKEs0A==
X-CSE-MsgGUID: nXsRCMeRQ5aEhOtooAa8Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="52402920"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Jul 2024 00:24:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWWM3-000mlz-2R;
	Wed, 24 Jul 2024 07:24:07 +0000
Date: Wed, 24 Jul 2024 15:24:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: [PATCH 3/6] mm: Convert page_to_pgoff() to page_pgoff()
Message-ID: <202407241549.hEuWenpa-lkp@intel.com>
References: <20240723153503.1669586-4-willy@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723153503.1669586-4-willy@infradead.org>

Hi Matthew,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master next-20240724]
[cannot apply to tip/x86/mm dennis-percpu/for-next v6.10]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/bootmem-Stop-using-page-index/20240723-233932
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240723153503.1669586-4-willy%40infradead.org
patch subject: [PATCH 3/6] mm: Convert page_to_pgoff() to page_pgoff()
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240724/202407241549.hEuWenpa-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407241549.hEuWenpa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407241549.hEuWenpa-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/filemap.c:51:
>> mm/internal.h:899:39: error: passing 'const struct folio *' to parameter of type 'struct folio *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     899 |         return folio->index + folio_page_idx(folio, page);
         |                                              ^~~~~
   include/linux/mm.h:216:62: note: expanded from macro 'folio_page_idx'
     216 | #define folio_page_idx(folio, p)        (page_to_pfn(p) - folio_pfn(folio))
         |                                                                     ^~~~~
   include/linux/mm.h:1877:53: note: passing argument to parameter 'folio' here
    1877 | static inline unsigned long folio_pfn(struct folio *folio)
         |                                                     ^
   1 error generated.
--
   In file included from mm/rmap.c:85:
>> mm/internal.h:899:39: error: passing 'const struct folio *' to parameter of type 'struct folio *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     899 |         return folio->index + folio_page_idx(folio, page);
         |                                              ^~~~~
   include/linux/mm.h:216:62: note: expanded from macro 'folio_page_idx'
     216 | #define folio_page_idx(folio, p)        (page_to_pfn(p) - folio_pfn(folio))
         |                                                                     ^~~~~
   include/linux/mm.h:1877:53: note: passing argument to parameter 'folio' here
    1877 | static inline unsigned long folio_pfn(struct folio *folio)
         |                                                     ^
   mm/rmap.c:796:40: error: passing 'const struct folio *' to parameter of type 'struct folio *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     796 |         pgoff = folio->index + folio_page_idx(folio, page);
         |                                               ^~~~~
   include/linux/mm.h:216:62: note: expanded from macro 'folio_page_idx'
     216 | #define folio_page_idx(folio, p)        (page_to_pfn(p) - folio_pfn(folio))
         |                                                                     ^~~~~
   include/linux/mm.h:1877:53: note: passing argument to parameter 'folio' here
    1877 | static inline unsigned long folio_pfn(struct folio *folio)
         |                                                     ^
   2 errors generated.


vim +899 mm/internal.h

   895	
   896	static inline pgoff_t page_pgoff(const struct folio *folio,
   897			const struct page *page)
   898	{
 > 899		return folio->index + folio_page_idx(folio, page);
   900	}
   901	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
