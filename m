Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802AE154B3
	for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 18:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 870FFC433C8;
	Thu, 17 Aug 2023 18:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692297804;
	bh=s+FzHkTZ7+/nW6qy/nbs3G+I2zrdi33vjcZOKl+Q+hA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T+jlv3pikyACaX5+5tYE0q05lEhoQfHk86P1UDmp9AsD/2vlUHk7uH1BGH7ByFuqa
	 YL5U1O9Fn2ywEeDQ57nNINNwUsrWKPZTomZd++JYV0p99OswFKJdBBnEAbCZRC7z4V
	 EC/CjxnCAeRHNFgKxyIzw+5NZX+jbmjjiAh4Q1pPsq8w7T6Uz60m2m137qzh1XXIX7
	 Ns5iYVtvJhFuYlXT5yzLp/3+DTce4q7PmvWUasW9npOtCfV7TGwXqTUDaHdatGwuXr
	 WWAyv+/kCJASktTurxIp17IuknhhgjhXufCCG64jjnyk7b0PESpj9qGZUqyOhT/wV1
	 +pHGVRvytH/yw==
Date: Thu, 17 Aug 2023 11:43:21 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: ndesaulniers@google.com
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Tom Rix <trix@redhat.com>, Joel Stanley <joel@jms.id.au>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] Revert "powerpc/xmon: Relax frame size for clang"
Message-ID: <20230817184321.GA2428970@dev-arch.thelio-3990X>
References: <20230817-ppc_xmon-v1-1-8cc2d51b9995@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817-ppc_xmon-v1-1-8cc2d51b9995@google.com>

On Thu, Aug 17, 2023 at 11:11:56AM -0700, ndesaulniers@google.com wrote:
> This reverts commit 9c87156cce5a63735d1218f0096a65c50a7a32aa.
> 
> I have not been able to reproduce the reported -Wframe-larger-than=
> warning (or disassembly) with clang-11 or clang-18.
> 
> I don't know precisely when this was fixed in llvm, but it may be time
> to revert this.
> 
> Closes: https://github.com/ClangBuiltLinux/linux/issues/252
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/powerpc/xmon/Makefile | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
> index d334de392e6c..7705aa74a24d 100644
> --- a/arch/powerpc/xmon/Makefile
> +++ b/arch/powerpc/xmon/Makefile
> @@ -10,12 +10,6 @@ KCSAN_SANITIZE := n
>  # Disable ftrace for the entire directory
>  ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_FTRACE)
>  
> -ifdef CONFIG_CC_IS_CLANG
> -# clang stores addresses on the stack causing the frame size to blow
> -# out. See https://github.com/ClangBuiltLinux/linux/issues/252
> -KBUILD_CFLAGS += -Wframe-larger-than=4096
> -endif
> -
>  ccflags-$(CONFIG_PPC64) := $(NO_MINIMAL_TOC)
>  
>  obj-y			+= xmon.o nonstdio.o spr_access.o xmon_bpts.o
> 
> ---
> base-commit: 16931859a6500d360b90aeacab3b505a3560a3ed
> change-id: 20230817-ppc_xmon-d288d803610e
> 
> Best regards,
> -- 
> Nick Desaulniers <ndesaulniers@google.com>
> 
