Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB5C2E06D2
	for <llvm@lists.linux.dev>; Thu, 22 Jan 2026 06:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769063159; cv=none; b=AcSYfUhwPhXD7eZwk3dapAhMllIjhmq4JXr5nyNzjK//uVXY65tWU3DOO4bCmNhLhOrRldcQgmfNxvr4leq5tXsWjrVskmavbF++3/tPQZyHMKzS95O7rehSgy/NfXAlckx7YVdortes/Qugqv/xdMHfiTU5wtrYRkn4wNvlWmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769063159; c=relaxed/simple;
	bh=W/TDQoiTUd7cx8+7Aorg7n9lcONZAlWF7ZwnZemjTD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Op7ay4s873Rpn2djMOHS/8m/O1Y5do37Gr+5JFV/5iuEzYpY4IewTVsZCWO58Z1UDID2S3R7fNh0pdZA/6/Ru9G14xuMhCi6UARGoZ3ZWUes1QTVPgsgVcLPoTjlg2DCg9LU215KX1LwxRN7RyERe3i0sx6pl3HlE5A2oL4WJKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 0389B227AA8; Thu, 22 Jan 2026 07:25:55 +0100 (CET)
Date: Thu, 22 Jan 2026 07:25:54 +0100
From: Christoph Hellwig <hch@lst.de>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Christoph Hellwig <hch@lst.de>,
	Marco Elver <elver@google.com>, Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH tip/locking/core] compiler-context-analysis: Support
 immediate acquisition after initialization
Message-ID: <20260122062554.GA24403@lst.de>
References: <20260115005231.1211866-1-elver@google.com> <20260115213311.GG830755@noisy.programming.kicks-ass.net> <aWmRlXZaOOUvU_Nv@elver.google.com> <20260116150750.GG831050@noisy.programming.kicks-ass.net> <20260116151043.GA18805@lst.de> <20260116152016.GI831050@noisy.programming.kicks-ass.net> <20260116152741.GA19823@lst.de> <20260116154754.GN830755@noisy.programming.kicks-ass.net> <20260121202427.099c36ab@gandalf.local.home>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121202427.099c36ab@gandalf.local.home>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jan 21, 2026 at 08:24:27PM -0500, Steven Rostedt wrote:
> I haven't seen all the other approaches, but would a macro be able to hide
> it with some kind of obfuscation from the compiler?
> 
> 
> 	GUARD_INIT(obj->state, INIT_STATE);
> 
> which would be something like a WRITE_ONCE() macro. I'm not sure what
> tooling there is to disable checks for a small bit of code like this.

Well, you don't really want WRITE_ONCE for every field, but basically
a barrier.  And initializing the lock seems like a very logical
place for such a barrier.  So we'd probably need to pair it with a some
kind of 'start initializing fields' that starts the context, and the
init then ends it.

