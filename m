Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790422C80
	for <llvm@lists.linux.dev>; Thu,  7 Oct 2021 08:02:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6DD4C61053;
	Thu,  7 Oct 2021 08:02:05 +0000 (UTC)
Date: Thu, 7 Oct 2021 09:02:02 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] elfcore: correct reference to CONFIG_UML
Message-ID: <YV6pejGzLy5ppEpt@arm.com>
References: <20211006082209.417-1-lukas.bulwahn@gmail.com>
 <CAKwvOd=X-ZFPraS2EL24ps1aKdT3bWhtASA0vUjXdzo655XGiQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOd=X-ZFPraS2EL24ps1aKdT3bWhtASA0vUjXdzo655XGiQ@mail.gmail.com>

On Wed, Oct 6, 2021 at 1:22 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> Commit 6e7b64b9dd6d ("elfcore: fix building with clang") introduces
> special handling for two architectures, ia64 and User Mode Linux.
> However, the wrong name, i.e., CONFIG_UM, for the intended Kconfig symbol
> for User-Mode Linux was used.
>
> Although the directory for User Mode Linux is ./arch/um; the Kconfig
> symbol for this architecture is called CONFIG_UML.
>
> Luckily, ./scripts/checkkconfigsymbols.py warns on non-existing configs:
>
> UM
> Referencing files: include/linux/elfcore.h
> Similar symbols: UML, NUMA
>
> Correct the name of the config to the intended one.
>
> Fixes: 6e7b64b9dd6d ("elfcore: fix building with clang")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on next-20211005
>
> Arnd, please ack.
> Andrew, please pick this fix.
>
>  include/linux/elfcore.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/elfcore.h b/include/linux/elfcore.h
> index 2aaa15779d50..127716b58235 100644
> --- a/include/linux/elfcore.h
> +++ b/include/linux/elfcore.h
> @@ -109,7 +109,7 @@ static inline int elf_core_copy_task_fpregs(struct task_struct *t, struct pt_reg
>  #endif
>  }
>
> -#if defined(CONFIG_UM) || defined(CONFIG_IA64)
> +#if defined(CONFIG_UML) || defined(CONFIG_IA64)

This fails to build with 'make ARCH=um SUBARCH=x86_64' since
arch/x86/um/elfcore.c is only compiled for x86_32. You'd need another
check on CONFIG_X86_32 (as per my patch ;)).

Thanks.

-- 
Catalin
