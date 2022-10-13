Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2D93C36
	for <llvm@lists.linux.dev>; Thu, 13 Oct 2022 17:04:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 163F6C433D6;
	Thu, 13 Oct 2022 17:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665680653;
	bh=zqOuGPwa/tbxCln5Vk/B7tJrtXrhT4FfMEgYWQ0zc2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kxkBFjZ9yx1EkrjGwoOmLrOJbSez+G02Qx4igiM6FEScURddkjIotAnbByplsRJ+m
	 NIPVRgSQM9v3QhHMR6t3ceR9vEznkv4i8JLgPgBTDv1mz0/RzJHUy7PkYeG/ncEOQ8
	 3Jhx0704ENuzSUevRD9rM7TDNjU8JOCeLSzreGdzdN5vmiizVdBHTkKr66SwqiIzBT
	 B8nxctR2iXhO8YmDtFTA4ExfXPwdzdc0kMQM89ykZwlTtVFNRprUoh2/+s3TEf6iZg
	 kBRFWV8wJPoq16RnHWGpt2sIP7sujrKjZNxvxl3fdSvvlh6lc8s01bSTTJsIaCd1Qm
	 eWKTrmpCDFEtw==
Date: Thu, 13 Oct 2022 10:04:11 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Tom Rix <trix@redhat.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Gary Guo <gary@garyguo.net>, Craig Topper <craig.topper@sifive.com>,
	Philip Reames <listmail@philipreames.com>, jh@jhauser.us
Subject: Re: [PATCH] ARM: NWFPE: avoid compiler-generated __aeabi_uldivmod
Message-ID: <Y0hFCzVck/zBFwiX@dev-arch.thelio-3990X>
References: <CAKwvOdnQ-tWa0oY0CKAwJD5WQDgVBvxDtf6=E3hS8Ytz5J1OKg@mail.gmail.com>
 <20221010225342.3903590-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010225342.3903590-1-ndesaulniers@google.com>

On Mon, Oct 10, 2022 at 03:53:42PM -0700, Nick Desaulniers wrote:
> clang-15's ability to elide loops completely became more aggressive when
> it can deduce how a variable is being updated in a loop. Counting down
> one variable by an increment of another can be replaced by a modulo
> operation.
> 
> For 64b variables on 32b ARM EABI targets, this can result in the
> compiler generating calls to __aeabi_uldivmod, which it does for a do
> while loop in float64_rem().
> 
> For the kernel, we'd generally prefer that developers not open code 64b
> division via binary / operators and instead use the more explicit
> helpers from div64.h. On arm-linux-gnuabi targets, failure to do so can
> result in linkage failures due to undefined references to
> __aeabi_uldivmod().
> 
> While developers can avoid open coding divisions on 64b variables, the
> compiler doesn't know that the Linux kernel has a partial implementation
> of a compiler runtime (--rtlib) to enforce this convention.
> 
> It's also undecidable for the compiler whether the code in question
> would be faster to execute the loop vs elide it and do the 64b division.
> 
> While I actively avoid using the internal -mllvm command line flags, I
> think we get better code than using barrier() here, which will force
> reloads+spills in the loop for all toolchains.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1666
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

I built ARCH=arm allmodconfig + CONFIG_WERROR=n without this patch and
saw the link failure then applied it and the error went away. Thanks for
all the investigation done into fixing this! I think you put this in the
patch tracker already but just for posterity:

Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/arm/nwfpe/Makefile | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/nwfpe/Makefile b/arch/arm/nwfpe/Makefile
> index 303400fa2cdf..2aec85ab1e8b 100644
> --- a/arch/arm/nwfpe/Makefile
> +++ b/arch/arm/nwfpe/Makefile
> @@ -11,3 +11,9 @@ nwfpe-y				+= fpa11.o fpa11_cpdo.o fpa11_cpdt.o \
>  				   entry.o
>  
>  nwfpe-$(CONFIG_FPE_NWFPE_XP)	+= extended_cpdo.o
> +
> +# Try really hard to avoid generating calls to __aeabi_uldivmod() from
> +# float64_rem() due to loop elision.
> +ifdef CONFIG_CC_IS_CLANG
> +CFLAGS_softfloat.o	+= -mllvm -replexitval=never
> +endif
> -- 
> 2.38.0.rc2.412.g84df46c1b4-goog
> 
