Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7ACB298CA6;
	Fri,  5 Sep 2025 09:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757066345; cv=none; b=BPt1LonnUsmEgwChgnPwZnq3ejN+gxCEBO0K755MoRa4mkHtkOZyktpk7NDt4ibf6nq8isWWHS5dsRqnR78hu4DYaea1ciovSaT1seuHWa9RzAukFMB8ELYUiYvB98SeOktYqj+ijSAs3HuP4pMeWADnWC1PhI3xOg+Veq5laWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757066345; c=relaxed/simple;
	bh=zdCCzU83+coWJ0ENCGTdCePSddVpOFpXUz93yah3+50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NFoKQfC12MXAn7hPOrcRFRvN8paQvrUyB8oNNTehe7vih+KuCpiU6iLM9pUDGTNbozzc31rP7nnfDjQfEWseIYBGdzSCck34uceacKSHsTtsVo4wpjwiR8UfdGQgyt8uBT3sK/qcsnBN6DIth2Z5kZll8wIcp8ePY4kBXzRpngI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JKT2/Aih; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JKT2/Aih"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757066342; x=1788602342;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zdCCzU83+coWJ0ENCGTdCePSddVpOFpXUz93yah3+50=;
  b=JKT2/AihsbsdPfy2scVlY8dMvrcKrLXH3pHD2nR2yVo2OqBAkZv9lzd/
   zZ/qFFvZmt4Ew5zgE/LVt8oBtjNKGcYyH4VH4kIkq/skIVAvgf268Exl9
   WrApdzqZxxIPfnu1cqHmJTQ1sIhOx0jshSeqOQDSBRPyyTidLhdnv0O6a
   dqaSOaQR31wn70rspjMqEN+S4OeAgw6pQVK+E5rNySyq3Ue3vMnSMh+ef
   t4K+0RS7YCl0PyuAcniQbsbYJfi/BBX9dTa79yWzPhxPGaExW6TNb88K6
   MGLCWXoyUOGqPMb6yHMyOgo0C7OeGzfoZejkazqVqQOgDvOTThFcWCqoq
   g==;
X-CSE-ConnectionGUID: /OUmh8RORvSbNEIsGdyjNg==
X-CSE-MsgGUID: ht/tnv18Rf2xWYINI7zjgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="77023421"
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; 
   d="scan'208";a="77023421"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 02:59:01 -0700
X-CSE-ConnectionGUID: Pcll+jN2Qg6ksIiUiwpm9A==
X-CSE-MsgGUID: dKgYQRJ7QhWg/7RVgq9Y/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; 
   d="scan'208";a="209306055"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Sep 2025 02:59:00 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuTDc-0000Hr-0V;
	Fri, 05 Sep 2025 09:58:56 +0000
Date: Fri, 5 Sep 2025 17:58:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] huge_memory: return -EINVAL in folio split functions
 when THP is disabled
Message-ID: <202509051753.riCeG7LC-lkp@intel.com>
References: <20250904095129.222316-1-kernel@pankajraghav.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904095129.222316-1-kernel@pankajraghav.com>

Hi Pankaj,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 291634ccfd2820c09f6e8c4982c2dee8155d09ae]

url:    https://github.com/intel-lab-lkp/linux/commits/Pankaj-Raghav-Samsung/huge_memory-return-EINVAL-in-folio-split-functions-when-THP-is-disabled/20250904-175359
base:   291634ccfd2820c09f6e8c4982c2dee8155d09ae
patch link:    https://lore.kernel.org/r/20250904095129.222316-1-kernel%40pankajraghav.com
patch subject: [PATCH v2] huge_memory: return -EINVAL in folio split functions when THP is disabled
config: i386-buildonly-randconfig-001-20250905 (https://download.01.org/0day-ci/archive/20250905/202509051753.riCeG7LC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250905/202509051753.riCeG7LC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509051753.riCeG7LC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:1081:
>> include/linux/huge_mm.h:591:16: warning: unused variable 'folio' [-Wunused-variable]
     591 |         struct folio *folio = page_folio(page);
         |                       ^~~~~
   include/linux/huge_mm.h:598:16: warning: unused variable 'folio' [-Wunused-variable]
     598 |         struct folio *folio = page_folio(page);
         |                       ^~~~~
   2 warnings generated.
--
   In file included from drivers/media/mc/mc-entity.c:16:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:2169:
   In file included from arch/x86/include/asm/pci.h:5:
   In file included from include/linux/mm.h:1081:
>> include/linux/huge_mm.h:591:16: warning: unused variable 'folio' [-Wunused-variable]
     591 |         struct folio *folio = page_folio(page);
         |                       ^~~~~
   include/linux/huge_mm.h:598:16: warning: unused variable 'folio' [-Wunused-variable]
     598 |         struct folio *folio = page_folio(page);
         |                       ^~~~~
   drivers/media/mc/mc-entity.c:18:27: warning: unused function 'intf_type' [-Wunused-function]
      18 | static inline const char *intf_type(struct media_interface *intf)
         |                           ^~~~~~~~~
   drivers/media/mc/mc-entity.c:48:27: warning: unused function 'link_type_name' [-Wunused-function]
      48 | static inline const char *link_type_name(struct media_link *link)
         |                           ^~~~~~~~~~~~~~
   4 warnings generated.
--
   In file included from mc-entity.c:16:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:2169:
   In file included from arch/x86/include/asm/pci.h:5:
   In file included from include/linux/mm.h:1081:
>> include/linux/huge_mm.h:591:16: warning: unused variable 'folio' [-Wunused-variable]
     591 |         struct folio *folio = page_folio(page);
         |                       ^~~~~
   include/linux/huge_mm.h:598:16: warning: unused variable 'folio' [-Wunused-variable]
     598 |         struct folio *folio = page_folio(page);
         |                       ^~~~~
   mc-entity.c:18:27: warning: unused function 'intf_type' [-Wunused-function]
      18 | static inline const char *intf_type(struct media_interface *intf)
         |                           ^~~~~~~~~
   mc-entity.c:48:27: warning: unused function 'link_type_name' [-Wunused-function]
      48 | static inline const char *link_type_name(struct media_link *link)
         |                           ^~~~~~~~~~~~~~
   4 warnings generated.
--
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:1081:
>> include/linux/huge_mm.h:591:16: warning: unused variable 'folio' [-Wunused-variable]
     591 |         struct folio *folio = page_folio(page);
         |                       ^~~~~
   include/linux/huge_mm.h:598:16: warning: unused variable 'folio' [-Wunused-variable]
     598 |         struct folio *folio = page_folio(page);
         |                       ^~~~~
   2 warnings generated.


vim +/folio +591 include/linux/huge_mm.h

   581	
   582	static inline bool
   583	can_split_folio(struct folio *folio, int caller_pins, int *pextra_pins)
   584	{
   585		return false;
   586	}
   587	static inline int
   588	split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
   589			unsigned int new_order)
   590	{
 > 591		struct folio *folio = page_folio(page);
   592	
   593		VM_WARN_ON_ONCE_FOLIO(1, folio);
   594		return -EINVAL;
   595	}
   596	static inline int split_huge_page(struct page *page)
   597	{
   598		struct folio *folio = page_folio(page);
   599	
   600		VM_WARN_ON_ONCE_FOLIO(1, folio);
   601		return -EINVAL;
   602	}
   603	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
