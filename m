Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4027B
	for <llvm@lists.linux.dev>; Sat, 11 Mar 2023 05:41:40 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id x3so28892148edb.10
        for <llvm@lists.linux.dev>; Fri, 10 Mar 2023 21:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678513299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/sd8dW014vK210fbOwse3XQn+9FwnbuV9Aj9zLPSfTA=;
        b=EALEr4fQHB8sTxCC5fOp8g12RQnqhkhsZG/NekLvuxMXmN8T7aA9O4jfY46KE7EZnJ
         +xgGQiwjbnKZl7OT3bn64FzjsIoG9sK5/n5N2d3cJUvl50t8vuTIsQ9SWISvgJJ6oLth
         cDi7O5ZLKIPM7T4OlU9/9PzdA4T9PH7B/IsO8ROJWjWGahCobbG5gWRNOyxPSvnrdktc
         5gZrGGD6xQyGyfG6aKHwSDNp6op7+ZFlh/OVLIKNGrbWdg1UZdk6WUmS3U1zXBxh96ST
         abON/Q0HEU1utZz+rCZyWyGgx7mo0zwNXHX1v5glUC8STECbj9LbyWWfPJs5hUZ7L5C6
         1nHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678513299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/sd8dW014vK210fbOwse3XQn+9FwnbuV9Aj9zLPSfTA=;
        b=wJKjOS4EZaXn2fQ4vGEdrreglHs1EvEA0LwKsI6ZCt33KF5bHur7LeFmm63qXpU2qm
         J08+nVwMMuQKUANSiRSAsdmCq8pBjtcEsLeVG/tTJhXUgIf4wsBtJBfMsFdIleKnd6Xf
         3jFZG/U7I2wNdAsFsbGkz5WqIvT+ZWMuluV8OIyEoQ+mcq+AsgUnGWXJifE8y7CQYAHm
         edAXdGm/NpL5bT4WDSHwiQbsAiQhwpxqItTSUJ4RRqq2+2OJLr0GPMf3/4GR792qZfYb
         V9Tuk3VWobj1FUQxXirCOT5vzv80E3a1+NSjcH6DM7X01zhfVggxnl+nUHMLPRaUcCTu
         6Wsg==
X-Gm-Message-State: AO0yUKXrBMWV/UgAGDzUT8rHVuYDXhwbIi4nLIMBZPb0iFzo98QRLAJ6
	2ETvWrRgwD0To4Hdg1fxp704kyLuxQmF32A8wFdllPUwoic=
X-Google-Smtp-Source: AK7set/DgviL/QBLBYU/H0NM/R9r2BYzhFdhydBWjNvSD+maEWSdfT/LiBqx8G/4q8Xi5A3CtaGFrOU+xWY+dSQKk34=
X-Received: by 2002:a50:d602:0:b0:4bf:a788:1d68 with SMTP id
 x2-20020a50d602000000b004bfa7881d68mr15509692edi.6.1678513299037; Fri, 10 Mar
 2023 21:41:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230308220842.1231003-1-conor@kernel.org> <20230310150754.535425-1-bmeng.cn@gmail.com>
 <CAEUhbmWcfcSmuU6VnbTdLoErT113RZPgHSK3c+3M5kU0Wsv1pg@mail.gmail.com> <243c92f1-c1e0-428b-ab31-3d9c9088b2c2@spud>
In-Reply-To: <243c92f1-c1e0-428b-ab31-3d9c9088b2c2@spud>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 11 Mar 2023 13:41:27 +0800
Message-ID: <CAEUhbmUf+-a8u_qaC3weP1xBy8gjsbdV=29bM8gp6SWA5KqH5A@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: remove I-extension ISA spec version dance
To: Conor Dooley <conor@kernel.org>
Cc: aurelien@aurel32.net, conor.dooley@microchip.com, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	naresh.kamboju@linaro.org, nathan@kernel.org, ndesaulniers@google.com, 
	palmer@dabbelt.com, palmer@rivosinc.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 11, 2023 at 12:40=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Fri, Mar 10, 2023 at 11:35:57PM +0800, Bin Meng wrote:
> > On Fri, Mar 10, 2023 at 11:07=E2=80=AFPM Bin Meng <bmeng.cn@gmail.com> =
wrote:
> > >
> > > > From: Conor Dooley <conor.dooley@microchip.com>
> > > >
> > > > The spec folk, in their infinite wisdom, moved both control and sta=
tus
> > > > registers & the FENCE.I instructions out of the I extension into th=
eir
> > > > own extensions (Zicsr, Zifencei) in the 20190608 version of the ISA
> > > > spec [0].
> > > > The GCC/binutils crew decided [1] to move their default version of =
the
> > > > ISA spec to the 20191213 version of the ISA spec, which came into b=
eing
> > > > for version 2.38 of binutils and GCC 12. Building with this toolcha=
in
> > > > configuration would result in assembler issues:
> > > >   CC      arch/riscv/kernel/vdso/vgettimeofday.o
> > > >   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h: Assemble=
r messages:
> > > >   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error=
: unrecognized opcode `csrr a5,0xc01'
> > > >   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error=
: unrecognized opcode `csrr a5,0xc01'
> > > >   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error=
: unrecognized opcode `csrr a5,0xc01'
> > > >   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error=
: unrecognized opcode `csrr a5,0xc01'
> > > > This was fixed in commit 6df2a016c0c8 ("riscv: fix build with binut=
ils
> > > > 2.38") by Aurelien Jarno, but has proven fragile.
> > > >
> > > > Before LLVM 17, LLVM did not support these extensions and, as such,=
 the
> > > > cc-option check added by Aurelien worked. Since commit 22e199e6afb1
> > > > ("[RISCV] Accept zicsr and zifencei command line options") however,=
 LLVM
> > > > *does* support them and the cc-option check passes.
> > > >
> > > > This surfaced as a problem while building the 5.10 stable kernel us=
ing
> > > > the default Tuxmake Debian image [2], as 5.10 did not yet support l=
d.lld,
> > > > and uses the Debian provided binutils 2.35.
> > > > Versions of ld prior to 2.38 will refuse to link if they encounter
> > > > unknown ISA extensions, and unfortunately Zifencei is not supported=
 by
> > > > bintuils 2.35.
> > > >
> > > > Instead of dancing around with adding these extensions to march, as=
 we
> > > > currently do, Palmer suggested locking GCC builds to the same versi=
on of
> > > > the ISA spec that is used by LLVM. As far as I can tell, that is 2.=
2,
> > > > with, apparently [3], a lack of interest in implementing a flag lik=
e
> > > > GCC's -misa-spec at present.
> > > >
> > > > Add {cc,as}-option checks to add -misa-spec to KBUILD_{A,C}FLAGS wh=
en
> > > > GCC is used & remove the march dance.
> > > >
> > > > As clang does not accept this argument, I had expected to encounter
> > > > issues with the assembler, as neither zicsr nor zifencei are presen=
t in
> > > > the ISA string and the spec version *should* be defaulting to a ver=
sion
> > > > that requires them to be present. The build passed however and the
> > > > resulting kernel worked perfectly fine for me on a PolarFire SoC...
> > > >
> > > > Link: https://riscv.org/wp-content/uploads/2019/06/riscv-spec.pdf [=
0]
> > > > Link: https://groups.google.com/a/groups.riscv.org/g/sw-dev/c/aE1Ze=
HHCYf4 [1]
> > > > Link: https://lore.kernel.org/all/CA+G9fYt9T=3DELCLaB9byxaLW2Qf4pZc=
DO=3DhuCA0D8ug2V2+irJQ@mail.gmail.com/ [2]
> > > > Link: https://discourse.llvm.org/t/specifying-unpriviledge-spec-ver=
sion-misa-spec-gcc-flag-equivalent/66935 [3]
> > > > CC: stable@vger.kernel.org
> > > > Suggested-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > > Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> > > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > > ---
> > > > I think Aurelien's original commit message might actually not be qu=
ite
> > > > correct? I found, in my limited testing, that it is not the default
> > > > behaviour of gas that matters, but rather the toolchain itself?
> > > > My binutils versions (both those built using the clang-built-linux
> > > > tc-build scripts which do not set an ISA spec version, and one buil=
t
> > > > using the riscv-gnu-toolchain infra w/ an explicit 20191213 spec ve=
rsion
> > > > set) do not encounter these issues.
> > >
> > > I am unable to reproduce the build failure as reported by commit 6df2=
a016c0c8
> > > ("riscv: fix build with binutils 2.38") by Aurelien Jarno using kerne=
l.org
> > > pre-built GCC 11.3.0 [1] which includes binutils 2.38.
> > >
> > > [1] https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86=
_64/11.3.0/x86_64-gcc-11.3.0-nolibc-x86_64-linux.tar.xz
> > >
> > > The defconfig of v5.16 kernel (commit 6df2a016c0c8 lands in v5.17) bu=
ilds fine
> > > for me. Anything I am missing?
> > >
> >
> > Some further note:
> >
> > After I switched to kernel.org pre-built GCC 12.2.0 [1] which includes
> > binutils 2.39, I was able to reproduce the exact same build failure of
> > v5.16 kernel as described in the commit 6df2a016c0c8 ("riscv: fix
> > build with binutils 2.38") by Aurelien Jarno.
> >
> > To verify the commit message of 6df2a016c0c8 is accurate or not, I
> > built a GAS from binutils 2.37 and replaced the GAS 2.39 in the
> > kernel.org package, surprisingly kernel v5.16 did not build with the
> > same build failure.
> >
> > So it seems that it's GCC that caused the build failure instead of GAS
> > from binutils??
>
> Right, that's what I was getting at in the bit below the --- line in my
> patch. I think Aurelien was misled by the failure message and your email
> ([1] in my links above) which claimed that binutils would default to
> the 20191213 spec.
> It appears (and I'm not a tc person) that GCC must call GAS with the
> --misa-spec argument, and in GCC 12 the value used is 20191213.
> Either GCC 11 must pass --misa-spec=3D2.2 to binutils, or it passes
> nothing, leading binutils to be permissive about what -march=3Drv64i
> means.

I verified that "-misa-spec" is a new option introduced in GCC 12 and
the default value is set to 20191213 which is unfortunately backward
incompatible.

GCC 11 does not have the "-misa-spec" option, so I assume it produces
backward compatible codes.

IOW, what commit 6df2a016c0c8 was trying to fix has nothing to do with
binutils 2.38+. It's the GCC changes that is the culprit.

For this patch, I think it LGTM, so:

Reviewed-by: Bin Meng <bmeng@tinylab.org>

>
> The permissive option would "seem" to be correct, as building with clang
> (that to my knowledge doesn't pass --misa-spec to GAS) and with
> -march=3Drv64i has no issues assembling.
>
> It'd appear to me that binutils is a *player* in this issue, but is not
> the culprit of the issue Aurelien sought to fix.
>
> I dunno what I am talking about though, this is all from playing around
> with many tc variants and see how it goes!
>

Regards,
Bin
