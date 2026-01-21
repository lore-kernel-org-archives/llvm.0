Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759153B9607;
	Wed, 21 Jan 2026 18:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769021966; cv=none; b=cw8TZHGOjmDH8yNh/qnoOSiyqsvQwEM/Y6tDbVWe/+mTK+LjLeSiYa8QzEvUpePkS2Jgf3LIVjO7uSbJQ6KGbb85L+ueBQmeFh++CqpOxWqlS0kqmqZJKEWMlcJresy1D3Zgh6XlHMdXBMDwVuYCmoiHhN7ro50Wp35HYUFqzJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769021966; c=relaxed/simple;
	bh=WggphCWM2+nKHZQpiCqL4AS54on/Qz3L8VaEuTZqQao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ISkEJw3IoRgrR+Ci2Mx0i+9yKRsWWJhl31KuGzB9t6u7hURe7FmrVNCvxlFw93yknheR7aHjTOELbkkj7oCVZaeT08ln52YLdxWxdTw2LYjJXhIvT/oPdkVeZik+0UzuNp138JeqBfXgh7FMiPdM7mtPOdCOmG7j9QRwJV/TdQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gUyKgjv2; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gUyKgjv2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Ig6O6XEXri+jR/0y1GO4IclDDRHlhdy3qawyKYfPv+A=; b=gUyKgjv2Ynyu9f9m1MwSkbeGZo
	mRXbk+ViG/WL4U1KHx/p8Mu67gVZua146Lt+/suU3SzfEzeM75m4FHlDUiBhCw/HKqCBEU+O2i/D9
	4eoVQi/i2cvsp0oTST9bDxuBHvL7IJKc4N/dvC8SdaOgl91sZ8kQAk9dGIoSfqyVrab6MN/yNyjFc
	rEOV2Y2zPyWSg/qqdLai3c8oCK5jQE1lxDS0hgWOitdUny49MbnERHHNq8IqQw52+UmBs/lDvfm46
	ABGK8CLUPOmPDuqZnlJTpZDpdtvNmCNU7WjQxrNyS4jI9TNL16ahq22ZS/cK7iihI/uXVz6V4eIWw
	S4Ffmj3w==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vidQB-0000000Gkg0-0hRW;
	Wed, 21 Jan 2026 18:59:15 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 05C1C3003C4; Wed, 21 Jan 2026 19:59:14 +0100 (CET)
Date: Wed, 21 Jan 2026 19:59:13 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: elver@google.com, linux-kernel@vger.kernel.org, bigeasy@linutronix.de,
	mingo@kernel.org, tglx@linutronix.de, will@kernel.org,
	boqun.feng@gmail.com, longman@redhat.com, hch@lst.de,
	rostedt@goodmis.org, llvm@lists.linux.dev
Subject: Re: [RFC][PATCH 2/4] locking/mutex: Add context analysis
Message-ID: <20260121185913.GJ166857@noisy.programming.kicks-ass.net>
References: <20260121110704.221498346@infradead.org>
 <20260121111213.745353747@infradead.org>
 <2bd8f6cd-463c-45cf-80b3-5b9d123afb61@acm.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bd8f6cd-463c-45cf-80b3-5b9d123afb61@acm.org>

On Wed, Jan 21, 2026 at 09:11:53AM -0800, Bart Van Assche wrote:
> On 1/21/26 3:07 AM, Peter Zijlstra wrote:
> > @@ -565,6 +574,8 @@ EXPORT_SYMBOL(mutex_unlock);
> >    * of a unlocked mutex is not allowed.
> >    */
> >   void __sched ww_mutex_unlock(struct ww_mutex *lock)
> > +	__releases(lock)
> > +	__no_context_analysis
> >   {
> >   	__ww_mutex_unlock(lock);
> >   	mutex_unlock(&lock->base);
> 
> "__releases()" annotations should be added to the declaration of a
> function only instead of the definition, isn't it?
> 
> > @@ -824,22 +838,27 @@ EXPORT_SYMBOL(ww_mutex_trylock);
> >   #ifdef CONFIG_DEBUG_LOCK_ALLOC
> >   void __sched
> >   mutex_lock_nested(struct mutex *lock, unsigned int subclass)
> > +	__acquires(lock)
> 
> Same comment here and below for the "__acquires()" annotation: I think
> this annotation should be added to the function declaration only.

Yeah, I thought I went through and lifted most of them. Clearly I missed
a few :/
