Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4712224F0
	for <llvm@lists.linux.dev>; Mon, 25 Sep 2023 21:37:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B2321BF204;
	Mon, 25 Sep 2023 21:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695677819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cRwJ6cjaL2/aVyQgEfG4CwLgZ7pk+vWC5OoPdJaZhys=;
	b=pmMaHvTVbw1kcIVJLKFObevOZvn/4VilyCk1yvfjOcNtYii+xe8ov+tzwP3t7Pxo0yG4uu
	y21qrqSOmTxZFFAutyAqE7NKVSjxrB4SR2bceC2rYwM81cNP3IzYGXdUO2R86jxb4GP26f
	+V9Nfg2PgVQWWDJjeTeaXBIKWYBB/2rzIJf7YX90nlap03taWsyCKR1B0kV6Gey398W4Bx
	COhQY5kZ51DDldjuYx4JLoxonzDYaP1VECJ5IwSocQMR1NFZBaLzuxVnF211ze6HPPkVvC
	Lu7IZLkT0gpLKBG+7uYLovmpiyZlOZy/JzdT5Ovl7RH8UBCGICMFaww5NCBm4A==
Date: Mon, 25 Sep 2023 23:36:58 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: =?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Kees Cook <keescook@chromium.org>
Cc: linux-i3c@lists.infradead.org, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] i3c: master: cdns: Annotate struct cdns_i3c_xfer with
 __counted_by
Message-ID: <169567773738.243402.6652561668121064135.b4-ty@bootlin.com>
References: <20230922175014.work.637-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230922175014.work.637-kees@kernel.org>
X-GND-Sasl: alexandre.belloni@bootlin.com


On Fri, 22 Sep 2023 10:50:15 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct cdns_i3c_xfer.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: cdns: Annotate struct cdns_i3c_xfer with __counted_by
      commit: 49f33846efc079eb94b044bf897e90909fd3aa11

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
