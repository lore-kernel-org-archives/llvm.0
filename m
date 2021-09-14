Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D643FC4
	for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 19:12:54 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id a4so605135lfg.8
        for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 12:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3o96t4jfhjpw8bVh6EXKflxn4LFySYYtT8MSQquF+is=;
        b=XLsoQqhXQ5qfegx/MBtgkp550YH9/Uy43W6i7fxhpq5w4kv811qRsCNESChwZUka34
         hrXByasc3BP8JHKJJLfVrc4pkdNKqpGIQ+/zWqvmF7PTf2Mgltgy5w5vt/iEa1PxpkSL
         NDZQfyOewXzuXvi1rjiHW0hMEYGWUx/z04iWobhgiej/TJfPFD6eQ1Ps1QTcBlq4Lu61
         p0ZvmYK518HmSGuocRZpOVX8VWDinlIbYuEcYHitoPNL7yRxQOvSC3YrxnrQMVcj+L5m
         ydw2uWY9y6pCxMvCdUQUyHjQXtjoPMyZGQvxhOISANs+Q83JARMbpkvwj4RrnxD/cAM7
         xDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3o96t4jfhjpw8bVh6EXKflxn4LFySYYtT8MSQquF+is=;
        b=AUZ0jgwjKtsMumeLeAt/4O2NgKWUMEEbsdi2UN1mdT3AW+az0a7Iab+sKVmLc+YZh5
         IlsUhFhFHEmlKKLKKMmhLiwuCvpU8BXyCqnbPJrACS0/bJ6QiiRxIhi8nnXVYHBCxXpX
         edySAeGmXNummtRcIodPm2ERMb+jnvroAW0UjHDgHIIKRMCXUQVSE6JBLCuO4VaJsZEO
         XVl79vLQWERV5HPPtH7v4llnz9CqvG9rxZSU5Jde/FCyfmpMFkE7lnV5bg1HUNO/01dj
         3chh+2arcXegEv2kwUn0VRxwLl/2CKjHnwyzF8xjTlBEr1wnP+iL7hDf8FycGfYZAiag
         J6Bw==
X-Gm-Message-State: AOAM532cRxvUVH4Lr74md5iqAJredDnmr19TJDzryFOU4UwESoKFbJ8t
	6FgMd8tnDrA9fTfvdV3Lo5SrQoZcmeuxc3Ym4vVbPQ==
X-Google-Smtp-Source: ABdhPJx7Td4uHZ+vxp7LswJZm0IhS6eSxLgYhes0AAU2NAfr9ZXBXzk6GfDqa5hzx6gKF65UeuVDHYpCxltn5eeL9y4=
X-Received: by 2002:a05:6512:3b9e:: with SMTP id g30mr13981343lfv.651.1631646772352;
 Tue, 14 Sep 2021 12:12:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210913203201.1844253-1-ndesaulniers@google.com>
 <195b2f47-b92e-a00b-a2bc-d91bfdbd9d12@rasmusvillemoes.dk> <202109141031.AEFD06F03F@keescook>
 <CAHk-=wjac_3K+NQNO6tjQZU1KLgba==BOvHmHE2sgNSVj3j85g@mail.gmail.com>
 <CAHk-=whiQBofgis_rkniz8GBP9wZtSZdcDEffgSLO62BUGV3gg@mail.gmail.com>
 <202109141144.1AE2DDB@keescook> <CAHk-=whU_p489R+ZYPh_AehJRQJKp_0oJ3zB73wgCtB_k3vwvA@mail.gmail.com>
In-Reply-To: <CAHk-=whU_p489R+ZYPh_AehJRQJKp_0oJ3zB73wgCtB_k3vwvA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 14 Sep 2021 12:12:41 -0700
Message-ID: <CAKwvOdnYdhkiYZdRvJSzAA78bMD3aS9oayc4SeeANddgxUsMLQ@mail.gmail.com>
Subject: Re: [PATCH 5.10] overflow.h: use new generic division helpers to
 avoid / operator
To: Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, Josef Bacik <josef@toxicpanda.com>, 
	Jens Axboe <axboe@kernel.dk>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, llvm@lists.linux.dev, 
	stable <stable@vger.kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	Naresh Kamboju <naresh.kamboju@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 14, 2021 at 11:55 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Btw, these kinds of issues is exactly why I've been hardnosed about
> 64-bit divides for decades. 64-bit divides on 32-bit machines are
> *expensive*. It's why I don't like saying "just use '/' and we'll pick
> up the routines from libgcc".

I was going to ask about the history there; not to derail the thread
further, but this is a question whose answer is important to me.

Are the helpers from libgcc insufficient?  Working through
https://github.com/ClangBuiltLinux/linux/issues/1438 which all came
about because LLVM's equivalent of libgcc, "compiler-rt," had a nice
helper for builtin multiply with overflow check that libgcc does not.
As such, llvm cannot assume compiler-rt is being linked against, so
llvm must expand these inline every time.  And the code in line is
HUGE: https://godbolt.org/z/MM4hPGxTE.  IMO we could do a much much
better job on code size (and thus probably I$ performance
improvements) had we just linked against the compiler runtime.

Perhaps the concern is of the quality of implementations of the
compiler runtime routines; that we may have arch specific
implementations that are better? 64b division on 32b targets is
expensive either way; I'd rather have the compiler generate a libcall
than try to expand these inline.  I'm not sure if it's the case, but I
can't help but wonder if there are other optimization decisions being
based on whether the compiler runtime is being linked against or not;
it's hard for the compiler to know what will happen at link time.
Vaguely reminiscent of the issues we face against using
-ffreestanding.

Switching that now (so that we did link in the compiler runtimes)
would be a massive yak shave, for sure.

> In almost all real-life cases - at least in a kernel - the full divide
> is unnecessary. It's almost always people being silly and lazy, and
> the very expensive operation can be avoided entirely (or at least
> minimized to something like 64/32).

At least when dealing in powers of two, sure.
-- 
Thanks,
~Nick Desaulniers
