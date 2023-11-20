Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD8F358A4
	for <llvm@lists.linux.dev>; Mon, 20 Nov 2023 19:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I4B2DDcQ"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-507a0907896so6743484e87.2
        for <llvm@lists.linux.dev>; Mon, 20 Nov 2023 11:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700509623; x=1701114423; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k63y0ImIMzxwhoXgElC40ZBYzHWgYpN897FOa0LAhXo=;
        b=I4B2DDcQF1J6qad63/fA4xYb5dnBDSewLpC6Lu0UHgIOt+PEwCwGHdsP+r8ReHaTh0
         vj7HAy6uacAoJ3rLFApYcdsKWnC3uSkjtR1jlSuXgS8yY6l2L1QopWcJGQcR8U4keHBz
         pGLN65sWdotP/KK3CqJU2mU07j2a/wS7D6DVBl1g2n3Lsh84TEO0sbMJTlIAr/opoQhi
         0Nz/GrLAxRl//97kquOkUIM9JlwCZ0OxVDu0Coq8kQb2E4DioTVlR+kLDKO/zbF152ws
         UJGDPJcyNv0nbxgBxEEqVwki4xjkN0J8q+UHh5IZSc6F00N0jtqZjibjfsT3c9JS4o7N
         16fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700509623; x=1701114423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k63y0ImIMzxwhoXgElC40ZBYzHWgYpN897FOa0LAhXo=;
        b=B2n78YNm31IFf14uVd/Kp5FbQqa0oOb5zGQvHobCpicRf9j6vc244p9GWd6A4fqvCl
         2lUvwXQmIAu50lokWh1i1qfpvHZmrLjtilOvY+mvWxGPbjoLUH52+en7PHSrK/I+q0/t
         A9d/zBb4tPUTQndgbv7hTV5Zah9EkUON1uGJVNuzXzdS2KdAWTdZBcocAGN4GDM24LmE
         1npJLxONRxc1XEaNowrpQuCeuSarEBoneDwb9tVct//MwFX4SbGt2O+qyIbJX6cZzJWa
         8JDEXPhzjqk/nS/sQij5Sj7idom7169PkuwENm7EBpY6cWv0LzESeiHbEtkHxJnd8Iu7
         wcVQ==
X-Gm-Message-State: AOJu0YxZVJ/N+40uAnRO+SUKKovMsgOgV2CtmzKpqZyl/0W6/q4cZNy0
	NC4yuVaDxpQXalXfA0vdmfcgaeCK0/jec4biiXTOnw==
X-Google-Smtp-Source: AGHT+IFcP9Bi77QpumgXWYcYlyZBFp9cVOTTuzfplw5aXvIURHzOjITODIQ80+1AZypInFxLgyl/s1nd/Te+pEN9yGs=
X-Received: by 2002:a2e:9912:0:b0:2c5:3a9:7467 with SMTP id
 v18-20020a2e9912000000b002c503a97467mr5808973lji.8.1700509622610; Mon, 20 Nov
 2023 11:47:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231117-maintainers-v1-1-85f2a7422ed9@google.com>
In-Reply-To: <20231117-maintainers-v1-1-85f2a7422ed9@google.com>
From: Justin Stitt <justinstitt@google.com>
Date: Mon, 20 Nov 2023 11:46:49 -0800
Message-ID: <CAFhGd8qLEoJGuur8KVO8=ijUF_O_XgcaABwTp+aZ2W6bxmfy5Q@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: refresh LLVM support
To: ndesaulniers@google.com
Cc: Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Tom Rix <trix@redhat.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2023 at 11:24=E2=80=AFAM <ndesaulniers@google.com> wrote:
>
> As discussed at the ClangBuiltLinux '23 meetup (co-located with Linux Plu=
mbers
> Conf '23), I'll be taking a step back from kernel work to focus on my gro=
wing
> family and helping Google figure out its libc story. So I think it's time=
 to
> formally hand over the reigns to my co-maintainer Nathan.
>
> As such, remove myself from reviewer for:
> - CLANG CONTROL FLOW INTEGRITY SUPPORT
> - COMPILER ATTRIBUTES
> - KERNEL BUILD
>
> For CLANG/LLVM BUILD SUPPORT I'm bumping myself down from maintainer to
> reviewer, adding Bill and Justin, and removing Tom (Tom and I confirmed t=
his
> via private email; thanks for the work done Tom, ++beers_owed).
>
> It has been my pleasure to work with everyone to improve the toolchain
> portability of the Linux kernel, and to help bring LLVM to the table as a
> competitor. The work here is not done.  I have a few last LLVM patches in=
 the
> works to improve stack usage of clang which has been our longest standing=
 open
> issue (getting "rm" inline asm constraints to DTRT is part of that). But
> looking back I'm incredibly proud of where we are to today relative to wh=
ere we
> were when we started the ClangBuiltLinux journey, and am confident that t=
he
> team and processes we have put in place will continue to be successful. I
> continue to believe that a rising tide will lift all boats.
>
> I identify first and foremost as a Linux kernel developer, and an LLVM de=
v
> second. May it be a cold day in hell when that changes.
>
> Wake me when you need me.
>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  MAINTAINERS | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 482d428472e7..1e6692697167 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5076,7 +5076,6 @@ CLANG CONTROL FLOW INTEGRITY SUPPORT
>  M:     Sami Tolvanen <samitolvanen@google.com>
>  M:     Kees Cook <keescook@chromium.org>
>  R:     Nathan Chancellor <nathan@kernel.org>
> -R:     Nick Desaulniers <ndesaulniers@google.com>
>  L:     llvm@lists.linux.dev
>  S:     Supported
>  B:     https://github.com/ClangBuiltLinux/linux/issues
> @@ -5091,8 +5090,9 @@ F:        .clang-format
>
>  CLANG/LLVM BUILD SUPPORT
>  M:     Nathan Chancellor <nathan@kernel.org>
> -M:     Nick Desaulniers <ndesaulniers@google.com>
> -R:     Tom Rix <trix@redhat.com>
> +R:     Nick Desaulniers <ndesaulniers@google.com>
> +R:     Bill Wendling <morbo@google.com>
> +R:     Justin Stitt <justinstitt@google.com>
>  L:     llvm@lists.linux.dev
>  S:     Supported
>  W:     https://clangbuiltlinux.github.io/
> @@ -5242,7 +5242,6 @@ F:        drivers/platform/x86/compal-laptop.c
>
>  COMPILER ATTRIBUTES
>  M:     Miguel Ojeda <ojeda@kernel.org>
> -R:     Nick Desaulniers <ndesaulniers@google.com>
>  S:     Maintained
>  F:     include/linux/compiler_attributes.h
>
> @@ -11516,7 +11515,6 @@ F:      fs/autofs/
>  KERNEL BUILD + files below scripts/ (unless maintained elsewhere)
>  M:     Masahiro Yamada <masahiroy@kernel.org>
>  R:     Nathan Chancellor <nathan@kernel.org>
> -R:     Nick Desaulniers <ndesaulniers@google.com>
>  R:     Nicolas Schier <nicolas@fjasle.eu>
>  L:     linux-kbuild@vger.kernel.org
>  S:     Maintained
>
> ---
> base-commit: 6bc40e44f1ddef16a787f3501b97f1fff909177c
> change-id: 20231117-maintainers-88eac4c024a1
>
> Best regards,
> --
> Nick Desaulniers <ndesaulniers@google.com>
>

Thanks for all the hard work Nick! The ClangBuiltLinux project wouldn't be
where it is today without your contributions and leadership.

Justin
