Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5C72C87
	for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 19:20:59 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 232B1611F0;
	Wed, 13 Oct 2021 19:20:58 +0000 (UTC)
Date: Wed, 13 Oct 2021 15:20:56 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: x86@kernel.org, Kees Cook <keescook@chromium.org>, Josh Poimboeuf
 <jpoimboe@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Sedat Dilek <sedat.dilek@gmail.com>, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v5 06/15] ftrace: Use an opaque type for functions not
 callable from C
Message-ID: <20211013152056.3a01d9bb@gandalf.local.home>
In-Reply-To: <20211013181658.1020262-7-samitolvanen@google.com>
References: <20211013181658.1020262-1-samitolvanen@google.com>
	<20211013181658.1020262-7-samitolvanen@google.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 13 Oct 2021 11:16:49 -0700
Sami Tolvanen <samitolvanen@google.com> wrote:

> With CONFIG_CFI_CLANG, the compiler changes function references to
> point to the CFI jump table. As ftrace_call, ftrace_regs_call, and
> mcount_call are not called by C code, but are trampolines injected
> as calls replacing the nops at the start of functions added by the
> compiler, use DECLARE_NOT_CALLED_FROM_C to declare them.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>
> Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
> ---
>  include/linux/ftrace.h | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> index 832e65f06754..c53a00b96ba9 100644
> --- a/include/linux/ftrace.h
> +++ b/include/linux/ftrace.h
> @@ -578,9 +578,10 @@ extern void ftrace_replace_code(int enable);
>  extern int ftrace_update_ftrace_func(ftrace_func_t func);
>  extern void ftrace_caller(void);
>  extern void ftrace_regs_caller(void);
> -extern void ftrace_call(void);
> -extern void ftrace_regs_call(void);
> -extern void mcount_call(void);
> +
> +DECLARE_NOT_CALLED_FROM_C(ftrace_call);
> +DECLARE_NOT_CALLED_FROM_C(ftrace_regs_call);
> +DECLARE_NOT_CALLED_FROM_C(mcount_call);
>  
>  void ftrace_modify_all_code(int command);
>  

Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- Steve
