Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9DB68
	for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 18:07:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FBD6C34600;
	Tue, 14 Dec 2021 18:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639505245;
	bh=Stm5uOveGVCEyNV3RbZzb/wig7WP56mvtkLDAPKxtoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=grnWu+CC+UXNtt2xIYImlpZizByi6T0+gtk3JgaEVIeeIgsFzsSj7i8fG4S+IBeql
	 IXuo0sqoqxBLEv45fLawcU4Y+tNfEK2XUKNhwRitLkDLFfA0yZqrv+kmylKzDSNSlB
	 9FXOlVc+5HtfxtHLLTLm1lmbUNHPVb37nvrM+QPurLe6HdtSd0sIMUxTVb0W3X9dXg
	 VNq+p5AQ2N8dCmAaWpIjI+9g4iARSly8c3fkWB4DF//Wz2KKpbvHDrGYh/gZ4nWsCa
	 vNikNhUFgBtRzA179V2KH4cUv6oZfFvds6UxQEqF9Hzo1zxBKKwm3gKFXv4RcjXUk8
	 vS+bj84vU8zIQ==
Date: Tue, 14 Dec 2021 11:07:21 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Nick Desaulniers <ndesaulniers@google.com>, list@opendingux.net,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 2/3] MIPS: boot/compressed: Build without LTO
Message-ID: <YbjdWe+i6wQduHEq@archlinux-ax161>
References: <20211213224914.1501303-1-paul@crapouillou.net>
 <20211213224914.1501303-3-paul@crapouillou.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211213224914.1501303-3-paul@crapouillou.net>

On Mon, Dec 13, 2021 at 10:49:13PM +0000, Paul Cercueil wrote:
> We need a valid ELF object for dummy.o, so that objcopy can insert the
> vmlinuz payload.
> 
> Therefore, we must build the decompresser program without LTO, otherwise
> dummy.o will be LLVM bytecode instead of a ELF object file.
> 
> Building the decompresser with LTO wouldn't make much sense anyway,
> unlike building the vmlinuz itself with LTO.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Seems reasonable.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/mips/boot/compressed/Makefile | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
> index 4c9ecfbb0ef4..2d01c50fb0b1 100644
> --- a/arch/mips/boot/compressed/Makefile
> +++ b/arch/mips/boot/compressed/Makefile
> @@ -27,6 +27,9 @@ ifdef CONFIG_CPU_LOONGSON64
>  KBUILD_CFLAGS := $(filter-out -march=loongson3a, $(KBUILD_CFLAGS)) -march=mips64r2
>  endif
>  
> +# Disable LTO
> +KBUILD_CFLAGS := $(filter-out $(CC_FLAGS_LTO), $(KBUILD_CFLAGS))
> +
>  KBUILD_CFLAGS := $(KBUILD_CFLAGS) -mno-abicalls -D__KERNEL__ -D__DISABLE_EXPORTS \
>  	-DBOOT_HEAP_SIZE=$(BOOT_HEAP_SIZE) -D"VMLINUX_LOAD_ADDRESS_ULL=$(VMLINUX_LOAD_ADDRESS)ull"
>  
> -- 
> 2.33.0
> 
> 
