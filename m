Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949A51C3BFC
	for <llvm@lists.linux.dev>; Thu, 19 Feb 2026 07:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771487829; cv=none; b=XmHAN7gT27hj+YhPbL6sm+O71Ry8R0/XhuJq5PvWCRDvKfFLJkczBaeaeed54SWhsc/oucJWfrDJnEN6X0wGaZkvTI7U2x4vOUmbmaeGhp5X7nuhEbqa0hfEaQDIfltUcChaj9Ot2DN+0o2S52Nff/WnSeQ7TS8W0dHc9cn3Yuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771487829; c=relaxed/simple;
	bh=hUxk4HA/1LmjRVI/ERTkmt5jBW8D8G4uV1QeZXJbdJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iOoKpDopgq5KUdXDcPDelAxEB04j0kNBfYfYhjNMURUVBlGyGO8Grq0Azi/68hhDEcayh4Selz5TA1/oL7uHIlLD4F6aY6lfiDrNXlDl3zetRIdU+ily8faXEgn5AMNu35WYkeiJZ0RoZKR9GQdrpkzHOuqm4boCrurvPhKB6k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zN+zH0B7; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zN+zH0B7"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-480706554beso7109675e9.1
        for <llvm@lists.linux.dev>; Wed, 18 Feb 2026 23:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771487827; x=1772092627; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ee6rz3n4lRLIfzQydkYiBi8fGnwsN3AAWbuDK39dnaE=;
        b=zN+zH0B7urdBbVo26oJ5aqtwHzYhiWx4ZBYkELKBlMu2harAMaIwH20I+yV1I7yrBd
         owFRk+YKd1ZVfIULzKd6PWDDkp/9OarbUs23CiaU819roFIxg21LTK1hnDsTjM1PO70j
         k6VEcZbo3ufWpiGp0m8kK2OFLSMFFahwveAxmYmzon01SdUgxEEmTTXm6ZQ+NQ+JY4E3
         N5fJDKCz7JpVP8Q5B8G+ez1QwnKRcgYkBpOxPvWinRu6Y+2RZFqVxR4n/kr1632XxApL
         N6ixMsFZTmh+MCDFCDCiGptecwi/qduyvtoXBcZeS542pbJcm5CyTbqhTTSAnIp2Hn6a
         X33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771487827; x=1772092627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ee6rz3n4lRLIfzQydkYiBi8fGnwsN3AAWbuDK39dnaE=;
        b=vfmA8Fn9rE8riJ7prWArdidaOc9S6n0e9amP3HGLMYTzrDKrL1LvpgzUew2QPp06rw
         HFv4uwPuyPF8twd5VSxEyoFlUumIGYtQiSpJwWKXFg+3dCHtEaFEVvzXfTFImezBJbbP
         gUR2vTmOPPLWYF33V1hJbSQFCOOCvb9ZoQYEah+/3vsY/iEAnlDnvPtujCu5ZFWiGa+5
         VRYk9X9jWxi8qNUJoxGg6s0v6QMQRR9JHarmR99eX5CUw7r1a4l5SbVHLAvQWRM/TGnD
         JhTqik9Dywa2VsAhIOVgBQJgE7a50uMxyV5YI79iWi/wboJO6M4KWX4mLLt9X7fo2ih6
         HuJg==
X-Forwarded-Encrypted: i=1; AJvYcCWHs+bcRsOEp2clZLhqrRucLKB/OZiePkb1V2HyStYXGa67oUxwN1u2bCFsdvs2Ogp+rDn9@lists.linux.dev
X-Gm-Message-State: AOJu0YyvnXsh5iku4i2kaZhDZYgkBmsn3sHROlBZRQq36bP0wz4qRQ3r
	1cj6LW4dfATIxWW7672Y6db2ZvwPN9FGM6ETKCIMB/Enl7CxMs3RVmAxK+2ZdeI9BSU=
X-Gm-Gg: AZuq6aIAnoybK5OdjdubOpWyxr9UQapmOcJ3tGDNa3sVWFDkXsRDuy7SQvIeHGs05uc
	ygvVj44TQSacEkar+bqJUPxmfzOtupVcyl63NdZ0pGhbg/ilDRKiuxVm3FA2aIppV2YeOWMkis5
	GxosXkHf6mru2ht/sPsYG4CJX/IzmOnTLcG7cQnIhyr3+UQ+PjzkbloRsN5cRWzskwBiirITIRz
	Ef8+vcu38JLLAkJ3Efq4zBL2zHQWh67PAe4j4AhCNT7ShmJhqUP0gkodzq/TOjs5cd2i/YYxpCw
	ZB0ak5SRiXbDGyK55LXf/+N/f42GVjctKRmg+oGGVqk7TGtR6hZurAhQ8XgSSKyNde11BI3lLVA
	jFK0Ncjqp3HZREiugPL38iI+A54PWOqIUJdAz+XXjBLYUIksMekL7e3ThXqe8kdGAysK4zvWLmq
	NZlY6pK1tMu8Sh8Oj0jGM7l6pGoi+P
X-Received: by 2002:a05:600c:698c:b0:477:5ad9:6df1 with SMTP id 5b1f17b1804b1-48379b932b7mr310004635e9.3.1771487826769;
        Wed, 18 Feb 2026 23:57:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839f96967bsm15143135e9.3.2026.02.18.23.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 23:57:06 -0800 (PST)
Date: Thu, 19 Feb 2026 10:57:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kees Cook <kees@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Christoph Lameter <cl@linux.com>,
	Pekka Enberg <penberg@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Jann Horn <jannh@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Marco Elver <elver@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>, linux-mm@kvack.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	John Hubbard <jhubbard@nvidia.com>, Joe Perches <joe@perches.com>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, Jakub Kicinski <kuba@kernel.org>,
	Yafang Shao <laoar.shao@gmail.com>,
	Tony Ambardar <tony.ambardar@gmail.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Jan Hendrik Farr <kernel@jfarr.cc>,
	Alexander Potapenko <glider@google.com>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-doc@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v6 1/5] slab: Introduce kmalloc_obj() and family
Message-ID: <aZbCT3-q3O4M5osr@stanley.mountain>
References: <20251203233029.it.641-kees@kernel.org>
 <20251203233036.3212363-1-kees@kernel.org>
 <960729bb-0746-4709-a40c-2e254f963deb@suse.cz>
 <202601090928.5CFF95F@keescook>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202601090928.5CFF95F@keescook>

On Fri, Jan 09, 2026 at 09:31:03AM -0800, Kees Cook wrote:
> On Thu, Jan 08, 2026 at 03:01:00PM +0100, Vlastimil Babka wrote:
> > On 12/4/25 00:30, Kees Cook wrote:
> > > [...]
> > > +/**
> > > + * __alloc_objs - Allocate objects of a given type using
> > > + * @KMALLOC: which size-based kmalloc wrapper to allocate with.
> > > + * @GFP: GFP flags for the allocation.
> > > + * @TYPE: type to allocate space for.
> > > + * @COUNT: how many @TYPE objects to allocate.
> > > + *
> > > + * Returns: Newly allocated pointer to (first) @TYPE of @COUNT-many
> > > + * allocated @TYPE objects, or NULL on failure.
> > > + */
> > > +#define __alloc_objs(KMALLOC, GFP, TYPE, COUNT)				\
> > > +({									\
> > > +	const size_t __obj_size = size_mul(sizeof(TYPE), COUNT);	\
> > 
> > I assume with the hardcoded 1 for COUNT, this size_mul() will be eliminated
> > by the compiler and not add unnecessary runtime overhead? Otherwise we
> > should have two core #define variants.
> 
> You're correct: the compiler completely collapses it with 0 runtime
> overhead; a variant is not needed.
> 
> > I also noted that the existing kmalloc_array() and kvmalloc_array() do
> > check_mul_overflow() and return NULL silently on overflow. This AFAIU will
> > make SIZE_MAX passed to the underlying kmalloc/kvmalloc and thus will cause
> > a warning. That's IMHO a good thing.
> 
> Right -- I prefer seeing the SIZE_MAX yelling from the allocator. Should
> we change how k*malloc_array() behaves?

Huh, yeah, it's weird to not get a stack trace if kmalloc() fails.  On
the other hand, if we're allocating SIZE_MAX, that is probably a user
controlled size.  Since we don't want people spamming dmesg, it should
probably be WARN_ONCE().

regards,
dan carpenter

