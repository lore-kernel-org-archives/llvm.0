Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E724D5B1
	for <llvm@lists.linux.dev>; Fri,  1 Dec 2023 21:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SrE6sgFs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ADDDC433C9;
	Fri,  1 Dec 2023 21:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701467047;
	bh=Gt2exZhN0pfBhamoCKIzysIgj2FlXmSneCvHWmAiG1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SrE6sgFs70knxhrz67wYrNEqcgFC+AdktpAWBbze6mUqHNG+++qLum+0DA4kxYsm2
	 QmThJR8YPgLxB0hP495k/fLvImeUyLdmCxoWF7yuHgT1pBQlYFD/dZdLDwes6649GM
	 l2ryaKPwodXfb+T8gCq2DlE05hL8rnZDq56WU/XEGou92PWt/lDqLint27GmlYkDiC
	 G1UJIhqDIVQEjFApUp79dy7S6pA2RvWgReNLaEGxR6+tLqRJKeJhFQBpPeLPFfuf0N
	 OB7PSF0PUVNKjTLQ39XfBsIdeumJqQ1/qlTmkhWq5v9XbFtwXEcWTMlpQ9GdvUDqFk
	 I6YRjpPQniUWA==
Date: Fri, 1 Dec 2023 14:44:05 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH] x86/callthunks: Correct calculation of dest address in
 is_callthunk()
Message-ID: <20231201214405.GA1533860@dev-arch.thelio-3990X>
References: <20231201085727.3647051-1-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201085727.3647051-1-ubizjak@gmail.com>

On Fri, Dec 01, 2023 at 09:57:27AM +0100, Uros Bizjak wrote:
> GCC didn't warn on the invalid use of relocation destination
> pointer, so the calculated destination value was applied to
> the uninitialized pointer location in error.
> 
> Fixes: 17bce3b2ae2d ("x86/callthunks: Handle %rip-relative relocations in call thunk template")
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Closes: https://lore.kernel.org/lkml/20231201035457.GA321497@dev-arch.thelio-3990X/
> Cc: Ingo Molnar <mingo@kernel.org>
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>

This obviously clears up the warning and all my machines booted
(although I don't think any of them actually exercise this code path?):

Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/x86/kernel/callthunks.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/callthunks.c b/arch/x86/kernel/callthunks.c
> index f5507c95e7be..c561dd481eb9 100644
> --- a/arch/x86/kernel/callthunks.c
> +++ b/arch/x86/kernel/callthunks.c
> @@ -306,7 +306,7 @@ static bool is_callthunk(void *addr)
>  	if (!thunks_initialized || skip_addr((void *)dest))
>  		return false;
>  
> -	*pad = dest - tmpl_size;
> +	pad = (void *)(dest - tmpl_size);
>  
>  	memcpy(insn_buff, skl_call_thunk_template, tmpl_size);
>  	apply_relocation(insn_buff, tmpl_size, pad,
> -- 
> 2.31.1
> 
