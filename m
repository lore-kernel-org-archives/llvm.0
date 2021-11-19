Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA9B2C82
	for <llvm@lists.linux.dev>; Fri, 19 Nov 2021 17:46:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10173"; a="234404715"
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; 
   d="scan'208";a="234404715"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2021 09:44:15 -0800
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; 
   d="scan'208";a="605621417"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2021 09:44:13 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1mo7vj-008bil-2h;
	Fri, 19 Nov 2021 19:44:07 +0200
Date: Fri, 19 Nov 2021 19:44:06 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>,
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [pinctrl-intel:review-andy 18/19]
 drivers/pinctrl/pinctrl-zynqmp.c:825:13: warning: variable 'pin' is
 uninitialized when used here
Message-ID: <YZfiZmd14pD4JQMY@smile.fi.intel.com>
References: <202111191618.SSj1gGvK-lkp@intel.com>
 <YZdhYEVCgqh5MB3J@smile.fi.intel.com>
 <YZfc4wmvcQW9Kpcz@archlinux-ax161>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZfc4wmvcQW9Kpcz@archlinux-ax161>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 19, 2021 at 10:20:35AM -0700, Nathan Chancellor wrote:
> On Fri, Nov 19, 2021 at 10:33:36AM +0200, Andy Shevchenko wrote:
> > On Fri, Nov 19, 2021 at 04:08:32PM +0800, kernel test robot wrote:

...

> > > All warnings (new ones prefixed by >>):
> > > 
> > > >> drivers/pinctrl/pinctrl-zynqmp.c:825:13: warning: variable 'pin' is uninitialized when used here [-Wuninitialized]
> > >            if (IS_ERR(pin->name))
> > >                       ^~~
> > >    drivers/pinctrl/pinctrl-zynqmp.c:811:37: note: initialize the variable 'pin' to silence this warning
> > >            struct pinctrl_pin_desc *pins, *pin;
> > >                                               ^
> > >                                                = NULL
> > >    1 warning generated.
> > 
> > Utterly inappropriate suggestion by the compiler (it found an actual error,
> > though).
> > 
> > Can be Clang fixed, really?
> 
> I reported this upstream: https://bugs.llvm.org/show_bug.cgi?id=52559

Thanks!

-- 
With Best Regards,
Andy Shevchenko


