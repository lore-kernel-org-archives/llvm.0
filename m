Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB21A935
	for <llvm@lists.linux.dev>; Wed, 12 Apr 2023 22:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB858C433EF;
	Wed, 12 Apr 2023 22:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681337050;
	bh=Cs/RuiAtC+xFvrRq6kd7R2610WkOAe2Z5xGdxRo0amU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tus0xjhaLSMviaeNmpHYGDKK7PkRXSG0vHz7VRFdjrWVsrhlEMcbKx0GJn3xYbSM6
	 4yc+DfrcpaLtZrqCf1iBTsRQapO26DLSFhIMrw2ZwLj0qbUssI3m2bvVyNrLnVRzf7
	 kaMQsmUhyiI+rWemFnhCdHsYwQvZ7V+cKFXqWllMBEDNvvASD7mN2aMtNVinXClYv/
	 zPxKkmVCnr0Ah0YVuhcs0U5HGgsI3EhpFadofHyKGgmZBeCVWRY5c59Sk4vNBY9ArZ
	 368y6dvXiL+ub+7fe5stf+IlPVDumwBxF9X5ngSlP0NUebMsZkgUddRpz8/wF4pGww
	 q8zy96u4IVlWA==
Date: Wed, 12 Apr 2023 15:04:08 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: ndesaulniers@google.com
Cc: "Borislav Petkov (AMD)" <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Miguel Ojeda <ojeda@kernel.org>, Tom Rix <trix@redhat.com>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 2/2] start_kernel: omit prevent_tail_call_optimization
 for newer toolchains
Message-ID: <20230412220408.GB1120303@dev-arch.thelio-3990X>
References: <20230412-no_stackp-v1-0-46a69b507a4b@google.com>
 <20230412-no_stackp-v1-2-46a69b507a4b@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230412-no_stackp-v1-2-46a69b507a4b@google.com>

On Wed, Apr 12, 2023 at 11:32:13AM -0700, ndesaulniers@google.com wrote:
> prevent_tail_call_optimization was added in
> commit a9a3ed1eff36 ("x86: Fix early boot crash on gcc-10, third try")
> to work around stack canaries getting inserted into functions that would
> initialize the stack canary in the first place.
> 
> Now that we have no_stack_protector function attribute (gcc-11+,
> clang-7+) and use it on start_kernel, remove the call to
> prevent_tail_call_optimization such that we may one day remove it
> outright.
> 
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  init/main.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/init/main.c b/init/main.c
> index 213baf7b8cb1..c8503d02dfa6 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -1152,7 +1152,12 @@ void start_kernel(void)
>  	/* Do the rest non-__init'ed, we're now alive */
>  	arch_call_rest_init();
>  
> +	/* Avoid stack canaries in callers of boot_init_stack_canary for gcc-10
> +	 * and older.
> +	 */
> +#if !__has_attribute(__no_stack_protector__)
>  	prevent_tail_call_optimization();
> +#endif
>  }
>  
>  /* Call all constructor functions linked into the kernel. */
> 
> -- 
> 2.40.0.577.gac1e443424-goog
> 
