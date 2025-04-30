Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BA72609CA
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 15:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746028344; cv=none; b=HEsFGClhIk38gxCUBU8bctUnofSJwEk6QOUf3/17suP0WDJCin4v9cADSIjH2sNp6uxOOO6Mt+GhqeU6dPLx0mIMu59tGkX9BArZDJA2jwfMNXbrpHhbaDqZLjOE7tcabvVQp1o91X1wrouTTCu+6qZCQ4U+seXbAeglDJ5m/tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746028344; c=relaxed/simple;
	bh=WWEGPFSEXsgTebWgjNA2jFYbHRJpo1gsdgBtlCbVGQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RVM51g66ERrpMLblWoij90hTql0nGrgG9ALeP2AqsAeB0wNjDDse+uxkUPQBiOlueSCaxlxIwtUpcrlmqtNtATNl7LczxPjTM2ckeTRSZBz0MnatDUBqU57hooRsJTppGFWJk/28z1CLpdFZKx5WUiOorZD+quxm2ybY6FVhZgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KPaJkYAA; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KPaJkYAA"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso16139a12.1
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 08:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746028341; x=1746633141; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UUgz0lHIM9AvqVgwegmtWsNz7YXlDr9Kk1u0gwL4TQ8=;
        b=KPaJkYAAWTfdWwWeKSoa32dsnqcEVkaMWZcrO25yvDvpaOj0EyXF0yTQenfEQ5l0fp
         dG2FvcMRq0B/Xw/yykG7M+mb+hWCEzDv4JMH57JxMSKIcwC9F/sGEOcH7/o6N5o6CBRK
         25LPUQMbOK3F9n1pmSjT+ejZavLbxj6FpSDwO2A6USzN6v/zkCFqvgJP433u34GIvtb4
         ptDn00wjSzRvQU4gQ4mR4UhtcWaArTTpaG7haRjfEYY2PGBuAUF9gy+ppMotD/ldKhnX
         djRr6txbVpzXnvAcSzwm3l6ZudoOmRbnYmkkQMaM+RZYRecmEiuGj4hX/ywRZrQqVc7f
         +ksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746028341; x=1746633141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UUgz0lHIM9AvqVgwegmtWsNz7YXlDr9Kk1u0gwL4TQ8=;
        b=rpvt1trDJDqCWPeh/zKtcTWQhTe00uETYmjZHFcvE/rNxVck9vopm3JdDKhTWw+8cm
         5i4/9sr6TMghmq3z78reCOqcOuHc55goAomMHV17v8Mll0yGNwdNErl2tO0w5CFtzNb+
         Hw9eydTSSQi06I3C9fjUCxntmyL5WgqVbZfLCqpr4uQ77cUw7+zO1ciYjo5qcBs4uzJp
         z8H3UkKoKatICL6DoCiYrMGXLs4ofQVE32UlORgbyXKmjSIJ+vgbne1iYImCatPgvObZ
         7Rh76G3aqiKyDmOuxwo7sszZjI2U1il7AM9E2bogSIMeM1d+iPhpozAirfw6QPMGdSeZ
         R+ew==
X-Forwarded-Encrypted: i=1; AJvYcCXUqdL/MHxNNH0jVyizX6PkfMOd0Pk7spk7rTubeZfpt/ksh81KbpxVRoE3Q9dbFjTTUYBr@lists.linux.dev
X-Gm-Message-State: AOJu0YzlYf1Hc2Sx2cKYW4NXRXECEH3xIvxhUWfWiAEP4uOe60sUGG3J
	JUmzmCzR0xiOsgVHh2Ycxz9bnUR4ivwJPR61eYOFPYJHAxCY0I6FrPFGjCJ5IP+j0AS1tHikA+K
	z0qv06A3kSaFqAvYdqwrKk9kW4qrkJPWrUnpf
X-Gm-Gg: ASbGncvshhtn6zLugIg4ftd2mkToCbCKnKJATFyytdDgF4mcaNpZOt60LOXiunJMzAQ
	0OrFqbiGDY4WQfM5vgbRzFrxEEoBaeoTEXoaRaJeVX/zlkEfgFb5aa9v5iPcYDDuCSmjOYlcP5B
	ty8io4UHf+Jz7qeGVZicRfILgEnoS/9hKShZFlP05jjz4N7oI3/hKZex2KiiLWWg==
X-Google-Smtp-Source: AGHT+IFdqOHywsMBaHqXkTcGmB67EXqbMC7FqDHfbXZkAyjokug6b3F9yQT+IzlELuucqJyVURMXtid879Fh+aycpm8=
X-Received: by 2002:a05:6402:30b1:b0:5ed:f521:e06c with SMTP id
 4fb4d7f45d1cf-5f8aac01ebdmr113976a12.7.1746028341167; Wed, 30 Apr 2025
 08:52:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250430-rust-kcov-v1-1-b9ae94148175@google.com> <CANp29Y4o8o6gz6GbM6NhP9sJUi94q29=aa+tLc1aCk0UVpgj0w@mail.gmail.com>
In-Reply-To: <CANp29Y4o8o6gz6GbM6NhP9sJUi94q29=aa+tLc1aCk0UVpgj0w@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 30 Apr 2025 08:52:09 -0700
X-Gm-Features: ATxdqUFfWkFt2krZSEThZVrbRM32DbyGd7csCuhOc9hU0LccEz016XDL5xHWJ3s
Message-ID: <CAGSQo01gLXKWLWcrxSytmCB4YmRnGDX++ZizTws0bEjJ1amWtA@mail.gmail.com>
Subject: Re: [PATCH] kcov: rust: add flags for KCOV with Rust
To: Aleksandr Nogikh <nogikh@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 4:55=E2=80=AFAM Aleksandr Nogikh <nogikh@google.com=
> wrote:
>
> On Wed, Apr 30, 2025 at 10:04=E2=80=AFAM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >
> > Rust code is currently not instrumented properly when KCOV is enabled.
> > Thus, add the relevant flags to perform instrumentation correctly. This
> > is necessary for efficient fuzzing of Rust code.
> >
> > The sanitizer-coverage features of LLVM have existed for long enough
> > that they are available on any LLVM version supported by rustc, so we d=
o
> > not need any Kconfig feature detection.
> >
> > The coverage level is set to 3, as that is the level needed by trace-pc=
.
> >
> > Co-developed-by: Matthew Maurer <mmaurer@google.com>
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>
> Thanks!
>
> I've run syzkaller against a kernel built with the patch applied and
> the tool was able to successfully obtain coverage feedback from the
> Rust code, so
> Tested-by: Aleksandr Nogikh <nogikh@google.com>
>
> As a side note, in the resulting code coverage I also see a lot of PCs
> from rustlib, which isn't the primary target when fuzzing the kernel.
> Do you find it reasonable not to instrument rustlib with coverage
> callbacks? For C code, there do exist some exceptions for KCOV, see
> e.g. lib/Makefile.

I think filtering out `core.o` and `compiler_builtins.o` would make
sense, as those are not kernel-originals. Filtering `pin_init.o`
probably makes sense too.

`kernel.o` I think we should probably keep at least for now, because
it's kernel-created source that we'd still like proved out. In a
theoretical world where Rust has become more normalized in a decade,
we could filter it out to refocus fuzzers on driver code rather than
bindings, but right now the bindings themselves are worth fuzzing IMO.

>
> > ---
> >  scripts/Makefile.kcov | 6 ++++++
> >  scripts/Makefile.lib  | 3 +++
> >  2 files changed, 9 insertions(+)
> >
> > diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
> > index 67e8cfe3474b7dcf7552e675cffe356788e6c3a2..ddcc3c6dc513e1988aeaf07=
b8efa106e8dffa640 100644
> > --- a/scripts/Makefile.kcov
> > +++ b/scripts/Makefile.kcov
> > @@ -3,4 +3,10 @@ kcov-flags-$(CONFIG_CC_HAS_SANCOV_TRACE_PC)    +=3D -f=
sanitize-coverage=3Dtrace-pc
> >  kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)   +=3D -fsanitize-coverag=
e=3Dtrace-cmp
> >  kcov-flags-$(CONFIG_GCC_PLUGIN_SANCOV)         +=3D -fplugin=3D$(objtr=
ee)/scripts/gcc-plugins/sancov_plugin.so
> >
> > +kcov-rflags-y                                  +=3D -Cpasses=3Dsancov-=
module
> > +kcov-rflags-y                                  +=3D -Cllvm-args=3D-san=
itizer-coverage-level=3D3
> > +kcov-rflags-y                                  +=3D -Cllvm-args=3D-san=
itizer-coverage-trace-pc
> > +kcov-rflags-$(CONFIG_KCOV_ENABLE_COMPARISONS)  +=3D -Cllvm-args=3D-san=
itizer-coverage-trace-compares
> > +
> >  export CFLAGS_KCOV :=3D $(kcov-flags-y)
> > +export RUSTFLAGS_KCOV :=3D $(kcov-rflags-y)
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index 2fe73cda0bddb9dcf709d0a9ae541318d54754d2..520905f19a9b19631394cfb=
5e129effb8846d5b8 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -169,6 +169,9 @@ ifeq ($(CONFIG_KCOV),y)
> >  _c_flags +=3D $(if $(patsubst n%,, \
> >         $(KCOV_INSTRUMENT_$(target-stem).o)$(KCOV_INSTRUMENT)$(if $(is-=
kernel-object),$(CONFIG_KCOV_INSTRUMENT_ALL))), \
> >         $(CFLAGS_KCOV))
> > +_rust_flags +=3D $(if $(patsubst n%,, \
> > +       $(KCOV_INSTRUMENT_$(target-stem).o)$(KCOV_INSTRUMENT)$(if $(is-=
kernel-object),$(CONFIG_KCOV_INSTRUMENT_ALL))), \
> > +       $(RUSTFLAGS_KCOV))
> >  endif
> >
> >  #
> >
> > ---
> > base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
> > change-id: 20250430-rust-kcov-6c74fd0f1f06
> >
> > Best regards,
> > --
> > Alice Ryhl <aliceryhl@google.com>
> >
