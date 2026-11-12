Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794496356;
	b=WBWT8WckCB0jtNQqET/7S3m+429mr0HoBbliRsdjjX0hFUS9WpwNt/DUP3uYAvPhZmKp
	 m4ODp1SxWyS73d5olcigRm3aT3z79KBenU9Ibut7jw+SqW6kITxUy3aCbjTF8h2m71zre
	 Wn9StbhnJWkrTtcGd9c6a5Kxjl9oF+jCsTT/dJGc1Wk2diwubynD5gfpZNwxZATitbi1i
	 /H/wdJD3ym6lj6gvyn2qK1rRaJckFhJlTiYF48qhW94kCh1xnxyq2tW0RJUgGrYs3K6IZ
	 wo6myz6eHwT1qOBFCQWS0qtlRLRSVX8XsEwj23wluQ6/S5yaMi8n83p/PI6lv6yFZMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496356;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=gtVkBlvFQktBxgCq3bojJxltgCL/Hti9FLaVI1V2PsA=;
	b=tzW51VnrOWEtWOFkrvXIFpMwN5vue8w9nr2ToKpPbuj55IghIWBDDur8dC4n/YHeeyH9
	 dNWY3U/0d1QDq4WlfYCjd8bTn+YemIa5NftgDopYRGlbZJqQaDEoPCtlxeqCNZ52VcAf0
	 iIhGkFd8XZTR3SKvtcWCP1EqyROGNvmu4D2UQV+njKN7jw6x/Lfj3qhpqMd1NjeMRSr2L
	 pQ4Y5I5G1NfuGIHF7yhYJmKjWxfDY5OH6DTYKKCv5g2HaiaeoJtfH91HbEAseh/8IY3Gx
	 IIIut+sQJNnKgQUb5/gA6n2K0sohWfmjrpV/W1Ae1lRTs5ArizFR5q7f48KQlIlZEdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=gdEZytJc;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B78606A31C;
	Thu, 12 Nov 2026 15:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34B78606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=gdEZytJc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gtVkBlvFQktBxgCq3bojJxltgCL/Hti9FLaVI1V2PsA=; b=gdEZytJc8EP4NEsBqnHhn81oHe
	EI9WEbQoa4/R7nxVJzDMk4V6pekwiTxzpn5b41CY7eqCQ3GwmXXfLT3DcXNTU8JiBJ25IOwOD+Z3x
	7YkUlPVUn9xvvfzqBYrqI2mBol/70/AXg5Rmp4mLSxjcgUQQ/sQyRwbEW8i+hvm/h46YpRgL82mty
	xgvRg2ZGA+RXfvWH+Fjh8SANOYKrrKi7BkSQgnwiIChCjBH5+k1uf1wVNNU99cQxTTsJvY/AqINZw
	DQ3D+fxuc4dwxSxSrbES7rPGA2jw2dYLNd8lWouElJNCdKFEhqjJQnLT/+EbNfHWCbkD/k4SPp/uR
	EZjaZlDQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWTZ-0000000AU0k-3NgD;
	Thu, 12 Nov 2026 15:12:34 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id BEFA130057E; Thu, 12 Nov 2026 16:12:32 +0100 (CET)
Date: Thu, 12 Nov 2026 16:12:32 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org,
	Bill Wendling <morbo@google.com>, Chuck Wolber <chuck@wolber.net>,
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH v2 11/20] objtool: Detect code coverage instrumentation
 in noinstr code
Message-ID: <20261112151232.GC1813469@noisy.programming.kicks-ass.net>
References: <20261103015238.3780910-1-sashal@kernel.org>
 <20261103015238.3780910-12-sashal@kernel.org>
 <avVaaxKUA2ArB6RG@jpoimboe>
 <20261112130906.1316655-1-sashal@kernel.org>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112130906.1316655-1-sashal@kernel.org>

On Thu, Nov 12, 2026 at 08:09:06AM -0500, Sasha Levin wrote:
> On Wed, Nov 11, 2026 at 10:23:41PM -0800, Josh Poimboeuf wrote:
> >What exactly is the problem with noinstr code incrementing counters
> >inline?
> 
> The counter is a memory write, and a memory write can trap. In noinstr
> code that can happen before we're ready to take another exception.
> 
> With GCOV_PROFILE_ALL today, exc_debug_kernel() bumps a counter before
> it clears DR7. Set a watchpoint on that counter and the next kernel #DB
> never returns, it just keeps re-entering the handler. I tried it on
> v7.4-rc1 in a VM and it hangs.
> 
> noinstr is already supposed to keep these out, it has had __no_profile
> for years. But that doesn't cover what gets inlined into it, and nothing
> checks. This patch adds the check.

Right, strictly speaking this is a toolchain bug, but since we need to
build with existing tools we need to bodge it somewhat :/
