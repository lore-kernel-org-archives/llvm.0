Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0E21537D9;
	Tue, 22 Oct 2024 00:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729556765; cv=none; b=dinhSMGhi7PVXmDysapx5CHo4tIvIDKYJw8CvpjJ86vdYrN5dG9z75CdmhyShM0RTi4E+tZivjorbDmCwaUfzsVA0+tJcVK1v2c1pRLG7u+56c4wYqAZnckTLgPimM9vko32cvP7PsA4WRUZwNUpJXiCU9Q4G5A4UZahHFT+SZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729556765; c=relaxed/simple;
	bh=J5A1HHH1wdAgcXygyy9cFAqqFrJtZl89Cf0UB6VqlTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FZRPYUixTvDTjPRNQQtYG/Q5PviP6Qb0JY4Zru3c4mfkdC1OsLUXAu89N2Sqw3/FoEmsSrJ7zUKYfT6akEFHwdlDb7EfCkGIum5yYLBG4+J3mkimGzQqJ1xX9P5DkKI9VEWkKDyMEC/6Wmkp8x8wjaWQq+SKX+dUO2IfKrmmD+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JtQ53y6q; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JtQ53y6q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729556764; x=1761092764;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J5A1HHH1wdAgcXygyy9cFAqqFrJtZl89Cf0UB6VqlTM=;
  b=JtQ53y6qHi+JpLCHDU24UPJQvQ+PV5nu1ydVl6O+N0QyemetVzLnJ7DN
   vnjbZW9Bx84Q/yi03mkinRyjbWki4GfxdTm8CHOfl8M1tFAGMY9bMfDqk
   RPTMhJEUoa0iL88sQeaiBYZXx1184OzIpPOgsjFgz5hpzBi3Qxal8955o
   bTmKPm/4KApcRnMWj8VDizP4Xb9XA5tqtcZgKr9QqzKdidyUwRerbdQ7X
   PMHHWjnEUE+EXj+taOsBhGAyhqIfkDXwVKnKqaYzwLIFyvuKIc8d2YmwU
   JWIfiCpK9IEVj84Ve+VfyQV+mJqKgl/UzV+z90RLb5F5qYYq2ozE/PXib
   A==;
X-CSE-ConnectionGUID: +MqsnYCxSz24VGS1wSbTJQ==
X-CSE-MsgGUID: T0ZXjhjTTFGFkPhi9gp2gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46535672"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46535672"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 17:26:03 -0700
X-CSE-ConnectionGUID: GQNY5enJTfOn0akRNtmLbg==
X-CSE-MsgGUID: hXTttgOsQsuwrNS3GLfDeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="79772055"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Oct 2024 17:25:59 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t32ij-000Soc-1l;
	Tue, 22 Oct 2024 00:25:57 +0000
Date: Tue, 22 Oct 2024 08:24:57 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Zhao <yuzhao@google.com>, Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Muchun Song <muchun.song@linux.dev>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Douglas Anderson <dianders@chromium.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Nanyong Sun <sunnanyong@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yu Zhao <yuzhao@google.com>
Subject: Re: [PATCH v1 3/6] irqchip/gic-v3: support SGI broadcast
Message-ID: <202410221026.yJKHaGWA-lkp@intel.com>
References: <20241021042218.746659-4-yuzhao@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021042218.746659-4-yuzhao@google.com>

Hi Yu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 42f7652d3eb527d03665b09edac47f85fb600924]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Zhao/mm-hugetlb_vmemmap-batch-update-PTEs/20241021-122330
base:   42f7652d3eb527d03665b09edac47f85fb600924
patch link:    https://lore.kernel.org/r/20241021042218.746659-4-yuzhao%40google.com
patch subject: [PATCH v1 3/6] irqchip/gic-v3: support SGI broadcast
config: arm-defconfig (https://download.01.org/0day-ci/archive/20241022/202410221026.yJKHaGWA-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241022/202410221026.yJKHaGWA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410221026.yJKHaGWA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-gic-v3.c:1401:8: warning: shift count >= width of type [-Wshift-count-overflow]
           val = BIT(ICC_SGI1R_IRQ_ROUTING_MODE_BIT) | (irq << ICC_SGI1R_SGI_ID_SHIFT);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^  ~~~~
   1 warning generated.


vim +1401 drivers/irqchip/irq-gic-v3.c

  1396	
  1397	static void gic_broadcast_sgi(unsigned int irq)
  1398	{
  1399		u64 val;
  1400	
> 1401		val = BIT(ICC_SGI1R_IRQ_ROUTING_MODE_BIT) | (irq << ICC_SGI1R_SGI_ID_SHIFT);
  1402	
  1403		pr_devel("CPU %d: broadcasting SGI %u\n", smp_processor_id(), irq);
  1404		gic_write_sgi1r(val);
  1405	}
  1406	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
