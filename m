Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB1EAFED
	for <llvm@lists.linux.dev>; Tue, 18 Apr 2023 20:07:29 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-24704a7bf34so2362796a91.1
        for <llvm@lists.linux.dev>; Tue, 18 Apr 2023 13:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681848449; x=1684440449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZ/IRUpLOAIM6V2tODhsfJJqsMJTTgStF5pqHar8MKk=;
        b=qDoqKiSzP+kcb3zCaGLigT58SG1uUOX9y389LdFirbR1Cy3dKUJDVEipxK9sjayJXP
         eEdYksvXnF7LcDdrcnD9WH3dHzdsLQOR8pCa7MM7MKTNsxyKvCV3APyuIPet4nPFdke8
         FuQa9Jeci89kxxDKknqieXZr0XN5lQw7BG6VXEr92DnYnyEpV/+/6OuPxzNLaWcfZqYB
         BaT3kvHVwQD+G7kxH+vGJHFrCMHQLeRxx33LbihODSObR/bDo36j+xt0Je4IL3Ct02bG
         sm6dHRpGHnM4U4JItxAgRmFoNJNdqmw8ANNtRuS9zpOvxwhrVpcr7JCZPtzvxd1+DSDz
         3xhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681848449; x=1684440449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZ/IRUpLOAIM6V2tODhsfJJqsMJTTgStF5pqHar8MKk=;
        b=FFC/TNpRMCqT+atq7Ip3ocjKzqAef+/rYyZAAYsJCdxhmZ9cDepPbeYcB7MAHNoYEV
         LSg7PWghkhz/2Dvvv/2Ae2qh21FAj07PnqR2E+xx08+1+W4Xv5HbaUQe/ydJKXg8aivM
         jO3d51GvG7uc+kA6juqZNtF4xX5UK/kkCzaaVMS5bxDv01+exE623919UQ75l1WFbS7P
         CGkUt8cUPBpMr1glxnjjnMAxXLqn4aIoFIZgMlBplgu3TWhF8RysZnATvCJweSKuLZh7
         TD7IJEE9TXVRKrgV5W1g2z/RM3QhQgmQya/GECI+MUtjO23Hc/fJ11nRcEyCjYqJgAIN
         umBg==
X-Gm-Message-State: AAQBX9fUjRP1wLz5U3PhWmoBADz0hlUM6Kf1nrntBldtu64Wyemt/Imm
	PjH2Jfch6GBox20zffwJMsdj2iX1uCcItqWkpOrS+Q==
X-Google-Smtp-Source: AKy350YFAb846cS178gmTNqw1jdIjlgWsDPJqzYY80MqHw39FLd176eqMp2SLjh31L/+4oaMKjeOa65LdUb586pTFb4=
X-Received: by 2002:a17:90b:1e05:b0:246:b038:2f53 with SMTP id
 pg5-20020a17090b1e0500b00246b0382f53mr801508pjb.24.1681848449023; Tue, 18 Apr
 2023 13:07:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230414080701.15503-1-jiaxun.yang@flygoat.com> <20230414080701.15503-7-jiaxun.yang@flygoat.com>
In-Reply-To: <20230414080701.15503-7-jiaxun.yang@flygoat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 18 Apr 2023 13:07:17 -0700
Message-ID: <CAKwvOdkttvdZQyxrP60hAziaRQ4HWRBBSuA-vN25_USg-zEJqg@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] MIPS: Fallback CPU -march CFLAG to ISA level if unsupported
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org, llvm@lists.linux.dev, 
	tsbogend@alpha.franken.de, nathan@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 14, 2023 at 1:07=E2=80=AFAM Jiaxun Yang <jiaxun.yang@flygoat.co=
m> wrote:
>
> LLVM does not implement some of -march options. However those options
> are not mandatory for kernel to build for those CPUs.
>
> Fallback -march CFLAG to ISA level if unsupported by toolchain so
> we can get those kernel to build with LLVM.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1544
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Thanks for the patch! Maybe it's more obvious to folks who work on
mips, but how did you determine that say `p5600` is `mips32r5` or
`r10000` is `mips4`?

Is there a table somewhere you used as a reference? Including such
info in the commit message would help reviewers such as myself verify
the patch.

Also, in v1, you mentioned that -mtune is not a substitute. It would
be good to record that info in the commit message as well.

> ---
> v2: Reword commit message
> ---
>  arch/mips/Makefile | 30 +++++++++++++++++-------------
>  1 file changed, 17 insertions(+), 13 deletions(-)
>
> diff --git a/arch/mips/Makefile b/arch/mips/Makefile
> index af3d17ec35d3..0fa84fc395c9 100644
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
> @@ -160,26 +160,30 @@ cflags-$(CONFIG_CPU_MIPS64_R1)    +=3D -march=3Dmip=
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
>  cflags-$(CONFIG_CPU_CAVIUM_OCTEON) +=3D -march=3Docteon -Wa,--trap
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
