Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FE9242D86;
	Mon, 19 Jan 2026 08:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768810889; cv=none; b=QU1DajpxMmWxb6QQVr/EAGP2VzEKXfnReCrvezvxHoUuaw8xKnSxpdw6Nk/XAAxyZGtoTZLIqOaB94DKApwTvA8nteB4K8szNnoo4FgFtUGLBlBytS/vYb4hAVWtbzCKEnsfAkM31gg8pVoh1CTyu5am+vQPDo/BX9KYFV/4+Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768810889; c=relaxed/simple;
	bh=yWIuGDCzdMvsLFpHkHy6dqOvi7Er+zXe2kGVQJpyS4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qYpMze1s5azeGyQi3reW1bAAdYuG7jEqHnAkm2/yvH7j4Bgk6HaeapXKeQGCJuMHXrFlp54HPXErabmTrdc+0Zkpashb+/P5EBJuy6mRaZGtfCpDrdGy+VCQ4WfANzJpor3OXXMC0Kgu33kUNjfe6fHbD+PG7BGKaZ26wDT3sZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b+CNlb65; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b+CNlb65"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768810888; x=1800346888;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yWIuGDCzdMvsLFpHkHy6dqOvi7Er+zXe2kGVQJpyS4g=;
  b=b+CNlb65x+eOTI5Bblgb0bcqIC7ebrjmnW2Tx/uWrntW11RR2CXDt8s4
   jwoHnm+ZYqZwkB/1NP0Fh2dtxKYR3YsGNpbFVBwCM+ZcB9ecibirTdOpi
   t5c2YHLjkbq3aPNv2irlVJ5SsaIvyJIQ9WUXnLjW4+9fUQCOWKhJe86Dn
   Feo6sQNumN4W6qej/PKUVxU/0bfLY6fxkpql6MfO0ne61OzuMi2CTF28V
   b77Xe7blOv59rWRYsrbgG3/djPpp302bQ6kAMYqOwsE7S1GO2lSbbEf1q
   rCNsRMK4K2Fmq33A87nmn9CkJo5ZdU/5EbLYKihGdVit36obOmQfJMSup
   Q==;
X-CSE-ConnectionGUID: Fhy72bWKT6iTwW2vU8ckXg==
X-CSE-MsgGUID: 5SSUFRJySEaReyDiLclXNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69992683"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="69992683"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 00:21:28 -0800
X-CSE-ConnectionGUID: EDzjMCHKTjyzC/EZfZgYEA==
X-CSE-MsgGUID: 8qlOXmrfROC0pE7nQoaDwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="243379162"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.37])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 00:21:24 -0800
Date: Mon, 19 Jan 2026 10:21:21 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] printf: convert test_hashed into macro
Message-ID: <aW3pgf4FQHFCC9Bm@smile.fi.intel.com>
References: <20260116-printf-kunit-printf-attr-v2-1-3dd7fefc3207@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116-printf-kunit-printf-attr-v2-1-3dd7fefc3207@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jan 16, 2026 at 11:27:03AM -0500, Tamir Duberstein wrote:
> This allows the compiler to check the arguments against the __printf

__printf() since it takes parameters, OTOH it's an attribute at the end,
so I have no strong opinion on how to spell it.

> attribute on __test. This produces better diagnostics when incorrect

__test()

*This is reference to a function.

> inputs are passed.

...

> +/*
> + * This is a macro so that the compiler can compare its arguments to the
> + * __printf attribute on __test. This cannot be a function with a __printf
> + * attribute because GCC requires __printf functions to be variadic.

As per commit message remarks.

> + */
> +#define test_hashed(kunittest, fmt, p)                                   \
> +	do {                                                             \
> +		char buf[PLAIN_BUF_SIZE];                                \
> +		plain_hash_to_buffer(kunittest, p, buf, PLAIN_BUF_SIZE); \
> +		test(buf, fmt, p);                                       \
> +	} while (0)

Make sure you used tabs to indent the \:s.

...

The downside of a macro is a killing of compile-time type checks.

-- 
With Best Regards,
Andy Shevchenko


