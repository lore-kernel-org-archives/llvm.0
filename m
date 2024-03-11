Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7195557304
	for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 22:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710195456; cv=none; b=dZijMhFm7ynMI3mxDHM0KTZX7G8KE5QWU074uHasKy88yf86oecD+xcpLIkQLuq9UusIkf+jra5fb0GNU7rriwRF7gjC/lwMaWDqW2YK4ekJDtOcSCq9WAOHfd3Z+gc7P1l/b/5mZqAlihlBX2KM+a0DBLZo6QZx0gw2v0hxIF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710195456; c=relaxed/simple;
	bh=fn1z9oyBLiDviCDBbJXHnMSfsuDJz0nM5MFrKKdLHxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OgtAldi1U/TlT22IYuUl1/CW3rpgdxe95bsIRViMBqE4mSCe8Rv9+OcDDAKajJmVlQqqALjJWwv/AwIPb418hsdeAq9i/oO0djJ38WGzvP19YJ7VSZR3NJjiItMu3RZqC1MywiBZWzcD01zps4BYy4gKlpUeNQhAbMFri49yt1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KjQijRsM; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KjQijRsM"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dcbf82cdf05so3307576276.2
        for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 15:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710195453; x=1710800253; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgY08BDKr9caA0oMdOywnpsuJL/IqetcUywy4fpg5g0=;
        b=KjQijRsMLM/806uLM6xKIgjHfCo9chhp1c9RyugM4/7K7hvOEA/untIZnAZB8Kymud
         LK/qxc09hDKvXBVRYsl5rBRrxAParuZAKV4IEZVcSty85Z0BzxqsNxD2ZYVHB7rSMuvE
         n0bckCBoKPyksharepqe4k9CfjYTWgWBtrvXXA8VVmSsA2jQnJpLgqqjojWWfkaz/YMV
         3quvBjusCieiEF1XmHVXsU5PX4JGoVPrEbVx5prNn55XfhoHZliXC2M/i2Yzgwmm5Gtk
         lSvof2sh55zMHuUUdNy5kNNSwViflZiD4Yj19iTFKPPDMh+NaoX72D8kx+XhhG+qm0BL
         arOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710195453; x=1710800253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgY08BDKr9caA0oMdOywnpsuJL/IqetcUywy4fpg5g0=;
        b=ldEn/RVBiOqS5tVKEG4iLj/fK0wuSxDM/unpFg5VdlIMzwRq2DqiPke48941ueD/5T
         +0tTFR20whynl5T7szTBYtg+s/V3Um73fVMYtCLUm/pbP+BTmW50cB1eAortB79E89pv
         Nc8BgepTwXYxNne0oMri8jw4Eb1JL6xKWnFX+cWWPMCO2aUn3pKeUA1RPXsndVX5zReW
         gBDBKsegZS1g0JmNp0NzVTXHfnSK/E+8js/tOYBD69N+SCpCbhmhRqFGrAUu4I70Jv7N
         8Mq4vC2cAI/vYpiSsd6nVqIOAULln8deNtLZmp9z9IEQnEhFDKftB3c/i+bmk0ee2TXW
         Acqw==
X-Forwarded-Encrypted: i=1; AJvYcCWGpMxoehHZu7pJt/4a2+Gw/uZdqSWQebvfThkUGi9a1di7Qj5Z54UsPzkfFmwRPLpzHEUlvw4G5udvfECk0MLjUo816Q==
X-Gm-Message-State: AOJu0Yyqgbprq3vSNWA5JkqVb6itbi77iaQGT8m7GdAceY+oK84cvU74
	y0uglDPcijsKT0P5GD/O2o43ZM3md78oGf3e6pldrGGxusT/D6qBeMtGUWPKnnohCnTsu9glf0k
	9Zs5aK1xkOcl2SfRHMAbj2l34z8l4voUtIEMyPQ==
X-Google-Smtp-Source: AGHT+IHGWFp/MXfS7yHTKRnsVbQ+xwG07mMLY2Q0HyRnvDHa+DrLHNF2pJXkKDe+sYace6PE5NsERuINnzGG0QVmb8w=
X-Received: by 2002:a5b:70a:0:b0:dcc:d694:b4a6 with SMTP id
 g10-20020a5b070a000000b00dccd694b4a6mr5502111ybq.15.1710195453334; Mon, 11
 Mar 2024 15:17:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240311-arm32-cfi-v3-0-224a0f0a45c2@linaro.org>
 <20240311-arm32-cfi-v3-2-224a0f0a45c2@linaro.org> <Ze7RNalwiZbceFxX@shell.armlinux.org.uk>
 <CAMj1kXHNK+peQUjO4dRnQmLDF+4of0F7cOTSoMPKucMT6NiGDw@mail.gmail.com>
 <CABCJKuf6CWw5Ff955H5qD1Nva-j3WJZ-5A7Rb1TyBwCaEd3E2A@mail.gmail.com>
 <CACRpkdbjjbRP5cED+qX5PGpvjvBEK9AxnGekVab=7WMrAPe+pQ@mail.gmail.com> <CABCJKuf7xmCBs8UrpEbeRtQnofuq2Pp4M=RGT4TUw1+HsvS_CA@mail.gmail.com>
In-Reply-To: <CABCJKuf7xmCBs8UrpEbeRtQnofuq2Pp4M=RGT4TUw1+HsvS_CA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Mar 2024 23:17:21 +0100
Message-ID: <CACRpkdaVkaM4ERUcK-3BqHK6O9hBtj4tEHZaQXbvW9Oh23c8Gw@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] ARM: tlbflush: Make TLB flushes into static inlines
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2024 at 10:37=E2=80=AFPM Sami Tolvanen <samitolvanen@google=
.com> wrote:
> On Mon, Mar 11, 2024 at 7:51=E2=80=AFPM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> > On Mon, Mar 11, 2024 at 4:35=E2=80=AFPM Sami Tolvanen <samitolvanen@goo=
gle.com> wrote:
> > > On Mon, Mar 11, 2024 at 3:04=E2=80=AFAM Ard Biesheuvel <ardb@kernel.o=
rg> wrote:
> > >>
> > > > This works for some function attributes (e.g., __efiapi is used lik=
e
> > > > this), but the attribute specifier to which __nocfi resolves does n=
ot
> > > > appear to be usable in the same manner.
> > > >
> > > > Best would be to annotate the asm code using
> > > > SYM_TYPED_FUNC_START/_END, so that the CFI machinery is invoked at =
the
> > > > call site to validate the function type of the destination.
> > >
> > > Agreed, ideally we would annotate indirectly called assembly function=
s
> > > with CFI types and avoid __nocfi wrappers.
> >
> > I'm taking a stab at SYM_TYPED_FUNC_* for ARM, as we don't have them
> > yet.
>
> Does the default implementation in include/linux/cfi_types.h not work
> on arm for some reason?

For example I try to switch over the TLB symbols like this:

diff --git a/arch/arm/mm/proc-macros.S b/arch/arm/mm/proc-macros.S
index e43f6d716b4b..bbe47ca32e55 100644
--- a/arch/arm/mm/proc-macros.S
+++ b/arch/arm/mm/proc-macros.S
@@ -341,7 +341,7 @@ ENTRY(\name\()_cache_fns)
 .macro define_tlb_functions name:req, flags_up:req, flags_smp
        .type   \name\()_tlb_fns, #object
        .align 2
-ENTRY(\name\()_tlb_fns)
+SYM_TYPED_FUNC_START(\name\()_tlb_fns)
        .long   \name\()_flush_user_tlb_range
        .long   \name\()_flush_kern_tlb_range
        .ifnb \flags_smp
diff --git a/arch/arm/mm/tlb-v7.S b/arch/arm/mm/tlb-v7.S
index 35fd6d4f0d03..aff9d884c30d 100644
--- a/arch/arm/mm/tlb-v7.S
+++ b/arch/arm/mm/tlb-v7.S
@@ -10,6 +10,7 @@
  */
 #include <linux/init.h>
 #include <linux/linkage.h>
+#include <linux/cfi_types.h>
 #include <asm/assembler.h>
 #include <asm/asm-offsets.h>
 #include <asm/page.h>
@@ -31,7 +32,7 @@
  *     - the "Invalidate single entry" instruction will invalidate
  *       both the I and the D TLBs on Harvard-style TLBs
  */
-ENTRY(v7wbi_flush_user_tlb_range)
+SYM_TYPED_FUNC_START(v7wbi_flush_user_tlb_range)
        vma_vm_mm r3, r2                        @ get vma->vm_mm
        mmid    r3, r3                          @ get vm_mm->context.id
        dsb     ish
@@ -57,7 +58,7 @@ ENTRY(v7wbi_flush_user_tlb_range)
        blo     1b
        dsb     ish
        ret     lr
-ENDPROC(v7wbi_flush_user_tlb_range)
+SYM_FUNC_END(v7wbi_flush_user_tlb_range)

 /*
  *     v7wbi_flush_kern_tlb_range(start,end)
@@ -67,7 +68,7 @@ ENDPROC(v7wbi_flush_user_tlb_range)
  *     - start - start address (may not be aligned)
  *     - end   - end address (exclusive, may not be aligned)
  */
-ENTRY(v7wbi_flush_kern_tlb_range)
+SYM_TYPED_FUNC_START(v7wbi_flush_kern_tlb_range)
        dsb     ish
        mov     r0, r0, lsr #PAGE_SHIFT         @ align address
        mov     r1, r1, lsr #PAGE_SHIFT
@@ -86,7 +87,7 @@ ENTRY(v7wbi_flush_kern_tlb_range)
        dsb     ish
        isb
        ret     lr
-ENDPROC(v7wbi_flush_kern_tlb_range)
+SYM_FUNC_END(v7wbi_flush_kern_tlb_range)

        __INIT


Compiling results in:

  AR      vmlinux.a
  LD      vmlinux.o
  OBJCOPY modules.builtin.modinfo
  GEN     modules.builtin
  MODPOST vmlinux.symvers
  UPD     include/generated/utsversion.h
  CC      init/version-timestamp.o
  LD      .tmp_vmlinux.kallsyms1
ld.lld: error: undefined symbol: __kcfi_typeid_v7wbi_flush_user_tlb_range
>>> referenced by arch/arm/mm/tlb-v7.o:(.text+0x0) in archive vmlinux.a

ld.lld: error: undefined symbol: __kcfi_typeid_v7wbi_flush_kern_tlb_range
>>> referenced by tlb-v7.S:60 (/mnt/storage/linus/linux-integrator/build-ve=
xpress/../arch/arm/mm/tlb-v7.S:60)
>>>               arch/arm/mm/tlb-v7.o:(.text+0x40) in archive vmlinux.a

ld.lld: error: undefined symbol: __kcfi_typeid_v7wbi_tlb_fns
>>> referenced by arch/arm/mm/tlb-v7.o:(.init.text+0x0) in archive vmlinux.=
a

Yours,
Linus Walleij
