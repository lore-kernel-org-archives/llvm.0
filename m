Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839B32D7DF3;
	Thu, 27 Nov 2025 09:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764235513; cv=none; b=Col4a5kACwETRomGjlMjxm0WUjbTeKn0arTY9oQ891gmhmm90AUfzFYvKl0/Vape86ceacRFbDg89D2FfrS8fzzV764B9TwRunXjfNnTJ+dE5KPdd+513sniIrcLeKnRkYBkOPDuyRbTQasnGF1SRI8+VjnR5GtCYMxa4owkwBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764235513; c=relaxed/simple;
	bh=4kHDwtBoKeq4CzQVsg540iQXr0GbZmTfHhbXN9Au/pM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=azyqtChggJRV7tjHQn/yr6ZDcbfcMp0FM6AAv7LOJOIA3wglUSMoQYLkqmaPny9HpBhsKRV88MXTmirFG7OLWOoKpbVCLROHnrlUGUfETCk8mL+C3e9Yx1bX2NOYKRUcO4YrtzgLq51HOQfjA+pw9bnnPe/MSqREjfshA1Hp/cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TSAcX1jq; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TSAcX1jq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764235512; x=1795771512;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4kHDwtBoKeq4CzQVsg540iQXr0GbZmTfHhbXN9Au/pM=;
  b=TSAcX1jqB5CNlec2qpBHGiymREV33EB2VoHcdvLf9UOgeM+6vZlpfclP
   EHAdBTiTC6WwPUlMwhq7LiIrWwPm4pXVqyD9SYJDcuV5RXwKZNK+X2gTD
   ptzdAflUliEaOdJE45CSRXsGJ55NT3LavIIFCokh1Ph9TMHjyfDmpWQmC
   +dlOx8nHYHhbhlnz69AgpaIbSEzsaw+paSdvk1K1qJasb7ZuCF9CN6uTY
   dIWn5jtyQgRobX22xqjD3BMAFstmhsoRq4tcPDNi8lAZi5AdTp4/itIQp
   bFcp7AeIuR3w2w0h/r30WMhyPWDwgZiEujGMqqPBN2JyjtAhhsnrqD/5a
   Q==;
X-CSE-ConnectionGUID: nGWNGhnOQYK5SPvrbMPr4A==
X-CSE-MsgGUID: Q58KbtdVQk2mx1tm3VTDgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66226406"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="66226406"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 01:25:11 -0800
X-CSE-ConnectionGUID: kUZXdJ63QX6yEcqQIX0p2g==
X-CSE-MsgGUID: XqqtLnzJTPuBFfm3LtZT9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="193000714"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Nov 2025 01:25:09 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOYFP-000000004CL-2gJp;
	Thu, 27 Nov 2025 09:25:07 +0000
Date: Thu, 27 Nov 2025 17:24:19 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] dma-buf: add no-op stubs when CONFIG_DMA_SHARED_BUFFER
 is disabled
Message-ID: <202511271739.cjidjUdn-lkp@intel.com>
References: <6202945f4af2d10e0fb6602b25ff9cb454c1ee85.1764229204.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6202945f4af2d10e0fb6602b25ff9cb454c1ee85.1764229204.git.viresh.kumar@linaro.org>

Hi Viresh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sailus-media-tree/master]
[also build test WARNING on linus/master v6.18-rc7 next-20251127]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Viresh-Kumar/dma-buf-add-no-op-stubs-when-CONFIG_DMA_SHARED_BUFFER-is-disabled/20251127-154307
base:   git://linuxtv.org/sailus/media_tree.git master
patch link:    https://lore.kernel.org/r/6202945f4af2d10e0fb6602b25ff9cb454c1ee85.1764229204.git.viresh.kumar%40linaro.org
patch subject: [PATCH] dma-buf: add no-op stubs when CONFIG_DMA_SHARED_BUFFER is disabled
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251127/202511271739.cjidjUdn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511271739.cjidjUdn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511271739.cjidjUdn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/io_uring.c:101:
   In file included from io_uring/zcrx.h:6:
>> include/linux/dma-buf.h:660:51: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     660 | dma_buf_map_attachment(struct dma_buf_attachment *, enum dma_data_direction)
         |                                                   ^
   include/linux/dma-buf.h:660:76: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     660 | dma_buf_map_attachment(struct dma_buf_attachment *, enum dma_data_direction)
         |                                                                            ^
   include/linux/dma-buf.h:665:72: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     665 | static inline void dma_buf_unmap_attachment(struct dma_buf_attachment *,
         |                                                                        ^
   include/linux/dma-buf.h:666:27: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     666 |                                             struct sg_table *,
         |                                                              ^
   include/linux/dma-buf.h:667:33: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     667 |                                             enum dma_data_direction) { }
         |                                                                    ^
   include/linux/dma-buf.h:695:48: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     695 | static inline int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
         |                                                ^
   include/linux/dma-buf.h:695:73: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     695 | static inline int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
         |                                                                         ^
   include/linux/dma-buf.h:696:24: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     696 |                                unsigned long)
         |                                             ^
   8 warnings generated.


vim +660 include/linux/dma-buf.h

   658	
   659	static inline struct sg_table *
 > 660	dma_buf_map_attachment(struct dma_buf_attachment *, enum dma_data_direction)
   661	{
   662		return NULL;
   663	}
   664	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
