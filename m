Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3EB2F2B
	for <llvm@lists.linux.dev>; Wed,  2 Feb 2022 16:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643818655; x=1675354655;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DBfsC8a66ExyypbPhJbhCI57mnu5iWgHbE6gVmzyI2I=;
  b=UEAsdc1Zf/bIqABMlLCUAxtJYiZg1c9ldfcgLC+bseJO2de35sSyI7Vg
   NEDH/X6F2jm7/wdTGpIyKH3tvaTH96Pc8zL/vYNRIJ5AgfcvQ9fJm4dNW
   9t4aUeOXH0AV/N5/MBhD2WwMZY7Hpkc6tpFxVQc3GKGZSl/W7S+TZokyn
   ghxc1DEhrhBpdeyycIkAPvl4E6WkJZlEVZmaLBCjiRqi4C/+6TV9Tq+wr
   pTmQdubyFRkgWGgY2KC07lT04w+j5hdV319NzKkpGPIPWnNeCxZarkar6
   qx/5M5eznWzVfQt/70trNuu4Fr/7VwHcBewRoZ4/gvK6CZiKDXLax6cIU
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="231521034"
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; 
   d="scan'208";a="231521034"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2022 08:17:34 -0800
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; 
   d="scan'208";a="769324845"
Received: from smile.fi.intel.com ([10.237.72.61])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2022 08:17:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1nFIJ2-0008eW-RG;
	Wed, 02 Feb 2022 18:16:28 +0200
Date: Wed, 2 Feb 2022 18:16:28 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Kees Cook <keescook@chromium.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Peter Rosin <peda@axentia.se>, Andy Shevchenko <andy@kernel.org>,
	Matteo Croce <mcroce@microsoft.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] lib/test_string.c: Add test for strlen()
Message-ID: <YfquXPrMX6PdD/6u@smile.fi.intel.com>
References: <20220130183653.491292-1-keescook@chromium.org>
 <20220202160149.GA2322037@roeck-us.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220202160149.GA2322037@roeck-us.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Feb 02, 2022 at 08:01:49AM -0800, Guenter Roeck wrote:
> On Sun, Jan 30, 2022 at 10:36:53AM -0800, Kees Cook wrote:

...

> > +static const int strlen_ce = strlen("tada, a constant expression");
> 
> This results in:
> 
> lib/test_string.c:188:30: error: initializer element is not constant
>   188 | static const int strlen_ce = strlen("tada, a constant expression");
> 
> for several of my tests. I don't think you can mandate that a compiler
> implements this.

With -O2 probably one can, otherwise I agree.

-- 
With Best Regards,
Andy Shevchenko


