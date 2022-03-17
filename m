Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B603D79
	for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 09:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647508409; x=1679044409;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8IL//g/TMfBIk8JNUXUEvy1l+g02hROaz5Pc67EYVBM=;
  b=OqeyraQ5/JsKcWRfch9QUKYOyFR5MZDyJP28CNGA/JdT7m1bHjdvY4g+
   5epZJId9J5JiJnFpjuFg99Kk0ogajUB1mHwenEYzoYK8cBDnORWodITva
   bewgc9ojKvMGho2RynTrIx1p51UlHPN4cjjlPcYOk8NZeObHdP4ssOLII
   VxSRc17h3gyOP05zPUnkKsfJ6253If2bUL9ivtwC/WBxkHJBs6kwqOY6e
   2SweA4XDsVuMXqPRl5yj8a8mlzne7gqBy7doJi6+VaCZLN+0wMcGuvxG6
   xoBGP3JTx+G7+f70OltOGevVhtm7/HuHsYEGYjUtZNtoF6kT7C+R6SOsK
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="317540744"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; 
   d="scan'208";a="317540744"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2022 02:13:28 -0700
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; 
   d="scan'208";a="635304398"
Received: from smile.fi.intel.com ([10.237.72.59])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2022 02:13:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1nUmBZ-001QAZ-Rm;
	Thu, 17 Mar 2022 11:12:45 +0200
Date: Thu, 17 Mar 2022 11:12:45 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bill Wendling <morbo@google.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] gpiolib: acpi: use correct format characters
Message-ID: <YjL7jWpOCjo9R0SH@smile.fi.intel.com>
References: <20220316213055.2351342-1-morbo@google.com>
 <YjL6K49CkH+YC4FQ@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YjL6K49CkH+YC4FQ@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Mar 17, 2022 at 11:06:51AM +0200, Andy Shevchenko wrote:
> On Wed, Mar 16, 2022 at 02:30:55PM -0700, Bill Wendling wrote:
> > When compiling with -Wformat, clang emits the following warning:
> > 
> > drivers/gpio/gpiolib-acpi.c:393:4: warning: format specifies type
> > 'unsigned char' but the argument has type 'int' [-Wformat]
> >                         pin);
> >                         ^~~
> > 
> > The types of these arguments are unconditionally defined, so this patch
> > updates the format character to the correct ones for ints and unsigned
> > ints.
> 
> hhX specifier refers to unsigned char. It's a bug in the compiler.
> 
> NAK.

Oh, I read this wrong, sorry. The pin has been checked to fit in one byte,
but its type is bigger indeed.

I will apply your patch right away and send as a fix after rc1.

-- 
With Best Regards,
Andy Shevchenko


