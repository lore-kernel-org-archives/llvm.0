Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E455580
	for <llvm@lists.linux.dev>; Sat, 19 Feb 2022 16:45:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3589AC004E1;
	Sat, 19 Feb 2022 16:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645289114;
	bh=fFFD3oN5cDl0TnwcVvL6+V1rI+rC3W6wYV3VSS5WoTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SY1E+ESkV+fUwtZzdZf7bHMG4LTNlMvATCd4VfhdPp6PfnmGFEokz24snDZ7vK7ZN
	 69Iw+9pl3NtRQ18pzh3kqsuAe+s3A3W/qBAOw/kHJU2XBpsNVvYtOl9Jci8P1S0+rP
	 A9pnP7BX2Rw767poeN69xONghRMuaRgjn4dxWgSADCdFH3LVK7sCKzzJbTnC1tqvzy
	 ORy0Z7AmR5HVZJlbyw3MZssIoSIoRr9RcOw5Cxm5KTtNBVbPqzqzsznKJa2Aqnwqq4
	 hINwwg9iBLIquncP5kuk0nsS3EZiSAu3TRgF8FeiBeNGY6R+uSGI2fBHGxDwN2K2EK
	 zARiwFZLUbNHQ==
Date: Sat, 19 Feb 2022 09:45:10 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Fangrui Song <maskray@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] riscv module: remove (NOLOAD)
Message-ID: <YhEelqnPDr1u4uTD@dev-arch.archlinux-ax161>
References: <20220218082611.396353-1-maskray@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220218082611.396353-1-maskray@google.com>

On Fri, Feb 18, 2022 at 12:26:11AM -0800, Fangrui Song wrote:
> On ELF, (NOLOAD) sets the section type to SHT_NOBITS[1]. It is conceptually
> inappropriate for .plt, .got, and .got.plt sections which are always
> SHT_PROGBITS.
> 
> In GNU ld, if PLT entries are needed, .plt will be SHT_PROGBITS anyway
> and (NOLOAD) will be essentially ignored. In ld.lld, since
> https://reviews.llvm.org/D118840 ("[ELF] Support (TYPE=<value>) to
> customize the output section type"), ld.lld will report a `section type
> mismatch` error. Just remove (NOLOAD) to fix the error.
> 
> [1] https://lld.llvm.org/ELF/linker_script.html As of today, "The
> section should be marked as not loadable" on
> https://sourceware.org/binutils/docs/ld/Output-Section-Type.html is
> outdated for ELF.

Thank you for the patch! As mentioned on the arm64 patch, this needs
your Signed-off-by tag. With that provided:

Cc: stable@vger.kernel.org
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

This needs to go to stable so that older trees with a newer toolchain do
not warn.

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
> 2.35.1.265.g69c8d7142f-goog
> 
> 
