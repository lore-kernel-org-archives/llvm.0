Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DAA2D47FF;
	Fri, 28 Nov 2025 06:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764312787; cv=none; b=eW361oItsNQv88qqLyXh2dxxtAqPOkkZH/FrY9mkXdo88eH4Rqp6zSykualKyM+sgjNm+Mmxb0xkVY/dNLvqGISoLog3pvm3DDaiFqZeV30Lm+AQuhAekS68/4VAbkQDq8wg0nkL2R1/Qj5VGnhkZD2/6D91wWNg8o3CAHeQ8N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764312787; c=relaxed/simple;
	bh=52HsZi08fiFu45/47LAmhAN1wfgi9SKT1OBT8cKT3RU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MnEihskZsLqEzRw/SFA+lxKGHyvhJxu3sDdgbCo4PNeZejZBsDYkbZmUkDqzhPyd4v/DVChaXXqmT4zhGLBZ/BAvi/j1I8rBZGldVHHlOOwa9jBU0OUnFLyZTRcPKtvDaMUvA35x0zXMWVHYdMvMfqZB/UoXh2hWDcovR0m4Whk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V4vdqgCC; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V4vdqgCC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764312785; x=1795848785;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=52HsZi08fiFu45/47LAmhAN1wfgi9SKT1OBT8cKT3RU=;
  b=V4vdqgCCzSGBwHIW+ua/ejyKCN0kaZUUwIjolx43LuKlklElFS+HBbJU
   B4/xAJPnTTEVsFs3FI+y6IBLPkkN1ycI4X+LiL2LY/1W37vAD3vZ6fp6p
   VpUDkXsOJkqBXT07YShXMMpsLCq6sIMUddVQdojl0ECznbVvL8p/5XhSz
   nxFPkfiLAun1pA6qqwYk9YPIb3bg1WMn3+L0gFx5MWABw7xtEfuhkMKH2
   zo3/qQIhSgXkNYeqe7KPPeztzTAlN8hMWu8KfHMxCuUvFIsrXVcdMYLyX
   OUTrrvpxwHWa5iMp8Lc42FwJsBmmyRGwHkWFcubVvhn3qSK2zcOErhAPc
   w==;
X-CSE-ConnectionGUID: enZ5SPwCQBmNZQI0mrK+4A==
X-CSE-MsgGUID: 3YKOaxHjQuSVzSsDvIccug==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66060802"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66060802"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:53:02 -0800
X-CSE-ConnectionGUID: 2B9FMwjjSKO246VAYGX8Pw==
X-CSE-MsgGUID: Y2HU9546ROKHBi0g+ZAXpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="198506457"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Nov 2025 22:53:00 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOsLh-0000000067L-4A0e;
	Fri, 28 Nov 2025 06:52:57 +0000
Date: Fri, 28 Nov 2025 14:52:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Niethe <jniethe@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 6/6] mm: Remove device private pages from the
 physical address space
Message-ID: <202511281438.x8ovUgeA-lkp@intel.com>
References: <20251128044146.80050-7-jniethe@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251128044146.80050-7-jniethe@nvidia.com>

Hi Jordan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on e1afacb68573c3cd0a3785c6b0508876cd3423bc]

url:    https://github.com/intel-lab-lkp/linux/commits/Jordan-Niethe/mm-hmm-Add-flag-to-track-device-private-PFNs/20251128-124406
base:   e1afacb68573c3cd0a3785c6b0508876cd3423bc
patch link:    https://lore.kernel.org/r/20251128044146.80050-7-jniethe%40nvidia.com
patch subject: [RFC PATCH 6/6] mm: Remove device private pages from the physical address space
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20251128/202511281438.x8ovUgeA-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511281438.x8ovUgeA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511281438.x8ovUgeA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/s390/purgatory/purgatory.c:10:
   In file included from include/linux/kexec.h:18:
   In file included from include/linux/vmcore_info.h:6:
   In file included from include/linux/elfcore.h:11:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:33:
>> include/linux/memremap.h:142:2: warning: field '' with variable sized type 'union dev_pagemap::(anonymous at include/linux/memremap.h:142:2)' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
     142 |         union {
         |         ^
   1 warning generated.


vim +142 include/linux/memremap.h

514caf23a70fd69 Christoph Hellwig   2019-06-26  107  
9476df7d80dfc42 Dan Williams        2016-01-15  108  /**
9476df7d80dfc42 Dan Williams        2016-01-15  109   * struct dev_pagemap - metadata for ZONE_DEVICE mappings
4b94ffdc4163bae Dan Williams        2016-01-15  110   * @altmap: pre-allocated/reserved memory for vmemmap allocations
5c2c2587b13235b Dan Williams        2016-01-15  111   * @ref: reference count that pins the devm_memremap_pages() mapping
b80892ca022e9eb Christoph Hellwig   2021-10-28  112   * @done: completion for @ref
0c32c9f7a58e773 John Groves         2024-02-05  113   * @type: memory type: see MEMORY_* above in memremap.h
514caf23a70fd69 Christoph Hellwig   2019-06-26  114   * @flags: PGMAP_* flags to specify defailed behavior
c4386bd8ee3a921 Joao Martins        2022-01-14  115   * @vmemmap_shift: structural definition of how the vmemmap page metadata
c4386bd8ee3a921 Joao Martins        2022-01-14  116   *      is populated, specifically the metadata page order.
c4386bd8ee3a921 Joao Martins        2022-01-14  117   *	A zero value (default) uses base pages as the vmemmap metadata
c4386bd8ee3a921 Joao Martins        2022-01-14  118   *	representation. A bigger value will set up compound struct pages
c4386bd8ee3a921 Joao Martins        2022-01-14  119   *	of the requested order value.
1e240e8d4a7d922 Christoph Hellwig   2019-06-26  120   * @ops: method table
f894ddd5ff01d3b Christoph Hellwig   2020-03-16  121   * @owner: an opaque pointer identifying the entity that manages this
f894ddd5ff01d3b Christoph Hellwig   2020-03-16  122   *	instance.  Used by various helpers to make sure that no
f894ddd5ff01d3b Christoph Hellwig   2020-03-16  123   *	foreign ZONE_DEVICE memory is accessed.
31ff70a0ab1c747 Jordan Niethe       2025-11-28  124   * @nr_range: number of ranges to be mapped. Always == 1 for
31ff70a0ab1c747 Jordan Niethe       2025-11-28  125   *	MEMORY_DEVICE_PRIVATE.
31ff70a0ab1c747 Jordan Niethe       2025-11-28  126   * @range: range to be mapped when nr_range == 1. Used as an output param for
31ff70a0ab1c747 Jordan Niethe       2025-11-28  127   *	MEMORY_DEVICE_PRIVATE.
b7b3c01b191596d Dan Williams        2020-10-13  128   * @ranges: array of ranges to be mapped when nr_range > 1
31ff70a0ab1c747 Jordan Niethe       2025-11-28  129   * @nr_pages: number of pages requested to be mapped for MEMORY_DEVICE_PRIVATE.
31ff70a0ab1c747 Jordan Niethe       2025-11-28  130   * @pages: array of nr_pages initialized for MEMORY_DEVICE_PRIVATE.
9476df7d80dfc42 Dan Williams        2016-01-15  131   */
9476df7d80dfc42 Dan Williams        2016-01-15  132  struct dev_pagemap {
e7744aa25cffe26 Logan Gunthorpe     2017-12-29  133  	struct vmem_altmap altmap;
b80892ca022e9eb Christoph Hellwig   2021-10-28  134  	struct percpu_ref ref;
24917f6b1041a73 Christoph Hellwig   2019-06-26  135  	struct completion done;
5042db43cc26f51 Jérôme Glisse       2017-09-08  136  	enum memory_type type;
514caf23a70fd69 Christoph Hellwig   2019-06-26  137  	unsigned int flags;
c4386bd8ee3a921 Joao Martins        2022-01-14  138  	unsigned long vmemmap_shift;
1e240e8d4a7d922 Christoph Hellwig   2019-06-26  139  	const struct dev_pagemap_ops *ops;
f894ddd5ff01d3b Christoph Hellwig   2020-03-16  140  	void *owner;
b7b3c01b191596d Dan Williams        2020-10-13  141  	int nr_range;
b7b3c01b191596d Dan Williams        2020-10-13 @142  	union {
b7b3c01b191596d Dan Williams        2020-10-13  143  		struct range range;
06919d226d01132 Gustavo A. R. Silva 2022-09-03  144  		DECLARE_FLEX_ARRAY(struct range, ranges);
b7b3c01b191596d Dan Williams        2020-10-13  145  	};
31ff70a0ab1c747 Jordan Niethe       2025-11-28  146  	unsigned long nr_pages;
31ff70a0ab1c747 Jordan Niethe       2025-11-28  147  	struct page *pages;
9476df7d80dfc42 Dan Williams        2016-01-15  148  };
9476df7d80dfc42 Dan Williams        2016-01-15  149  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
