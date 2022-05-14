Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EBE2F25
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 21:05:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7481C340EE;
	Sat, 14 May 2022 21:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652562320;
	bh=H4zV3SBaznHA7Gdb4PBmPjf9JcyfMUIYCazARaIDVOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ebIcyrPZt/TJ8NSlY+gTJpB/aNg2HmLj0D7DlaDZDF0UCrUPAN1429AIfiVA7TS0z
	 y2AjGz+ruz2LFa4AbuOvca6cEzCCJlwMVJ9K+ugwdAQV+KgoQHGkrk1Bm56cYqTte9
	 AJNVPW9RHdgiVKayWFwWGZoerc6FpLLaaqWLdW1iZhj2v0ZUe7lYGxiNvyqE45gJVM
	 2C+WyV+52h0Hj6YFCvKe+NoSF5xtA0MT5wzD8+ElZOOkNXxNvnN8BX6C41ZSLSL5n7
	 F11lwFclnd0GpqwrHxHwLybo5NhxGl7Wx69ePMpX2GO+bdJWKz++75Uyh18Fn/Le9s
	 /uRKh0N6NkqTA==
Date: Sat, 14 May 2022 14:05:18 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Wolfram Sang <wsa@kernel.org>
Cc: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Michael Walle <michael@walle.cc>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] i2c: at91: Initialize dma_buf in at91_twi_xfer()
Message-ID: <YoAZjpzAEugCiv/Q@dev-arch.thelio-3990X>
References: <20220505152738.1440249-1-nathan@kernel.org>
 <Yn+xsNqFyRMTu+5X@shikoro>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yn+xsNqFyRMTu+5X@shikoro>

On Sat, May 14, 2022 at 03:42:08PM +0200, Wolfram Sang wrote:
> On Thu, May 05, 2022 at 08:27:38AM -0700, Nathan Chancellor wrote:
> > Clang warns:
> > 
> >   drivers/i2c/busses/i2c-at91-master.c:707:6: warning: variable 'dma_buf' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
> >           if (dev->use_dma) {
> >               ^~~~~~~~~~~~
> >   drivers/i2c/busses/i2c-at91-master.c:717:27: note: uninitialized use occurs here
> >           i2c_put_dma_safe_msg_buf(dma_buf, m_start, !ret);
> >                                    ^~~~~~~
> > 
> > Initialize dma_buf to NULL, as i2c_put_dma_safe_msg_buf() is a no-op
> > when the first argument is NULL, which will work for the !dev->use_dma
> > case.
> > 
> > Fixes: 03fbb903c8bf ("i2c: at91: use dma safe buffers")
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1629
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> 
> Applied to for-next, thanks!
> 

Thank you!

Cheers,
Nathan
