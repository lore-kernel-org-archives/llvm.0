Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F007C09A
	for <llvm@lists.linux.dev>; Fri,  2 Feb 2024 09:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706865972; cv=none; b=GYfqpcYCfOEFZoPj75Fm9bQhwN4yJ9yjRZoT2FOGL5uyMVzXPhkPA+uo5737/UGzUy1it+bs3AOrWiMquFk1v2+PSjueL/9L4pET2muMO8jc+yqUojEWg+EeEeIpLtIb6BnT1cxFwJCvzJ6gvHRHj989gD+83Pvh9UJWz5d/4qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706865972; c=relaxed/simple;
	bh=r1KSDdshTOdl1eD90GEdgP1GIyuWH5dotuZGtVETZPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d0WReLOkjfRuTzeAerrgLK8ZgK4z80JFZ8uZ3vh/GprO+pkmG4WuJzX1rcHNL565s6HIEjQYfyeaDKq8iAT4Rxg94+zJfLTL1NNzZhgB0dB1PkExT9ZJil5xs4odsciBkY8UFiDDknQ5Lw3tiGtmqC5mUTNh2TC14wUYC2nyKmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hnZL0d3v; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hnZL0d3v"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d7354ba334so15979875ad.1
        for <llvm@lists.linux.dev>; Fri, 02 Feb 2024 01:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706865970; x=1707470770; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lv2NKH9WWB74jvhBNElogS2Uwp+4e3LBP2aAu2jyOBc=;
        b=hnZL0d3vjfKTpzrwi0veKG/nUFf4KgRJjRkTqti2nsb5wZkKLzl0xoVGKCnPxiQn2E
         l3KPXg+cYCzKHckYoIw9/5dT6vM3TluelchTbhCViMHJHE2xt5Ur0BtHub92Og9xS71y
         ZzfqiU6eeWqfYyoMjftD+gy5vjXtV9YZJQGKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706865970; x=1707470770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lv2NKH9WWB74jvhBNElogS2Uwp+4e3LBP2aAu2jyOBc=;
        b=mYBa97SwOTx0JUnHNZCVagTf7FSXMzovazXzZoLpRqo7oog0mm3pvVuq4p2w7BJfjX
         y8HbaYV4AWJYp6cNtWqdCDK3sueHRP6B5TJCchFG8EHMj4xbNA3pjJoZAn+dO1C399vS
         WCF8t3S8rybqcX6nZ3+l+4/NkmhbjebmdguEaYFgcdHbsf8qv8RAr/8OZPXMDZ7QgIN3
         J9qhARb5gIXSLF3ZJSC3UsBGP2RdAAQxDG+RlEfCxr/NMh8wicJu004cPQKFMZ1Np2OG
         pKWn4lycn7k9/QgMvdEob4wE8OX7c6/x4b5BF7PRGloSdtEqHZcQPWi8La7UMQowFRBX
         sy/Q==
X-Gm-Message-State: AOJu0YzNH2qz4Mw8HSn+aKxP2SNTo0HiKb9n6u1HEWaD3KoD2n0qggOq
	r1eHqYbsJUTJx+bZvxK6mH2mrMAqe+Wsvk9zWQsgqDF7S3YhwAAR+nCQ2eW2Ow==
X-Google-Smtp-Source: AGHT+IFVXwt3ZODto1D6uO78oFjr3U556S4oIO8F6WGJXjqUqMx9HKzgXSKcznjwitA2R8bviSg61Q==
X-Received: by 2002:a05:6a21:2c82:b0:19c:9d4d:7d7 with SMTP id ua2-20020a056a212c8200b0019c9d4d07d7mr6590870pzb.41.1706865970497;
        Fri, 02 Feb 2024 01:26:10 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUlcw3+jmJncLOKzKlDlKSkf2ZjgJtgJGOC6FlRhNPhCDEe66sr6BxngOa4HC33wqxuh7mE+IJLP3MzYEsY30WoPHLK+jYHPtb15IcNR79Mk8UQnW/N4kc9DVrfxHSxMKktDwocU9ZBml81w4EFV3Wf1zFWnVclBXHDqDogvyS6Qcdt27Yf+IEZ27WTYj2nPUjEbBCVzE2+y6TpV32SvGjcakPZQVKZSxISv7zZTSQVIWXKx8SNFabr9j5ye+/i95QcRGRpWjENb/zMVJBBIY7fCGQA5xisKvcb7THROKTn6PuAj68u0E0bftE3cv9SUnOpuNABN3SB8QAXy6RWhwugPDsqK1OfFKI9r/oKPicqE2qibeM6AafHPmB5XaqwOKzq/hbKaIYBhsoXlM8yScllZ525aboabholHCbQXPxiq5CU/NYCc0g3rXNlxMNWsKHUUKY1zeG/UU1q0mBq/iFMuI3ghFwadThzaI8jzHkVwg+oPA==
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id p20-20020a056a0026d400b006dfedc6a43dsm1140656pfw.208.2024.02.02.01.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 01:26:09 -0800 (PST)
Date: Fri, 2 Feb 2024 01:26:09 -0800
From: Kees Cook <keescook@chromium.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Miguel Ojeda <ojeda@kernel.org>, Marco Elver <elver@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] overflow: Expand check_add_overflow() for pointer
 addition
Message-ID: <202402020105.0759D4CD@keescook>
References: <20240130220218.it.154-kees@kernel.org>
 <20240130220614.1154497-2-keescook@chromium.org>
 <6d66deda-e09d-4899-b3a3-5137eeee449c@prevas.dk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d66deda-e09d-4899-b3a3-5137eeee449c@prevas.dk>

On Wed, Jan 31, 2024 at 09:35:35AM +0100, Rasmus Villemoes wrote:
> On 30/01/2024 23.06, Kees Cook wrote:
> > [...]
> > diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
> > index 6f1ca49306d2..d27b58fddfaa 100644
> > --- a/include/linux/compiler_types.h
> > +++ b/include/linux/compiler_types.h
> > @@ -375,6 +375,16 @@ struct ftrace_likely_data {
> >  /* Are two types/vars the same type (ignoring qualifiers)? */
> >  #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
> >  
> > +/* Is variable addressable? */
> > +#define __is_ptr_or_array(p)	(__builtin_classify_type(p) == 5)
> 
> That magic constant is a bit ugly, but I don't think there's a better
> way. However, a comment saying "pointer_type_class in gcc/typeclass.h in
> gcc source code" or something like that might help. Do we know for sure
> that clang uses the same value? I can't find it documented anywhere.

Very true. Offlist, Keith Packard suggested I switch to this, so we can
avoid the constant:

+#define __is_ptr_or_array(p)	(__builtin_classify_type(p) == \
				 __builtin_classify_type(NULL))

> 
> __check_ptr_add_overflow() - Calculate pointer addition with overflow
> checking
> > + * @a: pointer addend
> > + * @b: numeric addend
> > + * @d: pointer to store sum
> > + *
> > + * Returns 0 on success, 1 on wrap-around.
> > + *
> > + * Do not use this function directly, use check_add_overflow() instead.
> > + *
> > + * *@d holds the results of the attempted addition, which may wrap-around.
> > + */
> > +#define __check_ptr_add_overflow(a, b, d)		\
> > +	({						\
> > +		typeof(a) __a = (a);			\
> > +		typeof(b) __b = (b);			\
> > +		size_t __bytes;				\
> > +		bool __overflow;			\
> > +							\
> > +		/* we want to perform the wrap-around, but retain the result */ \
> > +		__overflow = __builtin_mul_overflow(sizeof(*(__a)), __b, &__bytes); \
> > +		__builtin_add_overflow((unsigned long)(__a), __bytes, (unsigned long *)(d)) || \
> > +		__overflow;				\
> > +	})
> 
> So I've tried to wrap my head around all these layers of macros, and it
> seems ok. However, here I'm a bit worried that there's no type checking
> of the destination. In particular, the user could perhaps end up doing
> 
>   check_add_overflow(p, x, p)

I tried to make sure the top-level filtering would require a pointer to
an integral type. I'm sure there is a way to foot-gun it, if one tries
hard enough. :)

> 
> which will go horribly wrong. Do we have any infrastructure for testing
> "this should fail to compile"? It would be good to have, not just for
> this, but in general for checking our sanity checks.
> 
> Another thing is that this will always fail with negative offsets (if b
> has signed type and a negative value, the multiplication won't fit in an
> unsigned type). I think __bytes should be ptrdiff_t.

Ew. A negative "add"... yes. I'll take a closer look.

Thanks for the review!

As it turns out, I may not need this patch at all yet, so I may hold off
on it until I can prove that we really will need it.

-Kees

-- 
Kees Cook
