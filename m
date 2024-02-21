Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4950D80023
	for <llvm@lists.linux.dev>; Wed, 21 Feb 2024 14:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708527189; cv=none; b=YZEvZZZcwmA6yZ1RqwucA5/JJiyIRR1sG6IsoStm5vryDAfgMmwYAe1fw8LYbTWhcPkDKqS+xdBsejYgsCFDexbvV5Q1D93Plddd5Om0+QWrCIw1F+6W6/emHe2msK57mhu/McpMgzAvjELtTQMUSup/jjyzJtjEHKxdiedPxXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708527189; c=relaxed/simple;
	bh=GFG4jC7AMNHM9If0p4IbWL9b/Wg/EsXkiJXlP51yvcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NW9b7OK2lNSbMoayXnZyJFxDUGRBMHsIQjMAoBCUdn6aYzIALjaLJMf5xEy9n7N6f98gUa9oYOtmFVglkC2mTokQqplBKtj6xw1OrPNYIB93pGEEfllWxmcuZxxBKAB6yZxNZbuif42jhc4yiYWJFlQxr0VHeQS0tLQRiFNbzMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DS8LCRp8; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DS8LCRp8"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d2509c66daso18239091fa.3
        for <llvm@lists.linux.dev>; Wed, 21 Feb 2024 06:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708527184; x=1709131984; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ePZHUj5LUCPpE5Mosu90DBz2D4k7SKlgOf7UzKRj0RI=;
        b=DS8LCRp8wORSktUDHfwgm8KkohjIQ+XeYjuVu6aEE4xJiKtJrZcys4iBYmxebZBlgZ
         HNHiH9kWsUQdz2b8PS8Ab4DshJl3Ko6wB5Nytoy5Ma/P2ZkVmt46Bfbsi9JiAD44bLnR
         dbq1f+uyccqtIVFda6kGN/g6Jhq9w6QUQ9RzMIzsQg5u8tw6DTeUerZ1k6OEe/v+owyt
         xQjYbwpx/RUTFOFOzwKhrYQeKx53gh9qLD1dqSi66mrOQ8EEVBptiGCMFR0J72GfdAH3
         UGFTfyoES8GAi7IZ/cD0SaakW0FZHODpm+uDazEqRf9GOVWSo85b2F+3Wku83j3fJiwW
         frCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708527184; x=1709131984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ePZHUj5LUCPpE5Mosu90DBz2D4k7SKlgOf7UzKRj0RI=;
        b=WKWIS5roI3DB51ET6NDumAYOnxe4uphZnAsBfoYohVOfWTcp+Csj/jeAEw/bmC1CZ+
         dmJwICAq4ZKYuMuav2RpBkBfyaCtJnrxDJ9dkZi27XlXDCUhhVZCKEWsXPFI6IIDvbSs
         iVKZZsBCJEgrnBVlMCzCWMfBOPMIvaR2rzrSO8aorlHuGCNrJ+nS8lfc56wdCR5ykQYp
         tCoQ2WaF3gmS3RVhppnho6eNoBD/El/jJvvk5aLpr9xhU8VOdWWmbQ4ADHEvqdR49gMA
         HXZmjGaGT9zs2T1pbfX/wmwKqtUPW43zuKMJWyPrtF+xkUG5nASb5FqFwjN2gUPNfyhM
         VPJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhSJSCxUd75p9gEysOOTK/kCDQuqSRFNB+A14hOYu5UAnyT53byES2Ww417WKpT/ZYH+yfA3Jc1GUcLuvpKi2BJACDHw==
X-Gm-Message-State: AOJu0YzR1iY4P+4wGN62Cvy3fxff/UVaeeFXOv6HVQD9BU4qt1b07JMp
	WgwP6EPJjN31QYfHA+GEcQd26Dkg9vtLMH9Qq17HeSWRIoicLr1UJ6xYdldIBwcSy+LF7D6p3hX
	flGZPP4rlb+Vu5OEJb3/9dtRJpg==
X-Google-Smtp-Source: AGHT+IE/K+XcvoI/LcNmvDCJKjlr9B99h7U5y79IwVKbsvm+c8sY8t8FI9nhGhEJalOoimheBDOIbnrA6j+mw1hlCB0=
X-Received: by 2002:a2e:b006:0:b0:2d2:3695:c18 with SMTP id
 y6-20020a2eb006000000b002d236950c18mr6696084ljk.19.1708527184231; Wed, 21 Feb
 2024 06:53:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240221113506.2565718-18-ardb+git@google.com> <20240221113506.2565718-25-ardb+git@google.com>
In-Reply-To: <20240221113506.2565718-25-ardb+git@google.com>
From: Brian Gerst <brgerst@gmail.com>
Date: Wed, 21 Feb 2024 09:52:53 -0500
Message-ID: <CAMzpN2iu52yJWv3w1SgDXXGdvbfGi8cHRkip_qqrAO_89-4+sQ@mail.gmail.com>
Subject: Re: [PATCH v5 07/16] x86/startup_64: Simplify CR4 handling in startup code
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Kevin Loughlin <kevinloughlin@google.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Dionna Glaze <dionnaglaze@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <keescook@chromium.org>, linux-arch@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 6:35=E2=80=AFAM Ard Biesheuvel <ardb+git@google.com=
> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> When paging is enabled, the CR4.PAE and CR4.LA57 control bits cannot be
> changed, and so they can simply be preserved rather than reason about
> whether or not they need to be set. CR4.MCE should be preserved unless
> the kernel was built without CONFIG_X86_MCE, in which case it must be
> cleared.
>
> CR4.PSE should be set explicitly, regardless of whether or not it was
> set before.
>
> CR4.PGE is set explicitly, and then cleared and set again after
> programming CR3 in order to flush TLB entries based on global
> translations. This makes the first assignment redundant, and can
> therefore be omitted.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/x86/kernel/head_64.S | 24 +++++++-------------
>  1 file changed, 8 insertions(+), 16 deletions(-)
>
> diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
> index fb2a98c29094..426f6fdc0075 100644
> --- a/arch/x86/kernel/head_64.S
> +++ b/arch/x86/kernel/head_64.S
> @@ -185,6 +185,8 @@ SYM_INNER_LABEL(secondary_startup_64_no_verify, SYM_L=
_GLOBAL)
>         addq    $(init_top_pgt - __START_KERNEL_map), %rax
>  1:
>
> +       /* Create a mask of CR4 bits to preserve */
> +       movl    $(X86_CR4_PAE | X86_CR4_LA57), %edx
>  #ifdef CONFIG_X86_MCE
>         /*
>          * Preserve CR4.MCE if the kernel will enable #MC support.
> @@ -193,20 +195,13 @@ SYM_INNER_LABEL(secondary_startup_64_no_verify, SYM=
_L_GLOBAL)
>          * configured will crash the system regardless of the CR4.MCE val=
ue set
>          * here.
>          */
> -       movq    %cr4, %rcx
> -       andl    $X86_CR4_MCE, %ecx
> -#else
> -       movl    $0, %ecx
> +       orl     $X86_CR4_MCE, %edx
>  #endif
> +       movq    %cr4, %rcx
> +       andl    %edx, %ecx
>
> -       /* Enable PAE mode, PSE, PGE and LA57 */
> -       orl     $(X86_CR4_PAE | X86_CR4_PSE | X86_CR4_PGE), %ecx
> -#ifdef CONFIG_X86_5LEVEL
> -       testb   $1, __pgtable_l5_enabled(%rip)
> -       jz      1f
> -       orl     $X86_CR4_LA57, %ecx
> -1:
> -#endif
> +       /* Even if ignored in long mode, set PSE uniformly on all logical=
 CPUs. */
> +       btsl    $X86_CR4_PSE_BIT, %ecx
>         movq    %rcx, %cr4

This CR4 write now does the global flush - see below.

>
>         /* Setup early boot stage 4-/5-level pagetables. */
> @@ -226,11 +221,8 @@ SYM_INNER_LABEL(secondary_startup_64_no_verify, SYM_=
L_GLOBAL)
>          * Do a global TLB flush after the CR3 switch to make sure the TL=
B
>          * entries from the identity mapping are flushed.
>          */

This comment is misleading now since it's the first CR4 write above
(with PGE clear) that actually does the global flush.

> -       movq    %cr4, %rcx
> -       movq    %rcx, %rax
> -       xorq    $X86_CR4_PGE, %rcx
> +       btsl    $X86_CR4_PGE_BIT, %ecx
>         movq    %rcx, %cr4
> -       movq    %rax, %cr4
>
>         /* Ensure I am executing from virtual addresses */
>         movq    $1f, %rax
> --
> 2.44.0.rc0.258.g7320e95886-goog
>

Brian Gerst
