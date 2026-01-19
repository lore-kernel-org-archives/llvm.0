Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AB629BD95
	for <llvm@lists.linux.dev>; Mon, 19 Jan 2026 09:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768813854; cv=none; b=cvaDc5pq9B4S/ApAei1kBcqRA8MuzmnJ1gAHiip89w/O11l/fvYPKY08VH6yycvtZR+YsVz3bP4GBz+hOSGF1SzywbdXUOl275lQwkT4M9n/JLhmlk9lVk2ZeS92YY4sI5CHDou3/WBYCh43QgNEUqZshAR2P18r8JCdL8QyBbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768813854; c=relaxed/simple;
	bh=04XpBcCIT//GHUeSzJMwWc3e89D3CQHCF4MCInOmsic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fvWVuqQzgE+qnvN1uJpSQkDcxfeZ9kaNw+fk4Puax8zcclwK8lIi51Y1/1VVUKTAHtTVkEO4Hf+ueDIrTGtyPo0CKl+iQeYMvMStNcToADumMg/fE7oG/xL+k7Nce4I4O1xbx0uQZbSAfW3lq6Ofgb98JVBZxsLNUdia7bVz8E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 219C0227AAA; Mon, 19 Jan 2026 10:10:46 +0100 (CET)
Date: Mon, 19 Jan 2026 10:10:45 +0100
From: Christoph Hellwig <hch@lst.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Christoph Hellwig <hch@lst.de>, Marco Elver <elver@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH tip/locking/core] compiler-context-analysis: Support
 immediate acquisition after initialization
Message-ID: <20260119091045.GA8181@lst.de>
References: <20260115005231.1211866-1-elver@google.com> <20260115213311.GG830755@noisy.programming.kicks-ass.net> <aWmRlXZaOOUvU_Nv@elver.google.com> <20260116150750.GG831050@noisy.programming.kicks-ass.net> <20260116151043.GA18805@lst.de> <20260116152016.GI831050@noisy.programming.kicks-ass.net> <20260116152741.GA19823@lst.de> <20260116154754.GN830755@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116154754.GN830755@noisy.programming.kicks-ass.net>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Jan 16, 2026 at 04:47:54PM +0100, Peter Zijlstra wrote:
> So the base problem here is something like:
> 
> struct obj {
> 	spinlock_t	lock;
> 	int		state __guarded_by(lock);
> };
> 
> struct obj *create_obj(void)
> {
> 	struct obj *obj = kzmalloc(sizeof(*obj), GFP_KERNEL);
> 	if (!obj)
> 		return NULL;
> 
> 	spin_lock_init(&obj->lock);
> 	obj->state = INIT_STATE; // error: ->state demands ->lock is held
> }
> 
> So if you want/can take spin_lock() directly after spin_lock_init(),
> then yes, you can write:

Which really is the normal case.

> However, if code is structured such that you need to init fields before
> taking the lock, you need a 'fake' lock acquire to wrap the
> initialization -- which is safe because there is no concurrency yet and
> all that, furthermore, by holding the fake lock you also ensure you
> cannot in fact take the lock and create undue concurrency before
> initialization is complete.

Well.  That assumes you have fields, or probably pointed to data
structures, where use under the lock is fine, but initializing them is
not.  Which sounds really weird.  And if you do that, splitting out a
separate function like in the patch that trigger all this sounds
perfectly fine.  It's the simple case you mentiond above that is fairly
common and really needs to work.  Especially as the allocate and init
helpers for them are often pretty trivial.

That being said, even outside this pattern the concept of allowing
initialization to touch fields before the containing structure is
published and can be found by other threads is a common and useful
one.  Having that supported natively in context tracking would probably
be useful if not required sooner or later.

