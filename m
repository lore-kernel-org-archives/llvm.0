Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4782B29A0
	for <llvm@lists.linux.dev>; Wed,  2 Nov 2022 19:28:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EE96C433C1;
	Wed,  2 Nov 2022 19:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667417281;
	bh=V99NLxJ1CDCsDjWVw5q4vkveJIgk3tjkI5VceymN/co=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ue9CFnS8VoJ6tE2L4PugKig1jik6FLf1TPSy6ukmoIcd4SGDw/xJxpfndt8isuMLz
	 0SEYkArxfClPVmQr/5nrjAxBscJZG5jdke9prS736gnUDwCTm87EAV6Q1mKWbpWkHn
	 xVBlONl1r1sBHrPHgy0BcuOKdm//X7MUHZy3or0ywjhzy3ul7Cbv8w6X+ET1z0Hjs/
	 dYU+h7K04Dx38NhV8RBStlzaZzInMw2NpbYzcEtZUPOMaFoabxlcI4/nKpttT37VTF
	 /N1VnRXvE8gndLvs+4DTCsoh6R7avGfydive79lfFVHAb3EfCrNic3BvFllDKEiBya
	 KqygYaMs2qMOw==
Date: Wed, 2 Nov 2022 12:27:58 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Rongwei Zhang <pudh4418@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Ralf Baechle <ralf@linux-mips.org>,
	Maxim Uvarov <muvarov@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] MIPS: fix duplicate definitions for exported symbols
Message-ID: <Y2LEvg5PEdbAtQ3e@dev-arch.thelio-3990X>
References: <Y2JiO+67E1NyFgca@pudh-loong.localdomain>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2JiO+67E1NyFgca@pudh-loong.localdomain>

On Wed, Nov 02, 2022 at 08:27:39PM +0800, Rongwei Zhang wrote:
> Building with clang-14 fails with:
> 
> AS      arch/mips/kernel/relocate_kernel.o
> <unknown>:0: error: symbol 'kexec_args' is already defined
> <unknown>:0: error: symbol 'secondary_kexec_args' is already defined
> <unknown>:0: error: symbol 'kexec_start_address' is already defined
> <unknown>:0: error: symbol 'kexec_indirection_page' is already defined
> <unknown>:0: error: symbol 'relocate_new_kernel_size' is already defined
> 
> It turns out EXPORT defined in asm/asm.h expands to a symbol definition,
> so there is no need to define these symbols again. Remove duplicated
> symbol definitions.
> 
> Fixes: 7aa1c8f47e7e ("MIPS: kdump: Add support")
> Signed-off-by: Rongwei Zhang <pudh4418@gmail.com>

Indeed. I had a similar diff when I looked into this late last year but
I never got around to sending that diff.

https://github.com/ClangBuiltLinux/linux/issues/1528#issuecomment-988235109

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch!

> ---
>  arch/mips/kernel/relocate_kernel.S | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/mips/kernel/relocate_kernel.S b/arch/mips/kernel/relocate_kernel.S
> index cfde14b48fd8..f5b2ef979b43 100644
> --- a/arch/mips/kernel/relocate_kernel.S
> +++ b/arch/mips/kernel/relocate_kernel.S
> @@ -145,8 +145,7 @@ LEAF(kexec_smp_wait)
>   * kexec_args[0..3] are used to prepare register values.
>   */
>  
> -kexec_args:
> -	EXPORT(kexec_args)
> +EXPORT(kexec_args)
>  arg0:	PTR_WD		0x0
>  arg1:	PTR_WD		0x0
>  arg2:	PTR_WD		0x0
> @@ -159,8 +158,7 @@ arg3:	PTR_WD		0x0
>   * their registers a0-a3. secondary_kexec_args[0..3] are used
>   * to prepare register values.
>   */
> -secondary_kexec_args:
> -	EXPORT(secondary_kexec_args)
> +EXPORT(secondary_kexec_args)
>  s_arg0: PTR_WD		0x0
>  s_arg1: PTR_WD		0x0
>  s_arg2: PTR_WD		0x0
> @@ -171,19 +169,16 @@ kexec_flag:
>  
>  #endif
>  
> -kexec_start_address:
> -	EXPORT(kexec_start_address)
> +EXPORT(kexec_start_address)
>  	PTR_WD		0x0
>  	.size		kexec_start_address, PTRSIZE
>  
> -kexec_indirection_page:
> -	EXPORT(kexec_indirection_page)
> +EXPORT(kexec_indirection_page)
>  	PTR_WD		0
>  	.size		kexec_indirection_page, PTRSIZE
>  
>  relocate_new_kernel_end:
>  
> -relocate_new_kernel_size:
> -	EXPORT(relocate_new_kernel_size)
> +EXPORT(relocate_new_kernel_size)
>  	PTR_WD		relocate_new_kernel_end - relocate_new_kernel
>  	.size		relocate_new_kernel_size, PTRSIZE
> -- 
> 2.38.1
> 
