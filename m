Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B034690
	for <llvm@lists.linux.dev>; Thu,  6 Oct 2022 18:18:24 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ogV3x-0001hI-UG; Thu, 06 Oct 2022 19:53:37 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Conor Dooley <conor@kernel.org>
Cc: Tom Rix <trix@redhat.com>, Conor Dooley <conor.dooley@microchip.com>, Dao Lu <daolu@rivosinc.com>, Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 1/2] riscv: fix detection of toolchain Zicbom support
Date: Thu, 06 Oct 2022 19:53:36 +0200
Message-ID: <14737143.tv2OnDr8pf@diego>
In-Reply-To: <20221006173520.1785507-2-conor@kernel.org>
References: <20221006173520.1785507-1-conor@kernel.org> <20221006173520.1785507-2-conor@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Conor,

Am Donnerstag, 6. Oktober 2022, 19:35:20 CEST schrieb Conor Dooley:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> It is not sufficient to check if a toolchain supports a particular
> extension without checking if the linker supports that extension too.
> For example, Clang 15 supports Zicbom but GNU bintutils 2.35.2 does
> not, leading build errors like so:
> 
> riscv64-linux-gnu-ld: -march=rv64i2p0_m2p0_a2p0_c2p0_zicbom1p0_zihintpause2p0: Invalid or unknown z ISA extension: 'zicbom'
> 
> Convert CC_HAS_ZICBOM to TOOLCHAIN_HAS_ZICBOM & check if the linker
> also supports Zicbom.
> 
> Reported-by: Kevin Hilman <khilman@baylibre.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1714
> Link: https://storage.kernelci.org/next/master/next-20220920/riscv/defconfig+CONFIG_EFI=n/clang-16/logs/kernel.log
> Fixes: 1631ba1259d6 ("riscv: Add support for non-coherent devices using zicbom extension")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/Kconfig  | 10 ++++++----
>  arch/riscv/Makefile |  3 +--
>  2 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index d557cc50295d..6da36553158b 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -401,14 +401,16 @@ config RISCV_ISA_SVPBMT
>  
>  	   If you don't know what to do here, say Y.
>  
> -config CC_HAS_ZICBOM
> +config TOOLCHAIN_HAS_ZICBOM
>  	bool
> -	default y if 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicbom)
> -	default y if 32BIT && $(cc-option,-mabi=ilp32 -march=rv32ima_zicbom)
> +	default y
> +	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zicbom)
> +	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zicbom)
> +	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900

I did needed to look quite closely at the cc-option-voodoo, but it really
seems to work out as expected :-)

I can't say much to the specific L(L)D_VERSION values but the change itself
looks good, so

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

>  
>  config RISCV_ISA_ZICBOM
>  	bool "Zicbom extension support for non-coherent DMA operation"
> -	depends on CC_HAS_ZICBOM
> +	depends on TOOLCHAIN_HAS_ZICBOM
>  	depends on !XIP_KERNEL && MMU
>  	select RISCV_DMA_NONCOHERENT
>  	select RISCV_ALTERNATIVE
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 3fa8ef336822..3607d38edb4f 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -57,8 +57,7 @@ toolchain-need-zicsr-zifencei := $(call cc-option-yn, -march=$(riscv-march-y)_zi
>  riscv-march-$(toolchain-need-zicsr-zifencei) := $(riscv-march-y)_zicsr_zifencei
>  
>  # Check if the toolchain supports Zicbom extension
> -toolchain-supports-zicbom := $(call cc-option-yn, -march=$(riscv-march-y)_zicbom)
> -riscv-march-$(toolchain-supports-zicbom) := $(riscv-march-y)_zicbom
> +riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZICBOM) := $(riscv-march-y)_zicbom
>  
>  # Check if the toolchain supports Zihintpause extension
>  toolchain-supports-zihintpause := $(call cc-option-yn, -march=$(riscv-march-y)_zihintpause)
> 




