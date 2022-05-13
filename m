Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86027A
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 18:58:34 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id e12so16776390ybc.11
        for <llvm@lists.linux.dev>; Fri, 13 May 2022 11:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=02bZSBbdZpbMienU0f0GkvMBjpGYQFPReGOpzqBS+84=;
        b=WXzMNBVbaitFxJUhvtCQ3go+3zVBpzts7xM9wXJgWoOfEF5uEVq9HO1fAVOlJfI/Y+
         PGFVJnQ1P883n8WuFDAtl8nS4qIKuLZpV8H7pukUq9L3kCvp67/IhHUVZIZM0j6BFJBQ
         nJ53Pnybhy+mzLjxD0cdG4uiEcMe/Ui6QaSfhLgzJzbEPLXkIGDzvSGQqLxbxD+RKSgT
         13Wh/iigTHwXF5F5xhRkVUTuar6xyH4uRnZR61uy9pk0jzql817SPqRCkx1e9o7Obi2j
         5oK1lLbLocYVIKJy+czQ6p1XOuupkXby+ZNuobcFir1IS8ZxV5RWF63qLdl8hzwHzMfH
         Xo7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=02bZSBbdZpbMienU0f0GkvMBjpGYQFPReGOpzqBS+84=;
        b=6wzN++wxanLY0c+H3dvexAfc5GvsFfwFxT07FZpdufieWjddTVtIHGTQbFV6lwgkoA
         3TBkxIlSapbYIvOVDjdcX7SWnrPnt4wl30my/K1nhfoL563ptN9NsPb/knAQasMH437M
         qbs47f+bzyALUpc9Ra/Y9QcYx2LBgDTHDtg8qV8QRNmgWfRNRJsORPa1nFRi4Xvrp+M5
         S6+cpAm/HL+8FGFGBJVy3OIjiBWaS7pPgXSfqIan4FItPayCUZP2ynbN2PwE3oMGUg5Z
         NDGdmINztOOwEGwv41TepR30RnzNXBeCUxHj3IMNOQWcfZOVjKpQzSNJf/6pUq9g1XZ5
         jq+g==
X-Gm-Message-State: AOAM5326X8Vm4NLJWgd8M7zkcPhDEtJ3EUCK2Q6ZNIn5aIh1iADdUnbG
	TguXip82ftYeK30qDmHCpYlg3uTtBeKtzoigB094SA==
X-Google-Smtp-Source: ABdhPJy9HhDn2TLWZbJP/TgsCiMxn3GSJtMr0RkwZ6jaXNfX9LhRY5HbbOc3omECV6csQaJLoRWCYtDm9L+ATWMYjEE=
X-Received: by 2002:a25:bccb:0:b0:645:e18a:7f9b with SMTP id
 l11-20020a25bccb000000b00645e18a7f9bmr6038788ybm.220.1652468313480; Fri, 13
 May 2022 11:58:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220512205545.992288-1-twd2.me@gmail.com> <CAKwvOdmJ26h4L=3+42xeWG0_mZmZXkye=+mNWgFOHbo59ZVz1w@mail.gmail.com>
 <30f9c99e-9bc4-9369-a533-7b454a213403@gmail.com>
In-Reply-To: <30f9c99e-9bc4-9369-a533-7b454a213403@gmail.com>
From: =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Date: Fri, 13 May 2022 11:58:22 -0700
Message-ID: <CAFP8O3Lm2GbcVCWLx6P3oO4qi_6ZV_c8ETPes6jQh=qdvHzcLQ@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: build: Allow LTO to be selected
To: twd2 <twd2.me@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, nathan@kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 13, 2022 at 11:28 AM twd2 <twd2.me@gmail.com> wrote:
>
> =E5=9C=A8 2022/5/13 5:34, Nick Desaulniers =E5=86=99=E9=81=93:
> > On Thu, May 12, 2022 at 1:56 PM Wende Tan <twd2.me@gmail.com> wrote:
> >> Allow LTO to be selected for RISC-V, only when LLD >=3D 14, since ther=
e is an
> >> issue [1] in prior LLD versions that prevents LLD to generate proper
> >> machine code for RISC-V when writing `nop`s.
> >>
> >> I have tested enabling LTO for `defconfig`. The LLD took ~2m21s and ~3=
GiB
> >> on our Intel Xeon Gold 6140 server and produced an 18MiB Image. The im=
age
> >> can boot to shell using an archriscv rootfs on QEMU.
> >>
> >> I have also tested it for `allyesconfig` without COMPILE_TEST, FTRACE,
> >> KASAN, and GCOV. The LLD took ~7h03m and ~335GiB on the server,
> > Haha! That's ok, allyesconfig is not expected to boot for any
> > architectures AFAIK. For CI, we simply verify we can build them; we
> > boot test everything but allyesconfig and allmodconfig (and
> > architectures which don't yet have qemu ports).  It helps detect when
> > assembler sources don't use enough encoding space when referenced
> > external symbols are too far away for larger images, IME.
> >
> > That's a long time; first time I've seen a number from someone trying
> > to LTO allyesconfig!
> >
> >> successfully producing a 1.7GiB Image. Unfortunately, we cannot boot t=
his
> >> image because the `create_kernel_page_table()` -> `alloc_pmd_early()` =
->
> >> `BUG_ON()` logic limits the image to be < 1GiB. Maybe we can fix it in=
 a
> >> separate patch further.
> >>
> >> [1] https://github.com/llvm/llvm-project/issues/50505, resolved by LLV=
M
> >>     commit e63455d5e0e5 ("[MC] Use local MCSubtargetInfo in writeNops"=
)
> > So looking at that change, it doesn't look like it touches LLD at all.
> > To me it touches both the assembler and the object streamer, which is
> > used by the compiler (and assembler) to stream instructions directly
> > into an object file (without the need for an external assembler).
> >
> > That makes me think that
> > CLANG_VERSION >=3D 140000
> > would be more appropriate than
> > LLD_VERSION >=3D 140000
> >
> > WDYT?
>
>
> It seems that when LTO is enabled, the compiler (clang) only generates bi=
tcode, and LLD collects all the bitcode, does LTO, and generates machine co=
de (assembly) and ELF object files? Actually, the error message in #50505 w=
as originally reported by LLD. So I'd like to check LLD_VERSION here.

lld calls into llvm/lib/LTO which in turn uses llvm/lib/MC to write a
relocatable object file.
In this sense, it's the lld version which matters, but I think use
either clang/lld version is ok.

Technically one can use clang 13 and do LTO with lld 14 thanks to
bitcode compatibility. In this sense the lib/MC specific change only
requires lld version.

> >
> > Also, I'm curious if the LLVM patch you had me commit for you recently
> > is at all related or necessary for this? If so, then the version check
> > should probably be against clang-15, not clang-14.
> > https://github.com/llvm/llvm-project/commit/6baaad740a5abb4bfcff022a811=
4abb4eea66a2d
>
>
> Aha, that patch is for enabling LTO for allyesconfig (especially, with xf=
s and overlayfs). I think that patch is not mandatory for enabling LTO for =
RISC-V.
>
>
> > Anyways, I just did a build+boot (in qemu) test of defconfig+thinlto
> > and defconfig+lto. LGTM
> >
> > Tested-by: Nick Desaulniers <ndesaulniers@google.com>
>
>
> Thanks,
> Wende
>
>
> >> Tested-by: Wende Tan <twd2.me@gmail.com>
> >> Signed-off-by: Wende Tan <twd2.me@gmail.com>
> >> ---
> >> v2:
> >> - Some textual changes suggested by Nick.
> >> - Drop the changes to `arch/riscv/Makefile`, since the LLVM issue is f=
iled
> >>   and resolved.
> >> - Drop the unnecessary changes to `arch/riscv/kernel/vdso/Makefile`.
> >>
> >> v1: https://lore.kernel.org/linux-riscv/20210719205208.1023221-1-twd2.=
me@gmail.com/
> >> ---
> >>  arch/riscv/Kconfig | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> >> index 00fd9c548f26..c55f6b95e5af 100644
> >> --- a/arch/riscv/Kconfig
> >> +++ b/arch/riscv/Kconfig
> >> @@ -38,6 +38,10 @@ config RISCV
> >>         select ARCH_SUPPORTS_ATOMIC_RMW
> >>         select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
> >>         select ARCH_SUPPORTS_HUGETLBFS if MMU
> >> +       # LLD >=3D 14:
> >> +       # - https://github.com/llvm/llvm-project/issues/50505
> >> +       select ARCH_SUPPORTS_LTO_CLANG if LLD_VERSION >=3D 140000
> >> +       select ARCH_SUPPORTS_LTO_CLANG_THIN if LLD_VERSION >=3D 140000
> >>         select ARCH_USE_MEMTEST
> >>         select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
> >>         select ARCH_WANT_FRAME_POINTERS
> >> --
> >> 2.25.1
> >>



--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
