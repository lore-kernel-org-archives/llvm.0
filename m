Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB24176AC6
	for <llvm@lists.linux.dev>; Mon, 17 Jun 2024 02:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718591948; cv=none; b=HtdJAQMh3wGcL2Hz3vbxQMdNtjhxIfv+ORJRdftDEyXGAPLKp/XjWlbulAXQ6fKsjKZpZTuhve1xxv4swu63OJDMqU4U+PdNd8iurfjIVo0VmLD9obZ7CF+KZebZZ/v+7FOj6a2AR+hz50iAJLPc6MPYmokXnQbJI0p95Q2aOGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718591948; c=relaxed/simple;
	bh=K7pDmm+KuihRdNnBeqcmqK4FUXdjWwv/YZO/vwywIOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UGMIz+z0JzST+AfxKwC3JLVpFS4qTnCHXgYZOS73pHSAh4+E0X2FIbMLPkHqhfJmlpnIyvhmRt+os1TfpD1i771l3stI88dgBl7Z2cqWWC8ALPfWaiYYszjDrzDjToDDmBevA116B3uzBtkFKoMFkyNjk2rGl5hoM7+gsx7U0p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=l3hZV4Vs; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="l3hZV4Vs"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-62a0849f8e5so39413707b3.2
        for <llvm@lists.linux.dev>; Sun, 16 Jun 2024 19:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718591946; x=1719196746; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvWKRG4G4uh/VafRKr+dQcPE/37QW82H6MxcQ22NpJs=;
        b=l3hZV4VsGN7/RmaRTfHWLm90o5Uhdg3orISkvwuQ1WPbfqH239p9BuiqjT2T9TemXd
         H7lxX14p1LdLGiwq9561ZflDEirgFskojJdQfZRQ1nvj1GyVvaF/l+M8nOhAs6I5KwWU
         7A0hO+E0vmeCUrXIhs8toO3SzboUIcC2ThcrZufobmlZrGVnhSniH4nXr7SO8w3ZPOC1
         ziFRm8jdY43w7zJHeaIXUDfTeMaA8rm4GY0fhlLkIs6r2vOK/6tGaP7ClrqZm50eYdUh
         3eZWca4Sh59iII1JXBRsUHhe839zBOBCPCvgXVHK3+zQos9VWuU7wBS48zlChZ8Biz/n
         vk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718591946; x=1719196746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RvWKRG4G4uh/VafRKr+dQcPE/37QW82H6MxcQ22NpJs=;
        b=SUELX+RzFQoRezHh5mr+UpNgc7nytrWyLn8nQsI79oCwOw24PZ+kQCl4Ttx/gFdm8j
         aK8pO+0mo+tP8RunvlDcK1CAiyi6ANASYJ+mxaGBW1axG5tBpxROuftWTaonGKTi5Oif
         AsmCMQNzFuzVa/JZmmpTYVO7aTgM9XbHARvEdPyBoG8g7XCvyBwvAXY6wNfBmtjhkFz3
         s+gY5eOTZoO3AYKbNAhQiG5pPgEr9zkc+HPLoo7X8JZ6cOTFXtEFczffRGiI1YvQZJ8M
         ITj/Vr2Y2QfR0h486spq1/R+EcRno2d9E0T1AekUp4Sztih+a1PF5LtpjDDXZxbGK1pv
         TDcg==
X-Forwarded-Encrypted: i=1; AJvYcCUKhDfdZxqXp1C+3wPDZPsNO3+Zpvz/bFruNN2YTjLd/iZAuNJ6ZEM+IMB42s1/C+jzmC70l9TFu0zJmkFJFv6eIf/aSg==
X-Gm-Message-State: AOJu0Yx+smFHtCA1GrlqYo9DGkyFM/DD975x4UznrG0Zgr/QPy/okTQs
	qL2EaaY+r4dwPZZm+ZMwn+NQo0Gxbv4Jql8hnlMA/9rxeCqlrGA39TPXMQjiR+xnvO2fNuw9btH
	4SNSf9Jm/DVkF2+uFEFf4+SXN8azllfKs10hP+g==
X-Google-Smtp-Source: AGHT+IGx5gyoe+gPzQWT+v+p8579+Wzzy0Rc6gNG/13H/HestUrQLJhhbdrIOQVQ4ELHkFaMdUbQlF19+HnvPT5nnBA=
X-Received: by 2002:a25:b19b:0:b0:dfe:5a00:df5c with SMTP id
 3f1490d57ef6-dff153a6620mr8483209276.18.1718591946340; Sun, 16 Jun 2024
 19:39:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240613-dev-andyc-dyn-ftrace-v4-v1-0-1a538e12c01e@sifive.com>
 <20240613-dev-andyc-dyn-ftrace-v4-v1-4-1a538e12c01e@sifive.com> <20240613190920.GB1272931@thelio-3990X>
In-Reply-To: <20240613190920.GB1272931@thelio-3990X>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 17 Jun 2024 10:38:55 +0800
Message-ID: <CABgGipV_6sFx8TJNrHszGLk=V9X1PJAXuOmRDxnTHPrigqJL0A@mail.gmail.com>
Subject: Re: [PATCH 4/8] riscv: ftrace: align patchable functions to 4 Byte boundary
To: Nathan Chancellor <nathan@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Zong Li <zong.li@sifive.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Evgenii Shatokhin <e.shatokhin@yadro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024 at 3:09=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi Andy,
>
> On Thu, Jun 13, 2024 at 03:11:09PM +0800, Andy Chiu wrote:
> > We are changing ftrace code patching in order to remove dependency from
> > stop_machine() and enable kernel preemption. This requires us to align
> > functions entry at a 4-B align address.
> >
> > However, -falign-functions on older versions of GCC alone was not stron=
g
> > enoungh to align all functions. In fact, cold functions are not aligned
> > after turning on optimizations. We consider this is a bug in GCC and
> > turn off guess-branch-probility as a workaround to align all functions.
> >
> > GCC bug id: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D88345
> >
> > The option -fmin-function-alignment is able to align all functions
> > properly on newer versions of gcc. So, we add a cc-option to test if
> > the toolchain supports it.
> >
> > Suggested-by: Evgenii Shatokhin <e.shatokhin@yadro.com>
> > Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> > ---
> >  arch/riscv/Kconfig  | 1 +
> >  arch/riscv/Makefile | 7 ++++++-
> >  2 files changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index b94176e25be1..80b8d48e1e46 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -203,6 +203,7 @@ config CLANG_SUPPORTS_DYNAMIC_FTRACE
> >  config GCC_SUPPORTS_DYNAMIC_FTRACE
> >       def_bool CC_IS_GCC
> >       depends on $(cc-option,-fpatchable-function-entry=3D8)
> > +     depends on $(cc-option,-fmin-function-alignment=3D4) || !RISCV_IS=
A_C
>
> Please use CC_HAS_MIN_FUNCTION_ALIGNMENT (from arch/Kconfig), which
> already checks for support for this option.

Thanks for the suggestion!

>
> >  config HAVE_SHADOW_CALL_STACK
> >       def_bool $(cc-option,-fsanitize=3Dshadow-call-stack)
> > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > index 06de9d365088..74628ad8dcf8 100644
> > --- a/arch/riscv/Makefile
> > +++ b/arch/riscv/Makefile
> > @@ -14,8 +14,13 @@ endif
> >  ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
> >       LDFLAGS_vmlinux +=3D --no-relax
> >       KBUILD_CPPFLAGS +=3D -DCC_USING_PATCHABLE_FUNCTION_ENTRY
> > +ifeq ($(CONFIG_CC_IS_CLANG),y)
>
> Same here, please invert this and use
>
>   ifdef CONFIG_CC_HAS_MIN_FUNCTION_ALIGNMENT
>
> like the main Makefile does.

Hope this makes sense to you. I am going to add the following in riscv Kcon=
ig:

select FUNCTION_ALIGNMENT_4B if DYNAMIC_FTRACE && !RISCV_ISA_C

So we will not need any of these

>
> > +     cflags_ftrace_align :=3D -falign-functions=3D4
> > +else
> > +     cflags_ftrace_align :=3D -fmin-function-alignment=3D4
> > +endif
> >  ifeq ($(CONFIG_RISCV_ISA_C),y)
> > -     CC_FLAGS_FTRACE :=3D -fpatchable-function-entry=3D4
> > +     CC_FLAGS_FTRACE :=3D -fpatchable-function-entry=3D4 $(cflags_ftra=
ce_align)
> >  else
> >       CC_FLAGS_FTRACE :=3D -fpatchable-function-entry=3D2
> >  endif
> >
> > --
> > 2.43.0
> >
> >

Thanks,
Andy
