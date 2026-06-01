Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D09C3BBA05;
	Mon,  1 Jun 2026 14:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780324782; cv=none; b=OjDFR9mSoFAQoufgaaCBllH5Wez6k02QAA6wOvRoY6IBjQuOeM/thZ55gaK1uMMYseyG0mZ3o4okWd6Lf8Z1A+ObQb23nYg9yvNJgF+p/SHHGOasj4dIGRL3A6oDW9rNbJzCUzmnOOBv1z74snCXmpYCBSZXsQSqab57Xn3FJXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780324782; c=relaxed/simple;
	bh=PM4vwvYJDKtl3IeuLLdyBAnVwXp5NjpNZ5U0yrDR38I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gvcVn670XyuEezX2DqETZEw22vj9wcMRmDFPZA5AmTW3zTqSRBp20QO3+/FlRWYOAhUJpeaxfllJqQuGR8NDKrCH0mB4ULr2vNWWxPHcJM9ev1dbKyhjXsznAhejsrljSjGXbbV6Iol99v1HEEb7IV7i5yGcLhkcpyOPGZu3Asw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cnI+cPBa; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cnI+cPBa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Lyg40mvuFan316OtR8iagLT75vf6dcPD4Sl1CxXeeqw=; b=cnI+cPBarVkQaqEUE1QCP7VTa9
	mFjQpjYqTI4/D6u2cf779zcXzsxRLxP/SKtUJo9U+gpa2G7X546JfQtX5o7IRrPEiDuRVc88stTtg
	tQ9gO2TRChePRv+EA23gQqlfYByij2BJ+Adn4H4FiKIz7PluGq44qBfIpbf3nyafGRQsWEIjtiGf8
	b/egMKB6k2+mA1H0GruF/655oOI8wWJvlzxB3ap/xAqRY8ZdJPlvCuiqf+LVtCoh5AGbaEvwu1vcC
	gpA9wfHYDT6Z+e//yk9cX+5rKcKAZtD21vIldBd/SML1R2yJjBd6xyaElwkO1r8mfqBHm5/iRMSja
	sWodj4Xg==;
Received: from 2001-1c00-8d85-4b00-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:4b00:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU3nj-00000000Flt-2bRl;
	Mon, 01 Jun 2026 14:39:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 94280300454; Mon, 01 Jun 2026 16:39:34 +0200 (CEST)
Date: Mon, 1 Jun 2026 16:39:34 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Qing Wang <wangqing7171@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	syzbot+185a631927096f9da2fc@syzkaller.appspotmail.com
Subject: Re: [PATCH] rseq: fix using an uninitialized stack variable in
 rseq_exit_user_update
Message-ID: <20260601143934.GT3493090@noisy.programming.kicks-ass.net>
References: <20260601021359.3679327-1-wangqing7171@gmail.com>
 <5f8457e2-ffc5-4a0f-997d-a0f11641979c@efficios.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f8457e2-ffc5-4a0f-997d-a0f11641979c@efficios.com>

On Mon, Jun 01, 2026 at 09:59:35AM -0400, Mathieu Desnoyers wrote:
> On 2026-05-31 22:13, Qing Wang wrote:
> > There is an bug which is an uninitialized stack variable use in
> > `rseq_exit_user_update()` reported by syzbot:
> > 
> > BUG: KMSAN: kernel-infoleak in rseq_set_ids_get_csaddr include/linux/rseq_entry.h:502 [inline]
> > 
> > The local variable:
> > ```c
> > 	struct rseq_ids ids = {
> > 		.cpu_id	 = task_cpu(t),
> > 		.mm_cid	 = task_mm_cid(t),
> > 		.node_id = cpu_to_node(ids.cpu_id),
> > 	};
> > ```
> > According to the C standard, the evaluation order of expressions in an
> > initializer list is indeterminately sequenced. The compiler (Clang, in this
> > KMSAN build) evaluates `cpu_to_node(ids.cpu_id)` *before* `ids.cpu_id` is
> > initialized with `task_cpu(t)`.

W.T.F. would they (C committee) do that :-(, and since this is
apparently a known thing, why aren't the compilers issuing WARNs about
this pattern?

Clearly any non address-of self reference in a struct initializer is
buggered.

And ideally it would actually observe the data-dependency and respect
it, irrespective of the lunacy of the C standard.

> > This is fixed by moving the assignment of ids.node_id outside the structure
> > initialization.
> > 
> > Reported-by: syzbot+185a631927096f9da2fc@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=185a631927096f9da2fc
> > Fixes: 82f572449cfe ("rseq: Implement read only ABI enforcement for optimized RSEQ V2 mode")
> > Signed-off-by: Qing Wang <wangqing7171@gmail.com>
> > ---
> >   include/linux/rseq_entry.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/include/linux/rseq_entry.h b/include/linux/rseq_entry.h
> > index 63bc72086e75..e05f4c18f39e 100644
> > --- a/include/linux/rseq_entry.h
> > +++ b/include/linux/rseq_entry.h
> > @@ -638,8 +638,8 @@ static __always_inline bool rseq_exit_user_update(struct pt_regs *regs, struct t
> >   	struct rseq_ids ids = {
> >   		.cpu_id	 = task_cpu(t),
> >   		.mm_cid	 = task_mm_cid(t),
> > -		.node_id = cpu_to_node(ids.cpu_id),
> >   	};
> > +	ids.node_id = cpu_to_node(ids.cpu_id);
> 
> I find the fix odd. How about:
> 
> int cpu = task_cpu(t);
> struct rseq_ids ids = {
> 	.cpu_id = cpu,
> 	.mm_cid = task_mm_cid(t),
> 	.node_id = cpu_to_node(cpu),
> };
> 
> instead ?

Yes, much saner.
