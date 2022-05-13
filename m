Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0754A7A
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 19:30:20 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id bu29so16257320lfb.0
        for <llvm@lists.linux.dev>; Fri, 13 May 2022 12:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ar+dw9fAea7bQ3SHq+kWJAt66RPA5xbB0v3ZBs4MJwg=;
        b=WxTFPhweBSE1PWB/VIT9UQR7xj1k/ocSfH8Pb2lmrTp/zn89g7gyeCr6hLNE3PvrZR
         qYo1U99ADBDVm4PQFMLhqns9oiipIZThd8AM5j/EC6e7HJkbVHHhmeT3QyxpeGCGlZZa
         ZKSETl5bAOJRdWcGBmtqOEDT+brRslPbXHGUxAqq4aZMSvpTzFi9WncpurVcGVTczs7j
         vTlYYl5BYmaCMmjssgCYFjMc/dMq+QPlwefz0vBS36FRKEWvxF0m7+BGJmuo85OSF96X
         qz8NAeAcOmf/prvUboqS41zVjZCFyEww0KR7YH93MD8rfLiVcM+PqCRm2KQzVbD9uwhV
         lzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ar+dw9fAea7bQ3SHq+kWJAt66RPA5xbB0v3ZBs4MJwg=;
        b=7R9jKiKc+kKrCRU7crLvm5ceZdUUIAZ2FSs9Irg1+KqlMZuV0J38zzzFBe6RWIPvqF
         p+feyD5ixQvmNbZKPcqtmmF8Ey3oxGDB9JwKFwbqhMD/j2XD3fpLegYRC6/cZNIh8a3q
         ivfcsIU4i+9gjVM/c7vc1hIa7yZSIDpOiiG7tS1GjaxgfZ/AdhI3hL+fLbXKMybyM7bM
         Ot6ee+MuFjsQHm3g9xlcQO+GMcTKiVh+tPqRYcnWxn+3XoYeteV6mIJTa/ULUtKdSJXp
         1Yb8TNNeW9BVkkS8nZ43jHJFsR3bA1sdY8njDRzSbEn8Oay3HXJbp4yqTe3CGpqunC0U
         HMNQ==
X-Gm-Message-State: AOAM531MkbCuqMLFyT1ymEkc3BtGJBFGsWFVb/bzjMKvhM7ghjb8N228
	WpCC7A2OZalhZyytDB/bNE2Bd5iuQqfEUdah29jJ3A==
X-Google-Smtp-Source: ABdhPJyjlyY+s0JtPO0F6CaJzdoAEHnIpOLCO36FJwBmROUJqm1LbtwBv81mL0SQ7e5s7SJ88MFR83YxZypSKf2r3Ik=
X-Received: by 2002:a05:6512:1d1:b0:471:f63a:b182 with SMTP id
 f17-20020a05651201d100b00471f63ab182mr4442378lfp.392.1652470218742; Fri, 13
 May 2022 12:30:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220512205545.992288-1-twd2.me@gmail.com> <CAKwvOdmJ26h4L=3+42xeWG0_mZmZXkye=+mNWgFOHbo59ZVz1w@mail.gmail.com>
 <30f9c99e-9bc4-9369-a533-7b454a213403@gmail.com>
In-Reply-To: <30f9c99e-9bc4-9369-a533-7b454a213403@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 13 May 2022 12:30:06 -0700
Message-ID: <CAKwvOdnSRA_1wO8bb3tuGCunPjx_pQDi2_0O9yQLbk-TRR3dyA@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: build: Allow LTO to be selected
To: twd2 <twd2.me@gmail.com>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, nathan@kernel.org, llvm@lists.linux.dev, 
	Fangrui Song <maskray@google.com>
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

Ah, that's right. Ok, LGTM.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
>
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
Thanks,
~Nick Desaulniers
