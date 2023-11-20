Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E61374C7
	for <llvm@lists.linux.dev>; Mon, 20 Nov 2023 20:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z/Or2eXC"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-54744e66d27so3194a12.0
        for <llvm@lists.linux.dev>; Mon, 20 Nov 2023 12:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700511746; x=1701116546; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NKQchH0KG/ka3pq4IDflhEafmYdf5otEPRjqnY14Sx4=;
        b=Z/Or2eXCVafqo7HVUexVEeyua/VcRwqh262UMxJzgWIkLvCk3sM/DxL6NCK4FJl5rB
         ZOuBAsQPXGLDTlJWgv28WNdBGMJ54QIHlI1qCmUKgWHQoFCbhp12llBEVpLA5w9YCRNZ
         p6IcdM6NQAH1H7LgoFZ1g4JX2EzZ/uNqvATUNy/ehYAxZIsdANbUGiTHZX0pF7aVtpPQ
         1gqaJXDJJJtZBZICnFj8A0VebajeO2GzI6YYOPyKC+QdgxOnUqvwiZyTzRaosAr7RCeO
         9wxFRzW7pQHeLoLyHtk8HmsDz0EE5FqYYAaYft5N8DLA/0MsKUTFSfomxdpNwtl89/Z4
         MbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700511746; x=1701116546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKQchH0KG/ka3pq4IDflhEafmYdf5otEPRjqnY14Sx4=;
        b=RkTihOgFwXiJWr+3ETC/SAmIG9OH+IIGQsLZ9QvAVxRl3Wkn5Wx3XHowdUal4/hdn2
         IxMLTxhZgtTn2zD8RAiWBT1AfEDk6s1Df4LU8c60uhFd6wtebPdpAMJ3orn61zd8mbOL
         HUYoW5pHl/5szkh+npvHKtZoXS82l2R3ENqAeHwHJTIf1BXKXj2kH53Zn0mY1a9jMGrC
         LScta1+l2zCqrRNPOMHwVqFhOoxUNktupqMbYz1kfyr7uKIPhnyzBBLTLTw4gIuv1gU8
         Q1ycohIP1GkQ3gfok/GOf2IKmx6DvX6uJzt0gtf0mtsh9Xi7A4ALv58NPurxQ3/Em55I
         QbKQ==
X-Gm-Message-State: AOJu0YyWc9rsXQ51+Ff5PW9G8MvB2ifeeEKJxehpcBBrjUJXzhje/vFB
	qgb6LrWq8MkIqx98FTW/SeQKJzGxzENmjhFvOA1n
X-Google-Smtp-Source: AGHT+IFSaY9sZiHPmdbardRNSWpqGFpsxku70pLHjUVi59i+tqerL9K9fVTstzns+Euj3IuDIlVmq2bo+v/xt5rW60Q=
X-Received: by 2002:a05:6402:514f:b0:545:94c:862e with SMTP id
 n15-20020a056402514f00b00545094c862emr305076edd.2.1700511745653; Mon, 20 Nov
 2023 12:22:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231117-maintainers-v1-1-85f2a7422ed9@google.com>
In-Reply-To: <20231117-maintainers-v1-1-85f2a7422ed9@google.com>
From: Bill Wendling <morbo@google.com>
Date: Mon, 20 Nov 2023 12:22:09 -0800
Message-ID: <CAGG=3QV6Uk=YUTiP2KZqox9RD=dhBujx_8rQoT_5tbTmE85Eig@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: refresh LLVM support
To: ndesaulniers@google.com
Cc: Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Justin Stitt <justinstitt@google.com>, Tom Rix <trix@redhat.com>, 
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

Acked-by: Bill Wendling <morbo@google.com>

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
