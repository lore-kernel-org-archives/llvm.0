Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0401FC4
	for <llvm@lists.linux.dev>; Thu, 30 Mar 2023 12:36:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA578C433D2;
	Thu, 30 Mar 2023 12:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680179779;
	bh=apjuJydxqBhPZhcIQdOGZhWg7a9aRiJmg/9aojOU6Xs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RXaFiCOOxBKkVMcldHGDcX6733J33G2LEWE5xW6ucRxTHIWhm0oq7BtWWwcJY5q2p
	 WE+0gRNRZNf5aON1M4JNrLmVbZLA5vPBvtvc8P06F66dRMmP/6iNHaKtiwlWgPWQAZ
	 9sv3/AoChFrvBnml58hsP8OwG9JTFmSU2kCJCJoONWE+6K8H6GT5+wDflwAm/HyphD
	 8ckzN2KJfBwpd1bqPij40bRNUC6y8t3UM8ZqRKJ+YIVbQYsXnNmPpehopi7v4rV8qh
	 KjRfAn8Pi02/WqTe5a9tedvFFrPxjklyudHWPscom1ReRc41Y9PT+1RFi/aSN8ih5q
	 mmLMdszS/4DUA==
Date: Thu, 30 Mar 2023 13:36:14 +0100
From: Lee Jones <lee@kernel.org>
To: Tom Rix <trix@redhat.com>
Cc: tony@atomide.com, nathan@kernel.org, ndesaulniers@google.com,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] mfd: omap-usb-tll: remove unused usbtll_readb function
Message-ID: <20230330123614.GH434339@google.com>
References: <20230322125803.2570968-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230322125803.2570968-1-trix@redhat.com>

On Wed, 22 Mar 2023, Tom Rix wrote:

> clang with W=1 reports
> drivers/mfd/omap-usb-tll.c:128:18: error: unused function
>   'usbtll_readb' [-Werror,-Wunused-function]
> static inline u8 usbtll_readb(void __iomem *base, u32 reg)
>                  ^
> This function is not used so remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/mfd/omap-usb-tll.c | 5 -----
>  1 file changed, 5 deletions(-)

Applied, thanks

--
Lee Jones [李琼斯]
