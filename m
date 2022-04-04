Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D587C
	for <llvm@lists.linux.dev>; Mon,  4 Apr 2022 09:03:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D3D7C340F3;
	Mon,  4 Apr 2022 09:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649062995;
	bh=bc9dhJ25NRgwnJv552m6vx+WUsOE7TY5Mhjhgf+DSOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A+mzOMUOX7/dVRw0BiZUbyGk3kEDYVlm2X9fuRp2IHwXCkNOcesJVKMgdz01b3zf3
	 Otp8wIOXtW6663J6Gde6vqftmjaaTHPkWIWFl0y35wVT6bKhJ1uSdNuIPZqW44srWq
	 UEePwddtQA7Y8gcTQPqAK4IXAIPYDec8NI4paNkh85CNrpkTBw+zZ2Rjkrqqxh+6X1
	 TEIBycWYjt83Jo0CxZ5r0kArid12vmPnnjGxsuGMiGKtvplXwnxWwFKvG6vGSThjh9
	 KaYjHEHdTZl6jRXoHx1TQ0n2qdlNGfYXxYKTX/SRnuJYFFbgix5oJ1BdEtTsxc/Jgh
	 wzfkBR39eGo4w==
Date: Mon, 4 Apr 2022 10:03:09 +0100
From: Will Deacon <will@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Kees Cook <keescook@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 3/3] arm64: Drop the inline assembly implementation of
 function_nocfi
Message-ID: <20220404090309.GA22649@willie-the-truck>
References: <20220401201916.1487500-1-samitolvanen@google.com>
 <20220401201916.1487500-4-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220401201916.1487500-4-samitolvanen@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Apr 01, 2022 at 01:19:16PM -0700, Sami Tolvanen wrote:
> Drop the inline assembly version of function_nocfi() now that
> CONFIG_CFI_CLANG depends on __builtin_function_start(), which allows
> this macro to be implemented more cleanly and in a way that works also
> with static initializers.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  arch/arm64/include/asm/compiler.h | 16 ----------------
>  1 file changed, 16 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/compiler.h b/arch/arm64/include/asm/compiler.h
> index dc3ea4080e2e..6fb2e6bcc392 100644
> --- a/arch/arm64/include/asm/compiler.h
> +++ b/arch/arm64/include/asm/compiler.h
> @@ -23,20 +23,4 @@
>  #define __builtin_return_address(val)					\
>  	(void *)(ptrauth_clear_pac((unsigned long)__builtin_return_address(val)))
>  
> -#ifdef CONFIG_CFI_CLANG
> -/*
> - * With CONFIG_CFI_CLANG, the compiler replaces function address
> - * references with the address of the function's CFI jump table
> - * entry. The function_nocfi macro always returns the address of the
> - * actual function instead.
> - */
> -#define function_nocfi(x) ({						\
> -	void *addr;							\
> -	asm("adrp %0, " __stringify(x) "\n\t"				\
> -	    "add  %0, %0, :lo12:" __stringify(x)			\
> -	    : "=r" (addr));						\
> -	addr;								\
> -})
> -#endif
> -
>  #endif /* __ASM_COMPILER_H */

Acked-by: Will Deacon <will@kernel.org>

Will
