Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E69628
	for <llvm@lists.linux.dev>; Thu,  9 Mar 2023 02:19:41 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id m25-20020a7bcb99000000b003e7842b75f2so299896wmi.3
        for <llvm@lists.linux.dev>; Wed, 08 Mar 2023 18:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1678328380;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ssPfoh9aqr53T59+LRlDc4FDNkN5/Uw0DxcwgjrF2A=;
        b=mrEx/DI9y6SuARRxHg0TWCr9xyZ5EHshcCAC7fWyfGR751kdIgZu6xpTKzEM6iB58t
         49QJLYhNtyRt1cLGbKt3xPtYINfDDHUVl2N/fUu1ma6uxihgvWZ5bArlujcbF6KQN/mG
         X9ec8xotxiMIWBIMDle39GzM/HcmMagt9QllkbiuugD4SIjdQJRV0yJwm9bfaFoaV8WL
         Clmni7G09coDwxJEQVTNRxLHOrS+462tQz8wasU+As/+od9fcG+dIrDgOQC8oomvyF+H
         ngyBCc14x8spGdbwp+zIcu7gUTfIk/l1o6PJk9ITir368zBpwBYTYaV4PGb9ALO8Ozm1
         GXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678328380;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ssPfoh9aqr53T59+LRlDc4FDNkN5/Uw0DxcwgjrF2A=;
        b=g03LnZbrKvQceqE7pmlJMoVX8GwxqJNt26Vxrfglcme3t2fMWAkfAzvffMSj5HMqLy
         fKPiZZsAPPAMi5y1zuRAByPpkkWrHYNQ8qUoZFWTCgerTILiEIT21G9+Ws5nxJEKG7zV
         VzSWJWuUoTZdhPgUYWPwp5Wra5j9Gn1n+CVDbzdNBE7RW60SNziyGhX9EPNCfNbJOeAU
         4wqfkLuq8BLsYyewhYIYGzcbzt3krer927OlGKYpw7fraoXM1EbNM7ZGGy+ofx4kuTv9
         KOmIlmXUiNaVd9Fu5pUxvuKEYmVnJwKbRTUIBpJpGlt4Rk1czF60Eamx4ZkeILcmTF1R
         v8sg==
X-Gm-Message-State: AO0yUKW2zau965SKhQJGk1BeBQKC7JKsUcfLlRrH+jOK7i6W3BsLe/OE
	lpDHiUfp1mja2cTrKViyTr9p/g==
X-Google-Smtp-Source: AK7set/qpwLIYtzLqCl59j2ELXMrW+oEX2ZpU/wP0+5us2l9Mvk/5wRTP/iLRhg5kFrSxvsMg74q1A==
X-Received: by 2002:a05:600c:1d09:b0:3eb:3945:d3f4 with SMTP id l9-20020a05600c1d0900b003eb3945d3f4mr19026392wms.2.1678328379992;
        Wed, 08 Mar 2023 18:19:39 -0800 (PST)
Received: from smtpclient.apple (global-5-144.n-2.net.cam.ac.uk. [131.111.5.144])
        by smtp.gmail.com with ESMTPSA id m14-20020a05600c4f4e00b003e22508a343sm1097470wmq.12.2023.03.08.18.19.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Mar 2023 18:19:39 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v2] RISC-V: remove I-extension ISA spec version dance
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20230308220842.1231003-1-conor@kernel.org>
Date: Thu, 9 Mar 2023 02:19:38 +0000
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Nathan Chancellor <nathan@kernel.org>,
 naresh.kamboju@linaro.org,
 llvm@lists.linux.dev,
 stable@vger.kernel.org,
 aurelien@aurel32.net,
 ndesaulniers@google.com,
 Palmer Dabbelt <palmer@rivosinc.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3476D6EF-F7DD-4437-A71C-47EF05210AF3@jrtc27.com>
References: <20230308220842.1231003-1-conor@kernel.org>
To: Conor Dooley <conor@kernel.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)

On 8 Mar 2023, at 22:08, Conor Dooley <conor@kernel.org> wrote:
>=20
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> The spec folk, in their infinite wisdom, moved both control and status
> registers & the FENCE.I instructions out of the I extension into their
> own extensions (Zicsr, Zifencei) in the 20190608 version of the ISA
> spec [0].
> The GCC/binutils crew decided [1] to move their default version of the
> ISA spec to the 20191213 version of the ISA spec, which came into =
being
> for version 2.38 of binutils and GCC 12. Building with this toolchain
> configuration would result in assembler issues:
>  CC      arch/riscv/kernel/vdso/vgettimeofday.o
>  <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h: Assembler =
messages:
>  <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: =
unrecognized opcode `csrr a5,0xc01'
>  <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: =
unrecognized opcode `csrr a5,0xc01'
>  <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: =
unrecognized opcode `csrr a5,0xc01'
>  <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: =
unrecognized opcode `csrr a5,0xc01'
> This was fixed in commit 6df2a016c0c8 ("riscv: fix build with binutils
> 2.38") by Aurelien Jarno, but has proven fragile.
>=20
> Before LLVM 17, LLVM did not support these extensions and, as such, =
the
> cc-option check added by Aurelien worked. Since commit 22e199e6afb1
> ("[RISCV] Accept zicsr and zifencei command line options") however, =
LLVM
> *does* support them and the cc-option check passes.
>=20
> This surfaced as a problem while building the 5.10 stable kernel using
> the default Tuxmake Debian image [2], as 5.10 did not yet support =
ld.lld,
> and uses the Debian provided binutils 2.35.
> Versions of ld prior to 2.38 will refuse to link if they encounter
> unknown ISA extensions, and unfortunately Zifencei is not supported by
> bintuils 2.35.
>=20
> Instead of dancing around with adding these extensions to march, as we
> currently do, Palmer suggested locking GCC builds to the same version =
of
> the ISA spec that is used by LLVM. As far as I can tell, that is 2.2,
> with, apparently [3], a lack of interest in implementing a flag like
> GCC's -misa-spec at present.
>=20
> Add {cc,as}-option checks to add -misa-spec to KBUILD_{A,C}FLAGS when
> GCC is used & remove the march dance.
>=20
> As clang does not accept this argument, I had expected to encounter
> issues with the assembler, as neither zicsr nor zifencei are present =
in
> the ISA string and the spec version *should* be defaulting to a =
version
> that requires them to be present. The build passed however and the
> resulting kernel worked perfectly fine for me on a PolarFire SoC...

For what it=E2=80=99s worth, LLVM is likely to move from only supporting =
the
old ratified spec to only supporting the latest one, with no ugly
-misa-spec like the GNU world. You may therefore wish to reconsider
this...

Jess

> Link: https://riscv.org/wp-content/uploads/2019/06/riscv-spec.pdf [0]
> Link: =
https://groups.google.com/a/groups.riscv.org/g/sw-dev/c/aE1ZeHHCYf4 [1]
> Link: =
https://lore.kernel.org/all/CA+G9fYt9T=3DELCLaB9byxaLW2Qf4pZcDO=3DhuCA0D8u=
g2V2+irJQ@mail.gmail.com/ [2]
> Link: =
https://discourse.llvm.org/t/specifying-unpriviledge-spec-version-misa-spe=
c-gcc-flag-equivalent/66935 [3]
> CC: stable@vger.kernel.org
> Suggested-by: Palmer Dabbelt <palmer@rivosinc.com>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> I think Aurelien's original commit message might actually not be quite
> correct? I found, in my limited testing, that it is not the default
> behaviour of gas that matters, but rather the toolchain itself?
> My binutils versions (both those built using the clang-built-linux
> tc-build scripts which do not set an ISA spec version, and one built
> using the riscv-gnu-toolchain infra w/ an explicit 20191213 spec =
version
> set) do not encounter these issues.
> =46rom *my* testing, I was only able to reproduce the above build =
failures
> because of *GCC* defaulting to a newer ISA spec version, and saw no
> issues with CC=3Dclang builds, where -misa-spec is not (AFAICT) passed =
to
> gas.
> I'm far from a toolchain person, so I am very very happy to have the
> reason for that explained to me, as I've been scratching my head about
> it all evening.
>=20
> I'm also not super confident in my "as-option"ing, but it worked for =
me,
> so it's gotta be perfect, right? riiight??
>=20
> Changes from v1:
> - entirely new approach to the issue
> ---
> arch/riscv/Makefile | 6 ++----
> 1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 6203c3378922..2df7a5dc071c 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -57,10 +57,8 @@ riscv-march-$(CONFIG_ARCH_RV64I)	:=3D rv64ima
> riscv-march-$(CONFIG_FPU)		:=3D $(riscv-march-y)fd
> riscv-march-$(CONFIG_RISCV_ISA_C)	:=3D $(riscv-march-y)c
>=20
> -# Newer binutils versions default to ISA spec version 20191213 which =
moves some
> -# instructions from the I extension to the Zicsr and Zifencei =
extensions.
> -toolchain-need-zicsr-zifencei :=3D $(call cc-option-yn, =
-march=3D$(riscv-march-y)_zicsr_zifencei)
> -riscv-march-$(toolchain-need-zicsr-zifencei) :=3D =
$(riscv-march-y)_zicsr_zifencei
> +KBUILD_CFLAGS +=3D $(call cc-option,-misa-spec=3D2.2)
> +KBUILD_AFLAGS +=3D $(call as-option,-Wa$(comma)-misa-spec=3D2.2)
>=20
> # Check if the toolchain supports Zihintpause extension
> riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) :=3D =
$(riscv-march-y)_zihintpause
> --=20
> 2.39.2
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

