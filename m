Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C1C05104
	for <llvm@lists.linux.dev>; Wed,  9 Mar 2022 18:26:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A28801691;
	Wed,  9 Mar 2022 10:26:12 -0800 (PST)
Received: from [10.1.196.218] (eglon.cambridge.arm.com [10.1.196.218])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A44453F7F5;
	Wed,  9 Mar 2022 10:26:11 -0800 (PST)
Subject: Re: [PATCH] arm64: Paper over ARM_SMCCC_ARCH_WORKAROUND_3 Clang issue
To: Nathan Chancellor <nathan@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kernel-team@android.com,
 Nick Desaulniers <ndesaulniers@google.com>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, llvm@lists.linux.dev
References: <20220309155716.3988480-1-maz@kernel.org>
 <YijftpaApSJWuZ3m@dev-arch.thelio-3990X>
 <Yijo7Nmt3AiP1uLH@dev-arch.thelio-3990X>
From: James Morse <james.morse@arm.com>
Message-ID: <70b5df18-efd3-4fca-7f08-a2de0ebae060@arm.com>
Date: Wed, 9 Mar 2022 18:26:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Yijo7Nmt3AiP1uLH@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Nathan,

On 09/03/2022 17:50, Nathan Chancellor wrote:
> On Wed, Mar 09, 2022 at 10:11:18AM -0700, Nathan Chancellor wrote:
>> On Wed, Mar 09, 2022 at 03:57:16PM +0000, Marc Zyngier wrote:
>>> Compiling the arm64 kernel with the BHB workarounds and Clang+LTO
>>> results in a bunch of:
>>>
>>> <instantiation>:4:2: error: invalid fixup for movz/movk instruction
>>>  mov w0, #ARM_SMCCC_ARCH_WORKAROUND_3
>>>
>>> when compiling arch/arm64/kernel/entry.S, and makes no sense at all.
>>>
>>> As it turns out, moving a single include line around makes the
>>> problem disappear. Why, you'd ask? Well, I don't have the faintest
>>> idea, and I'm running out of patience. So make of that what you want.

[...]

> CONFIG_LTO=y causes the following include chain:
> 
> include/linux/arm-smccc.h
> include/linux/init.h
> include/linux/compiler.h

> arch/arm64/include/asm/rwonce.h

Gah, a header file that does something completely different under LTO!


> arch/arm64/include/asm/alternative-macros.h
> arch/arm64/include/asm/assembler.h
> 
> assembler.h has the use of ARM_SMCCC_ARCH_WORKAROUND_3 but the init.h
> include in arm-smccc.h happens before the definition, so it does not get
> expanded.

Thanks for getting to the bottom of this! The error message had me stumped.

...

> This diff seems like a somewhat proper solution, as __READ_ONCE() cannot
> be used in assembly, but I am open to other suggestions.
> 
> diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> index 1bce62fa908a..56f7b1d4d54b 100644
> --- a/arch/arm64/include/asm/rwonce.h
> +++ b/arch/arm64/include/asm/rwonce.h
> @@ -5,7 +5,7 @@
>  #ifndef __ASM_RWONCE_H
>  #define __ASM_RWONCE_H
>  
> -#ifdef CONFIG_LTO
> +#if defined(CONFIG_LTO) && !defined(__ASSEMBLY__)
>  
>  #include <linux/compiler_types.h>
>  #include <asm/alternative-macros.h>
> @@ -66,7 +66,7 @@
>  })
>  
>  #endif	/* !BUILD_VDSO */
> -#endif	/* CONFIG_LTO */
> +#endif	/* CONFIG_LTO && !__ASSEMBLY__ */
>  
>  #include <asm-generic/rwonce.h>

This looks like the smallest/cleanest fix.

Acked-by: James Morse <james.morse@arm.com>


I guess ultimately we should split things like arm-smccc.h into multiple files...


Thanks,

James



