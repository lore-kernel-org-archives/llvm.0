Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607593FC3
	for <llvm@lists.linux.dev>; Sat, 11 Sep 2021 00:07:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2840E61153;
	Sat, 11 Sep 2021 00:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631318873;
	bh=Q/iD1S0/iT+IxBBe9kh++hPn6RGB3OaQo3wV+nIuWMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q5fL1NBQ6U99jc9jT5zb+Ul3+BzhTOeCewF4MQ5AuB5c8HzcccxsqCMM39euaK+Ud
	 nMvavOOjY7D2XcF2zLVqoRU7TjFKRRbl8YiLvO9mA0kpKOqHIfrFwevhInMP3niflE
	 XlrEzsA/HjhfmiVkyBrtz5XuehXu5ktO3TRbEagqqxDSfyjQMCR9uCrIx7ljrIjZ90
	 KuHpJVUTkst2IeZZyzdmS5mCR+gueB5Su3+tyK1vbnVFePmik44ytxjmFM1w9WQYID
	 V05Hy4L5opr0wz4cw33NNPsi9p3GnMGG+dTcyvMOKKPr/DckAFffRftt0s5cwPrxV6
	 j0s1SHisqngrw==
Date: Fri, 10 Sep 2021 17:07:47 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/10] mm/ksm: remove old GCC 4.9+ check
Message-ID: <YTvzU9qe6vV2Dwpp@archlinux-ax161>
References: <20210910234047.1019925-1-ndesaulniers@google.com>
 <20210910234047.1019925-4-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210910234047.1019925-4-ndesaulniers@google.com>

On Fri, Sep 10, 2021 at 04:40:40PM -0700, Nick Desaulniers wrote:
> The minimum supported version of GCC has been raised to GCC 5.1.
> 
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

This is technically new for clang but arm64 allmodconfig does not
complain.

> ---
>  mm/ksm.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/mm/ksm.c b/mm/ksm.c
> index 025338128cd9..a5716fdec1aa 100644
> --- a/mm/ksm.c
> +++ b/mm/ksm.c
> @@ -651,10 +651,8 @@ static void remove_node_from_stable_tree(struct stable_node *stable_node)
>  	 * from &migrate_nodes. This will verify that future list.h changes
>  	 * don't break STABLE_NODE_DUP_HEAD. Only recent gcc can handle it.

Probably worth removing the recent GCC comment.

>  	 */
> -#if defined(GCC_VERSION) && GCC_VERSION >= 40903
>  	BUILD_BUG_ON(STABLE_NODE_DUP_HEAD <= &migrate_nodes);
>  	BUILD_BUG_ON(STABLE_NODE_DUP_HEAD >= &migrate_nodes + 1);
> -#endif
>  
>  	if (stable_node->head == &migrate_nodes)
>  		list_del(&stable_node->list);
> -- 
> 2.33.0.309.g3052b89438-goog
> 
> 
