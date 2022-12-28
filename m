Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8257A10E9
	for <llvm@lists.linux.dev>; Wed, 28 Dec 2022 10:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672222203; x=1703758203;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p7xqZXo5IKpr6KOWnO3cTK7Dy0Ni0wAmW41qxZQRYvc=;
  b=miGaZV7BOUUHLWE4kH1EE4EYCIswu4PKt+Ec1Og0yWa40zU9/FBOFRBY
   1EajxR32Q2H06pEVyH29rbYRBz2uta8e2qcBoWdTbILxYhtPqcKJGU3vU
   O2gKy7k00wxhHTsJJA2g86c7Wbp8cVjukQ6hoJt/rittR2VaIQ/AukKqm
   sZm8Mspz8Qaq0SWgNWIJHteOzM3R3caIHugQiJE3Q5ylaiUAkHMye68PS
   3HRP/SyarHgRd7kfxHADehfgTIJFZ3EbMCzpOhlID8Q16qUE10veiLLcz
   BeRozEDRNfgi/DUHguqoaym/jyMe36h3pTb0hgLcChbSbUAxaqIQo6R3Y
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="304345925"
X-IronPort-AV: E=Sophos;i="5.96,280,1665471600"; 
   d="scan'208";a="304345925"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2022 02:10:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="683873918"
X-IronPort-AV: E=Sophos;i="5.96,280,1665471600"; 
   d="scan'208";a="683873918"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 28 Dec 2022 02:10:00 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pATNm-000Wkv-0J;
	Wed, 28 Dec 2022 12:09:58 +0200
Date: Wed, 28 Dec 2022 12:09:57 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pavel Machek <pavel@ucw.cz>, Vincent Knecht <vincent.knecht@mailoo.org>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Lee Jones <lee@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1 1/1] leds: is31fl319x: Wrap mutex_destroy() for
 devm_add_action_or_rest()
Message-ID: <Y6wV9afM+aDBxapQ@smile.fi.intel.com>
References: <20221228093238.82713-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221228093238.82713-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Dec 28, 2022 at 11:32:38AM +0200, Andy Shevchenko wrote:
> Clang complains that devm_add_action() takes a parameter with a wrong type:
> 
> warning: cast from 'void (*)(struct mutex *)' to 'void (*)(void *)' converts to incompatible function type [-Wcast-function-type-strict]
>     err = devm_add_action(dev, (void (*)(void *))mutex_destroy, &is31->lock);
>                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     1 warning generated.
> 
> It appears that the commit e1af5c815586 ("leds: is31fl319x: Fix devm vs.
> non-devm ordering") missed two things:
> - while mention devm_add_action_or_reset() the actual change got
>   devm_add_action() call by unknown reason
> - strictly speaking the parameter is not compatible by type
> 
> Fix both issues by switching to devm_add_action_or_reset() and adding a
> wrapper for mutex_destroy() call.

This should be read as v2 actually (but code wise the v1 and v2 has no difference).

-- 
With Best Regards,
Andy Shevchenko


