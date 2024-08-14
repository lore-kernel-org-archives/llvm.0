Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F92A1B3F20
	for <llvm@lists.linux.dev>; Wed, 14 Aug 2024 16:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723651437; cv=none; b=L5Yf8BWsKMXl3SwOYnVQeMIlpgzSJb0tdOm+yMacDognLFuSI1FF7djxzydnt0ynnPFJIkGZa15eg4X6MVlJ/zlrqWMSuNEaiRuJdpxagdCv14XiVHH72T3HdRvs5x4XKdoZET22CdF4YL92BIernyC0w3SyNucCWZsYyWn1zAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723651437; c=relaxed/simple;
	bh=+VU2P6R0OrPDHfMGIMqErHsk14NZApHDOPJWyMKCv30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TWSkWFsX/ofEwYrHsB4utXKgpbQU7j0NmpXCFnyxLFWsz4D1dHhafd2Cnw91r3RnbT/hESLS0XfWXmLEP83fbGn5vgLVcIvWocBsdBm8Z9TyCUS1eQdJKD+7I8X+OGaici8K4irstWixH4TyvzdNEIFgazBaKn7Bs/nEv9jmzhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gcbC21Hd; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcbC21Hd"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3685a5e7d3cso49888f8f.1
        for <llvm@lists.linux.dev>; Wed, 14 Aug 2024 09:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723651433; x=1724256233; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMDoYmsc39gb6yuKfl0P727Axl9w4fP7q/FSOzu+ECI=;
        b=gcbC21HdeZ/r38AYoM0cqhIDYqbUI6wq0gg/THgxhpXPFKk+bHVISKf1A9tpwy6Kds
         7QCbXNWhzWPVw1jCiI84vWaKDfMQA7wc1k4lMoWERoM7J1/F1BBShv8aRhIflAksdch7
         vXASDqfwKK+kBPPiFcgRnQN844K2gLB/+b6UKT+fApjHJfORA28XRrkrIfCpajhawjcB
         dzIG/G8wGcTuZu/9JQuEw0LzNbo3EAK3dieqB5vgBlfxLGWUB7czDKLAkd1sIO1ET/PR
         xd54hEjfO+HRZPAIvfNurHi/n89v8XZDvTORoJs3/zGog1MFdYlPVVVpMVxJZni9LYpQ
         dkqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723651433; x=1724256233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iMDoYmsc39gb6yuKfl0P727Axl9w4fP7q/FSOzu+ECI=;
        b=sPuxzPaBO1Sc/W8kYXrqqHBgXVkdE0pxkmWamUwHIgmh3MlIq0MQdRc18K352vV3Rk
         lGcQ01ddROjNzbJdcDK7MvT2ctcepbKFiG24pSXGvrFOtHcGaxmXIrCxDw9+8wwWjbHw
         rORVKSFv/GVoH6nQvK50ieGgc+R5ivqG7iNO3nAxxEt2/mSsSkZLQQI9qOvhoDsCWvBG
         hhzP/4ydblKoxCkGwTNakr1iiCj0w3fujDyDUhMbAIYIR9Np0G7BJLa7n8FPO83+/lws
         9Fb4/HMyOUCfTzHG8jQ5e7UuG7xRHh+K3XFj80skBLC2tCp6UOheLJvuvtE5wHK7C213
         fsFw==
X-Forwarded-Encrypted: i=1; AJvYcCV2kcq4VprnUnGVc+Mk/VnUjMAHCRGgAETW32xrKDJYBwEXYuD2RXUPLNAX9eYe4Ra/LZM3MPA/3UvBJRXF5/NXuYiYiQ==
X-Gm-Message-State: AOJu0YxObpjHtdwcwWsrMHYm6tSuunAErpAeLoue4bFmoFIpCIU6lC5N
	pansQBEnHBhvh3Y4vLyQbvh9hKaAe/1wIJG7mS+kdtcnuis0AFdRQZD18p9INND4tG3XafSkuIK
	DtyqeBRBviGoAWE0PPD6DFm2ois8=
X-Google-Smtp-Source: AGHT+IFDkwKblqThhUfBkfgnwoEdLVZAEjQg1TG0PMrq0Rk4KhBDHOexlQBGuOuLNFNSBgteLeDB3bCm6TcVA0I3Wgk=
X-Received: by 2002:adf:e64f:0:b0:367:98e6:362b with SMTP id
 ffacd0b85a97d-371777e5ea7mr2514710f8f.42.1723651433003; Wed, 14 Aug 2024
 09:03:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240814085618.968833-1-samuel.holland@sifive.com> <20240814085618.968833-2-samuel.holland@sifive.com>
In-Reply-To: <20240814085618.968833-2-samuel.holland@sifive.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Wed, 14 Aug 2024 18:03:42 +0200
Message-ID: <CA+fCnZcd0jg5HqQqERfqTbVc-F2mYsq=w4aek8pQSCEPXyRG7w@mail.gmail.com>
Subject: Re: [RFC PATCH 1/7] kasan: sw_tags: Use arithmetic shift for shadow computation
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	kasan-dev@googlegroups.com, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Evgenii Stepanov <eugenis@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 10:56=E2=80=AFAM Samuel Holland
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

Will this change cause any problems with the check against
KASAN_SHADOW_OFFSET in kasan_non_canonical_hook()?

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
>  arch/arm64/Kconfig              | 10 +++++-----
>  arch/arm64/include/asm/memory.h |  8 ++++++++
>  arch/arm64/mm/kasan_init.c      |  7 +++++--
>  include/linux/kasan.h           | 10 ++++++++--
>  scripts/gdb/linux/mm.py         |  5 +++--
>  5 files changed, 29 insertions(+), 11 deletions(-)
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index a2f8ff354ca6..7df218cca168 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -402,11 +402,11 @@ config KASAN_SHADOW_OFFSET
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
> index 54fb014eba05..3af8d1e721af 100644
> --- a/arch/arm64/include/asm/memory.h
> +++ b/arch/arm64/include/asm/memory.h
> @@ -82,6 +82,10 @@
>   * the mapping. Note that KASAN_SHADOW_OFFSET does not point to the star=
t of
>   * the shadow memory region.
>   *
> + * For KASAN_GENERIC, addr is treated as unsigned. For KASAN_SW_TAGS, ad=
dr is
> + * treated as signed, so in that case KASAN_SHADOW_OFFSET points to the =
end of
> + * the shadow memory region.

Hm, it's not immediately obvious why using a signed addr leads to
KASAN_SHADOW_OFFSET being =3D=3D KASAN_SHADOW_END. Could you clarify this
in the comment?

Let's also put this explanation into the KASAN_SHADOW_END paragraph
instead, something like:

KASAN_SHADOW_END is defined first as the shadow address that
corresponds to the upper bound of possible virtual kernel memory
addresses UL(1) << 64 according to the mapping formula. For Generic
KASAN, the address in the mapping formula is treated as unsigned (part
of the compiler's ABI), so we do explicit calculations according to
the formula. For Software Tag-Based KASAN, the address is treated as
signed, and thus <EXPLANATION HERE>.



> + *
>   * Based on this mapping, we define two constants:
>   *
>   *     KASAN_SHADOW_START: the start of the shadow memory region;
> @@ -100,7 +104,11 @@
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
> index 70d6a8f6e25d..41f57e10ba03 100644
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
