Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC6DBE73
	for <llvm@lists.linux.dev>; Fri,  5 May 2023 21:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ED6EC433EF;
	Fri,  5 May 2023 21:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683322782;
	bh=cILfvmoswcEBzyPHAhPkq6mCHjMjBKjUv/slG43XOg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HZAeO2BWf/kwg4cSHxmU5VAMjLOAXTmzlF5xf5+Y8jSjD1XaWYbclTUhX1syrAgmO
	 GIUtt4g7zj1VJIErGvktnNEbIAU8zgXkHPjDodhIoCwzOr22+VoeUI+HnbRanM20XQ
	 Wc+xdGWWsyzqNgz9RMukYoP6Tl2+3rBP5TMfbWM5USVjcBEI2nOQvXwFfTk5WYv7yL
	 kHTrjq5WxAM7lCmdwPAuSo4PVO+E+idULMg3JhojzKht62IlxjDke0HcaV7InaTDOe
	 tjHqScMDue2ESP8NmeqMSqbKmwBX5/+1RHOEGEClRb5l0YVQzhkc/ZE/E17LLuIM5W
	 rJ6FcB6AhSUPA==
Date: Fri, 5 May 2023 14:39:40 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev
Subject: Re: [PATCH 1/4] powerpc/64: Force ELFv2 when building with LLVM
 linker
Message-ID: <20230505213940.GA1337526@dev-arch.thelio-3990X>
References: <20230505071850.228734-1-npiggin@gmail.com>
 <20230505071850.228734-2-npiggin@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230505071850.228734-2-npiggin@gmail.com>

Hi Nick,

+ our mailing list, helps with review and making sure that we are not
missing anything :)

On Fri, May 05, 2023 at 05:18:47PM +1000, Nicholas Piggin wrote:
> The LLVM linker does not support ELFv1 at all, so BE kernels must be
> built with ELFv2. The LLD version check was added to be conservative,
> but previous LLD versions would simply fail to link ELFv1 entirely. The
> only would be to require LLD >= 15 for BE builds, but let's instead
> remove that restriction until proven otherwise (LLD 14.0 links a booting
> ELFv2 BE vmlinux for me).
> 
> The minimum binutils has increased such that ELFv2 is always supported,
> so remove that check while we're here.
> 
> Cc: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Thanks for this change! I ran it through my (admittedly limited set of)
build tests with LD=ld.lld for big endian configurations and I saw no
build errors with LLVM 11.1.0 through 16.0.3 (and currently, a 17.0.0
built from main); my simple QEMU boot testing passed as well.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

One small comment below.

> ---
>  arch/powerpc/Kconfig | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index acffffbd5d77..e5d81645c902 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -624,10 +624,11 @@ config ARCH_HAS_KEXEC_PURGATORY
>  	def_bool KEXEC_FILE
>  
>  config PPC64_BIG_ENDIAN_ELF_ABI_V2
> -	bool "Build big-endian kernel using ELF ABI V2 (EXPERIMENTAL)"
> +	prompt "Build big-endian kernel using ELF ABI V2 (EXPERIMENTAL)" if LD_IS_BFD
> +	bool

This could be

    bool "Build big-endian kernel using ELF ABI V2 (EXPERIMENTAL)" if LD_IS_BFD

which is the syntactic sugar equivalent of what you already have.

The rest looks good to me.

> +	default y if LD_IS_LLD
>  	depends on PPC64 && CPU_BIG_ENDIAN
>  	depends on CC_HAS_ELFV2
> -	depends on LD_VERSION >= 22400 || LLD_VERSION >= 150000
>  	help
>  	  This builds the kernel image using the "Power Architecture 64-Bit ELF
>  	  V2 ABI Specification", which has a reduced stack overhead and faster
> @@ -638,8 +639,6 @@ config PPC64_BIG_ENDIAN_ELF_ABI_V2
>  	  it is less well tested by kernel and toolchain. However some distros
>  	  build userspace this way, and it can produce a functioning kernel.
>  
> -	  This requires GCC and binutils 2.24 or newer.
> -
>  config RELOCATABLE
>  	bool "Build a relocatable kernel"
>  	depends on PPC64 || (FLATMEM && (44x || PPC_85xx))
> -- 
> 2.40.1
> 
