Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE975CB0
	for <llvm@lists.linux.dev>; Mon, 10 Oct 2022 21:23:41 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id l1-20020a17090a72c100b0020a6949a66aso11411680pjk.1
        for <llvm@lists.linux.dev>; Mon, 10 Oct 2022 14:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+sJ/oweV4chJnDymroBgeN7mOjH5s0c90aIlCoveJ3M=;
        b=at/GzrNip0vvaWZdMtg6b9oC+qdIP9gDHkUbM/9OPUG+MiRzOxwwQbVFm6jxmJzhnD
         vP3qEQ5igJTvzngSoUH8yN3TqvVyKxqnR2a80cbfRCYA4epezytZt4gZJrqDU6vhtgpR
         ZQCcsJ3g6uQ83QzDXWu0lZ0V5ULbWzOfyB2mU+TkGoHCvekxONtqbZFVTNXJPKM9itZI
         Aa6QPe7FTR/eteIiezYGlX55cm2YoYSsZg1qc2yIVC4OOQPz/99ikKVUqV+qybwfvLFY
         pB7CxhRDHAaWyI9OFiwYjztUORXXzvpK/wLJcVC3N7hXmd2Q9LCUH6Wd9Mq8uFx9t6M1
         m3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+sJ/oweV4chJnDymroBgeN7mOjH5s0c90aIlCoveJ3M=;
        b=i3kA2HLR9lMvYem61riL1yKpaGCv46nwE8INdPCYoKq8cz/5hhSkxQYBVwQYuuvkZK
         y6QIcGXaUSNwoVi7H1NeRORv5AJFriwTWqPNHdPAQrykv8aSFI3loa++O0lg8zGdB3kv
         Jqj2HsQTtd+bcBxJbUCeY+CNDem503JMeOVoECt8Lr1apI4vsg1xnMpzBC4qpsF1vvlB
         y9a+xJOu37VsCEqvUjdtivG7pfyb/eQ0r1UkNlrubR7kwdyL/Auu6o65L7N2CACgmjJD
         mzwlSryBfvGdoleyfM3O1hiZ8sKqxrWCcAS0XtKfKyCp6MleDDUyR2EXw58sDZ7h1DfR
         7Tzg==
X-Gm-Message-State: ACrzQf0de8XiSfYzd6NhPGJxmp6fLuVU55YjqFekIikBZB5Y3LW+Fp3m
	B/fnRn/rSlZuaCNL0aPJXJmke6TdhDN1uYNzLecOVA==
X-Google-Smtp-Source: AMsMyM58c/JM1tzaEva2PMIuMrUgVzEel+We68/BGcV+MBNQiK2LN2GrNXYcryDyKaRMYyQSycCVwEN8m1GK+h8lyOM=
X-Received: by 2002:a17:90b:3a88:b0:209:f35d:ad53 with SMTP id
 om8-20020a17090b3a8800b00209f35dad53mr33965063pjb.102.1665437020431; Mon, 10
 Oct 2022 14:23:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220716001616.4052225-1-ndesaulniers@google.com> <CAK8P3a0ky5w82=d2N_iZ2HYujeCDKJJqjT8P25-_+VpsZYWA_A@mail.gmail.com>
In-Reply-To: <CAK8P3a0ky5w82=d2N_iZ2HYujeCDKJJqjT8P25-_+VpsZYWA_A@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 10 Oct 2022 14:23:28 -0700
Message-ID: <CAKwvOdnfPeFpkD7zqt0EGk-xC_v_Lxt+2eOciMfbXihYG936Kw@mail.gmail.com>
Subject: Re: [PATCH] arm: lib: implement aeabi_uldivmod via div64_u64_rem
To: Arnd Bergmann <arnd@kernel.org>
Cc: clang-built-linux <llvm@lists.linux.dev>, Nathan Chancellor <nathan@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Ard Biesheuval <ardb@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Russell King <linux@armlinux.org.uk>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Craig Topper <craig.topper@sifive.com>, 
	Philip Reames <listmail@philipreames.com>, jh@jhauser.us
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 16, 2022 at 2:47 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Sat, Jul 16, 2022 at 2:16 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > Compilers frequently need to defer 64b division to a libcall with this
> > symbol name. It essentially is div64_u64_rem, just with a different
> > signature. Kernel developers know to call div64_u64_rem, but compilers
> > don't.
> >
> > Link: https://lore.kernel.org/lkml/20220524004156.0000790e@garyguo.net/
> > Suggested-by: Gary Guo <gary@garyguo.net>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

So the existing division by constant issues went away, and Craig was
able to improve division by double-word constants in LLVM
1. https://reviews.llvm.org/D130862
2. https://reviews.llvm.org/D135541
But we still have one instance left that's not div/rem by constant via
CONFIG_FPE_NWFPE=y that's now blocking Android's compiler upgrade.
https://github.com/ClangBuiltLinux/linux/issues/1666

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/nwfpe/softfloat.c#n2312
Any creative ideas on how to avoid this? Perhaps putting the `aSig -=
bSig;` in inline asm? Inserting a `barrier()` or empty asm statement
into the loops also seems to work.

Otherwise I'd define __aeabi_uldivmod as static in
arch/arm/nwfpe/softfloat.c (with the body from this patch) only for
clang.

I see this function seems to be based on Berkeley Softfloat
http://www.jhauser.us/arithmetic/SoftFloat.html
v2.  v3 looks like a total rewrite.  Looking at v3e, it looks like
float64_rem() is now called f64_rem() and defined in f64_rem.c.  It
doesn't look like there's anything from v3 that we could backport to
the kernel's v2 to avoid this.

Otherwise perhaps we just disable OABI_COMPAT for clang. Quite a few
defconfigs explicitly enable FPE_NWFPE though.  Are there really a lot
of OABI binaries still in use?

There's also the hidden llvm flag:
`-mllvm -replexitval=never` that seems to work here, though FWICT it's
disabling 3 such loop elisions (I think all three statements in that
do while).  That's probably the best way forward here...

https://reviews.llvm.org/D9800 made the decision to do such a
transformation when a loop can be fully elided ("deleted").

>
> This has historically been strongly NAK'd, and I don't think that position
> has changed in the meantime. A variable-argument 64-bit division is
> really expensive, especially on 32-bit machines that lack a native
> 32-bit division instruction, and we don't want developers to accidentally
> insert one in their driver code.
>
> Explicitly calling one of the division helpers in linux/math64.h is the
> established way for driver writers to declare that a particular division
> cannot be turned into a cheaper operation and is never run in a
> performance critical code path. The compiler of course cannot know
> about either of those.
>
>         Arnd



-- 
Thanks,
~Nick Desaulniers
