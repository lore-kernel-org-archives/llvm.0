Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59845330D35;
	Thu, 28 May 2026 20:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780000210; cv=none; b=ltrJMnYAQdw72nkigZXIPtxf6DWNVl1PkjHJMp/LpDxbAwUIaDWN3505SbNfSleBjqvZ+zcHborY8ecT7AwfFZW6BTJiEa/iLBAzy4C3nPYNJLaqheNCdJw6QuyY7hCis/QBEuiS21REvFzKprk+6aoq9KKYylGl8W7nx8PJ3tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780000210; c=relaxed/simple;
	bh=ODNxYs339E2YF89enQLYGjmAuCOA1Oyzei0NMHrO2jE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ejm7njh3T4SO/v7QF1faXhZ+Y5fhOVd+Lj4eonSqqCMGbnEbjRkG4shqchKr4tlzhpEgDk+7of1Bb64Y35uio1VkFLes4t2PQYLYGA/qkpKfYgvqFrUAppMjCHIBUbdt9S2kyEh5w87sWGZsdzQ/+KnYFwR+qg+eZ6Cj8rKQzJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ahRQiNfy; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ahRQiNfy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780000208; x=1811536208;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ODNxYs339E2YF89enQLYGjmAuCOA1Oyzei0NMHrO2jE=;
  b=ahRQiNfyOvGCjpSDCkZo+oO6QnluuVQl1809vIAWnEhaNlkD/zpUq236
   E4iOk2fmlWys+lHqI4pICLxSs8A9dvhLhmNRZ5NVokdwQWOfT6xHkg63G
   BrBH92w3dORpvkEsx1EdPs9q1hJ/lqxfAGoI9g+Ljnoj16Hi0Bx7vIIGz
   XpW9ZU11uSqLYPg0h3BRJ4awNNlt/SMgr3nlUIDO0Txpw9bzmrETxCPD9
   ZOFA+alfw7iDIRjcy4qz+7KrbRlIRkzp8iNI5cUjnTD/6EWBjSu9frNDX
   vJZnkx9WPmN6Qd2hAhYsEKqGowgsWOSPDUHf7qClN0eardzkKvWmKwfTB
   A==;
X-CSE-ConnectionGUID: /mmizlMLSJKU5P6wjLUBZA==
X-CSE-MsgGUID: 6G5PmkFJSM2nlV2e2wbHGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80751930"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="80751930"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 13:30:08 -0700
X-CSE-ConnectionGUID: D0LZuv9tTsKm4VJfEniS6w==
X-CSE-MsgGUID: XweaD3oNR+Sqd5m0kCTstA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 May 2026 13:30:04 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wShMf-000000006Q2-2z5X;
	Thu, 28 May 2026 20:30:01 +0000
Date: Fri, 29 May 2026 04:29:08 +0800
From: kernel test robot <lkp@intel.com>
To: hu.shengming@zte.com.cn, vbabka@kernel.org, harry@kernel.org,
	akpm@linux-foundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, hao.li@linux.dev,
	cl@gentwo.org, rientjes@google.com, roman.gushchin@linux.dev,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	zhang.run@zte.com.cn, cai.qu@zte.com.cn
Subject: Re: [PATCH v3] mm/slub: free prefilled empty sheaves consistently
Message-ID: <202605290406.mjAKJqbo-lkp@intel.com>
References: <20260525211000387LYqTHmxYL900XIB8qwV3h@zte.com.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525211000387LYqTHmxYL900XIB8qwV3h@zte.com.cn>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/hu-shengming-zte-com-cn/mm-slub-free-prefilled-empty-sheaves-consistently/20260525-211805
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260525211000387LYqTHmxYL900XIB8qwV3h%40zte.com.cn
patch subject: [PATCH v3] mm/slub: free prefilled empty sheaves consistently
config: powerpc-randconfig-002-20260529 (https://download.01.org/0day-ci/archive/20260529/202605290406.mjAKJqbo-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605290406.mjAKJqbo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605290406.mjAKJqbo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_PPC_ADDR16_HA cannot be used against symbol 'decrementers_next_tb'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/kernel/time.o)
   >>> referenced by time.c
   >>>               arch/powerpc/kernel/time.o:(decrementer_set_next_event) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_HA cannot be used against symbol 'ppc_emulated'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/kernel/traps.o)
   >>> referenced by align.c
   >>>               arch/powerpc/kernel/align.o:(fix_alignment) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
