Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F37A1D174E
	for <llvm@lists.linux.dev>; Wed, 23 Oct 2024 18:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729708937; cv=none; b=H6/N5xd7Cw1zhwY5VvI6X0S6zMmixitj9vzhCjXqRciv4R9GRhtbwf3oBkHrgnoAtIRXcpTyRuxKIc7dfR9hoiMXynnM3wyAXC5FsLbRD5zKs4dSd6amj5qMfM7OVv8Qsv5FbprvP25ntxf3CqX+UI9PVsACdnm+81y/mVR+py8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729708937; c=relaxed/simple;
	bh=jrfwqO5oM0D9ZySyXATJamp4TpfqppW23vT0QbIFxMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qBCsDgIbRLEFmCSkTM3uQX8B0zkdwGmsep5bLn2k/gf0zMMFLdkALFaRhnxVIw9RCrI/rcRNeVOiJxAi+4CP/zWOw+3cNEfnQcL0rkGXCZRzomZhfROPvbU0rc0RNlmN18p/EYKfuC6F/gxv7yyEvBnuZULNd7J8CVS9DFbwXd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MiYhP74V; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MiYhP74V"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37d808ae924so26948f8f.0
        for <llvm@lists.linux.dev>; Wed, 23 Oct 2024 11:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729708934; x=1730313734; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Ay/OqGD2GTrz3V0tm8K+95EMKdw2lJQesOojfLv6f0=;
        b=MiYhP74Vx/doedMMUYuSHQF4pd4SQEVDhtEKGrgB23+e6CZrFtFQZr+fgNU6m5jpYn
         b8Ye+3Y+pGDcsHcHrJ+A2HdSzO0r7BUlI6idXYxO/t2WcmueC7RH31DtX/2LGHLkZ4ml
         HF8YmMyed4NY1UtCQPZoKzMXUVm6P1w1c/mwGjW6es66cP6Q8ExU2muIiT60+3tEAi6H
         0bkwW+oHgoCzHr3n8bgGXQIGLeEkJhJpUOlGc4l8DN+k3PwfMpAfnRzlEMeuuOZHyi/G
         umkkHRCeyTmOLy+CaoRZ5Gw2J9PCe8aMcaoIDwICHSUOkpNuKNh6sj3u/2HO0FZKWJpn
         yINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729708934; x=1730313734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Ay/OqGD2GTrz3V0tm8K+95EMKdw2lJQesOojfLv6f0=;
        b=O5NXpGQpCgEzEV2Q0hPSNUq10uOQIPbD0KJ02tuZiB7Ew00AUDsCa9TSO5WgmaViFI
         /clHp6u+WsKBCGMgHLCENMdjbuKGIhQ+K3f7OfmRJfH1LLoQLaGh0B2lC/gYvmLtn4TF
         wL3ivqughPKTlLowkx6LAjPgsPaPv5y4Dg4pUx8V1+zdDB9xff/KMJVxc/93EhxtjY5h
         BGY1A77NKaq6gip19tH472rkPj6wdtMq7ZLEhoBmzXU6TBB9AlCZe7BUpJKY5ye7DouF
         Ctokg8Gn65K+IVZQD19RgWln/AVDoEaFGWDe5BE7XnbPRYH3G8DzeZG0elUGI+qZa6bT
         /+0w==
X-Forwarded-Encrypted: i=1; AJvYcCX/6vLVK/BQ27m0xh1AXxzXj178ITX9Hw7AniHSe86PfSfMEt6dDhyNEmPmySX3tFrMvvTw@lists.linux.dev
X-Gm-Message-State: AOJu0YzLLg4w7+EGC8gT6oMXRqTl5LbWSEz/t3RsGPojqvao3daGIi2A
	M9MHQG2/sva/uQMKoB1kT7+Zigdl/peqJBE3w3c43I0vSpE6Jeg7mqrVWNL1PcwQ0Bzf5uhsjR1
	Nl/mu6AjTYGHpGkn/3GLD+46mkng=
X-Google-Smtp-Source: AGHT+IFB3tSRsLc8IJ+ZLmbBRgiQxMJcijIbkhHI+LcLoWS2ExMHeUZd0pXljEEFRrdcgGNxkIUIlWkiXJ0JtmbA57I=
X-Received: by 2002:adf:f5c4:0:b0:37d:5338:8733 with SMTP id
 ffacd0b85a97d-37efcf7ba95mr2248780f8f.37.1729708933928; Wed, 23 Oct 2024
 11:42:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241022015913.3524425-1-samuel.holland@sifive.com> <20241022015913.3524425-4-samuel.holland@sifive.com>
In-Reply-To: <20241022015913.3524425-4-samuel.holland@sifive.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Wed, 23 Oct 2024 20:42:03 +0200
Message-ID: <CA+fCnZe49OGG_8J40_d9dTUBktY6qe-1dq1Y6Q+7hY9=xmUWQw@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] kasan: sw_tags: Support outline stack tag generation
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
> This allows stack tagging to be disabled at runtime by tagging all
> stack objects with the match-all tag. This is necessary on RISC-V,
> where a kernel with KASAN_SW_TAGS enabled is expected to boot on
> hardware without pointer masking support.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
> Changes in v2:
>  - Split the generic and RISC-V parts of stack tag generation control
>    to avoid breaking bisectability
>
>  mm/kasan/kasan.h   | 2 ++
>  mm/kasan/sw_tags.c | 9 +++++++++
>  2 files changed, 11 insertions(+)
>
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index f438a6cdc964..72da5ddcceaa 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -636,6 +636,8 @@ void *__asan_memset(void *addr, int c, ssize_t len);
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
> --
> 2.45.1
>

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
