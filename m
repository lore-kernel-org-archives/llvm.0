Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55053FC2
	for <llvm@lists.linux.dev>; Mon, 30 Aug 2021 23:24:34 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1630365466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=waBPSOtEtKCExNwq33nlht3Z/W5y12JWVi4ROsYUn4o=;
	b=VdMYJwvdoHcxtCr53N6CTe6+RXI/dJQD4aoXzaK7kxvqupSiDzpZ+jGsOu4OIHsNaPESH1
	36CFlYXCQ6d9y1ecHnURZikTaevqx+Te5hD0AUT/+25OapiFAp42p/QNER1KUh7WLh0qAs
	efcRXZQltSG58N/dX0haH6pRBMdS0XKMDKdlhx8U9zsBDt2sa3Ie0HemL9axWum8bA/xHP
	B6fTDfcn5UWrtoBMnwokQKpe9i/0rj7+4vs8wy3URVbkCzPXSmroGgKDqXvNnIF1TjnRIu
	bv84JhcufiuiMzjQQFkGTR8qP6PJ/TBTuKafrTZZlUPzzAaXxV9AFlGesyQYpg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1630365466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=waBPSOtEtKCExNwq33nlht3Z/W5y12JWVi4ROsYUn4o=;
	b=KRwTD0VUCAgK8yGHAjQtM9hIAXF9SbLYvHYdJpU5mf5cvbP3NyQGSokq2ZMEAFHoZwtv6N
	l0hPjqepuM3Hz0CA==
To: Nick Desaulniers <ndesaulniers@google.com>,
 linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, Arnd
 Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, Russell
 King <linux@armlinux.org.uk>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, Anshuman Khandual
 <anshuman.khandual@arm.com>, Ard Biesheuvel <ardb@kernel.org>, YiFei Zhu
 <yifeifz2@illinois.edu>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, Mike Rapoport <rppt@kernel.org>,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] ARM: select HAVE_FUTEX_CMPXCHG
In-Reply-To: <20210830213846.2609349-1-ndesaulniers@google.com>
References: <20210830213846.2609349-1-ndesaulniers@google.com>
Date: Tue, 31 Aug 2021 01:17:45 +0200
Message-ID: <87czpufrom.ffs@tglx>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Aug 30 2021 at 14:38, Nick Desaulniers wrote:

> tglx notes:
>   This function [futex_detect_cmpxchg] is only needed when an
>   architecture has to runtime discover whether the CPU supports it or
>   not.  ARM has unconditional support for this, so the obvious thing to
>   do is the below.
>
> Fixes linkage failure from Clang randconfigs:
> kernel/futex.o:(.text.fixup+0x5c): relocation truncated to fit: R_ARM_JUMP24 against `.init.text'
> and boot failures for CONFIG_THUMB2_KERNEL.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/325
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
