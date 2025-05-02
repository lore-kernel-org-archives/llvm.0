Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100F925D1E2
	for <llvm@lists.linux.dev>; Fri,  2 May 2025 16:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746201840; cv=none; b=dCWKY+KR5FjTaw5kU4AL1ss4w1e8uujIS2oRUqWYsNYjGFmY7ZGAGF+yOke4HEwWmI+FIszMh1KsOXHZpxs7gq+SLroqETDbR9VN3FACdbN65bd302ZnmnLSsmYcJJkJ6LPvJAdRgzHHcBtVN13Bdw4oEfBXnKWArCxpKG5APdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746201840; c=relaxed/simple;
	bh=/Ir9RUZPJNowHtDjB8+O6p57Zsy6wW7vA4h0CW+yCQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tbthRLVGZ6NT7xBlGSMDSLAd9QU8VbSuCDV8PA+oEz1M2S5nRx90ll/QWf+AvDfwZBgoJ1rQsn3Rp0T54phLmvVw7ORnuk7kewDHZzZDFY1tRUEbATbzf/ERrccj051MlaSh7zeAo0J0h4mQfvCnnZXDb8MRdr8NUQQM4389Iuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7L6jZqw; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7L6jZqw"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b03bc416962so1664804a12.0
        for <llvm@lists.linux.dev>; Fri, 02 May 2025 09:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746201838; x=1746806638; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gDaKrXtDcJswvbEwS8wGTnCooDFXgZ8JEIYZCAsVSDU=;
        b=B7L6jZqwcgOqFyb3BngZRmczFNK66obxPGJdeVw8F70RSItU5jqvDX25nIP8ueLn/s
         blLzvA0HrhlLkGl2MjYDHKLRdg3bIvpE8vufdaeWFPYe5TAtG06BfiUkOgtj2fLEn4Sm
         9rcCpnsi1OPtEDfdjWO29S4jkWyLK1OSLZQ6+NepcHIy6QgNQedBSQOnu60flhzNjsLI
         jR27iqkqDlWmKgVL4ZPlLjsC+kCMkRzSKdYUQzvbzqjK9FkcTSjymiG1Cw03qJ66vzsz
         zngRRFl5fErzWDKlxFEvCzzYQH7ygn/ioNxEN/FRAFe7booiFo/ZWDFGt2w3ZL5MueIt
         kUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746201838; x=1746806638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDaKrXtDcJswvbEwS8wGTnCooDFXgZ8JEIYZCAsVSDU=;
        b=rhk4RVqjWTtykQcicXqx1g4vgio+xhZpPp9oBW4tOn+ZlD3VBXNR3XswQ3PQr32y/f
         S7Xw0pRxbyNV1BpE7LV8LYRm7DKDRPMvwE6bjMG6mk7zGPxWfH7fijgZKeQ0n4NaemOO
         OIkSwpMBxe7Oti8W9LuHQz57rhbtQVeth0JHmJV5ZIRk9nZhRmPf+qNtHoyTFAfrboVB
         GHYM1LXTDhdQV5swFBMOPMBe9ygz2oNSFB5W4ljDUZRNcc0wLCbJLZbKoCC65w5Ndak0
         FG2obHypdwSu6ILsvMvzjvRNs/ZrDfA2WPnK9LG7am1r+UPImZKX0AfOpaUyiWnQACMg
         XTIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+JELq7LzBN3iqCDo2Mqfm6cbELvU/5I4COTX5AjB15gGnkZD5D5qYQy9oAK86KWXwWOw9@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6y25Hm0TwWMXQuzPiHiBqI5vkEX+SVWNfjZt36rRZwTuKYBQJ
	qsivWP6kX8+xogZN97y8HsxxMFxu8lP/dN7pnXqOlTR/tPorqCzb
X-Gm-Gg: ASbGnct80Neted7KW2uaXc1ICjHBq6q30vVvHkLRclVQqBHSFnV8msD5eIlMmzMBMLZ
	a0pJ9i/LvgQN2i1bpro9wKp/7yMUTxiKK/PB2yw3Glc7RukM79OJNIVnp9k4VCELJpIWb/UM6gU
	yVF1A7d3Fe2xz/lX0scDRuiyOum3Tm3Gqzqpj2hoinu3O/QvlxyqbLmXjDlHe6Jig2TE+22SbxW
	NxysaB9WB2KSbTlEI6GsBP4GMVYdJcVuLUB5Ym40lECgSyNVjpuDSjTBIwZ3DfkBS1Ja9rVEOt+
	i2flN8+pYS3c2gudPLxZr26SNqAQMv71lKbFo8ur
X-Google-Smtp-Source: AGHT+IHjbc82WPFLFYJqUcclQhm+5J20tGWB4R4jo77r5H5Zl7NTJpo1SEIdn4FVH/XUTu4IGCJZHw==
X-Received: by 2002:a17:90b:3c4e:b0:2ff:796b:4d05 with SMTP id 98e67ed59e1d1-30a4e5ae12amr5825968a91.11.1746201838224;
        Fri, 02 May 2025 09:03:58 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3471ef7asm5916080a91.9.2025.05.02.09.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 09:03:57 -0700 (PDT)
Date: Fri, 2 May 2025 12:03:55 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Ian Rogers <irogers@google.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Leo Yan <leo.yan@arm.com>
Subject: Re: [PATCH v2 2/5] bitmap: Silence a clang -Wshorten-64-to-32 warning
Message-ID: <aBTs6yvKlCYYgU2O@yury>
References: <20250430171534.132774-1-irogers@google.com>
 <20250430171534.132774-3-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430171534.132774-3-irogers@google.com>

Hi Ian,

On Wed, Apr 30, 2025 at 10:15:31AM -0700, Ian Rogers wrote:
> The clang warning -Wshorten-64-to-32 can be useful to catch
> inadvertent truncation. In some instances this truncation can lead to
> changing the sign of a result, for example, truncation to return an
> int to fit a sort routine. Silence the warning by making the implicit
> truncation explicit. This isn't to say the code is currently incorrect
> but without silencing the warning it is hard to spot the erroneous
> cases.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  include/linux/bitmap.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
> index 595217b7a6e7..4395e0a618f4 100644
> --- a/include/linux/bitmap.h
> +++ b/include/linux/bitmap.h
> @@ -442,7 +442,7 @@ static __always_inline
>  unsigned int bitmap_weight(const unsigned long *src, unsigned int nbits)
>  {
>  	if (small_const_nbits(nbits))
> -		return hweight_long(*src & BITMAP_LAST_WORD_MASK(nbits));
> +		return (int)hweight_long(*src & BITMAP_LAST_WORD_MASK(nbits));

This should return unsigned int, I guess?

Also, most of the functions you touch here have their copies in tools.
Can you please keep them synchronized?

Thanks,
Yury

>  	return __bitmap_weight(src, nbits);
>  }
>  
> -- 
> 2.49.0.906.g1f30a19c02-goog
