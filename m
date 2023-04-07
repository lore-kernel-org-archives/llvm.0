Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD7EAD22
	for <llvm@lists.linux.dev>; Fri,  7 Apr 2023 19:55:10 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id x37so24946485pga.1
        for <llvm@lists.linux.dev>; Fri, 07 Apr 2023 12:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680897310; x=1683489310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRLvMBwRYgN9rZY0Zb0vSfDSDaMTw9OUufeYYmz/skw=;
        b=f6eYkrEter++NUKtxdaDLcQojieZL0r8jOl193HqrIPectcDZHEEPA9f34LkHDW4dP
         P53I9XvbApz+JAM6RyIEZmBddB+MR4UL6Y+75sl3sjuV+Mh0p8sSp8FRJVoy4bnn2QA9
         jPEYwxlaF9ooPwy+8HJoYrjt0LocOcCedEiJq/KY46LD17Q4GoG7cnevh+D8wxdzbVfY
         PLASeXnpdF6KyXWVwt+pMpLbMYosAlhCx24xg7zs8lPP9a5qQPE/uUll9ajaFEJOM6Ae
         yRHxhmMbIBvMqx2e04olr1L5CCWAQsjyzCyXRGaRC4G30bBEAXw3y46p3M3q6+GY1Rnx
         VquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680897310; x=1683489310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yRLvMBwRYgN9rZY0Zb0vSfDSDaMTw9OUufeYYmz/skw=;
        b=lngnUT5xKBai/YDCg6J2bAJQmXx2vDTx0dJeqbVncboJuGuJVXFzslQomjrAILVxp2
         LyQe7eHKaUljuKcNcNrc6d4uH9eVW92AmZTa0dao/aBjaDs0cnwBeKZ1fiUduVxnWKw1
         cU7CzKpbpuQh00sS2G1tCuocjvWuwXRXv7wrEOdPxZi5o38NWQRgmoK1eT7jqu+A+gpG
         1CkiDh1tWA3XlpDechpA6VUoH7XsG2EcveLZC/NrcjyWK/HEP8co4hXHUrcbEltOzM+L
         COyadsX8i90k8ZwTB9EYU+oMLyvQvMIJ0LJ+JYYnjWhoiLE5SvjkziQqRbQRl16dLKSF
         G6JQ==
X-Gm-Message-State: AAQBX9d9mscoxYvkiCDpX6IspZJ5xxjWQuhOpcpalL14O1bJOSb5L1hA
	+dQLgONKXHRVba4J1A7QQwhhcUFZbg00YHCFKK25xA==
X-Google-Smtp-Source: AKy350Zdn9kJpAE9Iql9IWBE7I7HcL96ooTIkSJ6p3oPGATAQjzlKAHto1RtQSOBZZ2ouYHs2x095vPSxO+sue+Ce+I=
X-Received: by 2002:a65:6201:0:b0:4fc:2058:fa29 with SMTP id
 d1-20020a656201000000b004fc2058fa29mr685882pgv.1.1680897309863; Fri, 07 Apr
 2023 12:55:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230401170117.1580840-1-masahiroy@kernel.org> <20230403144758.GA3460665@dev-arch.thelio-3990X>
In-Reply-To: <20230403144758.GA3460665@dev-arch.thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Apr 2023 12:54:58 -0700
Message-ID: <CAKwvOd=3LoK7_qSijzk6Ww265LMDOk2-gQ-k9r0RwvENLi9JBA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: clang: do not use CROSS_COMPILE for target triple
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	Tom Rix <trix@redhat.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Fangrui Song <maskray@google.com>, Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 3, 2023 at 7:48=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> On Sun, Apr 02, 2023 at 02:01:17AM +0900, Masahiro Yamada wrote:
> > The target triple is overridden by the user-supplied CROSS_COMPILE,
> > but I do not see a good reason to support it. Users can use a new
> > architecture without adding CLANG_TARGET_FLAGS_*, but that would be
> > a rare case.
> >
> > Use the hard-coded and deterministic target triple all the time.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> I know of one bug where the value of '--target' matters:
>
> https://github.com/ClangBuiltLinux/linux/issues/1244
>
> This was fixed in LLVM 12.0.0. We are not testing this in our CI though,
> so we would not get bit by this (we could bump the minimum supported
> version of LLVM to 12.0.0 for this, we have talked recently about doing
> it for other reasons).
>
> I guess I cannot really think of a good reason not to do this aside from
> that; the target triple should only affect code generation, rather than
> tool selection (i.e., this does not take away the ability to use a
> custom set of binutils with clang).
>
> However, Nick is currently OOO and I would like his opinion voiced
> before we commit to this. Consider this a tentative:

Yeah, nothing I could think of; at this point CROSS_COMPILE is only
necessary for LLVM_IAS=3D0 builds and s390 (since LLD lacks s390
support) IIUC.

A user is more likely to adjust the --target for the host, which they
can do via USERCFLAGS or USERLDFLAGS, but not for the target.  I don't
think the gnu vs musl for the target triple makes a difference; we
might even be able to omit that part of the triple but I haven't
grepped through LLVM sources to see if that would result in
differences for codegen.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Acked-by: Nathan Chancellor <nathan@kernel.org>
>
> > ---
> >
> >  scripts/Makefile.clang | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> >
> > diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
> > index 70b354fa1cb4..9076cc939e87 100644
> > --- a/scripts/Makefile.clang
> > +++ b/scripts/Makefile.clang
> > @@ -13,15 +13,11 @@ CLANG_TARGET_FLAGS_x86            :=3D x86_64-linux=
-gnu
> >  CLANG_TARGET_FLAGS_um                :=3D $(CLANG_TARGET_FLAGS_$(SUBAR=
CH))
> >  CLANG_TARGET_FLAGS           :=3D $(CLANG_TARGET_FLAGS_$(SRCARCH))
> >
> > -ifeq ($(CROSS_COMPILE),)
> >  ifeq ($(CLANG_TARGET_FLAGS),)
> > -$(error Specify CROSS_COMPILE or add '--target=3D' option to scripts/M=
akefile.clang)
> > +$(error add '--target=3D' option to scripts/Makefile.clang)
> >  else
> >  CLANG_FLAGS  +=3D --target=3D$(CLANG_TARGET_FLAGS)
> > -endif # CLANG_TARGET_FLAGS
> > -else
> > -CLANG_FLAGS  +=3D --target=3D$(notdir $(CROSS_COMPILE:%-=3D%))
> > -endif # CROSS_COMPILE
> > +endif
> >
> >  ifeq ($(LLVM_IAS),0)
> >  CLANG_FLAGS  +=3D -fno-integrated-as
> > --
> > 2.37.2
> >



--=20
Thanks,
~Nick Desaulniers
