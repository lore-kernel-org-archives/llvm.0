Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863723D1CD5;
	Wed,  8 Apr 2026 14:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775658088; cv=none; b=tQirRMfO1GJIDjoL9VeEx3D53IBr7cLM7QkJTLIaxHSzEXn6B8wwLP0r8T0b2FnpQfG8GYZqjL/yCw4a56heWO84CsahhFZocYNKHcAnWmQ+4oB6IIGoIE1xAarmLLUYjM+MYLIF4jnHG8e1j6JzNdH9XwYumv+y2/iW1QlpQKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775658088; c=relaxed/simple;
	bh=6NXNG+Zc/tVsYcATUfAIaCF6TmpkBx/HH5iegrgNWwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BcJatfoY6tXI/mT63EB5UgKz8aaNSBY+Q8rEWDrHFisyNppYdO41ijk38Hht/KYMa2AWvHHIkfDMPexLZV+KwpoSp9Rj/cPnSAIRxcwyTMUZJpAEHd06mPkBVCbjqSbGclUNpkMw2SM1pFTnlieygKGX7Yn5aANfB9cwtg8zN0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e2SfUIuA; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e2SfUIuA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775658086; x=1807194086;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6NXNG+Zc/tVsYcATUfAIaCF6TmpkBx/HH5iegrgNWwA=;
  b=e2SfUIuA5TCVApSneWGtDzARnMArDVZHuzB8AFk6NTmwy5CrNyTPehgg
   Xau/QYK7JbTH45MklbD/wAAVtMa7jNkm9lMFUSkY030+CtvsBx1ZR5NgW
   5xwZGe47sD/j+v6JkEkQf6DqqWVx+5jk0/Yu82CxzbYjSEg/eDQN4c2qY
   MDHncf2b/taUHgLzL8MKvSCdvDmtY/jDJU6xeHwD77sfdurTxYRx5vtzA
   330gpnBeiSlTn/iUFyFn0pxw4hN7x1NlDIrFz3LAhTzyfZVDjHFM4Uaqv
   gaaSyI7AcgJwEXaQdG7BkpzWN4M+z/yLDKGQbhgHdGqhPJN59yj8Tsr/F
   w==;
X-CSE-ConnectionGUID: +eLvyqiESGO83vC8pTS8Eg==
X-CSE-MsgGUID: ImT01UWZRzyOUv783OiTZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76656149"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="76656149"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 07:21:26 -0700
X-CSE-ConnectionGUID: clm0u3PbSd2snKo0C8ugHA==
X-CSE-MsgGUID: cJFbl3a3SuWdl8gUunITWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="227629563"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.72])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 07:21:23 -0700
Date: Wed, 8 Apr 2026 17:21:20 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Alexandru-Catalin Ionita <alexandru-catalin.ionita@nxp.com>,
	Ciprian Costea <ciprianmarian.costea@nxp.com>,
	"Radu Pirea (NXP OSS)" <radu-nicolae.pirea@oss.nxp.com>
Subject: Re: ld.lld: error: undefined symbol: __bad_ndelay
Message-ID: <adZkYM2MUiUFlI5M@ashevche-desk.local>
References: <202603311958.ly6uROit-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202603311958.ly6uROit-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Mar 31, 2026 at 07:21:42PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   d0c3bcd5b8976159d835a897254048e078f447e6
> commit: 4434072a893e4864519c167947083ff3e4cc2d95 iio: adc: Add the NXP SAR ADC support for the s32g2/3 platforms
> date:   3 months ago
> config: x86_64-buildonly-randconfig-001-20260331 (https://download.01.org/0day-ci/archive/20260331/202603311958.ly6uROit-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603311958.ly6uROit-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603311958.ly6uROit-lkp@intel.com/

My understanding that in some interesting cases (CONFIG_COMMON_CLK=n) this
leads to division by 0 that compiler prevents by saturating the value. Note,
I haven't checked the real assembly for that, just a speculation based on
the code reading and kernel configuration (*).

With saturated value it's obviously is over any given threshold which is
currently 20000.

*Yes, seems the specifications says that this is UB (as unspecified)
and compiler may do whatever it wants in such a case. Here it seems does
the saturation (which is logically okay as 0 is compile-time constant).
Related: https://github.com/llvm/llvm-project/issues/136679.

> All errors (new ones prefixed by >>):
> 
> >> ld.lld: error: undefined symbol: __bad_ndelay
>    >>> referenced by delay.h:78 (include/asm-generic/delay.h:78)
>    >>>               vmlinux.o:(nxp_sar_adc_probe)
>    >>> referenced by delay.h:78 (include/asm-generic/delay.h:78)
>    >>>               vmlinux.o:(nxp_sar_adc_read_raw)
>    >>> referenced by delay.h:78 (include/asm-generic/delay.h:78)
>    >>>               vmlinux.o:(nxp_sar_adc_read_raw)
>    >>> referenced 2 more times

-- 
With Best Regards,
Andy Shevchenko


