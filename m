Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E422630FA6
	for <llvm@lists.linux.dev>; Fri,  8 Sep 2023 23:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 793D3C433C7
	for <llvm@lists.linux.dev>; Fri,  8 Sep 2023 23:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694214658;
	bh=f+inhm0X+wSIsbS7nGkQlD4ziqDqwkrezqRi8joSHLc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qlJ/EojXbzqZjFi+HZY9uVC39b8rjhVxZAH8ldpry0BCboXtBwSlcY+7Aw+M6cpDZ
	 7KZ9jjejq04va6b+dakqIxyJnqeICXk/A9Kpti4xc9FcsBQZWYV1bDcJSm/qP3HUM5
	 7yCo91vB0XpkV2qfrXgAGhXoVHK9tdTsg8ZXs27jGSqrCDy2IOTZTgfsQrcnonGM0r
	 dVS07BIllfYf5G8TOMDAeMW5yx0lrdxyZ7gKGhQTg4HdQwkdG8e4J1X5pGwB5BM0M9
	 5xcZTYO8yXfNesPBURDSi9HyCDHOg6nEbtowGfQO7WdHd72ADnOJwezWIur9cJy4qs
	 9yIQqLhY+YYGQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5029e4bfa22so1715188e87.3
        for <llvm@lists.linux.dev>; Fri, 08 Sep 2023 16:10:58 -0700 (PDT)
X-Gm-Message-State: AOJu0YyoEhi4PP1ZUNMUpbi8FLAW6gn2WAgD0wLHY2nhhcBiqP8MqywW
	ohc/MCZvHj+yv6LT8Glt1xDEK53B2CqnyM0k/Js=
X-Google-Smtp-Source: AGHT+IFAHSeut3CZTN1maFrthLyJK3L37GkdrjNTQk98ZKwPoYw8ayKHxL/mm5gYph+nAmphdU3ADPjaat9Ut2fB0oQ=
X-Received: by 2002:ac2:4c94:0:b0:500:94c5:6e06 with SMTP id
 d20-20020ac24c94000000b0050094c56e06mr2520205lfl.56.1694214656726; Fri, 08
 Sep 2023 16:10:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230908225353.984169-1-song@kernel.org> <ZPunWKU/TlrN9xiH@google.com>
In-Reply-To: <ZPunWKU/TlrN9xiH@google.com>
From: Song Liu <song@kernel.org>
Date: Fri, 8 Sep 2023 16:10:44 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5ZovvWG=KyDR80tEDbKda0=sGsVoKzLJDfBz1n4A7BPg@mail.gmail.com>
Message-ID: <CAPhsuW5ZovvWG=KyDR80tEDbKda0=sGsVoKzLJDfBz1n4A7BPg@mail.gmail.com>
Subject: Re: [PATCH] x86/purgatory: Remove LTO flags
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-kernel@vger.kernel.org, songliubraving@fb.com, 
	Ricardo Ribalda <ribalda@chromium.org>, kexec@lists.infradead.org, x86@kernel.org, 
	samitolvanen@google.com, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 8, 2023 at 3:59=E2=80=AFPM Nick Desaulniers <ndesaulniers@googl=
e.com> wrote:
>
> On Fri, Sep 08, 2023 at 03:53:53PM -0700, Song Liu wrote:
> > With LTO enabled, ld.lld generates multiple .text sections for
> > purgatory.ro:
> >
> > $ readelf -S purgatory.ro  | grep " .text"
> >   [ 1] .text             PROGBITS         0000000000000000  00000040
> >   [ 7] .text.purgatory   PROGBITS         0000000000000000  000020e0
> >   [ 9] .text.warn        PROGBITS         0000000000000000  000021c0
> >   [13] .text.sha256_upda PROGBITS         0000000000000000  000022f0
> >   [15] .text.sha224_upda PROGBITS         0000000000000000  00002be0
> >   [17] .text.sha256_fina PROGBITS         0000000000000000  00002bf0
> >   [19] .text.sha224_fina PROGBITS         0000000000000000  00002cc0
> >
> > This cause WARNING from kexec_purgatory_setup_sechdrs():
> >
> > WARNING: CPU: 26 PID: 110894 at kernel/kexec_file.c:919
> > kexec_load_purgatory+0x37f/0x390
> >
> > Fix this by disabling LTO for purgatory.
> >
> > Fixes: 8652d44f466a ("kexec: support purgatories with .text.hot section=
s")
> > Cc: Ricardo Ribalda <ribalda@chromium.org>
> > Cc: kexec@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: x86@kernel.org
> > Signed-off-by: Song Liu <song@kernel.org>
> >
> > ---
> > AFAICT, x86 is the only arch that supports LTO and purgatory.
> > ---
> >  arch/x86/purgatory/Makefile | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/x86/purgatory/Makefile b/arch/x86/purgatory/Makefile
> > index c2a29be35c01..9c0bff4992ea 100644
> > --- a/arch/x86/purgatory/Makefile
> > +++ b/arch/x86/purgatory/Makefile
> > @@ -19,6 +19,10 @@ CFLAGS_sha256.o :=3D -D__DISABLE_EXPORTS -D__NO_FORT=
IFY
> >  # optimization flags.
> >  KBUILD_CFLAGS :=3D $(filter-out -fprofile-sample-use=3D% -fprofile-use=
=3D%,$(KBUILD_CFLAGS))
> >
> > +# When LTO is enabled, llvm emits many text sections, which is not sup=
ported
> > +# by kexec. Remove -flto=3D* flags.
> > +KBUILD_CFLAGS :=3D $(filter-out -flto=3D%,$(KBUILD_CFLAGS))
>
> Thanks for the patch!
>
> Please prefer something akin to:
> commit 6e20f18579c5 ("efi/libstub: disable LTO")

Thanks for the pointer! This does look better.

Thanks,
Song

>
> Please also CC Sami and llvm@lists.linux.dev for v2.
>
> Pretty sure we use a linker script to rejoin .text.* elsewhere in the
> kernel, but it doesn't look like x86 purgatory has one.
>
> > +
> >  # When linking purgatory.ro with -r unresolved symbols are not checked=
,
> >  # also link a purgatory.chk binary without -r to check for unresolved =
symbols.
> >  PURGATORY_LDFLAGS :=3D -e purgatory_start -z nodefaultlib
> > --
> > 2.34.1
> >
