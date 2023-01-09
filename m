Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7C83C0B
	for <llvm@lists.linux.dev>; Mon,  9 Jan 2023 17:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673285752; x=1704821752;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Oc3up1tIJXFobHGzmlb1xgFIEQN0bCsytgnQj6AycjA=;
  b=NZg7RuyyAezG/Fk0NRPcYpZP2uVBRJsVo3ObumbL3tMNObxvSCXcsKGR
   PaytYsgrQ3elcjUk3TE9QEO/LlhVtyTmfCIVk3VcD7nbWbnFuxKxVGipQ
   c7qN4yoHzmXsq23iG0zNatHuRdO/e4KLyCsawLIGIqiGxNx2urYAtSHiY
   H3+gLxc1adFrcA0OyQq8Oxxf8FhLMvKT0VXXNg1kRw2cYfqmxpLc+DJW1
   C5Xbp0RoB0kL71+Y/NHQcg3Suky38/HjXSzqcfrL2NMQlzrFv1A71F+H7
   NisfwDqmnFD8uabhDZx3fm4C0kHkcZq1rARkl0Fh0g6zVHAVavPZLuyKI
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="302633614"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="302633614"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2023 09:35:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="650074389"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="650074389"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 09 Jan 2023 09:35:48 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pEw3m-006dM8-2R;
	Mon, 09 Jan 2023 19:35:46 +0200
Date: Mon, 9 Jan 2023 19:35:46 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Vincent Knecht <vincent.knecht@mailoo.org>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1 1/1] leds: is31fl319x: Wrap mutex_destroy() for
 devm_add_action_or_rest()
Message-ID: <Y7xQcmYZ8/aSkA2v@smile.fi.intel.com>
References: <20221228093238.82713-1-andriy.shevchenko@linux.intel.com>
 <Y7xJexzNrs4c7WP/@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7xJexzNrs4c7WP/@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jan 09, 2023 at 05:06:03PM +0000, Lee Jones wrote:
> On Wed, 28 Dec 2022, Andy Shevchenko wrote:

...

> Applied, thanks

Thank you and HNY!

-- 
With Best Regards,
Andy Shevchenko


