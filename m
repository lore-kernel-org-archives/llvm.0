Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E214E73B5
	for <llvm@lists.linux.dev>; Wed, 30 Sep 2026 14:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790776926; cv=none; b=YlaevJQGsnQKxcXUHKtK/H3gBIJusGjTR1LsEVFRd6QOuebMftJOLg3wgeXCCZmmiZH8/KFg8ZA3QzgpllMRFCoSuNjSU/5JkLsw5oGtaMCwy0WHTdlIxjHxImKM4Z2jbTwCTVthl/ag1SAO0pWGhmssJBD+70RNY0aGRABxE6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790776926; c=relaxed/simple;
	bh=c1KN+vYvMD+3I5cn67WuoyPhvPexzFwIOWADWWOvsr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CC405xDIeSzfd02s82VbV1xCOrfsO3lliYwjJ4iK4YJqFnfElb2aywk2OXqYSj9HMLbqh86HS/Ndu6IXMfI7KY2rl3pu6+sbFl0d20v6gbu3XrffrwgWNx58WJ7hQcWUoPp6aWBMjjVsTkipzntJ65/nB4DKEjFIYxDzpsiQjUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e8P51vRY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e8P51vRY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790776919; x=1822312919;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c1KN+vYvMD+3I5cn67WuoyPhvPexzFwIOWADWWOvsr0=;
  b=e8P51vRYuFcyyJg71aDYC6CPasF74jWyZz5WQcZDXEV/c9DPElyyKKKd
   OSNXSIDM0VRUk+3beAU2RH4It9GBc6kmukUk2WnzgZK7vTaf2A4DMfsWq
   60sfq2o/uJV/kyTQ7Fyi1aUncEfAT38zmbKzgs93B/DJOcBWjKvtNsm8h
   LHRtdegEFgZjHvjzjwSCbqqLx+2Z5V+MYLNjxUj1t1EOtnyZrXJBWn0qW
   3EMdC861AfQQm6i75CkGa763zEq9tQBViW/mnjRdLV86rRJpj2uOQkTC7
   BlxHDOAHtJt+FhDe7p8lOwqO6BzmCLBHGgISGynUqBwfkCj6aDlwgURwu
   w==;
X-CSE-ConnectionGUID: ZDSCWi4ASB6PHM4aqqdr8w==
X-CSE-MsgGUID: mJ4c3Q3TR7mr5DS7u+xx7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="94395731"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="94395731"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 07:01:55 -0700
X-CSE-ConnectionGUID: XDG/XW3GRnOxOIadxF8V2A==
X-CSE-MsgGUID: zukZDBVmTM62XLLs6jSGUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="273780212"
Received: from spandruv-desk1.amr.corp.intel.com (HELO localhost) ([10.245.245.137])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 07:01:50 -0700
Date: Wed, 30 Sep 2026 17:01:47 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Rupesh Majhi <zoone.rupert@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v10 2/4] iio: pressure: dps310: derive the drain interval
 from the watermark
Message-ID: <ar0WS5MGL3mqBQHY@ashevche-desk.local>
References: <20260930100158.957977-1-zoone.rupert@gmail.com>
 <20260930100158.957977-3-zoone.rupert@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930100158.957977-3-zoone.rupert@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 30, 2026 at 01:01:56PM +0300, Rupesh Majhi wrote:
> The drain interval only tracked how fast the FIFO fills, so a small
> watermark still waited half a FIFO for its samples. Take the watermark
> as the number of scans to wait for, but never drain slower than half a
> fill.

...

> -	unsigned int fill_ms;
> +	unsigned int fill_ms, want_ms;

What about

	unsigned int drain_interval_ms, fill_ms, want_ms;

> +	int scan_rate;

>  	fill_ms = MSEC_PER_SEC * DPS310_FIFO_DEPTH / (prs_rate + tmp_rate);
>  
> -	return clamp(fill_ms / 2, DPS310_DRAIN_MIN_MS, DPS310_DRAIN_MAX_MS);
> +	/*
> +	 * There is no hardware watermark, so take it as the number of scans
> +	 * the user will wait for and drain at that rate. Scans come from
> +	 * whichever measurement drives them.
> +	 */
> +	if (test_bit(DPS310_SCAN_PRESSURE, data->iio->active_scan_mask))
> +		scan_rate = prs_rate;
> +	else
> +		scan_rate = tmp_rate;
> +
> +	want_ms = data->watermark * MSEC_PER_SEC / scan_rate;

> +	return clamp(min(want_ms, fill_ms / 2), DPS310_DRAIN_MIN_MS,
> +		     DPS310_DRAIN_MAX_MS);

	drain_interval_ms = min(want_ms, fill_ms / 2);

	return clamp(drain_interval_ms, DPS310_DRAIN_MIN_MS, DPS310_DRAIN_MAX_MS);

?

-- 
With Best Regards,
Andy Shevchenko


