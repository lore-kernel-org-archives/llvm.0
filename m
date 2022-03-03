Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D4536B
	for <llvm@lists.linux.dev>; Thu,  3 Mar 2022 19:38:10 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id i11so10338676lfu.3
        for <llvm@lists.linux.dev>; Thu, 03 Mar 2022 11:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uZO68zBMcccw6v43cUgUIalax5HiUJc6qwLMgdpxolI=;
        b=MKiL8WrqXiduCtzmEhl3iONkEd5jvUf4wnO4vk6bbOmFXcxFBxWAsM9fVZose9b7V4
         CA7Ah2hxAGZ11jlsk/oTCQBdVNPUPnG/nTxSRctMcm4TA1h+ie+AVC60wcFckrQqhWYl
         6CWo6sQuTPCOn9sGAPmmyCpaIdT16SVoPtEOQrO3stloP1MpKd8thkRGXu0i5P0xy9S9
         0Hvns9FPKrCNDPN4LY9nKCFyQuY1oAZNvg5AHfGjjfNwBFHn+yRQcHZXa+TEdMbVamGS
         4ARC23SdgaZxa1XjWb66VMEduWIXJ91u1pW3D2NqkLWsuSY2FkphJ7N9S15BXAYX2i1/
         N68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uZO68zBMcccw6v43cUgUIalax5HiUJc6qwLMgdpxolI=;
        b=Z1mltEXT5EWVuoy70mpizDQr4ylybAQSbLifteNs++u4ATRexmH4AIuSWeBjL60SJE
         9wBy+E/pSsMkeCezzoxf/6x7DtrlfKZXnEdWglWU2//RqCKynQWN3w+/SodPzautdzhV
         oqAr0sNCJH3BXHtMLtIEV3c/8WCCdfOAKuleSZUpTRwh69rz10zm59fIJcBRHoQqLLFB
         Cau8iQH4zAU6pqnyC+/NK0Al0ogNZo4D+VL1SLO70+J5SqhBtB11HKHLgegwebrf0OOS
         9qluUcF2ASxzPPTehaa3SLx8vhnj2liDr+shrL7dp9RhLobiC6YE2cD4t2l3UC7X5r23
         gq9g==
X-Gm-Message-State: AOAM531W898gKXi2fTvv/3XjTgkCJP89rg75orzpOnSWmz/M22t9vr6g
	FZ+BHeRdgRvikhSXbNVupJj32sYAbO0tM+swL4C1hA==
X-Google-Smtp-Source: ABdhPJyRHrKwbNy2Xadnc8yan6MtVBpc1WVOSU1q4lnDO2kDzFB/HreVlM3td8SXfBUnAnDPlCTwVsaUH867jxVeYtY=
X-Received: by 2002:ac2:41d2:0:b0:445:bba7:e789 with SMTP id
 d18-20020ac241d2000000b00445bba7e789mr5628645lfi.392.1646336288151; Thu, 03
 Mar 2022 11:38:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYs3GavpYh6V_yTUGNbAU70mygVxBKvqoq=xh20pw1Wvow@mail.gmail.com>
 <YiD1UruDryIyZAJc@dev-arch.thelio-3990X> <202203030934.5CA7A132C0@keescook>
In-Reply-To: <202203030934.5CA7A132C0@keescook>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 3 Mar 2022 11:37:56 -0800
Message-ID: <CAKwvOdn1SM3F-5bMgHVTiBn+u22caWAf2Eh-Vfucvp+WXPJL=A@mail.gmail.com>
Subject: Re: [next] mips: clang-14-defconfig build regression
To: Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Naresh Kamboju <naresh.kamboju@linaro.org>, llvm@lists.linux.dev, 
	lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 3, 2022 at 9:36 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Mar 03, 2022 at 10:05:22AM -0700, Nathan Chancellor wrote:
> > Hi Naresh,
> >
> > On Thu, Mar 03, 2022 at 09:09:56AM +0530, Naresh Kamboju wrote:
> > > [Please ignore this email if it is already reported]
> > >
> > > Linux next-20220302 mips builds failed [1] & [2].
> > >
> > > Regressions found on mips:
> > >
> > >   - mips-clang-12-defconfig
> > >   - mips-clang-13-allnoconfig
> > >   - mips-clang-12-allnoconfig
> > >   - mips-clang-12-tinyconfig
> > >   - mips-clang-13-defconfig
> > >   - mips-clang-11-tinyconfig
> > >   - mips-clang-11-defconfig
> > >   - mips-clang-nightly-allnoconfig
> > >   - mips-clang-14-tinyconfig
> > >   - mips-clang-14-defconfig
> > >   - mips-clang-11-allnoconfig
> > >   - mips-clang-nightly-tinyconfig
> > >   - mips-clang-13-tinyconfig
> > >   - mips-clang-nightly-defconfig
> > >   - mips-clang-14-allnoconfig
> > >
> > > make --silent --keep-going --jobs=8
> > > O=/home/tuxbuild/.cache/tuxmake/builds/1/build LLVM=1 LLVM_IAS=1
> > > ARCH=mips CROSS_COMPILE=mips-linux-gnu- 'HOSTCC=sccache clang'
> > > 'CC=sccache clang' defconfig
> >
> > <snip>
> >
> > > fatal error: error in backend: Invalid register name global variable
> >
> > Thanks a lot for the report! Our CI caught this as well, I have filed an
> > issue on our tracker and the upstream LLVM one:
> >
> > https://github.com/ClangBuiltLinux/linux/issues/1608
> > https://github.com/llvm/llvm-project/issues/54174
> >
> > CC Kees, just as an FYI because of commit 200ed341b864 ("mips: Implement
> > "current_stack_pointer"").
>
> Oh! That's surprising. Thanks for digging out the details. The comment
> in the code is amusing:
>
> Register
> MipsTargetLowering::getRegisterByName(const char *RegName, LLT VT,
>                                       const MachineFunction &MF) const {
>   // Named registers is expected to be fairly rare. For now, just support $28
>   // since the linux kernel uses it.
>
>
> Anyway, I guess I'll need to send a fix to make this compiler-version
> dependent...

https://reviews.llvm.org/D120926 for the toolchain side.
-- 
Thanks,
~Nick Desaulniers
