Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4773A3E
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 19:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA887C340E9;
	Mon, 14 Feb 2022 19:50:48 +0000 (UTC)
Date: Mon, 14 Feb 2022 14:50:47 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Nick Desaulniers
 <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ftrace: Remove unused ftrace_startup_enable() stub
Message-ID: <20220214145047.35b9df58@gandalf.local.home>
In-Reply-To: <20220214192847.488166-1-nathan@kernel.org>
References: <20220214192847.488166-1-nathan@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Feb 2022 12:28:47 -0700
Nathan Chancellor <nathan@kernel.org> wrote:

> When building with clang + CONFIG_DYNAMIC_FTRACE=n + W=1, there is a
> warning:
> 
>   kernel/trace/ftrace.c:7194:20: error: unused function 'ftrace_startup_enable' [-Werror,-Wunused-function]
>   static inline void ftrace_startup_enable(int command) { }
>                      ^
>   1 error generated.
> 
> Clang warns on instances of static inline functions in .c files with W=1
> after commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> inline functions for W=1 build").
> 
> The ftrace_startup_enable() stub has been unused since
> commit e1effa0144a1 ("ftrace: Annotate the ops operation on update"),
> where its use outside of the CONFIG_DYNAMIC_TRACE section was replaced
> by ftrace_startup_all().  Remove it to resolve the warning.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks,

I'll queue this up for the next merge window. (After it passes all my
testing of course).

-- Steve

> ---
>  kernel/trace/ftrace.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index f9feb197b2da..a4b462b6f944 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -7191,7 +7191,6 @@ static int __init ftrace_nodyn_init(void)
>  core_initcall(ftrace_nodyn_init);
>  
>  static inline int ftrace_init_dyn_tracefs(struct dentry *d_tracer) { return 0; }
> -static inline void ftrace_startup_enable(int command) { }
>  static inline void ftrace_startup_all(int command) { }
>  
>  # define ftrace_startup_sysctl()	do { } while (0)
> 
> base-commit: 754e0b0e35608ed5206d6a67a791563c631cec07

