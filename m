Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55043D9DD9
	for <llvm@lists.linux.dev>; Mon,  4 May 2026 21:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777929789; cv=none; b=T26W1lHw6eKiIXHbneArmHxdGdKcOpDm4KdBSS4O3gDQXpbPFikRdUQsj1rOt0Ngi1ueLJIdd2OLbhfyca9S00SGy4Tozffxas0P6wmJoN9RDazgO5KKa/RK49JJhuD8Ly86FONKfT1I6W3Tew8ifHgPMNFTwZ8qcpFmwrgmaeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777929789; c=relaxed/simple;
	bh=KZ9hGIdTsGnZ8NOGTupuIQLH8lJmHaX97JFhAZBXiOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LIxQiFUUTFDsYI4rr69lRwITKViu14SFk8kZsilykuazLy94CKKAInJTklc3vjVGmpRGKzv6ekz3qD3yRvPPSwMELFULE6r5c6JTwZgASGJoIE7f+eB09Bs99fZguUqwPDXPxNRuZpJ6o4qPQPZvH1aw8IAvAiMTZB6D38QcRcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SQxHs2GF; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SQxHs2GF"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so43636035e9.2
        for <llvm@lists.linux.dev>; Mon, 04 May 2026 14:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777929785; x=1778534585; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=igyU2nx2iftItHLeQpILR+qCdofiKDiQQ2B3kQIIdT0=;
        b=SQxHs2GFA8bIHYu6COk9P84apWyLImLcWOBd+1J4VJkFNYB3AlsRnKr3m5FIBr0fel
         zwJbHEBnR3MoRJGDD46e5CYPALIjQe3sGAhKr3E3SSnj4anZ+n1gzED3isoy7xLsvwi7
         RiOkR0bQYp3nVUQJzM1sYrQx6w0AHKl7AS0+xPWe+TmFzbuWOlxbYqkfP6zoP2hbH80i
         8FzzXE5XiePJ8OsIlDxBRXsK/I81WqLn14Xhiay75JfXR7EKvpy3lonenZ0DmK8ZtYLH
         FEm1haVqZ0vV1LN28IPbpqza1oZdFeovbBv88FhQWXpp7rWWEwsPX9YP5WX6pmhDRy7y
         4s0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777929785; x=1778534585;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=igyU2nx2iftItHLeQpILR+qCdofiKDiQQ2B3kQIIdT0=;
        b=Qw7pC78nM9gVbP/rOKjlqdE43M0bAvWbBgD/75WqLY2cBczS6PviT6UfWfNqtbAw4R
         7lvQAmXjc32PR7htvrBALa/PPEVsqPTlLT6iW58ABsC7bzUEoUuqwDnwIsewrLcqeC5s
         gey7JlfjqFVJs0TC7U4oDqgvVOeXbkHASuM8FY5kQm6xFzHC+UaKFHyUBmqm5DwG778N
         KJ8eojKbVlZYkAAOrJfK5wtDrv5JhzJptILI6YZCZA9fCQcXCppZrSsakqyIjoqp7s4B
         +MHSA+EUGfLjFa+SsLafip2elZypgvGmRCYOR2H4n2pkZ+H2uCpFYnW5Dx0+TR1zqXzr
         KKug==
X-Forwarded-Encrypted: i=1; AFNElJ+6pMrVgWKPU8zpM1pJRTUvGMti4X4ZYXqZQ2pDRt6e+fNJEa/z5zFOjabqvrD2qP57m+yV@lists.linux.dev
X-Gm-Message-State: AOJu0YwFoEOZXOlRRxWHbAh4xFfiJo6KQe3MNcem0v5hY8ElNe5lXD39
	bgFbY3XNwrbdW6nFBZbM8TWTHC02FYKmtlC0iJRO56CImdrZsrLvZJrijVf0Hqgz1A==
X-Gm-Gg: AeBDietrRmfW97KsXSYWHSZO3YvBhCHS+EssHeW1IANL+W06AqQA0wLg/a8qt/1cyLt
	EX59WTWWK+MkPh8CVsC5L/7uk2Zu5uDwHQ9VirOH9O243FyOEVoCU9LdfUYqTIKN1XS2kwoXnnc
	JWlsrEXxWMOyzbXVGq8Kvmb3iYcQhWweXMSRGWa2GfXkxORTPtnj1ERguYV8EthnxWrvkpYmhWx
	2pb+obDedCLyprFrrYGHLBykBtw0TnS1XoYEOrUAk/NO1kHu6QBhqKPxZQhhqq/9JTmwlLspmTm
	YYojCRz4yjt5wvKkrbHrfMA1HM6HyFFJJpo9VWZ/rKKzUpQSIzaxE0g/Vx7k5g/2YBpskk3ixRe
	zJZ7eLHo+1PPpR7NmHfzRqysqwSQvnF5KEjIl/opkQ9X8fUD3CdtOV/V5H0xi2/XWanu+Uc5JLv
	euTmARAFDFiib5PXwIyQ7h43nEXDpPG5wNSZI3jyEO+efN9GV9n+wYbxaLaiiej1p4KJ5fJ3zQK
	z8xlZwRcw==
X-Received: by 2002:a05:600c:a30a:b0:489:1a3a:9e45 with SMTP id 5b1f17b1804b1-48d18cea8damr2194915e9.26.1777929784562;
        Mon, 04 May 2026 14:23:04 -0700 (PDT)
Received: from elver.google.com ([2a00:79e0:2834:9:fba5:1281:871d:3fd6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb694fcsm323128615e9.3.2026.05.04.14.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 14:23:03 -0700 (PDT)
Date: Mon, 4 May 2026 23:22:56 +0200
From: Marco Elver <elver@google.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
	Harry Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, kasan-dev@googlegroups.com,
	llvm@lists.linux.dev, Andrey Konovalov <andreyknvl@gmail.com>,
	Florent Revest <revest@google.com>, Jann Horn <jannh@google.com>,
	KP Singh <kpsingh@kernel.org>,
	Matteo Rizzo <matteorizzo@google.com>,
	GONG Ruiqi <gongruiqi1@huawei.com>
Subject: Re: [PATCH v3 1/2] slab: support for compiler-assisted type-based
 slab cache partitioning
Message-ID: <afkOMIPu1WNFE9MS@elver.google.com>
References: <20260424132427.2703076-1-elver@google.com>
 <6f2bd63a-dc02-4631-a3a5-7ec8e58a4a4e@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f2bd63a-dc02-4631-a3a5-7ec8e58a4a4e@kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)

On Thu, Apr 30, 2026 at 03:03PM +0200, Vlastimil Babka (SUSE) wrote:
> On 4/24/26 15:24, Marco Elver wrote:
> 
> > @@ -938,7 +968,7 @@ void *__kmalloc_large_node_noprof(size_t size, gfp_t flags, int node)
> >   *	Try really hard to succeed the allocation but fail
> >   *	eventually.
> >   */
> > -static __always_inline __alloc_size(1) void *kmalloc_noprof(size_t size, gfp_t flags)
> > +static __always_inline __alloc_size(1) void *_kmalloc_noprof(size_t size, gfp_t flags, kmalloc_token_t token)
> >  {
> >  	if (__builtin_constant_p(size) && size) {
> >  		unsigned int index;
> > @@ -948,14 +978,16 @@ static __always_inline __alloc_size(1) void *kmalloc_noprof(size_t size, gfp_t f
> >  
> >  		index = kmalloc_index(size);
> >  		return __kmalloc_cache_noprof(
> > -				kmalloc_caches[kmalloc_type(flags, _RET_IP_)][index],
> > +				kmalloc_caches[kmalloc_type(flags, token)][index],
> 
> While reviewing this, it occured to me we might have been using _RET_IP_
> here in a suboptimal way ever since this was introduced. Since this is all
> inlined, shouldn't have we been using _THIS_IP_ to really randomize using
> the kmalloc() callsite, and not its parent?
> 
> And after this patch, we get the token passed to _kmalloc_noprof()...
> 
> >  				flags, size);
> >  	}
> > -	return __kmalloc_noprof(size, flags);
> > +	return __kmalloc_noprof(PASS_KMALLOC_PARAMS(size, NULL, token), flags);
> 
> ... and used also here for the non-constant-size, where previously
> __kmalloc_noprof() (not inline function) would correctly use _RET_IP_ on its
> own ...
> 
> >  }
> > +#define kmalloc_noprof(...)			_kmalloc_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
> 
> ... and the token comes from here. With random partitioning that's
> #define __kmalloc_token(...) ((kmalloc_token_t){ .v = _RET_IP_ })
> 
> so that AFAIK makes the situation worse as now the cases without constant
> size also start randomizing by the parent callsite and not the kmalloc callsite.
> 
> But there are many users of __kmalloc_token() and maybe some are corrent in
> using _RET_IP_, I haven't checked, maybe we'll need two variants, or further
> change things around.

Good catch. I don't think we need multiple variants (otherwise the TYPED
variant would be broken) - we're moving token generation to the callers
(not even inlined anymore) with all this macro magic.

I think this is all we need:

--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -503,7 +503,7 @@ int kmem_cache_shrink(struct kmem_cache *s);
 typedef struct { unsigned long v; } kmalloc_token_t;
 #ifdef CONFIG_KMALLOC_PARTITION_RANDOM
 extern unsigned long random_kmalloc_seed;
-#define __kmalloc_token(...) ((kmalloc_token_t){ .v = _RET_IP_ })
+#define __kmalloc_token(...) ((kmalloc_token_t){ .v = _THIS_IP_ })
 #elif defined(CONFIG_KMALLOC_PARTITION_TYPED)
 #define __kmalloc_token(...) ((kmalloc_token_t){ .v = __builtin_infer_alloc_token(__VA_ARGS__) })
 #endif

Plus a paragraph in the commit message.  Let me add that.
