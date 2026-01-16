Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E293128B5;
	Fri, 16 Jan 2026 15:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768576823; cv=none; b=EjZlqBMNFH9+zGsOMEYJnQhgyiTqPpZVi+hWqeaYaeHvedtyneiCwSllDR3MxL46vYj/4hF5+j/XVtdq56O+YiL+EY5vvMIjNnzzhKin+dt6TvqNIfm+M/8xw5g1r4MvGhsvXp3MJTOByjOnJDI+vztfcCUi05cK5YaL4VGdiqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768576823; c=relaxed/simple;
	bh=wvRvwZLNcJoC6mSZHE7cGurW+WliH/qu4/DntIhIsjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JIEgtihupy0k+Mr3no3Z5PFcNl8QZq6BA/pNZLOyQdEIg77WlP43OtMWX3k1OiuXKaEKrSLSql8W+Erp97x1ouPqjQfqhGoWLAW4R/ERML0iex2nprGluZFrAX3adwuHF0qHwYtiYPksUZsESIV2ZXR3G1FyZ+QEQ+m47ThfJZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=qUYsK/EP; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qUYsK/EP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=F84ze1xMXxsi8Ngm/MILBaKfYsqccovO9zxu5oGP+pg=; b=qUYsK/EPsSHXT8cEQHJiNWOqze
	RNVvHKiAWT1JvvdFus1WWVsQbscdUkVV68zrLaZN/SzAG1f2QfgDMXDO5mGgWZFE89Gg/BoQZg/D1
	fvykDCc2ze7WFEXeB4QwVVhfMtUAYiF7joXx9FzLJ18BGnnsbiSnnfzCefwph8IzcJfDPskD3x/JQ
	f27AGfmjLlxM7YRNV8pf7N4aiEbZ429yFcimlkbbWNAB2ot5yhZOV3GmnYm4pfXC4x4T9NReZdm4t
	9kog2O/z79hji0r+8m6QKTTNvncYmmbCPjVeE4NhewrJ6kiGpOzWL4F2DnTMyS+KlRdgbE00DGiwj
	PNlHAg9w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglcW-00000009Wbh-3oJw;
	Fri, 16 Jan 2026 15:20:17 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 741E43005E5; Fri, 16 Jan 2026 16:20:16 +0100 (CET)
Date: Fri, 16 Jan 2026 16:20:16 +0100
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
Message-ID: <20260116152016.GI831050@noisy.programming.kicks-ass.net>
References: <20260115005231.1211866-1-elver@google.com>
 <20260115213311.GG830755@noisy.programming.kicks-ass.net>
 <aWmRlXZaOOUvU_Nv@elver.google.com>
 <20260116150750.GG831050@noisy.programming.kicks-ass.net>
 <20260116151043.GA18805@lst.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116151043.GA18805@lst.de>

On Fri, Jan 16, 2026 at 04:10:43PM +0100, Christoph Hellwig wrote:
> On Fri, Jan 16, 2026 at 04:07:50PM +0100, Peter Zijlstra wrote:
> > LGTM; Steve, Christoph, does this work for you guys? Init and then lock
> > would look something like:
> 
> Please do something that works without all these messy guards that just
> obfuscate the code.

I think we're doing to have to agree to disagree on this.

Something like:

	scoped_guard (spinlock_init, &obj->lock) {
		// init
	}

is *much* clearer than something like:

	spinlock_init(&obj->lock);
	// init
	spinlock_deinit(&obj->lock);

Exactly because it has explicit scope. (also my deinit naming might not
be optimal, it is ambiguous at best, probably confusing).

Not to mention that the scope things are far more robust vs error paths.
