Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46179132C1F;
	Tue, 16 Apr 2024 18:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713290822; cv=none; b=rrsLcerXHvMVjT6LIOkVESrFsTNZvid78Lv/KWDnynirh5shdKgjVpvc+RyBz7YaUZXOAOvsvO6RP2mYjhof53x2A04o4IuX1HZhA6ahS7IKNF10QPmXBOsNAObWD+A2vmR3LnlJFmshRdQjAr2pUOQFsLlrXJVXliKQ/jXWeKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713290822; c=relaxed/simple;
	bh=5ufwuoQ7wYW3mFGBQOtNQPMyFrpm82r1gQs4C7T3JGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qL/kruFmKOcsNuo+7O2z3FWdme0CddnNmLa1PpqUJhbItiVT694pvP9M+74mbmA0goqAG2k/X0jQzcQAoa9f4R9HwDuQcTNdJgEGL+yXbqLEXE9a8pvR5H4IiPqBeZFivjCg32yZ+JmaomSy4UT2KsP5q0FVwswSDVjZpnNyyPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XpXoAUhb; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XpXoAUhb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713290820; x=1744826820;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5ufwuoQ7wYW3mFGBQOtNQPMyFrpm82r1gQs4C7T3JGE=;
  b=XpXoAUhbaYVSIJMyBRk+VoQoziDwQCmXtxDkTNVmkSuS2J777XrR16ZI
   0mAh31FygIY6TajbhNJDAxmJOjF66zUCaRr2LeO3nzhg6grR2kQYD/6jP
   CWCL1NL68OvdXK+VvuVInkuE0n1Brz5XX84CfxmBVgK2PNyn1mEOUH0yR
   TCYVt9hNCsB9D6gtig7Klts07g2ESDVQQJ7xNZiUjQ5LBopUn0S8chQ58
   vm2MDVbhnU3AJDeVO0mZ1RilKVRCfbO31qjS+NVNRdhecmc8WImXvGUcY
   hcdcYIiluirum8hv9UG1z51O93SmfeDizy+h2cIdHEWbrrgUmDEwcoZoW
   Q==;
X-CSE-ConnectionGUID: PqF2GURUSe2+4IcfcD+zlQ==
X-CSE-MsgGUID: ufy4kqnHRn2y5I7qPgu2YA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8971124"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8971124"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 11:06:45 -0700
X-CSE-ConnectionGUID: PiBmxWpmRQ2GZIqyP8RL1A==
X-CSE-MsgGUID: 8FoCqq/eR7eL2z1pqwrSbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="45626755"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 11:06:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rwnCa-00000004mZi-2PMR;
	Tue, 16 Apr 2024 21:06:40 +0300
Date: Tue, 16 Apr 2024 21:06:40 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [pdx86-platform-drivers-x86:review-hans 40/59]
 drivers/platform/x86/amd/pmc/mp2_stb.c:94:2: error: call to undeclared
 function 'writeq'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <Zh6-MCW_szrniAnb@smile.fi.intel.com>
References: <202404161050.NSNJAxvX-lkp@intel.com>
 <Zh53z2VOwRFTYhVK@smile.fi.intel.com>
 <20240416150916.GA2715839@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240416150916.GA2715839@dev-arch.thelio-3990X>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 16, 2024 at 08:09:16AM -0700, Nathan Chancellor wrote:
> On Tue, Apr 16, 2024 at 04:06:23PM +0300, Andy Shevchenko wrote:
> > On Tue, Apr 16, 2024 at 10:35:55AM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-hans
> > > head:   0aae4c44b032b5ede39405dfc62900adc467f362
> > > commit: 2dc77993cb5eb311d6bb5584d30c3d1d42d9fa4a [40/59] platform/x86/amd/pmc: Add AMD MP2 STB functionality
> > > config: i386-randconfig-011-20240416 (https://download.01.org/0day-ci/archive/20240416/202404161050.NSNJAxvX-lkp@intel.com/config)
> > > compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404161050.NSNJAxvX-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202404161050.NSNJAxvX-lkp@intel.com/
> > > 
> > > All errors (new ones prefixed by >>):
> > > 
> > > >> drivers/platform/x86/amd/pmc/mp2_stb.c:94:2: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
> > >       94 |         writeq(mp2->dma_addr, mp2->mmio + AMD_C2P_MSG1);
> > >          |         ^
> > >    drivers/platform/x86/amd/pmc/mp2_stb.c:267:45: warning: shift count >= width of type [-Wshift-count-overflow]
> > >      267 |         rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
> > >          |                                                    ^~~~~~~~~~~~~~~~
> > >    include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
> > >       77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
> > >          |                                                      ^ ~~~
> > >    1 warning and 1 error generated.
> > 
> > This is bogus, but can perhaps be 'fixed" with GENMASK((n) - 1, 0).
> 
> The second warning only appears because of the first error; if the first
> error is fixed, I suspect the second one won't appear (although I have
> not actually checked it).

Is it confirmed? Because to me it looks not obvious at all ==> complier can be
amended as well in warning reporting

-- 
With Best Regards,
Andy Shevchenko


