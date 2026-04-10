Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CE8345CCE
	for <llvm@lists.linux.dev>; Fri, 10 Apr 2026 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775814677; cv=none; b=aVtveRGhkxhpx595/qa4UJYMwslvLQfV3y3U5gZ/R00BZFiLLbNc3wMHU9O08WxgehRu4pneMlCqVGrm2jZghnLj4HgFY8V3iUgI1JXn9bs3v0PbGgO6M54OMnhf4UbSsF9BK9edLocEIuDo0BsIzhzdVxQvs0J2oosSsueu28Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775814677; c=relaxed/simple;
	bh=2SwEKP0JRIcUT9VZfJQVDXhGVxwFzyl3yI/jYziHn3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jirBaqE/J5xq9wHFmD17b7LP2jFy14nXrQRDJHsMvtVLPcEITx5Ke2Kae7r+Wfu/rGeJYOJ0v6ZG6DPsLHxEvUNo4kDaNJIpUOBQyUWlZs0T9FNLW+AohYD/FpjTCBEy4snHlZZ5UQV3//bQ8VeUOxBhqHEAPxRpkF3I2oBqwtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=EaWRdwuk; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="EaWRdwuk"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=9YC5+Ls1swOHaWJ8ErNBeIulZ4tAA8sac7Dx5bn0SAs=;
	b=EaWRdwukgWLF/ovt/GfYhXVnX9klWxHa038NdZau8kzA8ZAxqerDxQ/8SzCc4u9aMJzey1Qda
	2QXPpIswZbgspzkY/KgFpFHgDMv6EjcsNxAlP7CrMxlJJ1/+LSZc44wpRWJiouLTv9OUnyRr2Hi
	NNMJD569jlD1cmiZFSW0wiw=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4fsX2q2BcwzLlVQ;
	Fri, 10 Apr 2026 17:44:51 +0800 (CST)
Received: from kwepemk100018.china.huawei.com (unknown [7.202.194.66])
	by mail.maildlp.com (Postfix) with ESMTPS id C8C3C40565;
	Fri, 10 Apr 2026 17:51:05 +0800 (CST)
Received: from [10.67.108.67] (10.67.108.67) by kwepemk100018.china.huawei.com
 (7.202.194.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Fri, 10 Apr
 2026 17:51:04 +0800
Message-ID: <69a902f1-3793-4c71-ac3c-27f8cd5eeef8@huawei.com>
Date: Fri, 10 Apr 2026 17:50:59 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] slab: support for compiler-assisted type-based slab
 cache partitioning
To: Marco Elver <elver@google.com>, Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
CC: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter
	<cl@gentwo.org>, Harry Yoo <harry.yoo@oracle.com>, Hao Li <hao.li@linux.dev>,
	David Rientjes <rientjes@google.com>, Roman Gushchin
	<roman.gushchin@linux.dev>, Kees Cook <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo
 Stoakes <ljs@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, Mike
 Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal
 Hocko <mhocko@suse.com>, Alexander Potapenko <glider@google.com>, Dmitry
 Vyukov <dvyukov@google.com>, Nick Desaulniers
	<nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin
 Stitt <justinstitt@google.com>, <linux-kbuild@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
	<linux-hardening@vger.kernel.org>, <kasan-dev@googlegroups.com>,
	<llvm@lists.linux.dev>, Andrey Konovalov <andreyknvl@gmail.com>, Florent
 Revest <revest@google.com>, Jann Horn <jannh@google.com>, KP Singh
	<kpsingh@kernel.org>, Matteo Rizzo <matteorizzo@google.com>
References: <20260331111240.153913-1-elver@google.com>
Content-Language: en-US
From: GONG Ruiqi <gongruiqi1@huawei.com>
In-Reply-To: <20260331111240.153913-1-elver@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk100018.china.huawei.com (7.202.194.66)


On 3/31/2026 7:12 PM, Marco Elver wrote:
> ...
> @@ -662,9 +662,20 @@ extern kmem_buckets kmalloc_caches[NR_KMALLOC_TYPES];
>  	(IS_ENABLED(CONFIG_ZONE_DMA)   ? __GFP_DMA : 0) |	\
>  	(IS_ENABLED(CONFIG_MEMCG) ? __GFP_ACCOUNT : 0))
>  
> +#ifdef CONFIG_RANDOM_KMALLOC_CACHES
>  extern unsigned long random_kmalloc_seed;
> +typedef struct { unsigned long ip; } kmalloc_token_t;
> +#define __kmalloc_token(...) ((kmalloc_token_t) { .ip = _RET_IP_ })
> +#elif defined(CONFIG_TYPED_KMALLOC_CACHES)
> +typedef struct { unsigned long v; } kmalloc_token_t;
> +#define __kmalloc_token(...) ((kmalloc_token_t){ .v = __builtin_infer_alloc_token(__VA_ARGS__) })

One tiny suggestion: we could use the same name for kmalloc_token_t's
member in both cases, which would make the code a bit more concise.

Acked-by: GONG Ruiqi <gongruiqi1@huawei.com>

> +#else
> +/* no-op */
> +typedef struct {} kmalloc_token_t;
> +#define __kmalloc_token(...) ((kmalloc_token_t){})
> +#endif
>  
> -static __always_inline enum kmalloc_cache_type kmalloc_type(gfp_t flags, unsigned long caller)
> +static __always_inline enum kmalloc_cache_type kmalloc_type(gfp_t flags, kmalloc_token_t token)
>  {
>  	/*
>  	 * The most common case is KMALLOC_NORMAL, so test for it
> @@ -672,9 +683,11 @@ static __always_inline enum kmalloc_cache_type kmalloc_type(gfp_t flags, unsigne
>  	 */
>  	if (likely((flags & KMALLOC_NOT_NORMAL_BITS) == 0))
>  #ifdef CONFIG_RANDOM_KMALLOC_CACHES
> -		/* RANDOM_KMALLOC_CACHES_NR (=15) copies + the KMALLOC_NORMAL */
> -		return KMALLOC_RANDOM_START + hash_64(caller ^ random_kmalloc_seed,
> -						      ilog2(RANDOM_KMALLOC_CACHES_NR + 1));
> +		/* PARTITION_KMALLOC_CACHES_NR (=15) copies + the KMALLOC_NORMAL */
> +		return KMALLOC_PARTITION_START + hash_64(token.ip ^ random_kmalloc_seed,
> +							 ilog2(PARTITION_KMALLOC_CACHES_NR + 1));
> +#elif defined(CONFIG_TYPED_KMALLOC_CACHES)
> +		return KMALLOC_PARTITION_START + token.v;
>  #else
>  		return KMALLOC_NORMAL;
>  #endif
> ...
