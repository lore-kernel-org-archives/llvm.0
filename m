Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE735CDC3
	for <llvm@lists.linux.dev>; Wed, 14 Feb 2024 15:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707924292; cv=none; b=T9HcpWlH8lclmc9o+Vlo65eq6ecPF11e/wCyNowz3YVfWJTT9HMIV/QWsFeDTfRJw0otYBgG0MejtKXJa7ZnAUeNyjcZmwusnek0cQXErDBlbeFqUdKaUEBlElnvRKKOTXV8h+OPeY8gtYHsL1AbTAa3wUHCVgJsJ17DTsIqTCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707924292; c=relaxed/simple;
	bh=hsmgrocu2TlA5mNcB9avYgNTU+aJwAqfDaROUoUtFBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=le6sBX5ZClNcDVvI6w00qICrFWfd3D6Pc66onizQHdpSOrCQcerLF0Mifyoz1Rsm7uKTJ/6IPUrU75t3SsACz1NWIv8FVRUfdyIJBWeQMb6ZlMOtC3cicWzEob1mFJKeKh9Gp5SJ35tmX0HpfhQ6B+5wN0Jtirz/K1J7LCGn3wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCfaFofd; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCfaFofd"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5116ec49081so6233446e87.2
        for <llvm@lists.linux.dev>; Wed, 14 Feb 2024 07:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707924289; x=1708529089; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fuwSFUqzOZOBAkEnYyxbOsr/zGOfZNawxJtBP6SyZdg=;
        b=CCfaFofdOO5LSub0lJP4N5JCQswqcByNkDw1Madh70L6aTdO1y11gjcD3CSDgo64iT
         tbD9KLUkXtfmMMXv4lKgH+D4+mXjvKbDlufDQewWJZcPgTMUDkTUJCCxmYg/qHJzooK2
         03elXcc4heB2ieOB9Gd4PGzPybuDQk2yofdjYnIkNVlWSFv45hsfjYtYr+uJFLd944H1
         aGXqvziJ/OfrgAOiiA1TCighhwFP88q9FJ8kZFgqXJLF3j/Sg0BKD68CGOk6tKHqO+wI
         8DIiWeTpiPE6BniBGZSlgOAxTKQdhcztFYZonnqcXdNIPJ78ZL/7fPr+meiJ0/lGJGJK
         OOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707924289; x=1708529089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fuwSFUqzOZOBAkEnYyxbOsr/zGOfZNawxJtBP6SyZdg=;
        b=rAebkNsmKk6D/2hIc5wkJssC7EXvhmtioUn7d4gLXTzxJcfo+xPr0Opad0azifizu1
         SmRa+iXY4EH1Dnjpxs5NzLNvmuFa/+gYa9KGHd755ZgpEkxeQe5zCiktDuvImigvRzBf
         PqoBtY6Ojr1LLA4YrkxeBBjxVDZetIFkUgF+EWUne3rEDnA82q3mMyaJZy+WRotQdVzc
         azCiMrcvAuVq8BMn2kth1NDS5f/+8TQiBc4Xzikxh/4exXvryRO/DfFDAaE38Sx4XdT4
         cL6iKLxVKwIr7l2U3StrmOTNseluF0fWR9s/bP7nat0h103MGvpuU7Ul2Uv85uXuQn8v
         nBhA==
X-Forwarded-Encrypted: i=1; AJvYcCVEXt2mvE/zuATYrLSnKe+8xgQCkCzNEK+Tj/Qa9ioOneqzlqLmjRQB68DdxoGD6z0M0NmUva7DpM8gsKdSRebL3mySsg==
X-Gm-Message-State: AOJu0YwqVwIQm6pwFtLumtgKuo5XCzjEw2nFwov1HnLc5p9oG5/e+bYN
	j+WvUviDOoJLTqgJE9US8p5QMvhK6PPtZu77G+WHDV9/VEboDkLaxTzcn6BkHfdz6U7Bh/Z53Jq
	gkQeeLvxsszzVxPhkjNGuQ/5x3A==
X-Google-Smtp-Source: AGHT+IG2va23w/89C0WPeIAZPgXAyjUpjpvM8HEUvRUre91O4NK5Yw/wausM2RYayzMAYIV8Ir2myA3y/iqTsms3dp8=
X-Received: by 2002:a05:6512:32b2:b0:511:96d0:5ae1 with SMTP id
 q18-20020a05651232b200b0051196d05ae1mr2218236lfe.40.1707924288744; Wed, 14
 Feb 2024 07:24:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240213124143.1484862-13-ardb+git@google.com> <20240213124143.1484862-24-ardb+git@google.com>
In-Reply-To: <20240213124143.1484862-24-ardb+git@google.com>
From: Brian Gerst <brgerst@gmail.com>
Date: Wed, 14 Feb 2024 10:24:37 -0500
Message-ID: <CAMzpN2jt3nTmDJ4y6zRFJMSGTcD8eQJY_MjbsnJ7my3hH8d9HA@mail.gmail.com>
Subject: Re: [PATCH v4 11/11] x86/startup_64: Drop global variables keeping
 track of LA57 state
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Kevin Loughlin <kevinloughlin@google.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Dionna Glaze <dionnaglaze@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <keescook@chromium.org>, linux-arch@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 7:42=E2=80=AFAM Ard Biesheuvel <ardb+git@google.com=
> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> On x86_64, the core kernel is entered in long mode, which implies that
> paging is enabled. This means that the CR4.LA57 control bit is
> guaranteed to be in sync with the number of paging levels used by the
> kernel, and there is no need to store this in a variable.
>
> There is also no need to use variables for storing the calculations of
> pgdir_shift and ptrs_per_p4d, as they are easily determined on the fly.
>
> This removes the need for two different sources of truth for determining
> whether 5-level paging is in use: CR4.LA57 always reflects the actual
> state, and never changes from the point of view of the 64-bit core
> kernel. The only potential concern is the cost of CR4 accesses, which
> can be mitigated using alternatives patching based on feature detection.
>
> Note that even the decompressor does not manipulate any page tables
> before updating CR4.LA57, so it can also avoid the associated global
> variables entirely. However, as it does not implement alternatives
> patching, the associated ELF sections need to be discarded.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/x86/boot/compressed/misc.h         |  4 --
>  arch/x86/boot/compressed/pgtable_64.c   | 12 ----
>  arch/x86/boot/compressed/vmlinux.lds.S  |  1 +
>  arch/x86/include/asm/pgtable_64_types.h | 58 ++++++++------------
>  arch/x86/kernel/cpu/common.c            |  2 -
>  arch/x86/kernel/head64.c                | 33 +----------
>  arch/x86/mm/kasan_init_64.c             |  3 -
>  arch/x86/mm/mem_encrypt_identity.c      |  9 ---
>  8 files changed, 27 insertions(+), 95 deletions(-)
>
> diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/m=
isc.h
> index bc2f0f17fb90..2b15ddd0e177 100644
> --- a/arch/x86/boot/compressed/misc.h
> +++ b/arch/x86/boot/compressed/misc.h
> @@ -16,9 +16,6 @@
>
>  #define __NO_FORTIFY
>
> -/* cpu_feature_enabled() cannot be used this early */
> -#define USE_EARLY_PGTABLE_L5
> -
>  /*
>   * Boot stub deals with identity mappings, physical and virtual addresse=
s are
>   * the same, so override these defines.
> @@ -178,7 +175,6 @@ static inline int count_immovable_mem_regions(void) {=
 return 0; }
>  #endif
>
>  /* ident_map_64.c */
> -extern unsigned int __pgtable_l5_enabled, pgdir_shift, ptrs_per_p4d;
>  extern void kernel_add_identity_map(unsigned long start, unsigned long e=
nd);
>
>  /* Used by PAGE_KERN* macros: */
> diff --git a/arch/x86/boot/compressed/pgtable_64.c b/arch/x86/boot/compre=
ssed/pgtable_64.c
> index 51f957b24ba7..ae72f53f5e77 100644
> --- a/arch/x86/boot/compressed/pgtable_64.c
> +++ b/arch/x86/boot/compressed/pgtable_64.c
> @@ -9,13 +9,6 @@
>  #define BIOS_START_MIN         0x20000U        /* 128K, less than this i=
s insane */
>  #define BIOS_START_MAX         0x9f000U        /* 640K, absolute maximum=
 */
>
> -#ifdef CONFIG_X86_5LEVEL
> -/* __pgtable_l5_enabled needs to be in .data to avoid being cleared alon=
g with .bss */
> -unsigned int __section(".data") __pgtable_l5_enabled;
> -unsigned int __section(".data") pgdir_shift =3D 39;
> -unsigned int __section(".data") ptrs_per_p4d =3D 1;
> -#endif
> -
>  /* Buffer to preserve trampoline memory */
>  static char trampoline_save[TRAMPOLINE_32BIT_SIZE];
>
> @@ -125,11 +118,6 @@ asmlinkage void configure_5level_paging(struct boot_=
params *bp, void *pgtable)
>                         native_cpuid_eax(0) >=3D 7 &&
>                         (native_cpuid_ecx(7) & (1 << (X86_FEATURE_LA57 & =
31)))) {
>                 l5_required =3D true;
> -
> -               /* Initialize variables for 5-level paging */
> -               __pgtable_l5_enabled =3D 1;
> -               pgdir_shift =3D 48;
> -               ptrs_per_p4d =3D 512;
>         }
>
>         /*
> diff --git a/arch/x86/boot/compressed/vmlinux.lds.S b/arch/x86/boot/compr=
essed/vmlinux.lds.S
> index 083ec6d7722a..06358bb067fe 100644
> --- a/arch/x86/boot/compressed/vmlinux.lds.S
> +++ b/arch/x86/boot/compressed/vmlinux.lds.S
> @@ -81,6 +81,7 @@ SECTIONS
>                 *(.dynamic) *(.dynsym) *(.dynstr) *(.dynbss)
>                 *(.hash) *(.gnu.hash)
>                 *(.note.*)
> +               *(.altinstructions .altinstr_replacement)
>         }
>
>         .got.plt (INFO) : {
> diff --git a/arch/x86/include/asm/pgtable_64_types.h b/arch/x86/include/a=
sm/pgtable_64_types.h
> index 38b54b992f32..6a57bfdff52b 100644
> --- a/arch/x86/include/asm/pgtable_64_types.h
> +++ b/arch/x86/include/asm/pgtable_64_types.h
> @@ -6,7 +6,10 @@
>
>  #ifndef __ASSEMBLY__
>  #include <linux/types.h>
> +#include <asm/alternative.h>
> +#include <asm/cpufeatures.h>
>  #include <asm/kaslr.h>
> +#include <asm/processor-flags.h>
>
>  /*
>   * These are used to make use of C type-checking..
> @@ -21,63 +24,50 @@ typedef unsigned long       pgprotval_t;
>  typedef struct { pteval_t pte; } pte_t;
>  typedef struct { pmdval_t pmd; } pmd_t;
>
> -#ifdef CONFIG_X86_5LEVEL
> -extern unsigned int __pgtable_l5_enabled;
> -
> -#ifdef USE_EARLY_PGTABLE_L5
> -/*
> - * cpu_feature_enabled() is not available in early boot code.
> - * Use variable instead.
> - */
> -static inline bool pgtable_l5_enabled(void)
> +static __always_inline __pure bool pgtable_l5_enabled(void)
>  {
> -       return __pgtable_l5_enabled;
> -}
> -#else
> -#define pgtable_l5_enabled() cpu_feature_enabled(X86_FEATURE_LA57)
> -#endif /* USE_EARLY_PGTABLE_L5 */
> +       unsigned long r;
> +       bool ret;
>
> -#else
> -#define pgtable_l5_enabled() 0
> -#endif /* CONFIG_X86_5LEVEL */
> +       if (!IS_ENABLED(CONFIG_X86_5LEVEL))
> +               return false;
> +
> +       asm(ALTERNATIVE_TERNARY(
> +               "movq %%cr4, %[reg] \n\t btl %[la57], %k[reg]" CC_SET(c),
> +               %P[feat], "stc", "clc")
> +               : [reg] "=3D&r" (r), CC_OUT(c) (ret)
> +               : [feat] "i"  (X86_FEATURE_LA57),
> +                 [la57] "i"  (X86_CR4_LA57_BIT)
> +               : "cc");

This should be more like _static_cpu_has(), where the runtime test is
out of line in a discardable section, and the inline part is just a
JMP or NOP.

Brian Gerst
