Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49EF7C
	for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 19:10:41 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id j15so15879493lfe.11
        for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 11:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WMFpeHH/2LlihF+kPrm9P2QAiW9s4yup6CA8c8djDKc=;
        b=Q7Fza7uT9MzvDrNjzgOKE/3nryb9/bWyOoCtZ+VCeySA1EtuNAXGDqISCPSRBOJspw
         g7Yx+kYLhYqc+5XQGELlTT7ExTn1f1mhnG9Z3ubty2EJhwKx3+jDHQPAH3zrYGnWfYdO
         1Or7ZqiSrs2230fVtFM6L1529Vg7oGeXKKBOvjK1fUj9ihfPGNp08tdP85lBXZH+vZwx
         SnDKT7G/28RfcEM8rszaV00cy4kmqPgk7c4o7rE8TL+/aS/l++IUvyd+WeHd4WHSF8P6
         x5WmsIejkZc6/1+KdpdO7V8DII7hNzO1rqf3C28046NwRgqyJH0wHjotNvGcrMhnFF8+
         PnFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WMFpeHH/2LlihF+kPrm9P2QAiW9s4yup6CA8c8djDKc=;
        b=zWwQlAX/tMB7UQSD956lp0F4rPE1BCUh3Yow0XYdU7B+Ny95EMpibnFTiMkHElm/N3
         1kTR4Op9TVuLL1RGTU+NHyuD/pde5Uadg7nqbvTwAJS5OhMYROnnguLzIf7iSL8fSe6B
         +jc7mBteuroBRh9/5u8u0w0Mak/oOwxYU+X8cf+GEqRW3amRcaiWqPIV/jzvbbdDbQfx
         qpjg6QLRvFZPaOg+sC40w76lhMy45xtfWtToN0/HDcWR/8wx32M0p9DyE4XvUD+piteO
         EikxJKaNVp6xRKiDpeCL3HRyIK9d6nn111SuneGoMWuURgwOIRoT7P4lF/EBBJ6JURjJ
         udvA==
X-Gm-Message-State: AOAM530++bMVIwjNg/IiDhkmFH42MlWmx6zNrygGBPOe7zvujkT4rHzs
	6ddZ14kBg68RoBLXa1ijheTVSjwn3iA2nwD+lL5bYw==
X-Google-Smtp-Source: ABdhPJyaSWbdMiG2FSKsMdDp4SYE6wwV2PmswU3VGZUUZh2mvxF1Xr0MrClFP7EQq8zdXlrgsOaLyKQpQomEYSOYCTg=
X-Received: by 2002:ac2:4e10:: with SMTP id e16mr406714lfr.444.1644952239569;
 Tue, 15 Feb 2022 11:10:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYtR+E52X-ucmvXYG5-9v0q2UEXQsML=nkQRnSf7TwXYqw@mail.gmail.com>
 <Ygp2wVo8JfWh5iOk@dev-arch.archlinux-ax161>
In-Reply-To: <Ygp2wVo8JfWh5iOk@dev-arch.archlinux-ax161>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 15 Feb 2022 11:10:28 -0800
Message-ID: <CAKwvOdmXvC-E_9PSOZVQDDx_UCSadxhF4d9c7qpJPmeFLY_JEA@mail.gmail.com>
Subject: Re: arm64: clang-nightly: net/ipv4/tcp_input.c: clang: error: clang
 frontend command failed with exit code 139
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 14, 2022 at 7:35 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Naresh,
>
> On Mon, Feb 14, 2022 at 12:27:17PM +0530, Naresh Kamboju wrote:
> > On Linux mainline master branch with arm64 clang-nightly build failed
> > due to following errors and warnings.
> >
> > make --silent --keep-going --jobs=8
> > O=/home/tuxbuild/.cache/tuxmake/builds/current LLVM=1 LLVM_IAS=1
> > ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
> > CROSS_COMPILE_COMPAT=arm-linux-gnueabihf- HOSTCC=clang CC=clang

Thanks for the report. Thanks Nathan for submitting reverts.

Naresh, as a heads up, the above command line can be simplified a
little bit (particularly for newer kernel branches)

LLVM_IAS=1 is implied by LLVM=1 as of v5.15-rc1 via
commit f12b034afeb3 ("scripts/Makefile.clang: default to LLVM_IAS=1").

CROSS_COMPILE is no longer necessary when building with LLVM=1 as of
v5.15-rc1 via:
commit 231ad7f409f1 ("Makefile: infer --target from ARCH for CC=clang")

There is no need for CROSS_COMPILE_COMPAT as of v5.16-rc1 via
commit 3e6f8d1fa184 ("arm64: vdso32: require CROSS_COMPILE_COMPAT for gcc+bfd")
when LLVM=1 is set.

HOSTCC and CC are implied by LLVM=1 as of
commit a0d1c951ef08 ("kbuild: support LLVM=1 to switch the default
tools to Clang/LLVM")
v5.7-rc1.

So the above make invocation could be trimmed down to simply:

$ make --silent --keep-going --jobs=8 \
O=/home/tuxbuild/.cache/tuxmake/builds/current LLVM=1

We might need to discuss further with tuxbuild folks, since I think a
few of those are set implicitly; I would prefer if they needed to be
set explicitly in order to properly test them being _unspecified_ in
our CI.
-- 
Thanks,
~Nick Desaulniers
