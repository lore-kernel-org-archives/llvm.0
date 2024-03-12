Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4636A32C84
	for <llvm@lists.linux.dev>; Tue, 12 Mar 2024 07:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710228300; cv=none; b=IAozGqLlfY4/Xjx+1yxsS63/EG9prnSUUjeg01m7/12lteHfalvSlFL+2TR2VOtnqs/vScu0lT0Gd4cO08+pSGBw4vnYiAeCUSc+XVw0rVVCV6qiFp4aP/FccuUpBtGhOFnMZwTxKigDiIDWyEMi3pPePyUSUI/vl/9x0kXN2/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710228300; c=relaxed/simple;
	bh=8uEeNTBXQFR/hZBfL0Y/pxGEIZ1aJlxekFQLLu81C9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kg41wT5Iu0C4iWxWELw9zxPVOIbveXb8ots4ZZIBLZIzisPORYvIKlW7BhhFKm5eVMpNDjkdt8fx2vHr46u1OFB80+J/B/pMpn3dm2s0OXgcvqZABIMHitQ4TkdFFiSxEHugH/nRp4xLhK6Pp+f39CXvp7/oVLvQViS2R14WHzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C6AT6p7X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C6AT6p7X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB7B4C43390
	for <llvm@lists.linux.dev>; Tue, 12 Mar 2024 07:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710228299;
	bh=8uEeNTBXQFR/hZBfL0Y/pxGEIZ1aJlxekFQLLu81C9k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=C6AT6p7XmfFxFcTWZYOrpvGXsinG3rTJpLWpVtN25WYvDJyiQ42gNUH/olQNtO/3X
	 GdMEJbh/TgcVe94OOlKlEJNi1FwbImnBq7jKqfrCoePSdVy2zU5bv8lQ4NyId4CQp4
	 gqAC1CQ/AzoqBp3ms6imNQqJ1JHcWTYS8v1DOoOUvDzN4V+LTTe461fxT3KHCMGzRp
	 kzwY5o+XshSOxWFXhEG+58gZ0TJcRXbw6NiGdV4UjkZ2oxpwgp8rXnjgvMskJXiZIa
	 oC1v4bLXILeCHDTVN4VPEdSWo1LBkQ4F0lsk/YwfXORBrj580Yi7PtDJ/0lqSV3gR4
	 nbZiSF27X/DHA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51381021af1so4975431e87.0
        for <llvm@lists.linux.dev>; Tue, 12 Mar 2024 00:24:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8R/KrpE0FGFV3Yd6FWzWiQtjpjFVO51TcADE/P/deNBPUYGF8n+lXFZlfNxN19S4f1bQTsGBXk/Jeh8yxltWnkLx+NQ==
X-Gm-Message-State: AOJu0YzGLnifippWL4B8FYYoLQFcFhFM/NK5XlyL9Z4dgLO6b7uN2KF/
	e9PWPHHJ81BRuvWd7sXcKm/8C/FNHFJSqIpd0CC14ihJogoih7hsmhdK/ZCiAfEuSevkek9Lw/p
	hNEOfj6chQvvfRSeBa/tduOVzERg=
X-Google-Smtp-Source: AGHT+IH8fW6gV+Jt3+JGoXFTbLXCUFDpRv3ACVB7CBmubJ0Lqd9tObnNuJ3/QRUGTpt5m0XU23z2/yVbg3bcm4arSnc=
X-Received: by 2002:a05:6512:4014:b0:513:a6a7:ac88 with SMTP id
 br20-20020a056512401400b00513a6a7ac88mr5093062lfb.14.1710228297861; Tue, 12
 Mar 2024 00:24:57 -0700 (PDT)
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
 <CACRpkdbjjbRP5cED+qX5PGpvjvBEK9AxnGekVab=7WMrAPe+pQ@mail.gmail.com>
 <CABCJKuf7xmCBs8UrpEbeRtQnofuq2Pp4M=RGT4TUw1+HsvS_CA@mail.gmail.com>
 <CACRpkdaVkaM4ERUcK-3BqHK6O9hBtj4tEHZaQXbvW9Oh23c8Gw@mail.gmail.com>
 <CABCJKucJd-EG1yr6u5SvUW2Frxs3aBPCuo9TH83ba2chdkb7tw@mail.gmail.com> <CACRpkdZOsST_QtouokNgF0XRVSyoOJQr0cfAGTMjSCb7ezBLPg@mail.gmail.com>
In-Reply-To: <CACRpkdZOsST_QtouokNgF0XRVSyoOJQr0cfAGTMjSCb7ezBLPg@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 12 Mar 2024 08:24:45 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFHFBKbspu6yBg14KzLNv-jHHjHbnuYf1avZx8C9t6tsQ@mail.gmail.com>
Message-ID: <CAMj1kXFHFBKbspu6yBg14KzLNv-jHHjHbnuYf1avZx8C9t6tsQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] ARM: tlbflush: Make TLB flushes into static inlines
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, 
	"Russell King (Oracle)" <linux@armlinux.org.uk>, Kees Cook <keescook@chromium.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 12 Mar 2024 at 00:56, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
>
> On Mon, Mar 11, 2024 at 11:28=E2=80=AFPM Sami Tolvanen <samitolvanen@goog=
le.com> wrote:
> > On Mon, Mar 11, 2024 at 3:17=E2=80=AFPM Linus Walleij <linus.walleij@li=
naro.org> wrote:
> > >
> > >   LD      .tmp_vmlinux.kallsyms1
> > > ld.lld: error: undefined symbol: __kcfi_typeid_v7wbi_flush_user_tlb_r=
ange
> > > >>> referenced by arch/arm/mm/tlb-v7.o:(.text+0x0) in archive vmlinux=
.a
> > >
> > > ld.lld: error: undefined symbol: __kcfi_typeid_v7wbi_flush_kern_tlb_r=
ange
> > > >>> referenced by tlb-v7.S:60 (/mnt/storage/linus/linux-integrator/bu=
ild-vexpress/../arch/arm/mm/tlb-v7.S:60)
> > > >>>               arch/arm/mm/tlb-v7.o:(.text+0x40) in archive vmlinu=
x.a
> > >
> > > ld.lld: error: undefined symbol: __kcfi_typeid_v7wbi_tlb_fns
> > > >>> referenced by arch/arm/mm/tlb-v7.o:(.init.text+0x0) in archive vm=
linux.a
> >
> > Clang only emits __kcfi_typeid symbols for functions that are
> > address-taken in C code. You need to add __ADDRESSABLE(function)
> > references to a C file somewhere for functions that otherwise are not
> > address-taken.
>
> Hey it works. So for example if for these functions I also add:
>
> diff --git a/arch/arm/mm/flush.c b/arch/arm/mm/flush.c
> index d19d140a10c7..23eb0f9358cb 100644
> --- a/arch/arm/mm/flush.c
> +++ b/arch/arm/mm/flush.c
> @@ -18,6 +18,11 @@
>
>  #include "mm.h"
>
> +void v7wbi_flush_user_tlb_range(unsigned long, unsigned long, struct
> vm_area_struct *);
> +void v7wbi_flush_kern_tlb_range(unsigned long, unsigned long);
> +__ADDRESSABLE(v7wbi_flush_user_tlb_range);
> +__ADDRESSABLE(v7wbi_flush_kern_tlb_range);
>
> Then that works.
>
> The problem is that I also have to define all these function signatures t=
hat
> are never used in C and there are quite a few of them, if I start listing=
 them
> all and #ifdefining them for selected CPUs it's not going to be pretty.
>
> It can be done and they can be in a cfi-defs.c file though.
> And it's better than __nocfi.
>
> The complexity comes from the fact that arm can boot a kernel
> with support for several different CPU:s.
>
> The different CPU management functions are put in a list of supported
> processors by the linker, and then e.g. the tlb maintenance functions
> are dereferenced directly from *list->tlb in setup_processor()
> in arch/arm/kernel/setup.c.
>

Another option is to move the struct definitions to C entirely. For
example, the branch below implements this for the tlbflush code:

https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=3Darm=
-cfi

However, doing the same will be tricky for the proc_info structs, as
they have a member that contains a place-relative offset, and those
cannot be easily emitted in C (similar to the SMP_ON_UP hack in the
TLB code above).
