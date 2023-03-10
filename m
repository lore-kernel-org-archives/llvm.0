Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1346A882B
	for <llvm@lists.linux.dev>; Fri, 10 Mar 2023 15:08:01 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id ay18so3828788pfb.2
        for <llvm@lists.linux.dev>; Fri, 10 Mar 2023 07:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678460880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6wmqhbkcFZ9XLdQhS5fIYDEJwGeWKkLiEBNj07i144=;
        b=b/p2hZpaxx/bEWvgbBt/gpsw3wcrQuP2fT3hKuXwE9NSW2tpdNzGPvtvfMUm60F/fX
         KAFYv38lzRXSvZCmmab8CCAF87wQUnmaULE7Bft/CeoZMFIuPb6uIOXvtLx1Oa7sDfDp
         qSt30S8Abo/GVudrtG4ek3B6U/LVERM4Jjzf7YFwPmTg2CH5KG/aTrg1nPh/yGNkQ2ox
         BIIbxXwDipaUOfVRjNcNDl/kFIvVmpusjV/QRQSQt5M0ZProtBnfI0mZJXcaFrS5R8UV
         JtjYtg0+Hz3A34OBWe7IUadwbqKi1aLKcKKhP1M1vKOWfu8THWtB0k5UnAedAHRnTEVr
         oM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678460880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E6wmqhbkcFZ9XLdQhS5fIYDEJwGeWKkLiEBNj07i144=;
        b=iTwR90DPLyeBfUjrz9+0iKHpvR/YsvfcIjdZDVW4dFrP19CGlsIagxHM1ENSnbh+l+
         nNnRGims07daXmke/zKxZ0EwWZYT77Yl9/0qQ+QM9lIwx8XpvVijoUXwwIx+DKWwulOl
         EvBk4a0xGX+2vPD+sQADmRijWtO9cF6AB3mEco1Fbw6dWhYESIibjiNqdBir2LJ9Bpma
         LxoGpV8ddd1yweDsAxbH8HP8cRUj8dSola+EX9NiOhWLxDXzRQq9QFx+dsFOFilTN4wd
         bmNi0elXwpiTiVxZYNwWfZBpXrhhrhCJl7hrkqt40l7Hj01I1Qv0aGyfIZhzsgEyY9SV
         KECA==
X-Gm-Message-State: AO0yUKUJfSYDwEShUXesCtcUfjaEVGp54MfrPzfk7iZAY2r05KFeGsqr
	AlklytTEClQ7qjIv2CRkxhc=
X-Google-Smtp-Source: AK7set+i7uLoqEXLcdw6kfCBDyOMGpkkThKx3Rmjmh50VMUNitPfLxe8TejzJh85BT0BVaMC8VGhnA==
X-Received: by 2002:aa7:9485:0:b0:600:cc40:2589 with SMTP id z5-20020aa79485000000b00600cc402589mr22160328pfk.3.1678460880450;
        Fri, 10 Mar 2023 07:08:00 -0800 (PST)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
        by smtp.gmail.com with ESMTPSA id j9-20020aa79289000000b0058db8f8bce8sm1533758pfa.166.2023.03.10.07.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 07:07:59 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: conor@kernel.org
Cc: aurelien@aurel32.net,
	conor.dooley@microchip.com,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev,
	naresh.kamboju@linaro.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	palmer@dabbelt.com,
	palmer@rivosinc.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] RISC-V: remove I-extension ISA spec version dance
Date: Fri, 10 Mar 2023 23:07:54 +0800
Message-Id: <20230310150754.535425-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230308220842.1231003-1-conor@kernel.org>
References: <20230308220842.1231003-1-conor@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The spec folk, in their infinite wisdom, moved both control and status
> registers & the FENCE.I instructions out of the I extension into their
> own extensions (Zicsr, Zifencei) in the 20190608 version of the ISA
> spec [0].
> The GCC/binutils crew decided [1] to move their default version of the
> ISA spec to the 20191213 version of the ISA spec, which came into being
> for version 2.38 of binutils and GCC 12. Building with this toolchain
> configuration would result in assembler issues:
>   CC      arch/riscv/kernel/vdso/vgettimeofday.o
>   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h: Assembler messages:
>   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01'
>   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01'
>   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01'
>   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01'
> This was fixed in commit 6df2a016c0c8 ("riscv: fix build with binutils
> 2.38") by Aurelien Jarno, but has proven fragile.
> 
> Before LLVM 17, LLVM did not support these extensions and, as such, the
> cc-option check added by Aurelien worked. Since commit 22e199e6afb1
> ("[RISCV] Accept zicsr and zifencei command line options") however, LLVM
> *does* support them and the cc-option check passes.
> 
> This surfaced as a problem while building the 5.10 stable kernel using
> the default Tuxmake Debian image [2], as 5.10 did not yet support ld.lld,
> and uses the Debian provided binutils 2.35.
> Versions of ld prior to 2.38 will refuse to link if they encounter
> unknown ISA extensions, and unfortunately Zifencei is not supported by
> bintuils 2.35.
> 
> Instead of dancing around with adding these extensions to march, as we
> currently do, Palmer suggested locking GCC builds to the same version of
> the ISA spec that is used by LLVM. As far as I can tell, that is 2.2,
> with, apparently [3], a lack of interest in implementing a flag like
> GCC's -misa-spec at present.
> 
> Add {cc,as}-option checks to add -misa-spec to KBUILD_{A,C}FLAGS when
> GCC is used & remove the march dance.
> 
> As clang does not accept this argument, I had expected to encounter
> issues with the assembler, as neither zicsr nor zifencei are present in
> the ISA string and the spec version *should* be defaulting to a version
> that requires them to be present. The build passed however and the
> resulting kernel worked perfectly fine for me on a PolarFire SoC...
> 
> Link: https://riscv.org/wp-content/uploads/2019/06/riscv-spec.pdf [0]
> Link: https://groups.google.com/a/groups.riscv.org/g/sw-dev/c/aE1ZeHHCYf4 [1]
> Link: https://lore.kernel.org/all/CA+G9fYt9T=ELCLaB9byxaLW2Qf4pZcDO=huCA0D8ug2V2+irJQ@mail.gmail.com/ [2]
> Link: https://discourse.llvm.org/t/specifying-unpriviledge-spec-version-misa-spec-gcc-flag-equivalent/66935 [3]
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
> using the riscv-gnu-toolchain infra w/ an explicit 20191213 spec version
> set) do not encounter these issues.

I am unable to reproduce the build failure as reported by commit 6df2a016c0c8
("riscv: fix build with binutils 2.38") by Aurelien Jarno using kernel.org
pre-built GCC 11.3.0 [1] which includes binutils 2.38.

[1] https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/11.3.0/x86_64-gcc-11.3.0-nolibc-x86_64-linux.tar.xz

The defconfig of v5.16 kernel (commit 6df2a016c0c8 lands in v5.17) builds fine
for me. Anything I am missing?

> >From *my* testing, I was only able to reproduce the above build failures
> because of *GCC* defaulting to a newer ISA spec version, and saw no
> issues with CC=clang builds, where -misa-spec is not (AFAICT) passed to
> gas.
> I'm far from a toolchain person, so I am very very happy to have the
> reason for that explained to me, as I've been scratching my head about
> it all evening.
> 
> I'm also not super confident in my "as-option"ing, but it worked for me,
> so it's gotta be perfect, right? riiight??
> 
> Changes from v1:
> - entirely new approach to the issue
> ---
>  arch/riscv/Makefile | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 6203c3378922..2df7a5dc071c 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -57,10 +57,8 @@ riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
>  riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
>  riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
>  
> -# Newer binutils versions default to ISA spec version 20191213 which moves some
> -# instructions from the I extension to the Zicsr and Zifencei extensions.
> -toolchain-need-zicsr-zifencei := $(call cc-option-yn, -march=$(riscv-march-y)_zicsr_zifencei)
> -riscv-march-$(toolchain-need-zicsr-zifencei) := $(riscv-march-y)_zicsr_zifencei
> +KBUILD_CFLAGS += $(call cc-option,-misa-spec=2.2)
> +KBUILD_AFLAGS += $(call as-option,-Wa$(comma)-misa-spec=2.2)
>  
>  # Check if the toolchain supports Zihintpause extension
>  riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) := $(riscv-march-y)_zihintpause
> -- 
