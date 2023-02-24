Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B665197
	for <llvm@lists.linux.dev>; Fri, 24 Feb 2023 16:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5477EC433D2;
	Fri, 24 Feb 2023 16:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677256650;
	bh=5KoQTxArulQ7bM11DTjGz3jpBGFaiF67rqpLvKCWpdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QT3lnmzoBM8WBMSOtsmWwtV/MjjuR4LlWs7fV+LRoEEcojnIAajocqIaN8QTd5U95
	 BCLXCInp+XtxHHlUU7WCazrUcZpRJKgJRT15TE+LX2GT9gYxQt79WXdnthPc0LfIzr
	 QzISB4RSDm/THC8QT+99L8duDhQdD23jvG18aOPLTPEtduUF0xfYiQAA9UXTRNvFUM
	 Pc0j+FCmpDuQRgP5LJKjtEerJwMA3sZjtexUrf9EL+kw78XmTg48XcMX8tosBJ38xl
	 zfX/IJVQhrDtZtCkINutpNf9yGz10pPEOorK7POER2Pn6eYQS5biM3g4g36Y7UsEie
	 XdOLx7qvA/PzA==
Date: Fri, 24 Feb 2023 09:37:28 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: palmer@dabbelt.com, Conor Dooley <conor.dooley@microchip.com>,
	naresh.kamboju@linaro.org, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v1 1/2] RISC-V: move zicsr/zifencei spec version check to
 Kconfig
Message-ID: <Y/jnyJZNZC1X6IO8@dev-arch.thelio-3990X>
References: <20230223220546.52879-1-conor@kernel.org>
 <20230223220546.52879-2-conor@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223220546.52879-2-conor@kernel.org>

On Thu, Feb 23, 2023 at 10:05:45PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Checking whether binutils defaults to using a version of the spec
> requiring zicsr/zifencei being done in our Makefile is functionally
> sufficient at present, but makes it harder to tell after the fact
> which extensions are enabled.
> By moving it to Kconfig, it's easy to tell from standard build artifacts
> what has been done & the road is paved for dealing with this differently
> for both binutils and LLVM.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/riscv/Kconfig  | 10 ++++++++++
>  arch/riscv/Makefile |  5 +----
>  2 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index cebf0c5f8824..4eb0ef8314b3 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -288,6 +288,16 @@ config ARCH_RV64I
>  
>  endchoice
>  
> +config TOOLCHAIN_NEEDS_SPEC_20191213

This symbol's name is a little confusing to me, how does the toolchain
need spec version 20191213. Maybe 'SPEC_20191213' should be something
like 'EXPLICIT_ZICSR_ZIFENCEI'? Otherwise, maybe it should be something
like 'TOOLCHAIN_HAS_DEFAULT_SPEC_20191213'? Sorry for the bikeshed but I
think most Kconfig symbols should be self describing.

> +	bool
> +	default y
> +	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zicsr_zifencei)
> +	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zicsr_zifencei)
> +	help
> +	  Newer binutils versions default to ISA spec version 20191213 which
> +	  moves some instructions from the I extension to the Zicsr and Zifencei
> +	  extensions.
> +
>  # We must be able to map all physical memory into the kernel, but the compiler
>  # is still a bit more efficient when generating code if it's setup in a manner
>  # such that it can only map 2GiB of memory.
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 12d91b0a73d8..7e1267b0e73f 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -53,10 +53,7 @@ riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
>  riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
>  riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
>  
> -# Newer binutils versions default to ISA spec version 20191213 which moves some
> -# instructions from the I extension to the Zicsr and Zifencei extensions.
> -toolchain-need-zicsr-zifencei := $(call cc-option-yn, -march=$(riscv-march-y)_zicsr_zifencei)
> -riscv-march-$(toolchain-need-zicsr-zifencei) := $(riscv-march-y)_zicsr_zifencei
> +riscv-march-$(CONFIG_TOOLCHAIN_NEEDS_SPEC_20191213) := $(riscv-march-y)_zicsr_zifencei
>  
>  # Check if the toolchain supports Zicbom extension
>  riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZICBOM) := $(riscv-march-y)_zicbom
> -- 
> 2.39.1
> 
