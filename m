Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F9913540D
	for <llvm@lists.linux.dev>; Thu,  7 Mar 2024 18:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709837910; cv=none; b=uitGXNkR3mEQUy1D028jm1+4LQga24/dhPaxmcF9EUmCI9QTjPTVUsMbeu9qARzhl0LjTEje2JKzqtG0O4Bxo8lDqzTkzkzP1Y+j5oRxrbqTlYLpS/wGfo8Hye50LnY36JMnAM+/rib7ws+j2TDePpXM7HoaOT0HetXeATngKaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709837910; c=relaxed/simple;
	bh=dhSE82pAanQi9VtZj9Br3IxlkLhdrSPn0L9yqlFu0E8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gP3ovdfFgsjy8cEKg6/wiRwK9i7UVSuBtfeurnrWLWAy9t2k937zPQtO/SUKO7n2KdlHqKzU4+yswvPjuDtlRvBkQ4DwIbrKApli9UKd5TI/6bYL8dCRdWlgTwWBNJh2lNg5VjUn49dDMkVM4qmH46qI/sW13nVDbJbM7uhC+2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JDyUnLIp; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JDyUnLIp"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1dca3951ad9so10047285ad.3
        for <llvm@lists.linux.dev>; Thu, 07 Mar 2024 10:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709837908; x=1710442708; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i5KeInTN1yUJS/UDV4dQ9Ckv/gA9YRMLKit8OigORVE=;
        b=JDyUnLIpUtcxQFgeiGl5FVFdgleJmza8D6ZZDhGumqPoSlOoLhw6N+cTGVV43KDCeo
         B44jeJzLSti0kjwUO+a68+izi9871u+rSzKG2XiT5cE1syxtv7Bo1922ZX/XeFMaAynR
         NsBx8XKRsp35HspVLPfAcq2V4gdqeF0or8LV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709837908; x=1710442708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5KeInTN1yUJS/UDV4dQ9Ckv/gA9YRMLKit8OigORVE=;
        b=eF9NVSwgjrDx44fA/7P0HN8QwxFY8d/0DIzDWFF/gLF5QTD49HVcbrsEE4dkV8vM85
         CMm+YW7ZuIrFoOGSQK9xW7uUB9x2GwZtQglsklT6DS2x0wghWUyw+RziIwny6BXh3UpM
         CuSwITk6ZwK7f+12UJ0mUVNRtXJpzZTX6IOSnzUP26UgEgjuXcOzapD7qPPGlgjrtWRU
         xmruCGZ5AGYRWV98GOKMwaTbkRB4L0mSkMDDrRB1y/v6c0b558HWoP3QgRt7j6KVZbI2
         OgSgZ6QOzRlNejKXfyqGhgl3nT+9JWicw3pX+1va6/8xlqUpykqV97w9+wGgH/LgPKYV
         7lYw==
X-Forwarded-Encrypted: i=1; AJvYcCVr3/l18q2J2jYIqe5QMMtJW3ncvsUMlwcL4GxT4+BVcn7Q3h9tUHjDouJxmECCBk0nQ8azmTgCFqh8d0POH3p7krtwmA==
X-Gm-Message-State: AOJu0YzWu4iKy7wh88yq5BDwkhKCRRUMWX3go8R3m4W59wvXvZ27IgXh
	5yU3pIcmsZULjfw3xw7gCxwkR3rspWk90dtz42W/12QGb8j7eux8+KamnFJBmg==
X-Google-Smtp-Source: AGHT+IHS6/gd4NB+AVJVXDE6UGWX96UPUw2hYAe9vzirYY4f7XTjGaGQQl+Zlfiqk2mzf8Obhm1Nag==
X-Received: by 2002:a17:902:b610:b0:1dc:66ac:c34b with SMTP id b16-20020a170902b61000b001dc66acc34bmr6822305pls.68.1709837907807;
        Thu, 07 Mar 2024 10:58:27 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id kx4-20020a170902f94400b001d9aa663282sm15007036plb.266.2024.03.07.10.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 10:58:26 -0800 (PST)
Date: Thu, 7 Mar 2024 10:58:25 -0800
From: Kees Cook <keescook@chromium.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Sami Tolvanen <samitolvanen@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2 9/9] ARM: KCFI: Allow permissive CFI mode
Message-ID: <202403071002.542D167D65@keescook>
References: <20240307-arm32-cfi-v2-0-cc74ea0306b3@linaro.org>
 <20240307-arm32-cfi-v2-9-cc74ea0306b3@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240307-arm32-cfi-v2-9-cc74ea0306b3@linaro.org>

On Thu, Mar 07, 2024 at 03:22:08PM +0100, Linus Walleij wrote:
> This registers a breakpoint handler for the new breakpoint type
> (0x03) inserted by LLVM CLANG for CFI breakpoints.
> 
> If we are in permissive mode, just print a backtrace and continue.
> 
> Example with CONFIG_CFI_PERMISSIVE enabled:
> 
> root@Vexpress:/ echo CFI_FORWARD_PROTO > /sys/kernel/debug/provoke-crash/DIRECT
> lkdtm: Performing direct entry CFI_FORWARD_PROTO
> lkdtm: Calling matched prototype ...
> lkdtm: Calling mismatched prototype ...
> hw-breakpoint: Permissive CFI breakpoint
> CPU: 0 PID: 114 Comm: sh Not tainted 6.8.0-rc1+ #111
> Hardware name: ARM-Versatile Express
>  unwind_backtrace from show_stack+0x28/0x30
>  (...)
> lkdtm: FAIL: survived mismatched prototype function call!
> lkdtm: Unexpected! This kernel (6.8.0-rc1+ armv7l) was
>        built with CONFIG_CFI_CLANG=y
> 
> As you can see the LKDTM test fails, but I expect that this would be
> expected behaviour in the permissive mode.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/arm/include/asm/hw_breakpoint.h |  1 +
>  arch/arm/kernel/hw_breakpoint.c      | 10 ++++++++++
>  2 files changed, 11 insertions(+)
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
> index dc0fb7a81371..256146684813 100644
> --- a/arch/arm/kernel/hw_breakpoint.c
> +++ b/arch/arm/kernel/hw_breakpoint.c
> @@ -932,6 +932,16 @@ static int hw_breakpoint_pending(unsigned long addr, unsigned int fsr,
>  	case ARM_ENTRY_SYNC_WATCHPOINT:
>  		watchpoint_handler(addr, fsr, regs);
>  		break;
> +	case ARM_ENTRY_CFI_BREAKPOINT:
> +		if (IS_ENABLED(CONFIG_CFI_PERMISSIVE)) {
> +			pr_err("Permissive CFI breakpoint\n");
> +			dump_stack();
> +			/* Skip the breaking instruction */

Instead of open-coding this, can you make a call to report_cfi_failure()
instead? This will keep the failure output the same across
architectures. I think it would look something like:

		if (report_cfi_failure(regs, addr, ...) == BUG_TRAP_TYPE_WARN)
			instruction_pointer(regs) += 4;
		else
			die("Oops - CFI", regs, 0);

-Kees

-- 
Kees Cook
