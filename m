Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E909815A3
	for <llvm@lists.linux.dev>; Thu, 18 Aug 2022 22:51:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA1CC433C1;
	Thu, 18 Aug 2022 22:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660863066;
	bh=uTUn0Xma80oIh9ZmKSbaaDbBfbuNhdPmQu5lpQjlqhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lIe9SVUCfOiikxCxqBe7fublJ3f3F07IaHWvFhRtyecZYv6LLNEUnYCVgrm+o13p3
	 P+uCi92d1AP2pjfEHCQaHCK5p+ClrnscWpcqu2xV99Zs1VFZ73T+w4mdxOH61gF20V
	 dLYU/osoFA93RlkQNldGxCZvRO8Sncbn4O1JOh9D199zyXeg+Jzk0iIfIa2SvBcISw
	 q3zBtXm1lbTzklNqXQbNPL8ujiG07oreK7/ACsmo1+j0wuscTL9J8g09roJnR7Gybn
	 uB8XDLKHHDL++CD/K1raHlaO6/Sy5sAi9Y79bV8C2BkB2t5xBM4A6X5kKxp3pdWh+G
	 tuVemndJAmrtg==
Date: Fri, 19 Aug 2022 06:51:00 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Andrey Strachuk <strochuk@ispras.ru>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] usb: cdns3: Don't use priv_dev uninitialized in
 cdns3_gadget_ep_enable()
Message-ID: <20220818225100.GA237489@Peter>
References: <20220803162422.2981308-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220803162422.2981308-1-nathan@kernel.org>

On 22-08-03 09:24:22, Nathan Chancellor wrote:
> Clang warns:
> 
>   drivers/usb/cdns3/cdns3-gadget.c:2290:11: error: variable 'priv_dev' is uninitialized when used here [-Werror,-Wuninitialized]
>                   dev_dbg(priv_dev->dev, "usbss: invalid parameters\n");
>                           ^~~~~~~~
>   include/linux/dev_printk.h:155:18: note: expanded from macro 'dev_dbg'
>           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
>                           ^~~
>   include/linux/dynamic_debug.h:167:7: note: expanded from macro 'dynamic_dev_dbg'
>                           dev, fmt, ##__VA_ARGS__)
>                           ^~~
>   include/linux/dynamic_debug.h:152:56: note: expanded from macro '_dynamic_func_call'
>           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
>                                                               ^~~~~~~~~~~
>   include/linux/dynamic_debug.h:134:15: note: expanded from macro '__dynamic_func_call'
>                   func(&id, ##__VA_ARGS__);               \
>                               ^~~~~~~~~~~
>   drivers/usb/cdns3/cdns3-gadget.c:2278:31: note: initialize the variable 'priv_dev' to silence this warning
>           struct cdns3_device *priv_dev;
>                                       ^
>                                       = NULL
>   1 error generated.
> 
> The priv_dev assignment was moved below the if statement to avoid
> potentially dereferencing ep before it was checked but priv_dev is used
> in the dev_dbg() call.
> 
> To fix this, move the priv_dev and comp_desc assignments back to their
> original spot and hoist the ep check above those assignments with a call
> to pr_debug() instead of dev_dbg().
> 
> Fixes: c3ffc9c4ca44 ("usb: cdns3: change place of 'priv_ep' assignment in cdns3_gadget_ep_dequeue(), cdns3_gadget_ep_enable()")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1680
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Acked-by: Peter Chen <peter.chen@kernel.org>

> ---
>  drivers/usb/cdns3/cdns3-gadget.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
> index 9ac7d0a8c5da..d21b69997e75 100644
> --- a/drivers/usb/cdns3/cdns3-gadget.c
> +++ b/drivers/usb/cdns3/cdns3-gadget.c
> @@ -2284,16 +2284,20 @@ static int cdns3_gadget_ep_enable(struct usb_ep *ep,
>  	int ret = 0;
>  	int val;
>  
> +	if (!ep) {
> +		pr_debug("usbss: ep not configured?\n");
> +		return -EINVAL;
> +	}
> +
>  	priv_ep = ep_to_cdns3_ep(ep);
> +	priv_dev = priv_ep->cdns3_dev;
> +	comp_desc = priv_ep->endpoint.comp_desc;
>  
> -	if (!ep || !desc || desc->bDescriptorType != USB_DT_ENDPOINT) {
> +	if (!desc || desc->bDescriptorType != USB_DT_ENDPOINT) {
>  		dev_dbg(priv_dev->dev, "usbss: invalid parameters\n");
>  		return -EINVAL;
>  	}
>  
> -	comp_desc = priv_ep->endpoint.comp_desc;
> -	priv_dev = priv_ep->cdns3_dev;
> -
>  	if (!desc->wMaxPacketSize) {
>  		dev_err(priv_dev->dev, "usbss: missing wMaxPacketSize\n");
>  		return -EINVAL;
> 
> base-commit: 8288c99fc263bcafc5df5fa8c278b2eb8106364e
> -- 
> 2.37.1
> 

-- 

Thanks,
Peter Chen

