Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98A32F4E
	for <llvm@lists.linux.dev>; Fri,  7 Apr 2023 15:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73566C4339C
	for <llvm@lists.linux.dev>; Fri,  7 Apr 2023 15:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680880533;
	bh=vGlwy608C+Ds3GbvhDnhbpjMR3EUPj9t3k92oNr7CQ0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XMqQHa9R3z/+oLKPnwI14KxGJGT4kWe/i/ZIanhLOakD0qQvCIWWiu3r6h7xGq2yU
	 BZsh/XGxd7/qBWfIVmXrA3HIHl5wTfOkLlCgtmFRer5knqFP49GoJaxygsnc07G+5A
	 RQRUXCnwSFZ1sr+IUa5qbM3h3He7xKxOHU1JGlXGD/3PWpAkggj3b/Gneaz2i/OMAP
	 yOdU/xOztXn9a5QKvKisIdGSNwcB63CTvvsooBTYTvjctXwMxAjxE5U1ODsRNoFArx
	 m6qTkCTUVCbm6SdP/J/UsTvfJoeHvMPse54X1KJcB5f76p+rE8SaPiK2wzYetkopMj
	 oAu+5vaU0dxMQ==
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-17786581fe1so45927276fac.10
        for <llvm@lists.linux.dev>; Fri, 07 Apr 2023 08:15:33 -0700 (PDT)
X-Gm-Message-State: AAQBX9dWCSQ8AseYp/NgvFTaL40C6vBBsaFQCOfBpTxPPjROyNoY0fVq
	VIBe2wA3yH0ezCpQQxgSFMO6IJvI/g9DRQfg04w=
X-Google-Smtp-Source: AKy350bSS6cueUUGxjORUIEpgEgnjuCl7Kvm9fMBzAHqjK/qQkvinz7XpylPEKFliZtBYuwmOhxGEZ4JWyZlfR9sGtg=
X-Received: by 2002:a05:6870:2050:b0:179:c3d1:42d0 with SMTP id
 l16-20020a056870205000b00179c3d142d0mr1316089oad.11.1680880532724; Fri, 07
 Apr 2023 08:15:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230326182120.194541-1-hi@alyssa.is>
In-Reply-To: <20230326182120.194541-1-hi@alyssa.is>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 8 Apr 2023 00:14:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNARAnLyZrDdMbfp3nKz+5M0BXrNUPRAagXhYtYQpEpfOyg@mail.gmail.com>
Message-ID: <CAK7LNARAnLyZrDdMbfp3nKz+5M0BXrNUPRAagXhYtYQpEpfOyg@mail.gmail.com>
Subject: Re: [PATCH v2] purgatory: fix disabling debug info
To: Alyssa Ross <hi@alyssa.is>
Cc: Nick Cao <nickcao@nichi.co>, linux-kbuild@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, Tom Rix <trix@redhat.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 27, 2023 at 3:23=E2=80=AFAM Alyssa Ross <hi@alyssa.is> wrote:
>
> Since 32ef9e5054ec, -Wa,-gdwarf-2 is no longer used in KBUILD_AFLAGS.
> Instead, it includes -g, the appropriate -gdwarf-* flag, and also the
> -Wa versions of both of those if building with Clang and GNU as.  As a
> result, debug info was being generated for the purgatory objects, even
> though the intention was that it not be.
>
> Fixes: 32ef9e5054ec ("Makefile.debug: re-enable debug info for .S files")
> Signed-off-by: Alyssa Ross <hi@alyssa.is>
> Cc: stable@vger.kernel.org
> ---
>
> Difference from v2: replace each AFLAGS_REMOVE_* assignment with a
> single aflags-remove-y line, and use foreach to add the -Wa versions,
> as suggested by Masahiro Yamada.


Applied to linux-kbuild/fixes.
Thanks.


>  arch/riscv/purgatory/Makefile | 7 +------
>  arch/x86/purgatory/Makefile   | 3 +--
>  2 files changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefil=
e
> index d16bf715a586..5730797a6b40 100644
> --- a/arch/riscv/purgatory/Makefile
> +++ b/arch/riscv/purgatory/Makefile
> @@ -84,12 +84,7 @@ CFLAGS_string.o                      +=3D $(PURGATORY_=
CFLAGS)
>  CFLAGS_REMOVE_ctype.o          +=3D $(PURGATORY_CFLAGS_REMOVE)
>  CFLAGS_ctype.o                 +=3D $(PURGATORY_CFLAGS)
>
> -AFLAGS_REMOVE_entry.o          +=3D -Wa,-gdwarf-2
> -AFLAGS_REMOVE_memcpy.o         +=3D -Wa,-gdwarf-2
> -AFLAGS_REMOVE_memset.o         +=3D -Wa,-gdwarf-2
> -AFLAGS_REMOVE_strcmp.o         +=3D -Wa,-gdwarf-2
> -AFLAGS_REMOVE_strlen.o         +=3D -Wa,-gdwarf-2
> -AFLAGS_REMOVE_strncmp.o                +=3D -Wa,-gdwarf-2
> +asflags-remove-y               +=3D $(foreach x, -g -gdwarf-4 -gdwarf-5,=
 $(x) -Wa,$(x))
>
>  $(obj)/purgatory.ro: $(PURGATORY_OBJS) FORCE
>                 $(call if_changed,ld)
> diff --git a/arch/x86/purgatory/Makefile b/arch/x86/purgatory/Makefile
> index 17f09dc26381..82fec66d46d2 100644
> --- a/arch/x86/purgatory/Makefile
> +++ b/arch/x86/purgatory/Makefile
> @@ -69,8 +69,7 @@ CFLAGS_sha256.o                       +=3D $(PURGATORY_=
CFLAGS)
>  CFLAGS_REMOVE_string.o         +=3D $(PURGATORY_CFLAGS_REMOVE)
>  CFLAGS_string.o                        +=3D $(PURGATORY_CFLAGS)
>
> -AFLAGS_REMOVE_setup-x86_$(BITS).o      +=3D -Wa,-gdwarf-2
> -AFLAGS_REMOVE_entry64.o                        +=3D -Wa,-gdwarf-2
> +asflags-remove-y               +=3D $(foreach x, -g -gdwarf-4 -gdwarf-5,=
 $(x) -Wa,$(x))
>
>  $(obj)/purgatory.ro: $(PURGATORY_OBJS) FORCE
>                 $(call if_changed,ld)
>
> base-commit: da8e7da11e4ba758caf4c149cc8d8cd555aefe5f
> --
> 2.37.1
>


--=20
Best Regards
Masahiro Yamada
