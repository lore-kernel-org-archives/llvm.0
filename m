Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7AC809
	for <llvm@lists.linux.dev>; Mon, 24 Oct 2022 11:24:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22B21D6E;
	Mon, 24 Oct 2022 04:24:22 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.7.186])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F3BF3F7B4;
	Mon, 24 Oct 2022 04:24:13 -0700 (PDT)
Date: Mon, 24 Oct 2022 12:24:11 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fangrui Song <maskray@google.com>,
	Joao Moreira <joao@overdrivepizza.com>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Sami Tolvanen <samitolvanen@google.com>
Subject: Re: kCFI && patchable-function-entry=M,N
Message-ID: <Y1Z12xuY9fDaHuCm@FVFF77S0Q05N>
References: <Y1LBGZPMfCZ8A1bl@FVFF77S0Q05N>
 <Y1QEzk/A41PKLEPe@hirez.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1QEzk/A41PKLEPe@hirez.programming.kicks-ass.net>

On Sat, Oct 22, 2022 at 04:57:18PM +0200, Peter Zijlstra wrote:
> On Fri, Oct 21, 2022 at 04:56:20PM +0100, Mark Rutland wrote:
> > Hi,
> > 
> > For arm64, I'd like to use -fatchable-function-entry=M,N (where N > 0), for our
> > ftrace implementation, which instruments *some* but not all functions.
> > Unfortuntately, this doesn't play nicely with -fsanitize=kcfi, as instrumented
> > and non-instrumented functions don't agree on where the type hash should live
> > relative to the function entry point, making them incompatible with one another.
> > AFAICT, there's no mechanism today to get them to agree.
> > 
> > Today we use -fatchable-function-entry=2, which happens to avoid this.
> 
> > ... but I understand that for x86, folk want the pre-function NOPs to
> > fall-through into the body of the function.
> 
> Yep.
> 
> > Is there any mechanism today that we could use to solve this, or could we
> > extend clang to have some options to control this behaviour?
> 
> So the main pain-point for you is differentiating between function with
> notrace and those without it, right?
> 
> That is; suppose you (like x86) globally do:
> -fpatchable-function-entry=4,2 to get a consistent function signature,
> you're up a creek because you use the __patchable_function_entries
> section to drive ftrace and now every function will have it.
> 
> So perhaps something like:
> 
>  -fpatchable-function-entry=N,M,sectionname
> 
> would help, then you can have notrace be the same layout, except a
> different section. Eg. something like:
> 
>  #define notrace __attribute__((patchable_function_entry(4,2,__notrace_function_entries)))

FWIW, I think that'd work for me, and that was roughly my original proposal on
IRC. My only concern with this approach is code size, since all uninstrumented
functions gain some point less prefix NOPs.

We can make that slghtly better as:

#define notrace __attribute__((patchable_function_entry(2,2,__notrace_function_entries)))

... since we don't care about placing NOPs *within* the function

> It does make the whole: CFLAGS_REMOVE_file.o = $(CC_FLAGS_FTRACE)
> a bit of a pain, but I've long favoured removing all that and having
> explitic notrace attributes on all relevant functions.
> 
> Then again; perhaps it could be made to work by ensuring CFLAGS starts
> with:
> 
>  -fpatchable-function-entry=4,2,__notrace_function_entries
> 
> and have CC_FLAGS_FTRACE include (and hence override with)
> 
>  -fpatchable-function-entry=4,2,__ftrace_function_entries
> 
> assuming that with duplicate argument the last is effective.

TBH, it'd be nice to move ftrace to the `CFLAGS_WHATEVER_obj.o := n` approach
the other instrumentation uses, which IIUC would allow us to define different
flags for the two cases (though I'll need to go check that).

Thanks,
Mark.
