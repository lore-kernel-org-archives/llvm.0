Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1122147FD;
	Thu,  6 Mar 2025 17:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741281066; cv=none; b=YJneBkWpEHdFrvo/L2tu8IVOF1bIejLVci3D2X5ETr3gCEbr3yyIpW6594/Kvwy376RozCpSFBChtUSXb7CjFm7yWmqZ9qmC9ds4//aTxK4Y2Nq8i8JnqgbBYY168frs6yLLIJKRmyBYEfdrdQ340VMnnY2DX3IY5EYlvUC3jtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741281066; c=relaxed/simple;
	bh=hTNnFR5DE6A7O2opg9Ot55R0567pYGak3J/0kFyx73w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZBo6mTNZn13ZXLEFU8PedRmXYB/pGQ6GB8F//GdimSG5X1n8uplMx/ktr+/womLpVzrWHy2a2nReFx8zUlsIJgnNZgaqGhs7p/jmaHZJe1y2LYyZDy2hjfkH4CytYPo6Wycj8MYpMi7qjR80iNaEA2AEzlL1KF80fR9pV4wF/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rUSs31sj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rUSs31sj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD59C4CEE0;
	Thu,  6 Mar 2025 17:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741281066;
	bh=hTNnFR5DE6A7O2opg9Ot55R0567pYGak3J/0kFyx73w=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=rUSs31sjh4ik1Yr7yhVfIiIiLi0TmnS07PvyZb8wfRKjBhGdF0Fog0aJZX03G04cW
	 XuF0aV/h4WjI+ll+zLCENS/DMlgAXZbBF0MB9Bf7u5Vv04SBvlGiMDSq0H608PO/bi
	 OC5UiGzpsdachlx8qXLwqk7JZGBWEGg04lmwV6ZrKlXr5OXfjE1f+DKLdN3Lwkra/E
	 BU31JjtnmjbP4rs2fys5JuQQyF5YAekOCojQVr92gz25YHiJTwM8UEvQHAeNoSrMAK
	 Z3zgNIDk2QKoxfLF5ULb2bsgSF9Tj1Zha57ZXCgmf8xEu3nmm2w7fCbjUtjWU6u5z+
	 +cIPqP0WGHDkw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id B5144CE13D4; Thu,  6 Mar 2025 09:11:05 -0800 (PST)
Date: Thu, 6 Mar 2025 09:11:05 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: "Puchert, Aaron" <aaron.puchert@sap.com>
Cc: Marco Elver <elver@google.com>, Aaron Ballman <aaron@aaronballman.com>,
	"linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	Bart Van Assche <bvanassche@acm.org>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: Re: Thread Safety Analysis and the Linux kernel
Message-ID: <119f37e4-bbcb-403a-9f63-5b9001233c0a@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <CANpmjNPquO=W1JAh1FNQb8pMQjgeZAKCPQUAd7qUg=5pjJ6x=Q@mail.gmail.com>
 <DB7PR02MB36260C79D8CD91925D0D3447E7CB2@DB7PR02MB3626.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB7PR02MB36260C79D8CD91925D0D3447E7CB2@DB7PR02MB3626.eurprd02.prod.outlook.com>

On Wed, Mar 05, 2025 at 11:54:14PM +0000, Puchert, Aaron wrote:
> From: Marco Elver <elver@google.com>
> > Hi Aaron ^ 2,
> > 
> > [+Cc a bunch of folks that were involved in discussions.]
> > 
> > After sending v2 of the -Wthread-safety / Capability Analysis patches
> > for the Linux kernel [1], a number of concrete improvements to
> > -Wthread-safety will be required sooner or later. It is unclear if
> > they are blockers to the Linux kernel's adoption because the feature
> > is currently designed as "opt-in per subsystem", but it's clear the
> > current state of things is not ideal.
> > 
> > [1] https://lore.kernel.org/all/20250304092417.2873893-1-elver@google.com/
> 
> First of all, in addition to the documentation at https://clang.llvm.org/docs/ThreadSafetyAnalysis.html that you're already aware of, I can also recommend the paper by some of the original authors at https://static.googleusercontent.com/media/research.google.com/en/us/pubs/archive/42958.pdf.
> 
> > Peter Zijlstra's feedback:
> > https://lore.kernel.org/all/20250305112041.GA16878@noisy.programming.kicks-ass.net/
> > -- much of which led to the below requests. Peter also managed to
> > crash Clang, but that's probably unrelated to -Wthread-safety
> > directly: https://github.com/llvm/llvm-project/issues/129873
> 
> Technically a parser issue and not in the analysis itself. But to my knowledge expressions in attributes were originally introduced for the analysis, so in some sense it is related.
> 
> > More straightforward requests:
> > 
> > 1. Re-entrant acquires: rcu_read_lock(), preempt_disable(), etc. are
> > all re-entrant locks. My proposal is to introduce an attribute that
> > can be added to "ACQUIRE(..)" annotated functions to indicate they are
> > re-entrant. Release-count needs to then match acquire-count to fully
> > release a capability.
> 
> We initially thought that this might be a problem for us as well, because we also use re-entrant locks. However, until now, it hasn't been an issue and I'm almost convinced that it never will be.
> 
> In essence, the analysis derives the set of statically known-to-be-held capabilities at every point in the program text. What does this mean? If you run the program, and stop it at any (time) point, you get the actual set of capabilities held at this point. However, a function might be called from different places, and depending on the caller, different capabilities might be held at the same point in the program text. The set that we compute does not and cannot contain all those capabilities, but only those that are held regardless of where execution comes from. So we generally don't know about capabilities held by callers, unless there is an annotation on the function, which is then checked at the call site.
> 
> Re-entrant locks are thus not necessarily an impediment: if one function acquires a lock and calls another function that also acquires it, the analysis won't complain. It analyzes functions in isolation. You'll only get a warning if you acquire a lock twice in one function without releasing it in between, or if the function is annotated as requiring the lock and acquires it again. However, in both cases the second acquisition can always be dropped. You can argue that this isn't a deadlock and hence not a bug, but the acquisition is unnecessary because the lock is already known to be held.
> 
> In theory I could construct cases where there are still problems: maybe we're locking twice because we're calling another function that unlocks once, but we still want the lock to be held afterwards. However, I've never seen this. In our code, re-entrant locks are only used because the caller might already hold the lock for some reason. The sophisticated patterns that I could think of never appeared. If this is different in the kernel, I'd be curious how it looks like.

We do have macros that acquire locks and enter RCU read-side critical
sections.  Also, depending on exactly where the analysis is done, static
inline functions might cause this to happen.

These can easily result in a function with nested calls to (for example)
rcu_read_lock().

							Thanx, Paul
