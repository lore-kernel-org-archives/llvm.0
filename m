Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793196084;
	b=rejEPYcwdx5agOdSsl9drHObOX+Lhqu4B6ihkTucH0LPxV8LOd8dnFOB9uAd+MJ2JWlq
	 G8LVcbdBF5dpcHAXYB7MIvnwcJ0FdAg/8hGD4GFXReNbq2oTjGbeRB7ER98Jm83A9aYTo
	 0hyW7W99aHu0i36sNdFlGHhuWwzw2D1NxQnj6t6qg6ZU78YtwfP2EPqBdUwC+S+xxDyUT
	 3jxcckzaAZyl8vCVwaXHnfSptYfv5qjFHOyHCWbXF2A/9lD14zDfvaqeGiORXboCp9Ult
	 //gtkdlvq7KNwuaZDFDGQmcFP3+lmT+COPQBNFgJy3Sv7PTXvkAdPoP/XdtM7ku7Hqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793196084;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=7oKYpNLC6QpjoQHhArnb4nSVmzireQmey97xX/rrfrI=;
	b=ZJVK2DWHVYC0h9GX48T+8meQr3brzdsnDPYdZeTZfT99nO3RKg48VnBRfuR5xDq7P8VG
	 Nj6rFsBgsjhrZ9jFMhHGoad3N3Aa1qJCPmF+vqoSvTsp533/4QHeLXtZHUTFkefPpNwpB
	 r964oFd+BbeWkvDv0+4CnRg4ENeLxe5B01o4ZSmFLyU3sPb643ob+i8HF3VZqKgSG51od
	 6Ws6yuTVBU7b/DMoBm9AwTmAp74Vdeb4bZ5uc4a/HsElxm0FFBezQbYRjRogxKjz4qHRv
	 Mj5atmnoXFbp1X0qNMA5QvusPCPD4c/Cd5EZUTZUuTicIX4AugVZ00NLnaG0K123CXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=M7pVidc1;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88238606A31A;
	Wed, 28 Oct 2026 14:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88238606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=M7pVidc1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7oKYpNLC6QpjoQHhArnb4nSVmzireQmey97xX/rrfrI=; b=M7pVidc11VHTsqY0TikHhmXRpC
	kW90g1tsdnBPcIYInzBcLFsvOqBPhBp9P32B4e6VAWf87lPahDXbcnQvgndK8nhEZQU+J1Ksvxna4
	KsRKaKVTGiQzLKbckEJPdpWTz+2aMb26CRp0otJDgjnb8PdKiS1qncecV8zMNcQANJYrEQ2ih7Qee
	q9zhYVR+qQGJ8aPZQOHquMau5d1k0Fbb3ZhXX8zRFQ7ZYw4qqfXJ/7y2P+00xLrmgtItCHD0S8KzD
	5C/FMJoxjF9p4wJau+ZEhFNjlsREq0BqIxwoS78k7o5dSFdPsB6EWM4rS3jzCoHhtV9vAyuq73pVP
	5lBTXDWQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4DP-00000003uVU-08eA;
	Wed, 28 Oct 2026 14:01:19 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9518930030F; Wed, 28 Oct 2026 15:01:18 +0100 (CET)
Date: Wed, 28 Oct 2026 15:01:18 +0100
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
	chuck.wolber@boeing.com, steven.h.vanderleest@boeing.com,
	Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [RFC PATCH 04/20] compiler_types.h: Don't instrument
 __always_inline functions for coverage
Message-ID: <20261028140118.GB2669272@noisy.programming.kicks-ass.net>
References: <20261028120034.871983-1-sashal@kernel.org>
 <20261028120034.871983-5-sashal@kernel.org>
 <20261028135140.GR2668564@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20261028135140.GR2668564@noisy.programming.kicks-ass.net>

On Wed, Oct 28, 2026 at 02:51:40PM +0100, Peter Zijlstra wrote:
> On Wed, Oct 28, 2026 at 07:59:28AM -0400, Sasha Levin wrote:
> > noinstr code may only call other noinstr functions and __always_inline
> > functions. gcov and Clang's source-based code coverage insert their
> > instrumentation before inlining, so the instrumentation of an
> > __always_inline function ends up in every noinstr function it gets
> > inlined into. With Clang's source-based coverage on x86, 2500 of the
> > 3449 relocations in .noinstr.text and 333 of the 451 in .cpuidle.text
> > of vmlinux.o point to coverage counters or MC/DC bitmaps. GCC's gcov
> > does the same. Since these are plain memory updates rather than calls,
> > objtool's noinstr validation doesn't notice them.
> > 
> > KCOV doesn't have this problem, as it instruments the code after
> > inlining and checks the attributes of the function that the code ends
> > up in.
> > 
> > Make __always_inline imply __no_profile when a code coverage
> > measurement implementation is enabled, so that no noinstr code carries
> > coverage instrumentation. The cost is that __always_inline functions
> > don't show up in the coverage data at all, including at their callers
> > outside of noinstr code. For an x86_64 configuration built with Clang 22
> > and MC/DC, that removes 556 of 60788 functions (0.9%), 29261 of 1598305
> > regions (1.8%), 11067 of 591108 branches (1.9%) and 445 of 36561 MC/DC
> > conditions (1.2%) from the coverage data.
> 
> This is pretty vile. But also, since people were trying to use MC/DC for
> validation efforts and the like, how does this impact them? If I
> understand correctly their previous emails on the topic, this means they
> have to go manually audit every single __always_inline function.
> 
> Now; I understand this is a tool limitation and there really must not be
> instrumentation in noinstr code, since that can run before things like
> page-tables are complete (consider the PTI case). So this is the best
> option.
> 
> Still, I'm left wondering if these tools should be fixed. For instance,
> while the front-end emits this instrumentation, the backend could easily
> remove it again when it finds itself in the context of a noinstr
> function after inlining.

Ah, also, we have objtool's hack_noinstr :/ But sssh, don't tell Josh
about that.
