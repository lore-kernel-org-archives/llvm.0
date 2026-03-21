Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A2D1DE8AD;
	Sat, 21 Mar 2026 00:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774051713; cv=none; b=VADq7eo1E4LUsazg1KcEL+FYDrE4hroKZ3wbfVTeTEleTVniMbJdhzZ2xqdC/7ywTzTB4ARL01P/hYRDpr795xiYvPVxDTHBHzNCctEq0DDeZQp+bjUWpOZmvGvc4mJf2VaPxx2smW+t+xgxULXODWv15P6LTHH/ERUtg7t/MJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774051713; c=relaxed/simple;
	bh=X80+LfkGK4NmEPg8+Rk81ydoB6o8vyO5YtLdRv98pL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=krNvqXINsPPzb5dvSABuOf9e4zTLKU41JZXJe/us5x9HlNqT5aNOl09wrnMYz1hEC1my7/OQgRdADohXJPr+3LVt42OSwNx1eWhyZ2+Fspaa77MS46jH+pRz1m+X1sU+KZeejC1KB/1f1ZQ92UTYZ5nMfkoc8dLivunAGCz0MvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TP3/TAp5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TP3/TAp5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B0E4C4CEF7;
	Sat, 21 Mar 2026 00:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774051712;
	bh=X80+LfkGK4NmEPg8+Rk81ydoB6o8vyO5YtLdRv98pL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TP3/TAp5d9DZu45ai0s/nazrWk1AWTYx56F42enkJtVJVJ2V4N1jm7NvzKOBij/7o
	 PA9WxFf3bqmxSKWrooYh2QV17UxkfN8UZ7OBXKqAzutnqbZtFuedUXmDnW4FFUOYGz
	 YlEGG9UXNfRdqCx9j38UIQkpsrOAnAy+XpFWExqiKpZDbvEQGMuGAh0F7YIz4bik/1
	 O8z9K2nf7YW5jBBKNvCGXYYuxc8fYDEi904dX9qf2YJddz9/PTnMPyrN2zj5PiLGbp
	 duWuG31wNjeH6px8C4S7klY9nkOnG/EIlDxylGqRg6GY2sQQVkFi4aTOU95epvV2r0
	 LILsPQnPfBwsg==
Date: Fri, 20 Mar 2026 17:08:27 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Brendan Jackman <jackmanb@google.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] bug: shut up format attribute warning for clang as well
Message-ID: <20260321000827.GA1391538@ax162>
References: <20260320211528.2474389-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320211528.2474389-1-arnd@kernel.org>

On Fri, Mar 20, 2026 at 10:14:25PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Like gcc, clang-22 now also warns about a function that it
> incorrectly identifies as a printf-style format:
> 
> lib/bug.c:190:22: error: diagnostic behavior may be improved by adding the 'format(printf, 1, 0)' attribute to the declaration of '__warn_printf' [-Werror,-Wmissing-format-attribute]
>   179 | static void __warn_printf(const char *fmt, struct pt_regs *regs)
>       | __attribute__((format(printf, 1, 0)))
>   180 | {
>   181 |         if (!fmt)
>   182 |                 return;
>   183 |
>   184 | #ifdef HAVE_ARCH_BUG_FORMAT_ARGS
>   185 |         if (regs) {
>   186 |                 struct arch_va_list _args;
>   187 |                 va_list *args = __warn_args(&_args, regs);
>   188 |
>   189 |                 if (args) {
>   190 |                         vprintk(fmt, *args);
>       |                                           ^
> 
> Turn off this warning for all compilers and versions.
> 
> Fixes: d36067d6ea00 ("bug: Hush suggest-attribute=format for __warn_printf()")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Yeah, it looks like this flag has been recognized by clang for a long
time for GCC compatibility but it only recently started matching GCC's
behavior.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  lib/bug.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/lib/bug.c b/lib/bug.c
> index bbc301097749..374feb144f0b 100644
> --- a/lib/bug.c
> +++ b/lib/bug.c
> @@ -174,8 +174,7 @@ struct bug_entry *find_bug(unsigned long bugaddr)
>  }
>  
>  __diag_push();
> -__diag_ignore(GCC, all, "-Wsuggest-attribute=format",
> -	      "Not a valid __printf() conversion candidate.");
> +__diag_ignore_all("-Wmissing-format-attribute", "Not a valid __printf() conversion candidate.");
>  static void __warn_printf(const char *fmt, struct pt_regs *regs)
>  {
>  	if (!fmt)
> -- 
> 2.39.5
> 
