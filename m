Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6746FD6
	for <llvm@lists.linux.dev>; Thu,  3 Nov 2022 13:32:49 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id b5so1666129pgb.6
        for <llvm@lists.linux.dev>; Thu, 03 Nov 2022 06:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=opwfbW0762ODyDc7uXtbMZOYVw4Y0uBaxSM8z+IHWTE=;
        b=pBEvOPt8RqH/Q7RQT7xTZBt7qG/22c6e0IXqun2iUIkaf09m62O6gBpaECjyRKx0te
         V4kaEbd3mx28yQpCm/IclIHtbJwyNpGOdZCRR3vHVgq+Tfh8XfLgDyqXspnNjy33+Geb
         Eqqnpl/2OC76Q3TTmyTDd1edUwehiBhkAMpcn4iwFDJtIrXl3kbK+ktQ2lDSi7N1F/+B
         qatWJGBwIH1/vZASQF7Oi1CkQ1/BUr4ajPUznBW3Kjke0pPrRKHuODemY2XydnCNR0fM
         2CzYV8sq/LZGGwEecTgQXHitJQxaHi/wPAd8b2U6CK2bu2VnnYN0CKBassB2KzobsF1Z
         6KPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opwfbW0762ODyDc7uXtbMZOYVw4Y0uBaxSM8z+IHWTE=;
        b=eVj52IYZC/B+7HOADFtWcMSjYE/0HL6F0vUqNlW57K7FJNoQVPcvBwjJY3Ktop3BhO
         +qF/XGBdlHwKB4h2SaMKsX41i0E4ZLGOp2Ur9q3Hlze6XdfjMggyiU8+OnykW+9fXg7O
         WrZL/Hq/ka+aYzyiFNv4dJCC6RgArf9kzi8ozotXZrQUN6TukSigclKHPtORmp0QNLZx
         k8LEhvraJ/16tg6qfKTZTPSJkOERytJ9SYi2TprUn2V/jue6nY/0cObVgEop1tHhaXKA
         ZkCF6QeIKc10aO2R1yNTflLNltLJi8sdlMCHga4AQflwjER/5/7JuI6/GnjNADnuJMPl
         Lngg==
X-Gm-Message-State: ACrzQf2Ua9nsuSotcX8ZSXNn0w9SYuqxi6tUk5vSx7RsYnefsRtAZMHv
	W2N+1e1Sy1pSSoNUiv0qiV8=
X-Google-Smtp-Source: AMsMyM4x2PHt1DutjHxdBXGcFzCyFqfybLisdTBbqdK9sJ87ldXvyLGv53ZB/Co/v1POBSzAH437Wg==
X-Received: by 2002:a63:5853:0:b0:46f:fdfc:a651 with SMTP id i19-20020a635853000000b0046ffdfca651mr9429044pgm.385.1667482368756;
        Thu, 03 Nov 2022 06:32:48 -0700 (PDT)
Received: from hyeyoo ([114.29.91.56])
        by smtp.gmail.com with ESMTPSA id y133-20020a62ce8b000000b00565cbad9616sm770509pfg.6.2022.11.03.06.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 06:32:47 -0700 (PDT)
Date: Thu, 3 Nov 2022 22:32:38 +0900
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
Subject: Re: [PATCH 1/6] slab: Clean up SLOB vs kmalloc() definition
Message-ID: <Y2PC9tz6OyU8yYtu@hyeyoo>
References: <20221101222520.never.109-kees@kernel.org>
 <20221101223321.1326815-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101223321.1326815-1-keescook@chromium.org>

On Tue, Nov 01, 2022 at 03:33:09PM -0700, Kees Cook wrote:
> As already done for kmalloc_node(), clean up the #ifdef usage in the
> definition of kmalloc() so that the SLOB-only version is an entirely
> separate and much more readable function.
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
>  include/linux/slab.h | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/slab.h b/include/linux/slab.h
> index 90877fcde70b..e08fe7978b5c 100644
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -559,15 +559,15 @@ void *kmalloc_large_node(size_t size, gfp_t flags, int node) __assume_page_align
>   *	Try really hard to succeed the allocation but fail
>   *	eventually.
>   */
> +#ifndef CONFIG_SLOB
>  static __always_inline __alloc_size(1) void *kmalloc(size_t size, gfp_t flags)
>  {
>  	if (__builtin_constant_p(size)) {
> -#ifndef CONFIG_SLOB
>  		unsigned int index;
> -#endif
> +
>  		if (size > KMALLOC_MAX_CACHE_SIZE)
>  			return kmalloc_large(size, flags);
> -#ifndef CONFIG_SLOB
> +
>  		index = kmalloc_index(size);
>  
>  		if (!index)
> @@ -576,10 +576,18 @@ static __always_inline __alloc_size(1) void *kmalloc(size_t size, gfp_t flags)
>  		return kmalloc_trace(
>  				kmalloc_caches[kmalloc_type(flags)][index],
>  				flags, size);
> -#endif
>  	}
>  	return __kmalloc(size, flags);
>  }
> +#else
> +static __always_inline __alloc_size(1) void *kmalloc(size_t size, gfp_t flags)
> +{
> +	if (__builtin_constant_p(size) && size > KMALLOC_MAX_CACHE_SIZE)
> +		return kmalloc_large(size, flags);
> +
> +	return __kmalloc(size, flags);
> +}
> +#endif
>  
>  #ifndef CONFIG_SLOB
>  static __always_inline __alloc_size(1) void *kmalloc_node(size_t size, gfp_t flags, int node)
> -- 
> 2.34.1

Looks good to me.

Reviewed-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>

-- 
Thanks,
Hyeonggon
