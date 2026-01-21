Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516633A4AB3;
	Wed, 21 Jan 2026 13:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769001567; cv=none; b=Tp4CvKGnVdyP8MPuI+YTiL4kSdwyQfAFYdBcLCFhxXHD+3VtLBOs9t8mzJoRrpqy0SrVjSxQulxu39hKAadYhT5XVsjmKsvUUxVlqtVQW3Lhri9aRh+RHbGCeElywA+RIBo33B+15nQi0xy86HvVDxsuUqlTVyRUssiCayeyMso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769001567; c=relaxed/simple;
	bh=T+JUEWpdofedvafdqy7cT27Mnhwxmur0AJgFPlEzJXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=djX5MhJ0IYjVCKvh8WRWV+59wqpKFSura5WWdagEnB5JO5Be31vxYYnWYRqYt11de72ZlOXzERCRnl+27mp0Sz9PmIeHdSXx/cUasIL0T6SK1yJeKqh9mnSzDte8vAKxKmX1rshUdiADR3kC9k+PvZXpXpTb/ROQh6oP1WTl6Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MT8bl5ER; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MT8bl5ER"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Nvz+/7Q/TH1hH5jeTlSsZ9RJ1SLNyONmB2AEOdVLgKQ=; b=MT8bl5ERZ4fUGCdo/hqdQEaZT0
	TQeb5BSze/iTzRAm4Cc/8TGhjuiB/xR0AerO05h3H8VfAYJ3ylcZMDRQpkO63/G0eT7KIRYZqBA51
	5SVEHFXTngnlb4fj7O8VexohOp5VH5mKbmhmVEiesUAbGklNGtllpV4f8Md6PmoXFAo7FB+75OMbn
	e+nfonxaNTwHhu68SlOzgfwTBsZi6GCBUpHTMN9putX2oW1nD2HqaKF+W6KZ6QwBZTcCXqCJMuvA9
	Rb70EKSrPcDvyRcOhQwvcRbLmwdyFxQ4sx3uHLHnHMW5IhZoGMazJ7ZIb3BQD8bYRfjQvnpwQmBsz
	IJTCK0ag==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viY7B-0000000G4Lo-1we3;
	Wed, 21 Jan 2026 13:19:17 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 77ECF3003C4; Wed, 21 Jan 2026 14:19:16 +0100 (CET)
Date: Wed, 21 Jan 2026 14:19:16 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: elver@google.com
Cc: linux-kernel@vger.kernel.org, bigeasy@linutronix.de, mingo@kernel.org,
	tglx@linutronix.de, will@kernel.org, boqun.feng@gmail.com,
	longman@redhat.com, hch@lst.de, rostedt@goodmis.org,
	bvanassche@acm.org, llvm@lists.linux.dev
Subject: Re: [RFC][PATCH 4/4] futex: Convert to compiler context analysis
Message-ID: <20260121131916.GA171111@noisy.programming.kicks-ass.net>
References: <20260121110704.221498346@infradead.org>
 <20260121111213.950376128@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121111213.950376128@infradead.org>

On Wed, Jan 21, 2026 at 12:07:08PM +0100, Peter Zijlstra wrote:
> +extern void futex_q_lock(struct futex_q *q, struct futex_hash_bucket *hb)
> +	__acquires(&hb->lock)
> +	__acquires(q->lock_ptr);

FWIW, this 'weirdness' is because the thing cannot tell they are the
same lock and we use both forms. It's a bit tedious but that's what it
is.
