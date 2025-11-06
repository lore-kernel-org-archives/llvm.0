Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19868315D5E
	for <llvm@lists.linux.dev>; Thu,  6 Nov 2025 16:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762444886; cv=none; b=KkC1owNuhMop13vt9mJ9huxEb08LaLK56aL5dVTzUOyvQVoB/RA7FhaPnRqInJ3DBFF7a4SOHkVr2omUTeEa16ffnM1UR4YDrygBno2DaZwv/6h1irDzqtWB4xxddGUdhiTmYYRfElPbW2+VRQby91AOT0RpIX68MoGFZzF69NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762444886; c=relaxed/simple;
	bh=aH1cPDzqPQPdxMq2LyoHulcUQRewRxHiOCE9FrWhmxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbqBHFQmFJpKXM/75rPpP6lYBmNTbQpInLto0GllVNWRRvA7CyOQzPg1rYr95sc6Puo21Ki1UVkf15dbwaRGJWm8bfm2E4ppaTyiL6Upx2gB8G/25/Sgd5g6YUfvs9s6CbNlCTSG/8++zQmPgiLyBPlDpNsjTbC9mJYHhcYuTgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JOPXYDAM; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JOPXYDAM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762444884; x=1793980884;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aH1cPDzqPQPdxMq2LyoHulcUQRewRxHiOCE9FrWhmxE=;
  b=JOPXYDAMihv/HQPsbhnr1zq5QPSAEhUR3mOvxkn1akf0Cp5tln/1JU7Z
   AnNWT5lM/zJsG949l8e2gLKUoJqZNgw/kBBh2E38T3lnGO5F9I1TTzrbT
   Thcd+XKJ1X8ZL3aMgDLPsJ9fwZSYlSK1LJBua4iLtiXpUK8mA1L3ckr0T
   9vAmuQnRwoQGmquXbz138pISaWIjU6CInCOb2LWG9mMMI3nmGtNfbyLu0
   jjFJVB8PejjG+pHzhWNvja0xuZzWj3vka+v8NocGbqXfmnn3Q7cKfSx6S
   HPzcUWiAGAyFUzkBETCyGNY0+uhkL0TdXEkww+vY960DV5jgwRXyzb8MR
   Q==;
X-CSE-ConnectionGUID: hLjsUGI3T3u0bkj93DyVuA==
X-CSE-MsgGUID: F4kBz2YgStCoGd4jvGEtHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64283593"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="64283593"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:01:09 -0800
X-CSE-ConnectionGUID: eCncds+MS8KzrkFBpAnuAA==
X-CSE-MsgGUID: AZyPZWebRy+Ih1rpoWvkYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="188509309"
Received: from abityuts-desk.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.224])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:01:07 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vH2Q4-00000006Bjk-0DMb;
	Thu, 06 Nov 2025 18:01:04 +0200
Date: Thu, 6 Nov 2025 18:01:03 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v1 1/1] compiler_types: Warn about unused static inline
 functions on second
Message-ID: <aQzGP8Z-mvSS9w7C@smile.fi.intel.com>
References: <20251106105000.2103276-1-andriy.shevchenko@linux.intel.com>
 <20251106151649.GA1693433@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106151649.GA1693433@ax162>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 06, 2025 at 08:16:49AM -0700, Nathan Chancellor wrote:
> On Thu, Nov 06, 2025 at 11:50:00AM +0100, Andy Shevchenko wrote:

...

> >   * for W=1 build. This will allow clang to find unused functions. Remove the
> >   * __inline_maybe_unused entirely after fixing most of -Wunused-function warnings.

> The comment should be updated to W=2 instead of W=1

Granted.

> and we should
> probably drop the sentence about removing __inline_maybe_unused entirely
> since people such as Peter will never want this behavior by default. I
> do not mind doing it myself if I take it.

But future is uncertain, it might be that GCC also gains this and it won't
confuse anyway as it might become a truth (no more such warnings in the code)
at some point.

-- 
With Best Regards,
Andy Shevchenko


