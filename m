Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A151724BBE4
	for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 03:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760499531; cv=none; b=Pg3czDU5/RTolL0HlQGjARkWT5awHBIF7B+tH0o55ELS/PpzRGfhj/g3MSkJh6qJHKwTsksnb1dcutbkigfdLT7YmRVjmANOASgTJc1szggoCWIfbWZSVJkLcespIioH14ckRouzh6mqnyr4ZydNUa8+EPdFJX1BO42pL6i670Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760499531; c=relaxed/simple;
	bh=4wJt+gpoa406fX3ntwa3yiMH3j+kDH0t4mBuoWTLNIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hOXOSK64/CN3hzCOFK1vK0XXZKU8Qk1uwkRLJntVtEOv4c3va7iUESsKorDwnWWuL1+LIcpM8hQJHWbMY4Noe/wcY/t63yRS9wwjL9jiiYUdKq+7GTOZQyIibCIG5IN/5ijTC2C8rTJR8DDvEhdzmJFQ4UoiyV7ndFmlWIYEsPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AEsumNgH; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AEsumNgH"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3f2ae6fadb4so6726925f8f.1
        for <llvm@lists.linux.dev>; Tue, 14 Oct 2025 20:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760499528; x=1761104328; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qCkYlbRToLYdFFXJcENf2IQzzKVCQ6jcGYcB48CaRYU=;
        b=AEsumNgHxpl/FTljEJqsrbTckcBqa+wP9hQxsUxmnn5bia/kUfr3+TDNzwcpXwoITb
         KbkdpXNwQ7ReIe457ljwBGforPPCJNmlWAcWXpgNr9eMbG/G6B1+EP/Zp04/JkptbAe1
         IkqqL2FFvJdbgi8l+G8kaIgznoM5nguSbsups8KZHAMEWvNxNjSNm4OeKD1X05W3ikd7
         xBvIDX62dKWTMFh4oo8KR7jHD0I/p6rFSYp6o1kuStdb80uSTVXJk0TNTK45PmzRgVu1
         lpsZ6SpqnM34scOBgqP7Il2Bu0pjb+GcQuG+WxZMN9OXu0bMR1jyzA3Cu5KrqgLPmrt4
         W69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760499528; x=1761104328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qCkYlbRToLYdFFXJcENf2IQzzKVCQ6jcGYcB48CaRYU=;
        b=iE+o+u1bTt92fxzFfvSJHlOM8rqDJyFKqyzUYvsSjfZBr8sNSaULpqTB/7gsiAQKQY
         TZ1PFF+GEXOBTWHlbmCg1l6jxODJq4qLn184OxDitNeqCfXeoUfybjcX4OsgDcS/ZMwV
         YmAfgTmQy+GHAwJQ7CXEUehi/gX4lZROIwd6AXpeOODg6LvZa52fuHIraNMb0+bngl74
         HswoYFPjxOcKQuO9mCH6BZPfi1bnSY2iDvTFpVe2at9uQSrgQPFEoNunqu7qQEjTmLIS
         9N2TDXf4O+Sf90KdtiqeB9f/NXJLv3qah32Oepu/Pgm5VRMvLkuVje643OkUhV4lBoRq
         3ssA==
X-Forwarded-Encrypted: i=1; AJvYcCWAynxacH/Wcg7n5SW3SitP9Eha8WO+edZqldqJzgNJ/R2aU4BbH539ZMVkhIaLyncZAajD@lists.linux.dev
X-Gm-Message-State: AOJu0YxBrHlDiBsL5sHacHTlpgBUc/+ogUtHD+ImI/KXbyRdAId8cbW7
	xi+gHma2ju8YY0TKd22T3CbCn/9OHPha7q4+x8fUnmxzXiCHZFG8VFNYT9LfIciLr4FOH8NJ0vI
	jIsP6A4P84KmgOuKiooiXnsBwiJYSTvTbAh0UcpcD
X-Gm-Gg: ASbGncuqcks11oiESlKvMlYRm5KDZ4y6eggdz/An2bGmrhOcw7qqJ+RIeJWu0njZ+W8
	HptD2f2qn+OqJUS8eyaibvpqvCoQu4NfIqq6LPZfeF8E/tTh9zx3cwSBtPzg5T4sszGlhe52HFa
	s8D0uTpDCLv0K/3o7/YoAdO3/ctTZy1zec6MZ0EdnLEDrRQvcqk3OSLNJFkWB82C93x/1oag5y0
	gN4qUKdXOzBE/tTEkwPzM/Zis50b04d88kNNq7Q3rU=
X-Google-Smtp-Source: AGHT+IEXqrUaXr8DHCM+aI/npfJJzTlagvjXjvafVzIGuFHFtOvaU6LGphM/lgPuvpr67IHJYligctKwRWzsmwrMOL8=
X-Received: by 2002:a05:6000:3111:b0:425:825d:15d1 with SMTP id
 ffacd0b85a97d-4266e8db601mr19071351f8f.44.1760499527730; Tue, 14 Oct 2025
 20:38:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251014191156.3836703-1-xur@google.com> <20251014191156.3836703-5-xur@google.com>
In-Reply-To: <20251014191156.3836703-5-xur@google.com>
From: Han Shen <shenhan@google.com>
Date: Tue, 14 Oct 2025 20:38:34 -0700
X-Gm-Features: AS18NWAAoTZwilsHeALUNIPooAM-rlbEq_tGr0S8vEjTAZ0hT02nDM65-kCnNvQ
Message-ID: <CACkGtrgWRJw2+KX_=Xww773ovYkjq-Bf4Sygo=Hgn86TM7VjLA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] kbuild: Add config to assert profile accuracy for
 aggressive optimization
To: xur@google.com
Cc: Alexey Gladkov <legion@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Bill Wendling <morbo@google.com>, Ingo Molnar <mingo@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <kees@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Peter Zijlstra <peterz@infradead.org>, 
	Tamir Duberstein <tamird@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Yabin Cui <yabinc@google.com>, Sriraman Tallam <tmsriram@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've verified patches 1-4, with the following configuration on X86_64 syste=
ms:

1. autofdo without profile (nothinlto)
2. autofdo with profile (nothinlto)
3. propeller only (noautofdo no thinlto) annotated
4. propeller only optimized (noautofdo nothinlto)

All the kernels boot up successfully.

Thanks,
Han



On Tue, Oct 14, 2025 at 12:12=E2=80=AFPM <xur@google.com> wrote:
>
> From: Rong Xu <xur@google.com>
>
> Adds a build config to AutoFDO to assert that the generated profile
> accurately represents the intended workload. This enables Clang to
> perform more aggressive optimizations.
>
> Signed-off-by: Rong Xu <xur@google.com>
> ---
>  arch/Kconfig             | 11 +++++++++++
>  scripts/Makefile.autofdo |  3 +++
>  2 files changed, 14 insertions(+)
>
> diff --git a/arch/Kconfig b/arch/Kconfig
> index ebe08b9186adc..6fdc676cb0fe4 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -886,6 +886,17 @@ config AUTOFDO_CLANG
>
>           If unsure, say N.
>
> +config AUTOFDO_PROFILE_ACCURATE
> +       bool "Assert AutoFDO profile is accurate (EXPERIMENTAL)"
> +       depends on AUTOFDO_CLANG
> +       help
> +         This option asserts that the AutoFDO profile (specified
> +         in CLANG_AUTOFDO_PROFILE) is collected from a representative
> +         workload, allowing the Clang compiler to perform more
> +         aggressive optimizations.
> +
> +         If unsure, say N.
> +
>  config ARCH_SUPPORTS_PROPELLER_CLANG
>         bool
>
> diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
> index 5bcfcef273745..36abeae2accdc 100644
> --- a/scripts/Makefile.autofdo
> +++ b/scripts/Makefile.autofdo
> @@ -11,6 +11,9 @@ endif
>  ifdef CLANG_AUTOFDO_PROFILE
>    CFLAGS_AUTOFDO_CLANG +=3D -fprofile-sample-use=3D$(CLANG_AUTOFDO_PROFI=
LE) -ffunction-sections
>    CFLAGS_AUTOFDO_CLANG +=3D -fsplit-machine-functions
> +ifdef CONFIG_AUTOFDO_PROFILE_ACCURATE
> +  CFLAGS_AUTOFDO_CLANG +=3D -fprofile-sample-accurate
> +endif
>  endif
>
>  ifdef CONFIG_LTO_CLANG_THIN
> --
> 2.51.0.788.g6d19910ace-goog
>


--
Han Shen |  Software Engineer |  shenhan@google.com |  Sunnyvale California
