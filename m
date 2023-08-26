Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACACB37F
	for <llvm@lists.linux.dev>; Sat, 26 Aug 2023 01:08:13 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-52a1ce52ef4so1965506a12.2
        for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 18:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1693012091; x=1693616891;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V940I5eBi0Ftd+/pXbQQIlfDUIAcd0CLy5fb6CBFMNA=;
        b=I0DqPuAzgbvUQNAQTNOqi344H51xBwjJIMFJ8zDFdl9Rw15fK6MY4morHz6I0GRTh6
         Nu0WWuxkneTUdamEFhpSYSkd8cNQPzT+VCVHESGnLHJmt0MtCe5Hh+c2ECSp7rqv4yvj
         7mP0Ty9G0Zm3AfJUx5g6X9GNsxOXzMb3TW8Lw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693012091; x=1693616891;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V940I5eBi0Ftd+/pXbQQIlfDUIAcd0CLy5fb6CBFMNA=;
        b=KMUFhNWQnCLVmzMLWO6mylVmf8C7Ax5tOby9lm6GC3xpN76zgdB1VHTP/8lukJSVfU
         jsG5v2ZiB+/gbKz/UotIJioT3APQtmp35sOIKWRyRhiMeAvBJbqUs//YLaPgVG0busyL
         k/lK/bmMgYQ0IXhUTxE3GsQmxmjrEM71I4YT1ksWhxc+mrcgT5kmhtoN0y/L1K7Ip6qH
         BBeDfifHhAN2tcCJRuas6asF8pqGD0eV5F5fdkcKJhYocd/0upilc8xUYNMPvb/kIPRm
         PAdAhRcpCDAPK1+4svuGr+dATZuWIrLo1OLugzq/Do8HC6Hs56uZq14L/m+0nw3mFzSP
         Z9yA==
X-Gm-Message-State: AOJu0Yz2oVNFoNnUFcNkaMmi1Vzd3+3938Q+iUdCHU/+u/0rbZnYpaWH
	Jt2eQNp9QRq66wdhC5QK52VBEonimNP+REzqgOJs3wVN
X-Google-Smtp-Source: AGHT+IEamVCuUQTYlTFKYVcgeZjFkezaWoilF3UBAqS0IblS7+VxdtjmvZBPUCwGik/XRc92vJDWjQ==
X-Received: by 2002:a17:906:310d:b0:992:1233:9c45 with SMTP id 13-20020a170906310d00b0099212339c45mr13951944ejx.69.1693012091474;
        Fri, 25 Aug 2023 18:08:11 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id d14-20020a17090648ce00b0099cb349d570sm1492240ejt.185.2023.08.25.18.08.09
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 18:08:10 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9a19bf6ab66so186169366b.3
        for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 18:08:09 -0700 (PDT)
X-Received: by 2002:a17:906:9be8:b0:99d:6ca6:7a8c with SMTP id
 de40-20020a1709069be800b0099d6ca67a8cmr15893578ejc.63.1693012089691; Fri, 25
 Aug 2023 18:08:09 -0700 (PDT)
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
 <CAHk-=wjQpXpnGAwvv-oBi+cQ0g+D9rTK5STkXSSV4a90FPR+EQ@mail.gmail.com> <CAKwvOdm_y6UOnxFrAiDxou2jc8CRUvyhfH9kAdc3PG0=bEvduw@mail.gmail.com>
In-Reply-To: <CAKwvOdm_y6UOnxFrAiDxou2jc8CRUvyhfH9kAdc3PG0=bEvduw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 25 Aug 2023 18:07:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgJzMzPFTCzejWs1WM4=74z2VENyOzySnucrXG3i=ajrw@mail.gmail.com>
Message-ID: <CAHk-=wgJzMzPFTCzejWs1WM4=74z2VENyOzySnucrXG3i=ajrw@mail.gmail.com>
Subject: Re: [PATCH] lib/clz_ctz.c: Fix __clzdi2() and __ctzdi2() for 32-bit kernels
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Bill Wendling <morbo@google.com>, Helge Deller <deller@gmx.de>, 
	Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-parisc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Chanho Min <chanho.min@lge.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, 
	clang-built-linux <llvm@lists.linux.dev>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Aug 2023 at 17:52, Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> So 2 concerns where "I'll do it in inline asm" can pessimize codegen:
> 1. You alluded to this, but what happens when one of these functions
> is called with a constant?

This is why our headers have a lot of __builtin_constant_p()'s in them..

In this particular case, see the x86 asm/bitops.h code:

    #define ffs(x) (__builtin_constant_p(x) ? __builtin_ffs(x) :
variable_ffs(x))

but this is actually quite a common pattern, and it's often not about
something like __builtin_ffs() at all.

See all the other __builtin_constant_p()'s that we have in that same
file because we basically just use different code sequences for
constants.

And that file isn't even unusual. We use it quite a lot when we care
about code generation for some particular case.

> 2. by providing the definition of a symbol typically provided by libc
> (and then not building with -ffreestanding) pessimizes libcall
> optimization.

.. and this is partly why we often avoid libgcc things, and do certain
things by hand.

The classic rule is "Don't do 64-bit divisions using the C '/' operator".

So in the kernel you have to use do_div() and friends, because the
library versions are often disgusting and might not know that 64/32 is
much much cheaper and is what you want.

And quite often we simply use other names - but then we also do *not*
build with -freestanding, because -freestanding has at least
traditionally meant that the compiler won't optimize the simple and
obvious cases (typically things like "memcpy with a constant size").

So we mix and match and pick the best option.

The kernel really doesn't care about architecture portability, because
honestly, something like "ffs()" is entirely *trivial* to get right,
compared to the real differences between architectures (eg VM and IO
differences etc).

             Linus
