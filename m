Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7D12D879F;
	Thu, 13 Nov 2025 12:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763036174; cv=none; b=ZUoP+yjxW5OoFMGgbJ0+K7uKATqHXGrF8VJw1u5c6RWLaKTD2TJipJCMf82ixbiy6UHdP3nygn+r71YorS6uuAiUPLe5UYdtlrk9n+OmN1j3SCw6B2gPctuVGSqxE+Cvzj88k0EazjPaZZGRHSJTcF8J2gLnhyw0Rt7IoxxNxJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763036174; c=relaxed/simple;
	bh=ymUzwABaCWUeY/arnrVJraJRxCLYt63uNLdgQy6SZvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gTrGxsOcWejIAdqKfKGhzWNM3GO6qm5QVt0EILuVKo6WIDB7e1CsRR+2c3ThSVkBCD5iokqhCESIehYgLjKuPo07UdcAWQMkKdrH0w1ghEP+3MgbodOc2iMLJY9Z30dlRfQK1RHdERfexPKtFHIR+/S8yVxxzQZljXLatBUpW+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CIunMlFR; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CIunMlFR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763036173; x=1794572173;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ymUzwABaCWUeY/arnrVJraJRxCLYt63uNLdgQy6SZvM=;
  b=CIunMlFRQrECgBCqconrQrJzO+Vv/IXe4ryC7Ta2gA7jYGqPdbNXDA7Q
   aCuXaz07Bcrl+8b2L7/yEC/jQj8w0ZHvAIgf/af8W9rik8B83rVfteKjT
   yMvziuQUtBwrXVycN9NfYI7VLR8eAsVBYjNobdZtYmlZ2+y7xaC6hvGFd
   5elFe0h4MFfMPPnVG+ihCHyRzXPuFKFG/rDxcxa1+2UNruxHD4vZ6KPff
   BfbbomaF1aLuhd0tz7NLdbU086BV3d6OGO7wKhj4fgV2gXBUSfCmryFBL
   WJLz370zBMiDccurBsaMPDv21IPCpFm480wxCrxDElI9RC1hEKbIL7Z/7
   Q==;
X-CSE-ConnectionGUID: nwtn4cDkRRS5zKjlS0o/OA==
X-CSE-MsgGUID: o9bVDj86T4mvuynBUAezKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="64998437"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="64998437"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 04:16:11 -0800
X-CSE-ConnectionGUID: FBHEm0HGQ820Oqx66wwwEw==
X-CSE-MsgGUID: 2vKSDQYdRaK2P1TUMPeacA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="193602834"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Nov 2025 04:16:09 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJWFC-0005J5-2e;
	Thu, 13 Nov 2025 12:16:06 +0000
Date: Thu, 13 Nov 2025 20:15:21 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v1 3/5] Input: gpio_decoder - replace custom loop by
 gpiod_get_array_value_cansleep()
Message-ID: <202511131958.6ItfY60O-lkp@intel.com>
References: <20251112191412.2088105-4-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112191412.2088105-4-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on dtor-input/next]
[also build test ERROR on dtor-input/for-linus hid/for-next linus/master v6.18-rc5 next-20251113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/Input-gpio_decoder-make-use-of-device-properties/20251113-032111
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20251112191412.2088105-4-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 3/5] Input: gpio_decoder - replace custom loop by gpiod_get_array_value_cansleep()
config: x86_64-buildonly-randconfig-002-20251113 (https://download.01.org/0day-ci/archive/20251113/202511131958.6ItfY60O-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511131958.6ItfY60O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511131958.6ItfY60O-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/input/misc/gpio_decoder.c:38:53: error: use of undeclared identifier 'val'
      38 |                 dev_err(decoder->dev, "Error reading GPIO: %d\n", val);
         |                                                                   ^
   1 error generated.


vim +/val +38 drivers/input/misc/gpio_decoder.c

    27	
    28	static int gpio_decoder_get_gpios_state(struct gpio_decoder *decoder)
    29	{
    30		struct gpio_descs *gpios = decoder->input_gpios;
    31		DECLARE_BITMAP(values, 32);
    32		unsigned int size;
    33		int err;
    34	
    35		size = min(gpios->ndescs, 32U);
    36		err = gpiod_get_array_value_cansleep(size, gpios->desc, gpios->info, values);
    37		if (err) {
  > 38			dev_err(decoder->dev, "Error reading GPIO: %d\n", val);
    39			return err;
    40		}
    41	
    42		return bitmap_read(values, 0, size);
    43	}
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
