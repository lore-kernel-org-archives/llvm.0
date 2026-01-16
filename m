Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888A518C02E;
	Fri, 16 Jan 2026 15:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768577251; cv=none; b=Cj8xChP+IE66AOWjk0eDqsKqOdQa/pbHOfWL1TrjlpN4DqTn3VmqEMzxhhEi2AC7M6ltMLv98Kzdw5hTYVZeKKVvxqsJLrcUFrCw82PNWLAdVqnB/mPEp0DKsJt0h8REd3s/6GS8pfMM4pfOffqHhkXY6arAWekz42uuDQyZGTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768577251; c=relaxed/simple;
	bh=q+/TAd6huhAEXUm04zqcXTUsVS9JI2pytGNfJnnbweE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NCOM81hcFhx0b8PJXrCft8h2wJfUaz8D6qZxBNIG8L8rRg5v3G2YHQg8PcYA5cdWVwx+7X7e208mcgODXf+67XfZf9toPGtjgd+Q8zdFNWULKI1DaQv8MsZqJqiOkIxknqXJzfmgPf9I3HteXezZaGsnNZvzPdoiqLICp0pNA0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eYsr8n51; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eYsr8n51"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/pJ1ofg8eHAKL6DkYs2Vzjgucpid1TAhbBUOzK20eWI=; b=eYsr8n519D4j0SOKy6MGISgprB
	UhNAuM0k92yvLqnmwBRoSRlUvFaTOfFw1GI9/qJW4d2Ip2YJVpyEwFvGjUdzc7oijxl/H9biIWH2w
	BCFAcvq4gw6Mtf6u7L2gwxzH5daHDg/x9/h9sqM7yVTKArSzDZYTjVcjfnYwogr/Ya5fEVE3c66o8
	zj49rkV50ryBfYdY9C9hFHexlbMuFrEKEcAXJPcD/wH/J4JMVRTffgJKUaoikMWGJn7g9LiTwYOzL
	OEmo0Zy2pNXl+xTQQpA2XZyWILOakY34+MMl9lnTyvPusHXyolJOLnUcZS9klZShHs8C7cnsLCTs4
	wauQVpRg==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgljQ-000000092al-4B4v;
	Fri, 16 Jan 2026 15:27:25 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 516533005E5; Fri, 16 Jan 2026 16:27:23 +0100 (CET)
Date: Fri, 16 Jan 2026 16:27:23 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Marco Elver <elver@google.com>, Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH tip/locking/core] compiler-context-analysis: Support
 immediate acquisition after initialization
Message-ID: <20260116152723.GE831285@noisy.programming.kicks-ass.net>
References: <20260115005231.1211866-1-elver@google.com>
 <20260115213311.GG830755@noisy.programming.kicks-ass.net>
 <aWmRlXZaOOUvU_Nv@elver.google.com>
 <20260116150750.GG831050@noisy.programming.kicks-ass.net>
 <20260116151043.GA18805@lst.de>
 <20260116152016.GI831050@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116152016.GI831050@noisy.programming.kicks-ass.net>

On Fri, Jan 16, 2026 at 04:20:16PM +0100, Peter Zijlstra wrote:
> On Fri, Jan 16, 2026 at 04:10:43PM +0100, Christoph Hellwig wrote:
> > On Fri, Jan 16, 2026 at 04:07:50PM +0100, Peter Zijlstra wrote:
> > > LGTM; Steve, Christoph, does this work for you guys? Init and then lock
> > > would look something like:
> > 
> > Please do something that works without all these messy guards that just
> > obfuscate the code.
> 
> I think we're doing to have to agree to disagree on this.
> 
> Something like:
> 
> 	scoped_guard (spinlock_init, &obj->lock) {
> 		// init
> 	}
> 
> is *much* clearer than something like:
> 
> 	spinlock_init(&obj->lock);
> 	// init
> 	spinlock_deinit(&obj->lock);
> 
> Exactly because it has explicit scope. (also my deinit naming might not
> be optimal, it is ambiguous at best, probably confusing).
> 
> Not to mention that the scope things are far more robust vs error paths.

That said; you can just write:

	spin_lock_init(&obj->lock);
	__acquire_ctx_lock(&obj->lock);
	// init
	__release_ctx_lock(&obj->lock);

But I really don't see how that is 'better' in any way.
