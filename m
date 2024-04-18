Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5591D4D9E8
	for <llvm@lists.linux.dev>; Thu, 18 Apr 2024 16:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713456797; cv=none; b=Qpf7IPqnCiCledsGPY0txWC3V83E6Hb/mUxj+I0zSI4k7Cp9CkyP7PfPcDkfW9CgJ1M1muIeCM6Od4ODW9tuDdrTAe+vsrz3n3Qk+VnvEfyTP689CUFFvj8Kh0hcki/Jreks7JjpnD2t1GWMj5UHVbOKkypN/SO1Gaiiv8fCMVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713456797; c=relaxed/simple;
	bh=2j/tt4FELoPXxu6oGT+wYXft/Bc5Co0wfQzS4n8qNeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ixVy47v0MrRYtGQV4qR4DDknIA0lGlQRPFSpxoQtz9OsvIXLCqKY3wDMfGbP2xc4EJsdcBud8IM6qXDa5uXzi9gLa2hjFJuBGKEH5/Q4v4Yd3HuPODtRtTYkve+0tS5vrZ2qWNStIz9YEL/7VYXjWHiVQ7WRgIsJ/5lwbdNzgPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ki5tzj/W; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ki5tzj/W"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5aa2a74c238so645312eaf.3
        for <llvm@lists.linux.dev>; Thu, 18 Apr 2024 09:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713456795; x=1714061595; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKNKGkkmrlcOgstwo6bpkjzluuNRmELeIU3IiJZdw0o=;
        b=ki5tzj/WGFRzKxnQYns4i5gyF1TH1E8hnOH21kILP9tLDg0yc4i1KRVC80GZ7rro7+
         GBrZ/IJeM4XLHIzhAmVXXGKHKOJNclcsGTGXwITsVC+nSYhRWvL+RxLL4dXMGPtWiVC4
         Fb3fz1Z1fY36LL/saaPasDS4WAD7gw3MxiObJ4SKXpk8oSu/alx7CfU5+448ldXsBPHK
         xYQy+2qj9STkSb5lgnZv2IrfTapONKFwg5r9O/ZGQ+aahmxQx6ibyjLwLGrQtWRkVsO3
         o0uK94z9VsSzQP0Y1OjIxfe4t9MFPnSI2xZZKVNaaDhiPBZOXZAVUSrGPinGoQxniyFU
         Vs4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713456795; x=1714061595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zKNKGkkmrlcOgstwo6bpkjzluuNRmELeIU3IiJZdw0o=;
        b=T3Y4EmbrE9nauohsOcErYYvYhlTOdu3/Dlsj5ewTP7YZP8dQ/xg9IF8k9UfNPSpQNi
         heYUrQDc0jIb4IIQb+tIu6FcZAJ3WpaW9jYhmp3mDE7coLNW1QbX2CUHSViwbJtuEskt
         MoCdJvTZtIR2i+JMyLYThFZQv66GT1OYx7ws8I/2Oz6HZ5ufNWcoV1ywzMLWTaVB1Z1u
         4eOpyqrOIbMJHVQDsiB8IS5M4VWKY2rx74ronx1D3MG01KP6L3j6hqjVFq6OzdzOXzyz
         jzyryUR2kuIsNapVaFceVEJdDjtjRDxLpImwmbAuP+3hqFVteHZDo1WzveIApSrrjoFw
         45Ig==
X-Forwarded-Encrypted: i=1; AJvYcCUCJTLmiEbBWntV0YsWw25sOQ/vW38pSOZYsvO7/UlforK7Yv8QpWom8cBlPfBntkPIdJN1kpcKjjlxK0/E1v38ASUmDA==
X-Gm-Message-State: AOJu0YwLwRJAYZyWEimJAHJVi5yfXFjzLw6EKG+2JvR1nqg0r7woxg1Z
	1UYe6iNzZk0/4ploSF63blpfn2nU703vIdBzKDijydVTj8xZCq1Lwm4mCPFRjkMM9GglL8GEFY8
	UpzZ3rbFGGMMq85JDhPPt7SR/JOBwUDRrGWCg
X-Google-Smtp-Source: AGHT+IEnHMmlOEYAlvEhzyPYXh7ES0tIP0u5S7vvI8f1doPoN/CpwPJqbDSVgC6bEnJM62YQznYdKFetw+fXFXQ6gFw=
X-Received: by 2002:a05:6359:100f:b0:183:c2e1:9b4a with SMTP id
 ib15-20020a056359100f00b00183c2e19b4amr3609059rwb.18.1713456795007; Thu, 18
 Apr 2024 09:13:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240417-arm32-cfi-v6-0-6486385eb136@linaro.org> <20240417-arm32-cfi-v6-10-6486385eb136@linaro.org>
In-Reply-To: <20240417-arm32-cfi-v6-10-6486385eb136@linaro.org>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 18 Apr 2024 09:12:36 -0700
Message-ID: <CABCJKufKoDOrPUpKFXBnoNEuQ8gJ7d1zHn=H-gtLoLX=02viUA@mail.gmail.com>
Subject: Re: [PATCH v6 10/11] ARM: hw_breakpoint: Handle CFI breakpoints
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>, Kees Cook <keescook@chromium.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Wed, Apr 17, 2024 at 1:31=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
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
> CFI failure at lkdtm_indirect_call+0x40/0x4c (target: 0x0; expected type:=
 0x00000000)
> WARNING: CPU: 1 PID: 112 at lkdtm_indirect_call+0x40/0x4c
> CPU: 1 PID: 112 Comm: sh Not tainted 6.8.0-rc1+ #150
> Hardware name: ARM-Versatile Express
> (...)
> lkdtm: FAIL: survived mismatched prototype function call!
> lkdtm: Unexpected! This kernel (6.8.0-rc1+ armv7l) was built with CONFIG_=
CFI_CLANG=3Dy
>
> As you can see the LKDTM test fails, but I expect that this would be
> expected behaviour in the permissive mode.
>
> We are currently not implementing target and type for the CFI
> breakpoint as this requires additional operand bundling compiler
> extensions.
>
> CPUs without breakpoint support cannot handle breakpoints naturally,
> in these cases the permissive mode will not work, CFI will fall over
> on an undefined instruction:
>
> Internal error: Oops - undefined instruction: 0 [#1] PREEMPT ARM
> CPU: 0 PID: 186 Comm: ash Tainted: G        W          6.9.0-rc1+ #7
> Hardware name: Gemini (Device Tree)
> PC is at lkdtm_indirect_call+0x38/0x4c
> LR is at lkdtm_CFI_FORWARD_PROTO+0x30/0x6c
>
> This is reasonable I think: it's the best CFI can do to ascertain
> the the control flow is not broken on these CPUs.
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Tested-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/arm/include/asm/hw_breakpoint.h |  1 +
>  arch/arm/kernel/hw_breakpoint.c      | 30 ++++++++++++++++++++++++++++++
>  2 files changed, 31 insertions(+)
>
> diff --git a/arch/arm/include/asm/hw_breakpoint.h b/arch/arm/include/asm/=
hw_breakpoint.h
> index 62358d3ca0a8..e7f9961c53b2 100644
> --- a/arch/arm/include/asm/hw_breakpoint.h
> +++ b/arch/arm/include/asm/hw_breakpoint.h
> @@ -84,6 +84,7 @@ static inline void decode_ctrl_reg(u32 reg,
>  #define ARM_DSCR_MOE(x)                        ((x >> 2) & 0xf)
>  #define ARM_ENTRY_BREAKPOINT           0x1
>  #define ARM_ENTRY_ASYNC_WATCHPOINT     0x2
> +#define ARM_ENTRY_CFI_BREAKPOINT       0x3
>  #define ARM_ENTRY_SYNC_WATCHPOINT      0xa
>
>  /* DSCR monitor/halting bits. */
> diff --git a/arch/arm/kernel/hw_breakpoint.c b/arch/arm/kernel/hw_breakpo=
int.c
> index dc0fb7a81371..ce7c152dd6e9 100644
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
> @@ -903,6 +904,32 @@ static void breakpoint_handler(unsigned long unknown=
, struct pt_regs *regs)
>         watchpoint_single_step_handler(addr);
>  }
>
> +#ifdef CONFIG_CFI_CLANG
> +static void hw_breakpoint_cfi_handler(struct pt_regs *regs)
> +{
> +       /* TODO: implementing target and type requires compiler work */
> +       unsigned long target =3D 0;
> +       u32 type =3D 0;
> +
> +       switch (report_cfi_failure(regs, instruction_pointer(regs), &targ=
et, type)) {

Nit: To make the error message a bit cleaner, you can use
report_cfi_failure_noaddr(...) instead, and maybe you can expand the
comment to explain why target information isn't trivially available
right now?

Sami
