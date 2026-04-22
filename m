Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086E8330B2E
	for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 10:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776852081; cv=none; b=jqWqoty0aH51SnHaoOVbei9M2xHYM/vCNOT1256/wwww4tWbj5CksSWrLKhIrCdoOrL2mPpqDeVwaMVZRfEKGVmeH5W3ocjDXXRAZRoayHf/WkTa1bEqe75hFo7vZ8kO8UCl1ZQjzL3Fcx74NIaY4tPIIIBcu/UpNMMKgavH/Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776852081; c=relaxed/simple;
	bh=g1HmJeGW/EthYdybdQs2ev875savaWtrQ8MUgqb1L5M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QbQD6OmL8zGk17JVvJupo0J9dISZLnewQcU1WSRkdGOmRhyAwSaSJUT3xjESMwmn2YeqMTJM4wB8XUNwCocAlDFN02d0KYr3NeFH+1S3YPI7Fqb+UFWyJlhoXu4nBVOEvSJW4qh1nxHQ/KU3r4VyRrLoaUEqpzqe8abPcs9ELSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CHNGeOEj; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CHNGeOEj"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d75312379so3909634f8f.1
        for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 03:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776852078; x=1777456878; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8nPO4S00DJRZysggbb4Syo2J9M2MZr/N8yyymN7fts=;
        b=CHNGeOEjoTW6HSHEMxrm3ZV0z1ToJFhO6hG2jQoO7tu+UitkeVPXygyxEzTOpOSD7b
         O/T+Yeux1ROHhw2kIVwknZbSizHgjZnc1tuPhmfpYxV0XQL41TxAZRmaKNGfzkzbMreJ
         FqlJdr9GHoHoteLpdrUC22PhjeSWt41Ly0eN8irtktSjKysBkS4VLRqwbxZQgSrO/2s7
         w21S4nhG4raehszqtbmIAyiNkzP2xNRvbh9m9qlJQ0ntgq6oOFkQqYm/lCVjx6ZC/Fs1
         XJesB2NbbYCyTt6hXf/GBqzFLUWsEzVzsSS2Kjt/Chj2psb8ciA2KREBGfCSxUtvCIFT
         91vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776852078; x=1777456878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b8nPO4S00DJRZysggbb4Syo2J9M2MZr/N8yyymN7fts=;
        b=ro3Xm6AgOVSqyc7nE0fE63dgPUdeVKxdCxdwCfUgD7fq4pjeDLXgyiiXkw874VlvHW
         U+oNrPjkqTu2qcFRiBmp1S2SCFz4sFMU+IGSd4VcojR0qxTe2kaX6X4i+Ert0ghle5s5
         fCub/otEvbrSqtD4PtreRNwvJ52RiJjXmcYN8iqbbfwa+QaCbtcDauu8A5BK4b/N6e0T
         QbwURwqvgwfb4JwT+vESBx5eGmVW8xtpjsMK7P03jloWMl68QJyoo/m0DCxvteBBRFxZ
         rt4q0ElB3CE5ub5qg4jIgfVKSulEufBHwLFCUJ2sEgoDAGGgDDVQ7rBgYcuhTrguRHQb
         vqVA==
X-Forwarded-Encrypted: i=1; AFNElJ/HNEPPUZ+w+A7xJsd8HIciYYyCvaDQ7Mp1vF55NusYHnwFYwRxJ9BNYASbbz4nTVyw41n9@lists.linux.dev
X-Gm-Message-State: AOJu0YwGsRtlUDqCkc2EZCVejUmI05wO7lFOnNuQstkPnSkadadt2kOw
	2R+9xT3mDSweTl5KrdWe+x14jRHbwstMsk7NTxH9EQcmx8iVUBNiTuRT
X-Gm-Gg: AeBDiesDlkxo2gZoYUvPpfb+z9zVKyn1fnmrlOGpzRhGdvjgniiopepgx/sh4jC5w9h
	6xftF4MbXn3d2e8o8sEpFuZdXh997MPQSt7YGWfYCWTzdlv+deOp56oGP/iglTD6+So98sYmC/e
	fGiC+jr0oltXvwQMFsARqDySjOUE3yXSdXUM3NRybYHWrlq5rL3YDglTN2B1tE2mwmAFv/1GMUD
	A/QQ66B7v8hVd46FfoFM8b3kLPQMtS7jJckNXylWpMkhiQL3rzAhFaj2a/JXGsE2miytIdY6AP7
	QZHD4m7XolcZrR9E86HFg1D0GJWA0FbdligjkF1OyHsm8QzUcvOZ5Kn9UNGNTTKP7FOnPsSLpzh
	EpxITvp5KTPOG9hSGVQ6lWcu9icNvC3KWmlOI/vfHrC0yoFYlWQabpXJp1R31rbRKNNC5wXY0DB
	AfaXnj6nA7OUkY5skJVeL1t9dZRGuuxvgofEzLmKXwdnbp604tqUv2jzkbtR+8Sy6LiqTjmU7ap
	sc=
X-Received: by 2002:a05:6000:2d8a:b0:439:adc3:f0e7 with SMTP id ffacd0b85a97d-43fe4043f54mr22091920f8f.9.1776852078192;
        Wed, 22 Apr 2026 03:01:18 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d6casm40375198f8f.32.2026.04.22.03.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 03:01:16 -0700 (PDT)
Date: Wed, 22 Apr 2026 11:01:14 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Marco Elver <elver@google.com>
Cc: kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, Arnd Bergmann
 <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>, Dmitry Vyukov
 <dvyukov@google.com>, Nathan Chancellor <nathan@kernel.org>,
 llvm@lists.linux.dev
Subject: Re: [PATCH 1/2] Compiler Attributes: Add __access macro
Message-ID: <20260422110114.0f48d109@pumpkin>
In-Reply-To: <20260421190351.1976329-1-elver@google.com>
References: <20260421190351.1976329-1-elver@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 21 Apr 2026 21:03:47 +0200
Marco Elver <elver@google.com> wrote:

> Add support for the `__access__` attribute, which is supported since gcc
> >= 11 but not currently supported by clang.  
> 
> The attribute allows specifying how a function accesses memory passed
> via a pointer argument (read_only, write_only, read_write, none) and
> optionally the size of the access. Per [1] these annotations only affect
> diagnostics, and should not affect code generation:
> 
> 	"The access attribute enables the detection of invalid or unsafe
> 	 accesses by functions or their callers, as well as write-only
> 	 accesses to objects that are never read from. Such accesses may
> 	 be diagnosed by warnings such as -Wstringop-overflow,
> 	 -Wuninitialized, -Wunused, and others."
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc/Common-Attributes.html#index-access
> 
> Signed-off-by: Marco Elver <elver@google.com>
> ---
>  include/linux/compiler_attributes.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
> index c16d4199bf92..ef4e279e9872 100644
> --- a/include/linux/compiler_attributes.h
> +++ b/include/linux/compiler_attributes.h
> @@ -20,6 +20,18 @@
>   * Provide links to the documentation of each supported compiler, if it exists.
>   */
>  
> +/*
> + * Optional: only supported since gcc >= 11
> + * Optional: not supported by clang
> + *
> + *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Attributes.html#index-access
> + */
> +#if __has_attribute(__access__)
> +# define __access(x, ...)		__attribute__((__access__(x, ## __VA_ARGS__)))
> +#else
> +# define __access(x, ...)
> +#endif

No need to the initial 'x', you can just do:
# define __access(...)		__attribute__((__access__(__VA_ARGS__)))

Putting the actual syntax in the comment would help, eg as:
	__access__(read_only|read_write|write_only|none, param_number[, size])

	David

> +
>  /*
>   *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-alias-function-attribute
>   */

