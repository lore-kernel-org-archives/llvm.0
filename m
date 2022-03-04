Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67514A4D
	for <llvm@lists.linux.dev>; Fri,  4 Mar 2022 11:43:31 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id k7so6315086ilo.8
        for <llvm@lists.linux.dev>; Fri, 04 Mar 2022 03:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=4smpWMe7kSNBH0mRyoIMNTCTp8csrNBkurRrsmlpIPo=;
        b=Ur9aq7eu3Eytryp1K22lJVyJFJLao0GT/R+/PN3J6sz5zlBiBu4s+f/HQFxo2H8Nm9
         GP3Ros3dd5himrsMXzLzfpEiM9v8ea7hJpqgd6jOifMxgyXR/cpGRJCCY/OBlFApGf3A
         RtfR0KBU/MgazXjpTwjeae0OQsTp3lUMJQgl27/xGVRRouUKBQxgb/Vfoe+BzyFyC3AK
         /TlzntsQrj8hu0bsunpO1u2Q1NzK5ZUJEvuWr2NLFoGtiy9jwes569YIRxx+ZRLOZzcY
         4Hxjl8pqBoOWxnLimr6+kOSjSGaQjskL7h1ahZxjTy+zFX1iNwqxmQHPz2XhtX7Gw/+/
         dgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=4smpWMe7kSNBH0mRyoIMNTCTp8csrNBkurRrsmlpIPo=;
        b=LZR7SS9sGxTshtYWXTomNcsoweMRlqxkfJfPRlghmGcce5z6c9Kaoe3rUKgdNGnILG
         0nJ7UGkHXmjKItJ/Rg/18C4ZC/ytuuUfr5I9jW1PH5Lb/gpbAu9kPm+3o6zKJ9Ac+V7v
         ttZktCAA6zGVrTr1JLVHHDcm9U9vtP/Tjs/1HK6P6/PUdxu0nKW5phxZnX6Fxlq7tIdE
         ZW0j7p8ymgq9jF3AsV1KaaCMsWF7vQzKmIezI3nGOvLIfpFhLruAEQdP7lYZDaX8JJ7N
         8T/45LkicvRzSoNnbhjoq7eZS/uiQQdhiyz/HpjcA91BGUu5dQ1y0ItP7eFxCwky1fqQ
         de7w==
X-Gm-Message-State: AOAM532MLzsCFJrHDHM7cz7zVKZsphfQLuPOLCT1r6hEYL35I0hrRSLi
	jLnl+po656lEjs7Da2bWatgmZ7yZpPGasf6DeC4=
X-Google-Smtp-Source: ABdhPJyBKRfl8PIOw+S6NEi0bCOL4PLN6OdToYMyK9eSpcrGOMTwep1WROvcrBL/LJenmf9yUE7+X4L3oo43anfTfUs=
X-Received: by 2002:a05:6e02:164f:b0:2c6:1b85:b985 with SMTP id
 v15-20020a056e02164f00b002c61b85b985mr955047ilu.4.1646394210485; Fri, 04 Mar
 2022 03:43:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220303090643.241747-1-davidgow@google.com> <YiD7R2wRxoWxtVq7@dev-arch.thelio-3990X>
 <202203030947.E2FA3D9@keescook> <YiEISsoS/XrbEtbm@thelio-3990X> <CAKwvOdkA1c3U6+-6hB3Nj9m2Z8eYzsFWm5X4se2eq_cF3NB2jA@mail.gmail.com>
In-Reply-To: <CAKwvOdkA1c3U6+-6hB3Nj9m2Z8eYzsFWm5X4se2eq_cF3NB2jA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Fri, 4 Mar 2022 12:42:54 +0100
Message-ID: <CA+icZUXf9m13GrqvCLkDRsnQt0X2VQ=yVrJRYz=6fhCJXR4-Xg@mail.gmail.com>
Subject: Re: [PATCH] um: clang: Strip out -mno-global-merge from USER_CFLAGS
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Kees Cook <keescook@chromium.org>, 
	David Gow <davidgow@google.com>, Jeff Dike <jdike@addtoit.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-um@lists.infradead.org, 
	linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 3, 2022 at 9:43 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> On Thu, Mar 3, 2022 at 10:26 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Thu, Mar 03, 2022 at 10:04:28AM -0800, Kees Cook wrote:
> > > How does -mno-global-merge get KBUILD_CFLAGS in the first place? If it's
> > > arm/arm64 only, shouldn't that get relocated to those architectures?
> > >
> > > *time travel* found it:
> > >
> > > 61163efae020 ("kbuild: LLVMLinux: Add Kbuild support for building kernel with Clang")
> > >
> > > So I think this may have been universally true long ago, and now only
> > > arm/arm64 need it?
>
> Looks like that's the case from LLVM sources.
>
> <snip>
>
> > > diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> > > index a2391b8de5a5..dcab28c44c26 100644
> > > --- a/arch/arm/Makefile
> > > +++ b/arch/arm/Makefile
> > > @@ -48,6 +48,13 @@ CHECKFLAGS += -D__ARMEL__
> > >  KBUILD_LDFLAGS       += -EL
> > >  endif
> > >
> > > +ifdef CONFIG_CC_IS_CLANG
> > > +# CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the
> > > +# source of a reference will be _MergedGlobals and not on of the whitelisted names.
>
> I think there's a typo in the original comment.
> s/on of/one of/ ?
>
> Also, I'm not sure what's meant by _MergedGlobals. Perhaps this is an
> opportunity to make this clearer?
>
> "Clang's "global-merge" pass (implemented only for arm and aarch64)
> may break modpost Pattern 2 if symbols are renamed and thus don't
> appear on modpost's allowlist.
>
> > > +# See modpost pattern 2
> > > +KBUILD_CFLAGS        += -mno-global-merge
> > > +endif
> > > +
>

I can remember on x86-64 I was able to build and boot by dropping it entirely.

- Sedat -

>
>
> --
> Thanks,
> ~Nick Desaulniers
