Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8612D949C;
	Sat, 10 Oct 2026 01:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791597022; cv=none; b=IWM58IW3ooor5nk3mrdkBjT8Kt2WwX1Z2HcRpQo59gnIZ2MfHuIaeETO3vwE+us/LFeo5guVvx6KXhFBui98q4v0+4kZyPd+GfdI2Jz1GFpf0XDZxBMuq6gseOMCZBQe42XYXJysIOKjJcxfSZT1bmByNoT2U5i4uUiX59DoQkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791597022; c=relaxed/simple;
	bh=Xr7BFcuPfN5hxzlUU0KILbgM3T/srUjFVBe8YW5OnqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PrEDw+hjk6yr1Qr4tCpnPgf7zLLd9C0eC9pBnYuRxgTscpZHozG7912Dw9efv5Ud4ZngLDspCI8ZI/6Hs91IbUWAWiCkSgEcbQ+u/VuLmFUHpWs32al8YcKMofVZDjJL4KXXzwUKiRyIVoZvvmIDpNpbQq4pbtCDC1Lcb085jsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FBlf4ieH; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FBlf4ieH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791597020; x=1823133020;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xr7BFcuPfN5hxzlUU0KILbgM3T/srUjFVBe8YW5OnqI=;
  b=FBlf4ieHH6/fngSmvOhMHw/KS33K/du0QybiYC4ayo6Izozl34OL4Uek
   vrLb8s3BaLodXvq2pSoKRNrwB5bjUT8U1hWK0sdz94CV4gp9h7GMpVr4v
   zQ37cnb/5f322VIBexjsuaEQbzDomJ+9lrfM7UhVYKH/vl9X1vqI9/xy6
   Kc8yU5EYTUrWIUam27BCf8LsXCJ+QNtjUDTb4ig5V2wLoTlqTlc7Md/Xh
   trndQAfd+rWemf+lmtdTxtM8uXt353dtX6fE+uu91kTAedSZQlI6aRYkx
   JLMfthopPsMAz4j4AYDCr21GRQeDe/DcUupfotXKsnpsLjHtbLOttRPgl
   g==;
X-CSE-ConnectionGUID: Lz6cc7PXThSJKpUOjzo4YQ==
X-CSE-MsgGUID: oyVa1BEdQsK4acvYTp1Nmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="392481"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="392481"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 18:50:20 -0700
X-CSE-ConnectionGUID: sDLi4PEASumchOCUfOXSpg==
X-CSE-MsgGUID: m2EQ6+o0RkuxgBM+z9aDvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="802347"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Oct 2026 18:50:18 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFME2-000000006Og-2tcr;
	Sat, 10 Oct 2026 01:50:14 +0000
Date: Sat, 10 Oct 2026 09:49:44 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-mm@kvack.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mike Rapoport <rppt@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Oreoluwa Babatunde <oreoluwa.babatunde@oss.qualcomm.com>,
	Wandun <chenwandun1@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v2 2/2] of: reserved_mem: allocate and map the
 reserved_mem array early
Message-ID: <202610100950.LlAi30cT-lkp@intel.com>
References: <20261008152403.766439-3-m.szyprowski@samsung.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008152403.766439-3-m.szyprowski@samsung.com>

Hi Marek,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v7.3-rc6 next-20261008]
[cannot apply to linux-review/Marek-Szyprowski/of-reserved_mem-group-allocation-helpers-together/20261008-114122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Szyprowski/of-reserved_mem-group-allocation-helpers-together/20261008-172400
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20261008152403.766439-3-m.szyprowski%40samsung.com
patch subject: [PATCH v2 2/2] of: reserved_mem: allocate and map the reserved_mem array early
config: sparc64-randconfig-1001-20261009 (https://download.01.org/0day-ci/archive/20261010/202610100950.LlAi30cT-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261010/202610100950.LlAi30cT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610100950.LlAi30cT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/of/of_reserved_mem.c:27:10: fatal error: 'asm/early_ioremap.h' file not found
      27 | #include <asm/early_ioremap.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +27 drivers/of/of_reserved_mem.c

    13	
    14	#include <linux/err.h>
    15	#include <linux/ioport.h>
    16	#include <linux/libfdt.h>
    17	#include <linux/of.h>
    18	#include <linux/of_fdt.h>
    19	#include <linux/of_platform.h>
    20	#include <linux/mm.h>
    21	#include <linux/sizes.h>
    22	#include <linux/of_reserved_mem.h>
    23	#include <linux/sort.h>
    24	#include <linux/slab.h>
    25	#include <linux/memblock.h>
    26	#include <linux/kmemleak.h>
  > 27	#include <asm/early_ioremap.h>
    28	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
