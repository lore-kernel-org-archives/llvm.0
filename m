Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82696371069
	for <llvm@lists.linux.dev>; Fri, 27 Mar 2026 22:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774650573; cv=pass; b=LaH2ktGxBaojdbAgA3aAfqHU5XZBOfuKVCXr6ntDM0R5JQUBVJKyOWDAkzm+Egmr2xJpR36HKUb4Tc6jXtU71vGXC9qrL5Zcx5QGCdi13/xVDejLHZTpxQp2rsT3ADXUGmEosnYpmhA0kZTcwNibPvihDYhvsKyK1cRCO0xyTUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774650573; c=relaxed/simple;
	bh=+zK/IjuErEG0mSVkQ2Ixds0Bt/74frZ/HefXmED2JbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XKCHYIansXfCevv8xDDc1DidPa8IgCjooqCseIA/t/B2Ir8iuK5+MLy8hzsjNdrQhCZRHBYBlPZFvB6g5nZdNO0a0eUDW/ZDTH07AI0eF0vEMfWa3kaxAYsloSqXjfhSIW3vrYlEJA5V1+SELAquioiqnEf2Qstmtih25GOzsTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JbtnbIvp; arc=pass smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JbtnbIvp"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-60328aa10efso782394137.1
        for <llvm@lists.linux.dev>; Fri, 27 Mar 2026 15:29:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774650569; cv=none;
        d=google.com; s=arc-20240605;
        b=dOxHiRU0W584npP9Ur0nwkzRGoYFq/BNhd54xVVTd0dBSz6dND48WzO2wzQjt4KJZt
         1cHlMWLeY6OnM3SceDC1lifpGP2zFObKgySihDWeSkjZ5XRemy0tEuwZ4tTse3zRA0K0
         g4UKCiYDYv3sjy9shBM8nTHglbrxwEFka1u0FgsuI1dslgIhYcgLiEicsWmeOalJIvks
         9OySrynLKG1sNiaV0veRw65wzFX77SZBIBFd1PxJRfwJxXvubleqOpw6i3QcuwHzx0U/
         wNErFNukNcpXsIkf5he42HUpKOF32rozta6ObmLHD6obUiEtGnrCSzj+GyJt7ALbLVVB
         XKgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7DmvSXyuF97zXrdEx+TZcwBI74PTPGa+q4rDT1NiLTo=;
        fh=5J9b9vaGSSlAvdJm5/0eZeiZSTvpsO7rYzWt+q+KUWM=;
        b=gjf+QNkQexYdDassvWjTN13axZyUEzL3rdQFfGkukQXJ1tOfCV6OHt6VLwDEhZrxY6
         /m7CDuwsUTYpk6HuRWq2lQA7LHEOk9fqigMJpYVQ4Ax0guoaIhxPY4K9bT2AnFhDkk2Z
         LyejW7ozqjJZtdvbMRnZvJKbrPWzXHU9P1IBexsPwH2MCcSzoEI+2h/q+jZ89Pic3Lmp
         xuC74lVbLMz2s4ZbLZ2C65AN+VWvf1xik0BU3B7u+b8GptRuKp3qEObY8vSo2fYOjqbf
         gIKuG2/l0AO3l141b2bSVLqcb1YKK1JCDQ20U/SQehUfGl9QPFhkPLD/syDv6L/byQs8
         WfSg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774650569; x=1775255369; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7DmvSXyuF97zXrdEx+TZcwBI74PTPGa+q4rDT1NiLTo=;
        b=JbtnbIvpHWdNa6PKXgbuXL0DuBS+Ti8RC6kxLOJvHHK1plwvQLzt+n3fCL4J5JvHVS
         qs8pgXjJtOOp3ipngl26ViD6PU3+JE4HQP5tdEJpawjbP+PyCckqNGe2Lm7vmy+kkdwp
         oTQqkuHCJa6D6s9fn+IT7nYkEEA8IrdZ8wbBx5g5WpdNQwADi5ZL/f6lhr1LGWdbIEzl
         Dq0PWYHm2KTYWGY4z9HB+9MihUzkr3//vQ3HfGRLCpqrJabatZt/rYJRFu03gHu4/F6j
         XLQHanB/AyOsDjEUi9qOwavO3RzfyYSoK+ESySgFcSTY6Q6taImur6cTmO/Fizplf7uW
         061w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774650569; x=1775255369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7DmvSXyuF97zXrdEx+TZcwBI74PTPGa+q4rDT1NiLTo=;
        b=BmBShhfeaZAF5Qgh6Fu8CIc93Oau1trPkFw2+rReu1UyCi9y8cijAE2scMcxh/GijK
         aETtkUjRtg2elOEzYngp5ZensvYcbaQ6abcF8/Mu1cfKcvkF7YQLV/GQbcSa3gtvY4ED
         uStm3YrOqgTIR3HASslnN2p8gPHPIQDaEdF2NS7YHP7Tq3S3i2gbKtnLaVUKMa9oSW3/
         0uLwcQytGqqSCjojbkDQviHTz6DitApjbl1GrtfDbax4xfn7gZ/chaKTamhVd35u9pUo
         fctONfk9hHJlalsSu0No604pTr1Cy7cNVPHtpyPsNpF+SbZJzx/+cYH3Sr/gE1sZN3x9
         h/KA==
X-Forwarded-Encrypted: i=1; AJvYcCWptNwg09KfAVAYw9l5qu4K7nBpiVi+6oBijfs7bq0Jq/L8ArUZxNe5XFb1RcG1jwxkZJqs@lists.linux.dev
X-Gm-Message-State: AOJu0YyG9QS2Tdu/Em5mDuqZgZvmLPl/v0D+Zul6Znp/mqrstiROT7og
	+Wmda1Iyxltz6MualPYuqh5snD7kZcWY/ERKB5jLg8McvgbeFA0DOdhJpIwmiREbDRXiTfRpVg9
	zjAfiswLzIBgLylizLbWWhKnPC9qCTWWdo7mxhcrF
X-Gm-Gg: ATEYQzzYSpYP62yjzyT26cc/wJ+X1OswCoLqc0Do5brNmYHz9nz+sa+CBJi4f6VIXBe
	1gxeoNqszHmYPXaZwarKrPS7lBQ5OfgSyPEVI4oHt2vN55jSpJAlOEt8jwv7qPvcHC0nl4ij5YJ
	gLI8OdubJ7vBuRm7KvoyuqhyKsQb8ZlxNvENhoR+FVQAcCVp+7/nRhVfVuc0G6h/ruUK7NeTGhJ
	2P5L7rOBkr1mYPUz2YmbCwUbighYLnlx5uBUbWdd6M5Df4ezTTLfdM7gFhDQSkqwtM2iJfVf5c1
	LYRuXhr4djzxmaBsKA==
X-Received: by 2002:a05:6102:6047:b0:5ff:2569:cfe7 with SMTP id
 ada2fe7eead31-604f9082af7mr1815817137.10.1774650569160; Fri, 27 Mar 2026
 15:29:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260327-kbuild-show-inlining-v1-1-730ac2cae571@google.com> <20260327221837.GA3622500@ax162>
In-Reply-To: <20260327221837.GA3622500@ax162>
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 27 Mar 2026 15:29:18 -0700
X-Gm-Features: AQROBzDBMJYR007qSz1FH4Yl2MRm5BJFykXdmb0qHAOvrPorltKgcSvxgsAtd-0
Message-ID: <CAFhGd8pWwbjjLt=FSaDtFysqRU5k_YozDgBFMJBN4YmnAEaktw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add -fdiagnostics-show-inlining-chain for FORTIFY_SOURCE
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Kees Cook <kees@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 27, 2026 at 3:18=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Fri, Mar 27, 2026 at 02:59:20PM -0700, Justin Stitt wrote:
> > Clang recently added -fdiagnostics-show-inlining-chain [1] to improve
> > the visibility of inlining chains in diagnostics. This is particularly
> > useful for CONFIG_FORTIFY_SOURCE where detections can happen deep in
> > inlined functions.
> >
> > Add this flag to KBUILD_CFLAGS when CONFIG_FORTIFY_SOURCE is enabled
> > and the compiler supports it.
> >
> > Link: https://github.com/llvm/llvm-project/pull/174892 [1]
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1571
> > Signed-off-by: Justin Stitt <justinstitt@google.com>
> > ---
> >  Makefile | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Makefile b/Makefile
> > index e1279c4d5b24..978726aeb1ef 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -973,6 +973,12 @@ KBUILD_CFLAGS    +=3D $(call cc-option, -fno-stack=
-clash-protection)
> >  # Get details on warnings generated due to GCC value tracking.
> >  KBUILD_CFLAGS        +=3D $(call cc-option, -fdiagnostics-show-context=
=3D2)
> >
> > +# Show inlining chain notes for FORTIFY_SOURCE-related diagnostics.
> > +# GCC does this by default while Clang 23+ supports a flag.
> > +ifdef CONFIG_FORTIFY_SOURCE
>
> While this is indeed particularly useful for CONFIG_FORTIFY_SOURCE, this
> impacts the warning and error attributes, which can be used anywhere
> (see __bad_copy_from() for example). Is this being wrapped due to the
> potential compile time impact? Can we use something like hyperfine to
> quantify it and see if the impact is worth the trade off of always
> having it enabled for friendlier diagnostics?

The compile time impact is not measurable (within expected noise). The
peak memory usage may increase by somewhere in the 0.5% to 1.5% range
depending on build configuration.

I bundled this under fortify to limit initial impact as its had
virtually no real-world testing and may produce unhelpful diagnostic
notes under its heuristic mode. I don't expect folks to use `-g1` in
the kernel (which would enable full-proof diagnostic notes).

> If not, maybe worth adding a Kconfig option that is force selected by FOR=
TIFY_SOURCE with
> clang or can be optionally enabled by a user?

I'll defer to you on this one. We could add
CONFIG_SHOW_INLINING_CHAIN_NOTES or something similar?

>
> > +KBUILD_CFLAGS        +=3D $(call cc-option, -fdiagnostics-show-inlinin=
g-chain)
> > +endif
> > +
> >  # Clear used registers at func exit (to reduce data lifetime and ROP g=
adgets).
> >  ifdef CONFIG_ZERO_CALL_USED_REGS
> >  KBUILD_CFLAGS        +=3D -fzero-call-used-regs=3Dused-gpr
> >
> > ---
> > base-commit: 7df48e36313029e4c0907b2023905dd7213fd678
> > change-id: 20260327-kbuild-show-inlining-557d31d2293a
> >
> > Best regards,
> > --
> > Justin Stitt <justinstitt@google.com>
> >

Justin
