Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071A41C11
	for <llvm@lists.linux.dev>; Sun, 16 Apr 2023 13:02:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A854CC433A0
	for <llvm@lists.linux.dev>; Sun, 16 Apr 2023 13:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681650169;
	bh=D3wy4kwpYEcnvQj/DKBp/Hq76nY/CXZPNCXOrIibLCg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Un3l3D3xgYAMWSddL2GeWG8Y3LD4HC3NFNMrx1dRHGwOdznt7jdMJhKELlvIdxPyW
	 KBdJ1QPSPeB+4rxMyty4HsmSO9oYSoE9rXgB95yaghcgI4ZGMttCQyHPJF2NwZ/ymH
	 l4yhK7PE6SPHHoolR3MFWhWQtuXzm60ABVe6MPMsim9zPGgPmcBmA6h1XpTqipfmzm
	 ODwTfGXrMy/dzPmmnux4tBBpAh9CBHzX5muBLBY67UHn9A+ff75HpHvMMq4ae8NTfP
	 t3JZvIkUeLk0UdvWC7HrHbZ3i/XrOlJ/Qk0tEVCrg1Wd2gxyTfqA7l1QyXiTPs+3Cc
	 7921zRW5bxGPQ==
Received: by mail-ot1-f41.google.com with SMTP id 63-20020a9d0345000000b006a5e01360fdso409519otv.10
        for <llvm@lists.linux.dev>; Sun, 16 Apr 2023 06:02:49 -0700 (PDT)
X-Gm-Message-State: AAQBX9f6RdTIx7xNvgA+IU21Y3Gq1ywj76+2E/kcAZtiISifZa6Fg+2F
	s6M2rFzAp76hQRfoH57rfTYZ8J7J0nZFtf0D1E8=
X-Google-Smtp-Source: AKy350asvMZybXnMTiMzrhCi04P+dV9lupbZkct2X70VIIPJHBHL6CfYbZrmmKagvzwZVMmz4lAwLL/CIw60sfCgFkE=
X-Received: by 2002:a9d:77d1:0:b0:6a4:279d:aab5 with SMTP id
 w17-20020a9d77d1000000b006a4279daab5mr2778407otl.1.1681650168906; Sun, 16 Apr
 2023 06:02:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230401170117.1580840-1-masahiroy@kernel.org> <20230403144758.GA3460665@dev-arch.thelio-3990X>
In-Reply-To: <20230403144758.GA3460665@dev-arch.thelio-3990X>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 16 Apr 2023 22:02:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQsgB-SC2t+9ZpDwJbME+BVt+Gur1ydTnHfBfMAfn_y0w@mail.gmail.com>
Message-ID: <CAK7LNAQsgB-SC2t+9ZpDwJbME+BVt+Gur1ydTnHfBfMAfn_y0w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: clang: do not use CROSS_COMPILE for target triple
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Fangrui Song <maskray@google.com>, Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 3, 2023 at 11:48=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
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


I did not look into it closely, but if we say
"
Using either CROSS_COMPILE=3Dpowerpc64-linux-gnu- or
CROSS_COMPILE=3Dpowerpc-linux-gnu- fixes it.
Using KCFLAGS=3D-v reveals that powerpc64le-linux-gnu-as is not getting
the endianness information.
", why didn't we fix it like the following?


 diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
 index 70b354fa1cb4..8dda7dc69c93 100644
 --- a/scripts/Makefile.clang
 +++ b/scripts/Makefile.clang
 @@ -6,7 +6,7 @@ CLANG_TARGET_FLAGS_arm64        :=3D aarch64-linux-gnu
  CLANG_TARGET_FLAGS_hexagon     :=3D hexagon-linux-musl
  CLANG_TARGET_FLAGS_m68k                :=3D m68k-linux-gnu
  CLANG_TARGET_FLAGS_mips                :=3D mipsel-linux-gnu
 -CLANG_TARGET_FLAGS_powerpc     :=3D powerpc64le-linux-gnu
 +CLANG_TARGET_FLAGS_powerpc     :=3D powerpc64-linux-gnu
  CLANG_TARGET_FLAGS_riscv       :=3D riscv64-linux-gnu
  CLANG_TARGET_FLAGS_s390                :=3D s390x-linux-gnu
  CLANG_TARGET_FLAGS_x86         :=3D x86_64-linux-gnu



We do not need to test all possible target triples.
We can just use the one that is known to work.


Anyway, I will apply this patch. Thanks.


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
Best Regards
Masahiro Yamada
