Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484C31552FD
	for <llvm@lists.linux.dev>; Sat,  3 May 2025 10:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746268393; cv=none; b=g1unPfh5twaPfhylQJQ1SCzODjFALIb9SwMMmbHy59P/L+gXX+TYAWMjiA9cNaCB+uSRRKMKa3KAhoHNkvvzCxnMlFSZu6hbnPuiQDfZfRwvbiuCbTUDVm/33rn5OqP/cWZ+NcZh8rg178jUFW9jmdJ4Ql0+g9PGydvEYj4ka6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746268393; c=relaxed/simple;
	bh=Af5eJ9491V7Rdra5LfIAJarCq2ooV8hQqIHvng7TBnI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XsUMY3I4m/NzRvYi5hqWvVnzHUEwYQSJZZaxVjJ/lv04kFp+SheVifaMyCLUQw1Tk/1Y9qMIjtAm4JUbWAbx1xVf2aF2I0AhqPnUEPHeBD1QkK9CtwiuJ0szFR+yMoRo4yd/Kf6xWxiSKWcPY1XP64wCLvQDDSxupOuzZiH8E+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FOhw7HEm; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FOhw7HEm"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso15904245e9.0
        for <llvm@lists.linux.dev>; Sat, 03 May 2025 03:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746268389; x=1746873189; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBV2rGv2S1NcPt4tVHRfpNM/jvRNqsvpOuHIr/RLX3s=;
        b=FOhw7HEmcZ0fbQsF8/qU0NyIgGzF96kWk7pPo22pAlMBR/CPTVDo24BGlgHixnSKjg
         TiM+/8ks9iyrlMfz6UVc4gulGta5tik7BMamqgrTllMVcg5qWOwVhHgROFlbyElCR0Ja
         +HRoPlW/gGqGTY057JS2lvdyM9+BhvvrPCi9gu4xnLxA4+z8nWp7yeZETPxUbBIEq3kn
         /zGPPnxgAzPqBIV9WfxXknqepah6MjSakm5DzT2RL/rae1JpStJHSW7MDNn9aoKc6EXI
         Bo0Pb4cZqf+8NC8AQkheK20YEVUWSbC6Hnb9Y25IWGLwlL4D39bZOx5lytdx7qSFuDgA
         SgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746268389; x=1746873189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YBV2rGv2S1NcPt4tVHRfpNM/jvRNqsvpOuHIr/RLX3s=;
        b=SZxE7dt+LJBGOA4m9QKbGKB1FrhfjNRLUA2Lf33zYi7ZIwV+jTQ3J8Eu0omLM2MK5A
         GhH742C4BzkneKpyoITwENElPTV4JsI8vtljrmPgEqjy7gHclhtjcBqHIYIsbiARjJvu
         vrv8AReDAljhZSyEYuguqR/QD33urr9MDJyCFOL6sATuM8/6EGTgIe83CMjqxKc/+QaK
         xlDvrt0A5l6nXxp98hpiYYOmt+RVd04UQKcXX4tyvbZREP5CGAyxBJ5xUHczuv4Epb/w
         jsTwQateg0IqJhSGW1edMGquyf3JZGI7aMbz05k9CITS9s0AmojIeiI1JwsoISHk9gLx
         jLuQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+fxxNvSqCpp6oGUXgqsYqRVDTM+mB4MfL5ToKIaqE27oSv73YzGTTnCtGsGI+eio9TRWz@lists.linux.dev
X-Gm-Message-State: AOJu0Yzewt6DajhzlcgKWm+epk0DlMAqslCT5zAo1YheISgBX+kCT2k+
	3/ZML/qUyWhvj9wzD72PIpOdTylR3H1/rden7bxdE0vV9T67tg02
X-Gm-Gg: ASbGnctjNhcTTGpsrivkp5RkFsUiThINxtBud75xxOHw4kRs4bY/4BMi3KvxpHNj5XX
	GeD3Y7Ih2wcx3b6afWSOTMr1i1kF7W8Xh06Mum3S2AHTaXrZZ7ftrmd8sQ7Q/czZ4tkMFL9URTC
	Ngsefv8ufz4uh1sREkjPMjmgWsSIpE7iGm2cpDFN/O95i0TlGt6ymyjVHU6V0OuOpMWyzz5ya3s
	jre2fJxvk/B5Q0sGepjoK9wy1xNo+GEfA5FzdIJeSk5OXBJmFWrzVScNorKLkk4ZJs5d3C0Ce23
	bx/ggpEbZsXDE94bzgJ0nOmsk/1sy8nG4eJr1f7gpma+4yGI+RZPs47jzlZeZcHZQUWw+283ex2
	/ECE=
X-Google-Smtp-Source: AGHT+IEnmj/wELsmjhFnfT6qGiVRS7j7iGSP1/hYYVfSSSPQpy4IlL0h4sVcusqZ7jCZSfWHVvIyUg==
X-Received: by 2002:a05:600c:4f51:b0:43e:afca:808f with SMTP id 5b1f17b1804b1-441c494870cmr5137755e9.31.1746268389399;
        Sat, 03 May 2025 03:33:09 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc480sm72235925e9.2.2025.05.03.03.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 03:33:08 -0700 (PDT)
Date: Sat, 3 May 2025 11:33:07 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ian Rogers <irogers@google.com>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Arnd Bergmann <arnd@arndb.de>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin
 Stitt <justinstitt@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jakub Kicinski <kuba@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Leo Yan
 <leo.yan@arm.com>
Subject: Re: [PATCH v2 1/5] bitfield: Silence a clang -Wshorten-64-to-32
 warning
Message-ID: <20250503113307.37b71fdf@pumpkin>
In-Reply-To: <20250430171534.132774-2-irogers@google.com>
References: <20250430171534.132774-1-irogers@google.com>
	<20250430171534.132774-2-irogers@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 30 Apr 2025 10:15:30 -0700
Ian Rogers <irogers@google.com> wrote:

> The clang warning -Wshorten-64-to-32 can be useful to catch
> inadvertent truncation. In some instances this truncation can lead to
> changing the sign of a result, for example, truncation to return an
> int to fit a sort routine. Silence the warning by making the implicit
> truncation explicit. This isn't to say the code is currently incorrect
> but without silencing the warning it is hard to spot the erroneous
> cases.

I suspect that is going to add an explicit mask in many cases.
Probably for u8, u16 and u32 if the return value from the old
code would return a u64 and the value is assigned to a u64.

Now if 'field_mask()' and 'field_multiplier()' are constants
then the compiler might optimise away the extra mask.
But in that case it shouldn't be bleating about the truncation
because it knows it can't happen.

So get the compiler fixed to do proper 'value tracking' and only
report about truncation when the high bits might be non-zero.
It also needs to not warn when the high bits are saved separately
(int h = v64 >> 32, l = v64;).

Then you have to worry about stopping the compiler bleating
for the return values of read (and similar).

Once you've got the compiler fixed to remove most of the false
positives worry about the Linux code.

	David

> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  include/linux/bitfield.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
> index 63928f173223..cc5cfed041bb 100644
> --- a/include/linux/bitfield.h
> +++ b/include/linux/bitfield.h
> @@ -176,7 +176,7 @@ static __always_inline __##type type##_encode_bits(base v, base field)	\
>  {									\
>  	if (__builtin_constant_p(v) && (v & ~field_mask(field)))	\
>  		__field_overflow();					\
> -	return to((v & field_mask(field)) * field_multiplier(field));	\
> +	return to((__##type)((v & field_mask(field)) * field_multiplier(field))); \
>  }									\
>  static __always_inline __##type type##_replace_bits(__##type old,	\
>  					base val, base field)		\

