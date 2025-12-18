Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041F32D838B;
	Thu, 18 Dec 2025 09:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766049910; cv=none; b=r0v/1UI9dMUWd7158vgrSVcsIRAidZ8IaIYXqsZ4TKZMyMFhbv3npfT1KdZFUTXcdf39zncHK4M8q5kkeZ1oGnn4cgidloV9v8dI/oG1bl5uFA8xrm49zaCEIV/oYDfO7JyDXxJcE5OpL61nz0gW4UTaEWfMloZf7UZqtYVS4bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766049910; c=relaxed/simple;
	bh=GF7KacbqyZLTBEX42FLwY15XTjvjdsP8fBjtCf2aH2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rlH3dxWERwzmu1kK2UimTjWhRZq/Jema0oAx0qyJH/j7jBF5x2mpHCKVbe4EJPz7Oe1ZaMeCVZDaMfqoMpUY+U20gmhE9KTiSOO+W+y52UbQWRTjh9A9dBKRmGc904D6th3oCvoFAoHii52a9TB4NGMPpBcHDcGAChPBjrh8FJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eb0JYMQD; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eb0JYMQD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aluHAMJsVKd6FNX6fUQBpqcXdYNXA/U4mDlhQLutkcs=; b=eb0JYMQDGclZEa1/VsuN2yAQLs
	fBHafpl8swnHTTENhtSRebstjNKF3ob5vGv6VpBTnaxMCOWCfPEMtnKGkGlPKNGSAbtmus2wBT5yZ
	RI7fI+xFbX+So9QlX1+I7iYrheSoSzfr0ktkxrQ/tgrIbfF/gvLt84qnESV8De502L77hNsauVirg
	3nt2/7irARI48FXPBk4KNUC2R09LahPmuTu9bj9dTEVkK0mXtsrB+gk9p25oExIIdfjZf6a01bP1Z
	WL7wg346AU6HCO0e1NX9rwGYlCMufMGQPAXj/XGpxXdpjVDNXIqqFPCIzEs3IShNRBBe7xfXjdud2
	3mFKinaQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9OC-00000008SD8-1oU0;
	Thu, 18 Dec 2025 08:29:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 75F1B30056B; Thu, 18 Dec 2025 10:24:39 +0100 (CET)
Date: Thu, 18 Dec 2025 10:24:39 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Brendan Jackman <jackmanb@google.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Marco Elver <elver@google.com>, Ard Biesheuvel <ardb@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v3 1/3] kasan: mark !__SANITIZE_ADDRESS__ stubs
 __always_inline
Message-ID: <20251218092439.GL3707891@noisy.programming.kicks-ass.net>
References: <20251216-gcov-inline-noinstr-v3-0-10244d154451@google.com>
 <20251216-gcov-inline-noinstr-v3-1-10244d154451@google.com>
 <20251216130155.GD3707891@noisy.programming.kicks-ass.net>
 <DF0JIYFQGFCP.9RDI8V58PFNH@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DF0JIYFQGFCP.9RDI8V58PFNH@google.com>

On Wed, Dec 17, 2025 at 01:53:33PM +0000, Brendan Jackman wrote:
> On Tue Dec 16, 2025 at 1:01 PM UTC, Peter Zijlstra wrote:
> > On Tue, Dec 16, 2025 at 10:16:34AM +0000, Brendan Jackman wrote:
> >> The x86 instrumented bitops in
> >> include/asm-generic/bitops/instrumented-non-atomic.h are
> >> KASAN-instrumented via explicit calls to instrument_* functions from
> >> include/linux/instrumented.h.
> >> 
> >> This bitops are used from noinstr code in __sev_es_nmi_complete(). This
> >> code avoids noinstr violations by disabling __SANITIZE_ADDRESS__ etc for
> >> the compilation unit.
> >
> > Yeah, so don't do that? That's why we use raw_atomic_*() in things like
> > smp_text_poke_int3_handler().
> 
> Right, this was what Ard suggested in [0]:
> 
> > For the short term, we could avoid this by using arch___set_bit()

arch_set_bit(), right?

> > directly in the SEV code that triggers this issue today. But for the
> > longer term, we should get write of those explicit calls to
> > instrumentation intrinsics, as this is fundamentally incompatible with
> > per-function overrides.
> 
> But, I think the longer term solution is actually now coming from what
> Marco described in [1].

Oh, shiny. But yeah, that is *LONG* term, as in, we can't use that until
this future CLANG (and GCC?) version becomes the minimum version we
support for sanitizer builds.

> So in the meantime what's the cleanest fix? Going straight to the arch_*
> calls from SEV seems pretty yucky in its own right.

This is what I would do (and have done in the past):

 14d3b376b6c3 ("x86/entry, cpumask: Provide non-instrumented variant of cpu_is_offline()")
 f5c54f77b07b ("cpumask: Add a x86-specific cpumask_clear_cpu() helper")

Now, I don't have much to say about SEV; but given Boris did that second
patch above, I'm thinking he won't be objecting too much for doing
something similar in the SEV code.

> Adding special
> un-instrumented wrappers in bitops.h seems overblown for a temporary
> workaround. 

Agreed.

> Meanwhile, disabling __SANITIZE_ADDRESS__ is something the
> SEV code already relies on as a workaround, so if we can just make that
> workaround work for this case too, it seems like a reasonable way
> forward?

I'll defer to Boris on that, this is his code I think.

> Anyway, I don't feel too strongly about this, I'm only pushing back
> for the sake of hysteresis since I already flipflopped a couple of times
> on this fix. If Ard/Marco agree with just using the arch_ functions
> directly I'd be fine with that.

Yeah, fair enough :-)

> And in the meantime, I guess patch 3/3 is OK? 

I'm not sure, ISTR having yelled profanities at GCOV in general for
being just straight up broken. And people seem to insist on adding more
and more *COV variants and I keep yelling at them or something.

That is GCOV, KCOV and llvm-cov are all doing basically the same damn
thing (and sure, llvm-cov gets more edges but details) and we should not
be having 3 different damn interfaces for it. Also, they all should
bloody well respect noinstr and if they don't they're just broken and
all that :-)

That is, I'd as soon just make them all "depend BROKEN" and call it a
day.

