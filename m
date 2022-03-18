Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C364C60
	for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 14:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647612261; x=1679148261;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jcrYNvI61V8kUynPI7hV1XW2k5B5q68nF1eRgoRh4Cw=;
  b=maQQMBTDoL3J0nb/8cYTLa4tPMwEp4h2ayAP3iQggYUe7XFSeg1QdLE3
   s76AKn+zuufBtUISYAcx/ban1BTj2isaFUf5J1VDRQvdJLqog6VEP6aRY
   pghst4Kw15xcQfb4E698inm91uyhch0z8wOUwr9L5DeWS9kpXyrPTXKjW
   D8jTm01GSkjT8zFwOX3qj/0Fq1AATWa55M2vAbcHHxhHNhGf6w2yYJhzD
   ubxNHfnDCWUQew49euNN1uEGR11D2uCvan7Pzcw8H6C3GyUY9AuFEmQxT
   TvbxByORNjoI27s9jXCAn2qBNVteUNjnQfS81Cs4nNtUOGe60B3ev8VAW
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="237086636"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="237086636"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 07:04:20 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="499258563"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 07:04:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1nVDCc-002GJv-Mm;
	Fri, 18 Mar 2022 16:03:38 +0200
Date: Fri, 18 Mar 2022 16:03:38 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Bill Wendling <morbo@google.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Nathan Chancellor <nathan@kernel.org>, linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] gpiolib: acpi: use correct format characters
Message-ID: <YjSROmYwwGhpsXMl@smile.fi.intel.com>
References: <20220316213055.2351342-1-morbo@google.com>
 <YjL6K49CkH+YC4FQ@smile.fi.intel.com>
 <CAKwvOdkjb3uR+kqjfdKL5gqA8R+00c5=3E7uGGW+mGZ3QRsjqg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdkjb3uR+kqjfdKL5gqA8R+00c5=3E7uGGW+mGZ3QRsjqg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Mar 17, 2022 at 11:11:21AM -0700, Nick Desaulniers wrote:
> On Thu, Mar 17, 2022 at 2:07 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Wed, Mar 16, 2022 at 02:30:55PM -0700, Bill Wendling wrote:

> > NAK.

I hope you read my follow up to this.

> Andy,
> Our goal is to enable -Wformat for CC=clang.  Please see also:
> commit cbacb5ab0aa0 ("docs: printk-formats: Stop encouraging use of
> unnecessary %h[xudi] and %hh[xudi]")

Not that I agree on that commit for %h[h]x

	signed char ch = -1;
	printf("%x\n", ch);
	printf("%hhx\n", ch);

That's why my first reaction on this change was NAK.

> and the lore link it cites.
> https://lore.kernel.org/lkml/CAHk-=wgoxnmsj8GEVFJSvTwdnWm8wVJthefNk2n6+4TC=20e0Q@mail.gmail.com/
> (I saw your follow up; this patch is one of the less controversial
> ones though since the types are not ones that are promoted).

That said, I hope you are very well aware of the case.

-- 
With Best Regards,
Andy Shevchenko


