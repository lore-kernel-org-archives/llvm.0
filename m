Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F311AA1D2;
	Fri,  7 Mar 2025 08:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741334407; cv=none; b=BnaRs6oSdX3MD57hcK/JurVsW8RSwKBNR9LtYLRHry2sODFnKoNKJlhAf4hC1n9vsOzzJYXCG2Vbxcxp8d4qFLU9SdtxgCd4ZoaFTxOIIzZXvWtAbC7d3Lr5k3X6JRROKT0KPBvl3JorJFZa58o811g9pvwRNbqieylefqJMCPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741334407; c=relaxed/simple;
	bh=B4Hv1WP/DM23eDQ2LGEwtC8Z1jgD5MylszZxkmUnA/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P89LeIZG5mtehEVtaa8jYtlVMkXynL9vvt7QF1HBEIegqA54VDt2jGJsWezeJrGfNkFRgNEsJbcemYE4gY1gZp1K12//0WNrBg+fq1T/WXtKbw3sfs1oeK4bpnU04ZRm/mZxXcbS/p5mhMQuaqcihGb7CXlpNSBkeUCbelFfopY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JUwx3IsK; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JUwx3IsK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MwJVYc284OOyOnJjmuelYuxW75yHFjvT6s/SjHy8FFA=; b=JUwx3IsKfUvv6kUhOyxGgPwu91
	2YUb3jP920cBSchgnwu2D0AHeFoFdo0g5V5KhzeG4OwNEEZ4AQqJ9xgl795zk6R2Wbq0jPXHsc0VY
	YFqHl/saBgnbxN6WbCZ3ZNbZUxbZNhKGMOmtrvr3RvUNUEKgFAKn8qz+NA23kQlZn24ezjdwqlRIT
	+uu9nPfdobh+JusLWuKkhxDVHSGa+bpR/wsWXtGeJRSGs0Pd0kmhjjsFQShkE6oVBIvOrPueVYfnO
	Bx3k1AX16ErLuquK3pFA4lZLAIB83cunK+rnq1rT1KxlOQ+UEZMFUElgWYxEC5tb0tv9N4OS3zNCM
	DNUmk6bQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tqSca-0000000C3s5-0wOU;
	Fri, 07 Mar 2025 07:59:52 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id F3EFE300269; Fri,  7 Mar 2025 08:59:50 +0100 (CET)
Date: Fri, 7 Mar 2025 08:59:50 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: "Puchert, Aaron" <aaron.puchert@sap.com>
Cc: Marco Elver <elver@google.com>, Aaron Ballman <aaron@aaronballman.com>,
	"linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	Bart Van Assche <bvanassche@acm.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: Re: Thread Safety Analysis and the Linux kernel
Message-ID: <20250307075950.GH16878@noisy.programming.kicks-ass.net>
References: <CANpmjNPquO=W1JAh1FNQb8pMQjgeZAKCPQUAd7qUg=5pjJ6x=Q@mail.gmail.com>
 <DB7PR02MB36260C79D8CD91925D0D3447E7CB2@DB7PR02MB3626.eurprd02.prod.outlook.com>
 <20250306100828.GD16878@noisy.programming.kicks-ass.net>
 <DB7PR02MB36269DCE8C78D8E5DB7C7AC6E7CA2@DB7PR02MB3626.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB7PR02MB36269DCE8C78D8E5DB7C7AC6E7CA2@DB7PR02MB3626.eurprd02.prod.outlook.com>

On Thu, Mar 06, 2025 at 10:18:32PM +0000, Puchert, Aaron wrote:

> > Users would typically look like:
> > 
> > try_to_wake_up(p, state)
> > {
> >         struct rq *rq;
> > 
> >         scoped_guard (raw_spinlock_irqsave, &p->pi_lock) {
> >                 if (!ttwu_state_match(p, state))
> >                         break;
> > 
> >                 rq = __task_rq_lock(p);
> >                 // go enqueue task
> >                 raw_spin_rq_unlock(rq);
> >         }
> > }
> 
> Can the return value be used as an initializer by moving the
> declaration into the scoped_guard block? Or do you have a style guide
> that wants all declarations at the beginning of a block?

Yeah, we have a style guide that strongly suggests variables are
declared at the start. In fact, we used to have
-Wdeclaration-after-statement and only (finally) got rid of it in order
to allow for these scope guards.

> We track capabilities as symbolic expressions, so something like
> "rq->__lock" in this case. If there is an assignment to "rq", that
> changes the meaning of the symbolic expression. The object referred to
> by the expression is then no longer reachable. Currently we don't look
> at assignments at all when it comes to tracking capabilities. We don't
> even warn, it's simply documented as not being supported. We only look
> at initializers, as in alias analysis. Having a separate variable
> being initialized with the return value gives us a unique name for the
> return value, which is good when we're working with symbolic
> expressions.
> 
> If there are cases where assignment is really needed, we can also
> check to which extent we can rewrite expressions or warn when the
> objects they point to become unreachable. (In the example that would
> be the case if someone assigned to "rq" again after the call to
> "__task_rq_lock ".)

Right. I suspect we might need this if we want to minimize code churn.
