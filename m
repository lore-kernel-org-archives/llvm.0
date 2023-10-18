Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAB51F188
	for <llvm@lists.linux.dev>; Wed, 18 Oct 2023 16:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RU4Ksptu"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-45853ab5556so518079137.2
        for <llvm@lists.linux.dev>; Wed, 18 Oct 2023 09:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697646173; x=1698250973; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i8uMytjHiXi9xKsw6qoUi0Pc7HNlD5A1bFtvpbrNGTM=;
        b=RU4KsptuFnVg6Qa5xxwnOSjpNekP8568eOJRJhYyyOSGYowPWTZ/tM1wjHEl/5bCAC
         psWbs6aVAGgzm/MSQu8wH9di/tNxD/fY5ZoOohT66cN6foEHkNpVpTWvf8nVgm4AcuAg
         BBAk3018mGq6zJPWQcBhnAG59RZuUupARaRYLDkyyN41Yzpg24kt/nRMwBDy4y5E4x7J
         2t0RAVx5N/nVRaPoGy+3m86CF+TAEnOLavnDXeGEhHBsdDKXlOk4h7rSCnjhyoCU4i8Q
         urMaH7zuZVis9vftMau1zZM0+97UZwAujssaSEmP3slPUIgCQohXzIoG5v2YFAlOuMrM
         QBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697646173; x=1698250973;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8uMytjHiXi9xKsw6qoUi0Pc7HNlD5A1bFtvpbrNGTM=;
        b=T1KTBPEgXAErNiVXzrIrQIXlAkxWAzVDLvRdYyidV/ce/YbIO7ReQaGTJYTIHyG3ld
         eduajy4PadUgMFFhwQ7Dz6LbxxCtxLEtloJyR5sbx9ezU3fkrVK7ePhZoV/mY2AXFK33
         hwAUxh3BBTev2bL4Y7cBp+QFRk6GNA4o915HAdSjbu03MOt1oK4mMrsgVxKPhxeLMGbQ
         sNva4DWvfwaEdLOc5r9sJXIP6xodhurotQK+WxTOSHK/i+9nbPQW3tepSM5Z1Q/i7zBX
         Nciw6wE0znkMQyd5no2gGP8y/F9S/vS+aZoKLJ726EnvZehQGXeuZmyXgUs5/TC/Nn/g
         /B5w==
X-Gm-Message-State: AOJu0YzPoAAY+O5TB40r3A4amIMDn0v3abhqOTJxr3QYE+L9DfRh+l38
	8vaXvO0of6Mu6y7zwgRGpBBV8szvlnj8RZ0ynPJaRQ==
X-Google-Smtp-Source: AGHT+IFzH1hAB4L9o9TIfKMNKAd7uyjYsU8V76NgA+b0+gVU3MqhuWUL+GxNzQRo+5zSfcLtXgyABQUYfqGL8Yl4k40=
X-Received: by 2002:a67:e14c:0:b0:457:cc6c:9491 with SMTP id
 o12-20020a67e14c000000b00457cc6c9491mr5467384vsl.17.1697646172621; Wed, 18
 Oct 2023 09:22:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231018153147.167393-1-hamza.mahfooz@amd.com>
In-Reply-To: <20231018153147.167393-1-hamza.mahfooz@amd.com>
From: Marco Elver <elver@google.com>
Date: Wed, 18 Oct 2023 18:22:14 +0200
Message-ID: <CANpmjNPZ0Eii3ZTrVqEL2Ez0Jv23y-emLBCLSZ==xmH--4E65g@mail.gmail.com>
Subject: Re: [PATCH] lib: Kconfig: disable dynamic sanitizers for test builds
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: linux-kernel@vger.kernel.org, Rodrigo Siqueira <rodrigo.siqueira@amd.com>, 
	Harry Wentland <harry.wentland@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Oct 2023 at 17:32, 'Hamza Mahfooz' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> kasan, kcsan and kmsan all have the tendency to blow up the stack
> and there isn't a lot of value in having them enabled for test builds,
> since they are intended to be useful for runtime debugging. So, disable
> them for test builds.
>
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
>  lib/Kconfig.kasan | 1 +
>  lib/Kconfig.kcsan | 1 +
>  lib/Kconfig.kmsan | 1 +
>  3 files changed, 3 insertions(+)

Do you have links to discussions that motivate this change? This has
been discussed in the past. One recommendation is to adjust the
build/test scripts to exclude some combination of configs if they are
causing issues. Or we increase CONFIG_FRAME_WARN if one of them is
enabled (KMSAN sets it to 0, 32-bit KASAN increases it a bit).

That being said, we're aware of KASAN having had more issues and there
are some suboptions that have been disabled because of that (like
KASAN_STACK). I'm not sure if Clang's KASAN instrumentation has had
some recent improvements (we did investigate it, but I can't recall
what the outcome was [1]) - maybe try a more recent compiler? However,
KCSAN and KMSAN shouldn't have any issues (if KMSAN is enabled,
FRAME_WARN is 0). And having build tests with them enabled isn't
useless at all: we're making sure that these tools (even though only
for debugging), still work. We _want_ them to work during random build
testing!

Please share the concrete problem you're having, because this change
will make things worse for everyone in the long run.

[1] https://github.com/llvm/llvm-project/issues/38157

> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> index fdca89c05745..fbd85c4872c0 100644
> --- a/lib/Kconfig.kasan
> +++ b/lib/Kconfig.kasan
> @@ -38,6 +38,7 @@ menuconfig KASAN
>                     CC_HAS_WORKING_NOSANITIZE_ADDRESS) || \
>                    HAVE_ARCH_KASAN_HW_TAGS
>         depends on (SLUB && SYSFS && !SLUB_TINY) || (SLAB && !DEBUG_SLAB)
> +       depends on !COMPILE_TEST
>         select STACKDEPOT_ALWAYS_INIT
>         help
>           Enables KASAN (Kernel Address Sanitizer) - a dynamic memory safety

This also disables KASAN_HW_TAGS, which is actually enabled in
production kernels and does not use any compiler instrumentation.

> diff --git a/lib/Kconfig.kcsan b/lib/Kconfig.kcsan
> index 609ddfc73de5..7bcefdbfb46f 100644
> --- a/lib/Kconfig.kcsan
> +++ b/lib/Kconfig.kcsan
> @@ -14,6 +14,7 @@ menuconfig KCSAN
>         bool "KCSAN: dynamic data race detector"
>         depends on HAVE_ARCH_KCSAN && HAVE_KCSAN_COMPILER
>         depends on DEBUG_KERNEL && !KASAN
> +       depends on !COMPILE_TEST
>         select CONSTRUCTORS
>         select STACKTRACE
>         help
> diff --git a/lib/Kconfig.kmsan b/lib/Kconfig.kmsan
> index ef2c8f256c57..eb05c885d3fd 100644
> --- a/lib/Kconfig.kmsan
> +++ b/lib/Kconfig.kmsan
> @@ -13,6 +13,7 @@ config KMSAN
>         depends on HAVE_ARCH_KMSAN && HAVE_KMSAN_COMPILER
>         depends on SLUB && DEBUG_KERNEL && !KASAN && !KCSAN
>         depends on !PREEMPT_RT
> +       depends on !COMPILE_TEST

KMSAN already selects FRAME_WARN of 0 and should not cause you any
issues during build testing.

Nack.
