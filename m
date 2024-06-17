Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25885176AB2
	for <llvm@lists.linux.dev>; Mon, 17 Jun 2024 03:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718594006; cv=none; b=iX9hp9T/fO2uNOCeEAodmCyNNjg9ycU6fQ6MTWOaLbolDx5oxYMFSGYYSyBm3xHBHO59Z1QWV0YS6ZuUnupGsh9Jq/mWTzNekjJaKWUfffXXddyGTAjn7ZlU5VH6YFjtITi5iX6jftx+hy7sVYhBddUknbaljyLGy+E3SYL18PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718594006; c=relaxed/simple;
	bh=ipKCaT77f+BUWT9EBLkbLtp2pj7mmowaKj2ZBqhLeeM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QBPyJ10ZnohUsCPh7FvJ5KKQEFVgBCFDqCs3sqJ2ZfcwOFNXJsVHwjVS9w+sZyfKJNoCQ3tfHo3XGJl+S5C2tDegTaZi5YutROp4Zs7kwYsMxHaYYlFXnqqXX2Pqo29BYM0vw9/PVE8dSzxDOOdDUVdRbUI8SUmF1ObjraswzPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=Tezeialh; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Tezeialh"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-627e3368394so40595787b3.2
        for <llvm@lists.linux.dev>; Sun, 16 Jun 2024 20:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718594004; x=1719198804; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MTUZ05e6Yum4t2GwgWWjL5msqoEXhl4LpMNkyudXVSA=;
        b=TezeialhbHB5lL8z3RN2N10JNuOJcKzj102N2ZSaerJamEfzMvFZ4QR0IZpjk6jeX6
         JSidltc/A/t19neewc2yv9zwY8HfUbCJQB2HVxIC1Ak8jXaMspF6kv3Zh0b3Ckhr84wT
         73ZhiqlRS/fWoCtDsQOk5mXtYWZJoBVGuVwpkQdZphwk/EjUOZYeDDfw2c1kUydx116j
         yo5g3rulUuxegGgoBC20r8684MkKR1frggmho/M1+BijrUsI2EliYr4ZIMj6pFPJIWXA
         izuL+cNb+T7AEWiz1gh/+dSRWhRtgTCHyj4hAplr9fM4KLGFVD+Jp9xZuBTCxv9/2Gfy
         SdUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718594004; x=1719198804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MTUZ05e6Yum4t2GwgWWjL5msqoEXhl4LpMNkyudXVSA=;
        b=Mp4pM+0ucz/r773W+PxolJAmYXFWwsqLrNASlkkGdX+f++us1QEMpqc4H144m7pxBx
         2iLU6oxTDG6ivsPk5rz444sYA4DPklrBf3pTuSj9/MmxZwoWNPnT4NMYt2alzEvftbnD
         0yKJmnqbwpshMevF+oo+3EiRxlcUkUDkK66AkJwU3wLWAYudle3/2sJxKcqAxI7kBsad
         jBH/7WlqSMcejcNAO1J4AW91hdTBZUTPgmAIp2O0/tlCqVP8ZkeVpIbtrcMLOmToZ3ca
         CN/zhKMrNlfG/uyqKJQdqRNRZskDWrYbm0o+i1HjXC4nw0Y0eeeBSyBRPb+L37vTSDAP
         a+Vw==
X-Forwarded-Encrypted: i=1; AJvYcCXoKGBTgwWqmLk4bGFHvhc6HeFfwdCnzCWjXDb9JeRXRrIb4y+tbMw+Vc7PqDFLb/QhahJMUIVc9hH0sRMjHRx1i5StPA==
X-Gm-Message-State: AOJu0Yza9sz64h/RcaHu5ihcOmE6ZN64UYBnceS7bc5+Vc7ubV9meHRZ
	28pX7SPacQF/5ldkACSHs4AE9uhZY6WnPQVQvm0KbI527aQI3OF7J8dxoe6d2KIziaEGJJy9SDF
	ODwAs/t0uOrQE8Z+rHK0zhMP+BSnwMdCOoBv3Qw==
X-Google-Smtp-Source: AGHT+IGcbuDhr//ejMFGoqLnDmcjq65GRM5Khv3QI8grXciiziqO38Mc6HPFBs3lKXswm9MpPGZCzPb1AOhqda4ES4M=
X-Received: by 2002:a0d:e648:0:b0:627:ecd3:6223 with SMTP id
 00721157ae682-6322480e9e1mr84249517b3.35.1718594004136; Sun, 16 Jun 2024
 20:13:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240613-dev-andyc-dyn-ftrace-v4-v1-0-1a538e12c01e@sifive.com>
 <20240613-dev-andyc-dyn-ftrace-v4-v1-4-1a538e12c01e@sifive.com>
 <20240613190920.GB1272931@thelio-3990X> <CABgGipV_6sFx8TJNrHszGLk=V9X1PJAXuOmRDxnTHPrigqJL0A@mail.gmail.com>
In-Reply-To: <CABgGipV_6sFx8TJNrHszGLk=V9X1PJAXuOmRDxnTHPrigqJL0A@mail.gmail.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 17 Jun 2024 11:13:13 +0800
Message-ID: <CABgGipXqZe5GTNNe0oRBPBaFqRYF7LLZsdhQQ9RSuXqk7+cukA@mail.gmail.com>
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

Sorry for the noise,

On Mon, Jun 17, 2024 at 10:38=E2=80=AFAM Andy Chiu <andy.chiu@sifive.com> w=
rote:
>
> On Fri, Jun 14, 2024 at 3:09=E2=80=AFAM Nathan Chancellor <nathan@kernel.=
org> wrote:
> >
> > Hi Andy,
> >
> > On Thu, Jun 13, 2024 at 03:11:09PM +0800, Andy Chiu wrote:
> > > We are changing ftrace code patching in order to remove dependency fr=
om
> > > stop_machine() and enable kernel preemption. This requires us to alig=
n
> > > functions entry at a 4-B align address.
> > >
> > > However, -falign-functions on older versions of GCC alone was not str=
ong
> > > enoungh to align all functions. In fact, cold functions are not align=
ed
> > > after turning on optimizations. We consider this is a bug in GCC and
> > > turn off guess-branch-probility as a workaround to align all function=
s.
> > >
> > > GCC bug id: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D88345
> > >
> > > The option -fmin-function-alignment is able to align all functions
> > > properly on newer versions of gcc. So, we add a cc-option to test if
> > > the toolchain supports it.
> > >
> > > Suggested-by: Evgenii Shatokhin <e.shatokhin@yadro.com>
> > > Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> > > ---
> > >  arch/riscv/Kconfig  | 1 +
> > >  arch/riscv/Makefile | 7 ++++++-
> > >  2 files changed, 7 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index b94176e25be1..80b8d48e1e46 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -203,6 +203,7 @@ config CLANG_SUPPORTS_DYNAMIC_FTRACE
> > >  config GCC_SUPPORTS_DYNAMIC_FTRACE
> > >       def_bool CC_IS_GCC
> > >       depends on $(cc-option,-fpatchable-function-entry=3D8)
> > > +     depends on $(cc-option,-fmin-function-alignment=3D4) || !RISCV_=
ISA_C
> >
> > Please use CC_HAS_MIN_FUNCTION_ALIGNMENT (from arch/Kconfig), which
> > already checks for support for this option.
>
> Thanks for the suggestion!
>
> >
> > >  config HAVE_SHADOW_CALL_STACK
> > >       def_bool $(cc-option,-fsanitize=3Dshadow-call-stack)
> > > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > > index 06de9d365088..74628ad8dcf8 100644
> > > --- a/arch/riscv/Makefile
> > > +++ b/arch/riscv/Makefile
> > > @@ -14,8 +14,13 @@ endif
> > >  ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
> > >       LDFLAGS_vmlinux +=3D --no-relax
> > >       KBUILD_CPPFLAGS +=3D -DCC_USING_PATCHABLE_FUNCTION_ENTRY
> > > +ifeq ($(CONFIG_CC_IS_CLANG),y)
> >
> > Same here, please invert this and use
> >
> >   ifdef CONFIG_CC_HAS_MIN_FUNCTION_ALIGNMENT
> >
> > like the main Makefile does.
>
> Hope this makes sense to you. I am going to add the following in riscv Kc=
onig:
>
> select FUNCTION_ALIGNMENT_4B if DYNAMIC_FTRACE && !RISCV_ISA_C

This should be:

select FUNCTION_ALIGNMENT_4B if DYNAMIC_FTRACE && RISCV_ISA_C

as RISCV_ISA_C =3D=3D y means that there are 2B instructions. In this
case, functions can be non 4B aligned, so we need to enforce the
alignment requirement from the compiler.

>
> So we will not need any of these
>
> >
> > > +     cflags_ftrace_align :=3D -falign-functions=3D4
> > > +else
> > > +     cflags_ftrace_align :=3D -fmin-function-alignment=3D4
> > > +endif
> > >  ifeq ($(CONFIG_RISCV_ISA_C),y)
> > > -     CC_FLAGS_FTRACE :=3D -fpatchable-function-entry=3D4
> > > +     CC_FLAGS_FTRACE :=3D -fpatchable-function-entry=3D4 $(cflags_ft=
race_align)
> > >  else
> > >       CC_FLAGS_FTRACE :=3D -fpatchable-function-entry=3D2
> > >  endif
> > >
> > > --
> > > 2.43.0
> > >
> > >
>
> Thanks,
> Andy
