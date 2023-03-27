Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE6379DD
	for <llvm@lists.linux.dev>; Mon, 27 Mar 2023 22:12:36 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id g7so6717698pfu.2
        for <llvm@lists.linux.dev>; Mon, 27 Mar 2023 15:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679955155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7ZNQ5vjpwd7R42XQrkWv8310d6dUWZkU3XZU5SoAJo=;
        b=Q1yKGQLoJfM+HWC7tP5mFSqWLk4J0mVSYBJ2lQf2l3yZQEnGF0+dXkdNTH+MrhfUNM
         OXLWPIC2xI+XdrAznpFxXQoi6DhZ+FxiafpprzeZIi4YfHHNVOe53bcy1DsOWzEPMfeF
         PGr/eYKlzUohPyMY31QdHgsBHR6d3QFWSXqKGyClR9cuBLBPtEuogiWZP+B/z5Teo2Dr
         DYdpl3QQW0z9GZYN+MSUMmlGV7bg+IH1MB2mN+bBiSIYK/6lEGL9OnDB29vLBJNLamH6
         nWljN0GZfjFF5K5WhenQxTIpJutOrhy+blWEAkArggo0viTvvj177ckimP0gO/eafVwi
         yvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679955155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7ZNQ5vjpwd7R42XQrkWv8310d6dUWZkU3XZU5SoAJo=;
        b=KGxfnKfXi/u58JqPWxPX/fagRFoj4X7uGqKvRTcMRdDz4XLmweCYl6bYaJP0pMSyC+
         XgtwDbsSfDM+bwCWpk/3oz4rQlEq5fk/UEdO5mSyfDXXBqvJhZjCppA/lXJjLLpNqGYk
         bV6yOVgAjOehFRQOlZsQZKQ7wdQ+y17N6aaUeKe/Qu/NSnEgpm4pOqqUHzdB131fZ+1G
         sANfgWjz2CKhVWl6jYxw/xQtLo6UQXAegRGLStRhjIOne8zwZuU0c67+CEIPKxYBjbpg
         XvkEy/s9fsVvYrWZIkI6DMacIZ0DfcXZKbsDyT0B23KqSEq0OeqLF2q6siluqy5NN6km
         AjCQ==
X-Gm-Message-State: AAQBX9fWV6nNlSAC7/pWGADJ7+djhmVYilXH530541k6u7LK/GcMVgWx
	7wt+v+M2DSUh7vx1AkxYSH8Zsa1cX8DYOP8Yp0sjoA==
X-Google-Smtp-Source: AKy350bYwQem0GhjZOScZ9GwtnL6TWyI1IM4jybdrpoYRsAE3bh54QWxNFYp2c1iazl+9mV7SBW0PIgm8yA8LdllWa0=
X-Received: by 2002:a63:446:0:b0:503:7be3:e81d with SMTP id
 67-20020a630446000000b005037be3e81dmr3549449pge.1.1679955155235; Mon, 27 Mar
 2023 15:12:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230326182120.194541-1-hi@alyssa.is>
In-Reply-To: <20230326182120.194541-1-hi@alyssa.is>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 27 Mar 2023 15:12:23 -0700
Message-ID: <CAKwvOdmTLCqLV8bfXY4X0xgg9eYaVNDEUwzbvNrK-SUTVhuxRQ@mail.gmail.com>
Subject: Re: [PATCH v2] purgatory: fix disabling debug info
To: Alyssa Ross <hi@alyssa.is>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nick Cao <nickcao@nichi.co>, linux-kbuild@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, Tom Rix <trix@redhat.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 26, 2023 at 11:23=E2=80=AFAM Alyssa Ross <hi@alyssa.is> wrote:
>
> Since 32ef9e5054ec, -Wa,-gdwarf-2 is no longer used in KBUILD_AFLAGS.
> Instead, it includes -g, the appropriate -gdwarf-* flag, and also the
> -Wa versions of both of those if building with Clang and GNU as.  As a
> result, debug info was being generated for the purgatory objects, even
> though the intention was that it not be.

Ah, good catch!

>
> Fixes: 32ef9e5054ec ("Makefile.debug: re-enable debug info for .S files")
> Signed-off-by: Alyssa Ross <hi@alyssa.is>
> Cc: stable@vger.kernel.org
> ---
>
> Difference from v2: replace each AFLAGS_REMOVE_* assignment with a
> single aflags-remove-y line, and use foreach to add the -Wa versions,
> as suggested by Masahiro Yamada.
>
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

Removing the explicit `-Wa,-gdwarf-2` makes sense; nothing ever sets it.

> +asflags-remove-y               +=3D $(foreach x, -g -gdwarf-4 -gdwarf-5,=
 $(x) -Wa,$(x))

Is it simpler to just append `-g0` to the running list of asflags;
that should also disable the emission of debug info? Or does that not
remove debug info from the assembler?

Either way:
Acked-by: Nick Desaulniers <ndesaulniers@google.com>
and thanks for the patch!

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
Thanks,
~Nick Desaulniers
