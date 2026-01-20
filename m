Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DD630BB80
	for <llvm@lists.linux.dev>; Tue, 20 Jan 2026 15:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768923586; cv=none; b=GcKL85KDdCTEKBAaWM/3eyM3WMJcl/MwSJ4DiBQOk+E6DvsV2n4ods3Piax0o2TfcrPyOuDbkX4vQJUjQHoe1zT3PVEu5+4RVu2coXOAZTdue/+k88bxzha6RuHM7g1xbQ/KF+EMr+FdxmkrZpX4iYwqRLA2FG9FONeNTNJiI3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768923586; c=relaxed/simple;
	bh=V40aj+iEcKhkrs1YNrs2AN6U2XZeqfJ35ZGRQdMdvNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cciChuwCMs+Wu83ffZXq2gckcYc4nA3ijy6gmtavD1xR0qK2HMTbs4kNgzZ0rP+WOXjHzByAf85mX3cq63k9wusLzCegDDtkrfqOIvpz4j5FZQa9nbwG39EvQpTahxLDQBnhLkGTfoUunJuGLpeMOtKxu13PCHAoNsY+1nKBzmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SoJ3oqHR; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SoJ3oqHR"
Date: Tue, 20 Jan 2026 23:39:19 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768923582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=urvg/XtaZlBbzcQcq8EiqAuOpFhl6Pv+GSbmq2DJdbA=;
	b=SoJ3oqHRsMJsnydigqOEf56Ym9ympNUfN6BX0yHAWE/3VWNWtkvE0OtshjQfgYdtr5SwSe
	miqp6VjWjBsnqxZyrlUwbBi602tlImge9bMaNseMkf0S6oL8i9gb6aM5dbK0h+T+MbZ1sh
	j+oW7QrWCgKlfEkXNQ54Y8vQYS3RQs8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Hao Li <hao.li@linux.dev>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Harry Yoo <harry.yoo@oracle.com>, Eric Dumazet <edumazet@google.com>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH] slab: replace cache_from_obj() with inline checks
Message-ID: <obrup5ejxuy42fpwmzczvo5ubyv62tocoqooqpxg3u5eq2i2sg@qpcialjznogf>
References: <20260120-b4-remove_cache_from_obj-v1-1-ace30c41eecf@suse.cz>
 <imazcyfzfkxofsnriyp5wa5v6yzszozljircucw2tgj6zex2ee@ytew6wy4kkh6>
 <8bd3c3e8-9865-4467-86d5-17d891f6f21b@suse.cz>
 <vyhpr6lq5rb6qgkshksg26a5ns5gd5ryqu46pqx2z5twy2gzlx@t4xaze2lhoen>
 <efd02f1f-b09b-4786-aa55-aa366f58442f@suse.cz>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efd02f1f-b09b-4786-aa55-aa366f58442f@suse.cz>
X-Migadu-Flow: FLOW_OUT

On Tue, Jan 20, 2026 at 03:01:23PM +0100, Vlastimil Babka wrote:
> On 1/20/26 14:56, Hao Li wrote:
> > On Tue, Jan 20, 2026 at 01:55:09PM +0100, Vlastimil Babka wrote:
> >> On 1/20/26 12:57, Hao Li wrote:
> >> 
> >> >> @@ -6774,11 +6770,21 @@ static inline struct kmem_cache *cache_from_obj(struct kmem_cache *s, void *x)
> >> >>   */
> >> >>  void kmem_cache_free(struct kmem_cache *s, void *x)
> >> >>  {
> >> >> -	s = cache_from_obj(s, x);
> >> >> -	if (!s)
> >> >> -		return;
> >> >> +	struct slab *slab;
> >> >> +
> >> >> +	slab = virt_to_slab(x);
> >> >> +
> >> >> +	if (IS_ENABLED(CONFIG_SLAB_FREELIST_HARDENED) ||
> >> >> +	    kmem_cache_debug_flags(s, SLAB_CONSISTENCY_CHECKS)) {
> >> >> +
> >> >> +		if (unlikely(!slab || (slab->slab_cache != s))) {
> >> >> +			warn_free_bad_obj(s, x);
> >> > 
> >> > Just to make sure I'm understanding correctly, are we intentionally not
> >> > releasing the object x in this case? Thanks.
> >> 
> >> Yes, it means something went wrong so it's better not to do anything.
> > 
> > Got it, that makes sense - thanks!
> > 
> >> That was true before this patch as well.
> > 
> > I'm still not entirely sure I follow. I read the original code, and it seems
> > like it retrieved the real cache from the object and released the object into
> > that correct cache. Did I misunderstand something?
> 
> You're right, I misread it as returning NULL, but that was only on
> virt_to_slab() failure. So that's a change, but I believe a proper one.

Yes, I agree - the current handling looks good to me.

> But I'll mention it in the changelog and the comment. Thanks!

Sounds great, thanks for taking care of that.

Reviewed-by: Hao Li <hao.li@linux.dev>

-- 
Thanks,
Hao
