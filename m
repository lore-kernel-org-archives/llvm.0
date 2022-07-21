Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D3F6AB3
	for <llvm@lists.linux.dev>; Thu, 21 Jul 2022 21:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40031C341C6;
	Thu, 21 Jul 2022 21:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658439294;
	bh=X6md/rKJO+TSATnu9ymd2mEtloui1L+AMk57HNphM98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eIEjxkPim65OtK/aPhJ1I8++6uDbbwdU2dTojmTJbKnxXdWNebc7617wpfd0bL4KS
	 satN4XPTypFcyFvRJbND5qVqpVZ1L59mBh6SolF953a7kL4voglcAuLRNxv45ehi/n
	 0RzZrAjOsS2OhnRUwWnQrKekXlgcVaiyyjUGkjhIR7ZPCq6+oOe17XsVgxsZp9fvXP
	 +8Y3FhljvjIYnuLCLLvnybRzGFW6YSiiI0B+8s/j6r8NhkUrhxUBpm994DlFGsHORU
	 +ArLn7CXm8plKRTbviCoEpzIxbqBjhyvYs0xnLC9mWdYWCAyeOO9+JnNSxQy2BlnkY
	 8oZGdkoKs22iA==
Date: Thu, 21 Jul 2022 14:34:52 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] drivers: lkdtm: fix clang -Wformat warning
Message-ID: <YtnGfFuYhQrbed76@dev-arch.thelio-3990X>
References: <20220721212012.4060328-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721212012.4060328-1-justinstitt@google.com>

On Thu, Jul 21, 2022 at 02:20:12PM -0700, Justin Stitt wrote:
> When building with Clang we encounter the following warning
> (ARCH=hexagon + CONFIG_FRAME_WARN=0):
> | ../drivers/misc/lkdtm/bugs.c:107:3: error: format specifies type
> | 'unsigned long' but the argument has type 'int' [-Werror,-Wformat]
> |                 REC_STACK_SIZE, recur_count);
> |                 ^~~~~~~~~~~~~~
> 
> Cast REC_STACK_SIZE to `unsigned long` to match format specifier `%lu`.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/378
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Justin Stitt <justinstitt@google.com>

I think this is the right fix, as REC_STACK_SIZE will be 'unsigned long'
when CONFIG_FRAME_WARN is greater than 0 due to the _AC(..., UL) macro,
so the other one should match too. THREAD_SIZE might not be an unsigned
long; I see at least hexagon, microblaze, m68k, powerpc, and sh that
define it as either a regular integer literal with no suffix or
'1 << THREAD_SHIFT', which will both be of type 'int'.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> Reported by Nathan here:
> https://lore.kernel.org/all/YtmrCJjQrSbv8Aj1@dev-arch.thelio-3990X/
> 
>  drivers/misc/lkdtm/bugs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
> index 009239ad1d8a..6381255aaecc 100644
> --- a/drivers/misc/lkdtm/bugs.c
> +++ b/drivers/misc/lkdtm/bugs.c
> @@ -29,7 +29,7 @@ struct lkdtm_list {
>  #if defined(CONFIG_FRAME_WARN) && (CONFIG_FRAME_WARN > 0)
>  #define REC_STACK_SIZE (_AC(CONFIG_FRAME_WARN, UL) / 2)
>  #else
> -#define REC_STACK_SIZE (THREAD_SIZE / 8)
> +#define REC_STACK_SIZE ((unsigned long)(THREAD_SIZE / 8))
>  #endif
>  #define REC_NUM_DEFAULT ((THREAD_SIZE / REC_STACK_SIZE) * 2)
>  
> -- 
> 2.37.1.359.gd136c6c3e2-goog
> 
