Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0055572
	for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 18:52:15 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4AF6761027;
	Thu, 14 Oct 2021 18:52:13 +0000 (UTC)
Date: Thu, 14 Oct 2021 14:52:11 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Kees Cook <keescook@chromium.org>
Cc: Borislav Petkov <bp@alien8.de>, Sami Tolvanen <samitolvanen@google.com>,
 x86@kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>, Peter Zijlstra
 <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH v5 09/15] x86: Use an opaque type for functions not
 callable from C
Message-ID: <20211014145211.573579e6@gandalf.local.home>
In-Reply-To: <202110141141.870A67E@keescook>
References: <20211013181658.1020262-1-samitolvanen@google.com>
	<20211013181658.1020262-10-samitolvanen@google.com>
	<YWgSwmzPFrRbMC1P@zn.tnic>
	<202110140904.41B5183E@keescook>
	<YWhpbu/Y6V2p/zlY@zn.tnic>
	<202110141141.870A67E@keescook>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 14 Oct 2021 11:47:01 -0700
Kees Cook <keescook@chromium.org> wrote:

> On Thu, Oct 14, 2021 at 07:31:26PM +0200, Borislav Petkov wrote:
> > On Thu, Oct 14, 2021 at 09:07:57AM -0700, Kees Cook wrote:
> > Looking at the changelog, DECLARE_ASM_FUNC_SYMBOL, makes a lot more
> > sense to me even if it doesn't specify the aspect that it is not called
> > by C but who cares - it is generic enough.  
> 
> Around we go. :) Josh[1] and Steven[2] explicitly disagreed with
> that name, leading to the current name[3]. Do you want it to be
> DECLARE_ASM_FUNC_SYMBOL() over those objections?

Just note, that I was fine with the original name, but was against the
version Josh suggested ;-)

> 
> I'd really like to finish this shed -- I need to take the bikes in from
> the rain. :P

Back to black it is!

-- Steve
