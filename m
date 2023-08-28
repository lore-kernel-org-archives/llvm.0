Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69582134D3
	for <llvm@lists.linux.dev>; Mon, 28 Aug 2023 16:25:03 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-99c93638322so709309166b.1
        for <llvm@lists.linux.dev>; Mon, 28 Aug 2023 09:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1693239901; x=1693844701;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sM1xDxshhTsgcPSMrSpefQv6QJ2g+YM5wLd9LEhA/rg=;
        b=gqgMiw9NC1BehFLz5S1cxFoGt2ZgnnAIy33kNeIOjQX72k6vDFAo/lKNQzbB65/xbB
         KdyCMNahz18bZqkKAEHcyCrGQAeUAYwBAF/lvuGVR599kFrAxKD26AY7YIfIyi0Ggj/s
         tsuNHwm0OD74MZuOOTZB3R64UX8VAegAqCcRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693239901; x=1693844701;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sM1xDxshhTsgcPSMrSpefQv6QJ2g+YM5wLd9LEhA/rg=;
        b=kqNE/B/iPVvOFtlOYHeakR1Kn/CIwqIVu54xvJECll2MVR+uXmUVpetD7bDT5xQlxk
         dCnGM4sy7BPsGPbZ+wee1jyTok+Sxnmzyp74iBuV9l9Gfz+RCYnexDb1zDz9UMGNLS1E
         7KQxmQnzBIbluOV6m3jBjQ12aoSpKizi2atLfsQeHVQL/rdzOj8RXnAE5giGpRc3pCvI
         1HjFZLnenXB6QCyHCDmbLhz0qcBrH7/qTwii2kYT2SsB92TkbJOPX1aCxBSRih5I8XaN
         GrarZ07KoVoMDCpBewKyo1odWeEZmrDETk2d+k2hXiO2hX4x9X4or4Nmi6bHD+nyVInt
         XnBg==
X-Gm-Message-State: AOJu0YxDUFMHydfW2Uuo+X1DqROlfu2o5U/9l7uSIsYQrRQmnsMVToIy
	opr/Yl9Tgea+qrLQeIVh8VlLxODTin2/It17uTrj7A==
X-Google-Smtp-Source: AGHT+IGZHRtkWAfSBW2/dSV+H2Ui7dyE8sdBAwZPe4ej+uywN52pK8qj6KrYTcbAiuu0fjtPS2uaqA==
X-Received: by 2002:a17:907:2ce9:b0:9a1:b33a:e464 with SMTP id hz9-20020a1709072ce900b009a1b33ae464mr126857ejc.31.1693239901377;
        Mon, 28 Aug 2023 09:25:01 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id w24-20020a17090649d800b009930308425csm4810643ejv.31.2023.08.28.09.25.00
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 09:25:00 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9a1de3417acso922636366b.0
        for <llvm@lists.linux.dev>; Mon, 28 Aug 2023 09:25:00 -0700 (PDT)
X-Received: by 2002:a17:907:9488:b0:9a5:c4e9:34b5 with SMTP id
 dm8-20020a170907948800b009a5c4e934b5mr115993ejc.35.1693239900059; Mon, 28 Aug
 2023 09:25:00 -0700 (PDT)
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
 <CAGG=3QX8AaTedPy-joWm6yp+TFHBVXm59OcvxkdLGsSuDjem5g@mail.gmail.com>
 <CAHk-=wjQpXpnGAwvv-oBi+cQ0g+D9rTK5STkXSSV4a90FPR+EQ@mail.gmail.com>
 <CAKwvOdm_y6UOnxFrAiDxou2jc8CRUvyhfH9kAdc3PG0=bEvduw@mail.gmail.com>
 <CAHk-=wgJzMzPFTCzejWs1WM4=74z2VENyOzySnucrXG3i=ajrw@mail.gmail.com> <CAMuHMdXZ4fGjjXguftvrB69rt7dR6ngFA46YB8oGpk2_issJzA@mail.gmail.com>
In-Reply-To: <CAMuHMdXZ4fGjjXguftvrB69rt7dR6ngFA46YB8oGpk2_issJzA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Aug 2023 09:24:43 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgefVmehW7oFrXLYYogqfoBQaku8Qm4o3+95Xwv=he+iQ@mail.gmail.com>
Message-ID: <CAHk-=wgefVmehW7oFrXLYYogqfoBQaku8Qm4o3+95Xwv=he+iQ@mail.gmail.com>
Subject: Re: [PATCH] lib/clz_ctz.c: Fix __clzdi2() and __ctzdi2() for 32-bit kernels
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Helge Deller <deller@gmx.de>, Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-parisc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Chanho Min <chanho.min@lge.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kees Cook <keescook@chromium.org>, clang-built-linux <llvm@lists.linux.dev>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Aug 2023 at 00:33, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Several architectures (incl. x86, but excl. amd64) do build the kernel with
> -freestanding.
>
> IIRC, the issue was that without that, gcc was "optimizing" calls
> to standard functions (implemented as inline optimized assembler
> functions) by replacing them with calls to other standard functions
> (also implemented as inline optimized assembler functions).

So using -ffreestanding is definitely the right thing to do for a
kernel in theory. It's very much supposed to tell the compiler to not
assume a standard libc, and without that gcc will do various
transformations that make sense when you "know" what libc does, but
may not make sense in the limited library model of a kernel.

So without it, gcc will do things like converting a 'printf()' call
without any conversion characters to a much cheaper 'puts()' etc. Now,
we often avoid that issue entirely by having our own function names
(ie printk()), but we do tend to use the *really* core C library
names.

Anyway, it turns out that some of the things you miss out on with
-ffreestanding are kind of important. In particular, at least gcc will
stop some 'memcpy()' optimizations too, which ends up being pretty
horrendous.

So while -ffreestanding would be the right thing to do in theory, in
practice it's actually pretty horrible. It's a big hammer that affects
a lot of things, and while many of them make sense for a kernel, some
of them are really bad. Which is why x86-64 no longer uses it.

I would actually suggest other architectures take a look if they care
at all about code generation. In particular, look at the x86-64
version of 'string.h' in

  arch/x86/include/asm/string_64.h

and note the difference with the 32-bit one. The 32-bit one is the
"this is how we used to do it" that nobody cared enough to change. The
64-bit one is much simpler and actually generates better code simply
because gcc recognizes memcpy() and friends, and will then inline it
when small etc.

The *downside* is that now you have to trust the compiler to do the
right thing. And that will depend on compiler version etc. There's a
reason why 32-bit x86 does everything by hand: when your compiler
history starts at gcc-1.40, things are simply *very* different from
when you now rely on gcc-5.1 and newer...

Put another way: gcc has changed, and what used to make sense probably
doesn't make sense any more.

                 Linus
