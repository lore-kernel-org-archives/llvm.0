Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5743209
	for <llvm@lists.linux.dev>; Mon, 10 Oct 2022 16:44:37 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id 70so10257520pjo.4
        for <llvm@lists.linux.dev>; Mon, 10 Oct 2022 09:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=anf2u1EbUOW94hW1mECFJfimfAQsErLr0AHCvxvjmdk=;
        b=Dy8KkpWEM4viPKcw92pWH9OkrFjFTq+0m4ithX9J6aDaD6+HydyU+UAmJw013gXhoX
         mJbm707DHRTRw7yA4lkBJC8ai6XTkgxlcj+dS9JufldckCu3ifKgGIXfE3zz88014G8P
         DXhQxmRn9Evt46YcrhuH6IYopCmZZD2jLP1XyDMGp0HVBbXolBQ79AOu4L6KpGDHayoo
         zrarz1iSslRJV7g8vj7IrQTvDdsHHCWC8vvqksfe9bBTmAcRuq5+Yte3g7NQU/NmPUMP
         PN4j2Nuy6ofSadM570VOxEDGdoVkjoUFAblgvGHAsvhQ218hCJh4CFJYVcKGJKGvTVEw
         FK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=anf2u1EbUOW94hW1mECFJfimfAQsErLr0AHCvxvjmdk=;
        b=K9lQbtlmFndyzApGWeViVrqOs9FfBuX/HGJY5uZCoO1MV8ydrnf0s9gRyikqiueToj
         hyiQe9dHwfl8qh9wq7PMgflKo4SlYKUE0AWzMM6I7w2x+Pat02m9IyoeFJ3jlIU699XC
         /Sw3hCY94cYFtk9ImJjl1hA7XM4rr2A6ifzLTckeQw7uwS/x10/0BgL/U0h4K5EEPZsq
         AM+PWWngqAmqjclxlho2qwSvaskW5ZJPLptgzmFWHJ7loVe9yMzhUH3V7XVgsVn8gxgW
         2Ps3AIhwHBdiDiri3Vd0HYr3l5Imin8d5ptGRBThxAMKxFEfSZI+RUN2daRlPBl+kVCw
         r07w==
X-Gm-Message-State: ACrzQf2T4S2wNzOE+KNpNno8JMrhE9ZoZmxS2LlCGHoXOeeeNjIHB5Y+
	Z752Ft584+ahIR1vm+nV7ZK5som3DYNdsdi/US7XAA==
X-Google-Smtp-Source: AMsMyM4Qvyn2KkVMESz39nPlRCBM18juvwRx/yYvOtyFXZF5TAbCx3+mr8Oo3PF8mfWyuGM6quJltqY8u49ijI+NewA=
X-Received: by 2002:a17:902:b210:b0:17d:c3ca:4a4f with SMTP id
 t16-20020a170902b21000b0017dc3ca4a4fmr19349499plr.33.1665420276986; Mon, 10
 Oct 2022 09:44:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <bd3872ce5125477ea80b1131ad9a34c98aa1a796.1665375018.git.viresh.kumar@linaro.org>
In-Reply-To: <bd3872ce5125477ea80b1131ad9a34c98aa1a796.1665375018.git.viresh.kumar@linaro.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 10 Oct 2022 09:44:25 -0700
Message-ID: <CAKwvOdkH89GbKiymi7O2_XekQwC2zYVTUfKYg1v2nzG081p7=Q@mail.gmail.com>
Subject: Re: [PATCH] ARM: spear6xx: Staticize few definitions
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Russell King <linux@armlinux.org.uk>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	kernel test robot <lkp@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 9, 2022 at 9:11 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Fix warnings with clang like:
>
> arch/arm/mach-spear/spear6xx.c:365:13: warning: no previous prototype for function 'spear6xx_map_io' [-Wmissing-prototypes]
>
> by making few definitions static.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
> Rebased on v6.0.
>
>  arch/arm/mach-spear/spear6xx.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/mach-spear/spear6xx.c b/arch/arm/mach-spear/spear6xx.c
> index 58183493e06d..7a5fff134872 100644
> --- a/arch/arm/mach-spear/spear6xx.c
> +++ b/arch/arm/mach-spear/spear6xx.c
> @@ -339,7 +339,7 @@ static struct pl08x_platform_data spear6xx_pl080_plat_data = {
>   * 0xD0000000          0xFD000000
>   * 0xFC000000          0xFC000000
>   */
> -struct map_desc spear6xx_io_desc[] __initdata = {
> +static struct map_desc spear6xx_io_desc[] __initdata = {
>         {
>                 .virtual        = (unsigned long)VA_SPEAR6XX_ML_CPU_BASE,
>                 .pfn            = __phys_to_pfn(SPEAR_ICM3_ML1_2_BASE),
> @@ -359,12 +359,12 @@ struct map_desc spear6xx_io_desc[] __initdata = {
>  };
>
>  /* This will create static memory mapping for selected devices */
> -void __init spear6xx_map_io(void)
> +static void __init spear6xx_map_io(void)
>  {
>         iotable_init(spear6xx_io_desc, ARRAY_SIZE(spear6xx_io_desc));
>  }
>
> -void __init spear6xx_timer_init(void)
> +static void __init spear6xx_timer_init(void)
>  {
>         char pclk_name[] = "pll3_clk";
>         struct clk *gpt_clk, *pclk;
> @@ -394,7 +394,7 @@ void __init spear6xx_timer_init(void)
>  }
>
>  /* Add auxdata to pass platform data */
> -struct of_dev_auxdata spear6xx_auxdata_lookup[] __initdata = {
> +static struct of_dev_auxdata spear6xx_auxdata_lookup[] __initdata = {
>         OF_DEV_AUXDATA("arm,pl080", SPEAR_ICM3_DMA_BASE, NULL,
>                         &spear6xx_pl080_plat_data),
>         {}
> --
> 2.31.1.272.g89b43f80a514
>


-- 
Thanks,
~Nick Desaulniers
