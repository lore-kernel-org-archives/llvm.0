Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EFAAFE7
	for <llvm@lists.linux.dev>; Fri,  7 Apr 2023 22:24:05 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id 60-20020a17090a09c200b0023fcc8ce113so2410778pjo.4
        for <llvm@lists.linux.dev>; Fri, 07 Apr 2023 15:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680906245; x=1683498245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrVHb13UvYla2C+JeC8bumn76vhmsOllvvO0QcWmhnA=;
        b=X792gloNevcmEtMgdbqGoueG/S5ONAZ6lZJkRGUgQ4wZAnwHx0CJ7voofLvho9d2MK
         5h6UxoRvhb+ixRbytQrgXTgkd1U9EIQkdqe0HAkW2erBwYsFKWwEk1I2Lm4KUHjd97b9
         fimpzQ4f8fYaaQ4jeMPBOWJOhXYqH4ToBBbVWmoSIj7X4MuO61WwcAXa/fzwdPN5tcLd
         hQzTOGIdKUgu3BE/k06NTIbZrsoPM+hyhQDW/r1MImK6zXMpGXn3KFObWCF+MFt7FzK4
         gmXd5OjL60kRnJDwpwvSbNHHdyHWg5e4oLFxwsq98KbaanofOqmCiMYWreXxqpp/Q4gh
         7eDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680906245; x=1683498245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lrVHb13UvYla2C+JeC8bumn76vhmsOllvvO0QcWmhnA=;
        b=FCIeI1vEt6vjR9sz8nrB8so6sJpHiYjeM7g/q2EY9DkSLnnftjsfvUXpqwgDZCi508
         E8FcZyfLjv/BvEwRfUzSqWZu2zlxcmnJPhk6pgkbthigB+FNwbXGQESJg9bd955EfG2n
         I1Ok7iqPCT87Fdx3C9jqjptPUgqMksPLQnnnwTiCRB+typ8SaZfFd9IsPgToZUDH68US
         D7/1jczLl2ECpna14XSFMaqsrGAGvycguqQ8UaYRD5va1E80wReAZAduFOXHVe1gOhsm
         hFdJLQRJR/Kh+6Acz/h1UPvOVm1RamYdMi8K5AnCOofi1oEE+4e8i9IPfA/CFMcaOfU8
         hq+A==
X-Gm-Message-State: AAQBX9eap+UGIZityu+1Vf7YqR80/oeFFhDt5NkvmwxOyhGZg5mEh5Q8
	beCm7ua5Ek1bNJK+GGm2l2s2SymqFV4xzF25xoA4IA==
X-Google-Smtp-Source: AKy350aGArSfl/xM017rLoJsk8CBLTOPrfM724flcMlloumguBDE0EX+LuK1ZICivKc1ZNdlxEN8bxI57CuccDOqTbk=
X-Received: by 2002:a17:90b:2343:b0:244:9228:1a10 with SMTP id
 ms3-20020a17090b234300b0024492281a10mr1011315pjb.7.1680906244978; Fri, 07 Apr
 2023 15:24:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230407102721.14814-1-jiaxun.yang@flygoat.com> <20230407102721.14814-6-jiaxun.yang@flygoat.com>
In-Reply-To: <20230407102721.14814-6-jiaxun.yang@flygoat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Apr 2023 15:23:53 -0700
Message-ID: <CAKwvOdmNR=c4toqkzR_x7ub+L5j8V5Y1PZFOi8s37YRGj9nfMw@mail.gmail.com>
Subject: Re: [PATCH 5/5] MIPS: Fallback CPU -march CFLAG to ISA level if unsupported
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org, llvm@lists.linux.dev, 
	tsbogend@alpha.franken.de, nathan@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 7, 2023 at 3:27=E2=80=AFAM Jiaxun Yang <jiaxun.yang@flygoat.com=
> wrote:
>
> LLVM does not implement some of -march option. However those march
> does not provide any special functionality in most cases, they just
> serves as compiler's tuning target.

Then should we change these then to be in the form:

-cflags-$(CONFIG_CPU_R3000)     +=3D -march=3Dr3000
+cflags-$(CONFIG_CPU_R3000)     +=3D -march=3Dmips1 $(call cc-option,-mtune=
=3Dr3000)

>
> Fallback -march CFLAG to ISA level if unsupported by toolchain so
> we can get those kernel to build with LLVM.
>
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/Makefile | 30 +++++++++++++++++-------------
>  1 file changed, 17 insertions(+), 13 deletions(-)
>
> diff --git a/arch/mips/Makefile b/arch/mips/Makefile
> index 344fe5f00f7b..eab6abeaa45c 100644
> --- a/arch/mips/Makefile
> +++ b/arch/mips/Makefile
> @@ -148,10 +148,10 @@ cflags-y +=3D $(call cc-option,-Wa$(comma)-mno-fix-=
loongson3-llsc,)
>  #
>  # CPU-dependent compiler/assembler options for optimization.
>  #
> -cflags-$(CONFIG_CPU_R3000)     +=3D -march=3Dr3000
> -cflags-$(CONFIG_CPU_R4300)     +=3D -march=3Dr4300 -Wa,--trap
> -cflags-$(CONFIG_CPU_R4X00)     +=3D -march=3Dr4600 -Wa,--trap
> -cflags-$(CONFIG_CPU_TX49XX)    +=3D -march=3Dr4600 -Wa,--trap
> +cflags-$(CONFIG_CPU_R3000)     +=3D $(call cc-option,-march=3Dr3000,-mar=
ch=3Dmips1)
> +cflags-$(CONFIG_CPU_R4300)     +=3D $(call cc-option,-march=3Dr4300,-mar=
ch=3Dmips3) -Wa,--trap
> +cflags-$(CONFIG_CPU_R4X00)     +=3D $(call cc-option,-march=3Dr4600,-mar=
ch=3Dmips3) -Wa,--trap
> +cflags-$(CONFIG_CPU_TX49XX)    +=3D $(call cc-option,-march=3Dr4600,-mar=
ch=3Dmips3) -Wa,--trap
>  cflags-$(CONFIG_CPU_MIPS32_R1) +=3D -march=3Dmips32 -Wa,--trap
>  cflags-$(CONFIG_CPU_MIPS32_R2) +=3D -march=3Dmips32r2 -Wa,--trap
>  cflags-$(CONFIG_CPU_MIPS32_R5) +=3D -march=3Dmips32r5 -Wa,--trap -modd-s=
preg
> @@ -160,19 +160,21 @@ cflags-$(CONFIG_CPU_MIPS64_R1)    +=3D -march=3Dmip=
s64 -Wa,--trap
>  cflags-$(CONFIG_CPU_MIPS64_R2) +=3D -march=3Dmips64r2 -Wa,--trap
>  cflags-$(CONFIG_CPU_MIPS64_R5) +=3D -march=3Dmips64r5 -Wa,--trap
>  cflags-$(CONFIG_CPU_MIPS64_R6) +=3D -march=3Dmips64r6 -Wa,--trap
> -cflags-$(CONFIG_CPU_P5600)     +=3D -march=3Dp5600 -Wa,--trap -modd-spre=
g
> -cflags-$(CONFIG_CPU_R5000)     +=3D -march=3Dr5000 -Wa,--trap
> -cflags-$(CONFIG_CPU_R5500)     +=3D $(call cc-option,-march=3Dr5500,-mar=
ch=3Dr5000) \
> +cflags-$(CONFIG_CPU_P5600)     +=3D $(call cc-option,-march=3Dp5600,-mar=
ch=3Dmips32r5) \
> +                       -Wa,--trap -modd-spreg
> +cflags-$(CONFIG_CPU_R5000)     +=3D $(call cc-option,-march=3Dr5000,-mar=
ch=3Dmips4) \
>                         -Wa,--trap
> -cflags-$(CONFIG_CPU_NEVADA)    +=3D $(call cc-option,-march=3Drm5200,-ma=
rch=3Dr5000) \
> +cflags-$(CONFIG_CPU_R5500)     +=3D $(call cc-option,-march=3Dr5500,-mar=
ch=3Dmips4) \
>                         -Wa,--trap
> -cflags-$(CONFIG_CPU_RM7000)    +=3D $(call cc-option,-march=3Drm7000,-ma=
rch=3Dr5000) \
> +cflags-$(CONFIG_CPU_NEVADA)    +=3D $(call cc-option,-march=3Drm5200,-ma=
rch=3Dmips4) \
>                         -Wa,--trap
> -cflags-$(CONFIG_CPU_SB1)       +=3D $(call cc-option,-march=3Dsb1,-march=
=3Dr5000) \
> +cflags-$(CONFIG_CPU_RM7000)    +=3D $(call cc-option,-march=3Drm7000,-ma=
rch=3Dmips4) \
> +                       -Wa,--trap
> +cflags-$(CONFIG_CPU_SB1)       +=3D $(call cc-option,-march=3Dsb1,-march=
=3Dmips4) \
>                         -Wa,--trap
>  cflags-$(CONFIG_CPU_SB1)       +=3D $(call cc-option,-mno-mdmx)
>  cflags-$(CONFIG_CPU_SB1)       +=3D $(call cc-option,-mno-mips3d)
> -cflags-$(CONFIG_CPU_R10000)    +=3D $(call cc-option,-march=3Dr10000,-ma=
rch=3Dr8000) \
> +cflags-$(CONFIG_CPU_R10000)    +=3D $(call cc-option,-march=3Dr10000,-ma=
rch=3Dmips4) \
>                         -Wa,--trap
>  cflags-$(CONFIG_CPU_CAVIUM_OCTEON) +=3D $(call cc-option,-march=3Docteon=
) -Wa,--trap
>  ifeq (,$(findstring march=3Docteon, $(cflags-$(CONFIG_CPU_CAVIUM_OCTEON)=
)))
> @@ -181,8 +183,10 @@ endif
>  cflags-$(CONFIG_CAVIUM_CN63XXP1) +=3D -Wa,-mfix-cn63xxp1
>  cflags-$(CONFIG_CPU_BMIPS)     +=3D -march=3Dmips32 -Wa,-mips32 -Wa,--tr=
ap
>
> -cflags-$(CONFIG_CPU_LOONGSON2E) +=3D -march=3Dloongson2e -Wa,--trap
> -cflags-$(CONFIG_CPU_LOONGSON2F) +=3D -march=3Dloongson2f -Wa,--trap
> +cflags-$(CONFIG_CPU_LOONGSON2E) +=3D \
> +                       $(call cc-option,-march=3Dloongson2e,-march=3Dmip=
s3) -Wa,--trap
> +cflags-$(CONFIG_CPU_LOONGSON2F) +=3D \
> +                       $(call cc-option,-march=3Dloongson2f,-march=3Dmip=
s3) -Wa,--trap
>  # Some -march=3D flags enable MMI instructions, and GCC complains about =
that
>  # support being enabled alongside -msoft-float. Thus explicitly disable =
MMI.
>  cflags-$(CONFIG_CPU_LOONGSON2EF) +=3D $(call cc-option,-mno-loongson-mmi=
)
> --
> 2.39.2 (Apple Git-143)
>


--=20
Thanks,
~Nick Desaulniers
