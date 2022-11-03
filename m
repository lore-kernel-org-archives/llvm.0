Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9785F6FD6
	for <llvm@lists.linux.dev>; Thu,  3 Nov 2022 14:01:02 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id v17so2031008plo.1
        for <llvm@lists.linux.dev>; Thu, 03 Nov 2022 07:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H/5vOhwlNXhYHG3vtfZkW8oFR1SBGLdVv3cNEm7Gjpg=;
        b=HSYM5aB40cqZ5LVOioZSqw/0u7E0NnpN8VjstY8lpnTQ78z5MZCEmwONjxoMulojsb
         7NIdb09Bo0vkrvAGm3kuUr2uXH0xbgeBPYtKjmJa9ge1mYkCTylRlUQuEw1nKwkOLjsp
         CkOCVL3fFejV8GzUcd4QMgzGhlzf/VRgOTgTbCGS72ME+qNrcOjAOojDNBG3T/xHuaMt
         CV1OFFOjE7k1De+VxQ/HKNt+pJz7bsBrHyHzcaeR30GqLFjceCGa2pqkhkUhDHa9Z2RF
         O549GN9Pvy0pFSMD3zv6E2ThZYBQfzapz52WfreyPyWf7aznZb8HeBbavYxhVHO6ahno
         mxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/5vOhwlNXhYHG3vtfZkW8oFR1SBGLdVv3cNEm7Gjpg=;
        b=rnPxV9mg9PgLn4fNt9PmEmBO66jvLK5FKxMW9BFfFBWhxxJ0j966dfd3xRMIp7lFDy
         0W+kkZ2gdEwJczvp/tzy4hpIhQ2jKO4DQ8hsWG9qEvs+g6rzXGi0t+2xWfB3qIcTjRvb
         0OBFpRPX/l6iPBa3A4cK0N2Bd3foM0tOsUTmGuCawo1e5D2VlxD8hm1sMygb1NZs+hPA
         dLn/d5n6JcAh1yeNRRz6t3ET8pMRtyQvhMSnsrmtc9z5/prq80hReVhG1O6KgLcRtYqe
         dp8hHEuZsmFqMXKLT7vY8DFGH+tvxMCHVO2oowss0fA8q+ICoA9biWIINu7YMk++gRAq
         XJ6g==
X-Gm-Message-State: ACrzQf0ijosg/uUuY5dKBAuJHQPK/t9RpfHfU3mdhiP1d7YagoqvcIz8
	hOlEy4WVfhpOnmmR6AHBF0w=
X-Google-Smtp-Source: AMsMyM4srWG6hxyw7wzcI/wI/BJfnMysTm87sFYfHbenGUtVaGbpNx3HRBx+Q+wGSv7digJfKzho9g==
X-Received: by 2002:a17:902:bd98:b0:182:631b:7dd5 with SMTP id q24-20020a170902bd9800b00182631b7dd5mr30146841pls.165.1667484062001;
        Thu, 03 Nov 2022 07:01:02 -0700 (PDT)
Received: from hyeyoo ([114.29.91.56])
        by smtp.gmail.com with ESMTPSA id s4-20020a170902b18400b001782aab6318sm716573plr.68.2022.11.03.07.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 07:01:01 -0700 (PDT)
Date: Thu, 3 Nov 2022 23:00:53 +0900
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
Subject: Re: [PATCH 2/6] slab: Remove special-casing of const 0 size
 allocations
Message-ID: <Y2PJlfSDij7rDoW4@hyeyoo>
References: <20221101222520.never.109-kees@kernel.org>
 <20221101223321.1326815-2-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101223321.1326815-2-keescook@chromium.org>

On Tue, Nov 01, 2022 at 03:33:10PM -0700, Kees Cook wrote:
> Passing a constant-0 size allocation into kmalloc() or kmalloc_node()
> does not need to be a fast-path operation, so the static return value
> can be removed entirely. This is in preparation for making sure that
> all paths through the inlines result in a full extern function call,
> where __alloc_size() hints will actually be seen[1] by GCC. (A constant
> return value of 0 means the "0" allocation size won't be propagated by
> the inline.)
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
>  include/linux/slab.h | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/include/linux/slab.h b/include/linux/slab.h
> index e08fe7978b5c..970e9504949e 100644
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -562,17 +562,13 @@ void *kmalloc_large_node(size_t size, gfp_t flags, int node) __assume_page_align
>  #ifndef CONFIG_SLOB
>  static __always_inline __alloc_size(1) void *kmalloc(size_t size, gfp_t flags)
>  {
> -	if (__builtin_constant_p(size)) {
> +	if (__builtin_constant_p(size) && size) {
>  		unsigned int index;
>  
>  		if (size > KMALLOC_MAX_CACHE_SIZE)
>  			return kmalloc_large(size, flags);
>  
>  		index = kmalloc_index(size);
> -
> -		if (!index)
> -			return ZERO_SIZE_PTR;
> -
>  		return kmalloc_trace(
>  				kmalloc_caches[kmalloc_type(flags)][index],
>  				flags, size);
> @@ -592,17 +588,13 @@ static __always_inline __alloc_size(1) void *kmalloc(size_t size, gfp_t flags)
>  #ifndef CONFIG_SLOB
>  static __always_inline __alloc_size(1) void *kmalloc_node(size_t size, gfp_t flags, int node)
>  {
> -	if (__builtin_constant_p(size)) {
> +	if (__builtin_constant_p(size) && size) {
>  		unsigned int index;
>  
>  		if (size > KMALLOC_MAX_CACHE_SIZE)
>  			return kmalloc_large_node(size, flags, node);
>  
>  		index = kmalloc_index(size);
> -
> -		if (!index)
> -			return ZERO_SIZE_PTR;
> -
>  		return kmalloc_node_trace(
>  				kmalloc_caches[kmalloc_type(flags)][index],
>  				flags, node, size);
> -- 
> 2.34.1

Looks good to me.

Reviewed-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>

-- 
Thanks,
Hyeonggon
