Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BA54E66C8
	for <llvm@lists.linux.dev>; Fri, 25 Sep 2026 21:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790373426; cv=pass; b=PljWzWtYjVDZ1iNvSQaeAsO3znlHDsQULQN0WHvMEdOrZW9W39hSM9q0MFfDJnlTOcICtA2Q5+AiG3SRsiWnjfbW+7T39BfwalvNS4xrWFTP7eSGiERf578saS6ZxmWKUfijexr88JKoMEjN+2KZ6bR+up6ryydkzyCibK5NMus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790373426; c=relaxed/simple;
	bh=sT1cVOZBgte+RWfHpkgLNQUb8YZ5m6M5cASJpAKBiQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bYuHOyrpNQOzrgLD08W4g3c+zxGburYoh2A716do5uOveUkfWkhMBC0j1ix6eD3WzvrJtQq0QEzfG+CoVu3ohyrktEdxgiKNDHojW8neSbkdhY5QADlbBwdyv+ueBlnIYlM+df+lwsez+bWpVp6m/IrlaruvFU3EM8Fa+eUlXAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I8LCahsy; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I8LCahsy"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-486e1a044c5so1082296f8f.3
        for <llvm@lists.linux.dev>; Fri, 25 Sep 2026 14:57:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790373419; cv=none;
        d=google.com; s=arc-20260327;
        b=C55YWnZjmdfEDQFwu6kQDTI2pKI9yR1LJ3nNR9AL/soTMl5hYLPoz7HAJoxIhFwvK7
         MzqYX7qgGkS1sxP1ji967yC41upEZpTHeuUfFGx0cpwvVvUV8MStyrNoYGdOIMb1sXRv
         9NH1Qd7sGRbm/LvbOd+Gxg0qIe0koDc2So/Z81BzhGy2QkkcVZreP2WsWEbyvncWCDRr
         gBkGTLaIs/FwKPp+RNWN83xLOwzJ2FAYDKhUtWXmYhFI8MjXQ7ZvVNzZNV5pzpNOTsR+
         4SOkZur2i8zFmqjMwvsw71aPgBO7veoX4OgiUe0HiPVIOe7G/lql8ReJHku4G+86GFqD
         mCzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G6NlhQyLBvAL6TKdL1Aq5LRNoXywD8yKGimzHFh9xgc=;
        fh=7UsWh92fY1XEIDtOf/yS49rAYoqDT5lkv1KOtVlglz8=;
        b=HzGvpRJKRThqc7a19LuBpNhdCY8zCtvxhXvPZ0cQSl0T3GYNcKFWLU6wzN0jmJVecF
         Hz9S+uP6n+Eiw6AZ3YEhmzInUnj/o08+NemHSrODJNhG7dlwi5BYXMWg2qiyvXkBLIx9
         qymPCnUkbWk/aZGsAjB2kBVyGA6hm1rGvEU1ytTuQUM5n6NEq5EIM1/nMaen5gb1VhQS
         0ocINUH51uvfqHQ2iQDRtJCAgDXdKP8RQF4hpmbAukpREK0rbTBcISDzy8Jo9qY0cUfA
         YVMYMYVu2usy3rpHz4RpvNQOaKHC3ZMS371SxGQO79IyPwCpfsru2UvQOHh1MUxD9vsX
         8bVA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790373419; x=1790978219; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G6NlhQyLBvAL6TKdL1Aq5LRNoXywD8yKGimzHFh9xgc=;
        b=I8LCahsyVY+kD3fLmXzuJ5YgENNTEM8aOIip1QxoGH4B6yIzzj+JAuQZrkc74a9QXy
         S4F8K+VdvU5PgZoiaq6dOyAtcIGf0ti/r/t2PyJBL0dI0H7e5dkvrWyQlu0leRE7YkRk
         2uqAzx3/INVQqnItl4v/g20SsAJWha7RWE1S6b8mpuyQN8cucDnD6hpvCMKjM/6BdSTm
         fLc0A1KNSP21O0XiizY0bR9UmEOhsXuqYTt3BltqRTRN4boKoBOPfkJQKcvwDAGbGBxT
         qNKpdaE5+8A1jBFBnCZRmsJCjXAYl84fUhJxOTQDSKBSa4gRBWtnUb/kD+/bMsIXsq+m
         Osbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790373419; x=1790978219;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G6NlhQyLBvAL6TKdL1Aq5LRNoXywD8yKGimzHFh9xgc=;
        b=Vg/s4ooFvVLYa+J9FN8o+X/4y7POmBsox4ONgrdGfaxU1zQSInSJizNIHaW4f0JLWJ
         spjk39xjSNaEM1bJAbKFjZBvsRTQyA+W6hecxES99AAARXOE+MHJZYQmqV6Xj3aqR9Ag
         opinxVY87RLpSmlYcvTYOZW11lt6yK5hPmKyaHemj8yEmejSFZhx79T7X9/ANmyolp1R
         aIvz8eBOuzTqOk/6H6Tlz/ANwox9TghTV/viXzTnWFh/d4Qn8EYwq/Mx2DOV8I7HQBQt
         aJhyZGFvPnG5/GwP8bICnxMOmTmRAlwqUjPCR3Re6YbB3btwEWy+Ri8C3KUC4Gn1rWd/
         7bGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlLNg5hfutR+70ukss+F9qrZulAT6TQoRu7GRuWiJ6E6DsUoEt7nK7MifeQ7vkEj2UI8OK@lists.linux.dev
X-Gm-Message-State: AFuF++nv63hqvCdEaz1iajEgYw+dAa8KE0AsF0SsDggX1cLOBDHkT8Yq
	BLFQfO03GFf2EW7aDMcb3dh3Gpu6NhOt8UPnS6DSI0iSMc80+hBG7lDJky6YqQt14fEFma+qEtP
	k05EppRhSylnlKWLx8e33EhmLzJTaUOpNkr9RAaXS
X-Gm-Gg: AYBFou02vrxw3Qn7Zwkws+pheL2DLUSpFZThqHGaYDANbLK68LRAjWkNryWonlLC0D+
	mEcRmdLtFxWzTwQtqrYgmHq4k0RTUGLhM19jSF2vMP/Vo6FOyPvFBlWEa+2+UYWeYkEzSjwgUY9
	7W2ivJd9QjVYHDQw14hy6Gj+Sb4YOrLxZ4gtT3BB+fXg/fzxHxtaQHwAzzLU5Nzcped3fE1Kl2Q
	/E5xB8fOmsemQxrVyJElN7P49V4P9TdMoEQwY0Vvh68sJsgLpA4EG+cKhM525MNdafkHv5cZCiy
	hL9HWVTGe3iDPcXRSkT2qwo7XrSe6xuRPjPS0UHSce2fVDkFMBNVVvw06ENRI327D1GIvPfGtGr
	gm35c65Ol9q1T3EKavO/KsaWUABI8qO/H/QPG0y2/beObYkLCz/BzQOQ2D2l5Hrsb0AbpyHqNOF
	L98krc
X-Received: by 2002:a05:6000:288b:b0:485:1bcc:67f8 with SMTP id
 ffacd0b85a97d-4887171d8demr12695578f8f.13.1790373417936; Fri, 25 Sep 2026
 14:56:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
 <CAKwvOdmuvn0LZkYEsH84hnOGTYhTtzuWs3wMARtWdTeL6dD9sA@mail.gmail.com>
In-Reply-To: <CAKwvOdmuvn0LZkYEsH84hnOGTYhTtzuWs3wMARtWdTeL6dD9sA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 25 Sep 2026 14:56:46 -0700
X-Gm-Features: AclHuK8SDWvgFgIHW9y7_70sxeUurbOgosEQfmvpDPf9DmnqXM-fPyBkhdpsidg
Message-ID: <CAKwvOdnxKVpn=nAFaqP+9PTx4PqgHsUVWv6e60Pcr29W_eZrpQ@mail.gmail.com>
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 2:53=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Sep 25, 2026 at 2:46=E2=80=AFPM Nathan Chancellor <nathan@kernel.=
org> wrote:
> >
> > After a recent change in LLVM [1], builds with the random vDSO
> > implementation, such as PowerPC and RISC-V, fail when checking the vDSO=
:
> >
> >   arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not s=
upported
> >   arch/riscv/kernel/vdso/vdso.so.dbg: dynamic relocations are not suppo=
rted
> >
> > memset() is now generated when zeroing params->reserved for some builds
> > because LLVM has an optimization (now run in more instances) that can
> > recognize at compile time when it is assigning a static value to a
> > contiguous area of memory and turn that into a call to memset(). Both
> > clang and GCC assume memset() is always available [2].
> >
> > clang provides a builtin, __builtin_memset_inline [3][4], that can be
> > used to ensure an external function call is not generated when zeroing
> > this memory. Use it when it is available.
> >
> > While GCC has no issues with the current code, it has generated memset(=
)
> > before, as seen in commit b7bad082e113 ("random: vDSO: avoid call to ou=
t
> > of line memset()"). GCC 14 provides '-finline-stringops=3Dmemset' [5][6=
]
> > with a similar guarantee to the clang builtin, so use it and
> > __builtin_memset() when available.
> >
> > If no option is available, provide a simple memset_inline() like the on=
e
> > from lib/string.c to avoid adding an ugly ifdef.
> >
> > Link: https://github.com/llvm/llvm-project/commit/90cebef1411617fc3eedd=
359bdf00cb44b1c2439 [1]
> > Link: https://gcc.gnu.org/onlinedocs/gcc-16.2.0/gcc/Standards.html#inde=
x-ffreestanding [2]
> > Link: https://github.com/llvm/llvm-project/commit/38637ee477541370a90b3=
7f149069d8e5c0c2efd [3]
> > Link: https://clang.llvm.org/docs/LanguageExtensions.html#guaranteed-in=
lined-memset [4]
> > Link: https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D1ff6d9f7428b0=
668cd8ab0b3e3ab94f1d733124d [5]
> > Link: https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html#index-fi=
nline-stringops [6]
> > Suggested-by: "Jason A. Donenfeld" <Jason@zx2c4.com>
> > Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> > Changes in v2:
> > - Switch approach entirely (Jason, Nick)
> >   - clang: use __builtin_memset_inline() to avoid external call
> >   - GCC 14+: use __builtin_memset + -finline-stringops=3Dmemset (hence =
the
> >     massive CC list increase)
> >   - GCC < 14: no issues currently but avoid ifdef with simple memset
> >     implementation
> > - Link to v1: https://patch.msgid.link/20260916-vdso-getrandom-avoid-me=
mset-llvm-24-v1-1-80a92f2e225a@kernel.org
> > ---
> >  arch/arm64/kernel/vdso/Makefile     |  2 +-
> >  arch/loongarch/vdso/Makefile        |  1 +
> >  arch/powerpc/kernel/vdso/Makefile   |  1 +
> >  arch/riscv/kernel/vdso/Makefile     |  1 +
> >  arch/s390/kernel/vdso/Makefile      |  1 +
> >  arch/x86/entry/vdso/vdso64/Makefile |  2 +-
> >  init/Kconfig                        |  7 +++++++
> >  lib/vdso/getrandom.c                | 19 +++++++++++++++++--
> >  8 files changed, 30 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/M=
akefile
> > index 7dec05dd33b7..f6619e1cb2ce 100644
> > --- a/arch/arm64/kernel/vdso/Makefile
> > +++ b/arch/arm64/kernel/vdso/Makefile
> > @@ -41,7 +41,7 @@ CC_FLAGS_REMOVE_VDSO :=3D $(CC_FLAGS_FTRACE) -Os $(CC=
_FLAGS_SCS) \
> >                         $(CC_FLAGS_LTO) $(CC_FLAGS_CFI) \
> >                         -Wmissing-prototypes -Wmissing-declarations
> >
> > -CC_FLAGS_ADD_VDSO :=3D -O2 -mcmodel=3Dtiny -fasynchronous-unwind-table=
s
> > +CC_FLAGS_ADD_VDSO :=3D -O2 -mcmodel=3Dtiny -fasynchronous-unwind-table=
s $(CONFIG_CC_OPT_INLINE_MEMSET)
> >
> >  CFLAGS_REMOVE_vgettimeofday.o =3D $(CC_FLAGS_REMOVE_VDSO)
> >  CFLAGS_REMOVE_vgetrandom.o =3D $(CC_FLAGS_REMOVE_VDSO)
> > diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefil=
e
> > index 9c9181bb4071..0b84892d084b 100644
> > --- a/arch/loongarch/vdso/Makefile
> > +++ b/arch/loongarch/vdso/Makefile
> > @@ -16,6 +16,7 @@ ccflags-vdso :=3D \
> >         $(filter -m64,$(KBUILD_CFLAGS)) \
> >         $(filter -march=3D%,$(KBUILD_CFLAGS)) \
> >         $(filter -m%-float,$(KBUILD_CFLAGS)) \
> > +       $(CONFIG_CC_OPT_INLINE_MEMSET) \
> >         $(CLANG_FLAGS) \
> >         -D__VDSO__
> >
> > diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vd=
so/Makefile
> > index 368759f81708..0d1a49529885 100644
> > --- a/arch/powerpc/kernel/vdso/Makefile
> > +++ b/arch/powerpc/kernel/vdso/Makefile
> > @@ -43,6 +43,7 @@ ccflags-y :=3D -fno-common -fno-builtin -DBUILD_VDSO
> >  ccflags-y +=3D $(DISABLE_LATENT_ENTROPY_PLUGIN)
> >  ccflags-y +=3D $(call cc-option, -fno-stack-protector)
> >  ccflags-y +=3D -DDISABLE_BRANCH_PROFILING
> > +ccflags-y +=3D $(CONFIG_CC_OPT_INLINE_MEMSET)
> >  ccflags-y +=3D -ffreestanding -fasynchronous-unwind-tables
> >  ccflags-remove-y :=3D $(CC_FLAGS_FTRACE)
> >  ldflags-y :=3D -Wl,--hash-style=3Dboth -nostdlib -shared -z noexecstac=
k $(CLANG_FLAGS)
> > diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/M=
akefile
> > index 8dbf2532a573..c023046a3fd7 100644
> > --- a/arch/riscv/kernel/vdso/Makefile
> > +++ b/arch/riscv/kernel/vdso/Makefile
> > @@ -36,6 +36,7 @@ endif
> >  ccflags-y :=3D -fno-stack-protector
> >  ccflags-y +=3D -DDISABLE_BRANCH_PROFILING
> >  ccflags-y +=3D -fno-builtin
> > +ccflags-y +=3D $(CONFIG_CC_OPT_INLINE_MEMSET)
> >  ccflags-y +=3D $(KBUILD_BASE_ISA)$(CFI_MARCH)
> >  ccflags-y +=3D $(CFI_FULL)
> >  asflags-y +=3D $(KBUILD_BASE_ISA)$(CFI_MARCH)
> > diff --git a/arch/s390/kernel/vdso/Makefile b/arch/s390/kernel/vdso/Mak=
efile
> > index 35c834b895ec..54bcf2984ca1 100644
> > --- a/arch/s390/kernel/vdso/Makefile
> > +++ b/arch/s390/kernel/vdso/Makefile
> > @@ -29,6 +29,7 @@ KBUILD_CFLAGS_VDSO :=3D $(filter-out -munaligned-symb=
ols,$(KBUILD_CFLAGS_VDSO))
> >  KBUILD_CFLAGS_VDSO :=3D $(filter-out -fno-asynchronous-unwind-tables,$=
(KBUILD_CFLAGS_VDSO))
> >  KBUILD_CFLAGS_VDSO +=3D -fPIC -fno-common -fno-builtin -fasynchronous-=
unwind-tables
> >  KBUILD_CFLAGS_VDSO +=3D -fno-stack-protector $(DISABLE_KSTACK_ERASE)
> > +KBUILD_CFLAGS_VDSO +=3D $(CONFIG_CC_OPT_INLINE_MEMSET)
> >  ldflags-y :=3D -shared -soname=3Dlinux-vdso.so.1 \
> >              --hash-style=3Dboth --build-id=3Dsha1 \
> >              $(call ld-option, --eh-frame-hdr) -T
> > diff --git a/arch/x86/entry/vdso/vdso64/Makefile b/arch/x86/entry/vdso/=
vdso64/Makefile
> > index 7c0790065b5e..c2353a065279 100644
> > --- a/arch/x86/entry/vdso/vdso64/Makefile
> > +++ b/arch/x86/entry/vdso/vdso64/Makefile
> > @@ -14,7 +14,7 @@ vobjs-$(CONFIG_X86_SGX)                       +=3D vs=
gx.o
> >  vobjs-$(CONFIG_FUTEX_ROBUST_UNLOCK)    +=3D vfutex.o
> >
> >  # Compilation flags
> > -flags-y                                :=3D -DBUILD_VDSO64 -m64 -mcmod=
el=3Dsmall
> > +flags-y                                :=3D -DBUILD_VDSO64 -m64 -mcmod=
el=3Dsmall $(CONFIG_CC_OPT_INLINE_MEMSET)
> >
> >  # The location of this include matters!
> >  include $(src)/../common/Makefile.include
> > diff --git a/init/Kconfig b/init/Kconfig
> > index 8583d9f06c52..ff3f8475dd2f 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -173,6 +173,13 @@ config CC_HAS_ALLOC_TOKEN
> >  config CC_HAS_MULTIDIMENSIONAL_NONSTRING
> >         def_bool $(success,echo 'char tag[][4] __attribute__((__nonstri=
ng__)) =3D { };' | $(CC) $(CLANG_FLAGS) -x c - -c -o /dev/null -Werror)
> >
> > +config CC_HAS_OPT_INLINE_MEMSET
> > +       def_bool $(cc-option,-finline-stringops=3Dmemset)
> > +
> > +config CC_OPT_INLINE_MEMSET
> > +       string
> > +       default "-finline-stringops=3Dmemset" if CC_HAS_OPT_INLINE_MEMS=
ET
> > +
> >  config LD_CAN_USE_KEEP_IN_OVERLAY
> >         # ld.lld prior to 21.0.0 did not support KEEP within an overlay=
 description
> >         # https://github.com/llvm/llvm-project/pull/130661
> > diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
> > index 2851afa9154f..f5cad5641985 100644
> > --- a/lib/vdso/getrandom.c
> > +++ b/lib/vdso/getrandom.c
> > @@ -29,6 +29,22 @@
> >         }                                                              =
         \
> >  } while (0)
> >
> > +#if __has_builtin(__builtin_memset_inline)
> > +#define memset_inline(dst, value, size) __builtin_memset_inline(dst, v=
alue, size)
> > +#elif IS_ENABLED(CONFIG_CC_HAS_OPT_INLINE_MEMSET)
> > +#define memset_inline(dst, value, size) __builtin_memset(dst, value, s=
ize)
> > +#else
> > +static inline void *memset_inline(void *dst, int value, size_t size)
> > +{
> > +       char *d =3D dst;
> > +
> > +       while (size--)
> > +               *d++ =3D value;
> > +
> > +       return d;
> > +}
> > +#endif
>
> Does this work?
> https://godbolt.org/z/Tx6EaGMfb

Hmmm...possibly.
https://godbolt.org/z/ec9rzd9Yf
I don't get it...

>
> (Sorry, I _should_ have replied to Jason on V1. I'm not ignoring him,
> just way behind on my code reviews. Sorry!)
>
> > +
> >  static void memcpy_and_zero_src(void *dst, void *src, size_t len)
> >  {
> >         if (IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)) {
> > @@ -83,8 +99,7 @@ __cvdso_getrandom_data(const struct vdso_rng_data *rn=
g_info, void *buffer, size_
> >                 params->size_of_opaque_state =3D sizeof(*state);
> >                 params->mmap_prot =3D PROT_READ | PROT_WRITE;
> >                 params->mmap_flags =3D MAP_DROPPABLE | MAP_ANONYMOUS;
> > -               for (size_t i =3D 0; i < ARRAY_SIZE(params->reserved); =
++i)
> > -                       params->reserved[i] =3D 0;
> > +               memset_inline(params->reserved, 0, sizeof(params->reser=
ved));
> >                 return 0;
> >         }
> >
> >
> > ---
> > base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> > change-id: 20260916-vdso-getrandom-avoid-memset-llvm-24-74d45fa6031e
> >
> > Best regards,
> > --
> > Cheers,
> > Nathan
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers
