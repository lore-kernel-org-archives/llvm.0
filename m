Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8E4328B68
	for <llvm@lists.linux.dev>; Mon, 17 Nov 2025 11:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763380322; cv=none; b=ACPlF86+QcfIgVeIlOknl28EzVBUZk5S53hprC4Jz0ORyZpX3os5t74vIM2THnCbZug2XdOBX7mhPrCfxgT9jB3/d5tY4GYZFjp5kLw5Rd4BHS1sK0NldrXXNCC4YwuanLcBln6I6+pc49qbta6SKI2FzVarugJ6CJEkAtQctJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763380322; c=relaxed/simple;
	bh=JZJT6MjWjzeWGRGxm5Bm2BgS1wz5FOheJhnYlJMQGEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h1466LVWC7zrg78XMH3Q3g2jSf4rPuZNz8nxzLjPqVVLMlswhcpd6VO4C7cce7TYvoJW2qNa9KZ/FxqZtgKvZe5OSbhhCG91Lhx0iG1EUT1PZRSzsRrcFf/rpv47hV+ZGAcIq/LzXeuPlJzVqP3sKm7yjjPp/q+Xo6yJBSfPkws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YmGLOhoR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YmGLOhoR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 592DBC2BC9E
	for <llvm@lists.linux.dev>; Mon, 17 Nov 2025 11:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763380322;
	bh=JZJT6MjWjzeWGRGxm5Bm2BgS1wz5FOheJhnYlJMQGEQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YmGLOhoRWTlTMmla4X1+amAHlukKP9SKQtcgSuIGMkCfYUHB/fqJh1KdfLe1/fs7p
	 fI3CURrAVGQHMjcOAg3nxS/d7z8Z+G+N1NvRK0c+9Kn/vwSRXfFh0O+YjFtQuDefRX
	 CCO8ELFBKzLwiOOnJJAcJ0d5/SK9m6PLWcAdJG42m3j9yjEWpnuT/ZzWnxCxdDsldg
	 kF1ekU0/tkwoFldNhyJmrpZfgWd7UaS8/7PMG/ibY9FFip59E3DogyGQfkWC0XsUYw
	 FzTGYTd7d9SxJfykqR8+codV5+XO7cb2CKhcJisj5tsMnDdLjOp5ddskepinVivyp4
	 numNUQuEgM2Mg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-594516d941cso3810458e87.0
        for <llvm@lists.linux.dev>; Mon, 17 Nov 2025 03:52:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWfZEKqUjCdMcA/IgHNzhJnh0vXX++x3xETHgSoeYXT0n9M2WM3YewZ6UeE0RRQVtg4VZSz@lists.linux.dev
X-Gm-Message-State: AOJu0YwcRn3s1w4HykgBg2go5cctIAZoMk4u51o512Hcl+Ij4NiE1Toh
	jfQteDiHUShVgpZ7PH+qOS2+0sCCISaw494nQq4s9rpJJ/QszRNHtm9hSbVVdrbSnLQ8Nap+Wy0
	0D7KohfLO8mrzmjpRFP9TNO4pCJ905i8=
X-Google-Smtp-Source: AGHT+IFCFyhk8v8Xza9CRydH2V2rbv4h/osL3ujdZ+2eLOF2o1Q4gyMxiRgp3HuFHS1gOXF7JajcAjEed0EVpUV8E2s=
X-Received: by 2002:a05:6512:3c86:b0:592:f3ef:19ad with SMTP id
 2adb3069b0e04-595841e6205mr4027195e87.34.1763380320499; Mon, 17 Nov 2025
 03:52:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251117-b4-sev-gcov-objtool-v1-1-54f7790d54df@google.com> <CAMj1kXH8Yg+eeySUxJ7nRTm=nQWx5Tj4XirBjVrqXB-0Qn1=sA@mail.gmail.com>
In-Reply-To: <CAMj1kXH8Yg+eeySUxJ7nRTm=nQWx5Tj4XirBjVrqXB-0Qn1=sA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 17 Nov 2025 12:51:49 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHiA91hH80tHFCO9QjkkfzEGZ2GJgpHnuKrusKhOULMXA@mail.gmail.com>
X-Gm-Features: AWmQ_bmSFIRVUD4syhWYIt9y31RowVrTSp3-C9Q0ekk7ZgCtcHXi-VRKpB-j_0c
Message-ID: <CAMj1kXHiA91hH80tHFCO9QjkkfzEGZ2GJgpHnuKrusKhOULMXA@mail.gmail.com>
Subject: Re: [PATCH] x86/sev: Disable GCOV on noinstr object
To: Brendan Jackman <jackmanb@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 17 Nov 2025 at 12:40, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Mon, 17 Nov 2025 at 12:11, Brendan Jackman <jackmanb@google.com> wrote=
:
> >
> > With Debian clang version 19.1.7 (3+build5) there are calls to
> > kasan_check_write() from __sev_es_nmi_complete, which violates noinstr.
> > Fix it by disabling GCOV for the noinstr object, as has been done for
> > previous such instrumentation issues.
> >
> > Signed-off-by: Brendan Jackman <jackmanb@google.com>
> > ---
> > Details:
> >
> >  - =E2=9D=AF=E2=9D=AF  clang --version
> >    Debian clang version 19.1.7 (3+build5)
> >    Target: x86_64-pc-linux-gnu
> >    Thread model: posix
> >    InstalledDir: /usr/lib/llvm-19/bin
> >
> >  - Compiling from tip/master at 6f85aad74a70d
> >
> >  - Kernel config:
> >
> >    https://gist.githubusercontent.com/bjackman/bbfdf4ec2e1dfd0e18657174=
f0537e2c/raw/a88dcc6567d14c69445e7928a7d5dfc23ca9f619/gistfile0.txt
> >
> > Note I also get this error:
> >
> > vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x3b: relocation to !END=
BR: machine_kexec_prepare+0x810
> >
> > That one's a total mystery to me. I guess it's better to "fix" the SEV
> > one independently rather than waiting until I know how to fix them both=
.
> > ---
> >  arch/x86/coco/sev/Makefile | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/arch/x86/coco/sev/Makefile b/arch/x86/coco/sev/Makefile
> > index 3b8ae214a6a64de6bb208eb3b7c8bf12007ccc2c..d2ceae587b6c30b2fb17209=
a7426e7893dea988c 100644
> > --- a/arch/x86/coco/sev/Makefile
> > +++ b/arch/x86/coco/sev/Makefile
> > @@ -8,3 +8,6 @@ UBSAN_SANITIZE_noinstr.o        :=3D n
> >  # GCC may fail to respect __no_sanitize_address or __no_kcsan when inl=
ining
> >  KASAN_SANITIZE_noinstr.o       :=3D n
> >  KCSAN_SANITIZE_noinstr.o       :=3D n
> > +
> > +# Clang 19 and older may fail to respect __no_sanitize_address when in=
lining
> > +GCOV_PROFILE_noinstr.o         :=3D n
> >
>
> After Thomas dug into this issue a while ago, I meant to follow up
> with a fix, or at least something to start the discussion.
>
> TL;DR there is nothing wrong with either compiler (as far as this
> issue is concerned)
>
> The issue is that KASAN/KCSAN enabled builds use a version of
> set_bit() that unconditionally inserts a call to

instrument_atomic_write(), which calls the KASAN/KCSAN intrinsics
directly, and these are usually only called by compiler generated
code.

This completely defeats the noinstr per-function annotation, given
that each compilation unit only incorporates a single version of
set_bit(), which is the instrumented version unless instrumentation is
disabled for the entire file.

For the short term, we could avoid this by using arch___set_bit()
directly in the SEV code that triggers this issue today. But for the
longer term, we should get write of those explicit calls to
instrumentation intrinsics, as this is fundamentally incompatible with
per-function overrides.

https://lore.kernel.org/all/8734aqulch.ffs@tglx/T/#u
