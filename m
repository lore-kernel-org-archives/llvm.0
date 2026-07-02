Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ACA1FF1DA
	for <llvm@lists.linux.dev>; Thu,  2 Jul 2026 02:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782960862; cv=none; b=YnLk9fGcb5FwQ/1hrDCHNQlGI5F1jeWxo2wZI3Q9U+1cNRaMUAMJb7XfrXNC2Bg4SUn6NVx9gFWuK/RcTVWRe3hFB1pJnRIu4y7wTHhx3eQcBb/sKC3AgQfmrUD4jHfLMD9CAapBnfCobVO3SGEl35x7L0JtvKrsgxcNCCTTWQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782960862; c=relaxed/simple;
	bh=tL9NH42OQNeDEkTaHJuv0PCGDPPXbhCZ+SsTJlKBaUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ab+k9+8LMcxQ7m9BHPZrRjOU5voN7iTDtBtlAUe/GfMDmCeCc4CDfpGEKrr9+inL85JFY8ycJLrGWfrdR8U6BnwX5oH+YneXqJFl1O/u52jn4NCZZnC9nzcSm11fFJWFCPOF9c1/7jZ87qTI25ut5lVJkVcoLOHTtUR8nMB/2u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Wau1r4b4; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Wau1r4b4"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0A99740E01B4;
	Thu,  2 Jul 2026 02:54:19 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id kn1GuhSAvRpl; Thu,  2 Jul 2026 02:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1782960849; bh=3hStA21eE7y1OWGDE78iE1VwyUh5r1fukeg8JEHNDIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wau1r4b4rDWBbCeZpmK2bNh9bCEpW76ya/hOORlts+w7J/AUG5azHmRsEJPYzgb2t
	 G6l6jVjfa5sBObjh8qxnMfiXRZPIUYN4cAxkMzkZz56gNy0av+3Ok1Clqaf6gzEnAw
	 0qJGRo0D5HoTBSwCb+1mVWLHZGFgOsHtNkoZUo+FOGg8YlUFSAInck2EguipF2U3J2
	 sFxeYZYH1oVnr1K6MhmF+ezgfvKKrjDnw9ANEZIHBjsG1ST6Cqag7n9bsPVoH0kQpa
	 O5GMOmSJEV+eDKlG+ifNpw8VVw2Q3nMz1v2RKq8r+HyhCLtCu1c9dmh5obEBNsNZZk
	 kxQ4ZEUe6BdZrmJrsSJgPTj2u13XvjrjkEvNE3K3r1KvSIt6k3xu4sGpk1r78Yc/BJ
	 BfRtrw1SE/Thng81+s/UF9fe/lYcmLNCHzkwj51Q3biwvtt9YtyKA5VEIBig0OHLrI
	 o88vFb3fr+2we3jt3ALD6iuctrplDcy0JoW63awokyKu4WI5WOgYIDFgPCEx5JNtk+
	 ruLlYcaR8CUqhMWK3eChttgWmyvn5jkZDcKjXmJPd8HcJfk9zNgWwfktFIfHEDtOKA
	 NKVs2MXe92c5Llqvuosg/lTbuYBGunrj2D36jFcOC896ad+UTiKgxz0RXaM9zAgsOY
	 MeDVJQs75mojt9jbQKya7xak=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 3672F40E0140;
	Thu,  2 Jul 2026 02:53:46 +0000 (UTC)
Date: Wed, 1 Jul 2026 19:53:42 -0700
From: Borislav Petkov <bp@alien8.de>
To: Dmitry Voytik <voytikd@gmail.com>, linux-toolchains@vger.kernel.org
Cc: Alexander Potapenko <glider@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-mm@kvack.org, llvm@lists.linux.dev
Subject: Re: [PATCH] x86/mm: fix objtool failure with KMSAN enabled
Message-ID: <20260702025342.GJakXStrsCmIRnEwFD@fat_crate.local>
References: <20260701125151.352632-1-voytikd@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701125151.352632-1-voytikd@gmail.com>

On Wed, Jul 01, 2026 at 02:51:51PM +0200, Dmitry Voytik wrote:
> This patch fixes broken builds with defconfig + CONFIG_KMSAN +
> CONFIG_DEBUG_INFO_*.
> 
> To reproduce the issue before the fix:
>   make mrproper
>   make LLVM=1 defconfig
>   ./scripts/config -e CONFIG_KMSAN \
>     -e CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
>   make LLVM=1 olddefconfig
>   make LLVM=1 -j(nproc) vmlinux
>   ...
>     LD      vmlinux.o
>   vmlinux.o: warning: objtool: folio_zero_user+0x801: undefined stack state
>   vmlinux.o: error: objtool: folio_zero_user+0x801: unknown CFA base reg -1
>   make[2]: *** [scripts/Makefile.vmlinux_o:76: vmlinux.o] Error 255
> 
> objtool in verbose mode shows how the frame pointer is omitted:
>   make LLVM=1 OBJTOOL_VERBOSE=1 -j(nproc) vmlinux
>   ...
>   b15a2c:  folio_zero_user+0x7fc      xor    %eax,%eax
>   b15a2e:  folio_zero_user+0x7fe      mov    %rcx,%rsp
>   b15a31:  folio_zero_user+0x801      mov    %r14,%rdi
>   b15a34:  folio_zero_user+0x804      mov    %rbx,%rcx
>   b15a37:  folio_zero_user+0x807      call   0xb15a3c <__clear_pages_unrol
> 
> After the fix, the frame pointer is back:
>   b15a37: 31 c0                       xor    %eax,%eax
>   b15a39: 48 89 ec                    mov    %rbp,%rsp
>   b15a3c: 4c 89 f7                    mov    %r14,%rdi
>   b15a3f: 48 89 d9                    mov    %rbx,%rcx
>   b15a42: e8 00 00 00 00              call   b15a47 <folio_zero_user+0x817>
> 
> It seems the issue was introduced by
> commit 54a6b89a3db2 ("x86/mm: simplify clear_page_*")
> 
> The actual fix is to revert the change how ASM_CALL_CONSTRAINT is
> positioned.

Why?

Where does it say that the current stack ptr dependency needs to be the first
asm input operand?

If that were the case, we have a bunch more of those bugs around the tree.

Anyway, + linux-toolchains.

> Additionally, reintroduce asm_inline to prevent potential compiler
> rejection of inlining.
> 
> Link: https://lore.kernel.org/CAAX90H2_RPnZL_dFYN7cQF6yt-wAweKKSx2=6e2aZ0kv+Pm+NQ@mail.gmail.com
> Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
> ---
>  arch/x86/include/asm/page_64.h | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/include/asm/page_64.h b/arch/x86/include/asm/page_64.h
> index 1895c207f629..de8604f0a3a1 100644
> --- a/arch/x86/include/asm/page_64.h
> +++ b/arch/x86/include/asm/page_64.h
> @@ -100,12 +100,13 @@ static inline void clear_pages(void *addr, unsigned int npages)
>  	 * __clear_pages_unrolled() are part of the inline asm register
>  	 * specification.
>  	 */
> -	asm volatile(ALTERNATIVE_2("call __clear_pages_unrolled",
> -				   "shrq $3, %%rcx; rep stosq", X86_FEATURE_REP_GOOD,
> -				   "rep stosb", X86_FEATURE_ERMS)
> -			: "+c" (len), "+D" (addr), ASM_CALL_CONSTRAINT
> -			: "a" (0)
> -			: "cc", "memory");
> +	asm_inline volatile(
> +		ALTERNATIVE_2("call __clear_pages_unrolled",
> +			      "shrq $3, %%rcx; rep stosq", X86_FEATURE_REP_GOOD,
> +			      "rep stosb", X86_FEATURE_ERMS)
> +		: ASM_CALL_CONSTRAINT, "+c"(len), "+D"(addr)
> +		: "a"(0)
> +		: "cc", "memory");
>  }
>  #define clear_pages clear_pages
  
-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
