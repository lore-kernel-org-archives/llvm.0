Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB027219319;
	Thu, 15 Jan 2026 21:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768512796; cv=none; b=Tsl8ACeZM1Wl6VPYA9v93Uip75MS9P0gvCu1s90Q49pPZIf65bntuLPHCpnwXy7uNe+w/9t/zuAMmtUAgS3BmizrYvr3tXe7morEsQnkXX0pUYPpFfQvonapRwZgMWewPFqMvvzDS7w4tlyCL+7M3ELkrDrlz0h16VjiGmt6myk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768512796; c=relaxed/simple;
	bh=JScoQcy6wtl7AADX0uNHBhe2UMB/RjpGkd5i3A7y/rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMCBGfyGhyN8cq0T3x/EQ+NwNBcK7gqtLINgTovs3JLERJkvjYk///0bJXDV0X55KkglP67pYfsHvUPwR1eJ8c3AIBKxLKISz2ii8K6nipiCp+PPOKHPuj5VOESjxNBs/yLALvOoFZxO8ngigsfcXXn2CM9G/owPlw7vCbfstcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=moRZfRNC; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="moRZfRNC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JScoQcy6wtl7AADX0uNHBhe2UMB/RjpGkd5i3A7y/rc=; b=moRZfRNCOrFWvbfL0FLmX+1YTf
	oa6xPUO6HCoDyJYLQmE1kkbBTDu2VozinohNDTwZ5lr8phfEprLMJNzgDDQLkZEnaoCtlCmbWAkPR
	WvwIQ6zTd746xVg11TCvXxIrcFDdDKL/ikoqenWcoatfmRzG6Cf2NwMSVCavkqiG9BjNgGFZv44LM
	aCKAP8QUv6y0uY7wzwhIYwrO56BKwQazIwEMGfeuCfIajyeC7v0txy8jERA6lKZ1dK0HhjZy57ciL
	gAvYWjnpf5CmEMMLK2lxddz7EuTbVglBL0ePSJegGUBPQ3aUsiaoqZql3QJIz7pHijRqPH8ro9ShR
	BiOo/tqQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgUxs-00000008UV6-04Vs;
	Thu, 15 Jan 2026 21:33:12 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5C8E13003C4; Thu, 15 Jan 2026 22:33:11 +0100 (CET)
Date: Thu, 15 Jan 2026 22:33:11 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Marco Elver <elver@google.com>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH tip/locking/core] compiler-context-analysis: Support
 immediate acquisition after initialization
Message-ID: <20260115213311.GG830755@noisy.programming.kicks-ass.net>
References: <20260115005231.1211866-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115005231.1211866-1-elver@google.com>

On Thu, Jan 15, 2026 at 01:51:25AM +0100, Marco Elver wrote:

> Longer-term, Peter suggested to create scoped init-guards [1], which
> will both fix the issue in a more robust way and also denote clearly
> where initialization starts and ends. However, that requires new APIs,
> and won't help bridge the gap for code that just wants to opt into the
> analysis with as little other changes as possible (as suggested in [2]).

OTOH, switching to that *now*, while we have minimal files with
CONTEXT_ANALYSIS enabled, is the easiest it will ever get.

The more files get enabled, the harder it gets to switch, no?
