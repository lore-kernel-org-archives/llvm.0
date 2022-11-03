Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D867470
	for <llvm@lists.linux.dev>; Thu,  3 Nov 2022 14:17:02 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id l2so2025498pld.13
        for <llvm@lists.linux.dev>; Thu, 03 Nov 2022 07:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TXM8klCKeS/1DhTbx8K3iCyLUoszcYkLgPKVfT2w3RI=;
        b=Dj2pPTFC101sAAfrY4zflBUJClmV9LJZxnnCPvVEzazZjXW9x6Iou63wyMzbWWJ89t
         j7oG7vn2aWB82f9fzyWmPHG63C+CQUm+qwAoUG3K74Fk3xmcvdnvKO4Sp0ycbkbtwPgw
         JzrIdfcY7mQqqs7S18anyeX4NFJTJnli7LB2jquJ5OItfQTJ45DakgtpHPfWnRHvsNu1
         Cr9Mnvcfdfol9a9tH1m/7hBJ7sjSitaRXs0XBuFTZ80eps6WUXOUmeTW5p5KdwfKRcJn
         kHzY4dj2Gsl7YsbhQno5Uipu6iHZrNsc2ifuvTnubkgmzNCZZn8C3ozR0OLLl1pO4Xqp
         hC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXM8klCKeS/1DhTbx8K3iCyLUoszcYkLgPKVfT2w3RI=;
        b=C2LuCraupekTr7CjMbdVY1w91zoeuRR1iv1s/RqTDOQks1R5Lmdp2wp5N++fjTe/04
         qTQGhSq+7/43s5F2GEaRpRin49YbbkA0p+m9cLKx6cUKYfPO3iLPnEP7vQpOfypSU8q+
         eLewSKDqLBAxx/nnyjJlwRzAYSMUh0rbIxDvx40Zp09aE/0I0tzfunOzvMkV24Qtu7ty
         dYxuFJx0C49LEAqpP8fC5F6BZg7Jyv5+IwRwGGcZfKusdr+5viBz5NOxsOzkDoLQ/95Z
         aPpE8xwx/qm4IvPS8sxm0XNnlbn11q4mghhp8TRxWth35tNpI2TV9JTWULb7lhgfgih4
         qeRg==
X-Gm-Message-State: ACrzQf1dzTDhnL4hboH3v+ceprB6ZMs1C5ZC9kniNs/uCC6tl/YPOdF8
	hWRkGq+JqF2Bi73mimHVmSs=
X-Google-Smtp-Source: AMsMyM5aZCQxn6cjfpIQMj53LX631TQBC0V4f2tlHG5CUeGpwa3qaw2TjwQ+WDAG8nje39/0KAyYqA==
X-Received: by 2002:a17:90b:400d:b0:213:be60:b0d2 with SMTP id ie13-20020a17090b400d00b00213be60b0d2mr28215061pjb.75.1667485021870;
        Thu, 03 Nov 2022 07:17:01 -0700 (PDT)
Received: from hyeyoo ([114.29.91.56])
        by smtp.gmail.com with ESMTPSA id z8-20020a6553c8000000b0046f6d7dcd1dsm851109pgr.25.2022.11.03.07.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 07:17:01 -0700 (PDT)
Date: Thu, 3 Nov 2022 23:16:53 +0900
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: Kees Cook <keescook@chromium.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Christoph Lameter <cl@linux.com>,
	Pekka Enberg <penberg@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org,
	David Gow <davidgow@google.com>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
	Guenter Roeck <linux@roeck-us.net>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 3/6] slab: Provide functional __alloc_size() hints to
 kmalloc_trace*()
Message-ID: <Y2PNVUzHWCg765ml@hyeyoo>
References: <20221101222520.never.109-kees@kernel.org>
 <20221101223321.1326815-3-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101223321.1326815-3-keescook@chromium.org>

On Tue, Nov 01, 2022 at 03:33:11PM -0700, Kees Cook wrote:
> Since GCC cannot apply the __alloc_size attributes to inlines[1], all
> allocator inlines need to explicitly call into extern functions that
> contain a size argument. Provide these wrappers that end up just
> ignoring the size argument for the actual allocation.
> 
> This allows CONFIG_FORTIFY_SOURCE=y to see all various dynamic allocation
> sizes under GCC 12+ and all supported Clang versions.
> 
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=96503
> 
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Christoph Lameter <cl@linux.com>
> Cc: Pekka Enberg <penberg@kernel.org>
> Cc: David Rientjes <rientjes@google.com>
> Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Roman Gushchin <roman.gushchin@linux.dev>
> Cc: Hyeonggon Yoo <42.hyeyoo@gmail.com>
> Cc: linux-mm@kvack.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  include/linux/slab.h |  8 ++++++--
>  mm/slab_common.c     | 14 ++++++++++++++
>  2 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/slab.h b/include/linux/slab.h
> index 970e9504949e..051d86ca31a8 100644
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -442,6 +442,8 @@ static_assert(PAGE_SHIFT <= 20);
>  
>  void *__kmalloc(size_t size, gfp_t flags) __assume_kmalloc_alignment __alloc_size(1);
>  void *kmem_cache_alloc(struct kmem_cache *s, gfp_t flags) __assume_slab_alignment __malloc;
> +void *kmem_cache_alloc_sized(struct kmem_cache *s, gfp_t flags, size_t size)
> +			     __assume_slab_alignment __alloc_size(3);
>  void *kmem_cache_alloc_lru(struct kmem_cache *s, struct list_lru *lru,
>  			   gfp_t gfpflags) __assume_slab_alignment __malloc;
>  void kmem_cache_free(struct kmem_cache *s, void *objp);
> @@ -469,6 +471,8 @@ void *__kmalloc_node(size_t size, gfp_t flags, int node) __assume_kmalloc_alignm
>  							 __alloc_size(1);
>  void *kmem_cache_alloc_node(struct kmem_cache *s, gfp_t flags, int node) __assume_slab_alignment
>  									 __malloc;
> +void *kmem_cache_alloc_node_sized(struct kmem_cache *s, gfp_t flags, int node, size_t size)
> +				  __assume_slab_alignment __alloc_size(4);
>  
>  #ifdef CONFIG_TRACING
>  void *kmalloc_trace(struct kmem_cache *s, gfp_t flags, size_t size)
> @@ -482,7 +486,7 @@ void *kmalloc_node_trace(struct kmem_cache *s, gfp_t gfpflags,
>  static __always_inline __alloc_size(3)
>  void *kmalloc_trace(struct kmem_cache *s, gfp_t flags, size_t size)
>  {
> -	void *ret = kmem_cache_alloc(s, flags);
> +	void *ret = kmem_cache_alloc_sized(s, flags, size);
>  
>  	ret = kasan_kmalloc(s, ret, size, flags);
>  	return ret;
> @@ -492,7 +496,7 @@ static __always_inline __alloc_size(4)
>  void *kmalloc_node_trace(struct kmem_cache *s, gfp_t gfpflags,
>  			 int node, size_t size)
>  {
> -	void *ret = kmem_cache_alloc_node(s, gfpflags, node);
> +	void *ret = kmem_cache_alloc_node_sized(s, gfpflags, node, size);
>  
>  	ret = kasan_kmalloc(s, ret, size, gfpflags);
>  	return ret;
> diff --git a/mm/slab_common.c b/mm/slab_common.c
> index 33b1886b06eb..5fa547539a6a 100644
> --- a/mm/slab_common.c
> +++ b/mm/slab_common.c
> @@ -1457,6 +1457,20 @@ size_t ksize(const void *objp)
>  }
>  EXPORT_SYMBOL(ksize);
>  
> +/* Wrapper so __alloc_size() can see the actual allocation size. */
> +void *kmem_cache_alloc_sized(struct kmem_cache *s, gfp_t flags, size_t size)
> +{
> +	return kmem_cache_alloc(s, flags);
> +}
> +EXPORT_SYMBOL(kmem_cache_alloc_sized);
> +
> +/* Wrapper so __alloc_size() can see the actual allocation size. */
> +void *kmem_cache_alloc_node_sized(struct kmem_cache *s, gfp_t flags, int node, size_t size)
> +{
> +	return kmem_cache_alloc_node(s, flags, node);
> +}
> +EXPORT_SYMBOL(kmem_cache_alloc_node_sized);

The reason that we have two implementations of kmalloc_trace*
depending on CONFIG_TRACING is to save additional function call when
CONFIG_TRACING is not set.

With this patch there is no reason to keep both.
So let's drop #ifdefs and use single implementation in mm/slab_common.c.

Thanks!

>  /* Tracepoints definitions. */
>  EXPORT_TRACEPOINT_SYMBOL(kmalloc);
>  EXPORT_TRACEPOINT_SYMBOL(kmem_cache_alloc);
> -- 
> 2.34.1
> 

-- 
Hyeonggon
