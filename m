Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D6F1B86E7
	for <llvm@lists.linux.dev>; Wed, 14 Aug 2024 16:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723651442; cv=none; b=f/+chp3HVlWwhpOIVMGzfX6QqRGSGfpuxofrKCb33lZCPRdGD8txvnUFR5+nAA8xTej3lTy9KsBhnzvUDDOzz2Si03cU9J/+/msvyjjK19tjuxieKByOisxGbMczbGeyG8A3OOy9OaIyso74uZwECu7TTkvu4SOzk2lfqfXI5tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723651442; c=relaxed/simple;
	bh=cgVvlYHzOokE9n6B8mPzUMU7UjOjC7BQjqpz2EtY0PI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rF6rkoq7bx7x4y99g3sokmkeFkq1p/YtBwBPawsAxaOTDVEt+tHl0Qvsd1vCIgUZe3pBqvhPtildtqNiw0uiZ3SDMadzwLN/4NcDLFP+2grShpVtSOuxGuGJ/cEYaGhQ7plL8oFGXZwHTSEOjHBtB5yG7zqQJGHYU8sv9wtCeI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XNvj0XV9; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XNvj0XV9"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3684407b2deso41633f8f.1
        for <llvm@lists.linux.dev>; Wed, 14 Aug 2024 09:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723651439; x=1724256239; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnVAjE8y+xk4uzYKyeuMufgQpUYFTpPW67lHJ8a/9Vo=;
        b=XNvj0XV9wqHhsVe/t28neYEh5+zfpHfmaAHd+yIC5JZ41IR6s5HwO1ce+J8eSDUQQ3
         J/D5nFIOQmVDTgi8vKEM9JnlpI+EaDpvXvo0FKreD/XJ6KsNgeB6N5Oi3Vl3noawJq5o
         rFctwQ6WWVvJldRvVyohb2uYNdvBx56JJloXiUdPMoJu0enB/5YdO5wz8U00+/Am9Gq7
         ecY144TP8Ib7DB3HPubLIm8n8htB0ocZtV8jzRmMCiGVPMCiRw4bgtOWbTmFoNfr2+Ui
         0VrKHXJRpgLCJioSprCtjREhOEX47IEZGhsdE5qDigVbhs/lDHPz5/OoKqlnTscAKjge
         VIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723651439; x=1724256239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dnVAjE8y+xk4uzYKyeuMufgQpUYFTpPW67lHJ8a/9Vo=;
        b=O/QD8uRl+SwIvlwCG8OVlFhb5cvrUNvK11FtMdokuBAP1xmX7T6n8FY/7XQb2U+bwv
         bshyQbU1BsCkPSbkPn4mhOYmrhcbUgJ7snC3MXiVCiC7klG4oblTc5lzQ0QEFYYHokQr
         BkjYxm/tcykS1Hz+8F993RiDOpzcMCa+y+j8tfK740Mj0Fa4QgRxZpToH7Zq4iIur8KH
         g6gCIVJCQU3depLwniJVeaIXl11mex7FQopjsf56F8xOd8Mfctnmeg8uBF2e+lAAUci2
         qz48ubgvxyxrmClVMGMpdHaq5lNjtJDRk8HawQ99Y3cy0djka52lM5u2fdybzlbl9x7f
         xuOA==
X-Forwarded-Encrypted: i=1; AJvYcCXwcYVCUgo5c8qG4qhS0hviDZdeMkiEzbN7N12tyntjO1QAgUdU068rtw9TNNnTIYHLfcXa+0ErFueq7luyM47RNCThrg==
X-Gm-Message-State: AOJu0Yx4xNX21i1gCO+9DuwEpET8nmWPFpYwgz1TJTk2oZ+Azm8bRz+T
	bp8Rvos9pPtnnJfbYvykMs9TwB3/H+ckPKRbLB+WuehlyyGcISaZKgTBaehSOGRm7mq8ZDhdIOj
	6BSq7wrqFG9MqoBlejVKTfYz+MSg=
X-Google-Smtp-Source: AGHT+IG96LhAw8wrgerj/6cLpq6rZugdU6Z19efxBYeTunxRdokjJ/CnGMzl4ifk+lDafce3fGBmhHooKWiIky2kX/w=
X-Received: by 2002:a05:6000:1542:b0:368:7f4f:9ead with SMTP id
 ffacd0b85a97d-3717775b981mr2772783f8f.7.1723651438898; Wed, 14 Aug 2024
 09:03:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240814085618.968833-1-samuel.holland@sifive.com> <20240814085618.968833-3-samuel.holland@sifive.com>
In-Reply-To: <20240814085618.968833-3-samuel.holland@sifive.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Wed, 14 Aug 2024 18:03:48 +0200
Message-ID: <CA+fCnZdqCSeSNeB+OpWFTPiTY0BguZKkWexiiELYt8TRqw4Vvw@mail.gmail.com>
Subject: Re: [RFC PATCH 2/7] kasan: sw_tags: Check kasan_flag_enabled at runtime
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
> On RISC-V, the ISA extension required to dereference tagged pointers is
> optional, and the interface to enable pointer masking requires firmware
> support. Therefore, we must detect at runtime if sw_tags is usable on a
> given machine. Reuse the logic from hw_tags to dynamically enable KASAN.
>
> This commit makes no functional change to the KASAN_HW_TAGS code path.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
>  include/linux/kasan-enabled.h | 15 +++++----------
>  mm/kasan/hw_tags.c            | 10 ----------
>  mm/kasan/tags.c               | 10 ++++++++++
>  3 files changed, 15 insertions(+), 20 deletions(-)
>
> diff --git a/include/linux/kasan-enabled.h b/include/linux/kasan-enabled.=
h
> index 6f612d69ea0c..648bda9495b7 100644
> --- a/include/linux/kasan-enabled.h
> +++ b/include/linux/kasan-enabled.h
> @@ -4,7 +4,7 @@
>
>  #include <linux/static_key.h>
>
> -#ifdef CONFIG_KASAN_HW_TAGS
> +#if defined(CONFIG_KASAN_SW_TAGS) || defined(CONFIG_KASAN_HW_TAGS)
>
>  DECLARE_STATIC_KEY_FALSE(kasan_flag_enabled);
>
> @@ -13,23 +13,18 @@ static __always_inline bool kasan_enabled(void)
>         return static_branch_likely(&kasan_flag_enabled);
>  }
>
> -static inline bool kasan_hw_tags_enabled(void)
> -{
> -       return kasan_enabled();
> -}
> -
> -#else /* CONFIG_KASAN_HW_TAGS */
> +#else /* CONFIG_KASAN_SW_TAGS || CONFIG_KASAN_HW_TAGS */
>
>  static inline bool kasan_enabled(void)
>  {
>         return IS_ENABLED(CONFIG_KASAN);
>  }
>
> +#endif /* CONFIG_KASAN_SW_TAGS || CONFIG_KASAN_HW_TAGS */
> +
>  static inline bool kasan_hw_tags_enabled(void)
>  {
> -       return false;
> +       return IS_ENABLED(CONFIG_KASAN_HW_TAGS) && kasan_enabled();
>  }
>
> -#endif /* CONFIG_KASAN_HW_TAGS */
> -
>  #endif /* LINUX_KASAN_ENABLED_H */
> diff --git a/mm/kasan/hw_tags.c b/mm/kasan/hw_tags.c
> index 9958ebc15d38..c3beeb94efa5 100644
> --- a/mm/kasan/hw_tags.c
> +++ b/mm/kasan/hw_tags.c
> @@ -43,13 +43,6 @@ static enum kasan_arg kasan_arg __ro_after_init;
>  static enum kasan_arg_mode kasan_arg_mode __ro_after_init;
>  static enum kasan_arg_vmalloc kasan_arg_vmalloc __initdata;
>
> -/*
> - * Whether KASAN is enabled at all.
> - * The value remains false until KASAN is initialized by kasan_init_hw_t=
ags().
> - */
> -DEFINE_STATIC_KEY_FALSE(kasan_flag_enabled);
> -EXPORT_SYMBOL(kasan_flag_enabled);
> -
>  /*
>   * Whether the selected mode is synchronous, asynchronous, or asymmetric=
.
>   * Defaults to KASAN_MODE_SYNC.
> @@ -257,9 +250,6 @@ void __init kasan_init_hw_tags(void)
>
>         kasan_init_tags();
>
> -       /* KASAN is now initialized, enable it. */
> -       static_branch_enable(&kasan_flag_enabled);
> -
>         pr_info("KernelAddressSanitizer initialized (hw-tags, mode=3D%s, =
vmalloc=3D%s, stacktrace=3D%s)\n",
>                 kasan_mode_info(),
>                 kasan_vmalloc_enabled() ? "on" : "off",
> diff --git a/mm/kasan/tags.c b/mm/kasan/tags.c
> index d65d48b85f90..c111d98961ed 100644
> --- a/mm/kasan/tags.c
> +++ b/mm/kasan/tags.c
> @@ -32,6 +32,13 @@ enum kasan_arg_stacktrace {
>
>  static enum kasan_arg_stacktrace kasan_arg_stacktrace __initdata;
>
> +/*
> + * Whether KASAN is enabled at all.
> + * The value remains false until KASAN is initialized by kasan_init_tags=
().
> + */
> +DEFINE_STATIC_KEY_FALSE(kasan_flag_enabled);
> +EXPORT_SYMBOL(kasan_flag_enabled);
> +
>  /* Whether to collect alloc/free stack traces. */
>  DEFINE_STATIC_KEY_TRUE(kasan_flag_stacktrace);
>
> @@ -92,6 +99,9 @@ void __init kasan_init_tags(void)
>                 if (WARN_ON(!stack_ring.entries))
>                         static_branch_disable(&kasan_flag_stacktrace);
>         }
> +
> +       /* KASAN is now initialized, enable it. */
> +       static_branch_enable(&kasan_flag_enabled);
>  }
>
>  static void save_stack_info(struct kmem_cache *cache, void *object,
> --
> 2.45.1
>

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
