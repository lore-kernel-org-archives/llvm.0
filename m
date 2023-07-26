Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082E137991;
	Wed, 26 Jul 2023 16:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690388410; x=1721924410;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o067iCH+8OoAcXJbQwYJ/ne9brMepb9+J6sApO0wauk=;
  b=iPqrFDZY8vGkn3YON2CugTdZxiNGAmiul/9zhiXoH4Rw/hcA+JyLsb+h
   Zgw97FA8CQlI6A1Lv8buIQmCIMHnvYGGIiEeRZlCjdvkio09tAmF7Fysb
   /sMidlWU29cl+u8+5NV/0CTp+08aV4t1IxLcdMieu7L9VSA6QOeZFZJWs
   dTYXzQGErcIHDP9BIQg4o4JzOECgjbUt06ww1EjaGJFq//LUa8rdtUsQF
   zUjW0dAQkaAaPKkgug5KpkB7crUYXKpTho501SI0z49UdX550TNdFQ/cW
   JDKS01NILpMhbDolAb69vIjQ1H5mNGZ/7W3l/ckggSpdHI92RZZCjKOhD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="368083874"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="368083874"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 09:20:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="720533384"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="720533384"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 26 Jul 2023 09:20:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qOhF5-00EjU9-2l;
	Wed, 26 Jul 2023 19:20:03 +0300
Date: Wed, 26 Jul 2023 19:20:03 +0300
From: 'Andy Shevchenko' <andriy.shevchenko@linux.intel.com>
To: David Laight <David.Laight@aculab.com>
Cc: 'kernel test robot' <lkp@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	'Andrew Morton' <akpm@linux-foundation.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Christoph Hellwig <hch@infradead.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH next 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Message-ID: <ZMFHs4MV6vUhwn7r@smile.fi.intel.com>
References: <454f967d452548a9acfa7c0a0872507e@AcuMS.aculab.com>
 <202307252359.Is4T2MXC-lkp@intel.com>
 <350c7fe495424138afd15d797830c417@AcuMS.aculab.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <350c7fe495424138afd15d797830c417@AcuMS.aculab.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Jul 26, 2023 at 08:30:59AM +0000, David Laight wrote:
> From: kernel test robot
> > Sent: 25 July 2023 16:58
> > 
> > kernel test robot noticed the following build errors:

...

> >    In file included from init/calibrate.c:8:
> > >> include/linux/jiffies.h:427:28: error: call to undeclared function 'static_assert'; ISO C99 and
> > later do not support implicit function declarations [-Wimplicit-function-declaration]
> >      427 |         return jiffies_to_clock_t(max(0L, delta));
> >          |                                   ^
> ...
> >    include/linux/minmax.h:29:3: note: expanded from macro '__cmp_once'
> >       29 |                 static_assert(__types_ok(x, y),         \
> 
> This is fixed by the earlier patch:
> [PATCH v1 1/1] minmax: Fix header inclusions
> 
> which adds #include <linux/build_bug.h> and thus defines static_assert().
> 
> Can I just assume that will be applied?

You can test that and reply there with your Tested-by there, it will help it
to be applied.

-- 
With Best Regards,
Andy Shevchenko


