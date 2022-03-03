Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401CF2F21
	for <llvm@lists.linux.dev>; Thu,  3 Mar 2022 18:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72267C004E1;
	Thu,  3 Mar 2022 18:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646331251;
	bh=LVSPewNmGhXRyzLyEm10SYfCvlpreycNSgNgIJS1/7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RbS2Kbu1DpPOkrxl9uxTq8uJZ4POT6c3roRLNtoB7aJYNAaudVX1w84/Epu/fQBkb
	 cvTKzG72mN/5LUWhMTaw3VYuTFIeZVJxdT1blsse0UZwGu9A1Qu6Q+OvleUULCrFP6
	 sBqRLubxMSyQMeHjCZvMJHumKOK7s1lz/xQQZ6+M9/HZcAdDW/kF3rjy02WubZHArN
	 SaL+efNtKATeAweYzaYHgiHuETkeqgB8919eV36nTpaVZ9aqZ8FrQNZOx5fvcCRoET
	 J0aISwHFM+gXktb4IoUBb4aTjWxAL6LdASpHl/YQKLOdLCUi3+JNnO1jtuhbFUhiUM
	 +mpxHGm5zUPBw==
Date: Thu, 3 Mar 2022 11:14:04 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v2 5/8] compiler-clang.h: Add __diag
 infrastructure for clang
Message-ID: <YiEFbKk12F0UPfx5@thelio-3990X>
References: <20220303045029.2645297-1-memxor@gmail.com>
 <20220303045029.2645297-6-memxor@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220303045029.2645297-6-memxor@gmail.com>

Hi Kumar,

Thanks for sending this along!

On Thu, Mar 03, 2022 at 10:20:26AM +0530, Kumar Kartikeya Dwivedi wrote:
> From: Nathan Chancellor <nathan@kernel.org>
> 
> Add __diag macros similar to those in compiler-gcc.h, so that warnings
> that need to be adjusted for specific cases but not globally can be
> ignored for LLVM compilation mode as well.

I would word this last sentence as:

"ignored when building with clang."

Technically speaking, LLVM is not the one emitting the warnings, clang
is :) this is useful with LLVM=1 or CC=clang.

> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: llvm@lists.linux.dev
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

You should add your signed-off-by here to notate that you have touched
the patch per Documentation/process/submitting-patches.rst. It is also
courteous to note that you wrote the commit message, something along the
lines of:

"[Kumar: Wrote commit message]
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>"

Regardless, this looks good to me with the context of the other two
patches:

https://lore.kernel.org/r/20220303045029.2645297-7-memxor@gmail.com/
https://lore.kernel.org/r/20220303045029.2645297-8-memxor@gmail.com/

Cheers,
Nathan

> ---
>  include/linux/compiler-clang.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/include/linux/compiler-clang.h b/include/linux/compiler-clang.h
> index 3c4de9b6c6e3..f1aa41d520bd 100644
> --- a/include/linux/compiler-clang.h
> +++ b/include/linux/compiler-clang.h
> @@ -68,3 +68,25 @@
>  
>  #define __nocfi		__attribute__((__no_sanitize__("cfi")))
>  #define __cficanonical	__attribute__((__cfi_canonical_jump_table__))
> +
> +/*
> + * Turn individual warnings and errors on and off locally, depending
> + * on version.
> + */
> +#define __diag_clang(version, severity, s) \
> +	__diag_clang_ ## version(__diag_clang_ ## severity s)
> +
> +/* Severity used in pragma directives */
> +#define __diag_clang_ignore	ignored
> +#define __diag_clang_warn	warning
> +#define __diag_clang_error	error
> +
> +#define __diag_str1(s)		#s
> +#define __diag_str(s)		__diag_str1(s)
> +#define __diag(s)		_Pragma(__diag_str(clang diagnostic s))
> +
> +#if CONFIG_CLANG_VERSION >= 110000
> +#define __diag_clang_11(s)	__diag(s)
> +#else
> +#define __diag_clang_11(s)
> +#endif
> -- 
> 2.35.1
> 
