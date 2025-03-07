Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D8420E014
	for <llvm@lists.linux.dev>; Fri,  7 Mar 2025 23:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741390804; cv=none; b=Z8XsP7aO0no6EIrbsrda5Q535GCfIjdTNiCpQKwJLTpoWTQy92ZO1pCHjmFrQMarVWMH55gL19Xu3Wu3jsR2+mG6wtRmOsTuAvi0ayU5um5SjGXo5jnuaN3kvhv3xbuyUEwFjH8pGeYfX6PDjv486k9zPhZkhLiBR+Baz6LKF/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741390804; c=relaxed/simple;
	bh=w436wgjGcjzJ3dyS3A6//n+WNelqPnxFh6A/g8MJI18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MVW4LOKu8e/aU9zR1dwAa/ktiXlMnfh/qCVpkI15tOgJHiO4Rs3WOvzEj/3+xoUeOc33lnY92ja4E0nuX95hj3F9hPWCVmR6qvAZnuybjohBNn2LQlGhT+HbufR0s1SaMFMhJoLdgtY4EeU8jhueCVQPxQfWomsm1htiE5Pe29U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0jYYdAzo; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0jYYdAzo"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-8553e7d9459so66213439f.2
        for <llvm@lists.linux.dev>; Fri, 07 Mar 2025 15:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741390800; x=1741995600; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jDc72lD8Mhnu3NfUsPcD1oy818yB1nERuThSEkGUHkw=;
        b=0jYYdAzozw3Pu8H0UHrFaZVqEkBJWL6xamo7jfLx3BODfxMri8BdQXA8h9+Bsff4lF
         V01dBqGKjDQQLCceJBwdpOHesVQpHS0VOJTuuE9Laq1Ax+aV4wHz0fW9pfa2MGxSxzMU
         OHHVmPjB7sQrcE59PsCFE5eHAECIdRYNahevcM9RLR27MRPNBxlXG28td8bjJ07ypEd8
         hdxWjhUXMcgm3mUCOiNGtyGJk3cEMcIbN6ZJK4w/s8ZR69u3gZ7nWnTKYwO42RgZoosu
         CLrPT6efhVtMPc/BrDBVZ9fo5wz1nfrJLn3uQZ0X/VUUhbE/m8oumLMs31kaJ/BRO8nM
         lHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741390800; x=1741995600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDc72lD8Mhnu3NfUsPcD1oy818yB1nERuThSEkGUHkw=;
        b=snt/hAb9LGIimc/ZYCCCelHu0LZ+tPfCFZCK0gkh1tfXm96Y1OuvC9d2jnXUCptiZ4
         3GCLvvJvedm429E0RFgutqDjsknkMFMO/4IeodBBKSsrLZkxUAWk5J9xq1lqvZ6jprDd
         hfbTNumOMxOuR50RK4eGVprfDbs5IDt6Dp9JcxHqSDvHBkKslspOMsTbchMN/7Ks5jWM
         gSBQU+I94cUQl4/9DriL23Y/N7o5CBayz18Jr7/mpnTIFKZ6NhlPfIFP/8F9Pd3ubTX1
         WCnv5tSZ9grHgAWF7XPCdamB9oLVG0hko1lz0e97oXhLqLDJ0a8wenMSp4rLWWrdW+YD
         OUYw==
X-Forwarded-Encrypted: i=1; AJvYcCWy4Y0MZnjl4egm0Ix0vUhFEt1iLEd1SmAmuduAN73Oq9Fz5HmRndTVQyNjqnSC5DTevpy1@lists.linux.dev
X-Gm-Message-State: AOJu0YygGKrMFs2E91t7O4uo3aPHkYGS/1LBpsMkA/ECoFGleyzz3r61
	N6nDIzwj0u+/fQ6J4DMQ5S42UFbu/sLEfdV0brHzsOzA6qpaHUIGmn+vfclX0g==
X-Gm-Gg: ASbGncuIVxPN9JE6Ky+3ncfAfTRD47gax5jGOeQ0D4DN2ZZuXQ9EP3QEV0OWd2WJlmM
	FlwvRnEKC9qASaddZZj9mr4VA6vM+mgJ/hVdum/P/ybaABF9cf1XhqnRW+Gcyt6KJjOCA0ipy8g
	P0tg8BGvli/3VwnVl/ZOIOD27LTTkVdrSMVFxJ/JaCFvSUp5dt5oq20HqrgEfy37Yy7yfzUA7n6
	rsrgq0TA7Uni3heodnYVAvu2HDKQnJ+R81nX8ySTtS02SB+lL6thAlYsckGNDJYeprejT94IlDb
	CKh8zAFRcMlp5iSOHuY1ZXGFoLiSnobHy/ZM9N/QyiozKD86Du74z7bjYURdNbScgeBUgnr3YnG
	wsfHsiVNl
X-Google-Smtp-Source: AGHT+IE5GWqkBP7F2KuCtSZMj3O7YCqwL1LClyQ1d+IKR/y1v4SzZvWajbv9qbfRqrrAzp37TIieCQ==
X-Received: by 2002:a05:6602:474b:b0:855:9c88:7894 with SMTP id ca18e2360f4ac-85b1d03fb51mr700353139f.11.1741390800315;
        Fri, 07 Mar 2025 15:40:00 -0800 (PST)
Received: from google.com (26.80.59.108.bc.googleusercontent.com. [108.59.80.26])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f20a06b059sm1193908173.136.2025.03.07.15.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 15:39:59 -0800 (PST)
Date: Fri, 7 Mar 2025 15:39:57 -0800
From: Justin Stitt <justinstitt@google.com>
To: Kees Cook <kees@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Hao Luo <haoluo@google.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Bill Wendling <morbo@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Tony Ambardar <tony.ambardar@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Jan Hendrik Farr <kernel@jfarr.cc>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 3/3] ubsan/overflow: Enable ignorelist parsing and add
 type filter
Message-ID: <52samxs253u3t2cmm5xwbmrwzyof36w7xczpuvbkarqwonwl32@2jbmkagpk7za>
References: <20250307040948.work.791-kees@kernel.org>
 <20250307041914.937329-3-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307041914.937329-3-kees@kernel.org>

On Thu, Mar 06, 2025 at 08:19:11PM -0800, Kees Cook wrote:
> Limit integer wrap-around mitigation to only the "size_t" type (for
> now). Notably this covers all special functions/builtins that return
> "size_t", like sizeof(). This remains an experimental feature and is
> likely to be replaced with type annotations.
> 
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Justin Stitt <justinstitt@google.com>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: Marco Elver <elver@google.com>
> Cc: Andrey Konovalov <andreyknvl@gmail.com>
> Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nicolas Schier <nicolas@fjasle.eu>
> Cc: kasan-dev@googlegroups.com
> Cc: linux-hardening@vger.kernel.org
> Cc: linux-kbuild@vger.kernel.org
> ---
>  lib/Kconfig.ubsan               | 1 +
>  scripts/Makefile.ubsan          | 3 ++-
>  scripts/integer-wrap-ignore.scl | 3 +++
>  3 files changed, 6 insertions(+), 1 deletion(-)
>  create mode 100644 scripts/integer-wrap-ignore.scl
> 
> diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
> index 888c2e72c586..4216b3a4ff21 100644
> --- a/lib/Kconfig.ubsan
> +++ b/lib/Kconfig.ubsan
> @@ -125,6 +125,7 @@ config UBSAN_INTEGER_WRAP
>  	depends on $(cc-option,-fsanitize=unsigned-integer-overflow)
>  	depends on $(cc-option,-fsanitize=implicit-signed-integer-truncation)
>  	depends on $(cc-option,-fsanitize=implicit-unsigned-integer-truncation)
> +	depends on $(cc-option,-fsanitize-ignorelist=/dev/null)
>  	help
>  	  This option enables all of the sanitizers involved in integer overflow
>  	  (wrap-around) mitigation: signed-integer-overflow, unsigned-integer-overflow,
> diff --git a/scripts/Makefile.ubsan b/scripts/Makefile.ubsan
> index 233379c193a7..9e35198edbf0 100644
> --- a/scripts/Makefile.ubsan
> +++ b/scripts/Makefile.ubsan
> @@ -19,5 +19,6 @@ ubsan-integer-wrap-cflags-$(CONFIG_UBSAN_INTEGER_WRAP)     +=	\
>  	-fsanitize=signed-integer-overflow			\
>  	-fsanitize=unsigned-integer-overflow			\
>  	-fsanitize=implicit-signed-integer-truncation		\
> -	-fsanitize=implicit-unsigned-integer-truncation
> +	-fsanitize=implicit-unsigned-integer-truncation		\
> +	-fsanitize-ignorelist=$(srctree)/scripts/integer-wrap-ignore.scl
>  export CFLAGS_UBSAN_INTEGER_WRAP := $(ubsan-integer-wrap-cflags-y)
> diff --git a/scripts/integer-wrap-ignore.scl b/scripts/integer-wrap-ignore.scl
> new file mode 100644
> index 000000000000..431c3053a4a2
> --- /dev/null
> +++ b/scripts/integer-wrap-ignore.scl
> @@ -0,0 +1,3 @@
> +[{unsigned-integer-overflow,signed-integer-overflow,implicit-signed-integer-truncation,implicit-unsigned-integer-truncation}]
> +type:*
> +type:size_t=sanitize

Forgot to mention this in my intial reply but we have to be careful
with what types are added here. Kees, I know we're on the same page from
offline chats but for others: using sanitizer case lists to discriminate
against types for the purposes of sanitizer instrumentation may not work
properly through various arithmetic conversions. Mainly, implicit
promotions which tend to break this particular approach.

Now, for size_t we got kind of "lucky" because there are no implicit
promotions with size_t, it doesn't get promoted. This is not the case
for other types. This further necessitates the need for canonical
wrapping types backed by in-source annotations/qualification -- coming
soon in Clang.

> -- 
> 2.34.1
> 

Justin
