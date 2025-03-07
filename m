Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107681DC99A
	for <llvm@lists.linux.dev>; Fri,  7 Mar 2025 23:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741390387; cv=none; b=h6BQbS0H4V+9oujo6NxvsoP+BoBF7XrEVkAC3EOKxwCyikGxX/DeydekNHRhheMnZvY1ESNInHYdCc3d5EjO87Ba641PBjdG7xi69g4SwczUkndwv5EhDGrRkFPeP5jHp7suAS+yPHT2w78LAxegEVcT635QipE849cO271i1vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741390387; c=relaxed/simple;
	bh=L4aJtPrE2GfnROL3oS1K4BKrQk2bSyTkmLWv+1Ga//g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lrg4zoXII7aWNAeH4o5JoDtNkmP6yQHvbX5qQmeYnkiljEbTBUxBidHCr2Ng7As4cwEvaBzOuJyEaEQTwp1UndUTxmj1kyKS2Uw+j2Jo9a5mtx1C/R3PvFVtATXKt2DtdKpf4/NkHshFvKY2cc2h8TlnlBFGtL3eX94u+ir7DH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wpc7jzE2; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wpc7jzE2"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-85ae9566c52so73201439f.1
        for <llvm@lists.linux.dev>; Fri, 07 Mar 2025 15:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741390385; x=1741995185; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mHFXO9D6YwhROjoFlwWSesjCYFiKET0NT2Feon19Q6U=;
        b=Wpc7jzE2G26zuBidMm3I1erVFYyZNr5hNSxzAh6LW7FtdWQSXjfCr6HOjHLsKRbybu
         GmM2dHfWpCxSUQmfdnLJ5gquIgtNJ1gXF6fFuDBfY/H63YZuQ75KtLG+gBc/em9e9Spw
         bl1BSDTGkSuAP0Ypmmwp8EZFFv8496Ao+Z+rAQmFz9ANLDOMD6KqOmr7+yWrG9Od2Fgp
         4XEkWFNYQA0VvDi76ztcMT9sZj2l+nRXk0bUFC/R+acbN40CjDHc8DmzgXNcqRXN7g3D
         z70B8j6xQ2mYef4Oum3iVObjt5b8CS2xQuxukFT5+8U53ua5H59hQBEEP+PpPfLAnbM8
         lI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741390385; x=1741995185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHFXO9D6YwhROjoFlwWSesjCYFiKET0NT2Feon19Q6U=;
        b=XvRmoFFuugkeDyDpVhn2a8HO9FJ8Art3RULI0ttVHZPx4rFj+iQ0ISHOeSVOB3Tz3m
         phhfx2ZjVJbjf1VkuxClbvpXuzP3/PiEofTHKaKJQRnvP4CjxQN7I3Wmy3nwoyag3oAA
         tEW3atRGX+3+WHIMDUZgtYaoc0K3jzlJU9tWVVwU4gLLoiL0gHQvw1Jodkv5GXmpRCu6
         POwJ9Y1EU1H0SrrLKGgWKn+45Zdg9O9pJN4xrKzOfnTnS00A5lY8bHYr/aVFZS8pyN8t
         eagbJ1d2vWx0V/qkYbtia4d5AoxQjPKfiYMlVuOGT9Y40xBDRuWFByAkp8z4bDyfY0Tl
         o2Cg==
X-Forwarded-Encrypted: i=1; AJvYcCV/S8U245HuIpraHnTMPqoFrylwGkchGcwLtTO+VrJma3XwSBuNbCmfM49kAFu6/Ry7u5Wh@lists.linux.dev
X-Gm-Message-State: AOJu0YwSsT8QEZt34bAw5fnLSMPMdHZfEInRKwSERJj0jbEV5J0v65c0
	zbTl8ozeRteLu4gNE6lcDBuJUDGCmCtb9Wk/tAeAaEecNrm2axJK3EfcnakHKQ==
X-Gm-Gg: ASbGncsWLNNMH7rGBiA4MCOFz7AE9XexcYlwi1pb5+EeU+pryx4ol5UzHyY4r86yV+0
	ZodBtPClBmxkVKbcUqeR/q2QEZExoGmDrS32wAHvO16FF9R2nDeYQUlaZKrQwGhXukbxiNairIt
	kkUSGgN70asndUVruFDr9PQOAZGwV/0EhLSpw0nWPC23s6/aydQFxUqInfgJSG1oMSLOSCjKRWw
	4MQw5xhHnorreCzHMoO5U84KS4FgALBjpjVHKW74b+sA/CV/5fKgrv2PUrrwjR0z7jLzBcMJ1uK
	wIVE5VBhxRAtvfztUAIJGLRK9ufhEsOpUVOhu6GszC/cKLfRvGcr1QOblcTGztkUgODdjgBNgmj
	HGc5KCnPY
X-Google-Smtp-Source: AGHT+IFyRzzf7mMzUIJI4y0Th6wZ9sjI35nBIcnhd9RXwZh9GmhLYqRpDr7OO9MYwGSF0/lxYav2hg==
X-Received: by 2002:a05:6602:4006:b0:855:ac69:32a4 with SMTP id ca18e2360f4ac-85b1d053032mr663250139f.1.1741390384993;
        Fri, 07 Mar 2025 15:33:04 -0800 (PST)
Received: from google.com (26.80.59.108.bc.googleusercontent.com. [108.59.80.26])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f22079b1dfsm382085173.118.2025.03.07.15.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 15:33:04 -0800 (PST)
Date: Fri, 7 Mar 2025 15:33:01 -0800
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
Message-ID: <upvdnfozcexlpb2x4auimec347adozkl2al4hu2yp3kfagdeyp@dqs2ft6wdmog>
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

Hi,

On Thu, Mar 06, 2025 at 08:19:11PM -0800, Kees Cook wrote:
> Limit integer wrap-around mitigation to only the "size_t" type (for
> now). Notably this covers all special functions/builtins that return
> "size_t", like sizeof(). This remains an experimental feature and is
> likely to be replaced with type annotations.

For future travelers, track the progress of type annotations over at
[1]. There's still discussion on how these will be implemented in Clang.

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

Hi again future travelers, sanitizer special case list support for
overflow/truncation sanitizers as well as the "=sanitize" comes from a
new Clang 20 feature allowing SCL's to specify sanitize categories, see [2].

> -- 
> 2.34.1
> 
>

The plumbing looks correct,

Reviewed-by: Justin Stitt <justinstitt@google.com>

[1]: https://discourse.llvm.org/t/rfc-clang-canonical-wrapping-and-non-wrapping-types/84356
[2]: https://github.com/llvm/llvm-project/pull/107332

Thanks
Justin
