Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AEA253AC
	for <llvm@lists.linux.dev>; Mon, 17 Jul 2023 20:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A1D1C433C8;
	Mon, 17 Jul 2023 20:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689626756;
	bh=UsXsfjVL9REDWcNWMHiUI6cTNSdXjR9CSQ/6ZyhFjy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=il+XQKSjT3nn4U1R4HkC5syT0/BiDp0SRWQ8Vg1tWBr2j9+/O7ByTu5Fa3FkVrJxe
	 vHfFFIPcpDVFs8K7DwSnWsJ2kYat2EvVhL7Hiv64bBEqW0bt7jHnYEB5wmIw+Ss0VO
	 OeSrRmS3DcneJnpUQ5uksTdCiAmOtFTj//8yRCBwSlpj4yDwbKcZLmrKJ407P1DHYj
	 QpI/31QeBYsaLe2MXCynGBQK8hTI1L6IRMnBKqYuV3Xn42aojQlZYnCkTjiz375ZRc
	 ByfsEeW9YEIgwOTubLu5amXdeOmHpTROJeiRlsbtpLgTLdUEyeo+bLBN2az0aLAOnZ
	 1KVGNZrL6BbGw==
Date: Mon, 17 Jul 2023 13:45:54 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jakob Koschel <jkl820.git@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] arch: enable HAS_LTO_CLANG with KASAN and KCOV
Message-ID: <20230717204554.GB2212488@dev-arch.thelio-3990X>
References: <20230717-enable-kasan-lto1-v1-1-471e706a5c4e@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717-enable-kasan-lto1-v1-1-471e706a5c4e@gmail.com>

Hi Jakob,

On Mon, Jul 17, 2023 at 10:09:27PM +0200, Jakob Koschel wrote:
> Both KASAN and KCOV had issues with LTO_CLANG if DEBUG_INFO is enabled.
> With LTO inlinable function calls are required to have debug info if
> they are inlined into a function that has debug info.
> 
> Starting with LLVM 17 this will be fixed ([1],[2]) and enabling LTO with
> KASAN/KCOV and DEBUG_INFO doesn't cause linker errors anymore.
> 
> Signed-off-by: Jakob Koschel <jkl820.git@gmail.com>
> Link: https://github.com/llvm/llvm-project/commit/913f7e93dac67ecff47bade862ba42f27cb68ca9
> Link: https://github.com/llvm/llvm-project/commit/4a8b1249306ff11f229320abdeadf0c215a00400

Thanks for seeing this to completion, especially with the LLVM fixes in
tow! One small nit below, other than that:

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Normally, I would not say that comment alone is worth a v2 but I think
in this case, I will say it is because neither Nick nor I pick up
patches directly, so this will need to be picked up by either Kees Cook
(who has generally handled clang LTO patches because he ferried in the
initial LTO series to mainline) or Andrew Morton.

Would you mind addressing my comment and sending a v2 to them directly
(they can figure out who will take it) with us on CC in case we need to
poke them? Their addresses should be in MAINTAINERS.

Cheers,
Nathan

> ---
>  arch/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index aff2746c8af2..61263ff92271 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -745,7 +745,8 @@ config HAS_LTO_CLANG
>  	depends on $(success,$(AR) --help | head -n 1 | grep -qi llvm)
>  	depends on ARCH_SUPPORTS_LTO_CLANG
>  	depends on !FTRACE_MCOUNT_USE_RECORDMCOUNT
> -	depends on !KASAN || KASAN_HW_TAGS

Consider linking back to either your fixes in LLVM or
https://github.com/ClangBuiltLinux/linux/issues/1721 so that we have a
paper trail of why these version checks are here :)

> +	depends on (!KASAN || KASAN_HW_TAGS || CLANG_VERSION >= 170000) || !DEBUG_INFO
> +	depends on (!KCOV || CLANG_VERSION >= 170000) || !DEBUG_INFO
>  	depends on !GCOV_KERNEL
>  	help
>  	  The compiler and Kconfig options support building with Clang's
> 
> ---
> base-commit: fdf0eaf11452d72945af31804e2a1048ee1b574c
> change-id: 20230717-enable-kasan-lto1-656754c76241
> 
> Best regards,
> -- 
> Jakob Koschel <jkl820.git@gmail.com>
> 
