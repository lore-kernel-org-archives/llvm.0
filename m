Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F67823CD
	for <llvm@lists.linux.dev>; Thu, 18 Aug 2022 08:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0WDxrfmpMQZzXx9CVRCybqD/x6pT8kyfE3mZ4TXsYpg=; b=PzsrIjQqIrXWU/HCnE5RvcgMEv
	jSDsHlj/qNilblrmnmM4l0NorDTJkm6ZUS649TPpvEHnsZIwJtQesH8n1PrFnJTvwIzBxmRcOmq7m
	0WK0XyEBmp8dwK60Nj12OUsygPerCTOCKxhJYIFoPTAbUSSX3l06wXl3xRnJDXdd7sgYsBX0Nwm/y
	F57w7Px3An5LW91jqSFpmUk6ns1z9JMX9En3WOC3SAzm7Y2qCjJ/gJR7qg6LYJ4JMqImqSFWEHitM
	h9b6PxD95ZPr3rsFOpDEnR2I8StyQXpUhzf/a0edNT9e4QtKwcW8labUHDywKX9DykGXCD7l/Qkms
	rNipSmbg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=worktop.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOaSa-009Us4-AL; Thu, 18 Aug 2022 08:01:00 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
	id 604BA9801D4; Thu, 18 Aug 2022 10:00:59 +0200 (CEST)
Date: Thu, 18 Aug 2022 10:00:59 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] x86/build: Move '-mindirect-branch-cs-prefix' out of
 GCC-only block
Message-ID: <Yv3xu7f3NDC1is6o@worktop.programming.kicks-ass.net>
References: <20220817185410.1174782-1-nathan@kernel.org>
 <CAKwvOd=0R76r6YqNiOhGNt_XrA_t_ZbuBbNNdNXV4CWpDy0+Bg@mail.gmail.com>
 <Yv3uI/MoJVctmBCh@worktop.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yv3uI/MoJVctmBCh@worktop.programming.kicks-ass.net>

On Thu, Aug 18, 2022 at 09:45:39AM +0200, Peter Zijlstra wrote:

> The thing to do is boot with (warning, *very* verbose):
> 
> 	"spectre_v2=retpoline,lfence debug-alternative"
> 
> and observe that the retpoline sites all replace:
> 
> 	"cs call __x86_indirect_thunk_r11" (6 bytes)
> 
> with:
> 
> 	"lfence; jmp *%r11" (6 bytes)

		^^ call, ofc, unless the original was jmp then jmp...

/me goes get more morning juice in an attempt to wake up.

> 
> 
> This being clang, you'll ofcourse still have a few weird:
> 
> 	"Jcc.d32 __x86_indirect_thunk_r11"
> 
> sites that will not be able to be replaced, but there's nothing I can do
> about that other than to continue to encourage y'all to stop emitting
> them ;-)
