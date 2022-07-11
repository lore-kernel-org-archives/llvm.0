Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFFC4420
	for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 17:08:00 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id cw12so807828qvb.12
        for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 10:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wWcvYvacvD8N8pcx60t/vSUQTr5iBONKiVXdnTKPElY=;
        b=hOeLS2jTOqNMJXllVkjPxyOh9QyOBElTgjCJz0L+yC+3W9UQDw8rHggLAS/L/KpdEJ
         34DVd5BpJCtkVJI8v++Lf7DyZRgtfa06CQNG+M4EwmoXt32j5BkWrm5gIeCav30Zn6Qa
         6zYxBqPJdX04We78iNWuy2RsaNUkrufURHdUt+o0XvMwJqsIE0MxTf8ljHFHQ702zo3f
         KLdpFnSxgXyLN5T9kEhmOBiIzmtG4XKYK5TciFi3fK0ObdQviFwC61EmtiyhoZG7yLXP
         1ZzYXfpsNZTWOExzoBfT4At3hlklIPtsMr3kYfgsUSgi5jsQdkEB5O2eujgzjeaMN7n+
         BNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wWcvYvacvD8N8pcx60t/vSUQTr5iBONKiVXdnTKPElY=;
        b=J5C0CxhQj2itzUf6AEP4e4N1w4/08AqyLqFQc6z7VHVFJ5ypPBqwgFqEAwosegcV4o
         lw/92D+zmfiohnZhpsw2W2AIf6mK76JqfqaCWfkX8SDNYC8gsRG+telx/tWmr9Tlbd1r
         Y8ltVbo5Ae5OyXZv9NodIexGJl+hpM8AzpH/4yw4o2dsud5EzZFP5vKgvowPsfWw0bQE
         98bkqJ0hlaZ6OB4fu7cO20vkJ9zSFS/LME8VfQwHf2Zx9nYoSASW1GRaE+2v7ix6Rd/K
         UztbX95E3s3TQiFMxubsOZTkTgj38G+5AWdSsfCz/F0dcuAZ6+pNEJByotVatYRpdvff
         godQ==
X-Gm-Message-State: AJIora/AdTKJCj/sAKzzJckagUeZEYHTAuRmdNZ2DcAAnHokGPeDhKul
	ssx6JeN4jRzrktF0HUumF7LhmNzsxztfGy6TJ5BHyA==
X-Google-Smtp-Source: AGRyM1tuHzXpJtx7yTkOQUhvNHpR+JwZ1+CpX+7GCj/1c16E9RRHBJO8NTioymnSxwYptVpdWinnRIR491eHxiEZsXA=
X-Received: by 2002:a05:6214:d03:b0:473:7764:2ab with SMTP id
 3-20020a0562140d0300b00473776402abmr2519187qvh.119.1657559279665; Mon, 11 Jul
 2022 10:07:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220711163021.152578-1-nathan@kernel.org>
In-Reply-To: <20220711163021.152578-1-nathan@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Jul 2022 20:07:48 +0300
Message-ID: <CAA8EJpoDe5-_jd-zDRsPV06QVah1266YT2fBSWYT7GSTR2K9wA@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: gpucc-sm8350: Fix "initializer element is not
 constant" error
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@somainline.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Robert Foss <robert.foss@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Jul 2022 at 19:30, Nathan Chancellor <nathan@kernel.org> wrote:
>
> When building with clang or GCC older than 8, errors along the following
> lines occur:
>
>   drivers/clk/qcom/gpucc-sm8350.c:111:2: error: initializer element is not a compile-time constant
>           gpu_cc_parent,
>           ^~~~~~~~~~~~~
>   drivers/clk/qcom/gpucc-sm8350.c:126:2: error: initializer element is not a compile-time constant
>           gpu_cc_parent,
>           ^~~~~~~~~~~~~
>   2 errors generated.
>
> The C standard allows an implementation to accept other forms of
> constant expressions, which GCC 8+ has chosen to do, but it is not
> required. To fix this error with clang and older supported versions of
> GCC, use a macro so that the expression can be used in a designated
> initializer.
>
> Fixes: 160758b05ab1 ("clk: qcom: add support for SM8350 GPUCC")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1660
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/clk/qcom/gpucc-sm8350.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/qcom/gpucc-sm8350.c b/drivers/clk/qcom/gpucc-sm8350.c
> index d13fa813d190..9390723f6e40 100644
> --- a/drivers/clk/qcom/gpucc-sm8350.c
> +++ b/drivers/clk/qcom/gpucc-sm8350.c
> @@ -51,9 +51,9 @@ static const struct alpha_pll_config gpu_cc_pll0_config = {
>         .user_ctl_hi1_val = 0x00000000,
>  };
>
> -static const struct clk_parent_data gpu_cc_parent = {
> -       .fw_name = "bi_tcxo",
> -};
> +#define GPU_CC_PARENT_INIT { .fw_name = "bi_txco", }

Please inline this macro. It adds no additional value in my opinion

> +
> +static const struct clk_parent_data gpu_cc_parent = GPU_CC_PARENT_INIT;
>
>  static struct clk_alpha_pll gpu_cc_pll0 = {
>         .offset = 0x0,
> @@ -108,7 +108,7 @@ static const struct parent_map gpu_cc_parent_map_0[] = {
>  };
>
>  static const struct clk_parent_data gpu_cc_parent_data_0[] = {
> -       gpu_cc_parent,
> +       GPU_CC_PARENT_INIT,
>         { .hw = &gpu_cc_pll0.clkr.hw },
>         { .hw = &gpu_cc_pll1.clkr.hw },
>         { .fw_name = "gcc_gpu_gpll0_clk_src" },
> @@ -123,7 +123,7 @@ static const struct parent_map gpu_cc_parent_map_1[] = {
>  };
>
>  static const struct clk_parent_data gpu_cc_parent_data_1[] = {
> -       gpu_cc_parent,
> +       GPU_CC_PARENT_INIT,
>         { .hw = &gpu_cc_pll1.clkr.hw },
>         { .fw_name = "gcc_gpu_gpll0_clk_src" },
>         { .fw_name = "gcc_gpu_gpll0_div_clk_src" },
>
> base-commit: 0dd8e16bfbc003b009f843e75fae4046daa08fe9
> --
> 2.37.0
>


-- 
With best wishes
Dmitry
