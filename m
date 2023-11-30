Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02881D54F;
	Thu, 30 Nov 2023 06:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gnC+UAh6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701324766; x=1732860766;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q4C0Acu4pi+B7qUaFSZYj8kTxkzvjJeLbzGSQGnNXQI=;
  b=gnC+UAh6lw5ACp1mcdb/s+0tHlcNYkOXnVp9Tg1shWdX6JgLpHaQ7o9L
   OTa3Kmy3aqQV2dKUdu1/6NivR05xVvUwLjUswf6I5oKBdZJa8SYU5c1KZ
   xAmyAAQj+Ve80TcjK4WxR5cNjBCxwQfOf1YLQggopwsuKtGLrCTjCxN7b
   mlmMaY3fYYqi2eRxI0Dzq+hf7XyUO9KWWxxmE0b1Fq1AgGOIsKLy4nSuS
   +IcmwAFiFJn3WvN0afAb50I6rqssKMxbqq69q9TS7GBKo+hwng8xA1ezQ
   uwRW7l7Au0QC0eB1M2KbeHWJhlSQUDGDWKkWvS8g96Uy/BPea7ox4InCF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="378298502"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="378298502"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 22:12:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="745516649"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="745516649"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 29 Nov 2023 22:12:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8aHi-0001QV-0f;
	Thu, 30 Nov 2023 06:12:26 +0000
Date: Thu, 30 Nov 2023 14:11:30 +0800
From: kernel test robot <lkp@intel.com>
To: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Christoph Hellwig <hch@lst.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 4/7] dma-mapping: Add helpers for dma_range_map bounds
Message-ID: <202311301356.csZAdTTh-lkp@intel.com>
References: <b6626985d97ddc33a23b4b9fafa881b35001547e.1701268753.git.robin.murphy@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6626985d97ddc33a23b4b9fafa881b35001547e.1701268753.git.robin.murphy@arm.com>

Hi Robin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/acpi-bus linus/master rafael-pm/devprop v6.7-rc3 next-20231129]
[cannot apply to joro-iommu/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Robin-Murphy/OF-Simplify-DMA-range-calculations/20231130-024624
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/b6626985d97ddc33a23b4b9fafa881b35001547e.1701268753.git.robin.murphy%40arm.com
patch subject: [PATCH 4/7] dma-mapping: Add helpers for dma_range_map bounds
config: arm-lpc32xx_defconfig (https://download.01.org/0day-ci/archive/20231130/202311301356.csZAdTTh-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311301356.csZAdTTh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311301356.csZAdTTh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm/mm/dma-mapping.c:17:
>> include/linux/dma-direct.h:54:19: warning: implicit conversion from 'u64' (aka 'unsigned long long') to 'dma_addr_t' (aka 'unsigned int') changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
      54 |         dma_addr_t ret = U64_MAX;
         |                    ~~~   ^~~~~~~
   include/linux/limits.h:25:19: note: expanded from macro 'U64_MAX'
      25 | #define U64_MAX         ((u64)~0ULL)
         |                          ^~~~~~~~~~
   1 warning generated.


vim +54 include/linux/dma-direct.h

    51	
    52	static inline dma_addr_t dma_range_map_min(const struct bus_dma_region *map)
    53	{
  > 54		dma_addr_t ret = U64_MAX;
    55	
    56		for (; map->size; map++)
    57			ret = min(ret, map->dma_start);
    58		return ret;
    59	}
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
