Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794508907;
	b=K1PcW2VTMf8kDNq+9A20b/esdSDk0B8xNvJSX2KbgvceYXQyvPrqmTv19407dZtqKGa6
	 x6hpSiObmi0PaT6EZhPhLZlTCIZ+ymxPBILroBJL6rx4bsukQAMOhKAD31F/K/++ROc9S
	 8wn9lbdtwm8GQzS6dTgFIHyhLDgQIrQlJJavVxEx72viGapT4L8i3x6ytcZQeVaNDjgzX
	 GDUO2IIeCvtvVY4yxd7q1iH9PU2prGWaxRd/P9PQF4IcICn5QyQSoYYvVvptFyw/JzMfx
	 pdEKM2/yWnU8a/CQSH+wZCzOQjuS7SFkZEO/pPz+2x7hBYTNyOvixg/9iq6FkoPXEPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794508907;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=uKte4CtByEWrwTYULhwBK4b7aFl3/6Hqc7HDqY8kXtw=;
	b=luGwckQ9LydSDgU6BmCmtEFryxjBrWCEa2bHKcqMplre/beW//j7AwgZ/QpQ9ccjtqYo
	 ho61w/wThdulQ9L5PT1uXoCxgQbCBImBcar8/PLlIQQPDGlce58dZmKS+hOPpVHZoAL/v
	 Gy3kbyj+l+Ot7o2Um+apMZIGdX8vQDGrkMHMEGE1M7gK3JHyxyubsPswyLgnewUdQdUKw
	 yAdH+0tlGLkLazkROX7MgvK1piDsrMv+VkLOX+gnOf9AQpP1NuWXwZsDwK4zL5dBhfRuQ
	 9JZKyJT2pmJ9P0B1EGqNdCTSMlckUMPuzP2VCPIbmKT5E4588a5WqOFkWM5TvSsIkHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lj6z2FNF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BF8606A321;
	Thu, 12 Nov 2026 18:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lj6z2FNF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0BF51F000C4;
	Thu, 12 Nov 2026 18:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794508906;
	bh=uKte4CtByEWrwTYULhwBK4b7aFl3/6Hqc7HDqY8kXtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lj6z2FNFWZJkDlPa2WxqtQHTtCW0k/kBJZc7p0xl9dR91p14rENz46YoEiprrsUCZ
	 A8iMoCaM8199AKGQArddP0fkuU5kgNKx3J1RLHm+kDZb0Chi4sE7lVPxFAqp4nhbQ+
	 A0BchT8X6J84Kx75avf3Mud5fw7YCUYbW9vwfknZkUafj4akJzl7Wv3jmsGuQ5rSoV
	 4u5OpUbvtxwBpe0g/yCI4WVj8xznHQvZojKfefM9hpiTd+vjnhMixaAfh7zI3WpAdW
	 UvmesHs8lwAn6qOp87rc6I+lJ4Jb5S7PQQUtoiONwlxJi2Vwzot80sPJepr9P/PHg8
	 m5NkzA5Weawqw==
Date: Thu, 12 Nov 2026 10:41:44 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
	Bill Wendling <morbo@google.com>, Chuck Wolber <chuck@wolber.net>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, Marco Elver <elver@google.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH v2 11/20] objtool: Detect code coverage instrumentation
 in noinstr code
Message-ID: <avX80WkCFuGyS1y0@jpoimboe>
References: <20261103015238.3780910-1-sashal@kernel.org>
 <20261103015238.3780910-12-sashal@kernel.org>
 <avVaaxKUA2ArB6RG@jpoimboe>
 <20261112130906.1316655-1-sashal@kernel.org>
 <20261112151232.GC1813469@noisy.programming.kicks-ass.net>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261112151232.GC1813469@noisy.programming.kicks-ass.net>

On Thu, Nov 12, 2026 at 04:12:32PM +0100, Peter Zijlstra wrote:
> On Thu, Nov 12, 2026 at 08:09:06AM -0500, Sasha Levin wrote:
> > On Wed, Nov 11, 2026 at 10:23:41PM -0800, Josh Poimboeuf wrote:
> > >What exactly is the problem with noinstr code incrementing counters
> > >inline?
> > 
> > The counter is a memory write, and a memory write can trap. In noinstr
> > code that can happen before we're ready to take another exception.
> > 
> > With GCOV_PROFILE_ALL today, exc_debug_kernel() bumps a counter before
> > it clears DR7. Set a watchpoint on that counter and the next kernel #DB
> > never returns, it just keeps re-entering the handler. I tried it on
> > v7.4-rc1 in a VM and it hangs.
> > 
> > noinstr is already supposed to keep these out, it has had __no_profile
> > for years. But that doesn't cover what gets inlined into it, and nothing
> > checks. This patch adds the check.
> 
> Right, strictly speaking this is a toolchain bug, but since we need to
> build with existing tools we need to bodge it somewhat :/

I must be missing something, if somebody sets a watchpoint in
exc_debug_kernel(), don't they get to keep the pieces?

It's also not clear why --hack-noinstr can't be extended to either NOP
out the affected instructions, or change the address relocation to point
to a dummy variable that won't trap.

And the changelog needs all that background, as the justification is not
clear at all (to me).

-- 
Josh
