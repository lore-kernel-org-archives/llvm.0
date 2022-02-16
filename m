Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222FE23AB
	for <llvm@lists.linux.dev>; Wed, 16 Feb 2022 08:00:14 +0000 (UTC)
Date: Wed, 16 Feb 2022 09:00:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1644998411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L3wE8zC2jYkj5x3k+oWAafJ5133fm1wlh+aJZav8UAA=;
	b=jaXSSzyje7OAjBr0pNyS0kC9631YB1d0r1xiJeJPjaji5U2NKpyppIrJV5amnFvQkcYG9Q
	8d0SSRbXsJAOSdUb89yBAfAS4FfeX5DSV/GCIQKXw2q6KKwkyRoq8lOlfMMew4LXLA+OCO
	Cp2N/xN6XosIIIT78a+yaNDYInxTNZ/9JiJ/uJC+n30MVenmAMOt6mQgywm7LKqwjG7Qh0
	2YjthQae5zOy9x/vGdYHMP/akgtArO8bY4pyPDFkJ5QURwqR9oUcSVhIhCHe6vE0BSlguK
	WI5xR4MGgO1OKhrm+rKXMoOw5dLg5JWT2D09F2WC4s1ozE6QDTPKpFfpySqCMQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1644998411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L3wE8zC2jYkj5x3k+oWAafJ5133fm1wlh+aJZav8UAA=;
	b=cx7+VPwBYMo2YklIKj2fj9LIDfDAb3Ai+sBh0/4P+3PYdLJawOMwiPIaYrG+cdU1BBB3iR
	JJd8W0dzCP+bV5AQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nick Desaulniers <ndesaulniers@google.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	"kernelci.org bot" <bot@kernelci.org>
Subject: Re: [PATCH] mm/page_alloc: Mark pagesets as __maybe_unused
Message-ID: <YgyvCTiIWAFKq6G4@linutronix.de>
References: <20220215184322.440969-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220215184322.440969-1-nathan@kernel.org>

On 2022-02-15 11:43:22 [-0700], Nathan Chancellor wrote:
> Commit 9983a9d577db ("locking/local_lock: Make the empty local_lock_*()
> function a macro.") in the -tip tree converted the local_lock_*()
> functions into macros, which causes a warning with clang with
> CONFIG_PREEMPT_RT=n + CONFIG_DEBUG_LOCK_ALLOC=n:
> 
>   mm/page_alloc.c:131:40: error: variable 'pagesets' is not needed and will not be emitted [-Werror,-Wunneeded-internal-declaration]
>   static DEFINE_PER_CPU(struct pagesets, pagesets) = {
>                                          ^
>   1 error generated.
> 
> Prior to that change, clang was not able to tell that pagesets was
> unused in this configuration because it does not perform cross function
> analysis in the frontend. After that change, it sees that the macros
> just do a typecheck on the lock member of pagesets, which is evaluated
> at compile time (so the variable is technically "used"), meaning the
> variable is not needed in the final assembly, as the warning states.
> 
> Mark the variable as __maybe_unused to make it clear to clang that this
> is expected in this configuration so there is no more warning.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1593
> Reported-by: "kernelci.org bot" <bot@kernelci.org>
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  mm/page_alloc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 7ff1efc84205..406f5d0c610f 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -128,7 +128,7 @@ static DEFINE_MUTEX(pcp_batch_high_lock);
>  struct pagesets {
>  	local_lock_t lock;
>  };
> -static DEFINE_PER_CPU(struct pagesets, pagesets) = {
> +static DEFINE_PER_CPU(struct pagesets, pagesets) __maybe_unused = {

No, I need to think of something else then for the local_lock thing.  I
haven't seen it with gcc. There is probably more than just this one.

>  	.lock = INIT_LOCAL_LOCK(lock),
>  };

Sebastian
