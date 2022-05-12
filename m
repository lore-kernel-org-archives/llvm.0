Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73E02F2C
	for <llvm@lists.linux.dev>; Thu, 12 May 2022 21:34:53 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id l19so8081003ljb.7
        for <llvm@lists.linux.dev>; Thu, 12 May 2022 14:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZQ7XWRC9DHBCbnMYIg75BjuOh+AqnlsxWLkBLw38gMg=;
        b=RyvRBJqJ6A/80crvldPh+nyT51ONhyhj2H6A8d7bimHMuIlw7t236lI8FZ1x5sI7yo
         yecpm4AvtMfKa0ky8m4KWcfldVBnM+/jkS7rbn540P1gpzOkgDe/MNI5+7/Of4L0y/fx
         hUZrwUyiOHhsCAMP6t9xIKrbXsLAAP1yCdAenGft1xt7Gc4kFHjLu0CINeOAIdMMIl2r
         koQrhfmkYLuha/SpqrAH11rswzaH6Qw2sXOs3CUWytX2xxoxYT+NfwvOLTE9faNMzpyO
         naWtrKPMPuDZLzmY9oRapbK1L7miKvc/Nx2HxoxuERy/KNqDbk7hgcS3xnn+2rfUzdPP
         2qMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZQ7XWRC9DHBCbnMYIg75BjuOh+AqnlsxWLkBLw38gMg=;
        b=jhA2UnnyH7lMGeqLv5qBWEhivqIlYdiViRTwhkDK4oGiXKwavsE95H3iceQtuwuKT2
         Uavi45CpdjQv9WVwifwLqzr6NQCSNy7tAXjsxKYY5cas6Ais52abVWy8VSsmLGYJgslV
         0aohOCtdgYti3L8FgahaBlLH+TMUhpUnL4ReWn24AbCf6bH5G7cU4WFDRMonmAF5f2K+
         2WXbQqAqgvZq5Fl8RIZAuyXSV3Ji0wOe9TcewAJKOUBHvWPwm/Hnp8xvMGH/5LOATVl/
         lVe3XV2kRDA9A1EUzcZSRdeCHRz+gMPsnHyA2oXxW3jzHfpeeDhrNCkMGv+XTkfIEFlH
         yiYA==
X-Gm-Message-State: AOAM531MQbewe+cNg+5a7V5oebm9EZCxkBg4bIzX3vRMlrGi01Nh3J+Z
	SZbdMUbds+veb3gmLrLI5u2KVyiM8ppcXes8+TVM3A==
X-Google-Smtp-Source: ABdhPJzR3FWSdYG+QG5HFvSiewtwfQztKLWDP3xQpQ+zlszBDRabO8sM7sQnvjzTjgI/rOHcfyTW54Hx4W5/HYZYibk=
X-Received: by 2002:a2e:aa8e:0:b0:251:f929:3e7d with SMTP id
 bj14-20020a2eaa8e000000b00251f9293e7dmr1163096ljb.352.1652391291632; Thu, 12
 May 2022 14:34:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220512205545.992288-1-twd2.me@gmail.com>
In-Reply-To: <20220512205545.992288-1-twd2.me@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 12 May 2022 14:34:40 -0700
Message-ID: <CAKwvOdmJ26h4L=3+42xeWG0_mZmZXkye=+mNWgFOHbo59ZVz1w@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: build: Allow LTO to be selected
To: Wende Tan <twd2.me@gmail.com>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, nathan@kernel.org, llvm@lists.linux.dev, 
	Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 12, 2022 at 1:56 PM Wende Tan <twd2.me@gmail.com> wrote:
>
> Allow LTO to be selected for RISC-V, only when LLD >= 14, since there is an
> issue [1] in prior LLD versions that prevents LLD to generate proper
> machine code for RISC-V when writing `nop`s.
>
> I have tested enabling LTO for `defconfig`. The LLD took ~2m21s and ~3GiB
> on our Intel Xeon Gold 6140 server and produced an 18MiB Image. The image
> can boot to shell using an archriscv rootfs on QEMU.
>
> I have also tested it for `allyesconfig` without COMPILE_TEST, FTRACE,
> KASAN, and GCOV. The LLD took ~7h03m and ~335GiB on the server,

Haha! That's ok, allyesconfig is not expected to boot for any
architectures AFAIK. For CI, we simply verify we can build them; we
boot test everything but allyesconfig and allmodconfig (and
architectures which don't yet have qemu ports).  It helps detect when
assembler sources don't use enough encoding space when referenced
external symbols are too far away for larger images, IME.

That's a long time; first time I've seen a number from someone trying
to LTO allyesconfig!

> successfully producing a 1.7GiB Image. Unfortunately, we cannot boot this
> image because the `create_kernel_page_table()` -> `alloc_pmd_early()` ->
> `BUG_ON()` logic limits the image to be < 1GiB. Maybe we can fix it in a
> separate patch further.
>
> [1] https://github.com/llvm/llvm-project/issues/50505, resolved by LLVM
>     commit e63455d5e0e5 ("[MC] Use local MCSubtargetInfo in writeNops")

So looking at that change, it doesn't look like it touches LLD at all.
To me it touches both the assembler and the object streamer, which is
used by the compiler (and assembler) to stream instructions directly
into an object file (without the need for an external assembler).

That makes me think that
CLANG_VERSION >= 140000
would be more appropriate than
LLD_VERSION >= 140000

WDYT?

Also, I'm curious if the LLVM patch you had me commit for you recently
is at all related or necessary for this? If so, then the version check
should probably be against clang-15, not clang-14.
https://github.com/llvm/llvm-project/commit/6baaad740a5abb4bfcff022a8114abb4eea66a2d

Anyways, I just did a build+boot (in qemu) test of defconfig+thinlto
and defconfig+lto. LGTM

Tested-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Tested-by: Wende Tan <twd2.me@gmail.com>
> Signed-off-by: Wende Tan <twd2.me@gmail.com>
> ---
> v2:
> - Some textual changes suggested by Nick.
> - Drop the changes to `arch/riscv/Makefile`, since the LLVM issue is filed
>   and resolved.
> - Drop the unnecessary changes to `arch/riscv/kernel/vdso/Makefile`.
>
> v1: https://lore.kernel.org/linux-riscv/20210719205208.1023221-1-twd2.me@gmail.com/
> ---
>  arch/riscv/Kconfig | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 00fd9c548f26..c55f6b95e5af 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -38,6 +38,10 @@ config RISCV
>         select ARCH_SUPPORTS_ATOMIC_RMW
>         select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
>         select ARCH_SUPPORTS_HUGETLBFS if MMU
> +       # LLD >= 14:
> +       # - https://github.com/llvm/llvm-project/issues/50505
> +       select ARCH_SUPPORTS_LTO_CLANG if LLD_VERSION >= 140000
> +       select ARCH_SUPPORTS_LTO_CLANG_THIN if LLD_VERSION >= 140000
>         select ARCH_USE_MEMTEST
>         select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
>         select ARCH_WANT_FRAME_POINTERS
> --
> 2.25.1
>


-- 
Thanks,
~Nick Desaulniers
