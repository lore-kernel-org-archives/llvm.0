Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A011A0AF0
	for <llvm@lists.linux.dev>; Wed, 23 Oct 2024 18:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729708933; cv=none; b=RIGkCax5zCZ/1++grqGKPzuva4IfpM/XMZGVyBOTqruJTpL+jBVkW8yBpor2t/Ef0lX080RlYHDgLd9vsW2FmZyt9ZeTLesBvgw8qQDVenlHtrjvn8E5SR82/+2wSp56+CBeDUysaBBQwUek0EDKElu7KVvoUD4a+UDkW881zZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729708933; c=relaxed/simple;
	bh=WLbdJgOrR1zIhVlKpiURLXtl/ud8TCDsGSsPBVapp40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xz/A1LTNri2wzdnL8IlZ1bYgQjJg5crkWqzjn8QzmEA0udX6i6i1uFipVufF6R2n/e7NtJTvIzc8/2SYsRuUkTQ3/8otw6lMjUgE5AGazh7c2hvvEtYrH9mUHzLGA0Kl60l6PzQR4VCQ4lHCkZhZ7ZkfwCb9/jWdrGxgNogsEmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UK4ZStL4; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UK4ZStL4"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37ed3bd6114so10708f8f.2
        for <llvm@lists.linux.dev>; Wed, 23 Oct 2024 11:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729708929; x=1730313729; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnCz4Gz0DfA3iJQbcwkn7pdP+4IKH3HjV3Yhmz6VCSY=;
        b=UK4ZStL4zpA9IaOGvVTBrVeAjXCK5OBhTg1lgaJVwKxBHpRaENC9iLfnTiBgdxSm94
         ds8JEZgYxesYJg9oA9lx0D9dbz4XCp4oCDz6gMiJLAMGsSwktRWW1Qed7cxp9Faybzop
         FE4tnA6sdeksrP0SLTXwNK8s6EnjERuiLf/4ieWmRe/ISG3hJ7tOWfbZzYrPPOwmqwWG
         2sJBTDbxBaqsu8+RZXHIM9V9+m+AaXy9E36+Jsho9SkB0iajxGa1xoaztyX9aGDV+23t
         AnHYIMfRsun4b3msy/VWcpU6Uz4U3HYCFK1rwgsizU2WV83hP/zHCQEsAT+ZdGamFSo9
         OYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729708929; x=1730313729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dnCz4Gz0DfA3iJQbcwkn7pdP+4IKH3HjV3Yhmz6VCSY=;
        b=iDFmKSQyacytOy4kAvUlOyfTPtW4gu397uBsSLwviUCluyPvsTjpKEp99Ah83A9Dh2
         uWh1UUjg1i1MCWgzWlAcf6CcN01J7d/RzH/1jF3vgukvBEErDPO6dsQR8GiEWPcdMDzY
         IORME+k32DwCKLA9mcfw7s3UnvCONtcmnmDNxo+jPUT395INiqM81kM2YZR/5XVGtcW0
         EW7yeVj5sBzoUdjGhCIXvJ9o0pL6uy6/jcC0BR8U2MHyIGH+zsaaf/1kMsV7ERsKTBMX
         DtwqdP3TZLv6GQbn895sCEQtCRmTDUI7/oVYbXA1ie3dnX/xTm1T9QOpm/TV4QOsIWef
         Q2mA==
X-Forwarded-Encrypted: i=1; AJvYcCU65rvOStVTkjzBcjluz7sv+OlS0Osv6xAln8CvkpTRonqP4+74c2FHuERq582KjjJi2+J+@lists.linux.dev
X-Gm-Message-State: AOJu0YxoL4McGs++PhKK/p58mZQDGBhj3lUi0XqpirNzbXxxLstAHOOY
	DADZO7iUsuaq7C02ahSjzykFO0U+Zj50ZBq59giUUIZJaVGLGxqTOHw7eU7UuqgCoIQk0exHwMZ
	3jxKbVjPE2xdweII0HduERYVkcFg=
X-Google-Smtp-Source: AGHT+IGg7n7i3SyqRuIa/xhUMj1hN55mZB4j6qxgVsau7X+77BU2sb51xczx42QYuNHR1RsEnbwZOc1YeDhSyzlxoHQ=
X-Received: by 2002:a5d:5257:0:b0:37d:614e:2bc5 with SMTP id
 ffacd0b85a97d-37efcf1dbb3mr2066652f8f.29.1729708928528; Wed, 23 Oct 2024
 11:42:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241022015913.3524425-1-samuel.holland@sifive.com> <20241022015913.3524425-2-samuel.holland@sifive.com>
In-Reply-To: <20241022015913.3524425-2-samuel.holland@sifive.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Wed, 23 Oct 2024 20:41:57 +0200
Message-ID: <CA+fCnZeBEe3VWm=VfYvG-f4eh2jAFP-p4Xn4SLEeFCGTudVuEw@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] kasan: sw_tags: Use arithmetic shift for shadow computation
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	kasan-dev@googlegroups.com, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, 
	Evgenii Stepanov <eugenis@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 3:59=E2=80=AFAM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> Currently, kasan_mem_to_shadow() uses a logical right shift, which turns
> canonical kernel addresses into non-canonical addresses by clearing the
> high KASAN_SHADOW_SCALE_SHIFT bits. The value of KASAN_SHADOW_OFFSET is
> then chosen so that the addition results in a canonical address for the
> shadow memory.
>
> For KASAN_GENERIC, this shift/add combination is ABI with the compiler,
> because KASAN_SHADOW_OFFSET is used in compiler-generated inline tag
> checks[1], which must only attempt to dereference canonical addresses.
>
> However, for KASAN_SW_TAGS we have some freedom to change the algorithm
> without breaking the ABI. Because TBI is enabled for kernel addresses,
> the top bits of shadow memory addresses computed during tag checks are
> irrelevant, and so likewise are the top bits of KASAN_SHADOW_OFFSET.
> This is demonstrated by the fact that LLVM uses a logical right shift
> in the tag check fast path[2] but a sbfx (signed bitfield extract)
> instruction in the slow path[3] without causing any issues.
>
> Using an arithmetic shift in kasan_mem_to_shadow() provides a number of
> benefits:
>
> 1) The memory layout is easier to understand. KASAN_SHADOW_OFFSET
> becomes a canonical memory address, and the shifted pointer becomes a
> negative offset, so KASAN_SHADOW_OFFSET =3D=3D KASAN_SHADOW_END regardles=
s
> of the shift amount or the size of the virtual address space.
>
> 2) KASAN_SHADOW_OFFSET becomes a simpler constant, requiring only one
> instruction to load instead of two. Since it must be loaded in each
> function with a tag check, this decreases kernel text size by 0.5%.
>
> 3) This shift and the sign extension from kasan_reset_tag() can be
> combined into a single sbfx instruction. When this same algorithm change
> is applied to the compiler, it removes an instruction from each inline
> tag check, further reducing kernel text size by an additional 4.6%.
>
> These benefits extend to other architectures as well. On RISC-V, where
> the baseline ISA does not shifted addition or have an equivalent to the
> sbfx instruction, loading KASAN_SHADOW_OFFSET is reduced from 3 to 2
> instructions, and kasan_mem_to_shadow(kasan_reset_tag(addr)) similarly
> combines two consecutive right shifts.
>
> Link: https://github.com/llvm/llvm-project/blob/llvmorg-20-init/llvm/lib/=
Transforms/Instrumentation/AddressSanitizer.cpp#L1316 [1]
> Link: https://github.com/llvm/llvm-project/blob/llvmorg-20-init/llvm/lib/=
Transforms/Instrumentation/HWAddressSanitizer.cpp#L895 [2]
> Link: https://github.com/llvm/llvm-project/blob/llvmorg-20-init/llvm/lib/=
Target/AArch64/AArch64AsmPrinter.cpp#L669 [3]
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
> Changes in v2:
>  - Improve the explanation for how KASAN_SHADOW_END is derived
>  - Update the range check in kasan_non_canonical_hook()
>
>  arch/arm64/Kconfig              | 10 +++++-----
>  arch/arm64/include/asm/memory.h | 17 +++++++++++++++--
>  arch/arm64/mm/kasan_init.c      |  7 +++++--
>  include/linux/kasan.h           | 10 ++++++++--
>  mm/kasan/report.c               | 22 ++++++++++++++++++----
>  scripts/gdb/linux/mm.py         |  5 +++--
>  6 files changed, 54 insertions(+), 17 deletions(-)
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index fd9df6dcc593..6a326908c941 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -418,11 +418,11 @@ config KASAN_SHADOW_OFFSET
>         default 0xdffffe0000000000 if ARM64_VA_BITS_42 && !KASAN_SW_TAGS
>         default 0xdfffffc000000000 if ARM64_VA_BITS_39 && !KASAN_SW_TAGS
>         default 0xdffffff800000000 if ARM64_VA_BITS_36 && !KASAN_SW_TAGS
> -       default 0xefff800000000000 if (ARM64_VA_BITS_48 || (ARM64_VA_BITS=
_52 && !ARM64_16K_PAGES)) && KASAN_SW_TAGS
> -       default 0xefffc00000000000 if (ARM64_VA_BITS_47 || ARM64_VA_BITS_=
52) && ARM64_16K_PAGES && KASAN_SW_TAGS
> -       default 0xeffffe0000000000 if ARM64_VA_BITS_42 && KASAN_SW_TAGS
> -       default 0xefffffc000000000 if ARM64_VA_BITS_39 && KASAN_SW_TAGS
> -       default 0xeffffff800000000 if ARM64_VA_BITS_36 && KASAN_SW_TAGS
> +       default 0xffff800000000000 if (ARM64_VA_BITS_48 || (ARM64_VA_BITS=
_52 && !ARM64_16K_PAGES)) && KASAN_SW_TAGS
> +       default 0xffffc00000000000 if (ARM64_VA_BITS_47 || ARM64_VA_BITS_=
52) && ARM64_16K_PAGES && KASAN_SW_TAGS
> +       default 0xfffffe0000000000 if ARM64_VA_BITS_42 && KASAN_SW_TAGS
> +       default 0xffffffc000000000 if ARM64_VA_BITS_39 && KASAN_SW_TAGS
> +       default 0xfffffff800000000 if ARM64_VA_BITS_36 && KASAN_SW_TAGS
>         default 0xffffffffffffffff
>
>  config UNWIND_TABLES
> diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/mem=
ory.h
> index 0480c61dbb4f..a93fc9dc16f3 100644
> --- a/arch/arm64/include/asm/memory.h
> +++ b/arch/arm64/include/asm/memory.h
> @@ -80,7 +80,8 @@
>   * where KASAN_SHADOW_SCALE_SHIFT is the order of the number of bits tha=
t map
>   * to a single shadow byte and KASAN_SHADOW_OFFSET is a constant that of=
fsets
>   * the mapping. Note that KASAN_SHADOW_OFFSET does not point to the star=
t of
> - * the shadow memory region.
> + * the shadow memory region, since not all possible addresses have shado=
w
> + * memory allocated for them.

I'm not sure this addition makes sense: the original statement was to
point out that KASAN_SHADOW_OFFSET and KASAN_SHADOW_START are
different values. Even if we were to map shadow for userspace,
KASAN_SHADOW_OFFSET would still be a weird offset value for Generic
KASAN.

>   *
>   * Based on this mapping, we define two constants:
>   *
> @@ -89,7 +90,15 @@
>   *
>   * KASAN_SHADOW_END is defined first as the shadow address that correspo=
nds to
>   * the upper bound of possible virtual kernel memory addresses UL(1) << =
64
> - * according to the mapping formula.
> + * according to the mapping formula. For Generic KASAN, the address in t=
he
> + * mapping formula is treated as unsigned (part of the compiler's ABI), =
so the
> + * end of the shadow memory region is at a large positive offset from
> + * KASAN_SHADOW_OFFSET. For Software Tag-Based KASAN, the address in the
> + * formula is treated as signed. Since all kernel addresses are negative=
, they
> + * map to shadow memory below KASAN_SHADOW_OFFSET, making KASAN_SHADOW_O=
FFSET
> + * itself the end of the shadow memory region. (User pointers are positi=
ve and
> + * would map to shadow memory above KASAN_SHADOW_OFFSET, but shadow memo=
ry is
> + * not allocated for them.)

This looks good!

>   *
>   * KASAN_SHADOW_START is defined second based on KASAN_SHADOW_END. The s=
hadow
>   * memory start must map to the lowest possible kernel virtual memory ad=
dress
> @@ -100,7 +109,11 @@
>   */
>  #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
>  #define KASAN_SHADOW_OFFSET    _AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
> +#ifdef CONFIG_KASAN_GENERIC
>  #define KASAN_SHADOW_END       ((UL(1) << (64 - KASAN_SHADOW_SCALE_SHIFT=
)) + KASAN_SHADOW_OFFSET)
> +#else
> +#define KASAN_SHADOW_END       KASAN_SHADOW_OFFSET
> +#endif
>  #define _KASAN_SHADOW_START(va)        (KASAN_SHADOW_END - (UL(1) << ((v=
a) - KASAN_SHADOW_SCALE_SHIFT)))
>  #define KASAN_SHADOW_START     _KASAN_SHADOW_START(vabits_actual)
>  #define PAGE_END               KASAN_SHADOW_START
> diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
> index b65a29440a0c..6836e571555c 100644
> --- a/arch/arm64/mm/kasan_init.c
> +++ b/arch/arm64/mm/kasan_init.c
> @@ -198,8 +198,11 @@ static bool __init root_level_aligned(u64 addr)
>  /* The early shadow maps everything to a single page of zeroes */
>  asmlinkage void __init kasan_early_init(void)
>  {
> -       BUILD_BUG_ON(KASAN_SHADOW_OFFSET !=3D
> -               KASAN_SHADOW_END - (1UL << (64 - KASAN_SHADOW_SCALE_SHIFT=
)));
> +       if (IS_ENABLED(CONFIG_KASAN_GENERIC))
> +               BUILD_BUG_ON(KASAN_SHADOW_OFFSET !=3D
> +                       KASAN_SHADOW_END - (1UL << (64 - KASAN_SHADOW_SCA=
LE_SHIFT)));
> +       else
> +               BUILD_BUG_ON(KASAN_SHADOW_OFFSET !=3D KASAN_SHADOW_END);
>         BUILD_BUG_ON(!IS_ALIGNED(_KASAN_SHADOW_START(VA_BITS), SHADOW_ALI=
GN));
>         BUILD_BUG_ON(!IS_ALIGNED(_KASAN_SHADOW_START(VA_BITS_MIN), SHADOW=
_ALIGN));
>         BUILD_BUG_ON(!IS_ALIGNED(KASAN_SHADOW_END, SHADOW_ALIGN));
> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> index 00a3bf7c0d8f..03b440658817 100644
> --- a/include/linux/kasan.h
> +++ b/include/linux/kasan.h
> @@ -58,8 +58,14 @@ int kasan_populate_early_shadow(const void *shadow_sta=
rt,
>  #ifndef kasan_mem_to_shadow
>  static inline void *kasan_mem_to_shadow(const void *addr)
>  {
> -       return (void *)((unsigned long)addr >> KASAN_SHADOW_SCALE_SHIFT)
> -               + KASAN_SHADOW_OFFSET;
> +       void *scaled;
> +
> +       if (IS_ENABLED(CONFIG_KASAN_GENERIC))
> +               scaled =3D (void *)((unsigned long)addr >> KASAN_SHADOW_S=
CALE_SHIFT);
> +       else
> +               scaled =3D (void *)((long)addr >> KASAN_SHADOW_SCALE_SHIF=
T);
> +
> +       return KASAN_SHADOW_OFFSET + scaled;
>  }
>  #endif
>
> diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> index b48c768acc84..c08097715686 100644
> --- a/mm/kasan/report.c
> +++ b/mm/kasan/report.c
> @@ -644,15 +644,29 @@ void kasan_report_async(void)
>   */
>  void kasan_non_canonical_hook(unsigned long addr)
>  {
> +       unsigned long max_shadow_size =3D BIT(BITS_PER_LONG - KASAN_SHADO=
W_SCALE_SHIFT);
>         unsigned long orig_addr;
>         const char *bug_type;
>
>         /*
> -        * All addresses that came as a result of the memory-to-shadow ma=
pping
> -        * (even for bogus pointers) must be >=3D KASAN_SHADOW_OFFSET.
> +        * With the default kasan_mem_to_shadow() algorithm, all addresse=
s
> +        * returned by the memory-to-shadow mapping (even for bogus point=
ers)
> +        * must be within a certain displacement from KASAN_SHADOW_OFFSET=
.
> +        *
> +        * For Generic KASAN, the displacement is unsigned, so
> +        * KASAN_SHADOW_OFFSET is the smallest possible shadow address. F=
or

This part of the comment doesn't seem correct: KASAN_SHADOW_OFFSET is
still a weird offset value for Generic KASAN, not the smallest
possible shadow address.

> +        * Software Tag-Based KASAN, the displacement is signed, so
> +        * KASAN_SHADOW_OFFSET is the center of the range.
>          */
> -       if (addr < KASAN_SHADOW_OFFSET)
> -               return;
> +       if (IS_ENABLED(CONFIG_KASAN_GENERIC)) {
> +               if (addr < KASAN_SHADOW_OFFSET ||
> +                   addr >=3D KASAN_SHADOW_OFFSET + max_shadow_size)
> +                       return;
> +       } else {
> +               if (addr < KASAN_SHADOW_OFFSET - max_shadow_size / 2 ||
> +                   addr >=3D KASAN_SHADOW_OFFSET + max_shadow_size / 2)
> +                       return;

Hm, I might be wrong, but I think this check does not work.

Let's say we have non-canonical address 0x4242424242424242 and number
of VA bits is 48.

Then:

KASAN_SHADOW_OFFSET =3D=3D 0xffff800000000000
kasan_mem_to_shadow(0x4242424242424242) =3D=3D 0x0423a42424242424
max_shadow_size =3D=3D 0x1000000000000000
KASAN_SHADOW_OFFSET - max_shadow_size / 2 =3D=3D 0xf7ff800000000000
KASAN_SHADOW_OFFSET + max_shadow_size / 2 =3D=3D 0x07ff800000000000 (overfl=
ows)

0x0423a42424242424 is < than 0xf7ff800000000000, so the function will
wrongly return.

> +       }
>
>         orig_addr =3D (unsigned long)kasan_shadow_to_mem((void *)addr);
>

Just to double-check: kasan_shadow_to_mem() and addr_has_metadata()
don't need any changes, right?

> diff --git a/scripts/gdb/linux/mm.py b/scripts/gdb/linux/mm.py
> index 7571aebbe650..2e63f3dedd53 100644
> --- a/scripts/gdb/linux/mm.py
> +++ b/scripts/gdb/linux/mm.py
> @@ -110,12 +110,13 @@ class aarch64_page_ops():
>          self.KERNEL_END =3D gdb.parse_and_eval("_end")
>
>          if constants.LX_CONFIG_KASAN_GENERIC or constants.LX_CONFIG_KASA=
N_SW_TAGS:
> +            self.KASAN_SHADOW_OFFSET =3D constants.LX_CONFIG_KASAN_SHADO=
W_OFFSET
>              if constants.LX_CONFIG_KASAN_GENERIC:
>                  self.KASAN_SHADOW_SCALE_SHIFT =3D 3
> +                self.KASAN_SHADOW_END =3D (1 << (64 - self.KASAN_SHADOW_=
SCALE_SHIFT)) + self.KASAN_SHADOW_OFFSET
>              else:
>                  self.KASAN_SHADOW_SCALE_SHIFT =3D 4
> -            self.KASAN_SHADOW_OFFSET =3D constants.LX_CONFIG_KASAN_SHADO=
W_OFFSET
> -            self.KASAN_SHADOW_END =3D (1 << (64 - self.KASAN_SHADOW_SCAL=
E_SHIFT)) + self.KASAN_SHADOW_OFFSET
> +                self.KASAN_SHADOW_END =3D self.KASAN_SHADOW_OFFSET
>              self.PAGE_END =3D self.KASAN_SHADOW_END - (1 << (self.vabits=
_actual - self.KASAN_SHADOW_SCALE_SHIFT))
>          else:
>              self.PAGE_END =3D self._PAGE_END(self.VA_BITS_MIN)
> --
> 2.45.1
>

Could you also check that everything works when CONFIG_KASAN_SW_TAGS +
CONFIG_KASAN_OUTLINE? I think it should, be makes sense to confirm.

Thank you!
