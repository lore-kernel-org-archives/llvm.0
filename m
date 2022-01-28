Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585742C82
	for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 15:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 428DFC340E6;
	Fri, 28 Jan 2022 15:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643382183;
	bh=8977n+KmEj7ReKrjHl1AOxf+fEeuIQ9yNfDB243E+VA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TAf70PRYBmouertX+8zGnt2OA3GOBrW9BKCpiTUx/FKHWD8ko5NU1Vh8QZNSaxIwb
	 sB0InlJEntDtGxIJ4eeYMQCU8lro++RobJOjjiEvmxbnmNuQIqxDXYt8gOJ0jscXHw
	 20aCKTLze0angQC074KZ8UKsg8Bu1tWavkoh0PxIYHT3qP+dLUM4HgchtUw7Jde4uG
	 YKI+rDpnRCEBU8jJXzr+Cuy4RqV/RPLTwPRVyKG8pLNqEo/bxwcTbjvb2NW8asttuE
	 BbXtKU8q3bRr9/sxWMA4m11Da4Ngdxry+oRzte9AU4thAGc1Ht26yOJn0gfjiW137D
	 CHxtGdTxCj+Dg==
Date: Fri, 28 Jan 2022 08:02:58 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Anders Roxell <anders.roxell@linaro.org>
Cc: ndesaulniers@google.com, mpe@ellerman.id.au,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, christophe.leroy@csgroup.eu,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCHv3] powerpc: mm: radix_tlb: rearrange the if-else block
Message-ID: <YfQFom4xDcysN1yb@dev-arch.archlinux-ax161>
References: <20220128131713.299198-1-anders.roxell@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220128131713.299198-1-anders.roxell@linaro.org>

On Fri, Jan 28, 2022 at 02:17:13PM +0100, Anders Roxell wrote:
> Clang warns:
> 
> arch/powerpc/mm/book3s64/radix_tlb.c:1191:23: error: variable 'hstart' is uninitialized when used here [-Werror,-Wuninitialized]
>                                 __tlbiel_va_range(hstart, hend, pid,
>                                                   ^~~~~~
> arch/powerpc/mm/book3s64/radix_tlb.c:1175:23: note: initialize the variable 'hstart' to silence this warning
>                 unsigned long hstart, hend;
>                                     ^
>                                      = 0
> arch/powerpc/mm/book3s64/radix_tlb.c:1191:31: error: variable 'hend' is uninitialized when used here [-Werror,-Wuninitialized]
>                                 __tlbiel_va_range(hstart, hend, pid,
>                                                           ^~~~
> arch/powerpc/mm/book3s64/radix_tlb.c:1175:29: note: initialize the variable 'hend' to silence this warning
>                 unsigned long hstart, hend;
>                                           ^
>                                            = 0
> 2 errors generated.
> 
> Rework the 'if (IS_ENABLE(CONFIG_TRANSPARENT_HUGEPAGE))' so hstart/hend
> always gets initialized, this will silence the warnings. That will also
> simplify the 'else' path. Clang is getting confused with these warnings,
> but the warnings is a false-positive.
> 
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/powerpc/mm/book3s64/radix_tlb.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
> index 7724af19ed7e..5172d5cec2c0 100644
> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
> @@ -1171,15 +1171,12 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
>  			}
>  		}
>  	} else {
> -		bool hflush = false;
> +		bool hflush;
>  		unsigned long hstart, hend;
>  
> -		if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
> -			hstart = (start + PMD_SIZE - 1) & PMD_MASK;
> -			hend = end & PMD_MASK;
> -			if (hstart < hend)
> -				hflush = true;
> -		}
> +		hstart = (start + PMD_SIZE - 1) & PMD_MASK;
> +		hend = end & PMD_MASK;
> +		hflush = IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && hstart < hend;
>  
>  		if (type == FLUSH_TYPE_LOCAL) {
>  			asm volatile("ptesync": : :"memory");
> -- 
> 2.34.1
> 
