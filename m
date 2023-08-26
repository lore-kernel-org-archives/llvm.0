Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518A937F
	for <llvm@lists.linux.dev>; Sat, 26 Aug 2023 00:52:28 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-64f37b2dfa6so11882546d6.1
        for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 17:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693011147; x=1693615947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+J7kciouNJsutvOaSseED/xKurG7haKJwfT8MXPWBzY=;
        b=acCQC+bc8rrgogDzIQdyOfFdHpy5+cz7vpObjOHuUeFuUqlQjOObck4WO/y81eCCSR
         5F+xoS8a6J8to8Jxikarm36ku6TtU9VeOfGru1uzPSWbHHE7ykayBAoA/l2ZipilqOp8
         1glTfxLOPpnyOCPVzHA0LNWbPoD3HDH/OR5OF6UFr3xs55vRpBwgPQbMKOp5G3oydF5q
         uFzmYLjceSofQUQhOUcMirgiLp1eUHtqG0n3fbzH7UdZmZNxUz7QuARaX5XZjbbl4FHg
         x9nXLmSOL68Tdh2tEK7jT3KyyomXw7qioqUDde+NK+6qBcI+B16s4kJky5xjSuZU3NZl
         X42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693011147; x=1693615947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+J7kciouNJsutvOaSseED/xKurG7haKJwfT8MXPWBzY=;
        b=dmzshmCGvclM2kNNHPP+9FZjqDeK0UZijlnKYHTwjfRGwN7y2Hizt6pBGwZaWqdCBj
         gIY4UrD+gJvUgoZQUU5d0yfrXBQK9cdsG801HhI7iK67EIZPxJBf2TdF8A34pgv/Mwk0
         nund9hVuZFzZm2b5swlLupphg6xT3LYRusV3mml1ZpOgBcRkaue9Bl67Wv2gTweak9Id
         +adPfrMxbBp5kZ/d5RZ0vA3leUi1ugWGVQcPXHwpRkujdR24gpV652/B0MXSJK+gj21N
         uxSDVD+9wWHu8kdz1BjGYheP8U+DzduJkqri7+6a4Qlo9fSZMkl+6r0J+3QSOTMJeO6q
         Nldw==
X-Gm-Message-State: AOJu0Yzo4sFSdW8FWIpYL1ObRwmXGlqsZ2e8QXtRN2KCT087m9qR3XM2
	XxN3+2TyzT9N4vGJc4ZcmwrjLPQyO45/jNgpYmjVaw==
X-Google-Smtp-Source: AGHT+IHUl+cV0AuyG3YZsjvVAiEoB8lybgoQjHXXC/mHU8xpGWOX78uyClywPQSO6XIWh8IMW8v3kNwE06HnOhP5Qtw=
X-Received: by 2002:a0c:b455:0:b0:648:190c:bdd5 with SMTP id
 e21-20020a0cb455000000b00648190cbdd5mr22564370qvf.9.1693011146887; Fri, 25
 Aug 2023 17:52:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZOkGCSNr0VN2VIJJ@p100> <CAHk-=wjZwSymfuGvf7TX3UQLU1OMN1FZMnEA-Hja0ruqyhMK4A@mail.gmail.com>
 <CAHk-=whVvD05T0yD5DQj803uETLD6qDq-Vx-SiLPcrL=eO77LQ@mail.gmail.com>
 <CAKwvOdnYauyrzz7-ceH-MP_KZ5ED8oYxjRx_Xei68=tUOSeKyA@mail.gmail.com>
 <CAGG=3QWcZPYqHMcjwuYDz1+OQhzS40hmhdOvSBZBQOkhs8YAQQ@mail.gmail.com>
 <CAGG=3QX8AaTedPy-joWm6yp+TFHBVXm59OcvxkdLGsSuDjem5g@mail.gmail.com> <CAHk-=wjQpXpnGAwvv-oBi+cQ0g+D9rTK5STkXSSV4a90FPR+EQ@mail.gmail.com>
In-Reply-To: <CAHk-=wjQpXpnGAwvv-oBi+cQ0g+D9rTK5STkXSSV4a90FPR+EQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 25 Aug 2023 17:52:15 -0700
Message-ID: <CAKwvOdm_y6UOnxFrAiDxou2jc8CRUvyhfH9kAdc3PG0=bEvduw@mail.gmail.com>
Subject: Re: [PATCH] lib/clz_ctz.c: Fix __clzdi2() and __ctzdi2() for 32-bit kernels
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Bill Wendling <morbo@google.com>, Helge Deller <deller@gmx.de>, 
	Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-parisc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Chanho Min <chanho.min@lge.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, 
	clang-built-linux <llvm@lists.linux.dev>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 25, 2023 at 4:35=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> But for non-constant ones, the inline asm actually generates better
> code: gcc generatea some disgusting mess with a 'bsf' followed by a
> 'cmov' for the zero case, when we know better.
>
> See for example
>
>    https://godbolt.org/z/jKKf48Wsf
>
> I don't understand why compiler people prefer a builtin that is an
> untested special case that assumes that the compiler knows what is
> going on (and often doesn't), over a generic escape facility that is
> supported and needed anyway (inline asm).
>
> In other words: the statement "builtins generate better code" is
> simply PROVABLY NOT TRUE.
>
> Builtins have often generated *worse* code than using inline asms, to
> the point where "worse" is actively buggy crap.
>
> At least inline asms are reliable. That's a *big* deal.

So 2 concerns where "I'll do it in inline asm" can pessimize codegen:
1. You alluded to this, but what happens when one of these functions
is called with a constant? (Not just a literal value, but a value that
can be proven constant at compile time via optimizations as well?)
arch/x86/include/asm/bitops.h got this right for ffs(), but it did not
for fls()! (I think that could be `if (__builtin_constant_p(x)) return
x ? 32 - __builtin_clz(x) : 0;` but check my math; oh, good job
arch/powerpc/include/asm/bitops.h).
2. by providing the definition of a symbol typically provided by libc
(and then not building with -ffreestanding) pessimizes libcall
optimization.
example: https://godbolt.org/z/crrTKEf6G
ffs() gets this right again by using a macro, and __always_inline can
work around this somewhat (so fls() if off the hook here). But any
attempt using `static inline` would be pessimized for constants.
--=20
Thanks,
~Nick Desaulniers
