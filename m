Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5BA3FC3
	for <llvm@lists.linux.dev>; Fri, 10 Sep 2021 23:48:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 53CDF611BF;
	Fri, 10 Sep 2021 23:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631317703;
	bh=3W+6f0wuipTibyjTQaN5vgjbRHyQ1UrUz0L6qzxUplo=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=KrXuEsLQIXYeh9eXjpq16ZYWxHkH1WKFaE5hG2+4bXOmbBKajE6+K36WBkyjLHeyS
	 eKFv24TqMQXYQqVMk6mrx+RU19w1nOz9pH9XF2rOZ95sCLmquwI9BE51WUXEkYpaBF
	 8RkK8UfnGtQA3x4rATph8qC3uKDp9d2VQz/hAbFxMKvK4hDbew9QgCKm55he2f3w1v
	 YrUP8LHlt6PJhToOv4sAeceahYMsxDn4WfexupxoLJM9GTQbht9lxUCWgUg8tzdWoI
	 WHMy+eff9sVxectgaPmxHdq7NHT5WCoQXjgQNJARg7qXBmd4+Te7RyzLss+7SM92v6
	 5gpQvxgkkyESw==
Subject: Re: [PATCH 06/10] powerpc: remove GCC version check for UPD_CONSTR
To: Nick Desaulniers <ndesaulniers@google.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Masahiro Yamada <masahiroy@kernel.org>, Joe Perches <joe@perches.com>,
 Arnd Bergmann <arnd@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Segher Boessenkool <segher@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org
References: <20210910234047.1019925-1-ndesaulniers@google.com>
 <20210910234047.1019925-7-ndesaulniers@google.com>
From: Nathan Chancellor <nathan@kernel.org>
Message-ID: <b940bd2c-21d2-dfe9-e171-e265085a2b11@kernel.org>
Date: Fri, 10 Sep 2021 16:48:20 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210910234047.1019925-7-ndesaulniers@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/10/2021 4:40 PM, Nick Desaulniers wrote:
> Now that GCC 5.1 is the minimum supported version, we can drop this
> workaround for older versions of GCC. This adversely affected clang,
> too.
> 
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Segher Boessenkool <segher@kernel.crashing.org>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>   arch/powerpc/include/asm/asm-const.h | 10 ----------
>   1 file changed, 10 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/asm-const.h b/arch/powerpc/include/asm/asm-const.h
> index 0ce2368bd20f..dbfa5e1e3198 100644
> --- a/arch/powerpc/include/asm/asm-const.h
> +++ b/arch/powerpc/include/asm/asm-const.h
> @@ -12,16 +12,6 @@
>   #  define ASM_CONST(x)		__ASM_CONST(x)
>   #endif
>   
> -/*
> - * Inline assembly memory constraint
> - *
> - * GCC 4.9 doesn't properly handle pre update memory constraint "m<>"
> - *
> - */
> -#if defined(GCC_VERSION) && GCC_VERSION < 50000
> -#define UPD_CONSTR ""
> -#else
>   #define UPD_CONSTR "<>"
> -#endif

The only reason this exists is because of commit 592bbe9c505d 
("powerpc/uaccess: Don't use "m<>" constraint with GCC 4.9"). It is 
probably just worth sinking "<>" into all of the callsites and removing
UPD_CONSTR.

>   
>   #endif /* _ASM_POWERPC_ASM_CONST_H */
> 
