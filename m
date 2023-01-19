Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE874A922
	for <llvm@lists.linux.dev>; Thu, 19 Jan 2023 16:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E54EC433D2;
	Thu, 19 Jan 2023 16:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674144332;
	bh=UdfkIT4pkagNyMSdRnF01LnSFEp9DSwK99agBJfkJ78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TKB6KRE98zltc/kjjU9D98v+Ga5C+RcDjgnAyuUqxVss90GnWTp3OygslYnxDAnvJ
	 Utb4vpw4cmaO/J3u/a/x5Y+SOSbOknURjXhr7gUw8PEqDtay1JSXvI4LlEQF0BsFnG
	 KIXD/YnSIn7/ZBYmOMfI8slzvsgwD5FMzk58u53oLnxJf+kCH+CcEIjCaWLGFhQF0s
	 nKsX6FIq/gbH1UFNqcNEDCS7H1Z08+gwauzoGjktQKuITxiG4U69jjBP8Q3IX5W/Bo
	 dSqpnzRFWzvtJAUenHEc1wNUxTTChgu7XuP8FkP0JNejS0w9J8fQlvU8OZbv2l8fb9
	 SmJXl34zvgGKw==
Date: Thu, 19 Jan 2023 16:05:26 +0000
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Pavel Machek <pavel@ucw.cz>, Vincent Knecht <vincent.knecht@mailoo.org>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, kernel test robot <lkp@intel.com>
Subject: Re: [resent, PATCH v2 1/1] leds: is31fl319x: Wrap mutex_destroy()
 for devm_add_action_or_rest()
Message-ID: <Y8lqRjeM9I/rRrvv@google.com>
References: <20230103131553.34124-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230103131553.34124-1-andriy.shevchenko@linux.intel.com>

On Tue, 03 Jan 2023, Andy Shevchenko wrote:

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
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: e1af5c815586 ("leds: is31fl319x: Fix devm vs. non-devm ordering")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Tested-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
> 
> v2 resent: resent as v2
> v2: added tag (Vincent), Cc'ed to Lee                                                                            
> 
>  drivers/leds/leds-is31fl319x.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Not sure what the differences were, but looks like I already applied v1.

-- 
Lee Jones [李琼斯]
