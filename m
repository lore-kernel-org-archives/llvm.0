Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32412A922
	for <llvm@lists.linux.dev>; Thu, 19 Jan 2023 16:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674144944; x=1705680944;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BfEES7hM/KFkzDhKaqvx+cc8oD5zFjJ0h/F4pzIFBEU=;
  b=YI0yjfRzhn0xNURmLobQuVLqjdkwch6PercEbGDPhKV1aX03fv59ZwQO
   mlFwyDD8oSkCST8yiRnOLW/xYtrZVFAwHD3G7HnJvsHg5grcupPEF11me
   k6KmYj0e0/S7tHU9Bo+zJNnRjIALh6VpwBAPhFQG24cFBN43iWWgN+6gl
   GNwHpxpeDI95fnV/Cj9vy4O4aroFiU9YZTZRQnvHqbKZFo49+t2rVnu/Q
   iCXqlpydwatG9fbO9GXUR0QWWMrQ0gVJhLyX+WY0w5jTHsG8K0RZnezLB
   aMpZ5dyvDlNLMzfLE5i8yUJoQgv177A6CUKuZmLFv1f/ffeXKHoOqRaQC
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="387695426"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="387695426"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 08:13:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="610115645"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="610115645"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 19 Jan 2023 08:13:08 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pIXXG-00BkPa-0Q;
	Thu, 19 Jan 2023 18:13:06 +0200
Date: Thu, 19 Jan 2023 18:13:05 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Vincent Knecht <vincent.knecht@mailoo.org>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, kernel test robot <lkp@intel.com>
Subject: Re: [resent, PATCH v2 1/1] leds: is31fl319x: Wrap mutex_destroy()
 for devm_add_action_or_rest()
Message-ID: <Y8lsEc2cFR3mMS0N@smile.fi.intel.com>
References: <20230103131553.34124-1-andriy.shevchenko@linux.intel.com>
 <Y8lqRjeM9I/rRrvv@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8lqRjeM9I/rRrvv@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jan 19, 2023 at 04:05:26PM +0000, Lee Jones wrote:
> On Tue, 03 Jan 2023, Andy Shevchenko wrote:

...

> > v2 resent: resent as v2
> > v2: added tag (Vincent), Cc'ed to Lee
> > 
> >  drivers/leds/leds-is31fl319x.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> Not sure what the differences were, but looks like I already applied v1.

Codewise there is none. Thank you!

-- 
With Best Regards,
Andy Shevchenko


