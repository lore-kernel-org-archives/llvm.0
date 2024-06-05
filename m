Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8682E7347E
	for <llvm@lists.linux.dev>; Wed,  5 Jun 2024 04:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717563100; cv=none; b=IT6Euk8asFustntKWxtU+G9ZwhzQaDWm5UQs6xKc25YKYs+d57NL/yVrE4AhnAWpoEQ2ivwgI2h7FrNj1jGOXumcCYZgi5OCHVMxxkzP3Y+RwpTjp78Z39dNdOGDBmPO6eBjOJ/hfDp6dUydaTudklwNW1Uk/LwbBm47RFDsjA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717563100; c=relaxed/simple;
	bh=fRj/9daOi684S1CjP8+/OFf16Zh4BiNKACL519r/dhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UI8H+8jnnc1cdCvmXZZZyEWKgvKIiWaoFl4ep0W+VCe9w2wrP3yVOFpNlXEsjwX7bUSgRf68BizGaa7YxrrIKbsYpEyit5HkGUAVgF5vqR0KmsrTuny4CmIvwjfB5lxZgq+imv83CLCXND677QjosZ7mqEVHhxD5X0y3iCwqI4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=k8ZDFu6c; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="k8ZDFu6c"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7eb307de488so57275739f.0
        for <llvm@lists.linux.dev>; Tue, 04 Jun 2024 21:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1717563097; x=1718167897; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+9KIC2ZMxoi+KaQ4+bun3D6PF4buG3kzbZsU0iekQA=;
        b=k8ZDFu6cqnJXY6aHC7YmPVoUw8iG7K6M1G+J6NlX/5Rhf8oSzIbVxU+2xf4CceXksI
         8Jjo7ZZoV8wrKa52/kn8rreX/RBZwrY/u+WpGKnp1xjwUgSkDfdWkmGcCDsmmr/aAxNS
         slRwxJ9rGNjO2lxAseRU4CS6G/fRCehtrtfAHtqjVXjukM4cx14OMmM2pxfF7/qG2jNz
         PX1w0/V1ftQaDTHEXhOiNlydbq4m5nZlVNqTyQx7s7soKCw+h+zG7F/EkVPXSQSqAIka
         3NzLvfPam00wlr+PFYQo9nswbM/UxozmK4qDZvomLgH/aTXXgg4X2R7PukuGctxDj+4A
         kbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717563097; x=1718167897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+9KIC2ZMxoi+KaQ4+bun3D6PF4buG3kzbZsU0iekQA=;
        b=aGozlvJSU6DgOWoTCdWfOoESvbva/oPXbbPvzGC3KNCZJxLlq8m1d2zobW0ZdnBNSC
         yZY8SiZylATOPFLOzEDmXOLUQH9CEGmlaOHhTanyUbsYzjCOfGYrU65U05VJDhM2AOQr
         wrwJbett18bK8PlePaOCf6a1ebD4r+HqXME4+z58U6cFkT1EKZQ1m49a3Ub9+Ex5vBVN
         KlXL8fjVtr2Pl6ZA4qbAtjt5nJ/10TkGcb5rs2FLbgSMf51JdwgVap+QrqCv38u59PxS
         ma/jiSjLuDfbI3tjEkq5QelmDLLFEWhC2Okux7Om/1eZoLIP/LZf0aSwmfiR+vzpkoXD
         gA0g==
X-Forwarded-Encrypted: i=1; AJvYcCUuraI8dc8V69FRGryQ0sknoa+NfWqgJzLR+2AewEQv/Zzc3xUzvScDRZqEjD1wbMa0ih8+/Qb/xg5IZwnsihR9yznS0g==
X-Gm-Message-State: AOJu0YwAWcYQrqxQHDjyxZQd9sfAOpMPY9IgJMNSxhj0dAIqfb5bqwXA
	FQ2Jqei7zv15R80g8p7NvHrSz/nkwnvApJAO6qpurK7/a3AtI8vCKJ0iBfOfZk0EgIBHV6muBl6
	WPAKcE+lOn6qM7Dm2H7b02ijTFrdR+RvBcf5ti5wM3iXJdm/P2jY=
X-Google-Smtp-Source: AGHT+IHDdgM5M7Aerg3GufHIekxnMW6S0tnaUVXZfbMHW9u3OV196yASyKEW6+bqR469jIOGILXJOClrDiM+GwbYUwk=
X-Received: by 2002:a05:6602:3fc7:b0:7e1:85a5:36c0 with SMTP id
 ca18e2360f4ac-7eb3c8b52edmr187420039f.9.1717563097575; Tue, 04 Jun 2024
 21:51:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240531162327.2436962-1-jesse@rivosinc.com>
In-Reply-To: <20240531162327.2436962-1-jesse@rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Wed, 5 Jun 2024 12:51:26 +0800
Message-ID: <CANXhq0pYNWvMxkkNPpYW4OrOXK19Rehdy3yO8u1sforyVjdTZg@mail.gmail.com>
Subject: Re: [PATCH v0] RISC-V: Use Zkr to seed KASLR base address
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 1, 2024 at 12:23=E2=80=AFAM Jesse Taube <jesse@rivosinc.com> wr=
ote:
>
> Dectect the Zkr extension and use it to seed the kernel base address.
>
> Detection of the extension can not be done in the typical fashion, as
> this is very early in the boot process. Instead, add a trap handler
> and run it to see if the extension is present.
>
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> ---
>  arch/riscv/kernel/pi/Makefile           |  2 +-
>  arch/riscv/kernel/pi/archrandom_early.c | 71 +++++++++++++++++++++++++
>  arch/riscv/mm/init.c                    |  3 ++
>  3 files changed, 75 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/kernel/pi/archrandom_early.c
>
> diff --git a/arch/riscv/kernel/pi/Makefile b/arch/riscv/kernel/pi/Makefil=
e
> index 50bc5ef7dd2f..9025eb52945a 100644
> --- a/arch/riscv/kernel/pi/Makefile
> +++ b/arch/riscv/kernel/pi/Makefile
> @@ -32,5 +32,5 @@ $(obj)/string.o: $(srctree)/lib/string.c FORCE
>  $(obj)/ctype.o: $(srctree)/lib/ctype.c FORCE
>         $(call if_changed_rule,cc_o_c)
>
> -obj-y          :=3D cmdline_early.pi.o fdt_early.pi.o string.pi.o ctype.=
pi.o lib-fdt.pi.o lib-fdt_ro.pi.o
> +obj-y          :=3D cmdline_early.pi.o fdt_early.pi.o string.pi.o ctype.=
pi.o lib-fdt.pi.o lib-fdt_ro.pi.o archrandom_early.pi.o
>  extra-y                :=3D $(patsubst %.pi.o,%.o,$(obj-y))
> diff --git a/arch/riscv/kernel/pi/archrandom_early.c b/arch/riscv/kernel/=
pi/archrandom_early.c
> new file mode 100644
> index 000000000000..311be9388b5c
> --- /dev/null
> +++ b/arch/riscv/kernel/pi/archrandom_early.c
> @@ -0,0 +1,71 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/*
> + * To avoid rewriteing code include asm/archrandom.h and create macros
> + * for the functions that won't be included.
> + */
> +
> +#define riscv_has_extension_likely(...) false
> +#define pr_err_once(...)
> +
> +#include <linux/types.h>
> +#include <asm/hwcap.h>
> +#include <asm/archrandom.h>
> +
> +/*
> + * Asm goto is needed so that the compiler does not remove the label.
> + */
> +
> +#define csr_goto_swap(csr, val)                                         =
       \
> +({                                                                     \
> +       unsigned long __v;                                              \
> +       __asm__ __volatile__ goto("csrrw %0, " __ASM_STR(csr) ", %1"    \
> +                                 : "=3Dr" (__v) : "rK" (&&val)          =
 \
> +                                 : "memory" : val);                    \
> +       __v;                                                            \
> +})
> +
> +/*
> + * Declare the functions that are exported (but prefixed) here so that L=
LVM
> + * does not complain it lacks the 'static' keyword (which, if added, mak=
es
> + * LLVM complain because the function is actually unused in this file).
> + */
> +
> +u64 get_kaslr_seed_zkr(void);
> +
> +/*
> + * This function is called by setup_vm to check if the kernel has the ZK=
R.
> + * Traps haven't been set up yet, but save and restore the TVEC to avoid
> + * any side effects.
> + */
> +
> +static inline bool __must_check riscv_has_zkr(void)
> +{
> +       unsigned long tvec;
> +
> +       tvec =3D csr_goto_swap(CSR_TVEC, not_zkr);
> +       csr_swap(CSR_SEED, 0);
> +       csr_write(CSR_TVEC, tvec);
> +       return true;
> +not_zkr:
> +       csr_write(CSR_TVEC, tvec);
> +       return false;
> +}
> +
> +u64 get_kaslr_seed_zkr(void)
> +{
> +       const int needed_seeds =3D sizeof(u64) / sizeof(long);
> +       int i =3D 0;
> +       u64 seed =3D 0;
> +       long *entropy =3D (long *)(&seed);
> +
> +       if (!riscv_has_zkr())
> +               return 0;
> +
> +       for (i =3D 0; i < needed_seeds; i++) {
> +               if (!csr_seed_long(&entropy[i]))
> +                       return 0;
> +       }
> +
> +       return seed;
> +}
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 9940171c79f0..8ef1edd2cddd 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -1025,6 +1025,7 @@ static void __init pt_ops_set_late(void)
>  #ifdef CONFIG_RANDOMIZE_BASE
>  extern bool __init __pi_set_nokaslr_from_cmdline(uintptr_t dtb_pa);
>  extern u64 __init __pi_get_kaslr_seed(uintptr_t dtb_pa);
> +extern u64 __init __pi_get_kaslr_seed_zkr(void);
>
>  static int __init print_nokaslr(char *p)
>  {
> @@ -1049,6 +1050,8 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>                 u32 kernel_size =3D (uintptr_t)(&_end) - (uintptr_t)(&_st=
art);
>                 u32 nr_pos;
>
> +               if (kaslr_seed =3D=3D 0)
> +                       kaslr_seed =3D __pi_get_kaslr_seed_zkr();

Could you elaborate on why we try to get the seed from DT first,
rather than from ZKR? Also, I was wondering if, by any chance, it can
leverage arch_get_random_seed_longs() to get the seed instead of
__pi_get_kasler_seed_zkr()? Thanks

>                 /*
>                  * Compute the number of positions available: we are limi=
ted
>                  * by the early page table that only has one PUD and we m=
ust
> --
> 2.43.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
