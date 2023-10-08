Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E899E11708
	for <llvm@lists.linux.dev>; Sun,  8 Oct 2023 21:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QAHvEApt"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-68fb85afef4so2839021b3a.1
        for <llvm@lists.linux.dev>; Sun, 08 Oct 2023 14:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696799113; x=1697403913; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6gxm93K6GGWMbjUtGXp1BZmgoqSMt/fikbA5J3YWvlU=;
        b=QAHvEApt54rHtAkZq5Ib15Kq5ji5/KRXt+o+XLGecdJUD/8B8Z8xzJU20yksKeErzw
         FP1qdgYEu2fDZNuxAve7zVaoHfkVfRYb4m3Xn9E0cBJYAoRynzF6aHOkeFrmlPZ2W1oh
         AQNtzs3wypoAlU1ZxLWXA2gAYcxK1eyMhxtjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696799113; x=1697403913;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gxm93K6GGWMbjUtGXp1BZmgoqSMt/fikbA5J3YWvlU=;
        b=ub3r/6p8HffalqQ+il/zSJmG0zFGFZJxyZ8EcmuAVX6Tn910q19g9T4tXYQVkoCLbH
         xTaYNNhjvc8Ioh5RNgY6iz2tyH2vzPV48Eo0L/vDJ6osZlwo8CHQrMDld0fSKxE6yUqs
         ZziNTcgxRo9aYJCsU39r3XOb7L47KU/7fjHnEq1NZGtvybbDAUXeEdqLgGFqhvK/hnHh
         czOgJwpnVLnhh/WoUMehawDiI6OdCC5U/GIiCjFOFgnGYv3i28ACONj6/EWuDqZWLu5H
         +wWsgekmmKx0BhzAtMaDYTSHBgB6gZtg7v9K7dv8Sj+qHSkZrF0zGUBu8IuceeuxC7Pt
         Y5Vg==
X-Gm-Message-State: AOJu0YzqutyNQ2VHErKn8hNJm6H0sRF1CDVVJnHdw127RC5hQ1QmomWY
	tzARAiiVWDTPsUwQhLMp83QtPg==
X-Google-Smtp-Source: AGHT+IHXtwJV5QiOwEV9BS5g5BayCndoQLHqktCHa0OWTprxahWUvy7m6rsAL0Es1eBJ85IRithi+g==
X-Received: by 2002:a05:6a00:1d89:b0:68f:c6f8:144a with SMTP id z9-20020a056a001d8900b0068fc6f8144amr10953293pfw.22.1696799113111;
        Sun, 08 Oct 2023 14:05:13 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id e9-20020aa78249000000b006934390d0c5sm5078353pfn.175.2023.10.08.14.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 14:05:12 -0700 (PDT)
Date: Sun, 8 Oct 2023 14:05:10 -0700
From: Kees Cook <keescook@chromium.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: gustavoars@kernel.org, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 2/2] dmaengine: pxa_dma: Annotate struct pxad_desc_sw
 with __counted_by
Message-ID: <202310081404.382AE20@keescook>
References: <c8fc5563c9593c914fde41f0f7d1489a21b45a9a.1696676782.git.christophe.jaillet@wanadoo.fr>
 <1c9ef22826f449a3756bb13a83494e9fe3e0be8b.1696676782.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c9ef22826f449a3756bb13a83494e9fe3e0be8b.1696676782.git.christophe.jaillet@wanadoo.fr>

On Sat, Oct 07, 2023 at 01:13:10PM +0200, Christophe JAILLET wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> To do so, the code needs a little shuffling related to how hw_desc is used
> and nb_desc incremented.
> 
> The one by one increment is needed for the error handling path, calling
> pxad_free_desc(), to work correctly.
> 
> So, add a new intermediate variable, desc, to store the result of the
> dma_pool_alloc() call.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks! Yeah, this looks like a sensible refactor to handle the
increment before array assignment without losing error checking.

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
> This patch is part of a work done in parallel of what is currently worked
> on by Kees Cook.
> 
> My patches are only related to corner cases that do NOT match the
> semantic of his Coccinelle script[1].
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> ---
>  drivers/dma/pxa_dma.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/dma/pxa_dma.c b/drivers/dma/pxa_dma.c
> index 94cef2905940..c6e2862896e3 100644
> --- a/drivers/dma/pxa_dma.c
> +++ b/drivers/dma/pxa_dma.c
> @@ -91,7 +91,8 @@ struct pxad_desc_sw {
>  	bool			cyclic;
>  	struct dma_pool		*desc_pool;	/* Channel's used allocator */
>  
> -	struct pxad_desc_hw	*hw_desc[];	/* DMA coherent descriptors */
> +	struct pxad_desc_hw	*hw_desc[] __counted_by(nb_desc);
> +						/* DMA coherent descriptors */
>  };
>  
>  struct pxad_phy {
> @@ -739,6 +740,7 @@ pxad_alloc_desc(struct pxad_chan *chan, unsigned int nb_hw_desc)
>  {
>  	struct pxad_desc_sw *sw_desc;
>  	dma_addr_t dma;
> +	void *desc;
>  	int i;
>  
>  	sw_desc = kzalloc(struct_size(sw_desc, hw_desc, nb_hw_desc),
> @@ -748,20 +750,21 @@ pxad_alloc_desc(struct pxad_chan *chan, unsigned int nb_hw_desc)
>  	sw_desc->desc_pool = chan->desc_pool;
>  
>  	for (i = 0; i < nb_hw_desc; i++) {
> -		sw_desc->hw_desc[i] = dma_pool_alloc(sw_desc->desc_pool,
> -						     GFP_NOWAIT, &dma);
> -		if (!sw_desc->hw_desc[i]) {
> +		desc = dma_pool_alloc(sw_desc->desc_pool, GFP_NOWAIT, &dma);
> +		if (!desc) {
>  			dev_err(&chan->vc.chan.dev->device,
>  				"%s(): Couldn't allocate the %dth hw_desc from dma_pool %p\n",
>  				__func__, i, sw_desc->desc_pool);
>  			goto err;
>  		}
>  
> +		sw_desc->nb_desc++;
> +		sw_desc->hw_desc[i] = desc;
> +
>  		if (i == 0)
>  			sw_desc->first = dma;
>  		else
>  			sw_desc->hw_desc[i - 1]->ddadr = dma;
> -		sw_desc->nb_desc++;
>  	}
>  
>  	return sw_desc;
> -- 
> 2.34.1
> 

-- 
Kees Cook
