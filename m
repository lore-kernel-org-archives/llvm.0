Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C9647B423
	for <llvm@lists.linux.dev>; Fri, 25 Sep 2026 22:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790373664; cv=pass; b=cGE04tNBPjCYtevfHcISfNkgqsSI1MdGcIV6gzZRvR0ItvyKbGQSHUQXdDsjdM6PBb/LjPPAwDnhlwtLlZ69dvGfIZSLUWfuPQAG8RXiB1V8vOQ2uV/sxAEALMr6ltpxJwql1aDEY8QzBW2XbFZ1lYhOPCsfQb9akxjhrg1K+08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790373664; c=relaxed/simple;
	bh=LklSWknRMwfaVZQDpvI7pbaMGR+tZRKs+3Kj5yrKaHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cVsmR4K5WN1oXFrZRQp/kn9rjCf//K7D0yJJXgLL4fArzAnkGmQCiJIICV50V6dXgN46KXu9wCoo1aGUc9WozCgfWTiJGAa1Yu/V6UvSrDfCt0fPUKjmpArLWT9uK++Fc17T0kuv3Be0eqfe0WY8TO5durduqXSYWGLfKe0/LHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y+a4HyUs; arc=pass smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y+a4HyUs"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48879d4fd8aso752118f8f.2
        for <llvm@lists.linux.dev>; Fri, 25 Sep 2026 15:01:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790373659; cv=none;
        d=google.com; s=arc-20260327;
        b=czjKzAxpPnzp26tb5AdWT40wn8bR1oLHUpgNocP1ME+DDRju0z9SSG+V1WB7Do1pY5
         nSVQoUyVj1iSCAAycQbnNjl6SzDffcBmyI/9Q+CbgD+WSPkoMGe9hU/d203X5gDw8Huh
         gqXnKGtSZh+z2lqva018NvK1L5blSQSGooI6llSzV42zoi5Unc1ol42vWFsTIyFmPRBX
         jLYdIZjnn7aQigNK2hsyhcH9+uinW4P/QPByEP3ForLHcK+YebeAEyowPQFGK1xfqMSc
         xFdiy7p9gO2ba5DECPip2q/XmpeyE+mc+N1com2uH+UJ120pyMa98KmL7Wvx470wfzMe
         9thQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QlMEQu1qsaTBww97rVbchh8pOSM1CexDa8zo36TMiIs=;
        fh=MZwAu5l5Qr2V0N6sD7ktymiVkqkRzB7qaKhyUmM+nRQ=;
        b=ZQ4ZnsoMZyW8VhnFJ9yfbJerCAcCFbTeZgG3QYXc6gp/QZUbSFuRjIzuUXtIKEacRg
         HQzFtEj3qEX+Q2VH4J3mBib2vrEV8+LzbFZc3CfEeHizmxIQOj8otydkZCaPevf24VaL
         y6uqqrpIZ/0gkce8xAjHOXGeR2wKvWpuVvPegO22WIvgK8qTXEMZ1cIeP9MP6v85wRQy
         viyy2fpTrhmMHdmZpL1phzWC3g9qbMQnxkHfa8juRorqqQF9jTmC40WLZXY9ZvlfB02I
         jsp2xnmHlUcCESKONAARBt9ghqRaxK1strzBR4oofSjVBplupw20FSPRfguqLPSD2QDJ
         JDxg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790373659; x=1790978459; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QlMEQu1qsaTBww97rVbchh8pOSM1CexDa8zo36TMiIs=;
        b=Y+a4HyUsrYBL37o2+j+Co8LQADV6XzHZjXYtsLtXbvZgyS8Ijghog1EdUnQAvJLQ16
         nzzI7xxDw4QOy7tolOI+LPgRJoIKaHoKhZE7hOJz0z6sPnYMlJUsXbZ3Z2yqrFxRC7xM
         w9DK5/wKPKgskkYPg2uEz8KdB557gOCbtCF54sqhp0X2Lnjb+8NvCB6LVumXqdy1y7+v
         g06NqpsU+fZ/vFimySK9FX7fQGspSYE+vs/QHBWKN4oO62WNnatrX9iucm1eN/cKImAi
         zvfQIJqDPu1eV0s4wIoJeDFbX0rAgubYNEJWZzSCznDG7rrIgCBYhIyUR51QyMpZW7fL
         AQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790373659; x=1790978459;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QlMEQu1qsaTBww97rVbchh8pOSM1CexDa8zo36TMiIs=;
        b=HJOzhHtcuNgGz0+NSbSYsOEGMzkmAW2LdX+gfgNvIaABV5jKDJU39KBO8XE5sagWCx
         RybvYQ7cgAP5Wm+eeKWdibSNlKBko6Nfrb03gCtbXAVgonY3xXtrhyzJafKz+sUQ2FQT
         W3JKOuCHQAkBb86iUlgImYrrRjzM2ByTThQRfszrWTui0koemDgNRHc/eywVBHrsyWta
         af9HEPnGMAczv1TKZkAUxk2AoDOqqc4YdC/Ablc30onOc+K8CRIFZsgbB7gyfH0EUobD
         obgMyi/M8h2dhmJ+YlgcySJzd4xhUCAijHtWdoIqUZFJTELuW1+nKyup25F5vKgAb2nc
         0V6w==
X-Forwarded-Encrypted: i=1; AKwUvBzm7kfdRyl2v3TQLd/tEDbXJPN3OIglDc5uZfcpM2ntDREXw/9Wr8th8z20HJlkLLM7gvmW@lists.linux.dev
X-Gm-Message-State: AFuF++lQy58rb+2coAKpmLg1a3asWlY7aNUMSP6s1Kj0vfpFRL2v82Ot
	JicbMUxr7msZTPvQh+O6QMnhF6Yg6gCpkfpj4/SjvzAYSpbzHBuyZ9j4v2mHNC83AcFa9aw4tcg
	KAa1meuRaDqjf1W6PLrz/xjenMKCBkMsvoLE2daxJ
X-Gm-Gg: AYBFou3AR97WRuzR416Z083oiE2U3gQWuRkbmE5RK9ALt74taFTQMKe2GB8eHPK9xm/
	yIJa/uHbgdBIfajwM8B3o0RureOe9VKUqtVnlzl3VBSDxezApn0K6UHawuobESJ1hA10yXo93CL
	0tAjou6ovbMpnPmaY8JkcLAZ5KR1PHgUeMzAl5b/srKB7IGS/Cj7w/oDbAVbmZe6jRN983qJsci
	t/k0exckKMkfs+DXOmV2JHXBT7lBHg3enE8FonlplD2Q2p/dZ0krR92qdIHR8VXWHXa6iRT8f/k
	kSSIeMC+KC34+ygJ02N8LURVeYL3LFhkAmuZZQF2vQ3Pgv5UEcXIYwgBs3CD5w8F7zK1kmR9cQR
	ILn7/AVzkwSMpPRsHX4ciEtfZ1mkklFfsDQm4ObkwPNXKzoZtzN9wzC2lZBid+RjqZ4nJAw==
X-Received: by 2002:a05:6000:41f7:b0:487:27f6:a4d6 with SMTP id
 ffacd0b85a97d-488716b00eemr13403982f8f.38.1790373658191; Fri, 25 Sep 2026
 15:00:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
 <CAKwvOdmuvn0LZkYEsH84hnOGTYhTtzuWs3wMARtWdTeL6dD9sA@mail.gmail.com> <CAKwvOdnxKVpn=nAFaqP+9PTx4PqgHsUVWv6e60Pcr29W_eZrpQ@mail.gmail.com>
In-Reply-To: <CAKwvOdnxKVpn=nAFaqP+9PTx4PqgHsUVWv6e60Pcr29W_eZrpQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 25 Sep 2026 15:00:46 -0700
X-Gm-Features: AclHuK_Ut9cdmWvtWXJ4TZyUvK9Gsy2XhR4mB0KeYmSzL3PaZLLknagb6ZhED0Y
Message-ID: <CAKwvOdmNZL3eFvV3v77GXDzL+XLgz+BT9TA=my0yTnbsHqVeSg@mail.gmail.com>
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

On Fri, Sep 25, 2026 at 2:56=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Sep 25, 2026 at 2:53=E2=80=AFPM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Fri, Sep 25, 2026 at 2:46=E2=80=AFPM Nathan Chancellor <nathan@kerne=
l.org> wrote:
> > >
> > > After a recent change in LLVM [1], builds with the random vDSO
> > > implementation, such as PowerPC and RISC-V, fail when checking the vD=
SO:
> > >
> > >   arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not=
 supported
> > >   arch/riscv/kernel/vdso/vdso.so.dbg: dynamic relocations are not sup=
ported
> > >
> > > memset() is now generated when zeroing params->reserved for some buil=
ds
> > > because LLVM has an optimization (now run in more instances) that can
> > > recognize at compile time when it is assigning a static value to a
> > > contiguous area of memory and turn that into a call to memset(). Both
> > > clang and GCC assume memset() is always available [2].
> > >
> > > clang provides a builtin, __builtin_memset_inline [3][4], that can be
> > > used to ensure an external function call is not generated when zeroin=
g
> > > this memory. Use it when it is available.
> > >
> > > While GCC has no issues with the current code, it has generated memse=
t()
> > > before, as seen in commit b7bad082e113 ("random: vDSO: avoid call to =
out
> > > of line memset()"). GCC 14 provides '-finline-stringops=3Dmemset' [5]=
[6]
> > > with a similar guarantee to the clang builtin, so use it and
> > > __builtin_memset() when available.
> > >
> > > If no option is available, provide a simple memset_inline() like the =
one
> > > from lib/string.c to avoid adding an ugly ifdef.
> > >
> > > Link: https://github.com/llvm/llvm-project/commit/90cebef1411617fc3ee=
dd359bdf00cb44b1c2439 [1]
> > > Link: https://gcc.gnu.org/onlinedocs/gcc-16.2.0/gcc/Standards.html#in=
dex-ffreestanding [2]
> > > Link: https://github.com/llvm/llvm-project/commit/38637ee477541370a90=
b37f149069d8e5c0c2efd [3]
> > > Link: https://clang.llvm.org/docs/LanguageExtensions.html#guaranteed-=
inlined-memset [4]
> > > Link: https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D1ff6d9f7428=
b0668cd8ab0b3e3ab94f1d733124d [5]
> > > Link: https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html#index-=
finline-stringops [6]
> > > Suggested-by: "Jason A. Donenfeld" <Jason@zx2c4.com>
> > > Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > > ---
> > > Changes in v2:
> > > - Switch approach entirely (Jason, Nick)
> > >   - clang: use __builtin_memset_inline() to avoid external call
> > >   - GCC 14+: use __builtin_memset + -finline-stringops=3Dmemset (henc=
e the
> > >     massive CC list increase)
> > >   - GCC < 14: no issues currently but avoid ifdef with simple memset
> > >     implementation
> > > - Link to v1: https://patch.msgid.link/20260916-vdso-getrandom-avoid-=
memset-llvm-24-v1-1-80a92f2e225a@kernel.org
> > > ---
> > >  arch/arm64/kernel/vdso/Makefile     |  2 +-
> > >  arch/loongarch/vdso/Makefile        |  1 +
> > >  arch/powerpc/kernel/vdso/Makefile   |  1 +
> > >  arch/riscv/kernel/vdso/Makefile     |  1 +
> > >  arch/s390/kernel/vdso/Makefile      |  1 +
> > >  arch/x86/entry/vdso/vdso64/Makefile |  2 +-
> > >  init/Kconfig                        |  7 +++++++
> > >  lib/vdso/getrandom.c                | 19 +++++++++++++++++--
> > >  8 files changed, 30 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso=
/Makefile
> > > index 7dec05dd33b7..f6619e1cb2ce 100644
> > > --- a/arch/arm64/kernel/vdso/Makefile
> > > +++ b/arch/arm64/kernel/vdso/Makefile
> > > @@ -41,7 +41,7 @@ CC_FLAGS_REMOVE_VDSO :=3D $(CC_FLAGS_FTRACE) -Os $(=
CC_FLAGS_SCS) \
> > >                         $(CC_FLAGS_LTO) $(CC_FLAGS_CFI) \
> > >                         -Wmissing-prototypes -Wmissing-declarations
> > >
> > > -CC_FLAGS_ADD_VDSO :=3D -O2 -mcmodel=3Dtiny -fasynchronous-unwind-tab=
les
> > > +CC_FLAGS_ADD_VDSO :=3D -O2 -mcmodel=3Dtiny -fasynchronous-unwind-tab=
les $(CONFIG_CC_OPT_INLINE_MEMSET)
> > >
> > >  CFLAGS_REMOVE_vgettimeofday.o =3D $(CC_FLAGS_REMOVE_VDSO)
> > >  CFLAGS_REMOVE_vgetrandom.o =3D $(CC_FLAGS_REMOVE_VDSO)
> > > diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makef=
ile
> > > index 9c9181bb4071..0b84892d084b 100644
> > > --- a/arch/loongarch/vdso/Makefile
> > > +++ b/arch/loongarch/vdso/Makefile
> > > @@ -16,6 +16,7 @@ ccflags-vdso :=3D \
> > >         $(filter -m64,$(KBUILD_CFLAGS)) \
> > >         $(filter -march=3D%,$(KBUILD_CFLAGS)) \
> > >         $(filter -m%-float,$(KBUILD_CFLAGS)) \
> > > +       $(CONFIG_CC_OPT_INLINE_MEMSET) \
> > >         $(CLANG_FLAGS) \
> > >         -D__VDSO__
> > >
> > > diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/=
vdso/Makefile
> > > index 368759f81708..0d1a49529885 100644
> > > --- a/arch/powerpc/kernel/vdso/Makefile
> > > +++ b/arch/powerpc/kernel/vdso/Makefile
> > > @@ -43,6 +43,7 @@ ccflags-y :=3D -fno-common -fno-builtin -DBUILD_VDS=
O
> > >  ccflags-y +=3D $(DISABLE_LATENT_ENTROPY_PLUGIN)
> > >  ccflags-y +=3D $(call cc-option, -fno-stack-protector)
> > >  ccflags-y +=3D -DDISABLE_BRANCH_PROFILING
> > > +ccflags-y +=3D $(CONFIG_CC_OPT_INLINE_MEMSET)
> > >  ccflags-y +=3D -ffreestanding -fasynchronous-unwind-tables
> > >  ccflags-remove-y :=3D $(CC_FLAGS_FTRACE)
> > >  ldflags-y :=3D -Wl,--hash-style=3Dboth -nostdlib -shared -z noexecst=
ack $(CLANG_FLAGS)
> > > diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso=
/Makefile
> > > index 8dbf2532a573..c023046a3fd7 100644
> > > --- a/arch/riscv/kernel/vdso/Makefile
> > > +++ b/arch/riscv/kernel/vdso/Makefile
> > > @@ -36,6 +36,7 @@ endif
> > >  ccflags-y :=3D -fno-stack-protector
> > >  ccflags-y +=3D -DDISABLE_BRANCH_PROFILING
> > >  ccflags-y +=3D -fno-builtin
> > > +ccflags-y +=3D $(CONFIG_CC_OPT_INLINE_MEMSET)
> > >  ccflags-y +=3D $(KBUILD_BASE_ISA)$(CFI_MARCH)
> > >  ccflags-y +=3D $(CFI_FULL)
> > >  asflags-y +=3D $(KBUILD_BASE_ISA)$(CFI_MARCH)
> > > diff --git a/arch/s390/kernel/vdso/Makefile b/arch/s390/kernel/vdso/M=
akefile
> > > index 35c834b895ec..54bcf2984ca1 100644
> > > --- a/arch/s390/kernel/vdso/Makefile
> > > +++ b/arch/s390/kernel/vdso/Makefile
> > > @@ -29,6 +29,7 @@ KBUILD_CFLAGS_VDSO :=3D $(filter-out -munaligned-sy=
mbols,$(KBUILD_CFLAGS_VDSO))
> > >  KBUILD_CFLAGS_VDSO :=3D $(filter-out -fno-asynchronous-unwind-tables=
,$(KBUILD_CFLAGS_VDSO))
> > >  KBUILD_CFLAGS_VDSO +=3D -fPIC -fno-common -fno-builtin -fasynchronou=
s-unwind-tables
> > >  KBUILD_CFLAGS_VDSO +=3D -fno-stack-protector $(DISABLE_KSTACK_ERASE)
> > > +KBUILD_CFLAGS_VDSO +=3D $(CONFIG_CC_OPT_INLINE_MEMSET)
> > >  ldflags-y :=3D -shared -soname=3Dlinux-vdso.so.1 \
> > >              --hash-style=3Dboth --build-id=3Dsha1 \
> > >              $(call ld-option, --eh-frame-hdr) -T
> > > diff --git a/arch/x86/entry/vdso/vdso64/Makefile b/arch/x86/entry/vds=
o/vdso64/Makefile
> > > index 7c0790065b5e..c2353a065279 100644
> > > --- a/arch/x86/entry/vdso/vdso64/Makefile
> > > +++ b/arch/x86/entry/vdso/vdso64/Makefile
> > > @@ -14,7 +14,7 @@ vobjs-$(CONFIG_X86_SGX)                       +=3D =
vsgx.o
> > >  vobjs-$(CONFIG_FUTEX_ROBUST_UNLOCK)    +=3D vfutex.o
> > >
> > >  # Compilation flags
> > > -flags-y                                :=3D -DBUILD_VDSO64 -m64 -mcm=
odel=3Dsmall
> > > +flags-y                                :=3D -DBUILD_VDSO64 -m64 -mcm=
odel=3Dsmall $(CONFIG_CC_OPT_INLINE_MEMSET)
> > >
> > >  # The location of this include matters!
> > >  include $(src)/../common/Makefile.include
> > > diff --git a/init/Kconfig b/init/Kconfig
> > > index 8583d9f06c52..ff3f8475dd2f 100644
> > > --- a/init/Kconfig
> > > +++ b/init/Kconfig
> > > @@ -173,6 +173,13 @@ config CC_HAS_ALLOC_TOKEN
> > >  config CC_HAS_MULTIDIMENSIONAL_NONSTRING
> > >         def_bool $(success,echo 'char tag[][4] __attribute__((__nonst=
ring__)) =3D { };' | $(CC) $(CLANG_FLAGS) -x c - -c -o /dev/null -Werror)
> > >
> > > +config CC_HAS_OPT_INLINE_MEMSET
> > > +       def_bool $(cc-option,-finline-stringops=3Dmemset)
> > > +
> > > +config CC_OPT_INLINE_MEMSET
> > > +       string
> > > +       default "-finline-stringops=3Dmemset" if CC_HAS_OPT_INLINE_ME=
MSET
> > > +
> > >  config LD_CAN_USE_KEEP_IN_OVERLAY
> > >         # ld.lld prior to 21.0.0 did not support KEEP within an overl=
ay description
> > >         # https://github.com/llvm/llvm-project/pull/130661
> > > diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
> > > index 2851afa9154f..f5cad5641985 100644
> > > --- a/lib/vdso/getrandom.c
> > > +++ b/lib/vdso/getrandom.c
> > > @@ -29,6 +29,22 @@
> > >         }                                                            =
           \
> > >  } while (0)
> > >
> > > +#if __has_builtin(__builtin_memset_inline)
> > > +#define memset_inline(dst, value, size) __builtin_memset_inline(dst,=
 value, size)
> > > +#elif IS_ENABLED(CONFIG_CC_HAS_OPT_INLINE_MEMSET)
> > > +#define memset_inline(dst, value, size) __builtin_memset(dst, value,=
 size)
> > > +#else
> > > +static inline void *memset_inline(void *dst, int value, size_t size)
> > > +{
> > > +       char *d =3D dst;
> > > +
> > > +       while (size--)
> > > +               *d++ =3D value;
> > > +
> > > +       return d;
> > > +}
> > > +#endif
> >
> > Does this work?
> > https://godbolt.org/z/Tx6EaGMfb
>
> Hmmm...possibly.
> https://godbolt.org/z/ec9rzd9Yf
> I don't get it...

Just keep it under 2 pages, it will be fine:
https://godbolt.org/z/qqoMqfxev

>
> >
> > (Sorry, I _should_ have replied to Jason on V1. I'm not ignoring him,
> > just way behind on my code reviews. Sorry!)
> >
> > > +
> > >  static void memcpy_and_zero_src(void *dst, void *src, size_t len)
> > >  {
> > >         if (IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)) {
> > > @@ -83,8 +99,7 @@ __cvdso_getrandom_data(const struct vdso_rng_data *=
rng_info, void *buffer, size_
> > >                 params->size_of_opaque_state =3D sizeof(*state);
> > >                 params->mmap_prot =3D PROT_READ | PROT_WRITE;
> > >                 params->mmap_flags =3D MAP_DROPPABLE | MAP_ANONYMOUS;
> > > -               for (size_t i =3D 0; i < ARRAY_SIZE(params->reserved)=
; ++i)
> > > -                       params->reserved[i] =3D 0;
> > > +               memset_inline(params->reserved, 0, sizeof(params->res=
erved));
> > >                 return 0;
> > >         }
> > >
> > >
> > > ---
> > > base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> > > change-id: 20260916-vdso-getrandom-avoid-memset-llvm-24-74d45fa6031e
> > >
> > > Best regards,
> > > --
> > > Cheers,
> > > Nathan
> > >
> >
> >
> > --
> > Thanks,
> > ~Nick Desaulniers
>
>
>
> --
> Thanks,
> ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers
