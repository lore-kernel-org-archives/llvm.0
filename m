Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EE62C80
	for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 17:26:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9BD2261152;
	Thu, 14 Oct 2021 17:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634232391;
	bh=o0QsazVMagTZA1XmrDz3OQqKaBb0s1Tde3hbsP0uePk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jDJf4ujoCOZS0iYOctJNZQGY9RghDBt1PpXR1GZDqqR5AEThHfi3KSmGrD7fYEaC0
	 oEK42B78SI3dGjnYnaaUWHSlsGNauW6LVwz/TIYxZFKYkKEfnelTBCcFfRQIWMkCuD
	 KHD2m81AjgnXq9nqEf1I0kTQX4D3q1HdRixdreYt5gh4nXxJAol4B7jWiJoStgOmsE
	 dEub2tOq9KlrnwGbblTYlnLPlwi9kmxvBtq4ev3SXfSwQBUV6p5xbuikiXmmAjRSxP
	 monAKViPysgUYuREjDMb+qMcZWFmRGFNfmp1JAaPuno2QZ7/D4k4gDVsCZk8x51jEG
	 yayl6XuJS98rw==
Date: Thu, 14 Oct 2021 10:26:27 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Kees Cook <keescook@chromium.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] compiler_types: mark __compiletime_assert failure as
 __noreturn
Message-ID: <YWhoQ2lKeOx2U2e2@archlinux-ax161>
References: <20211014132331.GA4811@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211014132331.GA4811@kernel.org>

On Thu, Oct 14, 2021 at 03:23:31PM +0200, Miguel Ojeda wrote:
> `__compiletime_assert` declares a fake `extern` function
> which appears (to the compiler) to be called when the test fails.
> 
> Therefore, compilers may emit possibly-uninitialized warnings
> in some cases, even if it will be an error anyway (for compilers
> supporting the `error` attribute, e.g. GCC and Clang >= 14)
> or a link failure (for those that do not, e.g. Clang < 14).
> 
> Annotating the fake function as `__noreturn` gives them
> the information they need to avoid the warning,
> e.g. see https://godbolt.org/z/x1v69jjYY.
> 
> Link: https://lore.kernel.org/llvm/202110100514.3h9CI4s0-lkp@intel.com/
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  include/linux/compiler_types.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
> index b6ff83a714ca..ca1a66b8cd2f 100644
> --- a/include/linux/compiler_types.h
> +++ b/include/linux/compiler_types.h
> @@ -298,7 +298,13 @@ struct ftrace_likely_data {
>  #ifdef __OPTIMIZE__
>  # define __compiletime_assert(condition, msg, prefix, suffix)		\
>  	do {								\
> -		extern void prefix ## suffix(void) __compiletime_error(msg); \
> +		/*							\
> +		 * __noreturn is needed to give the compiler enough	\
> +		 * information to avoid certain possibly-uninitialized	\
> +		 * warnings (regardless of the build failing).		\
> +		 */							\
> +		__noreturn extern void prefix ## suffix(void)		\
> +			__compiletime_error(msg);			\
>  		if (!(condition))					\
>  			prefix ## suffix();				\
>  	} while (0)
> -- 
> 2.33.1
> 
