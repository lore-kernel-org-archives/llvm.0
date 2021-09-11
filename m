Received: from ozlabs.org (ozlabs.org [203.11.71.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210F93FC3
	for <llvm@lists.linux.dev>; Sat, 11 Sep 2021 10:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1631356975;
	bh=ExdD//zcgrodB2nrIV/KTQK4Gb50UScEXZVTgad6v/4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ioe1x8uO/2B8IYF6K1rTcBPWXLQBlAeM9QmH6xaRSjWXuHJQ2DySUrfS7WiBwOLOM
	 Pgz7y5Ss8RX/px06Dy2CLLVcmX7NjXjpXeJBYYddxUboKFvCghkZkKJ3eIpyq+vaIU
	 2XfBmZ7yBjbD487jA+hS9gky4w1awB5BTo7BsQutZ2ychG4BJSVqliQQ9Pistc43od
	 6zajpCy1cuHtXZWS9uBxpBLiCfu560IbMlB1AT7rj0ISwliUtIkHnYA2/t2+gV4IDZ
	 Rrdya6r05/L+NpaUAcyDHwSr0e6zqAePE4Nyvc0m7t8MrI9TXg+5NkZSAALDRCwKbM
	 WVMQVQlPdiDww==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4H68TT0mbkz9sVq;
	Sat, 11 Sep 2021 20:42:52 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kees Cook <keescook@chromium.org>, Nick Desaulniers
 <ndesaulniers@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Nathan Chancellor <nathan@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Joe Perches <joe@perches.com>,
 Arnd Bergmann <arnd@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/10] raise minimum GCC version to 5.1
In-Reply-To: <202109101917.5BA95B87E0@keescook>
References: <20210910234047.1019925-1-ndesaulniers@google.com>
 <202109101917.5BA95B87E0@keescook>
Date: Sat, 11 Sep 2021 20:42:49 +1000
Message-ID: <8735qbmlzq.fsf@mpe.ellerman.id.au>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Kees Cook <keescook@chromium.org> writes:
> On Fri, Sep 10, 2021 at 04:40:37PM -0700, Nick Desaulniers wrote:
>> commit fad7cd3310db ("nbd: add the check to prevent overflow in
>> __nbd_ioctl()")
>>=20
>> raised an issue from the fallback helpers added in
>>=20
>> commit f0907827a8a9 ("compiler.h: enable builtin overflow checkers and a=
dd fallback code")
>>=20
>> Specifically, the helpers for checking whether the results of a
>> multiplication overflowed (__unsigned_mul_overflow,
>> __signed_add_overflow) use the division operator when
>> !COMPILER_HAS_GENERIC_BUILTIN_OVERFLOW. This is problematic for 64b
>> operands on 32b hosts.
>>=20
>> Also, because the macro is type agnostic, it is very difficult to write
>> a similarly type generic macro that dispatches to one of:
>> * div64_s64
>> * div64_u64
>> * div_s64
>> * div_u64
>
> Given that it's all compile-time type-aware goo, this isn't so bad. The
> gist[1] you linked off the bug report is pretty close. Needs some
> bikeshedding. ;)
>
>> Raising the minimum supported versions allows us to remove all of the
>> fallback helpers for !COMPILER_HAS_GENERIC_BUILTIN_OVERFLOW, instead
>> dispatching the compiler builtins.
>>=20
>> arm64 has already raised the minimum supported GCC version to 5.1, do
>> this for all targets now. See the link below for the previous
>> discussion.
>
> That said, I'd much prefer raising the minimum GCC -- no one appears
> to actually be building on 4.9 -- there are close to 200 errors (ne=C3=A9
> warnings) on x86_64 allmodconfig there currently.

I still do 4.9 builds on kisskb, but I agree there are a lot of
warnings, and no one ever has time to fix any.

cheers
