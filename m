Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719F1421EEB
	for <llvm@lists.linux.dev>; Tue, 20 Jan 2026 11:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768910259; cv=none; b=lWdICBO4oRHMQi+zRT33VHTQdf6CG/OEbAYXFW2IKqZEyoLlc3Pi+px0cOAnr5HOER2f/SoOsfT2kwdzwI2yd0cpkS0KbzN4MvjeoxTG7P0eqFqcMThe39Iu1QaTjT+LJwZIb0ERNZ6ZwUWwqoT+WBAfbTfPvO/gZjhuHZgZS/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768910259; c=relaxed/simple;
	bh=IGsY8sR5Ruag7BDuH0OXLmOku5rl1afK4wzdIZt7vwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rreZywIf6kAmzOct8S+LdUJhx9ac2iMfCe+BwPCbjQOG2jRxda3IL+tnlmN39TE1NskL3TyOZamEZ4W3KnZ66wCLyXTbH0DvlRu+rdUYlq2mVeyL7ZcrRH2Udedc85EdYq3TWPcQrCCQj0dDAs75f5kF2DlronPQkiBTyXXybHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rJ4VrhTy; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rJ4VrhTy"
Date: Tue, 20 Jan 2026 19:57:26 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768910255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HYEpCcCgyOkPKRRfQKMgVhYxxpRPIrOqb5axcNzE03I=;
	b=rJ4VrhTyQdhFkerciHCs4dOwK9+lY9C7TBgHlyFYs8jDjUXtO+FfCbZ3OKuoZ5ZpEN81wo
	jwdDHUZNY4AGhASTayKavNAEBTL4zkrJcH1/9r7+3ho1ZECOr0LQZ5kPav2OThdYhYKGQy
	voC9+uXPzq1YLOkFof5WavjYyk3wXRM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Hao Li <hao.li@linux.dev>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Harry Yoo <harry.yoo@oracle.com>, Eric Dumazet <edumazet@google.com>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH] slab: replace cache_from_obj() with inline checks
Message-ID: <imazcyfzfkxofsnriyp5wa5v6yzszozljircucw2tgj6zex2ee@ytew6wy4kkh6>
References: <20260120-b4-remove_cache_from_obj-v1-1-ace30c41eecf@suse.cz>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120-b4-remove_cache_from_obj-v1-1-ace30c41eecf@suse.cz>
X-Migadu-Flow: FLOW_OUT

On Tue, Jan 20, 2026 at 10:35:42AM +0100, Vlastimil Babka wrote:
> Eric Dumazet has noticed cache_from_obj() is not inlined with clang and
> suggested splitting it into two functions, where the smaller inlined one
> assumes the fastpath is !CONFIG_SLAB_FREELIST_HARDENED. However most
> distros enable it these days and so this would likely add a function
> call to the object free fastpaths.
> 
> Instead take a step back and consider that cache_from_obj() is a relict
> from when memcgs created their separate kmem_cache copies, as the
> outdated comment in build_detached_freelist() reminds us.
> 
> Meanwhile hardening/debugging had reused cache_from_obj() to validate
> that the freed object really belongs to a slab from the cache we think
> we are freeing from.
> 
> In build_detached_freelist() simply remove this, because it did not
> handle the NULL result from cache_from_obj() failure properly, nor
> validate objects (for the NULL slab->slab_cache pointer) when called via
> kfree_bulk(). If anyone is motivated to implement it properly, it should
> be possible in a similar way to kmem_cache_free().
> 
> In kmem_cache_free(), do the hardening/debugging checks directly so they
> are inlined by definition and virt_to_slab(obj) is performed just once.
> In case they failed, call a newly introduced warn_free_bad_obj() that
> performs the warnings outside of the fastpath.
> 
> As a result the fastpath should be inlined in all configs and the
> warnings are moved away.
> 
> Reported-by: Eric Dumazet <edumazet@google.com>
> Closes: https://lore.kernel.org/all/20260115130642.3419324-1-edumazet@google.com/
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> ---
>  mm/slub.c | 52 +++++++++++++++++++++++++++++-----------------------
>  1 file changed, 29 insertions(+), 23 deletions(-)
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index 861592ac5425..1bdb4f73d61b 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -6738,30 +6738,26 @@ void ___cache_free(struct kmem_cache *cache, void *x, unsigned long addr)
>  }
>  #endif
>  
> -static inline struct kmem_cache *virt_to_cache(const void *obj)
> +static noinline void warn_free_bad_obj(struct kmem_cache *s, void *obj)
>  {
> +	struct kmem_cache *cachep;
>  	struct slab *slab;
>  
>  	slab = virt_to_slab(obj);
> -	if (WARN_ONCE(!slab, "%s: Object is not a Slab page!\n", __func__))
> -		return NULL;
> -	return slab->slab_cache;
> -}
> -
> -static inline struct kmem_cache *cache_from_obj(struct kmem_cache *s, void *x)
> -{
> -	struct kmem_cache *cachep;
> +	if (WARN_ONCE(!slab,
> +			"kmem_cache_free(%s, %p): object is not in a slab page\n",
> +			s->name, obj))
> +		return;
>  
> -	if (!IS_ENABLED(CONFIG_SLAB_FREELIST_HARDENED) &&
> -	    !kmem_cache_debug_flags(s, SLAB_CONSISTENCY_CHECKS))
> -		return s;
> +	cachep = slab->slab_cache;
>  
> -	cachep = virt_to_cache(x);
> -	if (WARN(cachep && cachep != s,
> -		 "%s: Wrong slab cache. %s but object is from %s\n",
> -		 __func__, s->name, cachep->name))
> -		print_tracking(cachep, x);
> -	return cachep;
> +	if (WARN_ONCE(cachep != s,
> +			"kmem_cache_free(%s, %p): object belongs to different cache %s\n",
> +			s->name, obj, cachep ? cachep->name : "(NULL)")) {
> +		if (cachep)
> +			print_tracking(cachep, obj);
> +		return;
> +	}
>  }
>  
>  /**
> @@ -6774,11 +6770,21 @@ static inline struct kmem_cache *cache_from_obj(struct kmem_cache *s, void *x)
>   */
>  void kmem_cache_free(struct kmem_cache *s, void *x)
>  {
> -	s = cache_from_obj(s, x);
> -	if (!s)
> -		return;
> +	struct slab *slab;
> +
> +	slab = virt_to_slab(x);
> +
> +	if (IS_ENABLED(CONFIG_SLAB_FREELIST_HARDENED) ||
> +	    kmem_cache_debug_flags(s, SLAB_CONSISTENCY_CHECKS)) {
> +
> +		if (unlikely(!slab || (slab->slab_cache != s))) {
> +			warn_free_bad_obj(s, x);

Just to make sure I'm understanding correctly, are we intentionally not
releasing the object x in this case? Thanks.

> +			return;
> +		}
> +	}
> +
>  	trace_kmem_cache_free(_RET_IP_, x, s);
> -	slab_free(s, virt_to_slab(x), x, _RET_IP_);
> +	slab_free(s, slab, x, _RET_IP_);
>  }
>  EXPORT_SYMBOL(kmem_cache_free);
>  
> @@ -7305,7 +7311,7 @@ int build_detached_freelist(struct kmem_cache *s, size_t size,
>  		df->s = slab->slab_cache;
>  	} else {
>  		df->slab = slab;
> -		df->s = cache_from_obj(s, object); /* Support for memcg */
> +		df->s = s;
>  	}
>  
>  	/* Start new detached freelist */
> 
> ---
> base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
> change-id: 20260120-b4-remove_cache_from_obj-190fcaf16789
> 
> Best regards,
> -- 
> Vlastimil Babka <vbabka@suse.cz>
> 
