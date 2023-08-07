Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5775C11CBE
	for <llvm@lists.linux.dev>; Mon,  7 Aug 2023 16:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD06C433C8;
	Mon,  7 Aug 2023 16:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691427328;
	bh=WU3AeiqSRDkKCekepGZR4kr95/r5A21Ia8054t6T2ec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y3NQqGi+B4y/KPTi4YTTMJpZixaDzDrB70X+f+DCDBOWJl6H2ZNBdO0n1AeyWxgJi
	 4AjZffAdBLZH+6iv1WA/yETU8ipTXzrSFmHtx5EvwUx8ONAdHXcTIjd+RILAD+WqVd
	 kvNWewKH0h3l0O03+5UeMobT9dBL3JSHQscCN4xds06zOpnQJSLS6Y0tIH7HR9md5P
	 N7mjgGppNygMOFSCZCduREpb5r7JY78NSidBD6lJN3n3OktnlcwWhXQ/y6WwBKMZUO
	 QIsvJ3sFcttsVrQc2mj2XvoR2Hoz+fOeTJuxO2x+iyP5itbuN5ksXEjy2FD8b2cxe8
	 eYrCsM4skQHJA==
Date: Mon, 7 Aug 2023 09:55:26 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] Makefile.extrawarn: enable
 -Wmissing-variable-declarations for W=1
Message-ID: <20230807165526.GA2744968@dev-arch.thelio-3990X>
References: <20230807-missing_proto-v1-1-7f566b7ba5ca@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230807-missing_proto-v1-1-7f566b7ba5ca@google.com>

On Mon, Aug 07, 2023 at 09:50:32AM -0700, Nick Desaulniers wrote:
> I noticed Tom was sending patches where smatch was recommending
> annotating functions as static when no previous declaration existed.
> Surely the compiler could make such recommendations as well, I thought.
> 
> Looks like -Wmissing-variable-declarations can make such
> recommendations.
> 
> GCC just added support for this warning (gcc 14.1.0 will ship with
> support), and all versions of clang relevant to building the kernel
> support this flag.
> 
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Any idea how many instances of this there are? At least x86_64 defconfig
fails immediately with:

  In file included from scripts/mod/devicetable-offsets.c:3:
  In file included from include/linux/mod_devicetable.h:14:
  In file included from include/linux/uuid.h:11:
  In file included from include/linux/string.h:20:
  In file included from arch/x86/include/asm/string.h:5:
  In file included from arch/x86/include/asm/string_64.h:6:
  In file included from include/linux/jump_label.h:112:
  In file included from arch/x86/include/asm/jump_label.h:7:
  arch/x86/include/asm/asm.h:208:24: error: no previous extern declaration for non-static variable 'current_stack_pointer' [-Werror,-Wmissing-variable-declarations]
    208 | register unsigned long current_stack_pointer asm(_ASM_SP);
        |                        ^
  arch/x86/include/asm/asm.h:208:10: note: declare 'static' if the variable is not intended to be used outside of this translation unit
    208 | register unsigned long current_stack_pointer asm(_ASM_SP);
        |          ^
  1 error generated.

> ---
>  scripts/Makefile.extrawarn | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 40cd13eca82e..617739eb84e2 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -32,6 +32,7 @@ KBUILD_CFLAGS += $(call cc-option, -Wunused-but-set-variable)
>  KBUILD_CFLAGS += $(call cc-option, -Wunused-const-variable)
>  KBUILD_CFLAGS += $(call cc-option, -Wpacked-not-aligned)
>  KBUILD_CFLAGS += $(call cc-option, -Wstringop-truncation)
> +KBUILD_CFLAGS += $(call cc-option, -Wmissing-varibale-declarations)
                                                ^ variable
>  # The following turn off the warnings enabled by -Wextra
>  KBUILD_CFLAGS += -Wno-missing-field-initializers
>  KBUILD_CFLAGS += -Wno-sign-compare
> 
> ---
> base-commit: 52a93d39b17dc7eb98b6aa3edb93943248e03b2f
> change-id: 20230807-missing_proto-0cb90ec6454c
> 
> Best regards,
> -- 
> Nick Desaulniers <ndesaulniers@google.com>
> 
