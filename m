Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FB17C
	for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 19:18:49 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id u16so6982959ljk.2
        for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 11:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=urx4RhFz12ENplV8nHgIKk5JctorPTtGKlJ9HOaV/nw=;
        b=Q2E5MYhnb8RBb4LwHyKZoIEps9yKNhiyf0rkiJPeICpq2OliStVxizlnYkFn/rUro8
         uu7Nl/zSI4LMxk/v6ny3spI0NNViowMC0eY4Hlm2VAVxHVEsmHy8m2s0ef7THlCHmuA0
         FPi3avYRz6v4qElgc1KHF3bW+a1rL2/Sf/h75+maq2u2udKd2sEtrqnQVpHKE6cv5G5R
         OaNdsIUqvpaD5ZVi6H4CJFgt69C/9aTj6B9Z4gHiTgQ18tXCtI6vYvc2hP3SHLuuC+mP
         QxVt259jXwHgPjf6f7HDQaJQoK7/f8nWaOjHpZhyOGvbnhTqPZZ7Hr0KKSKyI+lHO92v
         eHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=urx4RhFz12ENplV8nHgIKk5JctorPTtGKlJ9HOaV/nw=;
        b=6MXPg/FYR/S7CqVY5QY4fxYL71WC/fpwivuoj1jKERKei7G7Qh/zQ8e72ZUBx7uRRp
         AWSV70lUbdioMLr6EFSUEhpc7rLuTVA13pnDFIGFRCm3g38RxEO21eno+Wzfrpix2iqK
         N7qnYMNIBZGY8P4vRAjYOmwdwUDLUBYuet4G1B5jnG5vOAoFjVGG99C14/EcXUDWQjVD
         v1c1t4l0CuKpjYnSpTv23nq45hfTuCXFnMZP6k+b14CcOnRFOoeMOWeZu03Vdzl5llwQ
         JlrbybYdYoOVjOUYoqDfxdH9XphEGtJX99+fBrekMF0cCum87+vfd+dRzQHYMsaKe7x3
         lMSA==
X-Gm-Message-State: AOAM533TREvnmNAworCkXNLHWZAPstq3Z++dVBW1OhmEUJOzxKEvCySW
	JGqcxolWUU18Hp+y/by4P3EnKwUfK7HVyta+H0HFtO0oc0s9XA==
X-Google-Smtp-Source: ABdhPJzkpWE8xmPf9OeeT7fllVXFvtGzScaOtRvZmNPsaWQYMNncqr/lsfwIrJBCh6Zm6uGgV/NUCvf0VP9qmr8qMz8=
X-Received: by 2002:a05:651c:1987:: with SMTP id bx7mr367363ljb.128.1644952727738;
 Tue, 15 Feb 2022 11:18:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYtR+E52X-ucmvXYG5-9v0q2UEXQsML=nkQRnSf7TwXYqw@mail.gmail.com>
 <Ygp2wVo8JfWh5iOk@dev-arch.archlinux-ax161> <CAKwvOdmXvC-E_9PSOZVQDDx_UCSadxhF4d9c7qpJPmeFLY_JEA@mail.gmail.com>
In-Reply-To: <CAKwvOdmXvC-E_9PSOZVQDDx_UCSadxhF4d9c7qpJPmeFLY_JEA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 15 Feb 2022 11:18:36 -0800
Message-ID: <CAKwvOdn3fRni0RVbvE-sft9ce0mNrxv+9cDYrhGWVb68SD1k3w@mail.gmail.com>
Subject: Re: arm64: clang-nightly: net/ipv4/tcp_input.c: clang: error: clang
 frontend command failed with exit code 139
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 15, 2022 at 11:10 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Mon, Feb 14, 2022 at 7:35 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > Hi Naresh,
> >
> > On Mon, Feb 14, 2022 at 12:27:17PM +0530, Naresh Kamboju wrote:
> > > On Linux mainline master branch with arm64 clang-nightly build failed
> > > due to following errors and warnings.
> > >
> > > make --silent --keep-going --jobs=8
> > > O=/home/tuxbuild/.cache/tuxmake/builds/current LLVM=1 LLVM_IAS=1
> > > ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
> > > CROSS_COMPILE_COMPAT=arm-linux-gnueabihf- HOSTCC=clang CC=clang
>
> Thanks for the report. Thanks Nathan for submitting reverts.
>
> Naresh, as a heads up, the above command line can be simplified a
> little bit (particularly for newer kernel branches)
>
> LLVM_IAS=1 is implied by LLVM=1 as of v5.15-rc1 via
> commit f12b034afeb3 ("scripts/Makefile.clang: default to LLVM_IAS=1").
>
> CROSS_COMPILE is no longer necessary when building with LLVM=1 as of
> v5.15-rc1 via:
> commit 231ad7f409f1 ("Makefile: infer --target from ARCH for CC=clang")
>
> There is no need for CROSS_COMPILE_COMPAT as of v5.16-rc1 via
> commit 3e6f8d1fa184 ("arm64: vdso32: require CROSS_COMPILE_COMPAT for gcc+bfd")
> when LLVM=1 is set.
>
> HOSTCC and CC are implied by LLVM=1 as of
> commit a0d1c951ef08 ("kbuild: support LLVM=1 to switch the default
> tools to Clang/LLVM")
> v5.7-rc1.
>
> So the above make invocation could be trimmed down to simply:
>
> $ make --silent --keep-going --jobs=8 \
> O=/home/tuxbuild/.cache/tuxmake/builds/current LLVM=1
>
> We might need to discuss further with tuxbuild folks, since I think a
> few of those are set implicitly; I would prefer if they needed to be
> set explicitly in order to properly test them being _unspecified_ in
> our CI.

Filed: https://gitlab.com/Linaro/tuxsuite/-/issues/151

-- 
Thanks,
~Nick Desaulniers
