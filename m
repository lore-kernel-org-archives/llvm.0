Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1FD7A
	for <llvm@lists.linux.dev>; Tue, 22 Mar 2022 01:49:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D7A3C340E8;
	Tue, 22 Mar 2022 01:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647913759;
	bh=ddTucoDObbko3r4dIUh3A+Wyax31f7BdaGshebkC8ak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vKS5FvHjypP7+oJU8VJ14xcilm7aYOXpmyBeLBmAH286j/eeSjrthKWCl25Zbex89
	 a6GKYtJXzFMK+KIUMk5ZBKMAFLpOa7+ti+XarxoocpWXsIV8ukU9iJykHePX9BveSk
	 Ys1ebK1KcjmbhfykfeMYl3he4JrKtNQoeOxricTKyRMcGnab2jhXjS9VSxqR0v+Ldp
	 pnsBMh5sH9axv+mpcDXKuwJ+vM08aYb2My7MVG2YXIcP3PJhXEwsxkaRrT0x9CwA+p
	 XZjYSBBQmJTLbjJktpXLNbHAAbYDjNfRE5WtmoUZvKOTt+P3R3Lb6JkvESNOjQjWG9
	 L7HUDpcVyJJ3w==
Date: Mon, 21 Mar 2022 18:49:12 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Fangrui Song <maskray@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] riscv module: remove (NOLOAD)
Message-ID: <YjkrGAqx9nl/PtWh@dev-arch.thelio-3990X>
References: <mhng-7fe2c5d9-a8e6-4123-ac5c-0c9190792520@palmer-ri-x1c9>
 <20220322012617.3517297-1-maskray@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220322012617.3517297-1-maskray@google.com>

On Mon, Mar 21, 2022 at 06:26:17PM -0700, Fangrui Song wrote:
> On ELF, (NOLOAD) sets the section type to SHT_NOBITS[1]. It is conceptually
> inappropriate for .plt, .got, and .got.plt sections which are always
> SHT_PROGBITS.
> 
> In GNU ld, if PLT entries are needed, .plt will be SHT_PROGBITS anyway
> and (NOLOAD) will be essentially ignored. In ld.lld, since
> https://reviews.llvm.org/D118840 ("[ELF] Support (TYPE=<value>) to
> customize the output section type"), ld.lld will report a `section type
> mismatch` error (later changed to a warning). Just remove (NOLOAD) to
> fix the warning.
> 
> [1] https://lld.llvm.org/ELF/linker_script.html As of today, "The
> section should be marked as not loadable" on
> https://sourceware.org/binutils/docs/ld/Output-Section-Type.html is
> outdated for ELF.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1597
> Fixes: ab1ef68e5401 ("RISC-V: Add sections of PLT and GOT for kernel module")
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Fangrui Song <maskray@google.com>

Thank you for the resend! I think the Fixes: tag you chose is more
accurate than Palmer's suggested one. Same tags as v1, if Palmer would
not mind taking them while applying:

Cc: stable@vger.kernel.org
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/riscv/include/asm/module.lds.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/module.lds.h b/arch/riscv/include/asm/module.lds.h
> index 4254ff2ff049..1075beae1ac6 100644
> --- a/arch/riscv/include/asm/module.lds.h
> +++ b/arch/riscv/include/asm/module.lds.h
> @@ -2,8 +2,8 @@
>  /* Copyright (C) 2017 Andes Technology Corporation */
>  #ifdef CONFIG_MODULE_SECTIONS
>  SECTIONS {
> -	.plt (NOLOAD) : { BYTE(0) }
> -	.got (NOLOAD) : { BYTE(0) }
> -	.got.plt (NOLOAD) : { BYTE(0) }
> +	.plt : { BYTE(0) }
> +	.got : { BYTE(0) }
> +	.got.plt : { BYTE(0) }
>  }
>  #endif
> -- 
> 2.35.1.894.gb6a874cedc-goog
> 
