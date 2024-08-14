Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0170C1B86E0
	for <llvm@lists.linux.dev>; Wed, 14 Aug 2024 16:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723651458; cv=none; b=J38gSpmpeTaWI7Q63gTwuhWY39FL+3EPCRQjnmQdk4R4JUJrv0zNm9uj4qMEQvxLbR0xkSr7n6FJRsAchiAi+HDre/8OPUcvXWdG2YrgO9+962WQcdh0CiKA7WB9IFkh+TyZpPpCkeJtj2w7uHzay14628SMdClZybPBHTVL02Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723651458; c=relaxed/simple;
	bh=PDMVunQ3YpiXJYBSD85MkpDHv+K8uf5nCKFDXtwOTpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o8HfHXVER1ZXjcFM9eeB0/rVf3LzcC5PXTFEuk/pf4jHqlexEHRNArXeeFXKOwrn1RNLdaBLT6wjlmwUrajwB3RlRLHipg45bXfEa/3xYPtq43OoYl/TbfxG/AotjFYhELQrabE29HFWVZHSNXvcOQKpY7lyJ563RprnYBULnNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ehyAk6n+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ehyAk6n+"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42803bbf842so67298855e9.1
        for <llvm@lists.linux.dev>; Wed, 14 Aug 2024 09:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723651455; x=1724256255; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YUv+UEK7DbXaXmZeHJkOXNJ/5IGPTcl3OKytRpyoA0=;
        b=ehyAk6n+yFAbQdhjPF8WNNMxFKIEdpovbcWkiRr/Lm1f2LccL0ALZMCPjW9sK8OCm0
         7/EjKDudLXdJmyUH7W0+77o+IASrU2+RqVABMqokKgLiMjvqfyGl/EqT6Jmb23T8014A
         /AtPJu2H39QeYpOpP7oPB5unQ31JPIgG6M0Dc+9DJMNoScGW74Q2GVgY/Vgbh4hhnrAb
         7M3fTkszOYqbxRfp1f+gBYkMWdESbt//Y+/t6EVRtsfiUglkUo/lOzfNC7GFvhdT5LFz
         OgBnAmHGeABk9MCH8WDGCLBpC3KYSjEcbr/4D20vNFuGtsCeMc0zfglqjH/y97fCZrMY
         1vvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723651455; x=1724256255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9YUv+UEK7DbXaXmZeHJkOXNJ/5IGPTcl3OKytRpyoA0=;
        b=UvV5/2waKfCZGTvr/wWCHkcALQM8PEm0RLEp0lZXR411iUW0cCeRK7EWYGPvlvtmbh
         GCIw1Rglkf/cZ5EFcdIkz0IGIQG7K3vglNSwhxMdxwJz95b/bQ/YWXAsI1EAQgxslWCx
         ye6vVJWCqCleCb00ANydlCcYjwlLpOPFifXSArAT2vyfRBuZVWspPcs+qcxvUa92sBI3
         quFMsM7v+KXt3pozb2BZETpUsf533WUb2PMBLTyqR7PMWjTjumcQkrxxOb+WgjGezjVI
         cqL+RcXixVWJ/3u91DrkCw07KjkG1gPmEESMWPK23x70qRca+lQEOlHE9LPQtM3qqAS6
         iFPg==
X-Forwarded-Encrypted: i=1; AJvYcCWdbnt6rvQLjCdtgM6QaiFlCId2Kj6bqA9hfcVMpnxDeXbATw45luuOlDSbwL2HgL5F8YfY@lists.linux.dev
X-Gm-Message-State: AOJu0YwFVC+Bx7LWHRlwXRBoV1gHTBSiV504I0LaA8tg2SwLOrAka0PG
	48mJob9WvkaEYLbANHT+doHbJng4T7P2McRIJptvqU4k0JhlPP3pvEoWX12Hqwlk1U7JCbqhFgd
	Rxml/4oStpirhawIWn+TzNPkYMxM=
X-Google-Smtp-Source: AGHT+IHieo20VqQV/NrE6RTDvC7T1ETRDy8XNxidtBA8vAjYT38DsBpFNCl6GoRE46mrcwlVyuYfQfB7LOR98Ajqch0=
X-Received: by 2002:a05:600c:3b88:b0:426:5520:b835 with SMTP id
 5b1f17b1804b1-429dd22f28cmr29544235e9.5.1723651455149; Wed, 14 Aug 2024
 09:04:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240814085618.968833-1-samuel.holland@sifive.com> <20240814085618.968833-8-samuel.holland@sifive.com>
In-Reply-To: <20240814085618.968833-8-samuel.holland@sifive.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Wed, 14 Aug 2024 18:04:04 +0200
Message-ID: <CA+fCnZeHmfeQHDMFqELnPA-LNhWoKwxAKEPsEEBDCdoD9SEHwg@mail.gmail.com>
Subject: Re: [RFC PATCH 7/7] kasan: sw_tags: Support runtime stack tagging
 control for RISC-V
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
> This allows the kernel to boot on systems without pointer masking
> support when stack tagging is enabled.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>

But see a nit below.

> ---
>
>  mm/kasan/kasan.h       | 2 ++
>  mm/kasan/sw_tags.c     | 9 +++++++++
>  scripts/Makefile.kasan | 5 +++++
>  3 files changed, 16 insertions(+)
>
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index fb2b9ac0659a..01e945cb111d 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -630,6 +630,8 @@ void *__asan_memset(void *addr, int c, ssize_t len);
>  void *__asan_memmove(void *dest, const void *src, ssize_t len);
>  void *__asan_memcpy(void *dest, const void *src, ssize_t len);
>
> +u8 __hwasan_generate_tag(void);
> +
>  void __hwasan_load1_noabort(void *);
>  void __hwasan_store1_noabort(void *);
>  void __hwasan_load2_noabort(void *);
> diff --git a/mm/kasan/sw_tags.c b/mm/kasan/sw_tags.c
> index 220b5d4c6876..32435d33583a 100644
> --- a/mm/kasan/sw_tags.c
> +++ b/mm/kasan/sw_tags.c
> @@ -70,6 +70,15 @@ u8 kasan_random_tag(void)
>         return (u8)(state % (KASAN_TAG_MAX + 1));
>  }
>
> +u8 __hwasan_generate_tag(void)
> +{
> +       if (!kasan_enabled())
> +               return KASAN_TAG_KERNEL;
> +
> +       return kasan_random_tag();
> +}
> +EXPORT_SYMBOL(__hwasan_generate_tag);
> +
>  bool kasan_check_range(const void *addr, size_t size, bool write,
>                         unsigned long ret_ip)
>  {
> diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
> index 390658a2d5b7..f64c1aca3e97 100644
> --- a/scripts/Makefile.kasan
> +++ b/scripts/Makefile.kasan
> @@ -73,6 +73,11 @@ ifeq ($(call clang-min-version, 150000)$(call gcc-min-=
version, 130000),y)
>  CFLAGS_KASAN +=3D $(call cc-param,hwasan-kernel-mem-intrinsic-prefix=3D1=
)
>  endif
>
> +# RISC-V requires dynamically determining if stack tagging can be enable=
d.
> +ifdef CONFIG_RISCV
> +CFLAGS_KASAN +=3D $(call cc-param,hwasan-generate-tags-with-calls=3D1)

Let's indent this line by 1 tab (I already sent a patch that fixes
indentation in the other parts of this Makefile [1]).

[1] https://lore.kernel.org/linux-mm/20240813224027.84503-1-andrey.konovalo=
v@linux.dev/T/#u


> +endif
> +
>  endif # CONFIG_KASAN_SW_TAGS
>
>  export CFLAGS_KASAN CFLAGS_KASAN_NOSANITIZE
> --
> 2.45.1
>
