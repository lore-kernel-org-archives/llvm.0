Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44661586FC
	for <llvm@lists.linux.dev>; Mon, 29 Jan 2024 21:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706565378; cv=none; b=fxSKO1Hef6jE1SA7xAJp7D8Z+e1Rp5LNVybXOJ2YWPcgI6KvJoDfswuX5rfxouPtvZTUOfnrkWAzawfv6OtURrUl1Voti5qEqg3u7/xbuhNd/034f8zbE8x2rnNFDORLQmDPuBhLpaGqwEsJ0f/2r9cn+LZTA1achRDYo3dBjJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706565378; c=relaxed/simple;
	bh=SGut10VocypQdQV3KZ8JxNWSezKusO01V74qBOL3voA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E5DrVKAijlm+vkGMlDwegRabMbwqlyU4bpH2kiFTI8IN1dGjrMvTfu4x0/NcPZpX/tpK798TFxlXP4NEKH6kddnFcY+D8vD8IQOIqyIXLcE1ZUporYVVblU5Qfe0WfIZxWJiycO6uWmxtr7GqOA7qHKy35CH84GBVDGtbur7rcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Tja37Uy3; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Tja37Uy3"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6dde5d308c6so2219382a34.0
        for <llvm@lists.linux.dev>; Mon, 29 Jan 2024 13:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706565376; x=1707170176; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sVQfnYTeTh5M6YXr0RwVkYHFBKg3/KVCWcIRRHP0C1w=;
        b=Tja37Uy3D/0SaQAWnGrrWHvnNgDpvA4CD9A1jkii2jRv87yhPuzOzVKJkdvs7bG13L
         Vx0PME10xQuBe1hqhF9GGNYF7W+NpfW9IzQXcag4lPcFJrh+HJeCAFaqzQy5WHRVPrRD
         FZkgAaHRxX/KdYKaS2/xFIiv+P59edQ6g27ZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706565376; x=1707170176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVQfnYTeTh5M6YXr0RwVkYHFBKg3/KVCWcIRRHP0C1w=;
        b=FaFfYu58NjUSodJflj3q/4q3+tWpKCkl7QM6DEgMbXtcnR3yhs3sLH0Vv8icIldqm1
         vdBnSkBWvG5QzswzUaAP+mG63WtZdp4RQsB9IRQlft8Rxsw4jxzcpMxK7bfguqBV8a2q
         Dke7Tc5M8Evu5gzXLAbBxtWncldqSbhV1jgYJ5oLpoETJ4L3cERsaVA72/Jfxho/Z90e
         pMKDGFCXpVm3s5lFL0qJqOsbzwHcrxQVZuJFMGs4IuznmgZ5DQEZHFTG9dFvSnhoqWe8
         6pUwah15lXGlZ/SIyywT04TjilHbl235OiyHWfkExm3H+hXlq54D+7sZpZi9ZhIHuiTQ
         d4YA==
X-Gm-Message-State: AOJu0YxF9OcQDBtcJnKJFW+tQWLyFcYVJ7Rf24QCp2bb54lxDXvvDDJO
	LKMQBKoEGDM4CPthykWgJ/nj3fkt9+F9SQWYHEWkqexzjbq4ZzTZ7D3w250AGQ==
X-Google-Smtp-Source: AGHT+IESvdtCmLe+CNtI14Gg/BY5kJrVtDarakUMqov6S6A5Y8Q7+73nxlvky29dvBOp4+LRENC4/Q==
X-Received: by 2002:a05:6358:5709:b0:176:4fce:27 with SMTP id a9-20020a056358570900b001764fce0027mr3844045rwf.6.1706565375937;
        Mon, 29 Jan 2024 13:56:15 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id y3-20020a63de43000000b005cf9e59477esm6779865pgi.26.2024.01.29.13.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 13:56:15 -0800 (PST)
Date: Mon, 29 Jan 2024 13:56:14 -0800
From: Kees Cook <keescook@chromium.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: Mark Rutland <mark.rutland@arm.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Marco Elver <elver@google.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 5/5] overflow: Introduce inc_wrap() and dec_wrap()
Message-ID: <202401291234.00B6A1B4D@keescook>
References: <20240129182845.work.694-kees@kernel.org>
 <20240129183411.3791340-5-keescook@chromium.org>
 <33dcfa96-e584-404e-a9e5-afeca9105818@prevas.dk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33dcfa96-e584-404e-a9e5-afeca9105818@prevas.dk>

On Mon, Jan 29, 2024 at 09:16:36PM +0100, Rasmus Villemoes wrote:
> On 29/01/2024 19.34, Kees Cook wrote:
> > This allows replacements of the idioms "var += offset" and "var -= offset"
> > with the inc_wrap() and dec_wrap() helpers respectively. They will avoid
> > wrap-around sanitizer instrumentation.
> > 
> > Cc: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> > Cc: linux-hardening@vger.kernel.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  include/linux/overflow.h | 32 ++++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> > 
> > diff --git a/include/linux/overflow.h b/include/linux/overflow.h
> > index 4f945e9e7881..080b18b84498 100644
> > --- a/include/linux/overflow.h
> > +++ b/include/linux/overflow.h
> > @@ -138,6 +138,22 @@ static inline bool __must_check __must_check_overflow(bool overflow)
> >  		__sum;					\
> >  	})
> >  
> > +/**
> > + * add_wrap() - Intentionally perform a wrapping increment
> 
> inc_wrap

Thanks, fixed.

> 
> > + * @a: variable to be incremented
> > + * @b: amount to add
> > + *
> > + * Increments @a by @b with wrap-around. Returns the resulting
> > + * value of @a. Will not trip any wrap-around sanitizers.
> > + */
> > +#define inc_wrap(var, offset)					\
> > +	({							\
> > +		if (check_add_overflow(var, offset, &var)) {	\
> > +			/* do nothing */			\
> > +		}						\
> > +		var;						\
> 
> Hm. I wonder if multiple evaluations of var could be a problem.

I am normally defensive about this, but due to @a normally being an
lvalue, I lacked the imagination to think of other side-effects, but
you've set me straight below.

> Obviously never if var is actually some automatic variable, nor if it is
> some simple foo->bar expression. But nothing really prevents var from
> being, say, foo[gimme_an_index()] or something similarly convoluted.
> 
> Does the compiler generate ok code if one does
> 
>   typeof(var) *__pvar = &(var);
>   if (check_add_overflow(*__pvar, offset, __pvar)) {}
>   *__pvar;
> 
> [in fact, does it even generate code, i.e. does it compile?]
> 
> I dunno, maybe it's overkill to worry about.

Yeah, an index-fetch is a great example that would get lost here. I've
updated these to be defined in terms of add/sub_wrap() and to use your
pointer typing method to avoid side-effects.

-- 
Kees Cook
