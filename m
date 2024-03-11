Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007F556B90
	for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 22:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710194622; cv=none; b=nhWsN+Ki6cN4d60PR6swu1Ikg0/4O8Z/wBfB6cDekUKsqMoRD+4kh/hO4vTrpZUADxwgrJaHonk7etWNkjkhLjLctoHKMTh0mmPYYmUrGpiKAXM3EFjcCvkMHGaOUElq1UV/I0fv5VPsTKob7lElshfR3fHYChCAjgcrfLtc34A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710194622; c=relaxed/simple;
	bh=XctTF/eZhqBg9wOa9pYdN6uOqK/W/3CpD9zlSVlkuz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdS07pdxuIrhyIO6iRi+9PHex8XEbE8orDT/oP+nWdAwTCYxfVAPMrlZVNynKDujLSJy2Ke0EumTvNhLpL607RChJMNff/fwOWs9NDoJQRS2JZrpaO69z+8iJcSf4bSSx+iFT7XzWDAcfDEiNhxk+AJJ+2VqsuPKh2pU9EV2/Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=T7C1pB1u; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T7C1pB1u"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e55731af5cso2409943b3a.0
        for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 15:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710194620; x=1710799420; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X3s7HtVBnE3ACtPsCnNNAAYCoRWSvkfV8hOdKZg+3iU=;
        b=T7C1pB1uzjVArqTS6dBf1x+P4k0UNzx6eBSGGt1PoTPji7ahSj8CK2flomzNLNAtny
         onQwZyJUfcPYjkFeCyJ7CJ+LK2/LMah7gEvew1agqXV6S/un63nyBKc1VwH2i37N14UH
         H7U0APm8pLlgPf4HB7wt/73LHZ0yvSWLlnthg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710194620; x=1710799420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3s7HtVBnE3ACtPsCnNNAAYCoRWSvkfV8hOdKZg+3iU=;
        b=nEGn4pjcOslSKEw7Ti6hH8SvbJvjiMG0B4XcyOKoiQZj67n3lFl7EJwWcQxvaGJ2Hy
         36XViInkko7XbxfW4m+BbEybGjBvGHINskVlv3T+qUG37DHggLLSXXb0Ro3nwzzfG9Xa
         a74Y4OXqHSyXrFtnEEwo9nwd4zRuVn882dme57NK+P6xp4B8T+FY763O/HAmhZ8c7NW0
         8ETSdQ/hoz0tD9KleHcMClzHbdySZb3ZnKnRgnFb/FjvPBMSp0x5fdAQawSW6fF2IJHf
         T0NvJ4CTfxnjtyvvqfMzptBFf3vLEoewGuDGsjr6cEPrNizARQh9E/E2sZLSbhb2Wr3T
         0N8w==
X-Forwarded-Encrypted: i=1; AJvYcCW1eoZDFHGVvc3+tw/uXyDOcAIgDjgsRN/Hof43J99hDPZmD71dVICL4wXE8Z1fEM7/ovUck/WSAMxsBfu52zzfXBi2iw==
X-Gm-Message-State: AOJu0YzCP4qSuba+7AswRUpEKOCgwacpcir3IzVpDKIc8Blx3gPc6UQ5
	955MFszX5SzUyHGP9gRkSyvnk6CO+d9SjPZSXzDM3WYjwfsiYMkEb5c1MrACJQ==
X-Google-Smtp-Source: AGHT+IE1s483Lf5q0Xlj6V4BBPg6RSuGNl+/ruvaU98QZ+YvNM90WIASjVUCv7mzQ2fpw9LyH86oYg==
X-Received: by 2002:a05:6a21:918b:b0:1a1:6735:b8be with SMTP id tp11-20020a056a21918b00b001a16735b8bemr5610060pzb.41.1710194620230;
        Mon, 11 Mar 2024 15:03:40 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id t123-20020a628181000000b006e657c72cf8sm5212215pfd.148.2024.03.11.15.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 15:03:39 -0700 (PDT)
Date: Mon, 11 Mar 2024 15:03:39 -0700
From: Kees Cook <keescook@chromium.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Sami Tolvanen <samitolvanen@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH v3 9/9] ARM: KCFI: Allow permissive CFI mode
Message-ID: <202403111502.5351F8D7@keescook>
References: <20240311-arm32-cfi-v3-0-224a0f0a45c2@linaro.org>
 <20240311-arm32-cfi-v3-9-224a0f0a45c2@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240311-arm32-cfi-v3-9-224a0f0a45c2@linaro.org>

On Mon, Mar 11, 2024 at 10:15:46AM +0100, Linus Walleij wrote:
> This registers a breakpoint handler for the new breakpoint type
> (0x03) inserted by LLVM CLANG for CFI breakpoints.
> 
> If we are in permissive mode, just print a backtrace and continue.
> 
> Example with CONFIG_CFI_PERMISSIVE enabled:
> 
> > echo CFI_FORWARD_PROTO > /sys/kernel/debug/provoke-crash/DIRECT
> lkdtm: Performing direct entry CFI_FORWARD_PROTO
> lkdtm: Calling matched prototype ...
> lkdtm: Calling mismatched prototype ...
> CFI failure at lkdtm_indirect_call+0x40/0x4c (target: 0x0; expected type: 0x00000000)
> WARNING: CPU: 1 PID: 112 at lkdtm_indirect_call+0x40/0x4c
> CPU: 1 PID: 112 Comm: sh Not tainted 6.8.0-rc1+ #150
> Hardware name: ARM-Versatile Express
> (...)
> lkdtm: FAIL: survived mismatched prototype function call!
> lkdtm: Unexpected! This kernel (6.8.0-rc1+ armv7l) was built with CONFIG_CFI_CLANG=y
> 
> As you can see the LKDTM test fails, but I expect that this would be
> expected behaviour in the permissive mode.
> 
> We are currently not implementing target and type for the CFI
> breakpoint as this requires additional operand bundling compiler
> extensions.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/arm/include/asm/hw_breakpoint.h |  1 +
>  arch/arm/kernel/hw_breakpoint.c      | 30 ++++++++++++++++++++++++++++++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/arch/arm/include/asm/hw_breakpoint.h b/arch/arm/include/asm/hw_breakpoint.h
> index 62358d3ca0a8..e7f9961c53b2 100644
> --- a/arch/arm/include/asm/hw_breakpoint.h
> +++ b/arch/arm/include/asm/hw_breakpoint.h
> @@ -84,6 +84,7 @@ static inline void decode_ctrl_reg(u32 reg,
>  #define ARM_DSCR_MOE(x)			((x >> 2) & 0xf)
>  #define ARM_ENTRY_BREAKPOINT		0x1
>  #define ARM_ENTRY_ASYNC_WATCHPOINT	0x2
> +#define ARM_ENTRY_CFI_BREAKPOINT	0x3
>  #define ARM_ENTRY_SYNC_WATCHPOINT	0xa
>  
>  /* DSCR monitor/halting bits. */
> diff --git a/arch/arm/kernel/hw_breakpoint.c b/arch/arm/kernel/hw_breakpoint.c
> index dc0fb7a81371..61a984b83bfe 100644
> --- a/arch/arm/kernel/hw_breakpoint.c
> +++ b/arch/arm/kernel/hw_breakpoint.c
> @@ -17,6 +17,7 @@
>  #include <linux/perf_event.h>
>  #include <linux/hw_breakpoint.h>
>  #include <linux/smp.h>
> +#include <linux/cfi.h>
>  #include <linux/cpu_pm.h>
>  #include <linux/coresight.h>
>  
> @@ -903,6 +904,32 @@ static void breakpoint_handler(unsigned long unknown, struct pt_regs *regs)
>  	watchpoint_single_step_handler(addr);
>  }
>  
> +#ifdef CONFIG_CFI_CLANG
> +static void hw_breakpoint_cfi_handler(struct pt_regs *regs)
> +{
> +	/* TODO: implementing target and type requires compiler work */
> +	unsigned long target = 0;
> +	u32 type = 0;
> +
> +	switch (report_cfi_failure(regs, instruction_pointer(regs), &target, type)) {
> +	case BUG_TRAP_TYPE_BUG:
> +		die("Oops - CFI", regs, 0);
> +		break;
> +	case BUG_TRAP_TYPE_WARN:
> +		/* Skip the breaking instruction */
> +		instruction_pointer(regs) += 4;
> +		break;

This looks much better; thanks!

> +	default:
> +		pr_crit("Unknown CFI error\n");
> +		break;

For something like CFI, I think it would be better to fail closed. i.e.:

		die("Unknown CFI error", regs, 0);

> +	}
> +}
> +#else
> +static void hw_breakpoint_cfi_handler(struct pt_regs *regs)
> +{
> +}
> +#endif
> +
>  /*
>   * Called from either the Data Abort Handler [watchpoint] or the
>   * Prefetch Abort Handler [breakpoint] with interrupts disabled.
> @@ -932,6 +959,9 @@ static int hw_breakpoint_pending(unsigned long addr, unsigned int fsr,
>  	case ARM_ENTRY_SYNC_WATCHPOINT:
>  		watchpoint_handler(addr, fsr, regs);
>  		break;
> +	case ARM_ENTRY_CFI_BREAKPOINT:
> +		hw_breakpoint_cfi_handler(regs);
> +		break;
>  	default:
>  		ret = 1; /* Unhandled fault. */
>  	}
> 
> -- 
> 2.34.1
> 

-- 
Kees Cook
