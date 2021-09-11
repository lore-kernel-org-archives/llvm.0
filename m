Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D843FC3
	for <llvm@lists.linux.dev>; Sat, 11 Sep 2021 00:16:42 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id f18so7378565lfk.12
        for <llvm@lists.linux.dev>; Fri, 10 Sep 2021 17:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nnxC0+uXgJWjMMOwzYEprAl8DpqU7SitvBfJvqXtAvA=;
        b=YKR5oBCZODSdIMSuJo9to3OJaDHwi04ayCLOqMoBUmbViJjERcAXyJJTrtmrE5YDki
         wISXApUrzytIbqr8U291ZReOnIVGsE0ub1UMpVCiP8CF0Dlso8Sr65erwIdVQkX1VCDz
         phSZtge746Vz86B4Uvv6BPViBE6Jou8UOa3NsWWqlllXijuQO5yQrmQmw0uKWZyNja1p
         qZkATojLiYONI/D0MIGkCujiZLIbc8eu7AwXX1VW/4LlSRGfEKNPLMU44fbYc5VRfMZ7
         1DdoGStpHeR359PFxGEqayNMXKK4VpIklDRf8B5w2bDcfNHaxvNeOX1QMGmF7dcvGMa+
         6giw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nnxC0+uXgJWjMMOwzYEprAl8DpqU7SitvBfJvqXtAvA=;
        b=SB9N0Aolk5gSI2p/yehENt+1Q6RCSbZyqnFVJMApVXYeui+WuzMhGTASG/c/HKoAmf
         5Fs+r+6Y7oORz1NtaJFzF/wSdaFfxV/DIs6FoEX0yBlSEmJJUH577Kx8EPwniGytfUAK
         bOvgihg2GgHgALT6m0qk6lNAX0yrvo8OwMP3HdTrExUwfsCMd3uMAlHqva9IVtZr8Z+r
         +EHtZONmfCC6mDhZ04NKXF8uxEguv/n+HRicGrKWbz70LmINCwtR+sQY7R1S3cn5clQn
         R4qICbIR72Rw7p0AwLMUim/L+933svIIiowjHvSkWCQn8QREnAlL5uVm0NdCtY/eLxhW
         tfuQ==
X-Gm-Message-State: AOAM531U4nqhw9F4DjmYk4PS1o7cRSJxSm8+Dl5mT0Wunm2CVXrKWY7n
	3zCpbYWPDwHCTVIxB76Qyb3qE/RmbICP2z4Du7tQGw==
X-Google-Smtp-Source: ABdhPJzBX9yhpclacNqWINCliCUD++/3F+Bmc8o81PP6am+7gtNUXPyOJj+aJHqLwp0aAyWL7TLgSiU2iEOIQ5xR+iM=
X-Received: by 2002:a05:6512:139c:: with SMTP id p28mr151762lfa.523.1631319400634;
 Fri, 10 Sep 2021 17:16:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210910234047.1019925-1-ndesaulniers@google.com>
 <20210910234047.1019925-2-ndesaulniers@google.com> <cb42c578-d037-3297-d0c2-ab107b7a838f@kernel.org>
In-Reply-To: <cb42c578-d037-3297-d0c2-ab107b7a838f@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 10 Sep 2021 17:16:29 -0700
Message-ID: <CAKwvOd=m1bUZwyV53k2+d+M6rOL04A0WPhH_wOUFU-ZK1BOWFg@mail.gmail.com>
Subject: Re: [PATCH 01/10] Documentation: raise minimum supported version of
 GCC to 5.1
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Masahiro Yamada <masahiroy@kernel.org>, Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 10, 2021 at 4:56 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On 9/10/2021 4:40 PM, Nick Desaulniers wrote:
> > commit fad7cd3310db ("nbd: add the check to prevent overflow in
> > __nbd_ioctl()")
> >
> > raised an issue from the fallback helpers added in
> >
> > commit f0907827a8a9 ("compiler.h: enable builtin overflow checkers and add fallback code")
> >
> > Specifically, the helpers for checking whether the results of a
> > multiplication overflowed (__unsigned_mul_overflow,
> > __signed_add_overflow) use the division operator when
> > !COMPILER_HAS_GENERIC_BUILTIN_OVERFLOW. This is problematic for 64b
> > operands on 32b hosts.
>
> "hosts" -> "targets" or "architectures"?

Yes, will revise to "targets."

>
> It might be worth putting the error that Stephen found here?

Doh! Yes, in v2, I'll include the following additional context:
```
The following error is observed when building for 32b powerpc:
> ERROR: modpost: "__divdi3" [drivers/block/nbd.ko] undefined!

As Stephen Rothwell notes:
> The added check_mul_overflow() call is being passed 64 bit values.
> COMPILER_HAS_GENERIC_BUILTIN_OVERFLOW is not set for this build (see
> include/linux/overflow.h).
```


>
> > Also, because the macro is type agnostic, it is very difficult to write
> > a similarly type generic macro that dispatches to one of:
> > * div64_s64
> > * div64_u64
> > * div_s64
> > * div_u64
> >
> > Raising the minimum supported versions allows us to remove all of the
> > fallback helpers for !COMPILER_HAS_GENERIC_BUILTIN_OVERFLOW, instead
> > dispatching the compiler builtins.
> >
> > arm64 has already raised the minimum supported GCC version to 5.1, do
> > this for all targets now. See the link below for the previous
> > discussion.
> >
> > Link: https://lore.kernel.org/all/20210909182525.372ee687@canb.auug.org.au/
> > Link: https://lore.kernel.org/lkml/CAK7LNASs6dvU6D3jL2GG3jW58fXfaj6VNOe55NJnTB8UPuk2pA@mail.gmail.com/
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1438
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Reported-by: Nathan Chancellor <nathan@kernel.org>
> > Suggested-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> > ---
> >   Documentation/process/changes.rst | 2 +-
> >   scripts/min-tool-version.sh       | 8 +-------
> >   2 files changed, 2 insertions(+), 8 deletions(-)
> >
> > diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
> > index d3a8557b66a1..e35ab74a0f80 100644
> > --- a/Documentation/process/changes.rst
> > +++ b/Documentation/process/changes.rst
> > @@ -29,7 +29,7 @@ you probably needn't concern yourself with pcmciautils.
> >   ====================== ===============  ========================================
> >           Program        Minimal version       Command to check the version
> >   ====================== ===============  ========================================
> > -GNU C                  4.9              gcc --version
> > +GNU C                  5.1              gcc --version
> >   Clang/LLVM (optional)  10.0.1           clang --version
> >   GNU make               3.81             make --version
> >   binutils               2.23             ld -v
> > diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
> > index 319f92104f56..4edc708baa63 100755
> > --- a/scripts/min-tool-version.sh
> > +++ b/scripts/min-tool-version.sh
> > @@ -17,13 +17,7 @@ binutils)
> >       echo 2.23.0
> >       ;;
> >   gcc)
> > -     # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293
> > -     # https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk
> > -     if [ "$SRCARCH" = arm64 ]; then
> > -             echo 5.1.0
> > -     else
> > -             echo 4.9.0
> > -     fi
> > +     echo 5.1.0
> >       ;;
> >   icc)
> >       # temporary
> >



-- 
Thanks,
~Nick Desaulniers
