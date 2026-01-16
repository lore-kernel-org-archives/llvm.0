Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE022D661C
	for <llvm@lists.linux.dev>; Fri, 16 Jan 2026 15:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768577267; cv=none; b=aez2Ethoth/5Q0tKyKbBNm68VwEPyaapeQ5tsT/Qk7VNIxRPEUanwni9yIgPXpLqI2O2eVf/F7nR/ujnssJ+MIGiUai/2L4iVluQwkUqQcG9W7CT0I0FhgR0jXESjs+YQcemupQKyrh4WP4rdWGTi8hzr14SHNQN3yrzDmLx7vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768577267; c=relaxed/simple;
	bh=oqSv7lZm7Jv91dWwlMlCvF5KXWuN8xu50HAFu038HLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EselQ76xc6jiRJkcYjei89n6S+uNZPND8JhwhhKJllxcvVBgYY8sDmdjcEaE6ebwHSfZua1DX7FB9sED7X44qLT5CLyjnkK87o6U7G5q9Pa3cinzD/OELeqF1mlxqjhFGHxLPgwNLkPOuv0ucB9NEptAlIoUWPbJxjhRsemz0cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 78E79227AA8; Fri, 16 Jan 2026 16:27:41 +0100 (CET)
Date: Fri, 16 Jan 2026 16:27:41 +0100
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
Message-ID: <20260116152741.GA19823@lst.de>
References: <20260115005231.1211866-1-elver@google.com> <20260115213311.GG830755@noisy.programming.kicks-ass.net> <aWmRlXZaOOUvU_Nv@elver.google.com> <20260116150750.GG831050@noisy.programming.kicks-ass.net> <20260116151043.GA18805@lst.de> <20260116152016.GI831050@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116152016.GI831050@noisy.programming.kicks-ass.net>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Jan 16, 2026 at 04:20:16PM +0100, Peter Zijlstra wrote:
> is *much* clearer than something like:
> 
> 	spinlock_init(&obj->lock);
> 	// init
> 	spinlock_deinit(&obj->lock);
> 
> Exactly because it has explicit scope. (also my deinit naming might not
> be optimal, it is ambiguous at best, probably confusing).

WTF is spinlock_deinit even supposed to be?

I though this is about:

	spin_lock_init(&obj->lock);
	spin_lock(&obj->lock);

> Not to mention that the scope things are far more robust vs error paths.

They are just a really hacked up clumsy way to provide what a very
limited version of what the capability analys provides, while messing
up the code.
