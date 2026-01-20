Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCC73A0E9B
	for <llvm@lists.linux.dev>; Tue, 20 Jan 2026 07:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768893854; cv=none; b=fodGU0l0t3rymY/uihAnuAyei6bNZ6gelzkW5ohdo9JN4g30meikJgH/Q7D3VwI/q3ys9DgHtxvrN/EkXfnv9dd0VETEsOwVB723Lra8Hu0XOTFthy3Bly5xWu6IpqGrhG9MSA9tRtiZNeMT1jRNrP8XfVbKlSflQlP7Y2EK+FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768893854; c=relaxed/simple;
	bh=tiH5YVbL3094wk6xrhxCuF+vnDU65uGfJx6ab8aN+uM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYWAJXmP9v4J530+0oqxu5f22F/XIGfgbCxAv8vQiX5iMsre6GrzO4FEm5tKVIIfvhv6g+B68jbIPsoXaLNU+qoWQWm9xejW5uMuk8YCLUmnzE7vG4uswkK7uTcuewvZAnkeLhb7ueHREiz9GxQbG0688jer4I+WIJljLRNvEPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 14809227AA8; Tue, 20 Jan 2026 08:24:02 +0100 (CET)
Date: Tue, 20 Jan 2026 08:24:01 +0100
From: Christoph Hellwig <hch@lst.de>
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
	Christoph Hellwig <hch@lst.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Bart Van Assche <bvanassche@acm.org>, kasan-dev@googlegroups.com,
	llvm@lists.linux.dev, linux-crypto@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH tip/locking/core 0/6] compiler-context-analysis: Scoped
 init guards
Message-ID: <20260120072401.GA5905@lst.de>
References: <20260119094029.1344361-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119094029.1344361-1-elver@google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Jan 19, 2026 at 10:05:50AM +0100, Marco Elver wrote:
> Note: Scoped guarded initialization remains optional, and normal
> initialization can still be used if no guarded members are being
> initialized. Another alternative is to just disable context analysis to
> initialize guarded members with `context_unsafe(var = init)` or adding
> the `__context_unsafe(init)` function attribute (the latter not being
> recommended for non-trivial functions due to lack of any checking):

I still think this is doing the wrong for the regular non-scoped
cased, and I think I finally understand what is so wrong about it.

The fact that mutex_init (let's use mutexes for the example, applied
to other primitives as well) should not automatically imply guarding
the members for the rest of the function.  Because as soon as the
structure that contains the lock is published that is not actually
true, and we did have quite a lot of bugs because of that in the
past.

So I think the first step is to avoid implying the safety of guarded
member access by initialing the lock.  We then need to think how to
express they are save, which would probably require explicit annotation
unless we can come up with a scheme that makes these accesses fine
before the mutex_init in a magic way.

