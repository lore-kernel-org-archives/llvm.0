Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DD22CA4
	for <llvm@lists.linux.dev>; Wed, 15 Dec 2021 23:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ff40ND1ZxMrpZheFrmBQQ/j/LE451QN1Xy/+LcLWJB4=; b=Iaj2Y1yBtQdPKcqqshJG08XRDX
	bq9G9zmFAchj3FGmGAJIwvFq18ZHsAB+k/8KbEqM4c8lNTyvny1e0lgnEjLQffPJ5cs8GK4cVVIIX
	D8W4K4JLg1jwnVqYjE3KUcWj16XlH1xpRMFfpS5+CMclDQ/1YTstyj4tnNggMW0AmGVn3HdmhfDRh
	8xY4iRgZwlccNJiu4iRtWSxsKoMAym2jExCDtGKgdoFNcjM1syE0+W+JhMRjJPkuUylV+cop20vkt
	0TENZAWPVvcKJ/CxBVZsuEqJxGd6c/d/ufKzfBp66SgrmJhApKcIapxYLaprZcwR2bzZiw2pFrh1v
	W4jcHerw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=worktop.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxdew-001acp-Tt; Wed, 15 Dec 2021 23:26:11 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9B8109844F1; Thu, 16 Dec 2021 00:26:05 +0100 (CET)
Date: Thu, 16 Dec 2021 00:26:05 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Bill Wendling <morbo@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Juergen Gross <jgross@suse.com>, Andy Lutomirski <luto@kernel.org>,
	llvm@lists.linux.dev
Subject: Re: [PATCH] x86: use builtins to read eflags
Message-ID: <20211215232605.GJ16608@worktop.programming.kicks-ass.net>
References: <20211215211847.206208-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215211847.206208-1-morbo@google.com>

On Wed, Dec 15, 2021 at 01:18:47PM -0800, Bill Wendling wrote:
> GCC and Clang both have builtins to read from and write to the
> EFLAGS register. This allows the compiler to determine the best way
> to generate the code, which can improve code generation.

Only because clang is still brain-dead wrt "rm" constraints, right?

> Signed-off-by: Bill Wendling <morbo@google.com>
> ---
>  arch/x86/include/asm/irqflags.h | 24 +++++-------------------
>  1 file changed, 5 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/x86/include/asm/irqflags.h b/arch/x86/include/asm/irqflags.h
> index c5ce9845c999..574fb44b82f7 100644
> --- a/arch/x86/include/asm/irqflags.h
> +++ b/arch/x86/include/asm/irqflags.h
> @@ -15,25 +15,11 @@
>   * Interrupt control:
>   */
>  
> -/* Declaration required for gcc < 4.9 to prevent -Werror=missing-prototypes */
> -extern inline unsigned long native_save_fl(void);
> -extern __always_inline unsigned long native_save_fl(void)
> -{
> -	unsigned long flags;
> -
> -	/*
> -	 * "=rm" is safe here, because "pop" adjusts the stack before
> -	 * it evaluates its effective address -- this is part of the
> -	 * documented behavior of the "pop" instruction.
> -	 */
> -	asm volatile("# __raw_save_flags\n\t"
> -		     "pushf ; pop %0"
> -		     : "=rm" (flags)
> -		     : /* no input */
> -		     : "memory");
> -
> -	return flags;
> -}
> +#ifdef CONFIG_X86_64
> +#define native_save_fl()	__builtin_ia32_readeflags_u64()
> +#else
> +#define native_save_fl()	__builtin_ia32_readeflags_u32()
> +#endif

Also note the thing was extern inline, and there's actually an
out-of-line symbol for them too. The out-of-line thing is explicitly
using %rax due to paravirt muck.

I'm thinking you wrecked that bit.
