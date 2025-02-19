Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626001D79BE
	for <llvm@lists.linux.dev>; Wed, 19 Feb 2025 23:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740007825; cv=none; b=Xv7IsO3sIsIjST2aUzC/x31HDVHPE6/KJKMzCF7LkHjgjEyJQ+DmIsde8WoNO+imp7hs5ROe4ft1+acWVmtRiYaBFq7K2Nq7Hdlnac2m9Lu/i1oIujy6qZsw86AeYmWpzHx3x/irJZPoQ7C4ItIopGRZE+EJmPONh7kj3jKbxHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740007825; c=relaxed/simple;
	bh=dkSLcuAkOEkjzmNl7oQGnI8+f2nzJX2wq4RcdSEzjgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NZPRFDjk2gJy5J7Go11+rfPMJuFi0jQpQ1cSfEjIi92njDIq+0cCzA0RdjVgIgfxsscsC80HvddEwV2bemRMy7UMVeA+NVxN8WLVirw+mhAlXB1fX3b/0X6PjAfreoOlEd0GB2+SN2f2TeZiZXRVhXeTKOAV3W2kMGkZSmd7D8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N76vbqq5; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N76vbqq5"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-439846bc7eeso1750565e9.3
        for <llvm@lists.linux.dev>; Wed, 19 Feb 2025 15:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740007822; x=1740612622; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1GGaSL1EMbBNY4X399BrJn+mN5UB9HBffE2l1nq9Fw=;
        b=N76vbqq50Uw7egfUFjmMm9ZEW2fWRpDMgjVlyaALSHwEmUIpwraLlocepEPt8FSWXK
         I7DL5G5BUTNDfrgfSqYrNgKe/au83P5oy8n7Okq4xGX98ebFZ1pbPgBePSbkOHCEyPtz
         yFaCdqrWjso9TQTjvAO1jVk2vTMAZa/oMDhm3l1q4L0Vg6TcQYADIMKlR6QU4xiZIpZH
         xhm/+lhnGAfXoBkZlB8IwKObMuLicJv1OpsPefw8zUzx16BOqwH7oSRA3bvNkAOLc55I
         RcYrjojmW8n++ZrrMgcNkfVFN7I92RPrArgrD4tox0y+G2TsQdkmRWUAkgQh1+0boonZ
         yCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740007822; x=1740612622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K1GGaSL1EMbBNY4X399BrJn+mN5UB9HBffE2l1nq9Fw=;
        b=H94JW7RUMScvcFn6otS7NkwpQlD7ZpLmP8yrTZrwNRGWuQPKEIatnHGKe1mvYmZZDo
         DOx6wvqwF+qNyBEwkPovGusT5HB3ybuV8kS6fEEwgCPLC95WiHd9W81jlcP6pfDdrDNc
         5X+jYzaaPC4DF/xUt+9F8X4cZHrvpJ7NFoatrsSy4tXmT9Nm3Gbu+7VAhfJbSQ5lku95
         D7DMxkX6HCHh6CHgOAHlIH6e/GnFlPdq0bnzoI3YWFp4OwyKvY+OSBd151/MmxcEpt4v
         iXqMSJww+hwP0VA5bv/2I5EKhIzj94otjRWSD3LR/CLeuHOwEllEm5UXNik9dUa718VF
         Jytg==
X-Forwarded-Encrypted: i=1; AJvYcCWJwhww+yLCXv5YCZfVuGDTeiWa/bSrGp3X55sKtenKiDg2e2nGf89P50i1gG/nt/Auk0j1@lists.linux.dev
X-Gm-Message-State: AOJu0YzFflgSJlzNqw7H7JqtQ39tsDjPwlQH+dXNjOWCR8iOUhcPSV4x
	KcHLKR6jrVC/gG7Z0whNkbHoductg+wQ8/Fh6pzbMN4Tr9794Wdf4EuACAjUnxgOjqK3RaJWGXR
	nwFHekMAnHgkvN0U3skSZtPAa7K4=
X-Gm-Gg: ASbGncsx09iP1L2I9KuYIShjc/baWSmWai0ix4dwdPxgzepbhcStYwym0EsCeYHXWvi
	X7RFl+byXzd3RdYkludtsIo1qzzHcWGd6BxYg4/r/FuOELSXbzNunTMR0pqRvnMTKbw8xvfl34N
	0=
X-Google-Smtp-Source: AGHT+IFk7eMZYpnIc8kUgdKFr2fq40k19PHjHMj5y4xTuWwCfW66IOFvng6dtc1UANKR7c5qhgSdUJXGtz5TZYpkBcc=
X-Received: by 2002:a05:6000:178b:b0:38f:443b:48f4 with SMTP id
 ffacd0b85a97d-38f587f3d8cmr4457835f8f.49.1740007821516; Wed, 19 Feb 2025
 15:30:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1739866028.git.maciej.wieczor-retman@intel.com> <b1a6cd99e98bf85adc9bdf063f359c136c1a5e78.1739866028.git.maciej.wieczor-retman@intel.com>
In-Reply-To: <b1a6cd99e98bf85adc9bdf063f359c136c1a5e78.1739866028.git.maciej.wieczor-retman@intel.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 20 Feb 2025 00:30:09 +0100
X-Gm-Features: AWEUYZmNqej25uGq8URgfmDzBpW2RyznVfstivturY56XWT9sQs1qkeZ-eNhhZk
Message-ID: <CA+fCnZdRHNaxf02DXMm3q+Ecwd4XiaVZ0X9P-sdFfy+9jBMO=w@mail.gmail.com>
Subject: Re: [PATCH v2 02/14] kasan: sw_tags: Check kasan_flag_enabled at runtime
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: kees@kernel.org, julian.stecklina@cyberus-technology.de, 
	kevinloughlin@google.com, peterz@infradead.org, tglx@linutronix.de, 
	justinstitt@google.com, catalin.marinas@arm.com, wangkefeng.wang@huawei.com, 
	bhe@redhat.com, ryabinin.a.a@gmail.com, kirill.shutemov@linux.intel.com, 
	will@kernel.org, ardb@kernel.org, jason.andryuk@amd.com, 
	dave.hansen@linux.intel.com, pasha.tatashin@soleen.com, 
	ndesaulniers@google.com, guoweikang.kernel@gmail.com, dwmw@amazon.co.uk, 
	mark.rutland@arm.com, broonie@kernel.org, apopple@nvidia.com, bp@alien8.de, 
	rppt@kernel.org, kaleshsingh@google.com, richard.weiyang@gmail.com, 
	luto@kernel.org, glider@google.com, pankaj.gupta@amd.com, 
	pawan.kumar.gupta@linux.intel.com, kuan-ying.lee@canonical.com, 
	tony.luck@intel.com, tj@kernel.org, jgross@suse.com, dvyukov@google.com, 
	baohua@kernel.org, samuel.holland@sifive.com, dennis@kernel.org, 
	akpm@linux-foundation.org, thomas.weissschuh@linutronix.de, surenb@google.com, 
	kbingham@kernel.org, ankita@nvidia.com, nathan@kernel.org, ziy@nvidia.com, 
	xin@zytor.com, rafael.j.wysocki@intel.com, andriy.shevchenko@linux.intel.com, 
	cl@linux.com, jhubbard@nvidia.com, hpa@zytor.com, 
	scott@os.amperecomputing.com, david@redhat.com, jan.kiszka@siemens.com, 
	vincenzo.frascino@arm.com, corbet@lwn.net, maz@kernel.org, mingo@redhat.com, 
	arnd@arndb.de, ytcoode@gmail.com, xur@google.com, morbo@google.com, 
	thiago.bauermann@linaro.org, linux-doc@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025 at 9:16=E2=80=AFAM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> From: Samuel Holland <samuel.holland@sifive.com>
>
> On RISC-V, the ISA extension required to dereference tagged pointers is
> optional, and the interface to enable pointer masking requires firmware
> support. Therefore, we must detect at runtime if sw_tags is usable on a
> given machine. Reuse the logic from hw_tags to dynamically enable KASAN.

Is this patch required on x86 as well? If so, I think it makes sense
to point it out here. And do the same in messages for other commits
that now mention RISC-V.


>
> This commit makes no functional change to the KASAN_HW_TAGS code path.
>
> Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
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
> index 9a6927394b54..7f82af13b6a6 100644
> --- a/mm/kasan/hw_tags.c
> +++ b/mm/kasan/hw_tags.c
> @@ -45,13 +45,6 @@ static enum kasan_arg kasan_arg __ro_after_init;
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
> @@ -259,9 +252,6 @@ void __init kasan_init_hw_tags(void)
>
>         kasan_init_tags();
>
> -       /* KASAN is now initialized, enable it. */
> -       static_branch_enable(&kasan_flag_enabled);
> -
>         pr_info("KernelAddressSanitizer initialized (hw-tags, mode=3D%s, =
vmalloc=3D%s, stacktrace=3D%s)\n",
>                 kasan_mode_info(),
>                 str_on_off(kasan_vmalloc_enabled()),
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
> 2.47.1
>
