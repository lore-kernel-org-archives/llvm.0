Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38554420
	for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 17:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24210C34115;
	Mon, 11 Jul 2022 17:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657560970;
	bh=/JLD7aGPAUH2PlEjhKv8uoAqs8/TyZRWMWlU6+jVWgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BlYkvo3bixwtbU6hCps4/5JfqYhJ5pR2zL0s9D0OlM2Jp2Dq/8xx2NK4NAJ3JQGpB
	 gZKYcK/HJ0O/zdgNbOOQgmZ5FqPOB1TYqKj2ZSzQhXEleq4K1Yke3XCISkRbSBoKoF
	 JnOWU17WoB5SRUA9UhoLCKQ5RumJqm0l3Sr44Q/44UZSp3aFVRGOWlFQlxjvItLSVB
	 3oSTQGA41U2Y6wP5oEEeiTT3/7HoXz48tkpb9ji8x++aED+S76Y3Xlz6ASpoyfUBDS
	 dUz6dqIlSjUa5nNmaQ4hC0FAB9ViMDG+QJup58Hm5ldq8LeBjyJAkmGigAd8T8TAUC
	 DDinQqc3d8l6Q==
Date: Mon, 11 Jul 2022 10:36:08 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Fangrui Song <maskray@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	Khem Raj <raj.khem@gmail.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] riscv: Pass -mno-relax only on lld < 15.0.0
Message-ID: <YsxfiKC/ZBr7U7qI@dev-arch.thelio-3990X>
References: <20220710071117.446112-1-maskray@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710071117.446112-1-maskray@google.com>

On Sun, Jul 10, 2022 at 12:11:17AM -0700, Fangrui Song wrote:
> lld since
> https://github.com/llvm/llvm-project/commit/6611d58f5bbcbec77262d392e2923e1d680f6985
> (milestone: 15.0.0) has implemented some RISC-V linker relaxation.
> -mno-relax is no longer needed in KBUILD_CFLAGS/KBUILD_AFLAGS to
> suppress R_RISCV_ALIGN which older lld can not handle:
> 
> ld.lld: error: capability.c:(.fixup+0x0): relocation R_RISCV_ALIGN requires unimplemented linker relaxation; recompile with -mno-relax but the .o is already compiled with -mno-relax
> 
> Signed-off-by: Fangrui Song <maskray@google.com>

ld.lld 14 and 15 both continue to link kernels and I have no issues
booting them in QEMU.

Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/riscv/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 34cf8a598617..7e4ceb2a0981 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -37,6 +37,7 @@ else
>  endif
>  
>  ifeq ($(CONFIG_LD_IS_LLD),y)
> +ifeq ($(shell test $(CONFIG_LLD_VERSION) -lt 150000; echo $$?),0)
>  	KBUILD_CFLAGS += -mno-relax
>  	KBUILD_AFLAGS += -mno-relax
>  ifndef CONFIG_AS_IS_LLVM
> @@ -44,6 +45,7 @@ ifndef CONFIG_AS_IS_LLVM
>  	KBUILD_AFLAGS += -Wa,-mno-relax
>  endif
>  endif
> +endif
>  
>  # ISA string setting
>  riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
> -- 
> 2.37.0.144.g8ac04bfd2-goog
> 
> 
