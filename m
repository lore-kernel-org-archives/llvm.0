Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449B329CA
	for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 19:53:15 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id h16so811932lfk.10
        for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 12:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NsfMakvm6dEq+Cti5zZelRli/c6A7AeM6scLzui7Vp0=;
        b=LMiC5mr77Ib3kevM4tzIw7m0cxPHVYtImzQwWdMLxEBNVD6phrFTFeqCHKc9Tyue2j
         ey4J8B56JusAnYzICZVuSWmglbclrLHPDpLqXE/z9m1cdK5q6CxRU3fAZ2FswDveEu+f
         EEFiowGpCzsyiSjJrDQsu44xeGIkRjCofjvf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NsfMakvm6dEq+Cti5zZelRli/c6A7AeM6scLzui7Vp0=;
        b=WCEQPvwtZbDV+MkijEXhX/NoL6NTEjtQivfz7ughmMU8upyMZgTT3UqrKl0eWsZjx+
         u9g2MUX7xyG6eqW+zt3a9WbNEbEWEa974wFFzwId4i7Ib91egXbuhsZjkrgkH0SJQDf8
         DvVbxDz50+d0GhUwF/ltzcyHtwjPyOH+zHWODGkDsu59NRe4rWFxHl2zdx9dX2g4sIt4
         v9cyfi/5XIlzIw4yFieg01RyTTDyn5thnt1b1/Qa54b86OfDUqigHeHyXmr7us/Pc7Im
         on0XAD4KGBC+l8hKBFKxFvgFrwbROAa98SiM5AkGXffkvNXdiqqtKtZBlnD1+CBTpZeu
         lwRQ==
X-Gm-Message-State: AOAM530zhArq135bb6xwFptJkZMJ19W4nfvoPDRu2D2nXUtNCxf1ow76
	FMjIGmlw6Nc4qsSRFRH36KOkv4e9PGXoOyE+dlE=
X-Google-Smtp-Source: ABdhPJxUlMXHSyJrOjZ91oBC5YqH0GaPzvEBGjBJj9s2AXyzNM5z0FcMWPWSfGeM2De1QRXiMHydFQ==
X-Received: by 2002:a05:6512:50f:: with SMTP id o15mr13616880lfb.337.1631649192905;
        Tue, 14 Sep 2021 12:53:12 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id q11sm1427687ljp.91.2021.09.14.12.53.11
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Sep 2021 12:53:12 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id k13so914407lfv.2
        for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 12:53:11 -0700 (PDT)
X-Received: by 2002:a05:6512:114c:: with SMTP id m12mr14829293lfg.150.1631649191772;
 Tue, 14 Sep 2021 12:53:11 -0700 (PDT)
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
 <CAKwvOdnYdhkiYZdRvJSzAA78bMD3aS9oayc4SeeANddgxUsMLQ@mail.gmail.com>
In-Reply-To: <CAKwvOdnYdhkiYZdRvJSzAA78bMD3aS9oayc4SeeANddgxUsMLQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 14 Sep 2021 12:52:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiydA=Oay+NB2m2ewCHpPEcoU51qPFrzsekFoPu7QPtuw@mail.gmail.com>
Message-ID: <CAHk-=wiydA=Oay+NB2m2ewCHpPEcoU51qPFrzsekFoPu7QPtuw@mail.gmail.com>
Subject: Re: [PATCH 5.10] overflow.h: use new generic division helpers to
 avoid / operator
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sasha Levin <sashal@kernel.org>, llvm@lists.linux.dev, stable <stable@vger.kernel.org>, 
	Arnd Bergmann <arnd@kernel.org>, Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 14, 2021 at 12:12 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Tue, Sep 14, 2021 at 11:55 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > Btw, these kinds of issues is exactly why I've been hardnosed about
> > 64-bit divides for decades. 64-bit divides on 32-bit machines are
> > *expensive*. It's why I don't like saying "just use '/' and we'll pick
> > up the routines from libgcc".
>
> I was going to ask about the history there; not to derail the thread
> further, but this is a question whose answer is important to me.
>
> Are the helpers from libgcc insufficient?  W

No. The helpers from libgcc are *overly* sufficient.

The reason we strive to avoid libgcc on any relevant architectures is
not because it's not sufficient, it's because it hides problems.

libgcc has all these helpers for things that the kernel simply shouldn't do.

So _not_ linking against it is the thing that traditionally helps us
find problems, because you get things like

  undefined symbol '__udivdi3'

or whatever.

In other words, avoiding libgcc is what protects us from people doing
(some) stupid things.

          Linus
