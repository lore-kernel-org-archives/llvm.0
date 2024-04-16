Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787551292D7;
	Tue, 16 Apr 2024 13:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713272794; cv=none; b=n/JNMVL9nRz/u9SMksh5bVKBoE+cFwsvMplLME87Ncl+Az34k+p0Ej9Y0DvKhXJR3o7FzGKzlC/oVcB/i9Ksayzv6sUVN4v7PtzVS+K4kNrR5wWBh1BUc5LMVvglmopRjZwCcsHOguCe/w1lIkRZB5375VUSgzY9fKDxZ6T3LKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713272794; c=relaxed/simple;
	bh=jmHRR8sXClS9f1Y9DSFHDOIPH8LRdErBUeW4u5th0Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UTy8up+eVqEOpVr23g9F2Rm3toQtpHzRduNSlh4D8HHzemi4fNBK3NREKfn3e0Q73PTDKgkRDMjEQ1iNVgP/yEaFn4hkQAyY5Ob37VUWNKZisqCTcBUj9z0HA+X74noP2LRD6ygFmWyHxB8jxTpa2DsF3PoF/47bryFue0IURfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZMiaDdxn; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZMiaDdxn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713272790; x=1744808790;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jmHRR8sXClS9f1Y9DSFHDOIPH8LRdErBUeW4u5th0Tk=;
  b=ZMiaDdxnYis20xDAam75NZZrIQFO8qYzQmGk6zMRcwhD4lUSAKJioOAp
   kHNM93NVGjnNSMn1dsEjBt17mT/32v8Geddpy/v+fhUsg7diRrXdD9XTN
   aSFKpIfwq4+MFHTPU2D4d5e/NV6+AKZ8PacW2yfcQZX5VVDwXms5aj4j+
   gT7K9Dyv00KwEouLY+Wy4Gz3LMraxxbYl4laOqXOfA3GgW+dd29bECR7H
   026S8akzHDzNFn1bujRf4PFHl4sSpmXDoh/ekwooofZyoe14i2mKVJtjr
   r8yXWbgaCGMramb0E36F/+xG4el5qpmNckehlB0c8+YOE8MnZcIMpLLR6
   A==;
X-CSE-ConnectionGUID: KiBw9IyvSziinCWXskxj1A==
X-CSE-MsgGUID: pQgs7DkqTfez1qByha7K8Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8819600"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8819600"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 06:06:29 -0700
X-CSE-ConnectionGUID: ufZkI9ndREK4AENEdXTxXA==
X-CSE-MsgGUID: tQVGuQJiQsuE2lxNKJM9ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="27049831"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 06:06:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rwiW0-00000004hX4-1uV2;
	Tue, 16 Apr 2024 16:06:24 +0300
Date: Tue, 16 Apr 2024 16:06:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [pdx86-platform-drivers-x86:review-hans 40/59]
 drivers/platform/x86/amd/pmc/mp2_stb.c:94:2: error: call to undeclared
 function 'writeq'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <Zh53z2VOwRFTYhVK@smile.fi.intel.com>
References: <202404161050.NSNJAxvX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202404161050.NSNJAxvX-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 16, 2024 at 10:35:55AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-hans
> head:   0aae4c44b032b5ede39405dfc62900adc467f362
> commit: 2dc77993cb5eb311d6bb5584d30c3d1d42d9fa4a [40/59] platform/x86/amd/pmc: Add AMD MP2 STB functionality
> config: i386-randconfig-011-20240416 (https://download.01.org/0day-ci/archive/20240416/202404161050.NSNJAxvX-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404161050.NSNJAxvX-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404161050.NSNJAxvX-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/platform/x86/amd/pmc/mp2_stb.c:94:2: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>       94 |         writeq(mp2->dma_addr, mp2->mmio + AMD_C2P_MSG1);
>          |         ^
>    drivers/platform/x86/amd/pmc/mp2_stb.c:267:45: warning: shift count >= width of type [-Wshift-count-overflow]
>      267 |         rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
>          |                                                    ^~~~~~~~~~~~~~~~
>    include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
>       77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
>          |                                                      ^ ~~~
>    1 warning and 1 error generated.

This is bogus, but can perhaps be 'fixed" with GENMASK((n) - 1, 0).

-- 
With Best Regards,
Andy Shevchenko


