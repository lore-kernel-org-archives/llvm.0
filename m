Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61183360
	for <llvm@lists.linux.dev>; Thu, 15 Jun 2023 00:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABF0AC433C8;
	Thu, 15 Jun 2023 00:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686788543;
	bh=pdaOGQKnCwrYyacOrxmVFnlnZMcpLs+PJTif44O1uR0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=f0lLNBjNHuUdXomi5Y3CJsmSEoBOOkx/xyi3iWuNN1mKcAjsmpA/0X2PCfGKHofaW
	 SwaDp1NHBvOBFA+dF/7JHsdd93ZLCnYhBdhPITLDmtKm86N6bta0VpyCtmIkIB2bW3
	 1L5TrNX77olRf92ciD3uwJIwqRz/RGvja6j5y10Yb4oAqh/RJESXiCiUfh/o1hO8bt
	 6wN7yqDfuqcOyJKTAV3LF/JDpI7ynqzX/Od3nuAig096IgE5YOfO/rAdByuwtDIoE2
	 FO0WbrVzcKib3hn1stoarPop/B2qHdptSqz9HWEP4YZl8tKv6Jj4sNkf3GBNm+qxQO
	 txpjX4BE1jE2A==
Message-ID: <8eceb50391ff83f598e16e0cb371fdb0.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230511105845.299859-1-arnd@kernel.org>
References: <20230511105845.299859-1-arnd@kernel.org>
Subject: Re: [PATCH] clk: pxa: fix NULL pointer dereference in pxa3xx_clk_update_accr
From: Stephen Boyd <sboyd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, stable@vger.kernel.org, kernel test robot <lkp@intel.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, Robert Jarzmik <robert.jarzmik@free.fr>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
To: Arnd Bergmann <arnd@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Date: Wed, 14 Jun 2023 17:22:21 -0700
User-Agent: alot/0.10

Quoting Arnd Bergmann (2023-05-11 03:58:33)
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> sparse points out an embarrasing bug in an older patch of mine,
> which uses the register offset instead of an __iomem pointer:
>=20
> drivers/clk/pxa/clk-pxa3xx.c:167:9: sparse: sparse: Using plain integer a=
s NULL pointer
>=20
> Unlike sparse, gcc and clang ignore this bug and fail to warn
> because a literal '0' is considered a valid representation of
> a NULL pointer.
>=20
> Fixes: 3c816d950a49 ("ARM: pxa: move clk register definitions to driver")
> Cc: stable@vger.kernel.org
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202305111301.RAHohdob-lkp@int=
el.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Applied to clk-fixes
