Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012C2882C
	for <llvm@lists.linux.dev>; Fri, 10 Mar 2023 15:36:09 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id k10so21948378edk.13
        for <llvm@lists.linux.dev>; Fri, 10 Mar 2023 07:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678462568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=weKFr6b+Imx1UMFHSantlURMbu8JW3pFLr8NL5fcask=;
        b=JpSp2vXkZoNkXcoWbtVYoNF2LP1Cq/mZ6I62m4FjxEVqw3VJypVVeMlx6sIUH+w6CC
         ESVlq8df2dzwgvb3VaLbBy5kNEele2I5uPjAPX+Ftg4frYbcPZl38Otmsv5xswWr5qEn
         WFtN9Ujzvx7SBTnCisWWozXnwEnKxXEbMBUPDbNOlKwbf0a8bXOKQM6dQShMFxBE7iKG
         oSB7PBS08nsutLnMqrgbJ5iEps8/zAktdZe5F6IrDLPh10fae/p4Ak7jOQhBgaoNPcCe
         Vp8HrcccGV5ldx2sLNIUbZ1b/Ru45bT2OrmwxpiCTrLg2eLRhIuovUfhJR8/emq03W6y
         dZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678462568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=weKFr6b+Imx1UMFHSantlURMbu8JW3pFLr8NL5fcask=;
        b=a2rFslK6IIY4Fvo86/TzrBqOgi6k+3YJm+jmI17A4vyG7qJAQ2PTUeTwKV4QREuras
         rjqSyFvZWOlmEv3Atsx0ff59roFILKVYzceEJkwJf/81z1Bh2POpZqKa0BJzb39uio7v
         Z0YTH3EpBo8XBSHeoru8SLxKIp5UnNn2eyY0IeK0IQ2237N3RWrJl41mTJ0Ja2Va7VtH
         hVriJI4F99AeahsYCG8Ub2Nja4Cn2NnSKk1zJZD7b3T4ymsn/4ICKks1WwGHYcLblpQC
         5nsPEw5iwqRVTtHFTmJ2qp8FTJTnfeuMZ8SHxOjnpVJ7A5uCgzHCz1jJxFcH52i+fjPJ
         hjmg==
X-Gm-Message-State: AO0yUKUCrBsrBr+7iWyRzWLqK77i8B2qsBaOAruQ1e6AT16XczUHFYhW
	0ifKUqiIppY5skAlWM0173S4YAcasC8MTfEXY0M=
X-Google-Smtp-Source: AK7set+3VgRTlg3enwJhmwOBXrMHaBkYBeyPLpDf/CCl5+yYhCf6IK0vmJW0eULNzyhX8cIAJuKiEaAw/ElDyYe8s7A=
X-Received: by 2002:a17:907:1045:b0:8b1:30eb:9dba with SMTP id
 oy5-20020a170907104500b008b130eb9dbamr12292626ejb.6.1678462568073; Fri, 10
 Mar 2023 07:36:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230308220842.1231003-1-conor@kernel.org> <20230310150754.535425-1-bmeng.cn@gmail.com>
In-Reply-To: <20230310150754.535425-1-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 10 Mar 2023 23:35:57 +0800
Message-ID: <CAEUhbmWcfcSmuU6VnbTdLoErT113RZPgHSK3c+3M5kU0Wsv1pg@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: remove I-extension ISA spec version dance
To: conor@kernel.org
Cc: aurelien@aurel32.net, conor.dooley@microchip.com, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	naresh.kamboju@linaro.org, nathan@kernel.org, ndesaulniers@google.com, 
	palmer@dabbelt.com, palmer@rivosinc.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 10, 2023 at 11:07=E2=80=AFPM Bin Meng <bmeng.cn@gmail.com> wrot=
e:
>
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > The spec folk, in their infinite wisdom, moved both control and status
> > registers & the FENCE.I instructions out of the I extension into their
> > own extensions (Zicsr, Zifencei) in the 20190608 version of the ISA
> > spec [0].
> > The GCC/binutils crew decided [1] to move their default version of the
> > ISA spec to the 20191213 version of the ISA spec, which came into being
> > for version 2.38 of binutils and GCC 12. Building with this toolchain
> > configuration would result in assembler issues:
> >   CC      arch/riscv/kernel/vdso/vgettimeofday.o
> >   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h: Assembler me=
ssages:
> >   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: un=
recognized opcode `csrr a5,0xc01'
> >   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: un=
recognized opcode `csrr a5,0xc01'
> >   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: un=
recognized opcode `csrr a5,0xc01'
> >   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: un=
recognized opcode `csrr a5,0xc01'
> > This was fixed in commit 6df2a016c0c8 ("riscv: fix build with binutils
> > 2.38") by Aurelien Jarno, but has proven fragile.
> >
> > Before LLVM 17, LLVM did not support these extensions and, as such, the
> > cc-option check added by Aurelien worked. Since commit 22e199e6afb1
> > ("[RISCV] Accept zicsr and zifencei command line options") however, LLV=
M
> > *does* support them and the cc-option check passes.
> >
> > This surfaced as a problem while building the 5.10 stable kernel using
> > the default Tuxmake Debian image [2], as 5.10 did not yet support ld.ll=
d,
> > and uses the Debian provided binutils 2.35.
> > Versions of ld prior to 2.38 will refuse to link if they encounter
> > unknown ISA extensions, and unfortunately Zifencei is not supported by
> > bintuils 2.35.
> >
> > Instead of dancing around with adding these extensions to march, as we
> > currently do, Palmer suggested locking GCC builds to the same version o=
f
> > the ISA spec that is used by LLVM. As far as I can tell, that is 2.2,
> > with, apparently [3], a lack of interest in implementing a flag like
> > GCC's -misa-spec at present.
> >
> > Add {cc,as}-option checks to add -misa-spec to KBUILD_{A,C}FLAGS when
> > GCC is used & remove the march dance.
> >
> > As clang does not accept this argument, I had expected to encounter
> > issues with the assembler, as neither zicsr nor zifencei are present in
> > the ISA string and the spec version *should* be defaulting to a version
> > that requires them to be present. The build passed however and the
> > resulting kernel worked perfectly fine for me on a PolarFire SoC...
> >
> > Link: https://riscv.org/wp-content/uploads/2019/06/riscv-spec.pdf [0]
> > Link: https://groups.google.com/a/groups.riscv.org/g/sw-dev/c/aE1ZeHHCY=
f4 [1]
> > Link: https://lore.kernel.org/all/CA+G9fYt9T=3DELCLaB9byxaLW2Qf4pZcDO=
=3DhuCA0D8ug2V2+irJQ@mail.gmail.com/ [2]
> > Link: https://discourse.llvm.org/t/specifying-unpriviledge-spec-version=
-misa-spec-gcc-flag-equivalent/66935 [3]
> > CC: stable@vger.kernel.org
> > Suggested-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > I think Aurelien's original commit message might actually not be quite
> > correct? I found, in my limited testing, that it is not the default
> > behaviour of gas that matters, but rather the toolchain itself?
> > My binutils versions (both those built using the clang-built-linux
> > tc-build scripts which do not set an ISA spec version, and one built
> > using the riscv-gnu-toolchain infra w/ an explicit 20191213 spec versio=
n
> > set) do not encounter these issues.
>
> I am unable to reproduce the build failure as reported by commit 6df2a016=
c0c8
> ("riscv: fix build with binutils 2.38") by Aurelien Jarno using kernel.or=
g
> pre-built GCC 11.3.0 [1] which includes binutils 2.38.
>
> [1] https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/=
11.3.0/x86_64-gcc-11.3.0-nolibc-x86_64-linux.tar.xz
>
> The defconfig of v5.16 kernel (commit 6df2a016c0c8 lands in v5.17) builds=
 fine
> for me. Anything I am missing?
>

Some further note:

After I switched to kernel.org pre-built GCC 12.2.0 [1] which includes
binutils 2.39, I was able to reproduce the exact same build failure of
v5.16 kernel as described in the commit 6df2a016c0c8 ("riscv: fix
build with binutils 2.38") by Aurelien Jarno.

To verify the commit message of 6df2a016c0c8 is accurate or not, I
built a GAS from binutils 2.37 and replaced the GAS 2.39 in the
kernel.org package, surprisingly kernel v5.16 did not build with the
same build failure.

So it seems that it's GCC that caused the build failure instead of GAS
from binutils??

[1] https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/12=
.2.0/x86_64-gcc-12.2.0-nolibc-riscv64-linux.tar.xz

Regards,
Bin
