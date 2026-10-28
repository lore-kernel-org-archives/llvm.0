Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793195506;
	b=k3qYWuI6bhlyWqIJ4to0UMqFRm0SUzQxcltjLtcQfScUAGh5iF0tOnCMp6Ka/gpZiFKR
	 NYf4PdNYbR1jEqsyDBEQipYrEzcIL714VRaPAEj8cNtXNt7xHVXnAkV07nAXbnXq15sZp
	 SWk9aiGHZVBXTT/R3W/ScDx7Wnoif80VGgqtaw5QgHbiuYr8chJRZvxdZarpMR2nU49im
	 cNb5c2UmOHmMJAxabNnKnv68sxbx6xf4wdQLurXY3w6v5MCC3ivjBzQt735emp4aYS7En
	 95qiDW2A7J867bv09nDfFMtWGNJg/Xx7RiM3/BNTY04awoqoxw0ib0ES1Hm7amLx0Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195506;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=zQlXmXYTkgfNOfmm6yNdecZYQl94g3efh2/fiLodwH0=;
	b=lGAiWILDkhSyAfhT7uePqvVL4Yo5t2vbwzy5gUXVCO0uYyw89q7la8b8zli7FnAJZZ8H
	 dbTimv4369XOy6o4KH07PAr08z44YgzYXniQVqwIYZsvQTWhwkonktBwKZInk8AqPGPW7
	 5RFcZFfkKaLuJ/a1HXrdh1x730w5EuE8+79mieJXlCDm5OTAC+MDLYheAJhpoONzCwCX6
	 Jlc7E7xEjcKCzGowii4f77dfUAUOXi2/pcbDemzHYMQQpp7YFKouiPhzFHCuMBfUKk8Oi
	 f6MMODzYZDPM+dkK6MSYa0azkYmHYJj/Hj7IKz97lCpSB3lBga9KcTMFgCIP8MPq0/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=GX+boivv;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AEC606A320;
	Wed, 28 Oct 2026 13:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72AEC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=GX+boivv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zQlXmXYTkgfNOfmm6yNdecZYQl94g3efh2/fiLodwH0=; b=GX+boivv95JPabLTQ7+d3I0KeJ
	+5/Ho5KK307hq2afJ98ij+CKvzWSkWPpYnSnJg+u0gTNE3XGTGnT9fTlOu2tgcU2QGtHMxxCzIp8V
	NwulC69cHzzCZfKKywbsqkm+jAmCY5oAhGM4zqtd0ie2g0JDecdDb9OhmTKweanoqWi/g8aY+B56m
	eW7EqzyM9fWJefNBgFFf/U6ww/o6b+bf7p1H0XqGhuRbnvE1sXNfTAruu69yzUC0BesSvvK/Ox8US
	tKg2H+V/oIHBa1Nq7yjKxTXJsL5dmvZ031Fdgjtq9SQbyAF0ya2K3afZEmjtmof+DdpqeQlIsXQm5
	o2QvF/vw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM445-0000000G1q5-0rPP;
	Wed, 28 Oct 2026 13:51:41 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3F552302F53; Wed, 28 Oct 2026 14:51:40 +0100 (CET)
Date: Wed, 28 Oct 2026 14:51:40 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, Bill Wendling <morbo@google.com>,
	Chuck Wolber <chuck@wolber.net>,
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Thomas Gleixner <tglx@kernel.org>, wentaoz5@illinois.edu,
	chuck.wolber@boeing.com, steven.h.vanderleest@boeing.com
Subject: Re: [RFC PATCH 04/20] compiler_types.h: Don't instrument
 __always_inline functions for coverage
Message-ID: <20261028135140.GR2668564@noisy.programming.kicks-ass.net>
References: <20261028120034.871983-1-sashal@kernel.org>
 <20261028120034.871983-5-sashal@kernel.org>
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
In-Reply-To: <20261028120034.871983-5-sashal@kernel.org>

On Wed, Oct 28, 2026 at 07:59:28AM -0400, Sasha Levin wrote:
> noinstr code may only call other noinstr functions and __always_inline
> functions. gcov and Clang's source-based code coverage insert their
> instrumentation before inlining, so the instrumentation of an
> __always_inline function ends up in every noinstr function it gets
> inlined into. With Clang's source-based coverage on x86, 2500 of the
> 3449 relocations in .noinstr.text and 333 of the 451 in .cpuidle.text
> of vmlinux.o point to coverage counters or MC/DC bitmaps. GCC's gcov
> does the same. Since these are plain memory updates rather than calls,
> objtool's noinstr validation doesn't notice them.
> 
> KCOV doesn't have this problem, as it instruments the code after
> inlining and checks the attributes of the function that the code ends
> up in.
> 
> Make __always_inline imply __no_profile when a code coverage
> measurement implementation is enabled, so that no noinstr code carries
> coverage instrumentation. The cost is that __always_inline functions
> don't show up in the coverage data at all, including at their callers
> outside of noinstr code. For an x86_64 configuration built with Clang 22
> and MC/DC, that removes 556 of 60788 functions (0.9%), 29261 of 1598305
> regions (1.8%), 11067 of 591108 branches (1.9%) and 445 of 36561 MC/DC
> conditions (1.2%) from the coverage data.

This is pretty vile. But also, since people were trying to use MC/DC for
validation efforts and the like, how does this impact them? If I
understand correctly their previous emails on the topic, this means they
have to go manually audit every single __always_inline function.

Now; I understand this is a tool limitation and there really must not be
instrumentation in noinstr code, since that can run before things like
page-tables are complete (consider the PTI case). So this is the best
option.

Still, I'm left wondering if these tools should be fixed. For instance,
while the front-end emits this instrumentation, the backend could easily
remove it again when it finds itself in the context of a noinstr
function after inlining.

> Leave unoptimized objects alone: GCC refuses to inline an
> __always_inline function across a no_profile_instrument_function
> mismatch at -O0, and those objects don't contain noinstr code.

We have -O0 code? I thought we hard relied on building with at least
-O1, we often get 'fixes' to enable code to build with -O0.

> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  include/linux/compiler_types.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
> index c5921f1390079..c3298d29a9425 100644
> --- a/include/linux/compiler_types.h
> +++ b/include/linux/compiler_types.h
> @@ -246,6 +246,19 @@ struct ftrace_likely_data {
>   */
>  #define __inline__ inline
>  
> +/*
> + * noinstr code may only call noinstr and __always_inline functions. Code
> + * coverage instrumentation is added before inlining, so the counters of an
> + * __always_inline function would end up in the noinstr code it gets inlined
> + * into: don't instrument __always_inline functions. GCC refuses to inline
> + * across a no_profile_instrument_function mismatch without optimization, so
> + * leave the rare unoptimized objects alone; they don't contain noinstr code.
> + */
> +#if defined(CONFIG_COVERAGE_KERNEL) && defined(__OPTIMIZE__)
> +#undef __always_inline
> +#define __always_inline inline __attribute__((__always_inline__)) __no_profile
> +#endif
> +
>  /*
>   * GCC does not warn about unused static inline functions for -Wunused-function.
>   * Suppress the warning in clang as well by using __maybe_unused, but enable it
> -- 
> 2.53.0
> 
