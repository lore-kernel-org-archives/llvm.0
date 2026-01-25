Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E837817B505
	for <llvm@lists.linux.dev>; Sun, 25 Jan 2026 00:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769300667; cv=none; b=KjIBTeE6EZiftU2UVbNl7Y+AXrMMwgfRPMLUNATRNxLM65l2f3jWmC6dhNjqeCC2oh+rnDzChLba7r05G0UaALjhvkCtHMLZjboiq0J3roavodUiJH2OHVX2YJl9zgnqQ0HPcAIn8F9HhEWimTvhXnhU1hf980dkpuzsQYiNt9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769300667; c=relaxed/simple;
	bh=gzeRpzPJRPPZnxRAg0UXA9IpOe5LB3iZkbOzMdjBeCI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=K6+DLYo3jpGpSKcaRpT7IaeAQTcJPUwXFsDT/y0JZhQPYDQA3G1OwVL7Exur9fXfKy0oH4iO3RR8sSAFdXKCxmMSbKK/2bxo/stdVVhFjlmVHH5iyk3T7oqhuUGLRK/DQlswF9baHprOyoeJTsBRfZnA2nGx6g7Vev0bp4DmoRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NBhdHc54; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NBhdHc54"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a76b39587aso50095ad.0
        for <llvm@lists.linux.dev>; Sat, 24 Jan 2026 16:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769300665; x=1769905465; darn=lists.linux.dev;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IudDhyXqckiiU9bY+b5zRXy/CTYJjY9Rh3P/ajW/06k=;
        b=NBhdHc54erUBvOmX7ClEk85dicOAB7MeO1LHD1booK5pf45EYP1EhDd6PaTUVL0oDg
         rH0phkENZ1Ak+/hN6FV2AaIL6aod+NkufzC6Hyrxzok/3SAIkgWDuLucpM9pW6/wtO9a
         hHG/F5h6HTNmdhaOWvg+EM/Q3ZhVeUZbPpG0mAFkYyJqp9VV0UKuT54WNXePbs01BNfA
         HjffYf3YHYA/i7DUICSTxFfHIFto3mWRYFwdlOQNKifJ6oDIx6laFdJrLVIsMCKPxgkB
         +krJ7nq3LtQ8BaDwD7ZO5BNKLAaA0jX4j6/LOKwzE9CYrAnV3LjLfSvGTB7XRN6r0Epc
         DMfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769300665; x=1769905465;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IudDhyXqckiiU9bY+b5zRXy/CTYJjY9Rh3P/ajW/06k=;
        b=K44fTGn5AMxkfkM8M7hYzsqClrLeWCD3F1U4kBCIXb4j5+D2P7TkpUTWFrN/DFZtgK
         yCQaT/tXHOghArWjl9QdBojcvamxkz092fGxvB1KbvNIP1MxJjqwxFdN6Yydt5K0rEvd
         YeR7nw4Z3xMVa8RQNSCk8gD706bpfC8jXDpTnJiUf/EFLi3EMgthm419zKz1EbHk4gss
         XloHq/AsiBzQfE86ZwAexz/1hsJgfqytOIGqqaWBlp1EHn/L6qpAtAhVRoDqfFF9WyJa
         +JRImT1ueB7bKTpEeUk2Oq9Uq4G6Sg6UnTZmBqwbN062tY230iSyK15NwYw6Jo658pkM
         qu+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVcA1e8KdzTOl3ta8P+6O/ApIwISflX8qsuB4bCEa6tz7GnqPsBcVAG4EtVvIcscm6iHhSl@lists.linux.dev
X-Gm-Message-State: AOJu0YwhEoCDQh7t2eoGDoC3yXZk96Y/Jqc+/F0+pTQrTxeah9M2CUK0
	ISz01r4ZbtjL1fPPlqIQ/mXJsZobam/K89cefSOB8D+3+OH+uBYCOsSnBP/98CpVkO8HIk5tANO
	61OZwExfJ
X-Gm-Gg: AZuq6aKWYi4vB0o3T4Y4o67mxHRlzsPzJtxgL2bIj34gjz7WlFqGEzviF6YLHA6Qsbt
	vwVFvngR+mTIlZCukUyiYoDUQtr2UK/i9EudBjdyfP2t1XD2FdPP2N4/iuma7sipi6TEBVM+riP
	SkJ9lH8oUSyglK2DW8p8LcgB/9YYMdseL6Ydfn0uifg5WdmZWuoa5NijtvqLuIWiFWGkXjC7leC
	NCOVmqVWLHXzuGemnnhw/4IH0eFadB7/YgTCJ4SE7eDvWV20eIBGKgjc5l1AyKk/SquZTIYhgy4
	cRaCvIE2en7KehGTiVFCha50MCRLWFYyqWHN1+3CUim4d0BtRPRYl/mdTFsYQN2y0C6uTvsH6YK
	2Yzq5BpjjEFL73xPANetevsY46me8b1nfg4ZB94fqdSMWnvmUnJhN3OCN2vbYsupRkrQ6+BGnUr
	xOtg9B9+bkvGLj2gVDBTs5k/G5V3/xEBT+jaPp/jh+7SsSNTj+8JUOh+nRaLmFRydRu3UOArcse
	+0JYNvfwO9+hgD/fKeHdWWEX/SGEz7UWdLXTSFC6w==
X-Received: by 2002:a17:903:1aed:b0:294:ecba:c8e with SMTP id d9443c01a7336-2a8449f6bcamr142175ad.3.1769300664762;
        Sat, 24 Jan 2026 16:24:24 -0800 (PST)
Received: from [2a00:79e0:2eb0:8:817c:d8ee:c019:7966] ([2a00:79e0:2eb0:8:817c:d8ee:c019:7966])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fb03b4sm53766085ad.82.2026.01.24.16.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 16:24:24 -0800 (PST)
Date: Sat, 24 Jan 2026 16:24:23 -0800 (PST)
From: David Rientjes <rientjes@google.com>
To: Eric Dumazet <edumazet@google.com>
cc: Vlastimil Babka <vbabka@suse.cz>, Harry Yoo <harry.yoo@oracle.com>, 
    Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
    Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2] slab: replace cache_from_obj() with inline checks
In-Reply-To: <CANn89iJhz9RfpG62kW1XmL1=cTKvVN5kS-KM+TpzE-mPW4WhUQ@mail.gmail.com>
Message-ID: <3212f83f-960b-9a8c-2cb8-d617a201f094@google.com>
References: <20260121-b4-remove_cache_from_obj-v2-1-7213d36b89d5@suse.cz> <CANn89iJhz9RfpG62kW1XmL1=cTKvVN5kS-KM+TpzE-mPW4WhUQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 21 Jan 2026, Eric Dumazet wrote:

> > Eric Dumazet has noticed cache_from_obj() is not inlined with clang and
> > suggested splitting it into two functions, where the smaller inlined one
> > assumes the fastpath is !CONFIG_SLAB_FREELIST_HARDENED. However most
> > distros enable it these days and so this would likely add a function
> > call to the object free fastpaths.
> >
> > Instead take a step back and consider that cache_from_obj() is a relict
> > from when memcgs created their separate kmem_cache copies, as the
> > outdated comment in build_detached_freelist() reminds us.
> >
> > Meanwhile hardening/debugging had reused cache_from_obj() to validate
> > that the freed object really belongs to a slab from the cache we think
> > we are freeing from.
> >
> > In build_detached_freelist() simply remove this, because it did not
> > handle the NULL result from cache_from_obj() failure properly, nor
> > validate objects (for the NULL slab->slab_cache pointer) when called via
> > kfree_bulk(). If anyone is motivated to implement it properly, it should
> > be possible in a similar way to kmem_cache_free().
> >
> > In kmem_cache_free(), do the hardening/debugging checks directly so they
> > are inlined by definition and virt_to_slab(obj) is performed just once.
> > In case they failed, call a newly introduced warn_free_bad_obj() that
> > performs the warnings outside of the fastpath, and leak the object.
> >
> > As an intentional change, leak the object when slab->slab_cache differs
> > from the cache given to kmem_cache_free(). Previously we would only leak
> > when the object is not in a valid slab page or the slab->slab_cache
> > pointer is NULL, and otherwise trust the slab->slab_cache over the
> > kmem_cache_free() argument. But if those differ, it means something went
> > wrong enough that it's best not to continue freeing.
> >
> > As a result the fastpath should be inlined in all configs and the
> > warnings are moved away.
> >
> > Reported-by: Eric Dumazet <edumazet@google.com>
> > Closes: https://lore.kernel.org/all/20260115130642.3419324-1-edumazet@google.com/
> > Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
> > Reviewed-by: Hao Li <hao.li@linux.dev>
> > Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> 
> Acked-by: Eric Dumazet <edumazet@google.com>
> 

Tested-by: David Rientjes <rientjes@google.com>
