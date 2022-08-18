Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B874223CD
	for <llvm@lists.linux.dev>; Thu, 18 Aug 2022 07:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tLLdKjSCJRC+vP99t9laGlDxTpzb+Y2hawi2yEGQHoY=; b=DxvB782bdMt4YPoWhPSqG2Qahw
	uM99RITzm8rg80D342oc1E1gBAu6BsggGXTerUFFcrDB6TY5Ksh2XKqJfT1FHQAMi5/zazAX/5ZKb
	tNDwEge1hVCwgZFxrpLGsRxlCdVPtJWIpuY58OkX9MMKSZBLyHWqXYh/n1pQwpLMJ2Mw1TdnQWTZy
	7JRjbl2ktCno6SOUP3GA1/LXROemZkqiO1t3OANlvVeNnv1ZBXSx7jTa2mhE4VH6F3dfQ0HqUf0uz
	FH3YxQ/PD72+o1WsfmtQfl3BrCNoIeMzzth41Gqjd815EHeWfRxDyWiqw9gN2Vlbwvc+y2uaasB2J
	pOMCboUg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=worktop.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOaDk-003WSg-SB; Thu, 18 Aug 2022 07:45:41 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3313D980135; Thu, 18 Aug 2022 09:45:39 +0200 (CEST)
Date: Thu, 18 Aug 2022 09:45:39 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] x86/build: Move '-mindirect-branch-cs-prefix' out of
 GCC-only block
Message-ID: <Yv3uI/MoJVctmBCh@worktop.programming.kicks-ass.net>
References: <20220817185410.1174782-1-nathan@kernel.org>
 <CAKwvOd=0R76r6YqNiOhGNt_XrA_t_ZbuBbNNdNXV4CWpDy0+Bg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOd=0R76r6YqNiOhGNt_XrA_t_ZbuBbNNdNXV4CWpDy0+Bg@mail.gmail.com>

On Wed, Aug 17, 2022 at 03:08:01PM -0700, Nick Desaulniers wrote:
> On Wed, Aug 17, 2022 at 11:56 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > LLVM 16 will have support for this flag so move it out of the GCC-only
> > block to allow LLVM builds to take advantage of it.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1665
> > Link: https://github.com/llvm/llvm-project/commit/6f867f9102838ebe314c1f3661fdf95700386e5a
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> 
> Thanks for the patch, I also boot tested this (in virtual guests for
> both 64b and 32b).
> 
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>
> 
> Peter, is there anything else special about these prefixes needed to
> make use of them?

The thing to do is boot with (warning, *very* verbose):

	"spectre_v2=retpoline,lfence debug-alternative"

and observe that the retpoline sites all replace:

	"cs call __x86_indirect_thunk_r11" (6 bytes)

with:

	"lfence; jmp *%r11" (6 bytes)


This being clang, you'll ofcourse still have a few weird:

	"Jcc.d32 __x86_indirect_thunk_r11"

sites that will not be able to be replaced, but there's nothing I can do
about that other than to continue to encourage y'all to stop emitting
them ;-)
