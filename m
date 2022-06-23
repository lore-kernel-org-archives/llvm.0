Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEB01FAC
	for <llvm@lists.linux.dev>; Thu, 23 Jun 2022 23:33:49 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id y32so1559884lfa.6
        for <llvm@lists.linux.dev>; Thu, 23 Jun 2022 16:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y5t2HdHgbQDM3fVs9f9inVKfPOgEozAtWYglMYVXHeo=;
        b=RuFxaVmx5XYRY5cqHS6MXL8FQOv9P3Qc6bXQm6YEdOifK6a/lTAFCGFL2J4ATAQQFY
         lwCKS6zC7RJM/DUvxNJJCHOVPnF/6IJjID28NEl412feqsYv1uZFexivMdsdVa+7tn2X
         MGMfYO0AbTXmbcfSxsQPuGgp2ZmB8OmFzHZSms9FbzYCu1SojnuuERyeWei46ML1VAnI
         f5+edDfn3TD/BIFurtpH6q80H076WYN2G7TkGUjrLTpAyNcYDfaVP63FXe76kdTu9nr2
         KhrmWXUNpaXlUGfWHxfTczNfXxGUYutkiGRxGjmVn9kcsMYI2nS4Wkona1TX4gvI67M/
         gwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y5t2HdHgbQDM3fVs9f9inVKfPOgEozAtWYglMYVXHeo=;
        b=is1GefETaeYrp4X9/D1WTjx3j46PUUazwqww5v3BgPOMA1hQEJcZhoxZftjtbIBSWd
         5XMEYc4BSALDQ1E7PyPxpA73PvYd+wbmY0VtcKQvhFbVJtQutJ/dnStxWBbgUbHFulgy
         tq2J/ui83fWRboaCZomwzx60pOpe4ZdGzDV/I0xcoHn2ROQnTXN+rMUdOCKAYMKzLnL/
         +HK4zB5ad73mLhyOHPxHInOuD+IiLMYpniqGALF8FZI8sNHMiQxUuBJB4dLc/Vr3PnGs
         FzdgVmOLxMd7yPu494N5ohFxIxEa75puwpwWcr2ioWctQCehA79AV87kUN1sC9iQhYJP
         AuDg==
X-Gm-Message-State: AJIora8fQhUdCI4WXrb4NrbNRXT8X+feDUzOhPj+pHoXRsukJC1ssbCw
	gkJnfecJ0YEPAN9wCcLBRpcdGWZcFSqOEj3mD0vvpg==
X-Google-Smtp-Source: AGRyM1uUYWe4B92qbAxaSPcEuzt1Jad6zUUVtzIlYMTYhqB8ii9Dkg/YbHjka/rpdX0fYjsiE40wpIwNUslwOZjEXpY=
X-Received: by 2002:a05:6512:3f9f:b0:47d:c87e:f8f3 with SMTP id
 x31-20020a0565123f9f00b0047dc87ef8f3mr6953750lfa.401.1656027227275; Thu, 23
 Jun 2022 16:33:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YrLtpixBqWDmZT/V@debian> <CAHk-=wiN1ujyVTgyt1GuZiyWAPfpLwwg-FY1V-J56saMyiA1Lg@mail.gmail.com>
 <YrMu5bdhkPzkxv/X@dev-arch.thelio-3990X> <CAHk-=wjTS9OJzggD8=tqtj0DoRCKhjjhpYWoB=bPQAv3QMa+eA@mail.gmail.com>
 <YrNQrPNF/XfriP99@debian> <CAHk-=wjje8UdsQ_mjGVF4Bc_TcjAWRgOps7E_Cytg4xTbXfyig@mail.gmail.com>
 <CAKwvOdmQKo4tZRLWxK2tTvd+OEtUmKJM7XiijLAF8JWMeUzFMA@mail.gmail.com>
In-Reply-To: <CAKwvOdmQKo4tZRLWxK2tTvd+OEtUmKJM7XiijLAF8JWMeUzFMA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 23 Jun 2022 16:33:35 -0700
Message-ID: <CAKwvOdnfRnqBF8exO-Y1ooX=67TrO_8fSzgZwvUtidN_P31hzw@mail.gmail.com>
Subject: Re: mainline build failure due to 281d0c962752 ("fortify: Add Clang support")
To: Linus Torvalds <torvalds@linux-foundation.org>, Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Kees Cook <keescook@chromium.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 22, 2022 at 3:40 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Jun 22, 2022 at 10:49 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Wed, Jun 22, 2022 at 12:26 PM Sudip Mukherjee
> > <sudipm.mukherjee@gmail.com> wrote:
> > >
> > > Tried it after applying your patch. There was no build failure, but some warnings:
> >
> > So some of those objtool warnings are, I think, because clang does odd
> > and crazy things for when it decides "this is not reachable" code.
> >
> > I don't much like it, and neither does objtool, but it is what it is.
> > When clang decides "I'm calling a function that cannot return", it
> > will have a "call" instruction and then it will just fall off the face
> > of the earth after that.
> >
> > That includes falling through to the next function, or just to random
> > other labels after the function, and then objtool as a result
> > complains about a stack state mismatch (when the fallthrough is the
> > same function, but now the stack pointer is different in different
> > parts), or of the "falls through to next function".
> >
> > I think it's a clang misfeature in that if something goes wrong, you
> > basically execute random code. I'd much rather see clang insert a real
> > 'ud' instruction or 'int3' or whatever. But it doesn't.
>
> So adding `-mllvm -trap-unreachable` will turn these
> `__builtin_unreachable()`'s into trapping instructions.  I think we
> should just do that/enable that in the kernel.  The following patch
> eliminates ALL of the fallthrough warnings observed from objtool on
> x86_64 defconfig builds.
>
> ```
> diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
> index 87285b76adb2..1fbf8a8f3751 100644
> --- a/scripts/Makefile.clang
> +++ b/scripts/Makefile.clang
> @@ -36,6 +36,7 @@ endif
>  # so they can be implemented or wrapped in cc-option.
>  CLANG_FLAGS    += -Werror=unknown-warning-option
>  CLANG_FLAGS    += -Werror=ignored-optimization-argument
> +CLANG_FLAGS    += -mllvm -trap-unreachable
>  KBUILD_CFLAGS  += $(CLANG_FLAGS)
>  KBUILD_AFLAGS  += $(CLANG_FLAGS)
>  export CLANG_FLAGS
> ```
>
> There's more I need to do for LTO; `-mllvm` flags need to be passed to
> the linker in that case.  Let me do a few more builds, collect
> statistics on build size differences (guessing neglidgeable), then
> will send out a more formal patch.

Looks like these are actually from calls to
__ubsan_handle_divrem_overflow which is __noreturn when panic_on_warn
is set by the corresponding config.  I wonder if we should be
unconditionally adding __ubsan_handle_divrem_overflow to the allow
list `global_noreturns` in tools/objtool/check.c?  It seems like the
kconfig defines aren't passed through to the tools/ sources.

List of fallthrough warnings from allmodconfig for reference:
https://lore.kernel.org/lkml/YrNQrPNF%2FXfriP99@debian/

--
Thanks,
~Nick Desaulniers
