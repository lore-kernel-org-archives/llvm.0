Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838B43B8D69
	for <llvm@lists.linux.dev>; Tue, 20 Jan 2026 13:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768917448; cv=none; b=EcDRxSWnLQnTBQMMRWuP4JAcJPY/lERk7lLzR03876LlY0cwIjpK5B21kJe1gxK/4Gp0Kid4BrYp+ZuwQ9UeS4gn0+URMukLOPLRm0MB7r2/W9hhImFQm3kV1YsZDyPxkYlVX9pqOJN3iT2scGrhPoZix7JzyC15HozP4FZ7ppc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768917448; c=relaxed/simple;
	bh=Xo8qLFhLD7RZgI6o7gB7s6KkEEyxh92MZxcuCBFZmAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AH3XNSPdX0i/38876zEdPrFLq4mfHJo5FjTawdKjc9hRxQD4t16aXJfDQ+VU+SYFN0r53XujQBXe6VaH8qORFr0gv41Nxwnw9Vy0kqogcTWu+FhYWaTnZCt3zBrt0SvVSGfJ+pUjv2Ba1igzuRKr7oCpLWPMRn2ybHdlX4p4O4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=e6JHAzYT; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="e6JHAzYT"
Date: Tue, 20 Jan 2026 21:56:59 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768917441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3QpIyoYC+nMbp9UGDZ9Nxjg5u3kmtjxXbnx4WVI4Sas=;
	b=e6JHAzYTer8dwPRGR1RoD5wGWxmDjRMRSfZ1c9MzzHBJ7goTcJKS5Tu8Zn3JaZ81CklAVP
	oDfb1KooYntJajk4+sX6nG2gzYJXiLA1k+uhwVAtMqIiqFllSnsM0XAa1yJA413UF19O8Y
	AtcKzru917XR3HbX9bvZkO07qmFz3Rs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Hao Li <hao.li@linux.dev>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Harry Yoo <harry.yoo@oracle.com>, Eric Dumazet <edumazet@google.com>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH] slab: replace cache_from_obj() with inline checks
Message-ID: <vyhpr6lq5rb6qgkshksg26a5ns5gd5ryqu46pqx2z5twy2gzlx@t4xaze2lhoen>
References: <20260120-b4-remove_cache_from_obj-v1-1-ace30c41eecf@suse.cz>
 <imazcyfzfkxofsnriyp5wa5v6yzszozljircucw2tgj6zex2ee@ytew6wy4kkh6>
 <8bd3c3e8-9865-4467-86d5-17d891f6f21b@suse.cz>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bd3c3e8-9865-4467-86d5-17d891f6f21b@suse.cz>
X-Migadu-Flow: FLOW_OUT

On Tue, Jan 20, 2026 at 01:55:09PM +0100, Vlastimil Babka wrote:
> On 1/20/26 12:57, Hao Li wrote:
> 
> >> @@ -6774,11 +6770,21 @@ static inline struct kmem_cache *cache_from_obj(struct kmem_cache *s, void *x)
> >>   */
> >>  void kmem_cache_free(struct kmem_cache *s, void *x)
> >>  {
> >> -	s = cache_from_obj(s, x);
> >> -	if (!s)
> >> -		return;
> >> +	struct slab *slab;
> >> +
> >> +	slab = virt_to_slab(x);
> >> +
> >> +	if (IS_ENABLED(CONFIG_SLAB_FREELIST_HARDENED) ||
> >> +	    kmem_cache_debug_flags(s, SLAB_CONSISTENCY_CHECKS)) {
> >> +
> >> +		if (unlikely(!slab || (slab->slab_cache != s))) {
> >> +			warn_free_bad_obj(s, x);
> > 
> > Just to make sure I'm understanding correctly, are we intentionally not
> > releasing the object x in this case? Thanks.
> 
> Yes, it means something went wrong so it's better not to do anything.

Got it, that makes sense - thanks!

> That was true before this patch as well.

I'm still not entirely sure I follow. I read the original code, and it seems
like it retrieved the real cache from the object and released the object into
that correct cache. Did I misunderstand something?

-- 
Thanks,
Hao

> 
> >> +			return;
> >> +		}
> >> +	}
> >> +
> >>  	trace_kmem_cache_free(_RET_IP_, x, s);
> >> -	slab_free(s, virt_to_slab(x), x, _RET_IP_);
> >> +	slab_free(s, slab, x, _RET_IP_);
> >>  }
> >>  EXPORT_SYMBOL(kmem_cache_free);
> >>  
> >> @@ -7305,7 +7311,7 @@ int build_detached_freelist(struct kmem_cache *s, size_t size,
> >>  		df->s = slab->slab_cache;
> >>  	} else {
> >>  		df->slab = slab;
> >> -		df->s = cache_from_obj(s, object); /* Support for memcg */
> >> +		df->s = s;
> >>  	}
> >>  
> >>  	/* Start new detached freelist */
> >> 
> >> ---
> >> base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
> >> change-id: 20260120-b4-remove_cache_from_obj-190fcaf16789
> >> 
> >> Best regards,
> >> -- 
> >> Vlastimil Babka <vbabka@suse.cz>
> >> 
> 
