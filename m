Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4B57A
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 19:32:07 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-2f7c57ee6feso100793807b3.2
        for <llvm@lists.linux.dev>; Fri, 13 May 2022 12:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=g9jozIlrUiK0Uy0Ub6wpuI6UMkJrlbCQvPouQjWmss8=;
        b=JtSTYKB1mEHiVoE7Jrp+wMTE+zVzVIec6BSbhx9bg3Gq4xvqIcDeYf2AE7ezR5yoUF
         hwnM6qRNKt96i22ynZIKyv/H+1/xtuo960X4yzan3E8YrA2yODQQVjsxTD8M3BYZBN8h
         GT0iV68Cp2k52mJiAQWW4WcWiCQOv83DdygetAvcFh8qRu+Zr67qFlpiBsXzEMtpGI1M
         prmZvlAfl1GL2NBqKCpOaEDqRPYo/RTj/kDQFicuK4UM5CztXG/jfu46Mdtq/N2PiP0+
         +hBCO6PZQNS0QkHg7Edqpvh1lh78XgNsqtf+otVkxOzn84KiWXam4Eo00JgGj5WfZ5T5
         n+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=g9jozIlrUiK0Uy0Ub6wpuI6UMkJrlbCQvPouQjWmss8=;
        b=drsR2Kzo59lhIX5qDfWjI0L3+S1olYk7449U0beUI3kRt+BOhTbV/jnecYqGFagpAb
         J7mdAmBs5SmQAAXroXNfq6LFjs6RQNrNFxnWi1Brilu17G/StE+Lc2mFgYS1yVaD8t/v
         8IKIii3fjfWXywxt+P3A65sU20K/ksL+SITGAhiLVN4mBQQL0YQY8qSDqhtqzLZsNGgK
         beD9JtWrdy4KZ0faEVFV47Sjm8SieYeG5iBb2/glNqLKLDlY1LZfltKGKmRCYrNiQ348
         WkL5DHHTE85kKsVbDh/jrsG/I6sGeAIJU+TcIqeSVhWzGJ6/2OpUaHgKdh1bndKAmaXN
         X9oA==
X-Gm-Message-State: AOAM533o4DEniAZv1kC2pHDauhapgeSnBygEVG9kfjUoLCS/vyRUM2ku
	AQ2JfoO1qLCjSmuE6sRjMwlqXTdVDa0VQL2s6Ate7A==
X-Google-Smtp-Source: ABdhPJyzD1b/YIv9Z4P17gkxxv4DymNKKC+6m6YIStji05zjoCrVz+d8rea7lM7vt1mQbnhcHUwkrOtr01qWuHCowf8=
X-Received: by 2002:a05:690c:90:b0:2f1:9b7a:ceec with SMTP id
 be16-20020a05690c009000b002f19b7aceecmr7896688ywb.308.1652470326072; Fri, 13
 May 2022 12:32:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220512205545.992288-1-twd2.me@gmail.com> <CAKwvOdmJ26h4L=3+42xeWG0_mZmZXkye=+mNWgFOHbo59ZVz1w@mail.gmail.com>
 <30f9c99e-9bc4-9369-a533-7b454a213403@gmail.com> <CAKwvOdnSRA_1wO8bb3tuGCunPjx_pQDi2_0O9yQLbk-TRR3dyA@mail.gmail.com>
In-Reply-To: <CAKwvOdnSRA_1wO8bb3tuGCunPjx_pQDi2_0O9yQLbk-TRR3dyA@mail.gmail.com>
From: =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Date: Fri, 13 May 2022 12:31:55 -0700
Message-ID: <CAFP8O3J2s1RoUu7JG5AT6kWuvZ6EmEsbtQ7Z5rOFwBQmoJoA3w@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: build: Allow LTO to be selected
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: twd2 <twd2.me@gmail.com>, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, nathan@kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 13, 2022 at 12:30 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, May 13, 2022 at 11:28 AM twd2 <twd2.me@gmail.com> wrote:
> >
> > =E5=9C=A8 2022/5/13 5:34, Nick Desaulniers =E5=86=99=E9=81=93:
> > > On Thu, May 12, 2022 at 1:56 PM Wende Tan <twd2.me@gmail.com> wrote:
> > >> Allow LTO to be selected for RISC-V, only when LLD >=3D 14, since th=
ere is an
> > >> issue [1] in prior LLD versions that prevents LLD to generate proper
> > >> machine code for RISC-V when writing `nop`s.
> > >>
> > >> I have tested enabling LTO for `defconfig`. The LLD took ~2m21s and =
~3GiB
> > >> on our Intel Xeon Gold 6140 server and produced an 18MiB Image. The =
image
> > >> can boot to shell using an archriscv rootfs on QEMU.
> > >>
> > >> I have also tested it for `allyesconfig` without COMPILE_TEST, FTRAC=
E,
> > >> KASAN, and GCOV. The LLD took ~7h03m and ~335GiB on the server,
> > > Haha! That's ok, allyesconfig is not expected to boot for any
> > > architectures AFAIK. For CI, we simply verify we can build them; we
> > > boot test everything but allyesconfig and allmodconfig (and
> > > architectures which don't yet have qemu ports).  It helps detect when
> > > assembler sources don't use enough encoding space when referenced
> > > external symbols are too far away for larger images, IME.
> > >
> > > That's a long time; first time I've seen a number from someone trying
> > > to LTO allyesconfig!
> > >
> > >> successfully producing a 1.7GiB Image. Unfortunately, we cannot boot=
 this
> > >> image because the `create_kernel_page_table()` -> `alloc_pmd_early()=
` ->
> > >> `BUG_ON()` logic limits the image to be < 1GiB. Maybe we can fix it =
in a
> > >> separate patch further.
> > >>
> > >> [1] https://github.com/llvm/llvm-project/issues/50505, resolved by L=
LVM
> > >>     commit e63455d5e0e5 ("[MC] Use local MCSubtargetInfo in writeNop=
s")
> > > So looking at that change, it doesn't look like it touches LLD at all=
.
> > > To me it touches both the assembler and the object streamer, which is
> > > used by the compiler (and assembler) to stream instructions directly
> > > into an object file (without the need for an external assembler).
> > >
> > > That makes me think that
> > > CLANG_VERSION >=3D 140000
> > > would be more appropriate than
> > > LLD_VERSION >=3D 140000
> > >
> > > WDYT?
> >
> >
> > It seems that when LTO is enabled, the compiler (clang) only generates =
bitcode, and LLD collects all the bitcode, does LTO, and generates machine =
code (assembly) and ELF object files? Actually, the error message in #50505=
 was originally reported by LLD. So I'd like to check LLD_VERSION here.
>
> Ah, that's right. Ok, LGTM.
>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Fangrui Song <maskray@google.com>

> >
> >
> > >
> > > Also, I'm curious if the LLVM patch you had me commit for you recentl=
y
> > > is at all related or necessary for this? If so, then the version chec=
k
> > > should probably be against clang-15, not clang-14.
> > > https://github.com/llvm/llvm-project/commit/6baaad740a5abb4bfcff022a8=
114abb4eea66a2d
> >
> >
> > Aha, that patch is for enabling LTO for allyesconfig (especially, with =
xfs and overlayfs). I think that patch is not mandatory for enabling LTO fo=
r RISC-V.
> >
> >
> > > Anyways, I just did a build+boot (in qemu) test of defconfig+thinlto
> > > and defconfig+lto. LGTM
> > >
> > > Tested-by: Nick Desaulniers <ndesaulniers@google.com>
> >
> >
> > Thanks,
> > Wende
> >
> >
> > >> Tested-by: Wende Tan <twd2.me@gmail.com>
> > >> Signed-off-by: Wende Tan <twd2.me@gmail.com>
> > >> ---
> > >> v2:
> > >> - Some textual changes suggested by Nick.
> > >> - Drop the changes to `arch/riscv/Makefile`, since the LLVM issue is=
 filed
> > >>   and resolved.
> > >> - Drop the unnecessary changes to `arch/riscv/kernel/vdso/Makefile`.
> > >>
> > >> v1: https://lore.kernel.org/linux-riscv/20210719205208.1023221-1-twd=
2.me@gmail.com/
> > >> ---
> > >>  arch/riscv/Kconfig | 4 ++++
> > >>  1 file changed, 4 insertions(+)
> > >>
> > >> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > >> index 00fd9c548f26..c55f6b95e5af 100644
> > >> --- a/arch/riscv/Kconfig
> > >> +++ b/arch/riscv/Kconfig
> > >> @@ -38,6 +38,10 @@ config RISCV
> > >>         select ARCH_SUPPORTS_ATOMIC_RMW
> > >>         select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
> > >>         select ARCH_SUPPORTS_HUGETLBFS if MMU
> > >> +       # LLD >=3D 14:
> > >> +       # - https://github.com/llvm/llvm-project/issues/50505
> > >> +       select ARCH_SUPPORTS_LTO_CLANG if LLD_VERSION >=3D 140000
> > >> +       select ARCH_SUPPORTS_LTO_CLANG_THIN if LLD_VERSION >=3D 1400=
00
> > >>         select ARCH_USE_MEMTEST
> > >>         select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
> > >>         select ARCH_WANT_FRAME_POINTERS
> > >> --
> > >> 2.25.1
> > >>
>
>
>
> --
> Thanks,
> ~Nick Desaulniers



--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
