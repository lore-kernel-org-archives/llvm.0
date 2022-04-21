Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0D01FC0
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 16:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F26FC385A1;
	Thu, 21 Apr 2022 16:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1650558252;
	bh=MOPueyE9NIXkT/ATECPBN+Gv0vBI/El85kaJXW7CqO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fOq2f1GyWMr3IWUctveZ9t7w5wvQ4QLpW5yiWXkYCOaRWZP3YjrFHAC+r1PjLDV8G
	 odMkyofTPMJ3AnnqeIkobgzsTkaLuCrus0t6n/ay3PqmdO73Ez3qAw5cF3xFx34lcC
	 pqggJa+Mlzj6KNAnP4H+EicvPKzCGz/7yPoLy/Bc=
Date: Thu, 21 Apr 2022 18:24:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tom Rix <trix@redhat.com>
Cc: heikki.krogerus@linux.intel.com, nathan@kernel.org,
	ndesaulniers@google.com, sven@svenpeter.dev, alyssa@rosenzweig.io,
	marcan@marcan.st, martink@posteo.de, saranya.gopal@intel.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] usb: typec: tipd: improve handling of failures in
 interrupt handlers
Message-ID: <YmGFKdVAuG5JEfzg@kroah.com>
References: <20220409130013.1474412-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220409130013.1474412-1-trix@redhat.com>

On Sat, Apr 09, 2022 at 09:00:13AM -0400, Tom Rix wrote:
> clang static analysis reports this representative issue
> core.c:516:6: warning: Branch condition evaluates
>   to a garbage value
>   if (event)
>       ^~~~~
> 
> In cd321x_interrupt(), a successful call to
> tps6598x_read64() is the only way event is set,
> and if a failure happens the irq should not be
> reported as handled.

Please use the full 72 columns.

> 
> Instead of initializing event, rework the
> usage of ret by initializing it to IRQ_NONE
> and then setting it when event is known to
> be not zero.  This removes the if-statement
> before the return.

So the code today is correct, but clang is wrong?  We don't need to do
anything then...

> tps6598x_interrupt() is similar.

This line makes no sense, sorry.

greg k-h
