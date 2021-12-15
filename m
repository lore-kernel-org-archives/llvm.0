Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898982CA4
	for <llvm@lists.linux.dev>; Wed, 15 Dec 2021 22:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDCCEC36AE3;
	Wed, 15 Dec 2021 22:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639608420;
	bh=fXQuO+N6X9s4aSRl5T3wSk3erhKCx7vnAIkoyKDNTPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mh8WQHweKF6pvQz7w+P3rd60rSCEg6k8BGWyy5Gh92kfPLcDgKI+UzgD0eas+3/Mn
	 8o+pRiu/CTRzUZ8iqLoF0N69bvd2ZlprFWSCFBVLqr51hE5Y2ABZlA0+dssylMYCGe
	 TuEp23TWXC5K06FculukA5vCu1QpdNnGd4iIAudYUNPAIzFunnQKviYGUNYxVL6K3Y
	 8swCfPqZ/rrTeSc7ga9609XWR+2iLDU0oRGw3+e0NJtKQhdfvKYu49+Vtlrl669ZR+
	 njLkf6GaKMqK1tom+elJjpjIvQLBLxTcisAb/uOewx+qkWPtENhONCcjxDEmr57Eks
	 OR86gfrEXg/jg==
Date: Wed, 15 Dec 2021 15:46:54 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Bill Wendling <morbo@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Juergen Gross <jgross@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>, llvm@lists.linux.dev
Subject: Re: [PATCH] x86: use builtins to read eflags
Message-ID: <YbpwXjGcLty1ns81@archlinux-ax161>
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
> 
> Signed-off-by: Bill Wendling <morbo@google.com>

I think there has been discussion about doing this in the past (possibly
even from you?) but last time it was talked about, Andy pointed out that
Clang's codegen is suboptimal and filed a couple of bugs:

https://lore.kernel.org/r/CALCETrXUaeNUbkQSeMPpPKWDBCEpqX1gLgkv2G9zLeeYMjK8VQ@mail.gmail.com/

https://llvm.org/PR47530 (which is really https://llvm.org/PR20197)
https://llvm.org/PR47531

It seems like the second one is the one that actually matters in this
case but if I am reading the bug report and Phabricator correct, it does
not seem like it has been addresed so does it actually improve code
generation? If there is another reason to do this (can't tell from the
previous thread or this commit message), it might be worth calling that
out as well.

Cheers,
Nathan

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
>  
>  static __always_inline void native_irq_disable(void)
>  {
> -- 
> 2.34.1.173.g76aa8bc2d0-goog
> 
