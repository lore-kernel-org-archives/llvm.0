Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E077F2C8E
	for <llvm@lists.linux.dev>; Wed,  6 Oct 2021 16:58:11 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 9735961130;
	Wed,  6 Oct 2021 16:58:10 +0000 (UTC)
Date: Wed, 6 Oct 2021 12:58:09 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, X86 ML <x86@kernel.org>, Kees Cook
 <keescook@chromium.org>, Peter Zijlstra <peterz@infradead.org>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Sedat Dilek <sedat.dilek@gmail.com>, linux-hardening@vger.kernel.org, LKML
 <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Subject: Re: [PATCH v4 06/15] ftrace: Use an opaque type for functions not
 callable from C
Message-ID: <20211006125809.5389b2a3@gandalf.local.home>
In-Reply-To: <CABCJKueL4Ebaan=JBUyO3oewq7RTHHXWUQpixgf2AfC_r5T3uA@mail.gmail.com>
References: <20210930180531.1190642-1-samitolvanen@google.com>
	<20210930180531.1190642-7-samitolvanen@google.com>
	<20211006032945.axlqh3vehgar6adr@treble>
	<20211006090249.248c65b0@gandalf.local.home>
	<CABCJKueL4Ebaan=JBUyO3oewq7RTHHXWUQpixgf2AfC_r5T3uA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 6 Oct 2021 09:31:04 -0700
Sami Tolvanen <samitolvanen@google.com> wrote:

> > > On Thu, Sep 30, 2021 at 11:05:22AM -0700, Sami Tolvanen wrote:  
> > > > With CONFIG_CFI_CLANG, the compiler changes function references to point
> > > > to the CFI jump table. As ftrace_call, ftrace_regs_call, and mcount_call
> > > > are not called from C, use DECLARE_ASM_FUNC_SYMBOL to declare them.  
> >
> > "not called from C" is a bit confusing.  
> 
> Any thoughts on how to make this less confusing?

 "Not called by C code, but injected by the compiler."

?

-- Steve
