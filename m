Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0879196
	for <llvm@lists.linux.dev>; Thu, 19 Jan 2023 18:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D091EC433EF;
	Thu, 19 Jan 2023 18:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674153884;
	bh=faXqnVFxCaTO+HtK1xtCzq7sAIRKpPiqBX5y1aM7img=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KVvIxldflGICga3EBD5uaWrtAUhoh/WyERGIzSbbuIGRrw6/PseX4Tx1/TlDHTBVj
	 VngIeotz5JNDs5M+U8Q+XSuJF/fGsAUaou+vEHp9wQuqfSnQ8xyP9TPAfYNmjxYO+d
	 6EeGzkl+0fc6OC9Wl5QWvJY8taGwaWkdM07++BbHxAml957M6Rfsvh+6PRKL7I7dP7
	 7tPbGwvVMsV2wQ8alBZDhED5dNbA6g1prHu/pvgSt5E9DQ9zhOk+wcuyfTuKfQlwDA
	 5EhCex68o/NXykbN1N/2xWxoUkkWoa+gdhvgqwO0VJ2gTCu6auDaZkXSH3T3Ghkv45
	 16el007k447Dw==
Date: Thu, 19 Jan 2023 11:44:42 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, llvm@lists.linux.dev
Subject: Re: [PATCH] powerpc: add crtsavres.o to always-y instead of extra-y
Message-ID: <Y8mPmqDWiRJNdXs/@thelio-3990X>
References: <20230119082447.152020-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119082447.152020-1-masahiroy@kernel.org>

On Thu, Jan 19, 2023 at 05:24:47PM +0900, Masahiro Yamada wrote:
> crtsavres.o is linked to modules, but as commit d0e628cd817f ("kbuild:
> doc: clarify the difference between extra-y and always-y") explained,
> 'make modules' does not build extra-y.
> 
> The following command fails:
> 
>   $ make ARCH=powerpc LLVM=1 mrproper ps3_defconfig modules
>     [snip]
>     LD [M]  arch/powerpc/platforms/cell/spufs/spufs.ko
>   ld.lld: error: cannot open arch/powerpc/lib/crtsavres.o: No such file or directory
>   make[1]: *** [scripts/Makefile.modfinal:61: arch/powerpc/platforms/cell/spufs/spufs.ko] Error 1
>   make: *** [Makefile:1924: modules] Error 2
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  arch/powerpc/lib/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
> index c53618c34b70..aa34854bc9f5 100644
> --- a/arch/powerpc/lib/Makefile
> +++ b/arch/powerpc/lib/Makefile
> @@ -43,7 +43,7 @@ obj-$(CONFIG_FUNCTION_ERROR_INJECTION)	+= error-inject.o
>  # so it is only needed for modules, and only for older linkers which
>  # do not support --save-restore-funcs
>  ifndef CONFIG_LD_IS_BFD
> -extra-$(CONFIG_PPC64)	+= crtsavres.o
> +always-$(CONFIG_PPC64)	+= crtsavres.o
>  endif
>  
>  obj-$(CONFIG_PPC_BOOK3S_64) += copyuser_power7.o copypage_power7.o \
> -- 
> 2.34.1
> 
