Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B1A402453;
	Tue, 24 Mar 2026 17:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774372695; cv=none; b=OEN8m+cwX0NYzqMW0whlrIyNxTbbjZrqYpHS1ddhmJhgHduCYzgIu0Y9nMA1eT6PAbvHfWsPHtKi2WuRM6gerAj6h50BC1Sp2Z8Q8bAO4FE7I0NhD4AGtyc8iJMaPxe1AuBz1k37HfcmHJTY8wDtyTbIVcErVWuL/v67B3eJsEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774372695; c=relaxed/simple;
	bh=+J/MDYyzTles5UOXk5iz5uUezpo00Kp3/yVMGuqA8Gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g9OVUv8XsPymV4LlTdhfUq2p7rJHqx1Tg8BkuZ9G1DbRGGr20m13Ip3HpumS40AKzuMu+4eWIl58acF4oxTwMOZCY0qnRgbgNxp8uJuGDz6MX/0fKd4J1/XI73VxgjLRpBusUKD2lSG0MdOnBYXmGXxzYtJiPx/NWRBQ2QzuLkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NovR/Qr1; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NovR/Qr1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CYZ3hHo4euyitDk4EphKQxkOMq3o6lLcu1GyXe9kjh8=; b=NovR/Qr16FmLqDXyIKbZFHTNnA
	zGJx7uCLw307fVjFPEwKxpKFeJzGz6Fcr8aHRgYJdnU67O1ZlFknIPBHCuD8wtrGoqc9PqPulWTBr
	9YxZfI68w03P5nAKYJwzonz4e+pjTtqs9p4O698aRcfrrOcp3Jz15jJvoLNBul0CvPyeiPOaIoFbZ
	q6ozmaiSz2900/eRr1bHHEPmuyFqEauMyvYiZVZljrXbVgQGSIMS5Pj+dU/o8qCK+GuxpLyixJUu+
	TpmzPWig0arINr6GbRU/Lx/UZQCS/XOd2nL+kooq/H/cJd0c5g/Li8T963RME7P51RYOUYUAUBMeY
	+Lbkplnw==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w55OL-0000000EMps-0hn0;
	Tue, 24 Mar 2026 17:18:09 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6F1E63002D8; Tue, 24 Mar 2026 18:18:07 +0100 (CET)
Date: Tue, 24 Mar 2026 18:18:07 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Jann Horn <jannh@google.com>
Cc: Dmitry Vyukov <dvyukov@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, llvm@lists.linux.dev,
	Ingo Molnar <mingo@redhat.com>
Subject: Re: [PATCH v2 1/4] sched: Ensure matching stack state for kcov
 disable/enable on switch
Message-ID: <20260324171807.GA1728621@noisy.programming.kicks-ass.net>
References: <20260318-kcov-extrecord-v2-0-2522da6fcd3f@google.com>
 <20260318-kcov-extrecord-v2-1-2522da6fcd3f@google.com>
 <20260320221051.GX3738010@noisy.programming.kicks-ass.net>
 <CAG48ez1W_iJsfF0nrJqtV9sBvnxG9VHJ0zhhRi-6+kKiwyWemA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG48ez1W_iJsfF0nrJqtV9sBvnxG9VHJ0zhhRi-6+kKiwyWemA@mail.gmail.com>

On Tue, Mar 24, 2026 at 04:47:51PM +0100, Jann Horn wrote:

> > Anyway, I'm a little divided on this. Perhaps the simplest and most
> > obvious way is something like so.
> >
> > But what about compiler funnies like the various IPA optimizations that
> > can do partial clones and whatnot? That could result in violating this
> > constraint, no?
> 
> Ah, good point, bah. And commit 0ed557aa8139 ("sched/core / kcov:
> avoid kcov_area during task switch") explains that we also can't just
> keep emitting kcov records throughout a context switch.

Oh, fun!

> So options I have are:
> 
> 1. In the scheduler: Try to put enough magic annotations on __schedule
> to prevent any such optimizations. (Probably "noinline __noclone"?)
> But that's kind of invasive, I assume the scheduler wouldn't want to
> have that unconditionally on a core function because of a niche KCOV
> usecase.

So I noticed that clang doesn't even support __noclone, which is a bit
of a stumbling block there. But while going through the various function
attributes I did note __flatten, and I think we can use that.

But yeah, without then inhibiting cloning and the like this isn't going
to help. I found that linkers can also do cloning (as part of LTO I
guess).

> 2. In KCOV (without touching the scheduler code): Keep track of the
> current and minimum stack depth while record generation is suppressed,
> and emit those values when record generation is reenabled. That's a
> bit more complexity but keeps it contained within KCOV, and I guess a
> way to suppress events might be useful for other stuff too.
> 
> I guess I'll probably go with option 2...

Yes, I suppose not relying on the compiler doing things exactly so is
the more robust approach.
