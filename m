Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCED3FF0
	for <llvm@lists.linux.dev>; Thu,  9 Sep 2021 16:53:54 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id m28so4989620lfj.6
        for <llvm@lists.linux.dev>; Thu, 09 Sep 2021 09:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dZAGO3iBrhQAq7cxABN7v0YxXWtGf0YiblsBwMfWyrc=;
        b=OWJMz8LLr85sFM8RFy9k59A+OTyiaRWf0ZZ0n6Rcq7tOz8KHuQoirSrp+zkJs09eDI
         qXHOeRQalPKLdGml0NfQEcoEgcJ4RTyh7hAsLCSL/ndaFI7PDIP4NyPdrC6LqlqN47u+
         Tal0cn+jttYnbxNfFIYPgA5YVSh9fCfn1aRs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dZAGO3iBrhQAq7cxABN7v0YxXWtGf0YiblsBwMfWyrc=;
        b=6Xjk+mV3LtunasqMnOiakqJmqFeF3wsA641PR4c/BflsXCEK6S+JenQZvILhmeA88M
         36Xmcze9S+++FNxU7zTYhb4/FN39WNDku4s1yTZ153a0RDMJpi21z5VHD/ygb2MYEY9W
         iahK5lyqoPiZ3IxHXhQ1xL+2edI+cYeXHan8xg4GMMFud8YQje0qT69jCRmHFCi/+1uv
         CMA3gcA1r519Cpeu0pUgdPvjWTk7fjEwvCCzNqlJSVuxHTw4EPKk+Gax66+rPKDRKe8U
         tru3kVmW6OfwHdi+mrUdFmYfls1rAhjdB+0j00VGmJ9sOAgTp01qr08IX9uA2N0Xt0zW
         01vQ==
X-Gm-Message-State: AOAM531Qh/LEbHjdKmGWrtjquW5rEc1b8SwmpTyRScs53Mddau46iWgB
	D2iW23VxTLBek7VdMZZkDKdJ+sAeElhRUlhcHwI=
X-Google-Smtp-Source: ABdhPJzVegtpnRfaIdvcQOCDKAPbtMYuR8+9F0kdVldwku7VG7Ny4uZggsBX8a2E5ja/IDSjpkOmqQ==
X-Received: by 2002:a05:6512:10d2:: with SMTP id k18mr628522lfg.592.1631206432509;
        Thu, 09 Sep 2021 09:53:52 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id y2sm252509lfe.242.2021.09.09.09.53.51
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Sep 2021 09:53:51 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id x27so4993726lfu.5
        for <llvm@lists.linux.dev>; Thu, 09 Sep 2021 09:53:51 -0700 (PDT)
X-Received: by 2002:a05:6512:3da5:: with SMTP id k37mr583246lfv.655.1631206431030;
 Thu, 09 Sep 2021 09:53:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210906142615.GA1917503@roeck-us.net> <CAHk-=wgjTePY1v_D-jszz4NrpTso0CdvB9PcdroPS=TNU1oZMQ@mail.gmail.com>
 <YTbOs13waorzamZ6@Ryzen-9-3900X.localdomain> <CAK8P3a3_Tdc-XVPXrJ69j3S9048uzmVJGrNcvi0T6yr6OrHkPw@mail.gmail.com>
 <YTkjJPCdR1VGaaVm@archlinux-ax161> <75a10e8b-9f11-64c4-460b-9f3ac09965e2@roeck-us.net>
 <YTkyIAevt7XOd+8j@elver.google.com> <YTmidYBdchAv/vpS@infradead.org>
 <CANpmjNNCVu8uyn=8=5_8rLeKM5t3h7-KzVg1aCJASxF8u_6tEQ@mail.gmail.com>
 <CAK8P3a1W-13f-qCykaaAiXAr+P_F+VhjsU-9Uu=kTPUeB4b26Q@mail.gmail.com> <CANpmjNPBdx4b7bp=reNJPMzSNetdyrk+503_1LLoxNMYwUhSHg@mail.gmail.com>
In-Reply-To: <CANpmjNPBdx4b7bp=reNJPMzSNetdyrk+503_1LLoxNMYwUhSHg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 9 Sep 2021 09:53:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiZqRFx6Oh8ZBer2THTMcjdbwZb5X3fCLBHmyuC9jPDhA@mail.gmail.com>
Message-ID: <CAHk-=wiZqRFx6Oh8ZBer2THTMcjdbwZb5X3fCLBHmyuC9jPDhA@mail.gmail.com>
Subject: Re: [PATCH] Enable '-Werror' by default for all kernel builds
To: Marco Elver <elver@google.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Christoph Hellwig <hch@infradead.org>, 
	Guenter Roeck <linux@roeck-us.net>, Nathan Chancellor <nathan@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	Nick Desaulniers <ndesaulniers@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, kasan-dev <kasan-dev@googlegroups.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 9, 2021 at 4:43 AM Marco Elver <elver@google.com> wrote:
>
> Sure, but the reality is that the real stack size is already doubled
> for KASAN. And that should be reflected in Wframe-larger-than.

I don't think that's true.

Quite the reverse, in fact.

Yes, the *dynamic* stack size is doubled due to KASAN, because it will
cause much deeper callchains.

But the individual frames don't grow that much apart from compilers
doing stupid things (ie apparently clang and KASAN_STACK), and if
anything, the deeper dynamic call chains means that the individual
frame size being small is even *more* important, but we do compensate
for the deeper stacks by making THREAD_SIZE_ORDER bigger at least on
x86.

Honestly, I am not even happy with the current "2048 bytes for
64-bit". The excuse has been that 64-bit needs more stack, but all it
ever did was clearly to just allow people to just do bad things.

Because a 1kB stack frame is horrendous even in 64-bit. That's not
"spill some registers" kind of stack frame. That's "put a big
structure on the stack" kind of stack frame regardless of any other
issues.

And no, "but we have 16kB of stack and we'll switch stacks on
interrupts" is not an excuse for one single level to use up 1kB, much
less 2kB.  Does anybody seriously believe that we don't quite normally
have stacks that are easily tens of frames deep?

Without having some true "this is the full callchain" information, the
best we can do is just limit individual stack frames. And 2kB is
*excessive*.

                     Linus
