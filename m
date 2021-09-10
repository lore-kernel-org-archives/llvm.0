Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208BD3FC3
	for <llvm@lists.linux.dev>; Fri, 10 Sep 2021 22:26:22 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id l18so5515206lji.12
        for <llvm@lists.linux.dev>; Fri, 10 Sep 2021 15:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZUsosREWjU2wuV6r3RVgu7Lpknqi56uAU/0psBGml44=;
        b=gnhbUbe1BBqDRhDCmh1BvzZDOVv+5MgUpusii4XwBsEY3nKBBWRU3qnoMzRewlV3EB
         0Nii6pzDgDLRgcTEP7/AfebocopF3MRg4f9HL9/n3m1rSIoHdxY7nLwf8RiGlPV/twuH
         VrEEsNXo56l9T7wTI2VJYgo6uzHnKyvr2r7mVmFmZ2sF2lajHA51Ltag/Jv7bhORnmcn
         yv9teW3xFLbtKN7BnvcqcRMKTUzufcj8SfyHmAzI8bWW1Vm37E4DBcWmQ91zpnXE9KRb
         DpUJtGVvxfxiUe9bTnLS5ppumYz9c2LZjaenkwvrPPNeaWpMMtP7rzyrdVGhxu7a7/9P
         KeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZUsosREWjU2wuV6r3RVgu7Lpknqi56uAU/0psBGml44=;
        b=49XGigW1+x40cbAxeTdOUGSNWDST92qqAOiEtz3a6fBSCIfLhJ/KsoDf77rGss8phR
         C3grtI0EMRVQIyiu5oisCb2QZjE66qzuzNPH8IuMyeeb+PQ+6EsXR52TXuW1Ujp2FiCS
         bln1eSv0TWwj1TzFkHty6OSVi2ygs/MNs6/PGrCLBfU7cQ1Ogw0Etg5Ythp9c26urey8
         yeP4FvTYPs737Sh3DYz3XsSiNKCAWXH4R8zbzJuJkooXvMlXTdFuaxknIyq5vgJG7+cK
         4/qhOWfem38kM84ljEo3BjqJgO7zMlSzIZSOLDmP4OCuBwdDto3GoLqjNHnkLHxNqjRW
         /sig==
X-Gm-Message-State: AOAM532pZpeUik+EL1WyxXJQZ1KvK+wAMSXwJWX5vjl2VSTTNtpIcxo1
	VhRAoE7LhSYncAQygdmAmnxm3DwCTSDvP5nz5Ur5Tg==
X-Google-Smtp-Source: ABdhPJx3/1Rtn9zsJc9K90my4fz5+Vetr5D0dTwX0ylIR93VWN4NRYrGohRc2iC9tLwZ90CWhp6WOJY0z4VConDNsL4=
X-Received: by 2002:a2e:b551:: with SMTP id a17mr5889255ljn.128.1631312780009;
 Fri, 10 Sep 2021 15:26:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210909182525.372ee687@canb.auug.org.au> <20210909225035.3990728-1-ndesaulniers@google.com>
 <CAKwvOd=hoPv2GMZws6UsnMHop6+662wer=Hfo2Tw2=1XXCY2JA@mail.gmail.com> <CAKwvOdmXVLjd9ukYpORDgPeqFcM4nRiOYE_1Mtr_bGa=FPo4Cg@mail.gmail.com>
In-Reply-To: <CAKwvOdmXVLjd9ukYpORDgPeqFcM4nRiOYE_1Mtr_bGa=FPo4Cg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 10 Sep 2021 15:26:09 -0700
Message-ID: <CAKwvOdnDOQPRe3v7ZD6SRR=TgbLqo1wfn_zmgfJpbqGEZyJ1-Q@mail.gmail.com>
Subject: Re: linux-next: build failure while building Linus' tree
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: axboe@kernel.dk, josef@toxicpanda.com, libaokun1@huawei.com, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	llvm@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, sfr@canb.auug.org.au
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 10, 2021 at 3:17 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Sep 10, 2021 at 3:02 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Thu, Sep 9, 2021 at 3:50 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
> > >
> > > + Rasmus
> > >
> > > This was introduced in
> > > commit f0907827a8a91 ("compiler.h: enable builtin overflow checkers and add
> > > fallback code")
> > > which added division using the `/` operator, which is problematic when checking
> > > for overflows of 64b operands on 32b targets.
> > >
> > > We'll probably need helpers from linux/math64.h and some combination of
> > > __builtin_choose_expr/__builtin_types_compatible_p.
> > >
> > > That will help us fix another compiler bug for older clang releases, too.
> > > https://github.com/ClangBuiltLinux/linux/issues/1438.
> >
> > Ok, I have something hacked up that I think will work:
> > https://gist.github.com/nickdesaulniers/2479818f4983bbf2d688cebbab435863
>
> hmm...playing around with adding some static asserts to the above, I

ah! static_assert can't be used for the type agnostic macros,
BUILD_BUG_ON needs to be used in its place. Ok, let me add a few and
see if that can help instill some confidence here.

> don't think it's quite right, specifically:
> #define div_64(dividend, divisor) ({            \
>   typeof(dividend) z;
>
> might declare z with the expected sign, but not necessarily the
> correct width when the dividend is 32b but the divisor is 64b.  Feels
> a bit like trying to encode the C type promotion rules in a macro...
>
> > This incomplete diff is a little hacked up to reproduce the issue with
> > a known-bad revision of clang that demonstrates a similar issue to GCC
> > 4.9.  You can ignore the movement of check_mul_overflow and friends in
> > include/linux/overflow.h.
> >
> > I think I'm going to break that up into 2 or 3 patches:
> > 1. move is_signed_type from include/linux/overflow.h to perhaps
> > include/linux/typecheck.h.
> > 2. add div64_x64, div_x64, and div_64 to include/linux/math64.h, use
> > them in include/linux/overflow.h to fix GCC 4.9
> > 3. move multiply fallbacks out of
> > COMPILER_HAS_GENERIC_BUILTIN_OVERFLOW for clang < 14.
> > --
> > Thanks,
> > ~Nick Desaulniers
>
>
>
> --
> Thanks,
> ~Nick Desaulniers



-- 
Thanks,
~Nick Desaulniers
