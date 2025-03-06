Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388CB19F438;
	Thu,  6 Mar 2025 09:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741254481; cv=none; b=cNIHv/Ihswm3NeT/b0X3AojJL4ReLaM5UsARw0NHmiindzDkDg0aAx22sVvovHKLaO4Ax1eqG7S8YTvQn7Y5S9BY1juJw6iMwVZL/b1t8Wd/v+nW70B6XYUKMWcY3NgEXPH6Unfamba2Uh/D5a4iiccz2MimHu5vK/R+elAnAAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741254481; c=relaxed/simple;
	bh=ilC51wadctZ9R3eYYarbFHFDOP45yKmA5hRDwoe1Cko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t5zi3/c+6qGW0mOwFl3g4Sxuo4qKPZXqfUcM/1m0aUrN4uNvurYX80ZkypdFqjLfOzH1QsYgQjBIxeRjjFrt0GyKFB5yv6HFmVZJ5r3wbnDXwux9KjcE+2U2Kg2FRTwEZqJ5A06qwkrn/8COf8NnCAqIMOntwXhI7aG9MiosIv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=lAslAKKS; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lAslAKKS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=A+/5fSQDxDJ4ibLfJG8Yfjwd+TLkjg+tTD/ZQdamrZw=; b=lAslAKKSSfaj5ewq/4PtUkG9BH
	UaQL63Wo7jPBFH8U4TJOjo7zT7WFSaAXRF9oCM72bLE/3QMDXvltw+mMh+7snfU/3DLStLoOLu8uA
	iEkvUISpu8cSEXSNK0zbA30aWVkdR/yf8joejWCkSbuYFqQQ04pz/CEieW2NT6r28JIc8JPxNnVlW
	7Tp4o+wIEoikHH9OJK52MpDd9LmEf+U6p4V2r7HbxsVbJAK9WujYSXt2luiQxZRGidmftGv01zFXh
	KERKb0gOKgF4t8JPlHpQWLSSIjzaIkAJLU8zMakXVHiplVrtFvYBcRXeDUBIEh9oczrDj4SQOGHsB
	ZMgGTtZg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tq7pZ-00000001043-2tVk;
	Thu, 06 Mar 2025 09:47:53 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B4AE530049D; Thu,  6 Mar 2025 10:47:52 +0100 (CET)
Date: Thu, 6 Mar 2025 10:47:52 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: "Puchert, Aaron" <aaron.puchert@sap.com>
Cc: Marco Elver <elver@google.com>, Aaron Ballman <aaron@aaronballman.com>,
	"linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	Bart Van Assche <bvanassche@acm.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: Re: Thread Safety Analysis and the Linux kernel
Message-ID: <20250306094752.GC16878@noisy.programming.kicks-ass.net>
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

> > 2. Basic alias analysis, e.g. when storing a pointer to a lock in a
> > function-local variable. [Complaint in:
> > https://lore.kernel.org/all/569186c5-8663-43df-a01c-d543f57ce5ca@kernel.org/
> > -- quote: "Fix the analyzer instead."]
> 
> We already do this analysis for C++ references, and we might extend it
> to pointers, but with one restriction: an important aspect of
> references that we're relying on is that they're essentially immutable
> pointers, i.e. "T&" semantically behaves like "T* const". This makes
> references behave like SSA values, meaning we can just symbolically
> substitute the initializer. If we can ask the user to mimic references
> by making the local variable "const", we can apply the same logic. (I
> know that using "const" is a bit tricky in C, e.g. "T**" doesn't
> implicitly convert to "const T* const*" as it does in C++. However, I
> would hope that you can always add top-level "const".)
> 
> With "non-const" pointers we're unfortunately opening a can of worms:
> 
> struct S { int a, b; };
> 
> void f(struct S *s)
> {
> 	int *val = &s->a;
> 
> 	while (...) {
> 		do_something(val);
> 		val = &s->b;
> 	};
> }
> 
> The analysis walks the control-flow graph (CFG), and it wants to walk
> it only once. (We handle back edges by checking that the set of
> capabilities matches the set that we previously computed.) Here we
> have val == &s->a when we encounter the call to do_something. But then
> we see a new assignment and a back edge, so our assumption was wrong!
> 
> I don't think we want to make multiple rounds over the CFG. We're not
> trying to do symbolic execution. There are performance implications,
> reliability implications, and depending on how far we want to go, we
> might even run into the halting problem.
> 
> So if we can restrict this to "T* const", I don't see an issue with
> it, and it should arise naturally from the existing alias analysis for
> references.
> 
> Perhaps we can emit notes on -Wthread-safety-precise that suggest
> using "const" pointers or references in case we suspect alias analysis
> has fallen short.

So one of the most important use cases from my perspective is the
interaction with __attribute__((cleanup())), which we use to build
scope based guards in C.

And most of that might be fine with using 'T * const', but the support
for conditional locks explicitly needs to set the pointer NULL when the
acquire fails.

We have a macro used like:

DEFINE_GUARD(mutex, struct mutex *, mutex_lock(_T), mutex_unlock(_T))

Which expands to:

static inline void class_mutex_destructor(struct mutex **p)
{
	struct mutex *_T = *p;
	if (_T) { mutex_unlock(_T); }
}

static inline struct mutex * class_mutex_constructor(struct mutex *_T)
{
	struct mutex * t = ({ mutex_lock(_T); _T; });
	return t;
}

This is then typically used like:

	scoped_guard (mutex, &my_lock) {
		...
	}

Which in turn expands to:

	for (struct mutex *scope __attribute__((cleanup(class_mutex_destructor))) =
	     class_mutex_constructor(&my_lock); scope; ({ goto _label; }))
		if (0) {
_label:
			break;
		} else {

		...
	}

And here I can probably make the guard() thing add const like:

		struct mutex * const __UNIQUE_ID_guard_123 
			__attribute__((cleanup(class_mutex_destructor) =
				class_mutex_constructor(&my_lock);

But note that _constructor() is still laundering this through a
non-const version, and while the above could have:

	struct mutex * t const = ...

That no longer works for the case of:

DEFINE_GUARD_COND(mutex, _try, mutex_trylock(_T))

which expands to have a constructor like:

static inline struct mutex * class_mutex_try_constructor(struct mutex *_T)
{
	struct mutex * t = ({ void *_t = _T; if (_T && !(mutex_trylock(_T))) _t = NULL; _t; });
	return t;
}

Notably that NULL assignment on lock failure is not happy with having
that const on.

Note that this combination of trylock and scoped_guard() results in not
taking the for-loop on failure. Eg:

	scoped_guard (mutex_trylock, &my_lock) {
		print("ponies\n");
	}

Will in fact only print 'ponies' when it got the lock.


And yes, all of this is fairly creative use of C, but hey, we get to
have scope based guards, which get rid of a lot of errors in error
paths.


So assuming we can annotate things like so:

static inline void class_mutex_destructor(struct mutex * const *p)
	__releases(*p) __no_capability_analysis
{
	struct mutex *_T = *p;
	if (_T) { mutex_unlock(_T); }
}

static inline struct mutex * class_mutex_constructor(struct mutex *_T)
	__acquires(_T) __no_capability_analysis
{
	struct mutex * t = ({ mutex_lock(_T); _T; });
	return t;
}

static inline struct mutex * class_mutex_try_constructor(struct mutex *_T)
	__const_acquires(nonnull, _T) __no_capability_analysis
{
	struct mutex * t = ({ void *_t = _T; if (_T && !(mutex_trylock(_T))) _t = NULL; _t; });
	return t;
}

the: struct mutex * const in the for() construct might just be enough.


Would this be sufficient consty for it to untangle this web?

