Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498A42F36
	for <llvm@lists.linux.dev>; Wed,  2 Nov 2022 19:40:33 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id y4so17582780plb.2
        for <llvm@lists.linux.dev>; Wed, 02 Nov 2022 12:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eB2CkIIW+FvN/Lo/L+v4C4FsoNsh4QvCTpwzE0gzBz4=;
        b=kopbiQPKWrumIeCuEELANKVvXKnGRiVq/vRKpUKLVafnmidHI5pNYouJ+JNTPAt/v4
         MguZEdCgIejN1AFkopf4SKhqQEoqmBgfllHic7LKiJoSRRNGE4nCyQkJ0bFpfskjlGls
         LLl88AjgS80QOIl4RVeYl/lqzdPgMw4C3Vdn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eB2CkIIW+FvN/Lo/L+v4C4FsoNsh4QvCTpwzE0gzBz4=;
        b=KUPDI0OyIptEcobFi8paYQt4tguWlm+fIAbhGFVOJg2ba5Cp0bQDago0QsZQylav+n
         THr1QDwmHDept89lyEu6mBEr9pqwevIWLaqNWTJ0NSSiL1mNB8JpPr15VFyuDNFNdZQw
         z1/LJpmnIatfCgu8OSg+0H3rJlo3vGLRKJy01MEB+2airYVepn2r7slzlB0QC6UKHRA1
         69Xl1+H7VDqgyRxNTKxNY2wRI5JDG/FGQ4sdY6R4A3UdxPpqR6AYyppnSnWvViVDqK52
         G13YEjp6AQXw6WEA2lNFw87ygCXa8+7ssPa3Iu0F6Hj1qEGCdDG6Vr0qUd0WlEbifvNt
         eW+g==
X-Gm-Message-State: ACrzQf0MdQltwV6bi6M8KNVgyr5pAXjeCAinxJ0rPHI7dfT6n86N4Nul
	MEMRUqZmHcqmooGCER7sL9flUw==
X-Google-Smtp-Source: AMsMyM4pC83ghVbZYi4UhG7ADEOPB5AsNmFJrX+HahRpRwGhQIgX+NMh2hyqdu4Oww6fhD1+9AghfA==
X-Received: by 2002:a17:90b:2305:b0:213:7a2f:aed8 with SMTP id mt5-20020a17090b230500b002137a2faed8mr27732037pjb.129.1667418032775;
        Wed, 02 Nov 2022 12:40:32 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id iq1-20020a17090afb4100b002135de3013fsm1805607pjb.32.2022.11.02.12.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 12:40:32 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:40:31 -0700
From: Kees Cook <keescook@chromium.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: Vlastimil Babka <vbabka@suse.cz>, Guenter Roeck <linux@roeck-us.net>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	David Gow <davidgow@google.com>, Christoph Lameter <cl@linux.com>,
	Pekka Enberg <penberg@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 4/6] string: Add __realloc_size hint to kmemdup()
Message-ID: <202211021240.4A97FDE0@keescook>
References: <20221101222520.never.109-kees@kernel.org>
 <20221101223321.1326815-4-keescook@chromium.org>
 <b0289429-8779-643a-07da-3cda83c8ca9d@prevas.dk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0289429-8779-643a-07da-3cda83c8ca9d@prevas.dk>

On Wed, Nov 02, 2022 at 10:26:40AM +0100, Rasmus Villemoes wrote:
> On 01/11/2022 23.33, Kees Cook wrote:
> > Add __realloc_size() hint to kmemdup() so the compiler can reason about
> > the length of the returned buffer. (These must not use __alloc_size,
> > since those include __malloc which says the contents aren't defined[1]).
> > 
> > [1] https://lore.kernel.org/linux-hardening/d199c2af-06af-8a50-a6a1-00eefa0b67b4@prevas.dk/
> > 
> 
> >  extern char *kstrndup(const char *s, size_t len, gfp_t gfp);
> > -extern void *kmemdup(const void *src, size_t len, gfp_t gfp) __alloc_size(2);
> > +extern void *kmemdup(const void *src, size_t len, gfp_t gfp) __realloc_size(2);
> 
> What tree is this based on? I see that kmemdup() has grown that bogus
> __alloc_size in next-20221101, but in next-20221102 this commit seems to
> DTRT, namely
> 
> -extern void *kmemdup(const void *src, size_t len, gfp_t gfp);
> +extern void *kmemdup(const void *src, size_t len, gfp_t gfp)
> __realloc_size(2);
> 
> (i.e. there should never be an intermediate commit where kmemdup has
> __alloc_size()).

Right -- I fixed in in my -next tree to not use __alloc_size.

-- 
Kees Cook
